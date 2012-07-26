//
//  REDViewController.m
//  ImageButtons
//
//  Created by Jesse Johnson on 7/26/12.
//  Copyright (c) 2012 Operation Red LLC. All rights reserved.
//

#import "REDViewController.h"

#define SET_STATE_IMAGES(dButton, dFileName)\
    [dButton setImage:[UIImage imageNamed:\
        [NSString stringWithFormat:@"%i.png", dFileName]]\
        forState:UIControlStateNormal];\
    [dButton setImage:[UIImage imageNamed:\
        [NSString stringWithFormat:@"%i-hl.png", dFileName]]\
        forState:UIControlStateHighlighted]

@interface REDViewController ()

@end

@implementation REDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	UIView *views = [self.view viewWithTag:1000];
    for(UIView *view in views.subviews) {
        if([view isKindOfClass:[UIButton class]] && view.tag > 0) {
            SET_STATE_IMAGES((UIButton *) view, view.tag);
        }
    } 
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
