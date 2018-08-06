//
//  DownloadManager.h
//  DownloadCore
//
//  Created by CPU11829 on 8/6/18.
//  Copyright © 2018 CPU11829. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DownloadFactory.h"

typedef enum {
    URLNil,
    URLError
} URLErrorCode;

typedef enum {
    FactoryNil,
    FactoryError
} FactoryErrorCode;

@interface DownloadManager : NSObject

@property (nonatomic) DownloadFactory* factory;

@property (nonatomic) NSMutableDictionary* downloads;

- (BOOL)checkURL:(NSString*)URLString;

- (void)createDownloadWithURLString:(NSString*)URLString completion:(void(^)(DownloadObjectModel* downloadObject, NSError* error))completion;

@end
