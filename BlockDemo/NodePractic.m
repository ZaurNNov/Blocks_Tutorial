//
//  NodePractic.m
//  BlockDemo
//
//  Created by Zaur Giyasov on 08/06/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "NodePractic.h"

// Односвязный список
typedef struct Node {
    int value;
    char *name;
    struct Node *nextNode;
} Node;


@implementation NodePractic

-(void) nodePractic {
    
    // нод укеазывающий на пустоту
    Node *head = NULL;
    
    // new node
    Node *temp = (Node *)malloc(sizeof(Node));
    temp->value = 10;
    temp->name = "temp";
    temp->nextNode = head;
    
    head = temp;
}


-(void) push:(Node **)head data:(int )data {
    Node *temp = (Node *) malloc(sizeof(Node));
    temp->value = data;
    temp->nextNode = (*head);
    (*head) = temp;
}

-(int) pop:(Node **)head {
    Node *prev = NULL;
    int val;
    
    if (head == NULL) {
        exit(1);
    }
    prev = (*head);
    val = prev->value;
    (*head) = (*head)->nextNode;
    free(prev);
    return val;
}

-(Node *) getNth:(Node *)head integer:(int)n {
    int counter = 0;
    while (counter < n && head) {
        head = head->nextNode;
        counter++;
    }
    return head;
}

-(Node *) getLast:(Node *)head {
    if (head == NULL) {
        return NULL;
    }
    while (head->nextNode) {
        head = head->nextNode;
    }
    return head;
}





@end
