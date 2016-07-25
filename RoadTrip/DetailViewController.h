//
//  DetailViewController.h
//  RoadTrip
//
//  Created by Luke Worley on 7/13/16.
//  Copyright © 2016 LJWProductions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

//@property (weak,nonatomic) IBOutlet UIToolbar *toolbar;
//@property (weak,nonatomic) UIBarButtonItem *popOverButton;
//@property (strong,nonatomic) UIModalPresentationStyle *masterPopoverController;

@end

