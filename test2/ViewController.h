//
//  ViewController.h
//  test2
//
//  Created by Ochuko Benemoh on 2014-07-11.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *studentName;
@property (weak, nonatomic) IBOutlet UILabel *studentMarks;
- (IBAction)submitButton:(id)sender;

@end
