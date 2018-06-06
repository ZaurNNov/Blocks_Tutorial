//
//  ViewController.m
//  BlockDemo
//
//  Created by Zaur Giyasov on 06/06/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSString *(^blockAsMemberVar)(void);

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    _blockAsMemberVar = ^(void) {
        return @"This block is declared as a member variable!";
    };
    
    
    
    int (^howMany)(int, int) = ^(int a, int b) {
        return a + b;
    };
    
    NSLog(@"%d", howmany(5, 10));
}


// A block declaration follows the next syntax pattern:
/// ReturnType (^blockName)(Parameters)

-(void)examples1 {
    
    int (^firstBlock)(NSString *par1, int param2);
    
    void (^showName)(NSString *myName);
    
    NSDate *(^whatDayItis)(void);
    
    void (^allVoid)(void);
    
    NSString *(^composeName)(NSString *firstName, NSString *lastName);
}

-(void)example2 {
    int (^firstBlock)(NSString *, int);
    
    void (^showName)(NSString *);
    
    NSDate *(^whatDayIsIt)(void);
    
    void (^allVoid)(void);
    
    NSString *(^composeName)(NSString *, NSString *);
}

// example 1 & example 2 - is equal!

-(void)example3 {
    
    int (^howMany)(int, int) = ^(int a, int b) {
        return a + b;
    };
    
    void (^justAMessage)(NSString *) = ^(NSString *str) {
        NSLog(@"%@", str);
    };
    
    
}


@end
