//
//  FISTicTacToeGame.m
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISTicTacToeGame.h"

@interface FISTicTacToeGame ()

@property (nonatomic, strong) NSMutableArray *board;


@end


@implementation FISTicTacToeGame

-(instancetype)init
{
    self = [super init];
    if(self) {
        [self resetBoard]; //defining method resetBoard.
    
        // Do initialization of your game here, inside this if statement.
        // Leave the rest of this method alone :)

    }

    return self;
}

-(void)resetBoard

{
    
   self.board = [@[
                            [@[@"", @"", @"" ] mutableCopy],
                            [@[ @"", @"", @"" ] mutableCopy],
                            [@[ @"", @"", @"" ] mutableCopy]] mutableCopy];
   
}

-(NSString *)playerAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    NSLog(@"%lu,%lu", column, row);
    NSLog(@"board: %@", self.board[column][row]);
    
    NSString *playerOne = self.board [column][row];
    
    return playerOne;
}

-(BOOL)canPlayAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    return YES;
}

-(void)playXAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    NSString *xPiece = @"X";
    self.board[column][row] = xPiece;
}

-(void)playOAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    NSString *oPiece = @"O";
    self.board[column][row] = oPiece;
}

-(NSString *)winningPlayer
{

    if ([self.board [0][0] isEqualToString:self.board [0][1]] && [self.board [0][1] isEqualToString:self.board [0][2]]) {
        return self.board[0][0];
    }
    
    if ([self.board [0][1] isEqualToString:self.board [1][1]] && [self.board [1][1] isEqualToString:self.board [2][1]]) {
        return self.board[0][1];
    }
    
    if ([self.board [0][0] isEqualToString:self.board [1][0]] && [self.board [1][0] isEqualToString:self.board [2][2]]) {
            return self.board[0][0];
    }
    
    if ([self.board [0][2] isEqualToString:self.board [1][2]] && [self.board [1][2] isEqualToString:self.board [2][2]]) {
        return self.board[0][2];
    }
    
    if ([self.board [0][0] isEqualToString:self.board [1][1]] && [self.board [1][1] isEqualToString:self.board [2][2]]) {
        return self.board[0][0];
    }
    
    if ([self.board [0][2] isEqualToString:self.board [1][1]] && [self.board [1][1] isEqualToString:self.board [2][0]]) {
        return self.board[0][2];
    }
    
    if ([self.board [0][0] isEqualToString:self.board [0][1]] && [self.board [0][1] isEqualToString:self.board [0][2]]) {
        return self.board[0][0];
    }
    
    if ([self.board [1][0] isEqualToString:self.board [1][1]] && [self.board [1][1] isEqualToString:self.board [1][2]]) {
        return self.board[1][0];
    }
    if ([self.board [2][0] isEqualToString:self.board [2][1]] && [self.board [2][1] isEqualToString:self.board [2][2]]) {
        return self.board[0][0];
    }
    return @"";
}

-(BOOL)isADraw
{
    
    BOOL boardIsFull = YES;
    
    for (NSArray *rows in self.board) {
        if([ rows containsObject:@""] ){
            boardIsFull = NO;
        }
    }
    
    
    if ([[self winningPlayer] isEqualToString:@""] && boardIsFull == YES) {
        
        return YES;
        
    }
    return NO;
}

@end
