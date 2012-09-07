//
//  ThirdViewController.m
//  PsychTestApp
//
//  Created by nm on 8/21/12.
//  Copyright (c) 2012 Jacob John. All rights reserved.
//

#import "ThirdViewController.h"
#import "Constants.h"


@interface ThirdViewController ()

@end

@implementation ThirdViewController
@synthesize tSwitch;
@synthesize tSeconds = _tseconds;
@synthesize seconds = _seconds;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Settings", @"Settings");
        self.tabBarItem.image = [UIImage imageNamed:@"158-wrench-2"];
        self.view.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    tSeconds.delegate = self;
    [self.tSeconds setReturnKeyType:UIReturnKeyDone];
    _seconds = _tseconds.text;
    [self saveSetings:_seconds];
    
}

- (void)viewDidUnload
{
    tSeconds = nil;
    [self setTSeconds:nil];
    tSwitch = nil;
    [self setTSwitch:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    defaultTimeout = [NSString stringWithFormat:@"%d", 0];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    if(tSwitch.on) {
        defaultTimeout = textField.text;
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Message confirmation"
                                                   message: defaultTimeout
                                                  delegate: self
                                         cancelButtonTitle:@"Cancel"
                                         otherButtonTitles:@"OK",nil];
        //[alert show];
        NSLog(defaultTimeout);
    } else {
        defaultTimeout = [NSString stringWithFormat:@"%d", 0];
    }
    return YES;
}

- (IBAction)tSwitch:(id)sender {
    if(tSwitch.on) {
        [tSwitch setOn:YES animated:YES];
        NSLog(@"Timeout Enabled");
        defaultTimeout = _tseconds.text;
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Message confirmation"
                                                       message: defaultTimeout
                                                      delegate: self
                                             cancelButtonTitle:@"Cancel"
                                             otherButtonTitles:@"OK",nil];
        //[alert show];
        NSLog(defaultTimeout);
        [self saveSetings:_seconds];
    }
    else {
        [tSwitch setOn:NO animated:YES];
        defaultTimeout = [NSString stringWithFormat:@"%d", 0];
        NSLog(@"Timeout Disabled");
    }
    
}
- (IBAction)toggleSwitch:(id)sender {
    if(tSwitch.on) {
        [tSwitch setOn:YES animated:YES];
    }
    else {
        [tSwitch setOn:NO animated:YES];
    }
}

-(void)saveSetings:(NSString*) timeout
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:timeout forKey:@"timeout"];
    [prefs synchronize];
}

-(NSString*) getSettings
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSNumber *returnValue = [prefs objectForKey:@"timeout"];
    //return returnValue;
    return _seconds;
}

@end
