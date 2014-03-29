//
//  DetailViewController.h
//  MeetUp
//
//  Created by Jian Yao Ang on 3/29/14.
//  Copyright (c) 2014 Jian Yao Ang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextView *groupName;
@property (strong, nonatomic) IBOutlet UITextView *RSVPCount;
@property (strong, nonatomic) IBOutlet UIButton *urlButton;
@property (strong, nonatomic) IBOutlet UITextView *eventDescription;
@property NSString *url;
@end
