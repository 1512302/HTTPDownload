//
//  DownloadObjectModel.h
//  HTTPDownload
//
//  Created by CPU11367 on 7/31/18.
//  Copyright © 2018 CPU11367. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DownloadObjectModel : NSObject

@property (readonly, nonatomic, strong) NSString *url;

@property (readonly, nonatomic, strong) NSString *title;

- (Float32)progress;

@end
