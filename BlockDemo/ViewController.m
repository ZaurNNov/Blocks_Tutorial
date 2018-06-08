//
//  ViewController.m
//  BlockDemo
//
//  Created by Zaur Giyasov on 06/06/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "ViewController.h"


// Односвязный список
typedef struct Node {
    int value;
    char *name;
    struct Node *nextNode;
} Node;

@interface ViewController ()

@property (nonatomic, strong) NSString *(^blockAsMemberVar)(void);

-(void)testBlockStorageType;
-(void)addNumber:(int)num1 withNumber:(int)num2 andComletionHandler:(void (^)(int result))comletionHandler;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

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
    
    // void with array game
    //[self arrayGames];
    
    // void C Lang
    //[self cLanguageFirst];
    [self cLanguageSecond];
    
    pause();
}



-(void)nodePractic {
    
    Node arrayOfNodes[10];
    // is equalIs struct Node arrayOfNodes[10];
    
    Node *arrayNode = malloc(10 * sizeof(struct Node));
    arrayNode[0] = arrayOfNodes[0];
    
    // Single node
    Node *E1 = malloc(sizeof(Node));
    Node *E2 = malloc(sizeof(Node));
    Node *E3 = malloc(sizeof(Node));
    Node *E4 = malloc(sizeof(Node));
    Node *E5 = malloc(sizeof(Node));
    
    // link for next
    E1->nextNode = E2;
    E2->nextNode = E3;
    E3->nextNode = E4;
    E4->nextNode = E5;
    
    // E5 next node nil
    Node *newE = malloc(sizeof(Node));
    
    // insert
    E2->nextNode = newE;
    newE->nextNode = E3;
    
    // развернуть список
    // третий на второй, второй на первый, первый в никуда, последний на предпоследний...
    
    E5->nextNode = E4;
    E4->nextNode = E3;
    
    // или
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

-(void)cLanguageSecond {
    /// char as digitals
    /*
    printf("\n\n/// char as digitals \n");
    char zero = '0';
    char two = '2';
    char five = 53;
    
    printf("char zero: %c, char zero: %d\n", zero, zero);
    printf("char two: %c, char two: %d\n", two, two);
    printf("result five - two: %d\n", five - two);
    printf("result(char) five + two: %d\n", five + two);
    printf("result(char + int) five + two: %d\n", five + 2);
    printf("result(int) five + two: %c\n", five + 2);
     */
    
    /*
    char arr1[20] = "Hello";
    char arr2[] = "Hello";
    char arr4[] = {'i', 'o', '\0'};
    char arr3 = "Hello"; // Not valid!
    
    char *arr45 = malloc(sizeof(char) * 10);
    arr45[0] = 'F';
    arr45[9] = '\0';
    
    free(arr45);
    
    int arr1Lenght = sizeof(arr1);
    int arr1StringLenght = strlen(arr1);
    
    int arr2Lenght = sizeof(arr2);
    int arr2StringLenght = strlen(arr2);
    
    printf("char arr1[20] = \"Hello\" : %d\n", arr1Lenght);
    printf("%d\n", arr1StringLenght);
    printf("char arr2[] = \"Hello\" : %d\n", arr2Lenght);
    printf("%d\n", arr2StringLenght);
     
     */
    
    
    //
    // вывести количество цифр в числе
    // вывести массив с элементами числа по порядку (по 1 цифре в массиве)
    // вывести этот же массив в обратном порядке
    
    int num = 9583896; //число до 9 включая
    
    printf("digit: %d\n", num);
    
    // решение
    
    int arr1[50];
    int idig = 0;
    int arrX[] = {num};
    int temp = num;
    
    while (num > 0) {
        arr1[idig] = num % 10;
        num = num / 10;
        idig++;
    }
    num = temp;
    
    // теперь мы знаем из скольки цифр число (idig)
    // есть массив в котором цифры числа идут в обратном порядке (arr1)
    // есть массив с одим числом (изначально заданное) - arrX[]
    
    printf("count digits idig = %d\n", idig);
    printf("digits: %d\n", num);
    
    // Обратная сортировка массива
    //int * ;
    int *arr22 = (int *)malloc(idig * sizeof(int));
    
    char *arr2 = (char *)arr22;
    //int arr3[] = arr2;
    
    //int arr3[7];
    
    // arr2[idig-i] = arr1[i];
    
    arr2[6] = arr1[0];
    arr2[5] = arr1[1];
    arr2[4] = arr1[2];
    arr2[3] = arr1[3];
    arr2[2] = arr1[4];
    arr2[1] = arr1[5];
    arr2[0] = arr1[6];
    
    int arr4[4];// = arr22;
    int arrr[4];
    
//    arr2[idig-1-0] = arr1[0];
//    arr2[idig-1-1] = arr1[1];
//    arr2[idig-1-1] = arr1[2];
//    arr2[idig-1-3] = arr1[3];
//    arr2[idig-1-4] = arr1[4];
//    arr2[idig-1-5] = arr1[5];
//    arr2[idig-1-6] = arr1[6];
    
    
//    for (int i = 0; i < idig; i++) {
//        arr2[idig-i] = arr1[i];
//    }
    
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
