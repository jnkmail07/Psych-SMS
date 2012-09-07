//
//  ThirdViewController.h
//  PsychTestApp
//
//  Created by nm on 8/21/12.
//  Copyright (c) 2012 Jacob John. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController <UITextFieldDelegate>{

    IBOutlet UITextField *tSeconds;
    IBOutlet UISwitch *tSwitch;
}
@property (strong, nonatomic) UISwitch *tSwitch;
@property (strong, nonatomic) UITextField *tSeconds;
@property (strong, nonatomic) NSString *seconds;

- (IBAction)toggleSwitch:(id)sender;

-(void)saveSettings:(NSString*) userID;
-(NSString*) getSettings;

@end
