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

-(void)testBlockStorageType;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    _blockAsMemberVar = ^(void) {
        return @"This block is declared as a member variable!";
    };
    
    
    // 1
    int (^howMany)(int, int) = ^(int a, int b) {
        return a + b;
    };
    
    // 2
    NSLog(@"%d", howmany(5, 10));
    
    NSDate *(^today)(void);
    today = ^(void) {
        return [NSDate date];
    };
    
    NSLog(@"%@", today());  // Output: Wed Jun  6 14:40:02 2018
    
    // 3
    float results = ^(float val1, float val2, float val3) {
        return val1 * val2 * val3;
    } (1.2 , 3.4, 5.6); // Output: 22.848001
    
    NSLog(@"%f", results);
    
    // 4
    int factor = 5;
    int (^newResult)(void) = ^(void) {
        return factor *10;
    };
    
    NSLog(@"%d, %d", factor, newResult); // Output: 5, 2421984 (second value must be differet)
    // problem way!
    
    
    [self testBlockStorageType];
    
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

-(void)testBlockStorageType  {
    __block int someValue = 10;
    //int someValue = 10;
    
    int (^myOperation)(void) = ^(void) {
        someValue += 5;
        
        return someValue + 10;
    };
    
    //NSLog(@"%d", someValue);
    NSLog(@"%d", myOperation()); // Output: 25
}


@end
