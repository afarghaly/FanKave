//
//  KaveControlView.m
//  FanKave
//
//  Created by Ahmed Farghaly on 12/28/13.
//  Copyright (c) 2013 Ahmed Farghaly. All rights reserved.
//

#import "KaveControlView.h"
#import "ColorUtils.h"



@implementation KaveControlView

@synthesize delegate;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        
        self.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.05f];
        
        
        UIView *lowerBorderLine = [[UIView alloc] initWithFrame:CGRectMake(10, frame.size.height, 300, 0.5)];
        lowerBorderLine.alpha = 0.5f;
        lowerBorderLine.backgroundColor = [[ColorUtils sharedColorUtils] getColorFromHexString:@"0x1993ff"];
        [self addSubview:lowerBorderLine];
        
        
        UIButton *friendRequestsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        friendRequestsButton.frame = CGRectMake(10, frame.size.height - 28, 47, 22.5);
        [friendRequestsButton setImage:[UIImage imageNamed:@"friendRequestsButton"] forState:UIControlStateNormal];
        [friendRequestsButton addTarget:self action:@selector(friendRequestsButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:friendRequestsButton];
        
        
        UIButton *addFriendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        addFriendButton.frame = CGRectMake(60, frame.size.height - 28, 47, 22.5);
        [addFriendButton setImage:[UIImage imageNamed:@"addFriendButton"] forState:UIControlStateNormal];
        [addFriendButton addTarget:self action:@selector(addFriendButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:addFriendButton];
        
        
        UIButton *kaveSettingsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        kaveSettingsButton.frame = CGRectMake(276, frame.size.height - 28, 47, 22.5);
        [kaveSettingsButton setImage:[UIImage imageNamed:@"kaveSettingsButton"] forState:UIControlStateNormal];
        [kaveSettingsButton addTarget:self action:@selector(kaveSettingsButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:kaveSettingsButton];
        
        
        UIButton *kaveMicButton = [UIButton buttonWithType:UIButtonTypeCustom];
        kaveMicButton.frame = CGRectMake(253, frame.size.height - 28, 35, 22.5);
        [kaveMicButton setImage:[UIImage imageNamed:@"kaveMicButton"] forState:UIControlStateNormal];
        [kaveMicButton addTarget:self action:@selector(kaveMicButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:kaveMicButton];
        
        
    }
    return self;
}


- (void)friendRequestsButtonTapped
{
    NSLog(@"friend requests button tapped");
}

- (void)addFriendButtonTapped
{
    NSLog(@"add friend button tapped");
}

- (void)kaveSettingsButtonTapped
{
    NSLog(@"Kave Settings button tapped");
}

- (void)kaveMicButtonTapped
{
    NSLog(@"Kave Mic Button tapped");
}


@end
