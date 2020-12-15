//
//  ViewController.m
//  StretchCalculator
//
//  Created by Craig Hewlett on 2013-09-13.
//  Copyright (c) 2013 Craig Hewlett. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

//Generic
BOOL METRIC = YES;
NSString *saveTimesOpened=@"TimesOpened";
NSString *saveRated = @"Rated";
BOOL seenNewApp = NO;
BOOL pickedNewApp = NO;
NSString *seenNewAppSave = @"LeaseLocator2016"; //CHANGE THESE FOR NEW APP!!
NSString *pickedNewAppSave = @"LL2016Picked";
int timesOpened = 0;
BOOL ratingGiven = NO;
BOOL RateAppAlertWindow = NO;
BOOL appViwedInAppStore1 = NO;
BOOL appViwedInAppStore2 = NO;
BOOL appViwedInAppStore3 = NO;

NSTimer *buttonAdTimer;
BOOL adImage1 = YES;

//End Generic

float tubingCoefficient=.30675;


@implementation ViewController

@synthesize timer;
@synthesize answer;
@synthesize answer2;
@synthesize tensionRequiredUnit;
@synthesize depthUnit;
@synthesize tensionRequired;
@synthesize depth;
@synthesize units;
@synthesize tbgSize;
@synthesize adButton;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Generic
    [self load];
    timesOpened++;
    [self save];
    [self rateThisAppInterval];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    //End Generic

    [self resetStuff];
    timer = [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(calculateAll) userInfo:nil repeats:YES];
    
    buttonAdTimer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(changeButtonAdImage) userInfo:nil repeats:YES];
    
    //units.tintColor = [UIColor blackColor];
    //tbgSize.tintColor = [UIColor blackColor];
    
    

}

-(void) resetStuff{
    units.selectedSegmentIndex=0;
    tbgSize.selectedSegmentIndex=0;
    METRIC=YES;
    tubingCoefficient=.30675;
}

-(void)changeButtonAdImage{
    if (adImage1 == YES){
        [adButton setImage:[UIImage imageNamed:@"LeaseLocatorButtonAd-2"] forState:UIControlStateNormal];
        adImage1 = NO;
    }else{
        [adButton setImage:[UIImage imageNamed:@"LeaseLocatorButtonAd-1"] forState:UIControlStateNormal];
        adImage1 = YES;
    }
}

-(void)calculateAll{
    if ([depth.text floatValue]>0){
        float tempDepth;
        float tempTension;
        if (METRIC==NO){
            tempTension = [tensionRequired.text floatValue]*.4448;
            tempDepth = [depth.text floatValue]*.3048;
            float fAnswer = ((tempTension*2.2046*.001)*(tempDepth*3.281*.001)*tubingCoefficient);
            answer.text = [NSString stringWithFormat:@"%.1f centimeters stretch", (fAnswer*2.54)];
            answer2.text = [NSString stringWithFormat:@"%.1f inches stretch", fAnswer];

        } else {
            float fAnswer = (([tensionRequired.text floatValue]*2.2046*.001)*([depth.text floatValue]*3.281*.001)*tubingCoefficient);
            answer.text = [NSString stringWithFormat:@"%.1f centimeters stretch", (fAnswer*2.54)];
            answer2.text = [NSString stringWithFormat:@"%.1f inches stretch", fAnswer];

        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//GENERIC
-(IBAction)textFieldDoneEditing:(id)sender{
    [sender resignFirstResponder];
}

-(void)dismissKeyboard {
    [depth resignFirstResponder];
    [tensionRequired resignFirstResponder];
}


-(void) save{
    [[NSUserDefaults standardUserDefaults] setInteger:timesOpened forKey:saveTimesOpened];
    [[NSUserDefaults standardUserDefaults] setBool:ratingGiven forKey:saveRated];
    [[NSUserDefaults standardUserDefaults] setBool:seenNewApp forKey:seenNewAppSave];
}

-(void) load{
    timesOpened = [[NSUserDefaults standardUserDefaults] integerForKey:saveTimesOpened];
    ratingGiven = [[NSUserDefaults standardUserDefaults] integerForKey:saveRated];
    seenNewApp = [[NSUserDefaults standardUserDefaults] integerForKey:seenNewAppSave];
    
}
-(void) rateThisAppInterval{
    if (!seenNewApp && timesOpened >1) {
        [self CheckOutNewApp];
    }
}

-(void)rateThisApp {
    UIAlertView* dialog = [[UIAlertView alloc] init];
    [dialog setDelegate:self];
    [dialog setTitle:@"Enjoy This App?"];
    [dialog setMessage:@"If you like this app, please rate it in the App Store. Thanks!"];
    [dialog addButtonWithTitle:@"Later"];
    [dialog addButtonWithTitle:@"Rate It Now"];
    [dialog show];
}

-(void)CheckOutNewApp {
    seenNewApp =YES;
    UIAlertView* dialog = [[UIAlertView alloc] init];
    [dialog setDelegate:self];
    [dialog setTitle:@"Check out the FREE\nLease Locator app?"];
    [dialog setMessage:@"Get turn-by-turn nav, well info, weather and more!"];
    [dialog addButtonWithTitle:@"No Thanks"];
    [dialog addButtonWithTitle:@"Yes!"];
    [dialog show];
    [self save];
    
}

- (void) alertView:(UIAlertView *)alert clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (RateAppAlertWindow) {
        if(buttonIndex==1) {
            RateAppAlertWindow=NO;
            ratingGiven = YES;
            [self save];
            NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/us/app/tubing-stretch-calculator/id707560803?ls=1&mt=8"];  //CHANGE THIS FOR EACH APP!!!
            [[UIApplication sharedApplication] openURL:url];
        }
        
    } else if(buttonIndex==1) {  //This is for the new app being promoted
            pickedNewApp = YES;
            [self save];
            NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/us/app/lease-locator-well-info-and-weather-for-canada/id1140689878?ls=1&mt=8"];
            [[UIApplication sharedApplication] openURL:url];

    }
}

//GENERIC END

- (IBAction)toggleControlsUnit:(id)sender{
    if ([sender selectedSegmentIndex]==kMetricSwitchIndex) {
        METRIC=YES;
        tensionRequiredUnit.text = [NSString stringWithFormat:@"daN"];
        depthUnit.text = [NSString stringWithFormat:@"m"];
    }
    else {
        METRIC=NO;
        tensionRequiredUnit.text = [NSString stringWithFormat:@"lbs"];
        depthUnit.text = [NSString stringWithFormat:@"ft"];
    }
}

- (IBAction)toggleControlsTubing:(id)sender{
    if ([sender selectedSegmentIndex]==kTubingSwitchIndex) {
        tubingCoefficient=.30675;
    }
    else {
        tubingCoefficient=.22075;

    }

}

-(IBAction)CheckOutNewApps:(id)sender{
    NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/us/app/lease-locator-well-info-and-weather-for-canada/id1140689878?ls=1&mt=8"];
    [[UIApplication sharedApplication] openURL:url];
}
@end
