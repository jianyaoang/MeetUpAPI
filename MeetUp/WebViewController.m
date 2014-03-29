//
//  WebViewController.m
//  MeetUp
//
//  Created by Jian Yao Ang on 3/29/14.
//  Copyright (c) 2014 Jian Yao Ang. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webView;


@end

@implementation WebViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:self.url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [self.webView loadRequest:request];
    self.view.backgroundColor = [UIColor blackColor];
}

-(IBAction)onBackButtonPressed:(UIButton*)backButton
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
