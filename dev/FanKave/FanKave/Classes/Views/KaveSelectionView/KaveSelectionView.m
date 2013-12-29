//
//  KaveSelectionView.m
//  FanKave
//
//  Created by Ahmed Farghaly on 12/28/13.
//  Copyright (c) 2013 Ahmed Farghaly. All rights reserved.
//

#import "KaveSelectionView.h"
#import "ColorUtils.h"


@interface KaveSelectionView()
{
    NSArray *kaves;
    NSMutableArray *kavesButtons;
    
    UIImageView *indicatorView;
}
@end


@implementation KaveSelectionView

@synthesize delegate;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        
        self.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.05f];
        
        UIView *lowerBorderLine = [[UIView alloc] initWithFrame:CGRectMake(0, frame.size.height, 320, 0.5)];
        lowerBorderLine.alpha = 0.5f;
        lowerBorderLine.backgroundColor = [[ColorUtils sharedColorUtils] getColorFromHexString:@"0x1993ff"];
        [self addSubview:lowerBorderLine];
        
        indicatorView = [[UIImageView alloc] initWithFrame:CGRectMake(0, frame.size.height - 4, 10, 5)];
        indicatorView.image = [UIImage imageNamed:@"kaveSelectionIndicator"];
        [self addSubview:indicatorView];
        
        
        // add Kave button
        UIButton *addKaveButton = [UIButton buttonWithType:UIButtonTypeCustom];
        addKaveButton.frame = CGRectMake(0, frame.size.height - 37, 40, 40);
//        addKaveButton.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.3f];
        [addKaveButton setImage:[UIImage imageNamed:@"addKaveButton"] forState:UIControlStateNormal];
        [addKaveButton addTarget:self action:@selector(addKaveButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:addKaveButton];
        kavesButtons = [[NSMutableArray alloc] initWithCapacity:3];
        
        // fake data
        kaves = [NSArray arrayWithObjects:@"49ers champs!", @"US Open final", @"US vs Brazil", nil];
        
        uint kavesAdded = 0;
        for(NSString *kave in kaves)
        {
            UIButton *kaveButton = [UIButton buttonWithType:UIButtonTypeCustom];
            kaveButton.tag = kavesAdded;
            kaveButton.frame = CGRectMake(50 + kavesAdded * 92, 0, 90, frame.size.height);
//            kaveButton.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.2f];
            [kaveButton setTitle:kave forState:UIControlStateNormal];
            kaveButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:11];
            [kaveButton setTitleEdgeInsets:UIEdgeInsetsMake(18, 0, 0, 0)];
            [kaveButton addTarget:self action:@selector(kaveButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:kaveButton];
            [kavesButtons addObject:kaveButton];
            
            kavesAdded++;
        }
        
        // default kave
        UIButton *defaultButton = kavesButtons[0];
        [self kaveButtonTapped:defaultButton];
    }
    return self;
}

- (void)kaveButtonTapped:(id)sender
{
    UIButton *kaveButton = (UIButton *)sender;
    
    if(delegate)
    {
        [delegate kaveButtonTapped:kaveButton.titleLabel.text];
    }
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         CGRect indicatorFrame = indicatorView.frame;
                         indicatorFrame.origin.x = kaveButton.frame.origin.x + (kaveButton.frame.size.width / 2);
                         indicatorView.frame = indicatorFrame;
                     }
                     completion:^(BOOL finished)
     {
         
     }];
    
    
    for(UIButton *button in kavesButtons)
    {
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    
    [kaveButton setTitleColor:[[ColorUtils sharedColorUtils] getColorFromHexString:@"0x29a2ff"] forState:UIControlStateNormal];
}


- (void)selectButtonAtIndex:(uint)buttonID_
{
    UIButton *kaveButton = (UIButton *)kavesButtons[buttonID_];
    [self kaveButtonTapped:kaveButton];
}

- (void)addKaveButtonTapped
{
//    NSLog(@"add kave");
}


@end
