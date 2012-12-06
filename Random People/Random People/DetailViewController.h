//
//  DetailViewController.h
//  Random People
//
//  Created by Adminz on 12/5/12.
//  Copyright (c) 2012 Operation Red LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
