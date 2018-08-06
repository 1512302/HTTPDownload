//
//  AFSession.h
//  DownloadCore
//
//  Created by CPU11829 on 8/6/18.
//  Copyright © 2018 CPU11829. All rights reserved.
//

#import "DownloadFactory.h"
#import <AFNetworking.h>
#import "DownloadTask.h"

@interface AFSession : DownloadFactory

@property (nonatomic) AFHTTPSessionManager* managerTaskDownload;

@property (nonatomic) NSURLSessionConfiguration* configuration;

@end
