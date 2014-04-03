//
//  SSBGameViewController.m
//  SimonSaysBeacon
//
//  Created by Christoph Jerolimov on 03.04.14.
//  Copyright (c) 2014 Veronica Garcia. All rights reserved.
//

#import "SSBGameViewController.h"
#import "SSBSequenceEngine.h"

@interface SSBGameViewController () 

@property (nonatomic, strong) SSBSequenceEngine *sequenceEngine;

@end

@implementation SSBGameViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.sequenceEngine = [[SSBSequenceEngine alloc] init];
    
    [self lightsOff];
    [self reset];
}

- (BOOL) isRunning {
    return self.startButton.hidden;
}

- (IBAction)start:(id)sender {
    NSLog(@"START");
    if ([self isRunning]) {
        NSLog(@"Canceled.");
        return;
    }
    self.lastVisitedId = -1;
    [self.sequenceEngine nextBeacon];
    NSArray* lamps = self.sequenceEngine.simonsSequence;
    [self play:lamps afterIndex:0];
}

- (IBAction)stop:(id)sender {
    NSLog(@"STOP");
    if (![self isRunning]) {
        NSLog(@"Canceled.");
        return;
    }
    
    if ([self.sequenceEngine isSameSequenceAsSimons]) {
        NSLog(@"You Win");
        self.letsgo.hidden = YES;
        self.gratulation.hidden = NO;
        self.gameover.hidden = YES;
    } else {
        NSLog(@"Simon Wins");
        self.letsgo.hidden = YES;
        self.gratulation.hidden = YES;
        self.gameover.hidden = NO;
        self.sequenceEngine.simonsSequence = [[NSMutableArray alloc] init];
    }
    [self lightsOff];
    [self reset];
}

- (void) play: (NSArray*) lamps afterIndex: (NSUInteger) index {
    NSLog(@"PLAY %i of %i: %@", index + 1, lamps.count, lamps);
    
    [self lightOn:((NSNumber*)lamps[index]).integerValue];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (index >= (lamps.count - 1)) {
            [self go];
        } else {
            [self play:lamps afterIndex:index + 1];
        }
    });
}

- (void) go {
    NSLog(@"GO");
    self.letsgo.hidden = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.letsgo.hidden = YES;
    });
    
    self.startButton.hidden = YES;
    self.stopButton.hidden = NO;
}

- (void) reset {
    NSLog(@"RESET");
    self.stopButton.hidden = YES;
    self.startButton.hidden = NO;
    
    self.letsgo.hidden = YES;
    self.gratulation.hidden = YES;
    self.gameover.hidden = YES;
}

- (void) lightsOff {
    self.lamp1.highlighted = NO;
    self.lamp2.highlighted = NO;
    self.lamp3.highlighted = NO;
    self.lamp4.highlighted = NO;
}

- (void) lightOn: (int) lamp {
    self.lamp1.highlighted = lamp == 1;
    self.lamp2.highlighted = lamp == 2;
    self.lamp3.highlighted = lamp == 3;
    self.lamp4.highlighted = lamp == 4;
}

#pragma SSBeaconHelperDelegate
- (void)beaconVisited:(int)beacon {
    [self.sequenceEngine beaconVisited:beacon];
}

@end
