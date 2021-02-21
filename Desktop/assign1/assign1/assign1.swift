//
//  model.swift
//  assign1
//
//  Created by Naaima Qadeer on 2/14/21.
//

import Foundation

class Triples {
    init() {
        board = []
    }
    var board: [[Int]]
    var bool = false
    enum Direction {
        case up, down, right, left
    }
    // re-inits 'board', and any other state you define
    func newgame() {
        board = [[Int]](repeating: [Int](repeating: 0, count: 4), count: 4)
    }
    // rotate a square 2D Int array clockwise
    func rotate() {
        board = rotate2D(input: board)
    }
    // collapse to the left
    func shift() {
        for i in 0..<board.count {
            for j in 0..<board.count-1 {
                if !bool {
                    if board[i][j] == 2 {
                        if board[i][j+1] == 1 {
                            bool = true
                            board[i][j] += board[i][j+1]
                            for k in j+1..<board.count-1 {
                                board[i][k] = board[i][k+1]
                            }
                            board[i][board.count-1] = 0
                        }
                    } else if board[i][j] == 1 {
                        if board[i][j+1] == 2 {
                            bool = true
                            board[i][j] += board[i][j+1]
                                for k in j+1..<board.count-1 {
                                    board[i][k] = board[i][k+1]
                                }
                            board[i][board.count-1] = 0
                        }
                    } else if board[i][j] == 0 {
                        for k in j+1..<board.count {
                            board[i][k-1] = board[i][k]
                            bool = true
                        }
                        board[i][board.count-1] = 0
                    } else {
                        if board[i][j] == board[i][j+1] {
                            bool = true
                            board[i][j] += board[i][j+1]
                            if board.count > j+1 {
                                for k in j+1..<board.count-1 {
                                    board[i][k] = board[i][k+1]
                                }
                            }
                        board[i][board.count-1] = 0
                        }
                    }
                }
            }
            bool = false
        }
    }
    
    // collapse in specified direction using shift() and rotate()
    func collapse(dir: Direction) {
        switch dir {
        case .up:
            rotate()
            rotate()
            rotate()
            shift()
            rotate()
        case .down:
            rotate()
            shift()
            rotate()
            rotate()
            rotate()
        case .right:
            rotate()
            rotate()
            shift()
            rotate()
            rotate()
        case .left:
            shift()
        }
    }
}

public func rotate2DInts(input: [[Int]]) -> [[Int]] {
    var rot = [[Int]](repeating: [Int](repeating: 0, count: 4), count: 4)
    for i in 0..<input.count {
        for j in 0..<input.count {
            rot[i][j] = input[input.count - j - 1][i]
        }
    }
    return rot
}

//generic version of rotate
public func rotate2D<T>(input: [[T]]) -> [[T]] {
    var rotG = [[T]](repeating: [T](), count: 4)
    for i in 0..<input.count {
        for j in 0..<input.count {
            rotG[j].append(input[i][j])
        }
    }
    for k in 0..<input.count {
        rotG[k].reverse()
    }
    return rotG
}
