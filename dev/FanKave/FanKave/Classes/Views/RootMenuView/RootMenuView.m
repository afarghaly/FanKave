//
//  RootMenuView.m
//  FanKave
//
//  Created by Ahmed Farghaly on 12/28/13.
//  Copyright (c) 2013 Ahmed Farghaly. All rights reserved.
//

#import "RootMenuView.h"
#import "DataUtils.h"


@interface RootMenuView()
{
    NSArray *menuItems;
}

- (void)menuItemTapped:(id)sender;

@end


@implementation RootMenuView

@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        // Initialization code
        
        NSString *menuDataPath = [[DataUtils sharedDataUtils] getBundleResourcePath:@"RootMenuData" ofType:@"plist"];
        menuItems = [NSArray arrayWithContentsOfFile:menuDataPath];
        
        uint menuItemsAdded = 0;
        for(NSDictionary *menuItemData in menuItems)
        {
            UIButton *menuItemButton = [UIButton buttonWithType:UIButtonTypeCustom];
            menuItemButton.tag = menuItemsAdded;
            menuItemButton.frame = CGRectMake(menuItemsAdded * 64, 0, 62, 47);
//            menuItemButton.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.3f];
            [menuItemButton setBackgroundImage:[UIImage imageNamed:menuItemData[@"menuItemImage"]] forState:UIControlStateNormal];
            [menuItemButton setTitle:menuItemData[@"menuItemTitle"] forState:UIControlStateNormal];
            menuItemButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:9];
            [menuItemButton setTitleEdgeInsets:UIEdgeInsetsMake(34, 0, 0, 0)];
//            menuItemButton setImageEdgeInsets:UIEdgeInsetsMake
            [menuItemButton setTitleColor:[UIColor colorWithWhite:1.0f alpha:0.4f] forState:UIControlStateNormal];
            [menuItemButton addTarget:self action:@selector(menuItemTapped:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:menuItemButton];
            
            menuItemsAdded++;
        }
    }
    
    return self;
}


- (void)menuItemTapped:(id)sender
{
    UIButton *menuItem = (UIButton *)sender;
    
    switch(menuItem.tag)
    {
        case 0:
            if(delegate)
            {
                [delegate newsTapped];
            }
            break;
            
        case 1:
            if(delegate)
            {
                [delegate friendsTapped];
            }
            break;
            
        case 2:
            if(delegate)
            {
                [delegate kavesTapped];
            }
            break;
            
        case 3:
            if(delegate)
            {
                [delegate gamesTapped];
            }
            break;
            
        case 4:
            if(delegate)
            {
                [delegate moreTapped];
            }
            break;
    }
    
    
    // adjust text color
    for(UIButton *menuItemButton in [self subviews])
    {
        if([menuItemButton isKindOfClass:[UIButton class]])
        {
            [menuItemButton setTitleColor:[UIColor colorWithWhite:1.0f alpha:0.4f] forState:UIControlStateNormal];
        }
    }
    [menuItem setTitleColor:[UIColor colorWithWhite:1.0f alpha:1.0f] forState:UIControlStateNormal];
}



- (void)preset:(uint)sectionID_
{
    switch(sectionID_)
    {
        case 0:
            if(delegate)
            {
                [delegate newsTapped];
            }
            break;
            
        case 1:
            if(delegate)
            {
                [delegate friendsTapped];
            }
            break;
            
        case 2:
            if(delegate)
            {
                [delegate kavesTapped];
            }
            break;
            
        case 3:
            if(delegate)
            {
                [delegate gamesTapped];
            }
            break;
            
        case 4:
            if(delegate)
            {
                [delegate moreTapped];
            }
            break;
    }
    
    
    // adjust text color
    for(UIButton *menuItemButton in [self subviews])
    {
        if([menuItemButton isKindOfClass:[UIButton class]])
        {
            [menuItemButton setTitleColor:[UIColor colorWithWhite:1.0f alpha:0.4f] forState:UIControlStateNormal];
        }
    }
    UIButton *targetButton = (UIButton *)[self viewWithTag:sectionID_];
    [targetButton setTitleColor:[UIColor colorWithWhite:1.0f alpha:1.0f] forState:UIControlStateNormal];
}


@end

