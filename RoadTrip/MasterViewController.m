//
//  MasterViewController.m
//  RoadTrip
//
//  Created by Luke Worley on 7/13/16.
//  Copyright © 2016 LJWProductions. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "AppDelegate.h"
#import "Trip.h"
#import "Destination.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    AppDelegate *appdelegate = [[UIApplication sharedApplication]delegate];
    self.title = appdelegate.trip.destinationName;
    
    //app delegate instantiated Trip class so we can use it
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[appdelegate.trip destinationImage]];
    self.tableView.backgroundView = imageView;
    
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
        //self.title=@"Road Trip";

}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) tableView: (UITableView *) tableView willDisplayCell:(UITableViewCell*)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    cell.backgroundColor = [UIColor clearColor];
}


@end
