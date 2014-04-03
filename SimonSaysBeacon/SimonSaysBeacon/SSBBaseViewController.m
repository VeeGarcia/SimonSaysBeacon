//
//  SSBBaseViewController.m
//  SimonSaysBeacon
//
//  Created by Christian Stahl on 03.04.14.
//  Copyright (c) 2014 Veronica Garcia. All rights reserved.
//

#import "SSBBaseViewController.h"

@interface SSBBaseViewController ()

@end

@implementation SSBBaseViewController


- (void)beaconVisited:(int)beacon {
	NSLog(@"beacon visited %i", beacon);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.definedBeacons = [NSMutableArray array];
	NSDictionary *dict3 = @{@"major" : @47829, @"minor" : @35274};
	[self.definedBeacons addObject:dict3];
	NSDictionary *dict4 = @{@"major" : @25107, @"minor" : @63313};
	[self.definedBeacons addObject:dict4];
	NSDictionary *dict2 = @{@"major" : @34756, @"minor" : @37279};
	[self.definedBeacons addObject:dict2];
	NSDictionary *dict1 = @{@"major" : @19882, @"minor" : @62541};
	[self.definedBeacons addObject:dict1];
	self.locationManager = [[CLLocationManager alloc] init];
	self.locationManager.delegate = self;
	[self initRegion];
	
	//[self.locationManager startMonitoringForRegion:self.beaconRegion];
	//[self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
	[self locationManager:self.locationManager didStartMonitoringForRegion:self.beaconRegion];
}


- (void)initRegion {
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"b9407f30-f5f8-466e-aff9-25556b57fe6d"];
    self.beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid identifier:@"edu.self.SimonSaysBeacon"];
	NSLog(@"initRegion");
    [self.locationManager startMonitoringForRegion:self.beaconRegion];
	//[self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
}

- (void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region {
    [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
	NSLog(@"didstartmonitoring");
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
	NSLog(@"entered");
}

-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    [self.locationManager stopRangingBeaconsInRegion:self.beaconRegion];
	NSLog(@"exit");
}

// Delegate method from the CLLocationManagerDelegate protocol.
- (void)locationManager:(CLLocationManager *)manager
        didRangeBeacons:(NSArray *)beacons
               inRegion:(CLBeaconRegion *)region {
	//NSLog(@"didRange");
	for (CLBeacon *beacon in beacons) {
		if ((beacon.proximity == CLProximityImmediate) ||
			(beacon.proximity == CLProximityImmediate) ||
			((beacon.rssi > -70) && (beacon.rssi != 0))) {
			NSLog(@"beacon major %i minor %i prox %i", beacon.major.intValue, beacon.minor.intValue, (int)beacon.proximity);
			for (int i = 0; i < self.definedBeacons.count; i++) {
				if ([[[self.definedBeacons objectAtIndex:i] objectForKey:@"minor"] integerValue] == beacon.minor.integerValue) {
					NSLog(@"minor %i rssi %i", beacon.minor.intValue, (int)beacon.rssi);
					//NSLog(@"beacon major %i minor %i prox %i", beacon.major.intValue, beacon.minor.intValue, (int)beacon.proximity);
					if (i != self.lastVisitedId) {
						self.lastVisitedId = i;
						[self beaconVisited:i + 1];
					}
				}
			}
		}
	}
}


@end
