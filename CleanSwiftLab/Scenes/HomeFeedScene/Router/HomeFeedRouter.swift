//
//  HomeFeedRouter.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/9/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation
import UIKit

protocol HomeFeedRouterProtocol: class {
    var viewController: UIViewController? {get set}
    func navigateToHero(id: String)
}

protocol HeroDataPassing: class {
    var heroId: String {get set}
}

typealias ComponentsRouterProtocol = (HeroPreviewRouterProtocol)


class HomeFeedRouter: HomeFeedRouterProtocol {
    weak var viewController: UIViewController?
   
    func navigateToHero(id: String) {
        let destination = HeroCreator(heroId: id).build()
        
        viewController?
            .navigationController?
            .pushViewController(destination, animated: true)
    }
}
