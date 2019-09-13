
#import "JETSViewController.h"

@interface JETSViewController ()

@end

@implementation JETSViewController

{
    TabBarController *home;
    NSUserDefaults *def;
}

- (IBAction)logbtn:(id)sender {
    
    
if([[[DB new] getPass:_mail.text]isEqualToString:_pass.text])
{

    def=[NSUserDefaults standardUserDefaults];
    [def setObject:@"1" forKey:@"login"];
    [def setObject:_mail.text forKey:@"mail"];
 
    _m =_mail.text;
    
        home=[self.storyboard instantiateViewControllerWithIdentifier:@"home"];
        [self presentViewController:home animated:NO completion:nil];
    
}
else{
    _errorMsg.text=@"Invalid Password or E-mail";
}
    
}


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    def=[NSUserDefaults standardUserDefaults];
    NSString *l =[def objectForKey:@"login"];
    if([l isEqualToString:@"1"]){
    
        home=[self.storyboard instantiateViewControllerWithIdentifier:@"home"];
        [self presentViewController:home animated:NO completion:nil];
    }
    
}

- (IBAction)signUPBtn:(id)sender {
    
    SignUP *vsign = [self.storyboard instantiateViewControllerWithIdentifier:@"vsignup"];
    [self.navigationController pushViewController:vsign animated:NO];
}


@end
