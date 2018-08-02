//
//  DownloadTableViewObject.m
//  HTTPDownload
//
//  Created by CPU11367 on 7/31/18.
//  Copyright © 2018 CPU11367. All rights reserved.
//

#import "DownloadTableViewObject.h"
#import "DownloadTableViewCell.h"

@interface DownloadTableViewObject()



@end

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

- (void)setTitle:(NSString *)title {
    _title = title;
    if (_cell) {
        __weak __typeof(self) weakSelf = self;
        dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.cell.titleLabel.text = title;
        });
    }
}

- (void)setProgress:(float)progress {
    _progress = progress;
    if (_cell) {
        __weak __typeof(self) weakSelf = self;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.cell.progressView.progress = progress;
        });
        
    }
}

- (void)setProgressString:(NSString *)progressString {
    _progressString = progressString;
    if (_cell) {
        __weak __typeof(self) weakSelf = self;
        dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.cell.progressLabel.text = progressString;
        });
        
    }
}

- (void)progressDidUpdate:(NSUInteger)currentSize total:(NSUInteger)totalSize {
    self.progressString = [NSString stringWithFormat:@"%ld/%ld", currentSize, totalSize];
    self.progress = currentSize / totalSize;
}

- (void)downloadFinish:(NSString *)filePath {
    
}

@end
