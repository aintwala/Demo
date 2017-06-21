//
//  detailVC.h
//  MasterDemo
//
//  Created by disha on 6/27/16.
//  Copyright © 2016 com.zaptechsolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailVC : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblDesignation;
@property (strong, nonatomic) NSDictionary *dictData;

@end
