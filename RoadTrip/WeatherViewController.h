//
//  WeatherViewController.h
//  RoadTrip
//
//  Created by Luke Worley on 7/25/16.
//  Copyright © 2016 LJWProductions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
//adopts UIWebViewDelegate protocols
@interface WeatherViewController : DetailViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *weatherView;

@end
