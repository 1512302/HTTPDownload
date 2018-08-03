//
//  DownloadManager.h
//  DownloadManager
//
//  Created by CPU11829 on 8/3/18.
//  Copyright © 2018 CPU11829. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DownloadObjectModel.h"
#import "DownloadFactory.h"

typedef enum {
    URLNil,
    URLError,
} URLErrorCode;

typedef enum {
    FactoryNil,
    FactoryError
} FactoryErrorCode;

@interface DownloadManager : NSObject

@property (nonatomic) DownloadFactory* factory;

- (BOOL)checkURL:(NSString*)url;

- (void)downloadWithURLString:(NSString*)url completion:(void(^)(DownloadObjectModel* downloadObject, NSError* error))completion;

- (void)setProgressDidUpdateBlock:(void(^)(NSInteger currentSize, NSInteger totalSize))block;

- (void)setDownloadFinishBlock:(void(^)(NSString* filePath))block;

@end
