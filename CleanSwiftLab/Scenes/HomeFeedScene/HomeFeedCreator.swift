//
//  HomeFeedWireFrame.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/6/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation
import UIKit

class HomeFeedCreator: SceneCreatorProtocol{
  
     func build() -> UIViewController {
        
        let interactor = HomeFeedInteractor()
        let presenter = HomeFeedPresenter()
        let router = HomeFeedRouter()
        let eventEmmiter = EventEmmiter()
        let componentFactory = ComponentFactoryView(eventEmitter: eventEmmiter)
        let actionProccessor = ComponentActionProcessor(router: router)
        let viewController = HomeFeedViewController(
            componentFactoryView: componentFactory,
            componentActionProccessor: actionProccessor
        )
        
        viewController.router = router
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        eventEmmiter.delegate = viewController
        return viewController
    }
}
