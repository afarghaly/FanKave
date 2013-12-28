//
//  RootViewController.m
//  FanKave
//
//  Created by Ahmed Farghaly on 12/28/13.
//  Copyright (c) 2013 Ahmed Farghaly. All rights reserved.
//

#import "RootViewController.h"
#import "RootMenuView.h"
#import "DeviceUtils.h"



@interface RootViewController ()
{
    RootMenuView *menuView;
    float menuOriginY;
}
@end


// - - - - - - - - - - - - - - - - - - - - - - - - - - - -


@implementation RootViewController


#pragma mark -
#pragma mark UIViewController methods


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self)
    {
        NSLog(@"[RootViewController init]");
        // Custom initialization
    }
    
    return self;
}

- (void)loadView
{
    [super loadView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSLog(@"[RootViewCOntroller viewDidLoad]");
    
    menuView = [[RootMenuView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 48, 320, 47)];
    [self.view addSubview:menuView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSLog(@"[RootViewCOntroller viewWillAppear]");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// - - - - - - - - - - - - - - - - - - - - - - - - - - - -



@end


