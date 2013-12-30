//
//  KaveDetailsView.m
//  FanKave
//
//  Created by Ahmed Farghaly on 12/29/13.
//  Copyright (c) 2013 Ahmed Farghaly. All rights reserved.
//

#import "KaveDetailsView.h"
#import "DataUtils.h"
#import "ColorUtils.h"

// content view controllers
#import "KaveChatTableViewController.h"
#import "KaveSocialTableViewController.h"
#import "KavePlaysTableViewController.h"
#import "KaveNewsTableViewController.h"



@interface KaveDetailsView()
{
    KaveScoreView *scoreView;
    NSMutableArray *kaveDetailsTabButtons;
    UIScrollView *kaveContentScrollView;
    
    UIImageView *kaveContentIndicator;
    
    KaveChatTableViewController *kaveChat;
    KaveSocialTableViewController *kaveSocial;
    KavePlaysTableViewController *kavePlays;
    KaveNewsTableViewController *kaveNews;
}
@end


@implementation KaveDetailsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        
        self.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.05f];
        
        scoreView = [[KaveScoreView alloc] initWithFrame:CGRectMake(0, 0, 320, 66) kaveDetails:nil];
        [self addSubview:scoreView];
        
        kaveDetailsTabButtons = [NSMutableArray arrayWithCapacity:5];
        
        NSString *menuDataPath = [[DataUtils sharedDataUtils] getBundleResourcePath:@"KaveDetailsMenuData" ofType:@"plist"];
        NSArray *menuData = [NSArray arrayWithContentsOfFile:menuDataPath];
        
        uint buttonsAdded = 0;
        float buttonWidth = 300 / [menuData count];
        for(NSDictionary *menuItemData in menuData)
        {
            UIButton *menuItemButton = [UIButton buttonWithType:UIButtonTypeCustom];
            menuItemButton.tag = buttonsAdded;
            menuItemButton.frame = CGRectMake(10 + (buttonsAdded * buttonWidth), 66, buttonWidth - 2, 32);
//            menuItemButton.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.3f];
            [menuItemButton setTitle:menuItemData[@"menuItemTitle"] forState:UIControlStateNormal];
            [menuItemButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [menuItemButton setTitleColor:[[ColorUtils sharedColorUtils] getColorFromHexString:@"0x29a2ff"] forState:UIControlStateSelected];
            [menuItemButton setImage:[UIImage imageNamed:menuItemData[@"menuItemImage"]] forState:UIControlStateNormal];
            NSString *selectedImageString = [NSString stringWithFormat:@"%@_selected", menuItemData[@"menuItemImage"]];
            [menuItemButton setImage:[UIImage imageNamed:selectedImageString] forState:UIControlStateSelected];
            menuItemButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:10];
            [menuItemButton setImageEdgeInsets:UIEdgeInsetsMake(5, 0, 0, 10)];
            [menuItemButton setTitleEdgeInsets:UIEdgeInsetsMake(5, 0, 0, 0)];
            [menuItemButton addTarget:self action:@selector(menuItemButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:menuItemButton];
            [kaveDetailsTabButtons addObject:menuItemButton];
            
            buttonsAdded++;
        }
        
        
        UIImageView *kaveContentBkgdImageView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 93, 304.5, frame.size.height - 94)];
        
        kaveContentBkgdImageView.image = [[UIImage imageNamed:@"kaveDetailsContentBkgd"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 0, 10, 0)  resizingMode:UIImageResizingModeStretch];
        [self addSubview:kaveContentBkgdImageView];
        
        
        kaveContentIndicator = [[UIImageView alloc] initWithFrame:CGRectMake(8, 92, 10, 5.5)];
        kaveContentIndicator.image = [UIImage imageNamed:@"kaveDetailsContentIndicator"];
        [self addSubview:kaveContentIndicator];
        
        kaveContentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(18, 102, 284.5, frame.size.height - 114)];
        kaveContentScrollView.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.1f];
//        kaveContentScrollView.scrollEnabled = NO;
        kaveContentScrollView.contentSize = CGSizeMake(4 * 284.5, frame.size.height - 114);
        kaveContentScrollView.pagingEnabled = YES;
        kaveContentScrollView.delegate = self;
        [self addSubview:kaveContentScrollView];
        
        
        kaveChat = [[KaveChatTableViewController alloc] initWithStyle:UITableViewStylePlain];
        [kaveContentScrollView addSubview:kaveChat.view];
        CGRect kaveChatFrame = kaveChat.view.frame;
        kaveChatFrame.origin.y = 0;
        kaveChatFrame.size.width = 284;
        kaveChatFrame.size.height = frame.size.height - 114;
        kaveChat.view.frame = kaveChatFrame;
        
        
        kaveSocial = [[KaveSocialTableViewController alloc] initWithStyle:UITableViewStylePlain];
        [kaveContentScrollView addSubview:kaveSocial.view];
        CGRect kaveSocialFrame = kaveSocial.view.frame;
        kaveSocialFrame.origin.x = 284;
        kaveSocialFrame.origin.y = 0;
        kaveSocialFrame.size.width = 284;
        kaveSocialFrame.size.height = frame.size.height - 114;
        kaveSocial.view.frame = kaveSocialFrame;
        
        
        kavePlays = [[KavePlaysTableViewController alloc] initWithStyle:UITableViewStylePlain];
        [kaveContentScrollView addSubview:kavePlays.view];
        CGRect kavePlaysFrame = kavePlays.view.frame;
        kavePlaysFrame.origin.x = 284 * 2;
        kavePlaysFrame.origin.y = 0;
        kavePlaysFrame.size.width = 284;
        kavePlaysFrame.size.height = frame.size.height - 114;
        kavePlays.view.frame = kavePlaysFrame;
        
        
        kaveNews = [[KaveNewsTableViewController alloc] initWithStyle:UITableViewStylePlain];
        [kaveContentScrollView addSubview:kaveNews.view];
        CGRect kaveNewsFrame = kaveNews.view.frame;
        kaveNewsFrame.origin.x = 284 * 3;
        kaveNewsFrame.origin.y = 0;
        kaveNewsFrame.size.width = 284;
        kaveNewsFrame.size.height = frame.size.height - 114;
        kaveNews.view.frame = kaveNewsFrame;
        
        
        
//        NSLog(@"kave chat frame: %@", NSStringFromCGRect(kaveChatFrame));
        
    }
    return self;
}


- (void)initializeWithKaveData:(NSDictionary *)kaveData_
{
//    NSLog(@"initialze KaveDetails with data: %@", kaveData_);
    [scoreView initializeWithKaveData:kaveData_];
    [kaveChat initializeWithKaveData:kaveData_];
}


- (void)menuItemButtonTapped:(id)sender
{
    UIButton *menuItemButton = (UIButton *)sender;
    
    switch(menuItemButton.tag)
    {
        case 0:
            
            break;
            
        case 1:
            
            break;
            
        case 2:
            
            break;
            
        case 3:
            
            break;
    }
    
    for(UIButton *button in kaveDetailsTabButtons)
    {
        button.selected = NO;
    }
    menuItemButton.selected = YES;
    
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         CGRect indicatorFrame = kaveContentIndicator.frame;
                         indicatorFrame.origin.x = menuItemButton.frame.origin.x + (menuItemButton.frame.size.width / 2);
                         kaveContentIndicator.frame = indicatorFrame;
                     }
                     completion:^(BOOL finished)
     {
         
     }];
    
    [kaveContentScrollView scrollRectToVisible:CGRectMake(menuItemButton.tag * kaveContentScrollView.frame.size.width, 0, kaveContentScrollView.frame.size.width, 1) animated:YES];
}


- (void)selectMenuItemWithID:(uint)buttonID_
{
    UIButton *button = (UIButton *)kaveDetailsTabButtons[buttonID_];
    [self menuItemButtonTapped:button];
}


#pragma mark -
#pragma mark UIScrollViewDelegate methods

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"done scrolling");
    
    CGPoint kaveContentScrollViewContentOffset = kaveContentScrollView.contentOffset;
    float buttonIndex = kaveContentScrollViewContentOffset.x / kaveContentScrollView.frame.size.width;
    NSLog(@"button index: %d", (uint)buttonIndex);
//    [kaveSelection selectButtonAtIndex:(uint)buttonIndex];
    
    UIButton *button = kaveDetailsTabButtons[(uint)buttonIndex];
    [self menuItemButtonTapped:button];
}



@end



