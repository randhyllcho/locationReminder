//
//  InterfaceController.m
//  RemindMeLocally WatchKit Extension
//
//  Created by RYAN CHRISTENSEN on 2/5/15.
//  Copyright (c) 2015 RYAN CHRISTENSEN. All rights reserved.
//

#import "InterfaceController.h"
#import "CustomRowViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "MapInterfaceController.h"

@interface InterfaceController()
@property (weak, nonatomic) IBOutlet WKInterfaceTable *table;
@property (strong,nonatomic) NSArray *regionsArray;
@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

  CLLocationManager *locationManager = [CLLocationManager new];
  NSSet *regions = locationManager.monitoredRegions;
  self.regionsArray = regions.allObjects;
  
  [self.table setNumberOfRows:regions.count withRowType:@"SHOW_REGION"];
  NSInteger index = 0;
  for (CLRegion *region in self.regionsArray) {
    CustomRowViewController *rowController = [self.table rowControllerAtIndex:index];
    [rowController.rowLabel setText:region.identifier];
    index++;
  }
}

-(id)contextForSegueWithIdentifier:(NSString *)segueIdentifier inTable:(WKInterfaceTable *)table rowIndex:(NSInteger)rowIndex {
  return self.regionsArray[rowIndex];
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



