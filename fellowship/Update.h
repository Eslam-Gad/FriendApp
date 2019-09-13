//
//  Update.h
//  fellowship
//
//  Created by JETS on 9/13/19.
//  Copyright (c) 2019 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "User.h"
#import "DB.h"
#import "profile.h"

@interface Update : UIViewController<UIAlertViewDelegate , UIImagePickerControllerDelegate , UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *iv;
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *mail;
@property (strong, nonatomic) IBOutlet UITextField *pass;
@property (strong, nonatomic) IBOutlet UITextField *phone;
@property UIImagePickerController *picker;

@property (strong, nonatomic) IBOutlet UITextField *city;
@property (strong, nonatomic) IBOutlet UITextField *lat;

@property (strong, nonatomic) IBOutlet UITextField *lon;
@property (strong, nonatomic) IBOutlet UILabel *errorMsg;

@end
