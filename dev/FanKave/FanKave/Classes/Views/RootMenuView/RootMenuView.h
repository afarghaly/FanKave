//
//  RootMenuView.h
//  FanKave
//
//  Created by Ahmed Farghaly on 12/28/13.
//  Copyright (c) 2013 Ahmed Farghaly. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol RootMenuViewDelegate

- (void)newsTapped;
- (void)friendsTapped;
- (void)kavesTapped;
- (void)gamesTapped;
- (void)moreTapped;

@end



@interface RootMenuView : UIView

@property (nonatomic, assign) id <RootMenuViewDelegate> delegate;

- (void)preset:(uint)sectionID_;


@end
