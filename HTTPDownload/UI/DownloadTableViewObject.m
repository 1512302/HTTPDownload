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

@property (atomic) dispatch_queue_t serialQueue;

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
        _serialQueue = dispatch_queue_create("download.ui", DISPATCH_QUEUE_SERIAL);
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
        //dispatch_sync(_serialQueue, ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.cell.titleLabel.text = title;
            });
        //});
    }
}

- (void)setProgress:(float)progress {
    _progress = progress;
    if (_cell) {
        __weak __typeof(self) weakSelf = self;
        //dispatch_sync(_serialQueue, ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.cell.progressView.progress = progress;
            });
        //});
    }
}

- (void)setProgressString:(NSString *)progressString {
    _progressString = progressString;
    if (_cell) {
        __weak __typeof(self) weakSelf = self;
        //dispatch_sync(_serialQueue, ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.cell.progressLabel.text = progressString;
            });
        //});
    }
}

- (void)progressDidUpdate:(NSUInteger)currentSize total:(NSUInteger)totalSize {
    //if (totalSize * _progress < currentSize) {
        self.progressString = [NSString stringWithFormat:@"%ld/%ld", currentSize, totalSize];
        self.	progress = currentSize / totalSize;
    //}
    
    
}

- (void)downloadFinish:(NSString *)filePath {
    
}

@end
