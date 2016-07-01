//
//  FISAddTriviaTableTableViewController.m
//  locationTrivia-dataStore
//
//  Created by Cenker Demir on 6/30/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISAddTriviaTableTableViewController.h"

@interface FISAddTriviaTableTableViewController ()
@property (weak, nonatomic) IBOutlet UITextField *triviumTextField;

@end

@implementation FISAddTriviaTableTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)saveButton:(id)sender {
    FISTrivium *trivium = [[FISTrivium alloc] initWithContent:self.triviumTextField.text likes:0];
    FISLocationsDataStore *store = [FISLocationsDataStore sharedLocationsDataStore];
    NSUInteger index = [store.locations indexOfObject:self.location];
    [[store.locations[index] trivia] addObject:trivium];
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (IBAction)cancelButton:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}


@end
