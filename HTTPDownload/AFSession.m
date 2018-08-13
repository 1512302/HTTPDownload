//
//  AFSession.m
//  DownloadCore
//
//  Created by CPU11829 on 8/6/18.
//  Copyright © 2018 CPU11829. All rights reserved.
//

#import "AFSession.h"

@implementation AFSession

- (instancetype)init {
    self = [super init];
    if (self) {
        _configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _managerTaskDownload = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:_configuration];
        _managerTaskDownload.responseSerializer = [AFHTTPResponseSerializer serializer];
        [self triggerProgressDidUpdate];
        [self triggerProgressDidFinish];
    }
    return self;
}

- (DownloadObjectModel *)createDownloadWithURLString:(NSString *)URLString {
    DownloadTask* downloadTask = [DownloadTask new];
    if (_managerTaskDownload && URLString) {
        NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:URLString]];
        NSURLSessionDownloadTask* nativeDownloadTask = [_managerTaskDownload
                                                        downloadTaskWithRequest:request
                                                        progress:nil
                                                        destination:nil
                                                        completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
                                                            if (!filePath) {
                                                                filePath = [NSURL URLWithString:@""];
                                                            }
                                                            [NSNotificationCenter.defaultCenter postNotificationName:@"ProgressDidFinish"
                                                                                                              object:downloadTask
                                                                                                            userInfo:@{@"url": filePath}];
                                                        }];
        downloadTask.downloadTask = nativeDownloadTask;
    }
    return downloadTask;
}

- (void)triggerProgressDidFinish {
    if (_managerTaskDownload) {
        [_managerTaskDownload setDownloadTaskDidFinishDownloadingBlock:^NSURL * _Nullable(NSURLSession * _Nonnull session, NSURLSessionDownloadTask * _Nonnull downloadTask, NSURL * _Nonnull location) {
            NSURL* documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory
                                                                                  inDomain:NSUserDomainMask
                                                                         appropriateForURL:nil
                                                                                    create:false
                                                                                     error:nil];
            NSURL* url = [documentsDirectoryURL URLByAppendingPathComponent:downloadTask.progress.fileURL.absoluteString];
            [NSNotificationCenter.defaultCenter postNotificationName:@"ProgressDidFinish"
                                                              object:downloadTask
                                                            userInfo:@{@"url": url}];
            return url;
        }];
    }
}

- (void)triggerProgressDidUpdate {
    if (_managerTaskDownload) {
        [_managerTaskDownload setDownloadTaskDidWriteDataBlock:^(NSURLSession * _Nonnull session, NSURLSessionDownloadTask * _Nonnull downloadTask, int64_t bytesWritten, int64_t totalBytesWritten, int64_t totalBytesExpectedToWrite) {
            [NSNotificationCenter.defaultCenter postNotificationName:@"ProgressDidUpdate"
                                                              object:downloadTask
                                                            userInfo:@{@"totalBytesWritten": [NSNumber numberWithInteger:totalBytesWritten], @"totalBytesExpectedToWrite": [NSNumber numberWithInteger:totalBytesExpectedToWrite]}];
        }];
    }
}

@end
