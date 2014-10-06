//
//  ViewController.m
//  ContactDataBase2
//
//  Created by Cesar Silva on 10/6/14.
//  Copyright (c) 2014 Rock Valley College. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSave:(id)sender {
    
    //Load CoreData Contacts Table
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSManagedObject *newContact;
    
    newContact = [NSEntityDescription insertNewObjectForEntityForName:@"Contact" inManagedObjectContext:context];
    
        //Connect TextFields to DataFields
    
        [newContact setValue: self.fullname.text forKey:@"fullname"];
    
        [newContact setValue: self.email.text forKey:@"email"];
    
        [newContact setValue: self.phone.text forKey:@"phone"];
    
        //Clear testfields after save
        self.fullname.text = @"";
        self.email.text = @"";
        self.phone.text = @"";
    NSError *error;
    //Save
    [context save:&error];
    self.status.text = @"Contact saved";
}
- (IBAction)btnFind:(id)sender {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Contact" inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:entityDesc];
    
    NSPredicate *pred =[NSPredicate predicateWithFormat:@"(fullname CONTAINS[cd] %@)", self.fullname.text];
    
    [request setPredicate:pred];
    
    NSManagedObject *matches =nil;
    
    NSError *error;
    
    NSArray *objects = [context executeFetchRequest: request error:&error];
    
    if ([objects count] == 0) {
        self.status.text = @"No matches";
    } else {
        matches = objects[0];
        self.fullname.text = [matches valueForKey: @"fullname"];
        self.email.text = [matches valueForKey: @"email"];
        self.phone.text = [matches valueForKey: @"phone"];
        self.status.text = [NSString stringWithFormat: @"%lu matches found", (unsigned long)[objects count]];
    }
}
@end
