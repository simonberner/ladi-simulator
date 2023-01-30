//
//  GameSimulatorDelegate.swift
//  LADISimulator
//
//  Created by Simon Berner on 30.01.23.
//

import Foundation

// By conforming to AnyObject here, we say that our protocol can only be implemented by reference types (classes)!
// (see https://www.avanderlee.com/swift/anyobject-any/#when-to-use-anyobject)
// (another example https://www.swiftbysundell.com/articles/delegation-in-swift/#protocols)
protocol GameSimulatorDelegate: AnyObject {
    func didUpdate(gameState: GameState)
    func didCompleteGame()
}
