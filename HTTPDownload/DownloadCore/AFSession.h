//
//  AFSession.h
//  DownloadManager
//
//  Created by CPU11829 on 8/3/18.
//  Copyright © 2018 CPU11829. All rights reserved.
//

#import "DownloadFactory.h"
#import "DownloadTask.h"
#import "AFNetworking.h"

@interface AFSession : DownloadFactory

@property (nonatomic) AFHTTPSessionManager* managerTaskDownload;
@property (nonatomic) NSURLSessionConfiguration* configuration;

@end
