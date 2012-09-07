//
//  SecondViewController.m
//  PsychTestApp
//
//  Created by nm on 8/21/12.
//  Copyright (c) 2012 Jacob John. All rights reserved.
//

#import "SecondViewController.h"
#import "Constants.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize sentMsgTbl = _sendMsgTbl;
@synthesize dict = _dict;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"View", @"View");
        self.tabBarItem.image = [UIImage imageNamed:@"162-receipt"];
        self.view.backgroundColor = [UIColor clearColor];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // Create the request.
    
    //
    // Change the properties of the imageView and tableView (these could be set
    // in interface builder instead).
    //
    sentMsgTbl.separatorStyle = UITableViewCellSeparatorStyleNone;
    sentMsgTbl.rowHeight = 100;
    sentMsgTbl.backgroundColor = [UIColor clearColor];
    
    //
    // Create a header view. Wrap it in a container to allow us to position
    // it better.
    //
    UIView *containerView =
    [[UIView alloc]
      initWithFrame:CGRectMake(0, 0, 300, 60)];
    UILabel *headerLabel =
    [[UILabel alloc]
      initWithFrame:CGRectMake(10, 20, 300, 40)];
    headerLabel.text = NSLocalizedString(@"Message Archive", @"");
    headerLabel.textColor = [UIColor brownColor];
    headerLabel.font = [UIFont boldSystemFontOfSize:18];
    headerLabel.backgroundColor = [UIColor clearColor];
    [containerView addSubview:headerLabel];
    self.sentMsgTbl.tableHeaderView = containerView;
    
    
    NSURLRequest *theRequest=[NSURLRequest requestWithURL:[NSURL URLWithString:URL_TABLE]
                                              cachePolicy:NSURLRequestUseProtocolCachePolicy
                                          timeoutInterval:60.0];
    // create the connection with the request
    // and start loading the data
    NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    if (theConnection) {
        // Create the NSMutableData to hold the received data.
        // receivedData is an instance variable declared elsewhere.
        //_responseData = [[NSMutableData data] retain];
        //[alert show];
    } else {
        // Inform the user that the connection failed.
    }
}

- (void)viewDidUnload
{
    [self setSentMsgTbl:nil];
    sentMsgTbl = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)initData
{
    
}
- (void)returnMyMessages:(NSDictionary *)dict {
    
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
    // This method is called when the server has determined that it
    // has enough information to create the NSURLResponse.
    
    // It can be called multiple times, for example in the case of a
    // redirect, so each time we reset the data.
    
    // receivedData is an instance variable declared elsewhere.
    [_dict setLength:0];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSString *responseStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"Top 10 recent messages: %@", responseStr);
}

@end
