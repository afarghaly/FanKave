//
//  KaveSelectionView.h
//  FanKave
//
//  Created by Ahmed Farghaly on 12/28/13.
//  Copyright (c) 2013 Ahmed Farghaly. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol KaveSelectionViewDelegate

- (void)kaveButtonTapped:(NSString *)kaveName_;

@end


@interface KaveSelectionView : UIView

@property (nonatomic, assign) id <KaveSelectionViewDelegate> delegate;

- (void)selectButtonAtIndex:(uint)buttonID_;


@end
