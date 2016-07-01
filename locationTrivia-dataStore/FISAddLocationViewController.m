//
//  FISAddLocationViewController.m
//  locationTrivia-dataStore
//
//  Created by Cenker Demir on 6/30/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISAddLocationViewController.h"

@interface FISAddLocationViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *latitudeField;
@property (weak, nonatomic) IBOutlet UITextField *longitudeField;


@end

@implementation FISAddLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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


@end
