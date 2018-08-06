//
//  DownloadFactory.h
//  DownloadCore
//
//  Created by CPU11829 on 8/6/18.
//  Copyright © 2018 CPU11829. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DownloadObjectModel.h"

@interface DownloadFactory : NSObject

- (DownloadObjectModel*)createDownloadWithURLString:(NSString*)URLString;

- (void)triggerProgressDidUpdate;

- (void)triggerProgressDidFinish;

@end
