//
//  KavesViewController.m
//  FanKave
//
//  Created by Ahmed Farghaly on 12/28/13.
//  Copyright (c) 2013 Ahmed Farghaly. All rights reserved.
//

#import "KavesViewController.h"


@interface KavesViewController ()
{
    NSArray *kavesData;
    
    KaveSelectionView *kaveSelection;
    KaveControlView *kaveControl;
    
    UIScrollView *kaveScrollView;
    KaveDetailsView *kaveScore;
    
}
@end



@implementation KavesViewController

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
    
    titleLabel.text = @"";
    
    NSLog(@"KavesVC viewDidLoad: %@", NSStringFromCGRect(self.view.frame));
    
//    CGRect selfFrame = self.view.frame;
//    selfFrame.size = CGSizeMake(320, 500);
//    self.view.frame = selfFrame;
    
//    titleLabel.text = @"Kaves";
    
    NSString *kavesDataPath = [[DataUtils sharedDataUtils] getBundleResourcePath:@"KavesData" ofType:@"plist"];
    kavesData = [[NSArray alloc] initWithContentsOfFile:kavesDataPath];
//    NSLog(@"kavesData: %@", kavesData);
    
    kaveSelection = [[KaveSelectionView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    kaveSelection.delegate = self;
    [self.view addSubview:kaveSelection];
    [viewComponents addObject:kaveSelection];
    
    kaveControl = [[KaveControlView alloc] initWithFrame:CGRectMake(0, 50, 320, 34)];
    kaveControl.delegate = self;
    [self.view addSubview:kaveControl];
    [viewComponents addObject:kaveControl];
    
    kaveScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 84, 320, self.view.frame.size.height - 100)];
    [self.view addSubview:kaveScrollView];
//    kaveScrollView.userInteractionEnabled = NO;
    kaveScrollView.pagingEnabled = YES;
    kaveScrollView.delegate = self;
    kaveScrollView.contentSize = CGSizeMake(960, 300);
    
    for(int i = 0 ; i < 3 ; i++)
    {
        KaveDetailsView *kaveDetails = [[KaveDetailsView alloc] initWithFrame:CGRectMake(i * 320, 0, 318, self.view.frame.size.height - 100)];
        [kaveScrollView addSubview:kaveDetails];
        [kaveDetails initializeWithKaveData:kavesData[i]];
        [kaveDetails selectMenuItemWithID:0];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)testButtonTapped
{
    NSLog(@"test button tapped");
}



#pragma mark -
#pragma mark KaveSelectionViewDelegate mthods

- (void)kaveButtonTapped:(NSString *)kaveName_
{
    if([kaveName_ isEqualToString:@"49ers champs!"])
    {
        [kaveScrollView scrollRectToVisible:CGRectMake(0, 0, 320, 300) animated:YES];
    }
    else if([kaveName_ isEqualToString:@"US Open final"])
    {
        [kaveScrollView scrollRectToVisible:CGRectMake(320, 0, 320, 300) animated:YES];
    }
    else if([kaveName_ isEqualToString:@"US vs Brazil"])
    {
        [kaveScrollView scrollRectToVisible:CGRectMake(640, 0, 320, 300) animated:YES];
    }
}



#pragma mark -
#pragma mark KaveControlViewDelegate methods

- (void)settingsButtonTapped
{
    NSLog(@"settings button tapped");
}



#pragma mark -
#pragma mark UIScrollViewDelegate methods


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
//    NSLog(@"scrolled, update kave selection at top");
//    NSLog(@"scrollView position: %@", NSStringFromCGPoint(kaveScrollView.contentOffset));
    
    CGPoint kaveScrollViewContentOffset = kaveScrollView.contentOffset;
    float buttonIndex = kaveScrollViewContentOffset.x / 320.0f;
    [kaveSelection selectButtonAtIndex:(uint)buttonIndex];
}

@end
