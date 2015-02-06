//
//  AddReminderViewController.m
//  RemindMeLocally
//
//  Created by RYAN CHRISTENSEN on 2/4/15.
//  Copyright (c) 2015 RYAN CHRISTENSEN. All rights reserved.
//

#import "AddReminderViewController.h"
#import "MapViewController.h"

@interface AddReminderViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation AddReminderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)addLocationPressed:(id)sender {
  if ([CLLocationManager isMonitoringAvailableForClass:[CLCircularRegion class]]) {
    CLCircularRegion *regions = [[CLCircularRegion alloc] initWithCenter:self.annotation.coordinate radius:237 identifier:self.textField.text];
    [self.locationManager startMonitoringForRegion:regions];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ReminderAdded" object:self userInfo:@{@"reminder" : regions}];
    
  }
}


@end
