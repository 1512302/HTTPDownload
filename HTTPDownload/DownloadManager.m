//
//  DownloadManager.m
//  DownloadCore
//
//  Created by CPU11829 on 8/6/18.
//  Copyright © 2018 CPU11829. All rights reserved.
//

#import "DownloadManager.h"
#import "AFSession.h"

@implementation DownloadManager

- (instancetype)init {
    self = [super init];
    if (self) {
        _factory = [[AFSession alloc] init];
        _downloads = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (BOOL)checkURL:(NSString *)URLString {
    return true;
}

- (void)createDownloadWithURLString:(NSString *)URLString completion:(void (^)(DownloadObjectModel *, NSError *))completion {
    if (completion) {
        if (!_factory) {
            completion(nil, [NSError errorWithDomain:@"DownloadError" code:FactoryNil userInfo:nil]);
        }
        else if (!URLString) {
            completion(nil, [NSError errorWithDomain:@"DownloadError" code:URLNil userInfo:nil]);
        }
        else if (![self checkURL:URLString]) {
            completion(nil, [NSError errorWithDomain:@"DownloadError" code:URLError userInfo:@{@"urlstring": URLString}]);
        }
        else {
            DownloadObjectModel* downloadObject;
            @synchronized (_downloads) {
                downloadObject = [_downloads objectForKey:URLString];
                if (!downloadObject) {
                    downloadObject = [_factory createDownloadWithURLString:URLString];
                }
                else if (![downloadObject isKindOfClass:[DownloadObjectModel class]]) {
                    downloadObject = [_factory createDownloadWithURLString:URLString];
                }
                if (downloadObject) {
                    completion(downloadObject, nil);
                }
                else {
                    completion(nil, [NSError errorWithDomain:@"DownloadError" code:FactoryError userInfo:nil]);
                }
            }
        }
    }
}

@end
