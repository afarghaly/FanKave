//
//  KaveScoreView.m
//  FanKave
//
//  Created by Ahmed Farghaly on 12/29/13.
//  Copyright (c) 2013 Ahmed Farghaly. All rights reserved.
//

#import "KaveScoreView.h"
#import "KaveTeamView.h"
#import "ColorUtils.h"


@interface KaveScoreView()
{
    KaveTeamView *leftView;
    KaveTeamView *rightView;
}
@end


@implementation KaveScoreView

- (id)initWithFrame:(CGRect)frame kaveDetails:(NSDictionary *)kaveData_
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        // Initialization code
        
        UIView *lowerBorderLine = [[UIView alloc] initWithFrame:CGRectMake(10, frame.size.height, 300, 0.5)];
        lowerBorderLine.alpha = 0.5f;
        lowerBorderLine.backgroundColor = [[ColorUtils sharedColorUtils] getColorFromHexString:@"0x1993ff"];
        [self addSubview:lowerBorderLine];
        
        
        leftView = [[KaveTeamView alloc] initWithFrame:CGRectMake(0, 0, 155, frame.size.height) direction:KaveTeamViewLeft];
        [self addSubview:leftView];
        
        rightView = [[KaveTeamView alloc] initWithFrame:CGRectMake(160, 0, 155, frame.size.height) direction:KaveTeamViewRight];
        [self addSubview:rightView];
    }
    
    return self;
}

- (void)initializeWithKaveData:(NSDictionary *)kaveData_
{
    NSDictionary *leftTeamData = kaveData_[@"leftTeam"];
    NSDictionary *rightTeamData = kaveData_[@"rightTeam"];
    
//    NSLog(@"left team: %@", leftTeamData[@"teamName"]);
//    NSLog(@"right team: %@", rightTeamData[@"teamName"]);
//    NSLog(@"-");
    
    [leftView initializeWithTeamData:leftTeamData];
    [rightView initializeWithTeamData:rightTeamData];
}

@end
