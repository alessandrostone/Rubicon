//
//  Token.swift
//  Rubicon
//
//  Created by Kryštof Matěj on 20/04/2017.
//  Copyright © 2017 Kryštof Matěj. All rights reserved.
//

public enum Token {
    case identifier(name: String)
    case `protocol`
    case leftCurlyBracket
    case rightCurlyBracket
    case leftBracket
    case rightBracket
    case colon
    case comma
    case questionMark
    case equal
    case variable
    case constant
    case get
    case set
    case function
}

extension Token: Equatable {
    public static func ==(lhs: Token, rhs: Token) -> Bool {

        switch (lhs, rhs) {
        case (.identifier(let name1), .identifier(let name2)) :
            return name1 == name2
        case (.protocol, .protocol):
            return true
        case (.leftCurlyBracket, .leftCurlyBracket):
            return true
        case (.rightCurlyBracket, .rightCurlyBracket):
            return true
        case (.leftBracket, .leftBracket):
            return true
        case (.rightBracket, .rightBracket):
            return true
        case (.colon, .colon):
            return true
        case (.comma, .comma):
            return true
        case (.questionMark, .questionMark):
            return true
        case (.equal, .equal):
            return true
        case (.variable, .variable):
            return true
        case (.constant, .constant):
            return true
        case (.get, .get):
            return true
        case (.set, .set):
            return true
        case (.function, .function):
            return true
        default:
            return false
        }

    }
}
