//
//  FISTriviaTableViewController.m
//  locationTrivia-dataStore
//
//  Created by Cenker Demir on 6/30/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISTriviaTableViewController.h"

@interface FISTriviaTableViewController ()

@end

@implementation FISTriviaTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tableView.accessibilityLabel = @"Trivia Table";
    self.tableView.accessibilityIdentifier = @"Trivia Table";
    
    self.navigationItem.rightBarButtonItem.accessibilityLabel = @"Add Trivia Button";
    self.navigationItem.rightBarButtonItem.accessibilityIdentifier = @"Add Trivia Button";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.location.trivia count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"triviaCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self.location.trivia[indexPath.row] content];
    cell.detailTextLabel.text =  [NSString stringWithFormat:@"%li", [self.location.trivia[indexPath.row] likes]];
    return cell;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:NO];
    [self.tableView reloadData];
}

 #pragma mark - Navigation

 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     FISAddTriviaTableTableViewController *targetTVC = segue.destinationViewController;
     targetTVC.location = self.location;
 }

@end
