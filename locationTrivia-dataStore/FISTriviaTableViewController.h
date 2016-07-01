//
//  FISTriviaTableViewController.h
//  locationTrivia-dataStore
//
//  Created by Cenker Demir on 6/30/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISLocation.h"
#import "FISAddTriviaTableTableViewController.h"

@interface FISTriviaTableViewController : UITableViewController

@property (nonatomic) FISLocation *location;

@end
