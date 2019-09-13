
#import "AllUsers.h"

@interface AllUsers ()

@end

@implementation AllUsers


{
    NSMutableArray *data;
    NSMutableArray *imgs;

}


-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [data count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.accessoryType = UITableViewCellAccessoryDetailButton;
    
    UILabel *lbl1 = [cell viewWithTag:1];
    UIImageView *iv =[cell viewWithTag:2];
    
    lbl1.text=[data objectAtIndex:indexPath.row];
    iv.image=[UIImage imageWithContentsOfFile:[imgs objectAtIndex:indexPath.row]];
    
    return cell;
}



-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return  @"Friends List :";
    
}




-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    
    int footer = [data count];
    NSNumber *myInt = [NSNumber numberWithInt:footer];
    
    [[myInt stringValue]stringByAppendingString:
     @":  ALL USERS"];
    
    return   [[myInt stringValue]stringByAppendingString:
              @":  USERS"];
}


- (void)viewWillAppear:(BOOL)animated{
    imgs =[[DB new] getImgs];
    data=[[DB new] getNames];
    [_tv reloadData];
}



@end
