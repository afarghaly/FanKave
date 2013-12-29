//
//  KaveTeamView.h
//  FanKave
//
//  Created by Ahmed Farghaly on 12/29/13.
//  Copyright (c) 2013 Ahmed Farghaly. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum
{
    KaveTeamViewLeft,
    KaveTeamViewRight
}KaveTeamViewDirection;



@interface KaveTeamView : UIView

- (id)initWithFrame:(CGRect)frame direction:(KaveTeamViewDirection)direction_;
- (void)initializeWithTeamData:(NSDictionary *)teamData_;


@end
