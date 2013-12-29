//
//  KaveControlView.h
//  FanKave
//
//  Created by Ahmed Farghaly on 12/28/13.
//  Copyright (c) 2013 Ahmed Farghaly. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol KaveControlViewDelegate

- (void)settingsButtonTapped;

@end




@interface KaveControlView : UIView

@property (nonatomic, assign) id <KaveControlViewDelegate> delegate;

@end
