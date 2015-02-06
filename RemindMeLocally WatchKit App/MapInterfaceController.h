//
//  MapInterfaceController.h
//  RemindMeLocally
//
//  Created by RYAN CHRISTENSEN on 2/5/15.
//  Copyright (c) 2015 RYAN CHRISTENSEN. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "InterfaceController.h"

@interface MapInterfaceController : WKInterfaceController
@property (strong, nonatomic) CLCircularRegion *currentRegion;
@end
