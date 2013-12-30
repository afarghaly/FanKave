//
//  KavePlaysTableViewController.m
//  FanKave
//
//  Created by Ahmed Farghaly on 12/29/13.
//  Copyright (c) 2013 Ahmed Farghaly. All rights reserved.
//

#import "KavePlaysTableViewController.h"

@interface KavePlaysTableViewController ()

@end

@implementation KavePlaysTableViewController

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
    
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 284, 30)];
    titleLabel.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.0f];
    titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:20];
    titleLabel.textColor = [UIColor colorWithWhite:1.0f alpha:0.5f];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"Plays";
    [self.view addSubview:titleLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
