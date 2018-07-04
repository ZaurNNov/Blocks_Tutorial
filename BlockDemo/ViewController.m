//
//  ViewController.m
//  BlockDemo
//
//  Created by Zaur Giyasov on 06/06/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "ViewController.h"
#import "ArrayGame.h"
#import "Blocks.h"


//// Односвязный список
//typedef struct Node {
//    int value;
//    char *name;
//    struct Node *nextNode;
//} Node;

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
    
    // void with __block variable
    [self testBlockStorageType]; // Output: 25
    
    // void with comletionHandler
    [self example4]; // Output: The result is: x
    
    // void with GCD
    [self voidGCD];
     */
    
    // void C Lang
    [self cLanguageFirst];
    [self cLanguageSecond];
    
    // void with array game
    ArrayGame *ag = [[ArrayGame alloc] init];
    [ag arrayGames];
    
    [self cLanguageRevers];
    [self testStringReverse];
    
    Blocks *b = [[Blocks alloc] init];
    [b exampleOne];
    
    pause();
}

-(void)cLanguageRevers {
    //
    // вывести количество цифр в числе
    int d = 354986175;
    printf("\n");
    printf("вывести количество цифр в числе: %d\n", d);
    printf("перевернуть (реверс) числа: %d\n", d);
    
    
    // перевод числа в строку
    NSString *digitString = [NSString stringWithFormat:@"%d", d];
    NSLog(@"%@ - as string", digitString);
    NSInteger lenght = [digitString length];
    NSLog(@"%d = %ld digit", d, (long)lenght);
    
    NSMutableString *reversed = [digitString mutableCopy];
    
    // reverse 2 digit = first and last, second and pre last etc
    for (NSInteger i = 0 ; i < lenght / 2; i++) {
        
        // temp character
        unichar first = [reversed characterAtIndex:i];
        
        // 1 character range
        NSRange endRange = NSMakeRange(lenght - i - 1, 1); // last character
        NSRange beginRange = NSMakeRange(i, 1); // first character
        
        // Replace the first character ('h') with the last character ('i')
        [reversed replaceCharactersInRange:beginRange
                                withString:[reversed substringWithRange:endRange]]; // first = last
        
        // Replace the last character ('i') with the stored first character ('h)
        [reversed replaceCharactersInRange:endRange withString:[NSString stringWithFormat:@"%c", first]]; // last == first(temp)
    }
    
    NSLog(@"%@ - reverse string", reversed);
    NSNumber *reverseNumber = @([reversed intValue]);
    NSLog(@"%d - reverse digit", [reverseNumber intValue]);
}

-(void)testStringReverse {
    NSString* str = @"Methods to convert NSString to a NULL-terminated cString using the specified encoding. Note, these are the \"new\" cString methods, and are not deprecated like the older cString methods which do not take encoding arguments.  Also, cString methods should be used just with 8-bit encodings, and not encodings such as UTF-16 or UTF-32.  For those, use methods such as getCharacters:range: (for UTF-16 characters in system endianness) or getBytes:... (which can take any encoding). - (nullable const char *)cStringUsingEncoding:(NSStringEncoding)encoding NS_RETURNS_INNER_POINTER; \"Autoreleased\"; NULL return if encoding conversion not possible; for performance reasons, lifetime of this should not be considered longer than the lifetime of the receiving string (if the receiver string is freed, this might go invalid then, before the end of the autorelease scope). Use only with 8-bit encodings, and not encodings such as UTF-16 or UTF-32. - (BOOL)getCString:(char *)buffer maxLength:(NSUInteger)maxBufferCount encoding:(NSStringEncoding)encoding; NO return if conversion not possible due to encoding errors or too small of a buffer. The buffer should include room for maxBufferCount bytes; this number should accomodate the expected size of the return value plus the NULL termination character, which this method adds. (So note that the maxLength passed to this method is one more than the one you would have passed to the deprecated getCString:maxLength:.) Use only with 8-bit encodings, and not encodings such as UTF-16 or UTF-32. Use this to convert string section at a time into a fixed-size buffer, without any allocations.  Does not NULL-terminate. buffer is the buffer to write to; if NULL, this method can be used to computed size of needed buffer. maxBufferCount is the length of the buffer in bytes. It's a good idea to make sure this is at least enough to hold one character's worth of conversion. usedBufferCount is the length of the buffer used up by the current conversion. Can be NULL. encoding is the encoding to convert to. options specifies the options to apply. range is the range to convert. leftOver is the remaining range. Can be NULL. YES return indicates some characters were converted. Conversion might usually stop when the buffer fills, but it might also stop when the conversion isn't possible due to the chosen encoding.";
//    NSString* str = @"Objective-C is a object-oriented programming language";
//    NSString* str = @"1234567890";
    NSLog(@"REV 1: %@", [self reverseString:str]);
    printf("\n");
    NSLog(@"REV 2: %@", [self reverseString2:str]);
    printf("\n");
}

-(NSString*)reverseString:(NSString *)str
{
    NSMutableString* reversed = [NSMutableString stringWithCapacity:str.length];
    for (int i = (int)str.length-1; i >= 0; i--){
        [reversed appendFormat:@"%c", [str characterAtIndex:i]];
    }
    return reversed;
}

/*
-(NSString*)reverseString2:(NSString *)str
{
    char *cstr = (char *)[str UTF8String];
    uint len = (int)str.length;
    for (uint i = 0, s = len-1; i < len/2; i++, s--) {
        char buf = cstr[i];
        cstr[i] = cstr[s];
        cstr[s] = buf;
    }
    return [[NSString alloc] initWithBytes:cstr length:len encoding:NSUTF8StringEncoding];
}
 */

-(NSString*)reverseString2:(NSString *)str
{
    NSInteger lenght = [str length];
    NSMutableString *reversed = [str mutableCopy];
    
    // reverse 2 digit = first and last, second and pre last etc
    for (NSInteger i = 0 ; i < lenght / 2; i++) {
        
        // temp character
        unichar first = [reversed characterAtIndex:i];
        
        // 1 character range
        NSRange endRange = NSMakeRange(lenght - i - 1, 1); // last character
        NSRange beginRange = NSMakeRange(i, 1); // first character
        
        // Replace the first character ('h') with the last character ('i')
        [reversed replaceCharactersInRange:beginRange
                                withString:[reversed substringWithRange:endRange]]; // first = last
        
        // Replace the last character ('i') with the stored first character ('h)
        [reversed replaceCharactersInRange:endRange withString:[NSString stringWithFormat:@"%c", first]]; // last == first(temp)
    }
    return reversed;
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
    
    //
    // вывести количество цифр в числе
    // вывести массив с элементами числа по порядку (по 1 цифре в массиве)
    // вывести этот же массив в обратном порядке
    
    int num = 9583896; //число до 9 включая
    
    printf("Заданное число: %d\n", num);
    
    // решение
    
    int arrr1[50];
    int idig = 0;
    int temp = num;
    
    while (num > 0) {
        arrr1[idig] = num % 10;
        num = num / 10;
        idig++;
    }
    num = temp;
    const int count = idig;
    // теперь мы знаем из скольки цифр число (idig)
    // есть массив в котором цифры числа идут в обратном порядке (arr1)
    
    printf("Количество цифр в числе = %d\n", count);
    
    // первые числа массива
    printf("первые числа массива: ");
    for (int i=0; i<count+count; i++) printf("%d ",arrr1[i]);
    printf("\n");
    
    // Создание пустого массива и наполнение его первыми элементами по количеству цифр (idig)
    printf("Создание пустого массива и наполнение его первыми элементами по количеству цифр...");
    int arrr2[count];
    for (int i=0; i<count; i++) arrr2[i] = arrr1[i];
    printf("\n");
    
    // вывод на печать нового массива
    printf("Вывод на печать нового массива: ");
    for (int i=0; i<count; i++) printf("%d ",arrr2[i]);
    printf("\n");
    
    // Обратная сортировка массива
    printf("Обратная сортировка (реверс) нового массива...");
    int b; // буфер значения
    
    for (int i = 0; i < count/2; i++) {
        b = arrr2[i];
        arrr2[i] = arrr2[count-i-1];
        arrr2[count-i-1] = b;
    }
    printf("\n");
    
    // вывод на печать нового массива
    printf("Вывод на печать реверс массива: ");
    for (int i=0; i<count; i++) printf("%d ",arrr2[i]);
    printf("\n");
    
    
    // сдвиг массива на 3 позиции влево (false = вправо)
    int mainArray[9] = {1,2,3,4,5,6,7,8,9};
    int countOfMoove = 3;
    bool mooveFeft = true; // "7 8 9 1 2 3 4 5 6" or "4 5 6 7 8 9 1 2 3"
    
    int countArray = 9;
    int boofer = 0;
    printf("Вывод на печать массива: ");
    for (int i=0; i<countArray; i++) printf("%d ",mainArray[i]);
    printf("\n");
    printf("сдвиг массива на 3 позиции (mooveFeft -> true/false = влево или вправо): \n");
    
    // например массив из 9 элементов [123456789]
    // хотим сдвинуть влево на 2 элемента в итогк должны получить [345678912]
    
    //[(12)(3456789)] // мысленно дели массив на 2 части (сначало число элементов на которое двигаем в той стороне куда двигаем)
    //[(21)(9876543)] // делаем реверс каждой части
    //[(219876543)] // мысленно соединяем что получилось и делаем реверс
    //[345678912] // получаем исходный массив со сдвигом влево на 2 элемента
    // метод работает в обоих направлениях
    
    // сдвиг
    if (mooveFeft) {
        
        for (int i = 0; i < countOfMoove/2; i++) {
            // реверс первой части массива
            boofer = mainArray[i];
            mainArray[i] = mainArray[countOfMoove - 1 - i];
            mainArray[countOfMoove - i - 1] = boofer;
        }
        printf("реверс первой части: ");
        for (int i=0; i<countArray; i++) printf("%d ",mainArray[i]);
        printf("\n");
        
        for (int i = countOfMoove, s = 0; s < (countArray-countOfMoove)/2; i++, s++) {
            // реверс второй части массива
            boofer = mainArray[i];
            mainArray[i] = mainArray[countArray - 1 - s];
            mainArray[countArray - 1 - s] = boofer;
        }
        printf("реверс второй части: ");
        for (int i=0; i<countArray; i++) printf("%d ",mainArray[i]);
        printf("\n");
        
    } else {

        for (int i = countArray-countOfMoove, s = 0; s < (countOfMoove)/2; i++, s++) {
            // реверс второй части массива
            boofer = mainArray[i];
            mainArray[i] = mainArray[countArray - 1 - s];
            mainArray[countArray - 1 - s] = boofer;
        }
        printf("реверс первой части: ");
        for (int i=0; i<countArray; i++) printf("%d ",mainArray[i]);
        printf("\n");
        
        for (int i = 0, s = 0; i < (countArray-countOfMoove)/2; i++, s++) {
            // реверс первой части массива
            boofer = mainArray[i];
            mainArray[i] = mainArray[countArray-countOfMoove - 1 - i];
            mainArray[countArray-countOfMoove - i - 1] = boofer;
        }
        printf("реверс второй части: ");
        for (int i=0; i<countArray; i++) printf("%d ",mainArray[i]);
        printf("\n");
    }
    // не зависимо от право/лево - реверс массива
    for (int i = 0; i < countArray / 2; i++) {
        // реверс массива
        boofer = mainArray[i];
        mainArray[i] = mainArray[countArray - 1 - i];
        mainArray[countArray - i - 1] = boofer;
    }
    
    printf("печать готового массива (реверс промежуточного результата): ");
    for (int i=0; i<countArray; i++) printf("%d ",mainArray[i]);
    printf("\n");
}


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

/*
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
 */

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


@end
