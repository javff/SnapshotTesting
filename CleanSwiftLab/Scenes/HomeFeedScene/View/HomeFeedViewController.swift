//
//  HomeFeedViewController.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/6/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import UIKit

protocol HomeViewDisplayLogic: class {
    func displayHome(components: [ComponentsCoreViewModelType])
}

class HomeFeedViewController: BaseViewController <HomeFeedView> {
  
    var interactor: HomeFeedInteractorProtocol?
    var router: HomeFeedRouterProtocol?
    let componentFactoryView: ComponentFactoryViewProtocol
    let componentActionProccessor: ActionProccesorProtocol
    
    init(componentFactoryView: ComponentFactoryViewProtocol,
         componentActionProccessor: ActionProccesorProtocol) {
        self.componentFactoryView = componentFactoryView
        self.componentActionProccessor = componentActionProccessor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        interactor?.getFeed()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setupView(){
        navigationItem.title = "Super Hero App"
    }
}

extension HomeFeedViewController: HomeViewDisplayLogic {
   
    func displayHome(components: [ComponentsCoreViewModelType]) {
        let viewComponents = components.compactMap{componentFactoryView.createComponent(with: $0)}
        viewComponents.forEach { (view) in
            baseView?.containerStackView.addArrangedSubview(view)
        }
    }
}

extension HomeFeedViewController: EventEmmiterDelegate {
   
    func listener(event: EventActionType) {
        self.componentActionProccessor.process(event: event)
    }
}
