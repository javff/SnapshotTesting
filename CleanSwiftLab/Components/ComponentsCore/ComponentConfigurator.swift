//
//  ComponentConfigurator.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 1/2/20.
//  Copyright © 2020 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation
import UIKit

protocol ComponentConfiguratorProtocol {
    
    associatedtype ComponentModel
    associatedtype ComponentView: UIView
    
    func configure(_ view: ComponentView,
                   for model: ComponentModel)
}


protocol ComponentActionConfiguratorProtocol {
    
    associatedtype ComponentModel
    associatedtype ComponentView: UIView
    var eventEmmiter: EventEmmiterProtocol { get }
    
    func configure(_ view: ComponentView,
                   for model: ComponentModel)
}
