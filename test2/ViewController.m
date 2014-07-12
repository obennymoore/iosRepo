//
//  ViewController.m
//  test2
//
//  Created by Ochuko Benemoh on 2014-07-11.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
@property(strong,nonatomic) NSString* mark;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSManagedObjectContext *context;
    self.mark = [[NSString alloc]init] ;
    
    AppDelegate * appDelegate = [[UIApplication sharedApplication]delegate];
    
    context = [appDelegate managedObjectContext];
    
    NSManagedObjectContext * newContact1;
    NSManagedObjectContext * newContact2;
    NSManagedObjectContext * newContact3;
    
    newContact1 = [NSEntityDescription
                   insertNewObjectForEntityForName:@"Class" inManagedObjectContext:context];
    
    newContact2 = [NSEntityDescription
                   insertNewObjectForEntityForName:@"Class" inManagedObjectContext:context];
    
    newContact3 = [NSEntityDescription
                   insertNewObjectForEntityForName:@"Class" inManagedObjectContext:context];
    
    [newContact1 setValue:@"student1" forKey:@"name"];
    [newContact1 setValue:@"20" forKey:@"mark"];
    
    [newContact2 setValue:@"student2" forKey:@"name"];
    [newContact2 setValue:@"28" forKey:@"mark"];
    
    [newContact3 setValue:@"student3" forKey:@"name"];
    [newContact3 setValue:@"29" forKey:@"mark"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitButton:(id)sender {
    
    NSManagedObjectContext * context;
    AppDelegate * appDelegate = [[UIApplication sharedApplication]delegate];
    context = [appDelegate managedObjectContext];
    NSEntityDescription * entityDesc = [NSEntityDescription entityForName:@"Class" inManagedObjectContext:context];
    NSFetchRequest * request = [[NSFetchRequest alloc]init];
    [request setEntity:entityDesc];
    
    NSPredicate * pred = [NSPredicate predicateWithFormat:@"(name = %@)", _studentName.text];
    [request setPredicate:pred];
    
    NSError * error;
    NSArray * objects = [context executeFetchRequest:request error:&error];
    
    if([objects count] == 0)
    {
        NSLog(@"No matches for %@", _studentName.text);
    }
    else
    {
        NSManagedObject * match1 = objects[0];
        self.mark = [match1 valueForKey:@"mark"];
        _studentMarks.text = self.mark;
    }
    [[self view]endEditing:YES];
}
@end
