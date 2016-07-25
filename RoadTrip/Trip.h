//
//  Trip.h
//  RoadTrip
//
//  Created by Luke Worley on 7/18/16.
//  Copyright © 2016 LJWProductions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mapkit/Mapkit.h>

@interface Trip : NSObject

-(instancetype) initWithDestinationIndex:(int)destinationIndex;
-(UIImage *) destinationImage;
-(NSString *) destinationName;
-(CLLocationCoordinate2D) destinationCoordinate;
-(NSString *) weather;
@end
