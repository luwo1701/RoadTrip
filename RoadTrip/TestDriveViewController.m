//
//  TestDriveViewController.m
//  RoadTrip
//
//  Created by Luke Worley on 7/17/16.
//  Copyright © 2016 LJWProductions. All rights reserved.
//

#import "TestDriveViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

//creates instance variables to keep them hidden in the implementation file
@interface TestDriveViewController (){
    AVAudioPlayer *backgroundAudioPlayer;
    SystemSoundID burningRubberSoundID;
    BOOL touchInCar;
    
}

@property (weak, nonatomic) IBOutlet UIButton *testDriveButton;
@property (weak, nonatomic) IBOutlet UIImageView *car;
- (IBAction)testDrive:(id)sender;
- (void) rotate;
- (void) returnCar;
- (void) continueRotation;
@end

@implementation TestDriveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL* backgroundURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"CarRunning" ofType:@"aif"]];
    //NSLog(backgroundURL.absoluteString);
    //since it's declared in the @interface backgroundAudio player doesn't have to be declared as such v
    //AVAudioPlayer* backgroundAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:backgroundURL error:nil];

    backgroundAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:backgroundURL error:nil];
    
    backgroundAudioPlayer.numberOfLoops = -1;
    [backgroundAudioPlayer prepareToPlay];
    
    NSURL* burningRubberURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"BurnRubber" ofType:@"aif"]];
    
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)burningRubberURL, &burningRubberSoundID);
    
    
    //AVAudioPlayer* backgroundAudioPlayer = - (void)initWithContentsOfURL:backgroundURL
    //backgroundAudioPlayer.numb
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

- (IBAction)testDrive:(id)sender {
    // plays the burning rubber audio
    AudioServicesPlaySystemSound (burningRubberSoundID);
    //after a delay calls playCarSound method that does what it says
    [self performSelector:@selector(playCarSound) withObject:self afterDelay:0.2];
    
    //make an object that is the x coordinate of the cars center and y coordinate is top of the screen + half the size of the car images frame plus 100 for the toolbar and start button
    CGPoint center = CGPointMake(self.car.center.x, self.view.frame.origin.y + self.car.frame.size.height/2 + 100);
    
    
    /*
    [UIView animateWithDuration:3 animations:^{
        self.car.center=center;
        
    }
                     completion:^(BOOL finished) {
                         [self rotate];
                     }];
*/
    //block code that replaces above code
    
    //make the "car" images new center to be the CG point defined above
    void (^animation) () = ^(){
        self.car.center = center;
    };
    
    //once the animation is complete call rotate animation
    void (^completion) (BOOL) = ^(BOOL finished){
        [self rotate];
    };
    
    [UIView animateWithDuration:3 animations:animation completion:completion];
}

- (void)rotate{
    
    //M_PI specifies PI radians of rotation (in IOS positive is counter clockwise)
    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI);
    
    void (^animation) () = ^() {
        self.car.transform = transform;
    };
    
    void (^completion) (BOOL) = ^(BOOL finished) {
        [self returnCar];
    };
    
    [UIView animateWithDuration:3 animations:animation completion:completion];
}

- (void)returnCar{
    //new CG point that is the screens size - cars frame size
    CGPoint center = CGPointMake(self.view.center.x, self.view.frame.size.height - self.car.frame.size.height);
    void (^animation) () = ^() {
        self.car.center = center;
    };
    
    void (^completion) (BOOL) = ^(BOOL finished) {
        [self continueRotation];
    };
    
    [UIView animateWithDuration:3 animations:animation completion:completion];

}

-(void) continueRotation{
    CGAffineTransform transform = CGAffineTransformMakeRotation(0);
    
    void (^animation) () = ^() {
        self.car.transform = transform;
    };
    
    void (^completion) (BOOL) = ^(BOOL finished) {
        [backgroundAudioPlayer stop];
        [backgroundAudioPlayer prepareToPlay];
    };
    
    [UIView animateWithDuration:3 animations:animation completion:completion];

   
}
-(void) playCarSound{
    [backgroundAudioPlayer play];
}

//NSSet is an unnordered collection of distinct elements
-(void) touchesMoved:(NSSet *) touches withEvent:(UIEvent *)event{
    
}
@end
