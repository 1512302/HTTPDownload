//
//  DownloadFactory.h
//  DownloadManager
//
//  Created by CPU11829 on 8/3/18.
//  Copyright © 2018 CPU11829. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DownloadObjectModel.h"
#import "DownloadObjectDelegate.h"

@interface DownloadFactory : NSObject

@property (weak, nonatomic) id<DownloadObjectDelegate> delegate;

- (DownloadObjectModel*)downloadObjectWithURLString:(NSString *)URLString;

- (void)setProgressDidUpdateBlock:(void(^)(NSInteger currentSize, NSInteger totalSize))block;

- (void)setDownloadFinishBlock:(void(^)(NSString* filePath))block;

- (int)numberTaskIsDownloading;

@end
