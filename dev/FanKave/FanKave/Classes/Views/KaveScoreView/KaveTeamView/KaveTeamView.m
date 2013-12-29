//
//  KaveTeamView.m
//  FanKave
//
//  Created by Ahmed Farghaly on 12/29/13.
//  Copyright (c) 2013 Ahmed Farghaly. All rights reserved.
//

#import "KaveTeamView.h"


@interface KaveTeamView()
{
    UILabel *teamNameLabel;
    UIImageView *teamImageView;
    UILabel *teamScoreLabel;
    KaveTeamViewDirection direction;
}
@end



@implementation KaveTeamView

- (id)initWithFrame:(CGRect)frame direction:(KaveTeamViewDirection)direction_
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        // Initialization code
        direction = direction_;
        
//        self.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.2f];
        
        teamNameLabel = [[UILabel alloc] initWithFrame:CGRectMake((direction == KaveTeamViewLeft ? 0 : 25), 0, 130, 20)];
//        teamNameLabel.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.1f];
        teamNameLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:12];
        teamNameLabel.textColor = [UIColor whiteColor];
        teamNameLabel.textAlignment = NSTextAlignmentCenter;
        teamNameLabel.text = @"Team Name";
        [self addSubview:teamNameLabel];
        
        teamImageView = [[UIImageView alloc] initWithFrame:CGRectMake((direction == KaveTeamViewLeft ? 25 : 50), 20, 80, 40)];
//        teamImageView.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.1f];
        teamImageView.contentMode = UIViewContentModeCenter;
        [self addSubview:teamImageView];
        
        teamScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake((direction == KaveTeamViewLeft ? 110 : 0), 26, 50, 28)];
//        teamScoreLabel.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.05f];
        teamScoreLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:24];
        teamScoreLabel.textColor = [UIColor whiteColor];
        teamScoreLabel.textAlignment = NSTextAlignmentCenter;
        teamScoreLabel.text = @"0";
        [self addSubview:teamScoreLabel];
        
        
    }
    
    return self;
}

- (void)initializeWithTeamData:(NSDictionary *)teamData_
{
    teamNameLabel.text = teamData_[@"teamName"];
    teamImageView.image = [UIImage imageNamed:teamData_[@"teamImage"]];
    teamScoreLabel.text = teamData_[@"teamScore"];
}

@end
