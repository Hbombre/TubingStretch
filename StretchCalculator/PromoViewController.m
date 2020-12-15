//
//  PromoViewController.m
//  StretchCalculator
//
//  Created by Craig Hewlett on 2013-09-15.
//  Copyright (c) 2013 Craig Hewlett. All rights reserved.
//

#import "PromoViewController.h"

@interface PromoViewController ()

@end

@implementation PromoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)PR_Selected:(id)sender{
    NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/us/app/pump-rate-calculator/id567630271?ls=1&mt=8"];
    [[UIApplication sharedApplication] openURL:url];
}
-(IBAction)IE_Selected:(id)sender{
    NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/app/insect-evasion/id622313874?ls=1&mt=8"];
    [[UIApplication sharedApplication] openURL:url];
}
-(IBAction)HV_Selected:(id)sender{
    NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/us/app/hole-volumes/id645763976?ls=1&mt=8"];
    [[UIApplication sharedApplication] openURL:url];
}

-(IBAction)VL_Selected:(id)sender{
    NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/us/app/mileage-log-report/id719287157?ls=1&mt=8"];
    [[UIApplication sharedApplication] openURL:url];
}

-(IBAction)EL_Selected:(id)sender{
    NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/us/app/equipment-hour-log/id725271191?ls=1&mt=8"];
    [[UIApplication sharedApplication] openURL:url];
}

@end
