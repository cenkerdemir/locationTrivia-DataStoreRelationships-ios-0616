//
//  FISAddLocationViewController.m
//  locationTrivia-dataStore
//
//  Created by Cenker Demir on 6/30/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISAddLocationViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface FISAddLocationViewController () <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *latitudeField;
@property (weak, nonatomic) IBOutlet UITextField *longitudeField;

@property (nonatomic) CLLocationManager *locationManager;
@property (nonatomic) CLGeocoder *geocoder;
@property (nonatomic) int locationFetchCounter;

@end

@implementation FISAddLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.geocoder = [[CLGeocoder alloc] init];
    //we need to ask for authorization
    [self.locationManager requestWhenInUseAuthorization];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)saveButton:(id)sender {
    FISLocationsDataStore *store = [FISLocationsDataStore sharedLocationsDataStore];
    FISLocation *locationToAdd = [[FISLocation alloc] init];
    
    locationToAdd.name = self.nameField.text;
    locationToAdd.latitude = [self.latitudeField.text floatValue];
    locationToAdd.longitude = [self.longitudeField.text floatValue];
    [store.locations addObject:locationToAdd];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


// execute this method to start fetching location - connected to the "add my location" button
- (IBAction)doFetchCurrentLocation:(id)sender {
    self.locationFetchCounter = 0;
    
    // fetching current location start from here
    [self.locationManager startUpdatingLocation];
    
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    // this delegate method is constantly invoked every some miliseconds.
    // we only need to receive the first response, so we skip the others.
    if (self.locationFetchCounter > 0) return;
    self.locationFetchCounter++;
    
    // after we have current coordinates, we use this method to fetch the information data of fetched coordinate
    [self.geocoder reverseGeocodeLocation:[locations lastObject] completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *placemark = [placemarks lastObject];
        
        self.nameField.text = placemark.name;
        self.latitudeField.text = [NSString stringWithFormat:@"%f", placemark.location.coordinate.latitude];
        self.longitudeField.text = [NSString stringWithFormat:@"%f", placemark.location.coordinate.longitude];
        
        // stopping locationManager from fetching again
        [self.locationManager stopUpdatingLocation];
    }];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"failed to fetch current location : %@", error);
}

@end
