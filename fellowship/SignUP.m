//
//  SignUP.m
//  fellowship
//
//  Created by JETS on 9/12/19.
//  Copyright (c) 2019 JETS. All rights reserved.
//

#import "SignUP.h"

@interface SignUP ()

@end

@implementation SignUP



- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (IBAction)signUpBtn:(id)sender {
    

    NSString *patern =@"^[a-z0-9](.?[a-z0-9]){5,}@g(oogle)?mail.com$";
    
    NSString *value = _mail.text;
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:patern options:0 error:NULL];
    
    NSUInteger matched = [regex numberOfMatchesInString:value options:0 range:NSMakeRange(0 , [value length])];
    
    if (matched==0) {
        
        _errormsg.text=@"Invalid E-mail !!!";
        
    } else {
    User *u1 = [User new];
    [u1 setName:_name.text];
    [u1 setLat:_lat.text];
    [u1 setCity:_city.text];
    [u1 setLon:_lon.text];
    [u1 setPhone:_phone.text];
    [u1 setPassword:_pass.text];
    [u1 setEmail:_mail.text];
    
        NSData *webdate = UIImagePNGRepresentation(_iv.image);
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask ,YES);
        NSString *localpathes = [path objectAtIndex:0];
        [webdate writeToFile:localpathes atomically:YES];
    [u1 setImg:localpathes];
        
    [[DB new] NewUser:u1];
    _errormsg.text=@"Done !!!";
        
    }
    
}

- (IBAction)addimg:(id)sender {
    
    _picker = [UIImagePickerController new];
    _picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    _picker.delegate=self;
    [self.navigationController presentViewController:_picker
                                            animated:NO completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    
    [_iv setImage:info[UIImagePickerControllerOriginalImage]];
    [_picker dismissViewControllerAnimated:NO completion:Nil];
    
}

@end
