//
//  FISLocationsDataStore.m
//  locationTrivia-dataStore
//
//  Created by Cenker Demir on 6/30/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocationsDataStore.h"

@implementation FISLocationsDataStore

- (instancetype)init {
    self = [super init];
    if (self) {
        _locations = [[NSMutableArray alloc] init];
        [self generateStartingLocationsData];
    }
    return self;
}

- (void)generateStartingLocationsData {
    FISLocation *empireState = [[FISLocation alloc] initWithName:@"The Empire State Building"
                                                        latitude:40.7484
                                                       longitude:-73.9857];
    
    FISTrivium *trivium1A = [[FISTrivium alloc] initWithContent:@"1,454 Feet Tall" likes:4];
    FISTrivium *trivium1B = [[FISTrivium alloc] initWithContent:@"Cost $24,718,000 to build" likes:2];
    
    [empireState.trivia addObjectsFromArray:@[trivium1A, trivium1B]];
    
    FISLocation *bowlingGreen = [[FISLocation alloc] initWithName:@"Bowling Green"
                                                         latitude:41.3739
                                                        longitude:-83.6508];
    
    FISTrivium *trivium2A = [[FISTrivium alloc] initWithContent:@"NYC's oldest park" likes:8];
    FISTrivium *trivium2B = [[FISTrivium alloc] initWithContent:@"Made a park in 1733" likes:2];
    FISTrivium *trivium2C = [[FISTrivium alloc] initWithContent:@"Charging Bull was created in 1989" likes:0];
    
    
    [bowlingGreen.trivia addObjectsFromArray:@[trivium2A, trivium2B, trivium2C]];
    
    FISLocation *ladyLiberty = [[FISLocation alloc] initWithName:@"Statue Of Liberty"
                                                        latitude:40.6892
                                                       longitude:74.0444];
    FISTrivium *trivium3A = [[FISTrivium alloc] initWithContent:@"Gift from the french" likes:6];
    
    [ladyLiberty.trivia addObjectsFromArray:@[trivium3A]];
    
    [self.locations addObjectsFromArray:@[bowlingGreen, empireState, ladyLiberty]];
}


+ (instancetype)sharedLocationsDataStore {
    static FISLocationsDataStore *_sharedLocationsDataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedLocationsDataStore = [[FISLocationsDataStore alloc] init];
    });
    
    return _sharedLocationsDataStore;
}

@end
