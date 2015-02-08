//
//  Queue.m
//  RemindMeLocally
//
//  Created by RYAN CHRISTENSEN on 2/2/15.
//  Copyright (c) 2015 RYAN CHRISTENSEN. All rights reserved.
//

#import "Queue.h"

@implementation Queue

-(instancetype) init{
  if ((self = [super init])) {
    items = [[NSMutableArray alloc] init];
  }
  return self;
}

-(void)enqueue:(id)element{
  [items addObject:element];
}

-(id)dequeue{
  if ([items count] > 0) {
    id object = [self peek];
    [items removeObjectAtIndex:0];
    return object;
  }
  return nil;
}

-(id)peek{
  if ([items count] > 0) {
    return [items objectAtIndex:0];
  }
  return nil;
}

@end
