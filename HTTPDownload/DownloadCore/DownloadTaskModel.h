//
//  DownloadTaskModel.h
//  Download
//
//  Created by CPU11829 on 8/2/18.
//  Copyright © 2018 CPU11829. All rights reserved.
//

#ifndef DownloadTaskModel_h
#define DownloadTaskModel_h
#import "DownloadObjectModel.h"

@interface DownloadTaskModel: DownloadObjectModel

@property (nonatomic) NSURLSessionDownloadTask* task;

- (instancetype)initWithTask:(NSURLSessionDownloadTask*) task;

@end

#endif /* DownloadTaskModel_h */
