//
//  KaveChatTableViewController.m
//  FanKave
//
//  Created by Ahmed Farghaly on 12/29/13.
//  Copyright (c) 2013 Ahmed Farghaly. All rights reserved.
//

#import "KaveChatTableViewController.h"
#import "KaveChatEntryCell.h"


@interface KaveChatTableViewController ()
{
    NSArray *chatData;
}
@end

@implementation KaveChatTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initializeWithKaveData:(NSDictionary *)kaveData_
{
//    NSLog(@"KaveChat init with Kave Data: %@", kaveData_[@"kaveChatStream"]);
    chatData = kaveData_[@"kaveChatStream"];
    [self.tableView reloadData];
    
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [chatData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = (UITableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    NSDictionary *chatInfo = chatData[[indexPath row]];
    
//    if(cell == nil)
//    {
       KaveChatEntryCell *cell = [[KaveChatEntryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier chatEntry:chatInfo];
//    }
//

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.textLabel.text = chatInfo[@"chatEntry"];
    // Configure the cell...
    
    return cell;
}



#pragma mark -
#pragma mark UITableViewDelegate methods

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *chatEntryData = chatData[[indexPath row]];
    NSString *chatEntry = chatEntryData[@"chatEntry"];
    NSLog(@"chat Entry: %@", chatEntry);
    
    CGSize textBubbleSize = [chatEntry sizeWithFont:[UIFont fontWithName:@"helveticaNeue" size:12] constrainedToSize:CGSizeMake(150, 10000) lineBreakMode:NSLineBreakByWordWrapping];
    NSLog(@"textBubbleSize: %f", textBubbleSize.height);
    
    return textBubbleSize.height + 25;
}


@end
