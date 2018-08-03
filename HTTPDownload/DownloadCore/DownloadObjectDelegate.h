//
//  DownloadObjectDelegate.h
//  DownloadManager
//
//  Created by CPU11829 on 8/3/18.
//  Copyright © 2018 CPU11829. All rights reserved.
//

#ifndef DownloadObjectDelegate_h
#define DownloadObjectDelegate_h

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

#endif /* DownloadObjectDelegate_h */
