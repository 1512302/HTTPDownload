//
//  AFSessionDownloadObjectModel.m
//  Download
//
//  Created by CPU11829 on 8/2/18.
//  Copyright © 2018 CPU11829. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFSessionDownloadObjectModel.h"

@implementation AFSessionDownloadObjectModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _managerTaskDownload = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:self.configuration];
        _managerTaskDownload.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    return self;
}

- (DownloadTaskModel*)downloadTaskWithURLString:(NSString *)URLString {
    DownloadTaskModel* downloadTaskModel;
    if (_managerTaskDownload && URLString) {
        NSURLSessionDownloadTask* downloadTask;
        NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:URLString]];
        __weak typeof(self) weakSelf = self;
        downloadTask = [_managerTaskDownload downloadTaskWithRequest:request progress:nil destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
            NSURL* documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
            return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
        } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
            [weakSelf.delegate downloadFinish:filePath.absoluteString];
            NSLog(@"filePath: %@", filePath);
        }];
        
        downloadTaskModel = [[DownloadTaskModel alloc] initWithTask:downloadTask];
        [_managerTaskDownload setDownloadTaskDidWriteDataBlock:^(NSURLSession * _Nonnull session, NSURLSessionDownloadTask * _Nonnull downloadTask, int64_t bytesWritten, int64_t totalBytesWritten, int64_t totalBytesExpectedToWrite) {
            [downloadTaskModel.delegate progressDidUpdate:bytesWritten total:totalBytesWritten];
        }];
    }
    return downloadTaskModel;
}

@end
