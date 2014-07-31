//
//  BIDViewController.m
//  QuartzFun
//
//  Created by Dexter Launchlabs on 7/31/14.
//  Copyright (c) 2014 Dexter Launchlabs. All rights reserved.
//

#import "BIDViewController.h"
#import "BIDQuartzFunView.h"
@interface BIDViewController ()

@end

@implementation BIDViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeColor:(id)sender {
    UISegmentedControl *control = sender;
    NSInteger index = [control selectedSegmentIndex];
    BIDQuartzFunView *quartzView = (BIDQuartzFunView *)self.view;
    switch (index) {
        case kRedColorTab:
            quartzView.currentColor = [UIColor redColor]; quartzView.useRandomColor = NO;
            break;
        case kBlueColorTab:
            quartzView.currentColor = [UIColor blueColor]; quartzView.useRandomColor = NO;
            break;
        case kYellowColorTab:
            quartzView.currentColor = [UIColor yellowColor]; quartzView.useRandomColor = NO;
            break;
        case kGreenColorTab:
            quartzView.currentColor = [UIColor greenColor]; quartzView.useRandomColor = NO;
            break;
        case kRandomColorTab: quartzView.useRandomColor = YES; break;
        default:
            break;
    }
}

- (IBAction)changeShape:(id)sender {
    UISegmentedControl *control = sender; [(BIDQuartzFunView *)self.view setShapeType:[control
                                                                                       selectedSegmentIndex]];
    if ([control selectedSegmentIndex] == kImageShape) _colorControl.hidden = YES;
    else
        _colorControl.hidden = NO;
}
@end
