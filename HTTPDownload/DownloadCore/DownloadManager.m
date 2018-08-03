//
//  DownloadManager.m
//  DownloadManager
//
//  Created by CPU11829 on 8/3/18.
//  Copyright © 2018 CPU11829. All rights reserved.
//

#import "DownloadManager.h"
#import "AFSession.h"

@implementation DownloadManager

- (instancetype)init {
    self = [super init];
    if (self) {
        _factory = [[AFSession alloc] init];
    }
    return self;
}

- (BOOL)checkURL:(NSString *)url {
    return true;
}

- (void)downloadWithURLString:(NSString *)url completion:(void (^)(DownloadObjectModel *, NSError *))completion {
    if (completion) {
        if (!_factory) {
            completion(nil, [NSError errorWithDomain:@"factoryError" code:FactoryNil userInfo:nil]);
        }
        else if (!url) {
            completion(nil, [NSError errorWithDomain:@"downloadError" code:URLNil userInfo:nil]);
        }
        else if (![self checkURL:url]) {
            completion(nil, [NSError errorWithDomain:@"downloadError" code:URLError userInfo:@{@"url": url}]);
        }
        else {
            
            
            
            
            //
            DownloadObjectModel* downloadObject = [_factory downloadObjectWithURLString:url];
            if (!downloadObject) {
                completion(nil, [NSError errorWithDomain:@"factoryError" code:FactoryError userInfo:nil]);
            }
            else {
                completion(downloadObject, nil);
                [downloadObject resume];
            }
        }
    }
}

- (void)setProgressDidUpdateBlock:(void(^)(NSInteger currentSize, NSInteger totalSize))block {
    if (_factory) {
        [_factory setProgressDidUpdateBlock:block];
    }
}

- (void)setDownloadFinishBlock:(void(^)(NSString* filePath))block {
    if (_factory) {
        [_factory setDownloadFinishBlock:block];
    }
}

@end
