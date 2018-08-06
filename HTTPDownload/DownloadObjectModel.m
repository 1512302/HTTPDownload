//
//  DownloadObjectModel.m
//  DownloadCore
//
//  Created by CPU11829 on 8/6/18.
//  Copyright © 2018 CPU11829. All rights reserved.
//

#import "DownloadObjectModel.h"

@implementation DownloadObjectModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _completionBlocks = [[NSMutableArray alloc] init];
        _updateBlocks = [[NSMutableArray alloc] init];
        _isDownloaded = [[NSNumber alloc] initWithBool:false];
    }
    return self;
}

- (void)addCompletionBlock:(void(^)(NSURL* fileURL))block {
    @synchronized (_isDownloaded) {
        __weak typeof(self) weakSelf = self;
        if ([_isDownloaded boolValue]) {
            dispatch_async(_delegateQueue, ^{
                block(weakSelf.fileURL);
            });
        }
        else {
            [_completionBlocks addObject:block];
        }
    }
}

- (void)addUpdateBlock:(void (^)(NSNumber*, NSNumber*))block {
    @synchronized (_isDownloaded) {
        if (!_isDownloaded.boolValue) {
            [_updateBlocks addObject:block];
        }
    }
}

- (void)handleCompletion:(NSNotification *)notification {
    if (notification) {
        @synchronized (_isDownloaded) {
            _isDownloaded = [[NSNumber alloc] initWithBool:true];
        }
        NSURL* url = [notification.userInfo objectForKey:@"url"];
        if (url) {
            if ([url isKindOfClass:[NSURL class]]) {
                _fileURL = [url copy];
                __weak typeof(self) weakSelf = self;
                for (void(^block)(NSURL*) in _completionBlocks) {
                    dispatch_async(_delegateQueue, ^{
                        block(weakSelf.fileURL);
                    });
                }
            }
        }
    }
}

- (void)handleUpdate:(NSNotification *)notification {
    if (notification) {
        NSNumber* currentSize = [notification.userInfo objectForKey:@"totalBytesWritten"];
        NSNumber* totalSize = [notification.userInfo objectForKey:@"totalBytesExpectedToWrite"];
        if (currentSize && totalSize) {
            if ([currentSize isKindOfClass:[NSNumber class]] && [totalSize isKindOfClass:[NSNumber class]]) {
                for (void(^block)(NSNumber*, NSNumber*) in _updateBlocks) {
                    dispatch_async(_delegateQueue, ^{
                        block(currentSize, totalSize);
                    });
                }
            }
        }
    }
}

@end
