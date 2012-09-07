//
//  FirstViewController.h
//  PsychTestApp
//
//  Created by nm on 8/21/12.
//  Copyright (c) 2012 Jacob John. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate, NSURLConnectionDelegate>{

    IBOutlet UITextView *msg;
    IBOutlet UITextField *toPhone;
    IBOutlet UITextField *fromPhone;
}

@property (strong, nonatomic) UITextField *toPhone;
@property (strong, nonatomic) UITextField *fromPhone;
@property (strong, nonatomic) UITextView *msg;
@property (retain, nonatomic) NSMutableData *responseData;
@property (retain,nonatomic) NSString *timeout;

- (IBAction)sendBtn:(id)sender;
- (IBAction)recallBtn:(id)sender;

@end
