//
//  DownloadObjectModel.h
//  DownloadManager
//
//  Created by CPU11829 on 8/3/18.
//  Copyright © 2018 CPU11829. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DownloadObjectDelegate.h"

typedef enum {
    DowloadPriorityHight,
    DowloadPriorityMedium,
    DowloadPriorityLow
} DowloadPriority;

@interface DownloadObjectModel : NSObject

@property (nonatomic) DowloadPriority priority;

@property (retain, nonatomic) id<DownloadObjectDelegate> delegate;

- (void)pause;

- (void)resume;

- (void)cancel;

- (void)updatePriority:(DowloadPriority)priority;


@end
