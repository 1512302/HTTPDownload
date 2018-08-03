//
//  DownloadTask.m
//  DownloadManager
//
//  Created by CPU11829 on 8/3/18.
//  Copyright © 2018 CPU11829. All rights reserved.
//

#import "DownloadTask.h"

@implementation DownloadTask

- (instancetype)initWithTask:(NSURLSessionDownloadTask *)task {
    self = [super init];
    if (self) {
        _downloadTask = [task copy];
    }
    return self;
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

- (void)setBackgroundDownload:(BOOL)agree {
    
}

- (void)updatePriority:(DowloadPriority)priority {

}

@end
