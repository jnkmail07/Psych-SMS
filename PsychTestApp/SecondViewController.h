//
//  SecondViewController.h
//  PsychTestApp
//
//  Created by nm on 8/21/12.
//  Copyright (c) 2012 Jacob John. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SecondViewController : UIViewController<UITableViewDelegate> {
    
    IBOutlet UITableView *sentMsgTbl;
    NSString *toPhone;
    NSString *fromPhone;
    NSString *message;
    NSString *timeout;

}
@property (nonatomic, retain) NSString *toPhone;
@property (nonatomic, retain) NSString *fromPhone;
@property (nonatomic, retain) NSString *message;
@property (nonatomic, retain) NSString *timeout;
@property (nonatomic, retain) NSString *added;
-(void) initData;


@property (weak, nonatomic) UITableView *sentMsgTbl;
@property (retain, nonatomic) NSMutableData *dict;

@end
