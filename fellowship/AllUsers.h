//
//  AllUsers.h
//  fellowship
//
//  Created by JETS on 9/13/19.
//  Copyright (c) 2019 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DB.h"

@interface AllUsers : UIViewController<UITableViewDataSource ,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tv;



@end
