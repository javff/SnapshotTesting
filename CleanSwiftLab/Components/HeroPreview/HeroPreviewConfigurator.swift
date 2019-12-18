//
//  HeroPreviewConfigurator.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 1/2/20.
//  Copyright © 2020 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation
import UIKit

struct HeroPreviewConfigurator<Model>: ComponentConfiguratorProtocol {
   
    typealias ComponentModel = Model
    typealias ComponentView = HeroPreviewView

    let imageName: KeyPath<Model, String>
    let content: KeyPath<Model, String?>
    let title: KeyPath<Model, String?>

    func configure(_ view: HeroPreviewView,for model: Model) {
        
        view.imageView.image = UIImage(named: model[keyPath: imageName])
        view.titleLabel.text = model[keyPath: title]
        view.descriptionLabel.text = model[keyPath: content]
    }
}

struct HeroPreviewActionConfigurator<Model>: ComponentConfiguratorProtocol {
   
    typealias ComponentModel = Model
    typealias ComponentView = HeroPreviewView
    let eventEmmiter: EventEmmiterProtocol
    let idKeyPath: KeyPath<Model, String>

    func configure(_ view: HeroPreviewView,for model: Model) {
        
        let id = model[keyPath: idKeyPath]
        
        view.tapHeroView = {
            self.eventEmmiter.emmit(event: .openHero(id: id))
        }
    }
}
