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
//        NSLog(@"FanKaveBaseController init");
        viewComponents = [NSMutableArray arrayWithCapacity:5];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIView *bkgd = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 300, self.view.frame.size.height - 58)];
//    bkgd.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.2f];
    [self.view addSubview:bkgd];
    
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
