//
//  Trip.m
//  RoadTrip
//
//  Created by Luke Worley on 7/18/16.
//  Copyright © 2016 LJWProductions. All rights reserved.
//

#import "Trip.h"
#import "Destination.h"

@interface Trip ()
    @property (strong,nonatomic) NSDictionary *destinationData;
    @property (strong,nonatomic) Destination *destination;
    
@end

@implementation Trip

-(instancetype) initWithDestinationIndex: (int) destinationIndex{
    self = [super init];
    if (self){
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Destinations" ofType:@"plist"];
        NSDictionary *destinations = [NSDictionary dictionaryWithContentsOfFile:filePath];
        NSArray *destinationsArray = destinations[@"DestinationData"];
        _destinationData=destinationsArray[destinationIndex];
        _destination = [[Destination alloc] initWithDestinationIndex:destinationIndex];
    }
    return self;
}
-(UIImage *) destinationImage {
    return self.destination.destinationImage;
}
-(NSString *) destinationName {
    return self.destination.destinationName;
}
-(CLLocationCoordinate2D) destinationCoordinate{
    return self.destination.coordinate;
}

@end