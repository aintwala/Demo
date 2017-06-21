//
//  ViewController.m
//  MasterDemo
//
//  Created by disha on 6/27/16.
//  Copyright © 2016 com.zaptechsolutions. All rights reserved.
//

#import "ViewController.h"
#import "detailVC.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    aryData = [NSMutableArray new];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)insertNewObject:(id)sender {
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Please enter your details!"
                                          message:@""
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = @"Enter your name";
         [textField addTarget:self
                       action:@selector(alertTextFieldDidChange:)
             forControlEvents:UIControlEventEditingChanged];
     }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = @"Enter your designation";
         [textField addTarget:self
                       action:@selector(alertTextFieldDidChange:)
             forControlEvents:UIControlEventEditingChanged];
     }];


    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   
                                   UITextField *name = alertController.textFields.firstObject;
                                   UITextField *designate = alertController.textFields.lastObject;
                                   dictData = [NSMutableDictionary new];
                                   [dictData setValue:name.text forKey:@"name"];
                                   [dictData setValue:designate.text forKey:@"designation"];
                                   NSLog(@"%@",dictData);
                                   [aryData addObject:dictData];
                                   NSLog(@"%@",aryData);
                                   [tblData reloadData];
                                   

                               }];
    
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];


    

}

- (void)alertTextFieldDidChange:(UITextField *)sender
{
    UIAlertController *alertController = (UIAlertController *)self.presentedViewController;
    if (alertController)
    {
        UITextField *login = alertController.textFields.firstObject;
        UIAlertAction *okAction = alertController.actions.lastObject;
        okAction.enabled = login.text.length > 2;
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return aryData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [aryData[indexPath.row]valueForKey:@"name"];
    cell.detailTextLabel.text = [aryData[indexPath.row]valueForKey:@"designation"];
    return cell;
}


#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    detailVC *ObjdetailVC = [storyboard instantiateViewControllerWithIdentifier:@"detailVC"];
    ObjdetailVC.dictData = aryData[indexPath.row];
//    ObjdetailVC.lblName.text = [[aryData objectAtIndex:indexPath.row]valueForKey:@"name"];
//    ObjdetailVC.lblDesignation.text = [[aryData objectAtIndex:indexPath.row]valueForKey:@"designation"];
    [self.navigationController pushViewController:ObjdetailVC animated:TRUE];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [aryData removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}





@end
