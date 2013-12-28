//
//  RootViewController.m
//  FanKave
//
//  Created by Ahmed Farghaly on 12/28/13.
//  Copyright (c) 2013 Ahmed Farghaly. All rights reserved.
//

#import "RootViewController.h"
#import "DeviceUtils.h"

// views
#import "NewsViewController.h"
#import "FriendsViewController.h"
#import "KavesViewController.h"
#import "GamesViewController.h"



// - - - - - - - - - - - - - - - - - - - - - - - - - - - -


@interface RootViewController ()
{
    UIView *contentView;
    RootMenuView *menuView;
    float menuOriginY;
    
    // main views
    NewsViewController *news;
    FriendsViewController *friends;
    KavesViewController *kaves;
    GamesViewController *games;
}

- (void)scrollToSection:(uint)sectionID_;
- (void)snapToSection:(uint)sectionID_;
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
    
    contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height - 48)];
    [self.view addSubview:contentView];
    
    menuView = [[RootMenuView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 48, 320, 47)];
    menuView.delegate = self;
    [self.view addSubview:menuView];
    
    // load sections (all are loaded at once, but manage their resources manually for performance)
    news = [[NewsViewController alloc] init];
    [contentView addSubview:news.view];
    
    friends = [[FriendsViewController alloc] init];
    [contentView addSubview:friends.view];
    CGRect friendsFrame = friends.view.frame;
    friendsFrame.origin.x = 320;
    friends.view.frame = friendsFrame;
    
    kaves = [[KavesViewController alloc] init];
    [contentView addSubview:kaves.view];
    CGRect kavesFrame = kaves.view.frame;
    kavesFrame.origin.x = 640;
    kaves.view.frame = kavesFrame;
    
    games = [[GamesViewController alloc] init];
    [contentView addSubview:games.view];
    CGRect gamesFrame = games.view.frame;
    gamesFrame.origin.x = 960;
    games.view.frame = gamesFrame;
    
    [self snapToSection:2];
    [menuView preset:2];    // load Kaves by default for now
    
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


#pragma mark -
#pragma mark RootMenuViewDelegate methods

- (void)newsTapped
{
    [self scrollToSection:0];
}

- (void)friendsTapped
{
    [self scrollToSection:1];
}

- (void)kavesTapped
{
    [self scrollToSection:2];
}

- (void)gamesTapped
{
    [self scrollToSection:3];
}

- (void)moreTapped
{
    NSLog(@"more");
}



- (void)scrollToSection:(uint)sectionID_
{
    [UIView animateWithDuration:0.45
                     animations:^{
                         CGRect contentFrame = contentView.frame;
                         contentFrame.origin.x = -(sectionID_ * 320.0f);
                         contentView.frame = contentFrame;
                     }
                     completion:^(BOOL finished)
    {
        
    }];
}

- (void)snapToSection:(uint)sectionID_
{
    CGRect contentFrame = contentView.frame;
    contentFrame.origin.x = -(sectionID_ * 320.0f);
    contentView.frame = contentFrame;
}




@end




