//
//  KaveChatEntryCell.h
//  FanKave
//
//  Created by Ahmed Farghaly on 12/29/13.
//  Copyright (c) 2013 Ahmed Farghaly. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum
{
    ChatEntryLeft,
    ChatEntryRight
}ChatEntryDirection;


@interface KaveChatEntryCell : UITableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier chatEntry:(NSDictionary *)chatData_;

@end
