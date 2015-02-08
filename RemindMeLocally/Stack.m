//
//  Stack.m
//  RemindMeLocally
//
//  Created by RYAN CHRISTENSEN on 2/2/15.
//  Copyright (c) 2015 RYAN CHRISTENSEN. All rights reserved.
//

#import "Stack.h"

@implementation Stack

-(instancetype)init {
  self = [super init];
  if (self) {
    self.items = [NSMutableArray new];
  }
  return self;
}

-(void)push:(id)element {
  [self.items addObject:element];
}

-(id)pop {
  id object = [self peek];
  [self.items removeLastObject];
  return object;
}

-(id)peek {
  return [self.items lastObject];
}




@end
