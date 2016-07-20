//
//  Destination.h
//  RoadTrip
//
//  Created by Luke Worley on 7/18/16.
//  Copyright © 2016 LJWProductions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mapkit/Mapkit.h>


@interface Destination : NSObject

@property (nonatomic,readwrite) CLLocationCoordinate2D coordinate;
@property (nonatomic,readwrite,copy) NSString *title;
@property (nonatomic,readwrite,copy) NSString *subtitle;
@property (nonatomic,strong) NSString *destinationName;
@property (nonatomic,strong) UIImage *destinationImage;
- (instancetype) initWithDestinationIndex:(NSUInteger) destinationIndex;

@end

