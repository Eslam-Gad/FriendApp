
#import "Update.h"

@interface Update ()

@end

@implementation Update
{
    NSUserDefaults *def;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    def=[NSUserDefaults standardUserDefaults];
    NSString *l =[def objectForKey:@"mail"];
	_mail.text=l;
    _pass.text=[[DB new ] getPass:l];
    _lon.text=[NSString stringWithFormat:@"%f",[[DB new]getLon:l]];
    _lat.text=[NSString stringWithFormat:@"%f",[[DB new]getLat:l]];
    _city.text=[[DB new] getCity:l];
    _phone.text=[[DB new] getPhone:l];
    _name.text=[[DB new] getName:l];
    _iv.image=[UIImage imageWithContentsOfFile:[[DB new]getImg:l]];
}

- (IBAction)updateUser:(id)sender {
    
    NSString *patern =@"^[a-z0-9](.?[a-z0-9]){5,}@g(oogle)?mail.com$";
    
    NSString *value = _mail.text;
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:patern options:0 error:NULL];
    
    NSUInteger matched = [regex numberOfMatchesInString:value options:0 range:NSMakeRange(0 , [value length])];
    
    if (matched==0) {
        
        _errorMsg.text=@"Invalid E-mail !!!";
        
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
        def=[NSUserDefaults standardUserDefaults];
        NSString *l =[def objectForKey:@"mail"];
        [[DB new] updateDate:l :u1];
        _errorMsg.text=@"Done !!!";
        
        def=[NSUserDefaults standardUserDefaults];
        [def setObject:_mail.text forKey:@"mail"];
        
        
        profile *vb = [self.storyboard instantiateViewControllerWithIdentifier:@"vb"];
        
    [self.navigationController pushViewController:vb animated:NO];
        
    }
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    [_iv setImage:info[UIImagePickerControllerOriginalImage]];
    [_picker dismissViewControllerAnimated:NO completion:Nil];
    
}

- (IBAction)addimg:(id)sender {
    
    _picker = [UIImagePickerController new];
    _picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    _picker.delegate=self;
    [self.navigationController presentViewController:_picker
                                            animated:NO completion:nil];
    
}



@end
