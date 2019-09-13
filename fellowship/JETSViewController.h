

#import "DB.h"
#import "SignUP.h"
#import "TabBarController.h"


@interface JETSViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *mail;

@property (strong, nonatomic) IBOutlet UITextField *pass;
@property (strong, nonatomic) IBOutlet UILabel *errorMsg;
@property NSString *m;

@end
