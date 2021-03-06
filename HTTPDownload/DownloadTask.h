//
//  DownloadTask.h
//  DownloadCore
//
//  Created by CPU11829 on 8/6/18.
//  Copyright © 2018 CPU11829. All rights reserved.
//

#import "DownloadObjectModel.h"

@interface DownloadTask : DownloadObjectModel

@property (nonatomic) NSURLSessionDownloadTask* downloadTask;

- (instancetype)initWithTask:(NSURLSessionDownloadTask*)task;

@end
