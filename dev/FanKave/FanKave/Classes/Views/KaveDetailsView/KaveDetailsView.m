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

@interface KaveDetailsView()
{
    KaveScoreView *scoreView;
    NSMutableArray *kaveDetailsTabButtons;
    UIScrollView *kaveContentScrollView;
    
    UIImageView *kaveContentIndicator;
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
        
        
        UIImageView *kaveContentBkgdImageView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 93, 304.5, frame.size.height - 114)];
        
        kaveContentBkgdImageView.image = [[UIImage imageNamed:@"kaveDetailsContentBkgd"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 0, 10, 0)  resizingMode:UIImageResizingModeStretch];
//        kaveContentBkgdImageView.image = [UIImage imageNamed:@"kaveDetailsContentBkgd"];
        [self addSubview:kaveContentBkgdImageView];
        
        
        kaveContentIndicator = [[UIImageView alloc] initWithFrame:CGRectMake(8, 92, 10, 5.5)];
        kaveContentIndicator.image = [UIImage imageNamed:@"kaveDetailsContentIndicator"];
        [self addSubview:kaveContentIndicator];
        
//        kaveContentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//        kaveContentScrollView.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.2f];
//        [self addSubview:kaveContentScrollView];
        
        
    }
    return self;
}


- (void)initializeWithKaveData:(NSDictionary *)kaveData_
{
//    NSLog(@"initialze KaveDetails with data: %@", kaveData_);
    [scoreView initializeWithKaveData:kaveData_];
}


- (void)menuItemButtonTapped:(id)sender
{
    NSLog(@"kave details content menu item button tapped");
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
}


- (void)selectMenuItemWithID:(uint)buttonID_
{
    UIButton *button = (UIButton *)kaveDetailsTabButtons[buttonID_];
    [self menuItemButtonTapped:button];
}




@end



