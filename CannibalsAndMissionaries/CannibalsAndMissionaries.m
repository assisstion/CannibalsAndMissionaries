//
//  CannibalsAndMissionaries.m
//  CannibalsAndMissionaries
//
//  Created by Markus Feng on 12/14/15.
//  Copyright © 2015 Markus Feng. All rights reserved.
//

#import "CannibalsAndMissionaries.h"
#import "Queue.h"
#import "Graph.h"

@implementation CannibalsAndMissionaries

-(NSArray <NSString *> *) getSolution: (CannibalMissionaryState *) begin toTarget:(CannibalMissionaryState *)target
                             boatSize:(int)boatsize{
    
    Graph * graph = [[Graph alloc] init];
    Queue * queue = [[Queue alloc] init];
    [queue enqueue:begin];
    [graph addVertex:[begin stringRepresentation]];
    Vertex * finalVertex = nil;
    while(![queue isEmpty]){
        CannibalMissionaryState * state = (CannibalMissionaryState *)[queue dequeue];
        for(int cannibals = 0; cannibals <= boatsize; cannibals ++){
            for(int missionaries = 0; missionaries <= boatsize - cannibals; missionaries++){
                if(missionaries == 0 && cannibals == 0){
                    continue;
                }
                for(int left = 0; left < 2; left++){
                    CannibalMissionaryState * newState = [state modifyFromLeft:left==0 missionaries:missionaries cannibals:cannibals];
                    if(newState == nil){
                        continue;
                    }
                    if([graph contains:[newState stringRepresentation]]){
                        continue;
                    }
                    [graph addConnection:[state stringRepresentation] with:[newState stringRepresentation]];
                    [graph getVertex:[newState stringRepresentation]].predecessor = [graph getVertex:[state stringRepresentation]];
                    [queue enqueue:newState];
                    if([[newState stringRepresentation] isEqualToString:[target stringRepresentation]]){
                        finalVertex = [graph getVertex:[newState stringRepresentation]];
                        goto outer;
                    }
                }
            }
        }
        
        
    }
outer:
    if(finalVertex == nil){
        return nil;
    }
    NSMutableArray <NSString *> * mutable = [[NSMutableArray alloc] init];
    Vertex * current = finalVertex;
    
    while(current != nil){
        [mutable insertObject:current.value atIndex:0];
        current = current.predecessor;
    }
    return mutable;
}

@end
