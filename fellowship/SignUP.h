//
//  SignUP.h
//  fellowship
//
//  Created by JETS on 9/12/19.
//  Copyright (c) 2019 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "DB.h"

@interface SignUP : UIViewController<UIAlertViewDelegate , UIImagePickerControllerDelegate , UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *pass;
@property (strong, nonatomic) IBOutlet UITextField *phone;

@property (strong, nonatomic) IBOutlet UITextField *mail;
@property (strong, nonatomic) IBOutlet UITextField *city;
@property UIImagePickerController *picker;
@property (strong, nonatomic) IBOutlet UIImageView *iv;

@property (strong, nonatomic) IBOutlet UITextField *lat;

@property (strong, nonatomic) IBOutlet UITextField *lon;
@property (strong, nonatomic) IBOutlet UILabel *errormsg;


@end
