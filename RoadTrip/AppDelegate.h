//
//  AppDelegate.h
//  RoadTrip
//
//  Created by Luke Worley on 7/13/16.
//  Copyright © 2016 LJWProductions. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Trip;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,strong) Trip *trip;
-(void) createDestinationModel:(int) destinationIndex;

@end

