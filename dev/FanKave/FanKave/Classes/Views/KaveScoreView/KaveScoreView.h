//
//  KaveScoreView.h
//  FanKave
//
//  Created by Ahmed Farghaly on 12/29/13.
//  Copyright (c) 2013 Ahmed Farghaly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KaveScoreView : UIView

- (id)initWithFrame:(CGRect)frame kaveDetails:(NSDictionary *)kaveData_;
- (void)initializeWithKaveData:(NSDictionary *)kaveData_;

@end
