//
//  AFSession.m
//  DownloadManager
//
//  Created by CPU11829 on 8/3/18.
//  Copyright © 2018 CPU11829. All rights reserved.
//

#import "AFSession.h"

@interface AFSession()

@end

@implementation AFSession

- (instancetype)init {
    self = [super init];
    if (self) {
        _configuration = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"download.backgroud"];
//        _configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _managerTaskDownload = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:self.configuration];
        _managerTaskDownload.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    return self;
}

- (DownloadObjectModel*)downloadObjectWithURLString:(NSString *)URLString {
    DownloadTask* _downloadTask = [DownloadTask new];
    if (_managerTaskDownload && URLString) {
        NSURLSessionDownloadTask* nativeDownloadTask;
        NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:URLString]];
        nativeDownloadTask = [_managerTaskDownload downloadTaskWithRequest:request progress:nil destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
            NSURL* documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
            return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
        } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
            [_downloadTask.delegate downloadFinish:filePath.absoluteString];
            NSLog(@"filePath: %@", filePath);
        }];
        _downloadTask.downloadTask = nativeDownloadTask;
        [_managerTaskDownload setDownloadTaskDidWriteDataBlock:^(NSURLSession * _Nonnull session, NSURLSessionDownloadTask * _Nonnull downloadTask, int64_t bytesWritten, int64_t totalBytesWritten, int64_t totalBytesExpectedToWrite) {
            [_downloadTask.delegate progressDidUpdate:totalBytesWritten total:totalBytesExpectedToWrite];
        }];
    }
    return _downloadTask;
}

- (void)setProgressDidUpdateBlock:(void(^)(NSInteger currentSize, NSInteger totalSize))block {
    if (_managerTaskDownload) {
        [_managerTaskDownload setDownloadTaskDidWriteDataBlock:^(NSURLSession * _Nonnull session, NSURLSessionDownloadTask * _Nonnull downloadTask, int64_t bytesWritten, int64_t totalBytesWritten, int64_t totalBytesExpectedToWrite) {
            block(totalBytesWritten, totalBytesExpectedToWrite);
        }];
    }
}

- (void)setDownloadFinishBlock:(void(^)(NSString* filePath))block {
    if (_managerTaskDownload) {
        [_managerTaskDownload setDownloadTaskDidFinishDownloadingBlock:^NSURL * _Nullable(NSURLSession * _Nonnull session, NSURLSessionDownloadTask * _Nonnull downloadTask, NSURL * _Nonnull location) {
            block(location.absoluteString);
            return nil;
        }];
    }
}

@end
