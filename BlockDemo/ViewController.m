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

    // void with array game
    //[self arrayGames];
    
    // void C Lang
    [self cLanguageFirst];
    
    /*
    
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
     
     */
    
}

-(void)cLanguageFirst {
    /// printf tab & fix
    printf("|555|\n|\t\t\t 555|\n|555\t\t\t|\n");
    printf("\n");
    printf("Words \t\t\t 59\n");
    printf("Words %13d\n", 59);
    
    printf("Letters \t\t %d\n", 1004);
    printf("Digits \t\t\t %d\n\n", 8);
    
    //по правому краю (Для выравнивания по левому краю перед числом ставится знак минус) (не получается)
    printf("Words %13-d\n", 59);
    
    printf("Letters \t\t %-d\n", 1004);
    printf("Digits \t\t\t %-d", 8);
    
    /// size
    printf("\n\n /// size\n");
    int i = 8;
    long long l = 8;
    short s = 8;
    char c = '8';
    bool b = true;
    bool b2 = false;
    printf("size i = %d\nsize l = %d\nsize s = %d\nsize c = %d\nsize b = %d\nsize b2 = %d", sizeof(i), sizeof(l), sizeof(s), sizeof(c), sizeof(b), sizeof(b2));
    
    /// chars
    printf("\n\n/// chars \n");
    char ch = 63;
    unsigned char uch = 'r';
    short j = 'b', k = 99;
    printf("%c == %d\n", ch, ch);
    printf("%c == %d\n", uch, uch);
    printf("\"short j = 'b', k = 99\": %c, %c", j, k);
    
    /// doobles
    printf("\n\n/// doobles \n");
    double a = 0.0005;
    printf("%f\n", a);
    printf("%g\n", 0.0005);
    printf("%g\n", 0.00005);
    printf("%e\n", 0.0005);
    
    printf("%.2f\n", 0.2398);
    printf("%10.2f", 0.2398);
    
    /// arrays
    printf("\n\n/// arrays \n");
    //#define N 10
    int N = 10;
    int arr[5], nums[N];
    float f_arr[100];
    char str[80];
    
    char vol[] = {'a', 'e', 'i', 'o', 'u', 'y'};
    float f_arr2[6];
    
    f_arr2[0] = 25.3;
    f_arr2[4] = 34.2;
    printf("\"vol[4], f_arr2[0]\": %c, %.2f\n", vol[4], f_arr2[0]);
    
    /// strings
     printf("\n\n/// strings \n");
    char string1[] = {'z', 'a', 'u', 'r', 'n', 'n', '\0'};
    // is equal (string1[] == string2[])
    char string2[] = "zaurnn";
    
    printf("%s = size = %d\n", string1, sizeof(string1));
    printf("%s = size = %d\n", string2, sizeof(string2));
    
}

-(void)arrayGames {

    int numberOfElements = 10;
    int array[numberOfElements];
    char *str = "Hello world!";
    
    array[0] = 87;
    array[1] = 8;
    array[2] = 1;
    array[3] = 153;
    array[4] = 3;
    array[5] = 613;
    array[6] = 4;
    array[7] = 44;
    array[8] = 4;
    array[9] = 4;
    
    for (int i = 0; i < numberOfElements; i++) {
        printf("Array[numberOfElements] : element %d = %d\n", i, array[i]);
    }
    
    int temp[1];
    int sortTemp[numberOfElements];
    for (int i = 0; i < numberOfElements; i++) {
        
        
    }
    
    //    array[0] = 'H';
    //    array[1] = 'e';
    //    array[2] = 'l';
    //    array[3] = 'l';
    //    array[4] = 'o';
    //    array[5] = 'w';
    //    array[6] = 'o';
    //    array[7] = 'r';
    //    array[8] = 'l';
    //    array[9] = '\0';
    
    

    
    for (int i = 0; i < 13; i++) {
        printf("element %d = %c\n", i, str[i]);
    }
    
    printf("%s\n", str);
    
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
