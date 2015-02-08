//
//  Queue.h
//  RemindMeLocally
//
//  Created by RYAN CHRISTENSEN on 2/2/15.
//  Copyright (c) 2015 RYAN CHRISTENSEN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Queue : NSObject {
  NSMutableArray *items;
}

-(id)dequeue;
-(void)enqueue:(id)element;
-(id)peek;

@end
