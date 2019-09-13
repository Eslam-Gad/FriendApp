

#import "profile.h"

@interface profile ()

@end

@implementation profile



{
    NSUserDefaults *def;
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    def=[NSUserDefaults standardUserDefaults];
    NSString *m = [def objectForKey:@"mail"];
    _name.text=[[DB new]getName:m];
    _phone.text=[[DB new]getPhone:m];
    _mail.text=m;
    _iv.image=[UIImage imageWithContentsOfFile:[[DB new]getImg:m]];
    
    MKCoordinateRegion region =[_mk regionThatFits:MKCoordinateRegionMakeWithDistance
        (CLLocationCoordinate2DMake([ [DB new] getLat:m],
        [ [DB new] getLon:m]),20,20)];
    
    AnnotationClass *annot = [AnnotationClass new];
    
    [annot setCoordinate:CLLocationCoordinate2DMake(
        [ [DB new] getLat:m] , [ [DB new] getLon:m])];
    
    [annot setTitle:[[DB new]getCity:m]];
    [_mk setRegion:region];
    [_mk addAnnotation:annot];
    
}

- (IBAction)logout:(id)sender {
    
    def=[NSUserDefaults standardUserDefaults];
    [def setObject:@"0" forKey:@"login"];
    
    [self dismissModalViewControllerAnimated:NO];
    
}


@end
