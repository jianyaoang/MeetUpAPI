//
//  DetailViewController.m
//  MeetUp
//
//  Created by Jian Yao Ang on 3/29/14.
//  Copyright (c) 2014 Jian Yao Ang. All rights reserved.
//

#import "DetailViewController.h"
#import "WebViewController.h"

@interface DetailViewController () <UITextViewDelegate>

@end

@implementation DetailViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.RSVPCount.delegate = self;
    self.groupName.delegate = self;
    self.eventDescription.delegate = self;
}

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    return NO;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton*)sender
{
    WebViewController *wvc = segue.destinationViewController;
    wvc.url = self.url;
}


@end
