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
        _progress = 0;
        _state = DownloadStateDownloading;
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

    self.state = DownloadStateDownloading;
    if (totalSize > 0) {	
        self.progressString = [NSString stringWithFormat:@"%ld/%ld B", currentSize, totalSize];
        self.progress = (float)currentSize / totalSize;
    } else {
        self.progressString = [NSString stringWithFormat:@"%ld B", currentSize];
    }
    

}

- (void)setState:(DownloadState)state {
    if (_state != state) {
        _state = state;
        switch (state) {
            case DownloadStatePause:
                self.progressString = @"Pause";
                [_downloadManager pause];
                break;
            case DownloadStateDownloading:
                [_downloadManager resume];
                break;
            case DownloadStateComplete:
                self.progress = 1.0;
                self.progressString = @"Dowloaded";
                break;
            case DownloadStateError:
                self.progressString = @"Error!";
                break;
            case DownloadStatePending:
                self.progressString = @"Pending...";
                break;
            default:
                break;
        }
        [self backgroudIfNeeded];
    }
}

- (void)backgroudIfNeeded {
    if (_cell) {
        __weak __typeof(self) weakSelf = self;
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.cell updateState];
        });
    }
}

- (UIColor *)getColorBackgroud {
    UIColor *backgroudColor;
    switch (_state) {
        case DownloadStateComplete:
            backgroudColor = [DownloadTableViewObject successColor];
            break;
        case DownloadStateError:
            backgroudColor = [DownloadTableViewObject errorColor];
            break;
        case DownloadStatePending:
            backgroudColor = [DownloadTableViewObject pendingColor];
            break;
        case DownloadStatePause:
            backgroudColor = [DownloadTableViewObject pauseColor];
            break;
        default:
            backgroudColor = [DownloadTableViewObject normalColor];
            break;
    }
    return backgroudColor;
}

- (void)downloadFinish:(NSString *)filePath {
    if (filePath) {
        self.state = DownloadStateComplete;
    } else {
        self.state = DownloadStateError;
    }
}

- (void)pause {
    self.state = DownloadStatePause;
}

- (void)resume {
    self.state = DownloadStateDownloading;
}

- (void)cancel {
    [_downloadManager cancel];
}

- (void)upPriority {
    
}

- (void)downPriority {
    
}

# pragma constant

+ (UIColor *)successColor {
    static UIColor *successColor;
    static dispatch_once_t onceToken1;
    dispatch_once(&onceToken1, ^{
        CGFloat red = 138.0 / 255;
        CGFloat green = 238.0 / 255;
        CGFloat blue = 157.0 / 255;
        successColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    });
    return successColor;
    
}

+ (UIColor *)errorColor {
    static UIColor *errorColor;
    static dispatch_once_t onceToken2;
    dispatch_once(&onceToken2, ^{
        CGFloat red = 238.0 / 255;
        CGFloat green = 183.0 / 255;
        CGFloat blue = 183.0 / 255;
        errorColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    });
    return errorColor;
}

+ (UIColor *)normalColor {
    static UIColor *normalColor;
    static dispatch_once_t onceToken3;
    dispatch_once(&onceToken3, ^{
        CGFloat red = 138.0 / 255;
        CGFloat green = 238.0 / 255;
        CGFloat blue = 217.0 / 255;
        normalColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    });
    return normalColor;
}

+ (UIColor *)pendingColor {
    static UIColor *pendingColor;
    static dispatch_once_t onceToken4;
    dispatch_once(&onceToken4, ^{
        CGFloat red = 238.0 / 255;
        CGFloat green = 232.0 / 255;
        CGFloat blue = 138.0 / 255;
        pendingColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    });
    return pendingColor;
}

+ (UIColor *)pauseColor {
    static UIColor *pauseColor;
    static dispatch_once_t onceToken5;
    dispatch_once(&onceToken5, ^{
        CGFloat red = 138.0 / 255;
        CGFloat green = 168.0 / 255;
        CGFloat blue = 238.0 / 255;
        pauseColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    });
    return pauseColor;
}

@end


