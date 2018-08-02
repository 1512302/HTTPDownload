//
//  DownloadTaskModel.m
//  Download
//
//  Created by CPU11829 on 8/2/18.
//  Copyright © 2018 CPU11829. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DownloadTaskModel.h"

@implementation DownloadTaskModel

- (instancetype)initWithTask:(NSURLSessionDownloadTask *)task {
    self = [super init];
    if (self) {
        _task = [task copy];
    }
    return self;
}

- (void)pause {
    [_task suspend];
}

- (void)resume {
    [_task resume];
}

- (void)cancel {
    [_task cancel];
}

- (void)setBackgroundDownload:(BOOL)agree {
    
}

- (void)updatePriority:(DowloadPriority)priority {
    
}

//- (void)setDelegate:(id<DownloadObjectDelegate>)delegate {
//    [super setDelegate:delegate];
////    self.task.de
//}

@end
