//
//  SSBeaconHelper.h
//  SimonSaysBeacon
//
//  Created by Christian Stahl on 03.04.14.
//  Copyright (c) 2014 Veronica Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SSBeaconHelperDelegate <NSObject>

- (void)beaconVisited:(int)beacon;

@end

@interface SSBeaconHelper : NSObject

@end
