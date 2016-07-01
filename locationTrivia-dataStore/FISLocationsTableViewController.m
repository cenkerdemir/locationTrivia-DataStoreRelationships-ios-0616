//
//  FISLocationsTableViewController.m
//  locationTrivia-dataStore
//
//  Created by Cenker Demir on 6/30/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocationsTableViewController.h"

@interface FISLocationsTableViewController ()


@end

@implementation FISLocationsTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tableView.accessibilityLabel = @"Locations Table";
    self.tableView.accessibilityIdentifier = @"Locations Table";
    
    self.navigationItem.rightBarButtonItem.accessibilityLabel = @"addButton";
    self.navigationItem.rightBarButtonItem.accessibilityIdentifier = @"addButton";
    
    self.store = [FISLocationsDataStore sharedLocationsDataStore];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.store.locations count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"locationCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.store.locations[indexPath.row] name];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%li", [[self.store.locations[indexPath.row] trivia] count]];
    return cell; 
}

 #pragma mark - Navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     if ([segue.identifier isEqualToString:@"triviaDetailsSegue"]) {
         NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
         FISLocation *selectedLocation = [self.store.locations objectAtIndex:indexPath.row];
         FISTriviaTableViewController *triviaTVC = segue.destinationViewController;
         triviaTVC.location = selectedLocation;
     }
 }

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:NO];
    [self.tableView reloadData];
}

@end
