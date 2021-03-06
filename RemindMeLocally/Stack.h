//
//  Stack.h
//  RemindMeLocally
//
//  Created by RYAN CHRISTENSEN on 2/2/15.
//  Copyright (c) 2015 RYAN CHRISTENSEN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject

@property(strong,nonatomic) NSMutableArray *items;

-(void)push:(id)element;
-(id)pop;
-(id)peek;

@end
