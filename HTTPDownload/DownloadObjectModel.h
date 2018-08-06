//
//  DownloadObjectModel.h
//  DownloadCore
//
//  Created by CPU11829 on 8/6/18.
//  Copyright © 2018 CPU11829. All rights reserved.
//

#import <Foundation/Foundation.h>
 
@interface DownloadObjectModel : NSObject

@property (nonatomic) NSNumber* isDownloaded;

@property (nonatomic) NSMutableArray* completionBlocks;

@property (nonatomic) NSMutableArray* updateBlocks;

@property (nonatomic) dispatch_queue_t delegateQueue;

@property (nonatomic) NSURL* fileURL;

- (void)pause;

- (void)resume;

- (void)cancel;

- (void)addCompletionBlock:(void(^)(NSURL* fileURL))block;

- (void)addUpdateBlock:(void (^)(NSNumber*, NSNumber*))block;

- (void)handleCompletion:(NSNotification*)notification;

- (void)handleUpdate:(NSNotification*)notification;

- (void)setResumeDataWhenAppTerminate;

@end
