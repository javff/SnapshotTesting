//
//  HandlerTapActions.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 5/31/20.
//  Copyright © 2020 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation

typealias HandlerBlockWithData<Model> = ((_ model: Model? ) -> Void)

typealias SingleHandlerBlock = (() -> Void)

