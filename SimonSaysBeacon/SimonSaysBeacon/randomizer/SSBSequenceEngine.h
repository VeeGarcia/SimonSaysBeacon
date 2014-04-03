//
//  SSBReihenfolge.h
//  SimonSaysBeacon
//
//  Created by Veronica Garcia on 03.04.14.
//  Copyright (c) 2014 Veronica Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSBSequenceEngine : NSObject

@property (nonatomic, strong) NSMutableArray *simonsSequence;

- (void)nextBeacon;
- (BOOL)isSameSequenceAsSimons;

- (void)beaconVisited:(int)beacon;

@end
