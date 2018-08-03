//
//  PriorityQueue.h
//  HTTPDownload
//
//  Created by CPU11360 on 8/2/18.
//  Copyright © 2018 CPU11367. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface PriorityQueue : NSObject

- (void)push:(id)object withPriority:(int)priority;

- (id)pop;

- (NSInteger)count;

- (void)setPriorityForObject:(id)object withPriority:(int)priority;

- (bool)isContainObject:(id)object;

@end
