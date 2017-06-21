//
//  detailVC.m
//  MasterDemo
//
//  Created by disha on 6/27/16.
//  Copyright © 2016 com.zaptechsolutions. All rights reserved.
//

#import "detailVC.h"

@implementation detailVC

-(void)viewDidLoad {
    _lblName.text = [_dictData valueForKey:@"name"];
    _lblDesignation.text = [_dictData valueForKey:@"designation"];
}

@end
