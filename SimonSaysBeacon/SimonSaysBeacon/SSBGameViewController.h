//
//  SSBGameViewController.h
//  SimonSaysBeacon
//
//  Created by Christoph Jerolimov on 03.04.14.
//  Copyright (c) 2014 Veronica Garcia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSBGameViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *lamp1;
@property (weak, nonatomic) IBOutlet UIImageView *lamp2;
@property (weak, nonatomic) IBOutlet UIImageView *lamp3;
@property (weak, nonatomic) IBOutlet UIImageView *lamp4;

@property (weak, nonatomic) UIImage *lamp1On;
@property (weak, nonatomic) UIImage *lamp1Off;
@property (weak, nonatomic) UIImage *lamp2On;
@property (weak, nonatomic) UIImage *lamp2Off;
@property (weak, nonatomic) UIImage *lamp3On;
@property (weak, nonatomic) UIImage *lamp3Off;
@property (weak, nonatomic) UIImage *lamp4On;
@property (weak, nonatomic) UIImage *lamp4Off;

- (IBAction)start:(id)sender;

- (void) lightsOff;
- (void) lightOn: (int) lamp;

@end
