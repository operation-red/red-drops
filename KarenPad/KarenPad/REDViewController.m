//
//  REDViewController.m
//  KarenPad
//
//  Created by Jesse Johnson on 7/23/12.
//  Copyright (c) 2012 Operation Red LLC. All rights reserved.
//

#import "REDViewController.h"

@interface REDViewController ()

@end

@implementation REDViewController
@synthesize label;

- (void)viewDidLoad
{
    [super viewDidLoad];
	[label setFont:[UIFont fontWithName:@"KNU" size:30]];
}

- (void)viewDidUnload
{
    [self setLabel:nil];
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
