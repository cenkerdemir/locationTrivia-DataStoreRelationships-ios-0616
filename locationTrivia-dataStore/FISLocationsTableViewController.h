//
//  FISLocationsTableViewController.h
//  locationTrivia-dataStore
//
//  Created by Cenker Demir on 6/30/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISLocationsDataStore.h"
#import "FISLocation.h"
#import "FISTriviaTableViewController.h"

@interface FISLocationsTableViewController : UITableViewController

@property (strong, nonatomic) FISLocationsDataStore *store;

@end
