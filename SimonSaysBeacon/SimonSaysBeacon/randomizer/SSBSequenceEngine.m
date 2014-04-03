//
//  SSBReihenfolge.m
//  SimonSaysBeacon
//
//  Created by Veronica Garcia on 03.04.14.
//  Copyright (c) 2014 Veronica Garcia. All rights reserved.
//

#import "SSBSequenceEngine.h"
#import "SSBeaconHelper.h"

@interface SSBSequenceEngine () <SSBeaconHelperDelegate>

@property (nonatomic, readwrite) NSMutableArray *simonsSequence;
@property (nonatomic, strong) NSMutableArray *mySequence;
@end

@implementation SSBSequenceEngine
- (id)init {
    self = [super init];
    if (self) {
        _simonsSequence = [[NSMutableArray alloc] init];
        _mySequence = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)nextBeacon {
    NSUInteger random = [self randomNumber];
    [self.simonsSequence addObject:[NSNumber numberWithInteger:random]];
    NSLog(@"simonSequence %@", self.simonsSequence);
}

- (BOOL)isSameSequenceAsSimons {
    BOOL didCorrectSequence = [self.simonsSequence isEqualToArray:self.mySequence];
    
    NSLog(@"simonSequence %@", self.simonsSequence);
    NSLog(@"mySequence %@", self.mySequence);
    return didCorrectSequence;
}

#pragma SSBeaconHelperDelegate
- (void)beaconVisited:(int)beacon {
    [self.mySequence addObject:[NSNumber numberWithInt:beacon]];
}

- (NSUInteger)randomNumber {
    NSUInteger random = [self generateNumber];
    NSUInteger lastObject = [(NSNumber*)[self.simonsSequence lastObject] unsignedIntegerValue];

    if (lastObject == random) {
        random = [self randomNumber];
    }
    return random;
}

- (NSUInteger)generateNumber {
    
    NSUInteger randomNumber = arc4random_uniform(4)+1;
    
    return randomNumber;
}



@end
