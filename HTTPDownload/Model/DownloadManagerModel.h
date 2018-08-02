//
//  DownloadManagerModel.h
//  HTTPDownload
//
//  Created by CPU11367 on 7/31/18.
//  Copyright © 2018 CPU11367. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DownloadObjectModel.h"

typedef enum {
    DowloadPriorityHight,
    DowloadPriorityMedium,
    DowloadPriorityLow
} DowloadPriority;

@interface DownloadManagerModel : NSObject

- (BOOL)checkURL:(NSString *)url;

- (void)downloadWithURL:(NSString *)url completion:(void (^)(DownloadObjectModel *downloadObject, NSError *error))completionBlock;
@end
