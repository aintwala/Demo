//
//  ViewController.h
//  MasterDemo
//
//  Created by disha on 6/27/16.
//  Copyright © 2016 com.zaptechsolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate> {
    
    IBOutlet UITableView *tblData;
    NSMutableArray *aryData;
    NSMutableDictionary *dictData;
}


@end

