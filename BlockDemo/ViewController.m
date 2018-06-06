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
-(void)addNumber:(int)num1 withNumber:(int)num2 andComletionHandler:(void (^)(int result))comletionHandler;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // void with different blocks
    [self differentExamples];
    // Outputs:
    //BlockDemo[9426:851934] 1
    //BlockDemo[9426:851934] Wed Jun  6 23:21:24 2018
    //BlockDemo[9426:851934] 22.848001
    //BlockDemo[9426:851934] 5, 2372256
    
    // void with __block variable
    [self testBlockStorageType]; // Output: 25
    
    // void with comletionHandler
    [self example4]; // Output: The result is: x
    
    // void with GCD
    [self voidGCD];
    // Outputs:
    //BlockDemo[10774:964735] This is N1 thread!
    //Preparing to run code in other thread...
    //BlockDemo[10774:964735] This is N1 thread, again!
    //BlockDemo[10774:964788] Run other thread...
    //BlockDemo[10774:964788] thread work...
    //Example: value = 0, after work value = 49500000
    
}


// A block declaration follows the next syntax pattern:
/// ReturnType (^blockName)(Parameters)
/*
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
*/

/*
-(void)example3 {
    
    int (^howMany)(int, int) = ^(int a, int b) {
        return a + b;
    };
    
    void (^justAMessage)(NSString *) = ^(NSString *str) {
        NSLog(@"%@", str);
    };
}
*/

-(void)differentExamples {
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

// Here is the declaration pattern of a method which contains a completion handler to make callbacks:

/// -(returnType)methodNameWithParams:(parameterType)parameterName ...<more params>... andCompletionHandler:(void(^)(<any block params>))completionHandler;

-(void)addNumber:(int)num1 withNumber:(int)num2 andComletionHandler:(void (^)(int))comletionHandler {
    int result = num1 + num2;
    comletionHandler(result);
}

-(void)example4 {
    [self addNumber:8 withNumber:9 andComletionHandler:^(int result) {
        NSLog(@"The result is: %d", result); // Output: The result is: x
    }];
}

// GCD
-(void)voidGCD {
    
    NSLog(@"This is N1 thread!\nPreparing to run code in other thread...");
//    dispatch_queue_t myQoeue = dispatch_queue_create(@"My Queue", NULL); //name of queue must be "xxx" without '@'
    dispatch_queue_t myQueue = dispatch_queue_create("My Queue", NULL);
    
    dispatch_async(myQueue, ^{
        NSLog(@"Run other thread...");
        
        // some work
        int value = 0;
        for (int i = 0; i < 100; i++) {
            for (int j = 0; j < 100; j++) {
                for (int s = 0; s < 100; s++) {
                    value += i;
                }
            }
        }
        NSLog(@"thread work...\nExample: value = 0, after work value = %d\n\n", value);
    });
    
    NSLog(@"This is N1 thread, again!");
    
}


@end
