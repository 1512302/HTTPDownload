//
//  DownloadTableViewObject.m
//  HTTPDownload
//
//  Created by CPU11367 on 7/31/18.
//  Copyright © 2018 CPU11367. All rights reserved.
//

#import "DownloadTableViewObject.h"
#import "DownloadTableViewCell.h"

@implementation DownloadTableViewObject

- (Class)cellClass {
    return [DownloadTableViewCell class];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _title = @"Downloading...";
        _progressString = @"Downloading...";
        _progress = 0;
    }
    return self;
}

- (NSUInteger)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

@end
