//
//  Blocks.m
//  BlockDemo
//
//  Created by Zaur Giyasov on 03/07/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "Blocks.h"
#import <objc/runtime.h>

@interface TestClass :NSObject

@property (nonatomic, strong) void (^exampleStrongBlock)(void);
@property (nonatomic, weak) void (^exampleWeakBlock)(void);
@property (nonatomic, assign) void (^exampleAssignBlock)(void);


@end

@implementation TestClass

- (id)copy
{
    NSLog(@"sfsd");
    return nil;
}

@end


@implementation Blocks

-(void)exampleOne
{
    printf("\n");
    printf("Blocks:\n");
    
    printf("Синтаксис блока: \nВозвращаемый_тип (^Имя_блока)(Параметры_блокa)\n");
    printf("Тело блока: \nВозвращаемый_тип (^Имя_блока)(Параметры_блокa) = ^(параметры) {выражение/тело блока и работа с параметрами}; \n");
    printf("\n");
    
    //////////////////////////////////////////////////////////////////////
//    __block int mutableDigit = 10;
    int mutableDigit = 10;
    int a = 0;
    printf("temp digit = %d, target digit = %d\n", mutableDigit, a);
    
    // create block - return type 'int'
    int (^myBlock)(int) = ^(int num){
        return num + mutableDigit;
    }; // type of block = ?
    
    mutableDigit = 5;
    a = myBlock(5); // a = ?
    NSLog(@"[myBlock class] = %@\n", NSStringFromClass([myBlock class]));
    printf("target digit = %d\n", a);
    // [myBlock class] = __NSMallocBlock__
    
    //////////////////////////////////////////////////////////////////////

    id thisIsBlock = ^{
        int a = 555;
        printf("thisIsBlock. print local variable: %d", a);
    };
    
    NSLog(@"%@", thisIsBlock);
    
    NSLog(@"[thisIsBlock class] = %@\n", NSStringFromClass([thisIsBlock class]));
    // [thisIsBlock class] = __NSGlobalBlock__
    
    //////////////////////////////////////////////////////////////////////
    
    int b = 33;
    id thisIsBlock2 = ^{
        printf("thisIsBlock2");
        int c = b + b;
        NSLog(@"%d", c);
    };
    
    NSLog(@"[thisIsBlock2 class] = %@\n", NSStringFromClass([thisIsBlock2 class]));
    // [thisIsBlock2 class] = __NSMallocBlock__
    
    //////////////////////////////////////////////////////////////////////
    
    __block int e = 33;
    
    int (^thisIsBlock3)(int) = ^(int num) {
        [self aaaaaVoid];
        int s = [self aaaaaInt];
        return e + s;
    };
    
    int r = thisIsBlock3(10);
    
    NSLog(@"[thisIsBlock3 class] = %@\n", NSStringFromClass([thisIsBlock3 class]));
    //[thisIsBlock3 class] = __NSMallocBlock__
    
    //////////////////////////////////////////////////////////////////////
    
    int (^plusBlock)(int as, int sa) = ^(int a, int b) {
        return a + b;
    };
    
    int extA = 10;
    
    int (^plusPlusBlock)(int as, int sa) = ^(int a, int b) {
        return a + b + extA;
    };
    
    int notVariabl = 10;
    __block int variable = 20;
    NSMutableArray *arrs = [[NSMutableArray alloc] init];
//    __block NSMutableArray *arrs = [[NSMutableArray alloc] init]; // for usage this pointrer on block
    [arrs addObject:@"9gu8f5678"];
    [arrs addObject:@"ytfg978698"];
    
    for (int i = 0; i < arrs.count; i++) {
        NSLog(@"%@", arrs[i]);
    }
    
    int (^exampleVarBlock)(int as, int sa) = ^(int a, int b) {
        // notVariabl = a + b; // Variable is not assignable (missing __block type specifier)
        int d = variable;
        variable = a + b + notVariabl;
        [arrs addObject:@"array element from block object"];
        
        // point for check array elements
        [arrs removeAllObjects];
        
//         arrs = nil; // Variable is not assignable (missing __block type specifier)
        return d + variable;
    };
    

    
    int m = plusBlock(2, 2); // 2 + 2
    printf("%d\n", m);
    printf("%d\n", plusBlock(5, 5));
    NSLog(@"[plusBlock class] = %@\n", NSStringFromClass([plusBlock class]));
    
    extA = 100;
    int mm = plusPlusBlock(m, m);
    printf("%d\n", mm);
    NSLog(@"[plusPlusBlock class] = %@\n", NSStringFromClass([plusPlusBlock class]));
    
    [arrs addObject:@"array element before usage block"];
    for (int i = 0; i < arrs.count; i++) {
        NSLog(@"%@", arrs[i]);
    }
    
    variable = 100;
    int am = 0;
    printf("variable = %d, am = %d\n", variable, am);
    am = exampleVarBlock(notVariabl, notVariabl);
    printf("variable = %d, am = %d\n", variable, am);
    
    
    [arrs addObject:@"array element after usage block"];
    for (int i = 0; i < arrs.count; i++) {
        NSLog(@"%@", arrs[i]);
    }
    
    NSLog(@"[exampleVarBlock class] = %@\n", NSStringFromClass([exampleVarBlock class]));
    // [exampleVarBlock class] = __NSMallocBlock__
    
    //////////////////////////////////////////////////////////////////////
    int bb = 3;
    __weak void (^exampleVarBlock3)(void) = ^{
        // notVariabl = a + b; // Variable is not assignable (missing __block type specifier)

        //         arrs = nil; // Variable is not assignable (missing __block type specifier)
        int a = bb + 3;
    };
    
    Class class = [[^{
        int a = bb + 3;
    } copy] class];
    
    [exampleVarBlock3 class];
    
    
    Method method = class_getInstanceMethod([TestClass class], @selector(copy));
    IMP copyWithZone = method_getImplementation(method);
    const char *type = method_getTypeEncoding(method);
    Class nsblock = NSClassFromString(@"NSBlock");
    BOOL result = class_addMethod(nsblock, @selector(copyWithZone:), copyWithZone, type);
    
    
    
    TestClass *testObject = [TestClass new];
    
    
    testObject.exampleStrongBlock = ^{int a = bb + 3;
        NSLog(@"DBG exampleStrongBlock");
    };
    
    [testObject.exampleStrongBlock copy];
    
    testObject.exampleWeakBlock = ^{int a = bb + 4;
        NSLog(@"DBG exampleWeakBlock");
    };
    
    testObject.exampleAssignBlock = ^{int a = bb + 6;
        NSLog(@"DBG exampleAssignBlock");
    };
    
    
    int d = 8; // this line is pausa()
}

-(void)aaaaaVoid {
    int a = 0;
    a++;
    printf("%d", a);
}

-(int)aaaaaInt {
    int a = 0;
    a++;
    printf("%d", a);
    return a;
}

-(NSString *)aaaaaNSString {
    NSString *a = @"A";
    printf("%@", a);
    return a;
}



@end
