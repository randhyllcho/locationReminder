//
//  AddReminderViewController.m
//  RemindMeLocally
//
//  Created by RYAN CHRISTENSEN on 2/4/15.
//  Copyright (c) 2015 RYAN CHRISTENSEN. All rights reserved.
//

#import "AddReminderViewController.h"

@interface AddReminderViewController ()

@end

@implementation AddReminderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)addLocationPressed:(id)sender {
  if ([CLLocationManager isMonitoringAvailableForClass:[CLCircularRegion class]]) {
    CLCircularRegion *region = [[CLCircularRegion alloc] initWithCenter:self.annotation.coordinate radius:114000 identifier:@"This place"];
    [self.locationManager startMonitoringForRegion:region];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ReminderAdded" object:self userInfo:@{@"reminder" : region}];
  }
}


@end
