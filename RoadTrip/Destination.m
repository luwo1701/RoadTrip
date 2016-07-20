//
//  Destination.m
//  RoadTrip
//
//  Created by Luke Worley on 7/18/16.
//  Copyright © 2016 LJWProductions. All rights reserved.
//

#import "Destination.h"

@implementation Destination

-(instancetype)initWithDestinationIndex:(NSUInteger)destinationIndex{
    self=[super init];
    if (self){
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Destinations" ofType:@"plist"];
        NSDictionary *destinations = [NSDictionary dictionaryWithContentsOfFile:filePath];
        NSArray *destinationsArray = destinations[@"DestinationData"];
        NSDictionary *data = destinationsArray[destinationIndex];
        
        _destinationImage = [UIImage imageNamed: data[@"DestinationImage"]];
        _destinationName = data[@"DestinationName"];
        NSDictionary *destinationLocation = data[@"DestinationLocation"];
        _title = destinationLocation[@"Title"];
        _subtitle = destinationLocation[@"Subtitle"];
        CLLocationCoordinate2D destinationCoordinate;
        destinationCoordinate.latitude=[destinationLocation[@"Latitude"] doubleValue];
        destinationCoordinate.longitude=[destinationLocation[@"Longitude"] doubleValue];
        _coordinate = destinationCoordinate;
            }
    return self;
}

@end
