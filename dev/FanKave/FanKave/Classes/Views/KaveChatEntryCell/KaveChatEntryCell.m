//
//  KaveChatEntryCell.m
//  FanKave
//
//  Created by Ahmed Farghaly on 12/29/13.
//  Copyright (c) 2013 Ahmed Farghaly. All rights reserved.
//

#import "KaveChatEntryCell.h"


@interface KaveChatEntryCell()
{
    ChatEntryDirection direction;
    
    UIImageView *chatOwnerImageView;
    UILabel *chatEntryLabel;
    
}
@end



@implementation KaveChatEntryCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier chatEntry:(NSDictionary *)chatData_
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        // Initialization code
        
        NSString *chatEntryOwnerImage = chatData_[@"chatEntryOwnerImage"];
        if([chatEntryOwnerImage isEqualToString:@"ahmed"])
        {
            direction = ChatEntryRight;
        }
        else
        {
            direction = ChatEntryLeft;
        }
        
        self.backgroundColor = [UIColor clearColor];
        
        chatOwnerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(direction == ChatEntryLeft ? 10 : 250, 5, 24, 24)];
//        chatOwnerImageView.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.1f];
        chatOwnerImageView.image = [UIImage imageNamed:chatEntryOwnerImage];
        [self.contentView addSubview:chatOwnerImageView];
        CALayer *chatOwnerImageViewLayer = chatOwnerImageView.layer;
        chatOwnerImageViewLayer.cornerRadius = 5.0f;
        chatOwnerImageViewLayer.masksToBounds = YES;
        
        UIView *chatEntryBkgd = [[UIView alloc] initWithFrame:CGRectZero];
        chatEntryBkgd.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.8f];
        [self.contentView addSubview:chatEntryBkgd];
        CALayer *bkgdLayer = chatEntryBkgd.layer;
        bkgdLayer.cornerRadius = 5.0f;
        bkgdLayer.masksToBounds = YES;
        
        
        NSString *chatEntry = chatData_[@"chatEntry"];
        chatEntryLabel = [[UILabel alloc] initWithFrame:CGRectMake((direction == ChatEntryLeft ? 45 : 90), 10, 150, 20)];
//        chatEntryLabel.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.3f];
        chatEntryLabel.textAlignment = (direction == ChatEntryLeft ? NSTextAlignmentLeft : NSTextAlignmentRight);
        chatEntryLabel.text = chatEntry;
        chatEntryLabel.numberOfLines = 0;
        chatEntryLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
        [self.contentView addSubview:chatEntryLabel];
        
        CGSize bubbleSize = [chatEntry sizeWithFont:chatEntryLabel.font constrainedToSize:CGSizeMake(chatEntryLabel.frame.size.width, 1000) lineBreakMode:NSLineBreakByWordWrapping];
        
        CGRect chatEntryLabelFrame = chatEntryLabel.frame;
        chatEntryLabelFrame.size.height = bubbleSize.height;
        chatEntryLabel.frame = chatEntryLabelFrame;
        
        CGRect chatEntryBkgdFrame = chatEntryBkgd.frame;
        chatEntryBkgdFrame.origin.x = chatEntryLabelFrame.origin.x - 5;
        chatEntryBkgdFrame.origin.y = chatEntryLabelFrame.origin.y - 5;
        chatEntryBkgdFrame.size.width = chatEntryLabelFrame.size.width + 10;
        chatEntryBkgdFrame.size.height = chatEntryLabelFrame.size.height + 10;
        chatEntryBkgd.frame = chatEntryBkgdFrame;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
