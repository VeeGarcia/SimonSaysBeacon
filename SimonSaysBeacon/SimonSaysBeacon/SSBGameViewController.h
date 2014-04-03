//
//  SSBGameViewController.h
//  SimonSaysBeacon
//
//  Created by Christoph Jerolimov on 03.04.14.
//  Copyright (c) 2014 Veronica Garcia. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SSBBaseViewController.h"

@interface SSBGameViewController : SSBBaseViewController

@property (weak, nonatomic) IBOutlet UIImageView *lamp1;
@property (weak, nonatomic) IBOutlet UIImageView *lamp2;
@property (weak, nonatomic) IBOutlet UIImageView *lamp3;
@property (weak, nonatomic) IBOutlet UIImageView *lamp4;

@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;

@property (weak, nonatomic) IBOutlet UIView *letsgo;
@property (weak, nonatomic) IBOutlet UIView *gratulation;
@property (weak, nonatomic) IBOutlet UIView *gameover;

- (IBAction)start:(id)sender;

- (IBAction)stop:(id)sender;

- (void) lightsOff;
- (void) lightOn: (int) lamp;

@end
