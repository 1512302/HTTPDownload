//
//  DownloadTableView.m
//  HTTPDownload
//
//  Created by CPU11367 on 7/31/18.
//  Copyright © 2018 CPU11367. All rights reserved.
//

#import "DownloadTableView.h"
#import "TableViewCellModel.h"

@implementation DownloadTableView

@synthesize cellObjects = _cellObjects;

- (void)setCellObjects:(NSMutableArray *)cellObjects {
    _cellObjects = cellObjects;
    
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.dataSource = self;
    self.delegate = self;
    
    if (!_cellObjects || _cellObjects.count == 0) {
        if (!_cellObjects) {
            _cellObjects = [NSMutableArray new];
        }
        InfomationTableViewObject *infoObject = [[InfomationTableViewObject alloc] initWithMessange:@"History download empty"];
        [_cellObjects addObject:infoObject];
        _error = [NSError errorWithDomain:DownloadErrorDomain code:DownloadErrorCodeEmpty userInfo:nil];
    }
   
    [self reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellObjectModel *cellObject = _cellObjects[indexPath.row];
    Class cellClass = [cellObject cellClass];
    if ([cellClass isSubclassOfClass:[TableViewCellModel class]]) {
        TableViewCellModel *cell = [cellClass tableView:tableView cellForRowAtIndexPath:indexPath];
        if (cell) {
            [cell shouldUpdateWithObject:cellObject];
            return cell;
        }
    }
    return [UITableViewCell new];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_cellObjects count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellObjectModel *cellObject = _cellObjects[indexPath.row];
    return [cellObject tableView:tableView heightForRowAtIndexPath:indexPath];
}

- (void)addCell:(CellObjectModel *)cellObject {
    if (_error) {
        if (_error.code == DownloadErrorCodeEmpty) {
            _error = nil;
            [_cellObjects removeAllObjects];
        }
        [self deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationMiddle];
    }
    
    if (cellObject) {
        [_cellObjects insertObject:cellObject atIndex:0];
    }
    [self insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationMiddle];
    
    
}

@end
