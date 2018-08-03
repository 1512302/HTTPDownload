//
//  DownloadObjectModel.h
//  HTTPDownload
//
//  Created by CPU11367 on 7/31/18.
//  Copyright © 2018 CPU11367. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    DowloadPriorityHight,
    DowloadPriorityMedium,
    DowloadPriorityLow
} DowloadPriority;

@protocol DownloadObjectDelegate

@optional

/**
 Được gọi mỗi khi tiến dộ cập nhật

 @param currentSize dung lượng đã tải (byte)
 @param totalSize dung lượng tổng (byte)
 */
- (void)progressDidUpdate:(NSUInteger)currentSize total:(NSUInteger)totalSize;

/**
 Được gọi khi tải hoàn tất

 @param filePath đường dẫn đến vị trí lưu
 */
- (void)downloadFinish:(NSString *)filePath;

@end

@interface DownloadObjectModel : NSObject

@property (retain, nonatomic) id<DownloadObjectDelegate> delegate;

- (void)pause;

- (void)resume;

- (void)cancel;

- (void)setBackgroundDownload:(BOOL)agree;

- (void)updatePriority:(DowloadPriority)priority;

@end
