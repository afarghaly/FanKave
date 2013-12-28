//
//  FanKaveBaseViewController.m
//  FanKave
//
//  Created by Ahmed Farghaly on 12/28/13.
//  Copyright (c) 2013 Ahmed Farghaly. All rights reserved.
//

#import "FanKaveBaseViewController.h"

@interface FanKaveBaseViewController ()

@end

@implementation FanKaveBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        // Custom initialization
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
//    self.view.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.1f];
    
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 100, 200, 60)];
    titleLabel.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.0f];
    titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:60];
    titleLabel.textColor = [UIColor colorWithWhite:1.0f alpha:0.5f];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"Title...";
    [self.view addSubview:titleLabel];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
