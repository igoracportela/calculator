//
//  CalculatorBrain.m
//  Example Calculator
//
//  Created by Igor Amorim on 14/07/12.
//  Copyright (c) 2012 IFPB. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation CalculatorBrain
@synthesize operandStack = _operandStack;

- (NSMutableArray *) operandStack{
    if (!_operandStack) {
        _operandStack = [[NSMutableArray alloc] init];
    }
    return _operandStack;
}

- (void) setOperandStack:(NSMutableArray *)array{
    _operandStack = array;
}

- (void)pushOperand:(double)operand{
    NSNumber *operandObject = [NSNumber numberWithDouble:operand];
    [self.operandStack addObject:operandObject];
}

- (double) popOperand{
    NSNumber *operandObject = [self.operandStack lastObject];
    if (operandObject) [self.operandStack removeLastObject];
    return [operandObject doubleValue];
}

- (double)performOperation:(NSString *)operand{
    double result = 0;
    
    if ([operand isEqualToString:@"+"]) {
        result = [self popOperand] + [self popOperand]; 
    } else if ([operand isEqualToString:@"*"]) {
        result = [self popOperand] * [self popOperand];
    } else if ([operand isEqualToString:@"-"]) {
        double subtrahend = [self popOperand];
        result = [self popOperand] - subtrahend;
    } else if ([operand isEqualToString:@"/"]) {
        double divisor = [self popOperand];
        if (divisor) result = [self popOperand] / divisor;
    }
    
    [self pushOperand:result];
    
    return result;
}

@end