//
//  profile.h
//  fellowship
//
//  Created by JETS on 9/13/19.
//  Copyright (c) 2019 JETS. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <Foundation/Foundation.h>
#import "DB.h"
#import "JETSViewController.h"
#import "AnnotationClass.h"
#import "Update.h"

@interface profile : UIViewController<MKAnnotation>
@property (strong, nonatomic) IBOutlet UIImageView *iv;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *phone;
@property (strong, nonatomic) IBOutlet UILabel *mail;
@property (strong, nonatomic) IBOutlet MKMapView *mk;


@end
