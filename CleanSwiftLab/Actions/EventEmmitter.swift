//
//  EventEmmitter.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 5/31/20.
//  Copyright © 2020 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation

enum EventActionType {
    case openHero(id: String)
}

protocol EventEmmiterProtocol: AnyObject {
    func emmit(event: EventActionType)
}

protocol EventEmmiterDelegate: AnyObject {
    func listener(event: EventActionType)
}

class EventEmmiter: NSObject, EventEmmiterProtocol {
    
    weak var delegate: EventEmmiterDelegate?
   
    func emmit(event: EventActionType) {
        delegate?.listener(event: event)
    }
}
