//
//  ViewController.m
//  MeetUp
//
//  Created by Jian Yao Ang on 3/29/14.
//  Copyright (c) 2014 Jian Yao Ang. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UITextViewDelegate>
{
    NSDictionary *events;
    NSArray *meetUpEvents;
    IBOutlet UITableView *myTableView;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self retrievingAPIAndSearchForText:@"mobile"];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return meetUpEvents.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myReuseIdentifier"];
    NSDictionary *eventsName = meetUpEvents[indexPath.row];
    NSDictionary *eventsVenue = eventsName[@"venue"];

    cell.textLabel.text = eventsName[@"name"];
    
    cell.detailTextLabel.numberOfLines = 0;
    cell.detailTextLabel.text = eventsVenue[@"address_1"];
    cell.detailTextLabel.textColor = [UIColor darkGrayColor];
    return cell;
}

-(void) retrievingAPIAndSearchForText: (NSString*) retrieveAndSearch
{
    NSString *urlString = [NSString stringWithFormat:@"https://api.meetup.com/2/open_events.json?zip=60604&text=mobile&time=,1w&key=3583153582811785f606d6c4f1a4918"];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
    {
        NSError *error;
        events = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        meetUpEvents = events[@"results"];
        [myTableView reloadData];
    }];    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell*)sender
{
    DetailViewController *dvc = segue.destinationViewController;
    
    NSIndexPath *indexPath = [myTableView indexPathForCell:sender];
    NSDictionary *eventsDetails = meetUpEvents[indexPath.row];
    NSDictionary *groupDetails = eventsDetails[@"group"];
    NSDictionary *rsvpCount = eventsDetails[@"yes_rsvp_count"];
    
    dvc.view.backgroundColor = [UIColor whiteColor];
    
    dvc.title = eventsDetails[@"name"];
    dvc.groupName.text = groupDetails[@"name"];
    dvc.RSVPCount.text = [NSString stringWithFormat:@"%@",rsvpCount];
    dvc.eventDescription.text = eventsDetails[@"description"];
//    dvc.urlButton = eventsDetails[@"event_url"];
    dvc.url = eventsDetails[@"event_url"];
}

@end
