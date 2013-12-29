//
//  KavesViewController.h
//  FanKave
//
//  Created by Ahmed Farghaly on 12/28/13.
//  Copyright (c) 2013 Ahmed Farghaly. All rights reserved.
//

#import "FanKaveBaseViewController.h"
#import "KaveSelectionView.h"
#import "KaveControlView.h"
#import "KaveDetailsView.h"

@interface KavesViewController : FanKaveBaseViewController <KaveSelectionViewDelegate, KaveControlViewDelegate, UIScrollViewDelegate>

@end
