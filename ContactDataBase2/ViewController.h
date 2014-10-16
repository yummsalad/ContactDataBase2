//
//  ViewController.h
//  ContactDataBase2
//
//  Created by Cesar Silva on 10/6/14.
//  Copyright (c) 2014 Rock Valley College. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *fullname;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (strong, nonatomic) IBOutlet UITextField *Address;
@property (strong, nonatomic) IBOutlet UITextField *notes;

@property (weak, nonatomic) IBOutlet UILabel *status;

- (IBAction)btnSave:(id)sender;
- (IBAction)btnFind:(id)sender;



@end

