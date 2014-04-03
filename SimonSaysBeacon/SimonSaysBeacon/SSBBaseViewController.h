//
//  SSBBaseViewController.h
//  SimonSaysBeacon
//
//  Created by Christian Stahl on 03.04.14.
//  Copyright (c) 2014 Veronica Garcia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface SSBBaseViewController : UIViewController <CLLocationManagerDelegate>

- (void)beaconVisited:(int)beacon;


@property (nonatomic, retain) id delegate;
@property (strong, nonatomic) CLBeaconRegion *beaconRegion;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (nonatomic) int lastVisitedId;
@property (nonatomic, retain) NSMutableArray *definedBeacons;




@end
