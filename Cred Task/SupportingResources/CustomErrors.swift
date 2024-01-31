//
//  CustomErrors.swift
//  Cred Task
//
//  Created by Devesh Tyagi on 26/11/23.
//

import Foundation

enum InitializationError: Error {
    case invalidInput(message: String)

    var description: String {
        switch self {
        case .invalidInput(let message):
            return message
        }
    }
}
