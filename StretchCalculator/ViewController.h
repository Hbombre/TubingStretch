//
//  ViewController.h
//  StretchCalculator
//
//  Created by Craig Hewlett on 2013-09-13.
//  Copyright (c) 2013 Craig Hewlett. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kMetricSwitchIndex 0
#define kTubingSwitchIndex 0


@interface ViewController : UIViewController{
    
    NSTimer *timer;
    UILabel *answer;
    UILabel *answer2;
    UILabel *tensionRequiredUnit;
    UILabel *depthUnit;
    UITextField *tensionRequired;
    UITextField *depth;
    UISegmentedControl *units;
    UISegmentedControl *tbgSize;
    
    
    
}

@property NSTimer *timer;
@property IBOutlet UILabel *answer;
@property IBOutlet UILabel *answer2;
@property IBOutlet UILabel *tensionRequiredUnit;
@property IBOutlet UILabel *depthUnit;
@property IBOutlet UITextField *tensionRequired;
@property IBOutlet UITextField *depth;
@property IBOutlet UISegmentedControl *units;
@property IBOutlet UISegmentedControl *tbgSize;
@property IBOutlet UIButton *adButton;


-(IBAction)textFieldDoneEditing:(id)sender;
- (IBAction)CheckOutNewApps:(id)sender;

@end
