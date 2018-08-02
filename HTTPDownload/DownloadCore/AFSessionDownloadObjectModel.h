//
//  AFSessionDownloadObjectModel.h
//  Download
//
//  Created by CPU11829 on 8/2/18.
//  Copyright © 2018 CPU11829. All rights reserved.
//

#ifndef AFSessionDownloadObjectModel_h
#define AFSessionDownloadObjectModel_h
#import "SessionObjectModel.h"
#import "AFNetworking.h"

@interface AFSessionDownloadObjectModel: SessionObjectModel

@property (nonatomic) AFHTTPSessionManager* managerTaskDownload;
@property (nonatomic) NSURLSessionConfiguration* configuration;
@property (weak, nonatomic) id<DownloadObjectDelegate> delegate;

@end

#endif /* AFSessionDownloadObjectModel_h */
