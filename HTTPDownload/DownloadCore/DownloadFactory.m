//
//  DownloadFactory.m
//  DownloadManager
//
//  Created by CPU11829 on 8/3/18.
//  Copyright © 2018 CPU11829. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DownloadFactory.h"

@implementation DownloadFactory

- (DownloadObjectModel*)downloadObjectWithURLString:(NSString *)URLString {
    return nil;
}

- (void)setProgressDidUpdateBlock:(void(^)(NSInteger currentSize, NSInteger totalSize))block {
    
}

- (void)setDownloadFinishBlock:(void(^)(NSString* filePath))block {
    
}

@end
