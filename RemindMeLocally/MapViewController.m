//
//  MapViewController.m
//  RemindMeLocally
//
//  Created by RYAN CHRISTENSEN on 2/2/15.
//  Copyright (c) 2015 RYAN CHRISTENSEN. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "AddReminderViewController.h"


@interface MapViewController () <CLLocationManagerDelegate, MKMapViewDelegate>

- (IBAction)home:(UIButton *)sender;
- (IBAction)attPark:(UIButton *)sender;
- (IBAction)bergen:(UIButton *)sender;

@property(strong, nonatomic) CLLocationManager *locationManager;
@property(strong, nonatomic) MKPointAnnotation *selectedAnnotation;


@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reminderAdded:) name:@"ReminderAdded" object:nil];
  
  self.locationManager = [CLLocationManager new];
  self.locationManager.delegate = self;
  self.mapView.delegate = self;
  
    if ([CLLocationManager authorizationStatus] == 0) {
      [self.locationManager requestAlwaysAuthorization];
    } else {
      self.mapView.showsUserLocation = true;
      [self.locationManager startMonitoringSignificantLocationChanges];
  }
  
  UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(mapLongPressed:)];
  [self.mapView addGestureRecognizer:longPress];

}

-(void) reminderAdded:(NSNotification *)notification {
  NSDictionary *userInfo = notification.userInfo;
  CLCircularRegion *region = userInfo[@"reminder"];
  MKCircle *circleOverlay = [MKCircle circleWithCenterCoordinate:region.center radius:region.radius];
  
  [self.mapView addOverlay:circleOverlay];
}

-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
  MKCircleRenderer *circleRenderer = [[MKCircleRenderer alloc] initWithOverlay:overlay];
  circleRenderer.fillColor = [UIColor blueColor];
  circleRenderer.alpha = 0.19;
  circleRenderer.strokeColor = [UIColor blackColor];
  return circleRenderer;
}

-(void)mapLongPressed: (id) sender {
  UILongPressGestureRecognizer *longPress = (UILongPressGestureRecognizer *)sender;
  if (longPress.state == 3) {
    CGPoint location = [longPress locationInView:self.mapView];
    CLLocationCoordinate2D coordinates = [self.mapView convertPoint:location toCoordinateFromView:self.mapView];
    MKPointAnnotation *annotation = [MKPointAnnotation new];
    annotation.coordinate = coordinates;
    annotation.title = @"This place";
    [self.mapView addAnnotation:annotation];
  }
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
  MKPinAnnotationView *annotatonView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annotationView"];
  annotatonView.animatesDrop = true;
  annotatonView.pinColor = MKPinAnnotationColorGreen;
  annotatonView.canShowCallout = true;
  annotatonView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeContactAdd];
  return annotatonView;
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
  self.selectedAnnotation = view.annotation;
  [self performSegueWithIdentifier:@"REMINDER_DETAIL" sender:self];
}

-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
  UILocalNotification *localNotification = [UILocalNotification new];
  localNotification.alertBody = @"You're where you are!";
  [[UIApplication sharedApplication] presentLocalNotificationNow:localNotification];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqualToString:@"REMINDER_DETAIL"]) {
    AddReminderViewController *addReminderVC = (AddReminderViewController *)segue.destinationViewController;
    addReminderVC.annotation =  self.selectedAnnotation;
    addReminderVC.locationManager = self.locationManager;
  }
}

- (IBAction)home:(UIButton *)sender {
  CLLocationCoordinate2D coordinates = {.latitude = 47.774100,  .longitude = -122.347117};
  MKCoordinateSpan span = {.latitudeDelta = 0.007, .longitudeDelta = 0.007};
  MKCoordinateRegion region = {coordinates, span};
  [self.mapView setRegion:region animated:TRUE];
}

- (IBAction)attPark:(UIButton *)sender {
  CLLocationCoordinate2D coordinates = {.latitude = 37.778495,  .longitude = -122.390668};
  MKCoordinateSpan span = {.latitudeDelta = 0.02, .longitudeDelta = 0.02};
  MKCoordinateRegion region = {coordinates, span};
  [self.mapView setRegion:region animated:TRUE];
}

- (IBAction)bergen:(UIButton *)sender {
  CLLocationCoordinate2D coordinates = {.latitude = 60.391378,  .longitude = 5.322481};
  MKCoordinateSpan span = {.latitudeDelta = 0.02, .longitudeDelta = 0.02};
  MKCoordinateRegion region = {coordinates, span};
  [self.mapView setRegion:region animated:TRUE];
}

-(void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
