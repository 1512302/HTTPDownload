//
//  PriorityQueue.m
//  HTTPDownload
//
//  Created by CPU11360 on 8/2/18.
//  Copyright © 2018 CPU11367. All rights reserved.
//

#import "PriorityQueue.h"
#import "ObjectForQueue.h"

@interface PriorityQueue()
@property (strong, nonatomic) NSMutableArray<ObjectForQueue *>* array;
@end

@implementation PriorityQueue

- (instancetype)init
{
    self = [super init];
    if (self) {
        _array = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)push:(id)object withPriority:(int) priority{
    if(object) {
        if([self count]){
            [self.array addObject:object];
        } else {
            int left = 0, right = (int)[self count] - 1;
            int mid = 0;
            while (left <= right) {
                mid = (left + right) / 2;
                if([self.array objectAtIndex:mid].distance < priority) {
                    left = mid;
                } else if([self.array objectAtIndex:mid].distance > priority) {
                    right = mid;
                } else {
                    break;
                }
            }
            ObjectForQueue* objectForQueue = [[ObjectForQueue alloc] init];
            objectForQueue.object = object;
            objectForQueue.distance = priority;
            [self.array insertObject:objectForQueue atIndex:mid];
        }
    }
}

- (id)pop{
    if([self count] > 0){
        id object = [self.array lastObject].object;
        [self.array removeLastObject];
        return object;
    }
    return nil;
}

- (NSInteger)count{
    return [self.array count];
}

- (void)setPriorityForObject:(id)object withPriority:(int) priority{
    if(object&&priority){
        if([self isContainObject:object]){
            NSInteger index = [self.array indexOfObject:object];
            [self.array objectAtIndex:index].distance = priority;
        }
    }
}

- (bool)isContainObject:(id)object{
    if(object){
        return [self.array containsObject:object];
    };
    return false;
}

@end
