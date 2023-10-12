//
//  UserDefaultPropertyWrapper.swift
//  block
//
//  Created by Daniel Ferrer on 5/10/23.
//

import Foundation
import Combine

@propertyWrapper
struct UserDefault<Value> {
    
    let key: UserDefaultKeysEnum
    let defaultValue: Value
    var container: UserDefaults = .standard
    private let publisher = PassthroughSubject<Value, Never>()
    
    var wrappedValue: Value {
        get {
            return container.object(forKey: key.rawValue) as? Value ?? defaultValue
        }
        set {
            container.set(newValue, forKey: key.rawValue)
            publisher.send(newValue)
        }
    }
    
    var projectedValue: AnyPublisher<Value, Never> {
        return publisher.eraseToAnyPublisher()
    }
    
}


@propertyWrapper
struct MaxScore {
    
    var key: UserDefaultKeysEnum
    @UserDefault var maxScore: Int
    
    public init(key: UserDefaultKeysEnum) {
        self.key = key
        self._maxScore = UserDefault(key: key, defaultValue: 0)
    }
    
    var wrappedValue: Int {
        get {
            return maxScore
        }
        set {
            if newValue > maxScore {
                maxScore = newValue
            }
        }
    }
    
    var projectedValue: AnyPublisher<Int, Never> {
        return $maxScore
    }
    
}
