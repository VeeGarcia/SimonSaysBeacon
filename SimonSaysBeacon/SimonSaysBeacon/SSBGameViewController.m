//
//  SSBGameViewController.m
//  SimonSaysBeacon
//
//  Created by Christoph Jerolimov on 03.04.14.
//  Copyright (c) 2014 Veronica Garcia. All rights reserved.
//

#import "SSBGameViewController.h"

@interface SSBGameViewController ()

@end

@implementation SSBGameViewController {
    BOOL isRunning;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSLog(@"Test 1");
        
        isRunning = NO;
        
        self.lamp1On = [UIImage imageNamed:@"1_Senseacon-gruen-an"];
        self.lamp1Off = [UIImage imageNamed:@"1_Senseacon-gruen-aus"];
        self.lamp2On = [UIImage imageNamed:@"1_Senseacon-rot-an"];
        self.lamp2Off = [UIImage imageNamed:@"1_Senseacon-rot-aus"];
        self.lamp3On = [UIImage imageNamed:@"1_Senseacon-gelb-an"];
        self.lamp3Off = [UIImage imageNamed:@"1_Senseacon-gelb-aus"];
        self.lamp4On = [UIImage imageNamed:@"1_Senseacon-blau-an"];
        self.lamp4Off = [UIImage imageNamed:@"1_Senseacon-blau-aus"];
        
        NSLog(@"lamp1 on: %@", self.lamp1On);
        NSLog(@"lamp1 off: %@", self.lamp1Off);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"Test 2");
    [self stop];
}

- (IBAction)start:(id)sender {
    NSLog(@"START / STOP button");
    if (!isRunning) {
        isRunning = YES;
        NSArray* lamps = @[ @4, @3, @2, @1 ];
        
        [self play:lamps afterIndex:0];
    } else {
        isRunning = NO;
        [self stop];
    }
}

- (IBAction)stop:(id)sender {
    [self stop];
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
}

- (void) stop {
    NSLog(@"STOP");
    [self lightsOff];
}

- (void) lightsOff {
    self.lamp1.image = self.lamp1Off;
    self.lamp2.image = self.lamp2Off;
    self.lamp3.image = self.lamp3Off;
    self.lamp4.image = self.lamp4Off;
}

- (void) lightOn: (int) lamp {
    self.lamp1.image = lamp == 1 ? self.lamp1On : self.lamp1Off;
    self.lamp2.image = lamp == 2 ? self.lamp2On : self.lamp2Off;
    self.lamp3.image = lamp == 3 ? self.lamp3On : self.lamp3Off;
    self.lamp4.image = lamp == 4 ? self.lamp4On : self.lamp4Off;
}

@end
