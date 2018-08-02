//
//  AFDownloadManager.m
//  HTTPDownload
//
//  Created by CPU11367 on 8/2/18.
//  Copyright © 2018 CPU11367. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFDownloadManager.h"
#import "AFSessionDownloadObjectModel.h"

@implementation AFDownloadManager

- (BOOL)checkURL:(NSString *)url {
    return true;
}

- (void)downloadWithURL:(NSString *)url completion:(void (^)(DownloadObjectModel *downloadObject, NSError *error))completionBlock {
    if (completionBlock) {
        if (!url) {
            completionBlock(nil, [NSError errorWithDomain:@"downloadError" code:URLNil userInfo:nil]);
        }
        else if (![self checkURL:url]) {
            completionBlock(nil, [NSError errorWithDomain:@"downloadError" code:URLUndefined userInfo:@{@"url": url}]);
        }
        else {
            AFSessionDownloadObjectModel* session = [[AFSessionDownloadObjectModel alloc] init];
            DownloadTaskModel* downloadTaskModel = [session downloadTaskWithURLString:url];
            completionBlock(downloadTaskModel, nil);
            [downloadTaskModel resume];
        }
    }
}

@end
