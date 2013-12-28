//
//  ViewController.m
//  FanKave
//
//  Created by Ahmed Farghaly on 12/28/13.
//  Copyright (c) 2013 Ahmed Farghaly. All rights reserved.
//

#import "ViewController.h"
#import "DeviceUtils.h"
#import "RootViewController.h"


// - - - - - - - - - - - - - - - - - - - - - - - - - - - -


@interface ViewController ()
{
//    RootViewController *rootViewController;
}
@end


// - - - - - - - - - - - - - - - - - - - - - - - - - - - -


@implementation ViewController


#pragma mark -
#pragma mark UIViewController methods



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIImageView *bkgdImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    bkgdImageView.image = [UIImage imageNamed:@"Default"];
    [self.view addSubview:bkgdImageView];
    
    NSLog(@"[ViewController viewDidLoad: %@", self.view);
    
    self.rootViewController = [[RootViewController alloc] init];
//    [self addChildViewController:self.rootViewController];
    [self.view addSubview:self.rootViewController.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// - - - - - - - - - - - - - - - - - - - - - - - - - - - -



@end
