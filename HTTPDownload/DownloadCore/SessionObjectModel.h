//
//  SessionObjectModel.h
//  Download
//
//  Created by CPU11829 on 8/2/18.
//  Copyright © 2018 CPU11829. All rights reserved.
//

#ifndef SessionObjectModel_h
#define SessionObjectModel_h
#import "DownloadTaskModel.h"

@interface SessionObjectModel: NSObject

- (DownloadTaskModel *)downloadTaskWithURLString:(NSString *)URLString;

@end


#endif /* SessionObjectModel_h */
