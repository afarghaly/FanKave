//
//  KaveDetailsView.h
//  FanKave
//
//  Created by Ahmed Farghaly on 12/29/13.
//  Copyright (c) 2013 Ahmed Farghaly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KaveScoreView.h"


@interface KaveDetailsView : UIView

- (void)initializeWithKaveData:(NSDictionary *)kaveData_;
- (void)selectMenuItemWithID:(uint)buttonID_;

@end
