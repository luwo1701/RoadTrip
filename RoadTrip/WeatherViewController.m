//
//  WeatherViewController.m
//  RoadTrip
//
//  Created by Luke Worley on 7/25/16.
//  Copyright © 2016 LJWProductions. All rights reserved.
//

#import "WeatherViewController.h"
#import "AppDelegate.h"
#import "Trip.h"

@interface WeatherViewController ()
@property(strong,nonatomic) UIBarButtonItem *backButton;

@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"Weather";
    
    //allows zoom for web page
    self.weatherView.scalesPageToFit=YES;
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    self.backButton=[[UIBarButtonItem alloc] initWithTitle:[NSString stringWithFormat:@"Back to %@",self.title] style:UIBarButtonItemStylePlain target:self action:@selector(goBack:)];
    [self.weatherView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:appDelegate.trip.weather]]];
     
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void) goBack:(id)sender{
    [self.weatherView goBack];
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"page is attempting to load"); 
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"page loaded");
}

-(BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    //if the link was pressed
    if(navigationType == UIWebViewNavigationTypeLinkClicked){
        //if you're on an ipad
        /*
        if([[UIDevice currentDevice] userInterfaceIdiom]==UIUserInterfaceIdiomPad){
            //if there isn't already a back button
            if (![self.toolbar.items containsObject:self.backButton]) {
                NSMutableArray *itemsArray=[self.toolbarItems mutableCopy];
                [itemsArray addObject:self.backButton];
                //[self.toolbarItems:itemsArray animated:NO];
                
            }
            else{
                self.navigationItem.rightBarButtonItem=self.backButton;
            }
        
    
        }
         */
    }
    return YES;
}
@end
