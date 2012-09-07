//
//  FirstViewController.m
//  PsychTestApp
//
//  Created by nm on 8/21/12.
//  Copyright (c) 2012 Jacob John. All rights reserved.
//

#import "FirstViewController.h"
#import "Constants.h"
#import "ThirdViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize toPhone = _toPhone;
@synthesize fromPhone = _fromPhone;
@synthesize msg = _msg;
@synthesize responseData = _responseData;
@synthesize timeout = _timeout;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Text", @"Text");
        self.tabBarItem.image = [UIImage imageNamed:@"08-chat"];
        self.view.backgroundColor = [UIColor clearColor];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _toPhone.delegate = self;
    _fromPhone.delegate = self;
    _msg.delegate = self;
    defaultTimeout = [NSString stringWithFormat:@"%d", 0];
    toPhone.font = [UIFont boldSystemFontOfSize:22];
    [self.toPhone setReturnKeyType:UIReturnKeyDone];
    [self.fromPhone setReturnKeyType:UIReturnKeyDone];
    [self.msg setReturnKeyType:UIReturnKeyDone];
}

- (void)viewDidUnload
{
    [self setToPhone:nil];
    [self setFromPhone:nil];
    [self setMsg:nil];
    toPhone = nil;
    fromPhone = nil;
    msg = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text {
    
    // Any new character added is passed in as the "text" parameter
    if([text isEqualToString:@"\n"]) {
        NSLog(@"Done editing...");
        // Be sure to test for equality using the "isEqualToString" message
        [textView resignFirstResponder];
        // Return FALSE so that the final '\n' character doesn't get added
        return NO;
    }
    // For any other character return TRUE so that the text gets added to the view
    return YES;
}
/*
- (BOOL) textViewShouldEndEditing:(UITextView *)textView
{
    textView.text = @"";
    return YES;
    
}
*/

- (IBAction)sendBtn:(id)sender {
    ThirdViewController *lib = [[ThirdViewController alloc]init];
    //NSString *dTimeout = [[lib getSettings]integerValue];
    //[[NSString alloc] intiWithString:@""]
    //NSString *dTimeoutStr = [NSNumber numberWithInt:dTimeout];
    //NSString *tSeconds = lib.tSeconds.text;
    _timeout = lib.seconds;
    BOOL tSwitch = lib.tSwitch.on;
    //int tO = [[lib getSettings] intValue];
    NSString *url = URL;
    NSString *toPhoneText = _toPhone.text;  
    NSString *fromPhoneText = _fromPhone.text;
    NSString *messageText = _msg.text;
    NSString *dTimeout = defaultTimeout;
    NSLog(dTimeout);
    //NSString *dTimeout = [NSString stringWithFormat:@"%d", tO];
    //NSString *dTimeout = [NSString stringWithFormat:@"%d", defaultTimeout];
    //NSString *to = [[UIViewController alloc] initWithNibName:@"ViewController3" bundle:nil];
    NSString *post = [NSString stringWithFormat:@"to=%@&from=%@&message=%@&timeout=%@", toPhoneText, fromPhoneText, messageText, dTimeout];
    NSString *postURL = [URL stringByAppendingString:post];
    if (lib.tSwitch.on) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Message confirmation"
                                                   message: defaultTimeout
                                                  delegate: self
                                         cancelButtonTitle:@"Cancel"
                                         otherButtonTitles:@"OK",nil];
    
    
        [alert show];
    }
    
    // Send name=Mark&lastname=Smith
    NSDictionary *params = [[NSDictionary alloc]
                            initWithObjectsAndKeys:
                            toPhoneText, @"to",
                            fromPhoneText, @"from",
                            messageText, @"message",
                            dTimeout, @"timeout", nil];
    
    // Create the request.
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest new];
    [theRequest setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", URL] ] ];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [theRequest setHTTPBody:postData];
    
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

/*
- (BOOL)textFieldShouldClear:(UITextField *)textField {
    if([textField isEqual:toPhone]) {
        toPhone.text=@"";
        msg.text=@"";
    }

    //etc....
    return YES;
}
*/
- (IBAction)recallBtn:(id)sender {
    //[[NSString alloc] intiWithString:@""]
    NSString *url = URL;
    NSString *myString =[url stringByAppendingString:@"?to="];
    NSString *toPhoneText = _toPhone.text;
    NSString *test1 = [myString stringByAppendingString:toPhoneText];
    NSString *myString2 = [test1 stringByAppendingString:@"&from="];
    NSString *fromPhoneText = _fromPhone.text;
    NSString *myString3 = [myString2 stringByAppendingString:fromPhoneText];
    NSString *myString4 = [myString3 stringByAppendingString:@"&txtMsg="];
    NSString *messageText = _msg.text;
    NSString *dTimeout = [NSString stringWithFormat:@"%d", 0];
    //NSString userIdSaved = [[ThirdViewController getSettings]integerValue];
    //NSString *to = [[UIViewController alloc] initWithNibName:@"ViewController3" bundle:nil];
    NSString *myURL = [myString4 stringByAppendingString:messageText];
    NSString *post = [NSString stringWithFormat:@"?to=%@&from=%@&message=%@&timeout=%@", toPhoneText, fromPhoneText, @"Cancel", dTimeout];
    NSString *postURL = [URL stringByAppendingString:post];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Recall Message confirmation"
                                                   message: postURL
                                                  delegate: self
                                         cancelButtonTitle:@"Cancel"
                                         otherButtonTitles:@"OK",nil];

    // Create the request.
    NSURLRequest *theRequest=[NSURLRequest requestWithURL:[NSURL URLWithString:URL_CANCEL]
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
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{

    // This method is called when the server has determined that it
    // has enough information to create the NSURLResponse.
    
    // It can be called multiple times, for example in the case of a
    // redirect, so each time we reset the data.
    
    // receivedData is an instance variable declared elsewhere.
    [_responseData setLength:0];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSString *someString = [NSString stringWithFormat:@"%@", data];

    //convert response so that it can be LOG'd
    NSString *returnString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    
    NSLog(@"RETURN STRING: %@", returnString);

    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Psych! Response"
                                                   message: returnString
                                                  delegate: self
                                         cancelButtonTitle:@"Cancel"
                                         otherButtonTitles:@"OK",nil];
    [alert show];
    // Append the new data to receivedData.
    // receivedData is an instance variable declared elsewhere.
    [_responseData appendData:data];
}
@end
