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
@end


@implementation RootMenuView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        // Initialization code
        
        NSString *menuDataPath = [[DataUtils sharedDataUtils] getBundleResourcePath:@"RootMenuData" ofType:@"plist"];
        menuItems = [NSArray arrayWithContentsOfFile:menuDataPath];
        NSLog(@"menu items: %@", menuItems);
        
        uint menuItemsAdded = 0;
        for(NSDictionary *menuItemData in menuItems)
        {
            NSLog(@"title: %@", menuItemData[@"menuItemTitle"]);
            NSLog(@"image: %@", menuItemData[@"menuItemImage"]);
            NSLog(@"- ");
            
            UIButton *menuItemButton = [UIButton buttonWithType:UIButtonTypeCustom];
            menuItemButton.frame = CGRectMake(menuItemsAdded * 64, 0, 62, 47);
//            menuItemButton.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.3f];
            [menuItemButton setBackgroundImage:[UIImage imageNamed:menuItemData[@"menuItemImage"]] forState:UIControlStateNormal];
            [menuItemButton setTitle:menuItemData[@"menuItemTitle"] forState:UIControlStateNormal];
            menuItemButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:9];
            [menuItemButton setTitleEdgeInsets:UIEdgeInsetsMake(34, 0, 0, 0)];
//            menuItemButton setImageEdgeInsets:UIEdgeInsets
            [menuItemButton setTitleColor:[UIColor colorWithWhite:1.0f alpha:0.4f] forState:UIControlStateNormal];
            [self addSubview:menuItemButton];
            
            menuItemsAdded++;
        }
    }
    
    return self;
}


@end
