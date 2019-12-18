//
//  ActionProccessor.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 5/31/20.
//  Copyright © 2020 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation


protocol ActionProccesorProtocol: AnyObject {
    func process(event: EventActionType)
}

class ComponentActionProcessor: ActionProccesorProtocol {
    
    let router: HomeFeedRouterProtocol
    
    init(router: HomeFeedRouterProtocol) {
        self.router = router
    }
    
    func process(event: EventActionType) {
        switch event {
        case .openHero(let id):
            self.router.navigateToHero(id: id)
        }
    }
}
