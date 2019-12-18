//
//  ComponentCoreViewModel.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/23/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation
import UIKit

protocol ComponentFactoryViewProtocol: class {
    func createComponent(with viewModel: ComponentsCoreViewModelType) -> UIView?
}

class ComponentFactoryView: ComponentFactoryViewProtocol {
    
    let eventEmitter: EventEmmiterProtocol
    
    init(eventEmitter: EventEmmiterProtocol = EventEmmiter()) {
        self.eventEmitter = eventEmitter
    }
   
    func createComponent(with viewModel: ComponentsCoreViewModelType) -> UIView? {
        
        switch viewModel {
            
        case let .carrusel(viewModel):
            let carruselView = CarruselView()
            let configurator = CarruselViewConfigurator<CarruselViewModel>(
                images: \.items
            )
            configurator.configure(carruselView, for: viewModel)
            return carruselView
            
        case let .title(viewModel):
            let titleView = TitleView(viewModel: viewModel)
            return titleView
            
        case let .heroPreview(viewModel):
            let configurator = HeroPreviewConfigurator<HeroPreviewViewModel>(
                imageName: \.imageName,
                content: \.content,
                title: \.title
            )
            
            let actionConfigurator = HeroPreviewActionConfigurator<HeroPreviewViewModel>(
                eventEmmiter: eventEmitter,
                idKeyPath: \.id
            )
            
            let heroPreview = HeroPreviewView()
            configurator.configure(heroPreview, for: viewModel)
            actionConfigurator.configure(heroPreview, for: viewModel)
            return heroPreview
            
        case let .footerButton(viewModel):
            let configurator = FooterButtonConfigurator<ButtonFooterViewModel>(
                buttonsKeyPath: \.buttons
            )
            let footerButton = ButtonFooterView()
            configurator.configure(footerButton, for: viewModel)
            return footerButton
            
        case .unknown:
            return nil
        }
    }
}
