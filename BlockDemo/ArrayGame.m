//
//  ArrayGame.m
//  BlockDemo
//
//  Created by Zaur Giyasov on 13/06/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "ArrayGame.h"

@implementation ArrayGame

-(void)arrayGames {
    
    const int numberOfElements = 10;
    const int countStr = 13;
    
    char *str = "Hello world!"; // count = 13
    int array[numberOfElements];
    
    printf("Имеем: \n");
    printf("Константа по числу элементов = %d\n", numberOfElements);
    printf("Константа элементов в си-строке = %d\n", countStr);
    printf("Cи-строкa = %s\n", str);
    printf("Новый пустой массив из %d элементов: ", numberOfElements);
    [self printCArray:array numberOfElement:numberOfElements asIntDigital:YES];
    printf("\n");
    
    // Произвольное наполнение массива
    printf("Произвольное наполнение массива\n");
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
    
    printf("Массив из %d элементов после заполнения: ", numberOfElements);
    [self printCArray:array numberOfElement:numberOfElements asIntDigital:YES];
    
    
    // Задачи
    printf("\n\nЗадачи:\n");
    // 1
    // Создать массив из строки
    printf("1 Создать массив из строки:\n");
    printf("Новый массив из константы по числу элементов в стороке\n");
    int stringArray[countStr];
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
    printf("Заполнение массива и вывод на печать: \n");
    for (int i = 0; i < countStr; i++) {
        stringArray[i] = str[i];
    }
    // вывод на печать нового массива
    [self printCArray:stringArray numberOfElement:countStr asIntDigital:NO];
    
    
    // 2
    printf("\n2 Создать реверс массив из имеющегося:\n");
    printf("Исходный массив:\n");
    [self printCArray:array numberOfElement:numberOfElements asIntDigital:YES];
    printf("\n");
    printf("Реверс массив:\n");
    // Создать массив
    int reverseTemp[numberOfElements];
    // Копируем значения из старого (чтоб сохранить старый)
    [self copyCArray:array numberOfElement:numberOfElements toNewArray:reverseTemp];
    
    int b; // буфер значения
           // меняем местами первый и последний элент, потом второй и предпоследний - парами!
           // если четно - то пары, если не четно - средний остается как есть
    for (int i = 0; i < numberOfElements/2; i++) {
        b = reverseTemp[i];
        reverseTemp[i] = reverseTemp[numberOfElements-i-1];
        reverseTemp[numberOfElements-i-1] = b;
    }
    // вывод на печать нового массива (реверс)
    [self printCArray:reverseTemp numberOfElement:numberOfElements asIntDigital:YES];
    printf("\n");
    
    
    
    // 3
    printf("\n3 Создать отсортированный (по возрастанию) массив из имеющегося:\n");
    printf("Исходный массив:\n");
    [self printCArray:array numberOfElement:numberOfElements asIntDigital:YES];
    printf("\n");
    printf("Сортированный массив:\n");
    // создание нового массива (копия)
    int sortTemp[numberOfElements];
    [self copyCArray:array numberOfElement:numberOfElements toNewArray:sortTemp];
    
    // сортировка выбором наибольшего элемента и перемещением его в конец
    // за каждый проход просмотр элементов на 1 меньше - так как наибольший уже ставится в конец
    int j = numberOfElements - 1;
    int ids; // индекс наибольшего
    int m; // буфер
    while (j > 0) {
        ids = 0;
        for (int i = 0; i <= j; i++) {
            if (sortTemp[i] > sortTemp[ids]) ids = i;
        }
        
        m = sortTemp[ids];
        sortTemp[ids] = sortTemp[j];
        sortTemp[j] = m;
        j -= 1;
    }
    
    // вывод нового отсортированного массива на печать
    [self printCArray:sortTemp numberOfElement:numberOfElements asIntDigital:YES];
    printf("\n");
    
    
    // 4
    printf("\n4 Создать сдвиг массиа на N элементов:\n");
    int sdvig1Temp[numberOfElements] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    int sdvig2Temp[numberOfElements];
    [self copyCArray:sdvig1Temp numberOfElement:numberOfElements toNewArray:sdvig2Temp];
    printf("Исходный массив:\n");
    [self printCArray:sdvig1Temp numberOfElement:numberOfElements asIntDigital:YES];
    printf("\n");
    
    /////////////
    // деление массва на 2 части
    // (1 2 3 4 5 6 7 8 9 0)
    // (1 2)(3 4 5 6 7 8 9 0)
    // реверс каждой части
    // (2 1)(0 9 8 7 6 5 4 3)
    // склейка и реверс всего что вышло
    // (3 4 5 6 7 8 9 0 1 2)
    /////////////
    
    // сдвиг влево на 4 элемента
    int sdvigNumber = 2;
    printf("сдвиг влево на %d элементов \n", sdvigNumber);
    
    int d = 0; // буфер
    int c1 = numberOfElements - sdvigNumber; // 10-4 = 6
    
    // реверс первой части
    for (int l = 0; l < sdvigNumber/2; l++) {
        d = sdvig1Temp[l];
        sdvig1Temp[l] = sdvig1Temp[sdvigNumber-l-1];
        sdvig1Temp[sdvigNumber-l-1] = d;
    }
    //printf("реверс первой части: \n");
    //[self printCArray:sdvig1Temp numberOfElement:numberOfElements asIntDigital:YES];
    //printf("\n");
    
    // реверс второй часчти
    for (int l = sdvigNumber, s = 0; s < c1/2; l++, s++) {
        d = sdvig1Temp[l];
        sdvig1Temp[l] = sdvig1Temp[numberOfElements-s-1];
        sdvig1Temp[numberOfElements-s-1] = d;
    }
    //printf("реверс второй части: \n");
    //[self printCArray:sdvig1Temp numberOfElement:numberOfElements asIntDigital:YES];
    //printf("\n");
    
    // реверс полного массива
    for (int l = 0; l < numberOfElements/2; l++) {
        d = sdvig1Temp[l];
        sdvig1Temp[l] = sdvig1Temp[numberOfElements-l-1];
        sdvig1Temp[numberOfElements-l-1] = d;
    }
    
    // вывод нового отсортированного массива на печать
    //printf("вывод массива со сдвигом на %d шагов: \n", sdvigNumber);
    [self printCArray:sdvig1Temp numberOfElement:numberOfElements asIntDigital:YES];
    printf("\n\n");
    
    
    printf("Исходный массив:\n");
    [self printCArray:sdvig2Temp numberOfElement:numberOfElements asIntDigital:YES];
    printf("\n");
    
    // сдвиг влево на 4 элемента
    sdvigNumber = 2;
    printf("сдвиг вправо на %d элементов \n", sdvigNumber);
    // новый
    c1 = numberOfElements - sdvigNumber; // 10-4 = 6
    
    // реверс первой части
    for (int l = c1, s = 0; s < sdvigNumber/2; l++, s++) {
        d = sdvig2Temp[l];
        sdvig2Temp[l] = sdvig2Temp[numberOfElements-s-1];
        sdvig2Temp[numberOfElements-s-1] = d;
    }
    //    printf("реверс первой части: \n");
    //    [self printCArray:sdvig2Temp numberOfElement:numberOfElements asIntDigital:YES];
    //    printf("\n");
    
    // реверс второй часчти
    for (int l = 0, s = 0; s < c1/2; l++, s++) {
        d = sdvig2Temp[l];
        sdvig2Temp[l] = sdvig2Temp[c1-s-1];
        sdvig2Temp[c1-s-1] = d;
    }
    //    printf("реверс второй части: \n");
    //    [self printCArray:sdvig2Temp numberOfElement:numberOfElements asIntDigital:YES];
    //    printf("\n");
    
    // реверс полного массива
    for (int l = 0; l < numberOfElements/2; l++) {
        d = sdvig2Temp[l];
        sdvig2Temp[l] = sdvig2Temp[numberOfElements-l-1];
        sdvig2Temp[numberOfElements-l-1] = d;
    }
    // вывод нового отсортированного массива на печать
    //printf("вывод массива со сдвигом на %d шагов: \n", sdvigNumber);
    [self printCArray:sdvig2Temp numberOfElement:numberOfElements asIntDigital:YES];
    printf("\n\n");
    
//    // Блок и массивы
//    printf("вывод массива на печать");
//    [self printCArray:sdvig2Temp numberOfElement:numberOfElements asIntDigital:YES];
//    printf("\n");
    
}

// Слишком часто, поэтому вывел через метод
// печать си массива
-(void)printCArray:(int *)arr numberOfElement:(int)num asIntDigital:(BOOL)digital
{
    if (digital) {
        for (int i = 0; i < num; i++) printf("%d ",arr[i]);
    } else {
        for (int i = 0; i < num; i++) printf("%s \n",&arr[i]);
    }
}

// копия си массива
-(void)copyCArray:(int *)arr numberOfElement:(int)num toNewArray:(int *)newArr
{
    for (int i = 0; i < num; i++) newArr[i] = arr[i];
}


@end
