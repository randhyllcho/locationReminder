//
//  MapInterfaceController.m
//  RemindMeLocally
//
//  Created by RYAN CHRISTENSEN on 2/5/15.
//  Copyright (c) 2015 RYAN CHRISTENSEN. All rights reserved.
//

#import "MapInterfaceController.h"
#import <WatchKit/WatchKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapInterfaceController()
@property (weak, nonatomic) IBOutlet WKInterfaceMap *miniMap;
@end


@implementation MapInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
  self.currentRegion = context;
  MKCoordinateRegion region = MKCoordinateRegionMake(self.currentRegion.center, MKCoordinateSpanMake(0.01, 0.01));
  [self.miniMap setRegion: region];
    // Configure interface objects here.
  NSLog(@"this: %@", self.currentRegion);
}


- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



