//
//  DownloadTask.m
//  DownloadCore
//
//  Created by CPU11829 on 8/6/18.
//  Copyright © 2018 CPU11829. All rights reserved.
//

#import "DownloadTask.h"

@implementation DownloadTask

- (instancetype)init
{
    self = [super init];
    if (self) {
        [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(handleUpdate:) name:@"ProgressDidUpdate" object:_downloadTask];
        [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(handleCompletion:) name:@"ProgressDidFinish" object:_downloadTask];
    }
    return self;
}

- (instancetype)initWithTask:(NSURLSessionDownloadTask *)task {
    self = [super init];
    if (self) {
        _downloadTask = [task copy];
        self.delegateQueue = dispatch_queue_create([task.progress.fileURL.absoluteString cStringUsingEncoding:NSUTF8StringEncoding], DISPATCH_QUEUE_CONCURRENT);
        [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(handleUpdate:) name:@"ProgressDidUpdate" object:_downloadTask];
        [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(handleCompletion:) name:@"ProgressDidFinish" object:_downloadTask];
    }
    return self;
}

- (void)setDownloadTask:(NSURLSessionDownloadTask *)task {
    _downloadTask = [task copy];
    self.delegateQueue = dispatch_queue_create([task.progress.fileURL.absoluteString cStringUsingEncoding:NSUTF8StringEncoding], DISPATCH_QUEUE_CONCURRENT);
}

- (void)pause {
    [_downloadTask suspend];
}

- (void)resume {
    
    [_downloadTask resume];
}

- (void)cancel {
    [_downloadTask cancel];
}

- (void)setResumeDataWhenAppTerminate {
    __weak typeof(self) weakSelf = self;
    [_downloadTask cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
        [NSUserDefaults.standardUserDefaults setObject:resumeData forKey:weakSelf.fileURL.absoluteString];
    }];
}

@end

