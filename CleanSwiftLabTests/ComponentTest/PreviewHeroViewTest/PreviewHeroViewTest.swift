//
//  PreviewHeroViewTest.swift
//  CleanSwiftLabTests
//
//  Created by Juan Andres Vasquez Ferrer on 12/18/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation
import Quick
import Nimble
import UIKit
import Nimble_Snapshots

@testable import CleanSwiftLab

class PreviewHeroViewTest: QuickSpec {
    
    let configurator = HeroPreviewConfigurator<HeroPreviewViewModel>(
        imageName: \.imageName,
        content: \.content,
        title: \.title)
    var heroPreviewView: HeroPreviewView!
    var containerView: UIContainerView!
    let record: Bool = false
    
    override func spec() {
        
        describe("Components") {
            
            beforeEach {
                self.containerView = UIContainerView(frame: TestUtils.getWindow().bounds)
                self.heroPreviewView = HeroPreviewView()
            }
            
            describe("footer button view"){
                
                it("display previewHero with full data"){
                    let viewModel = HeroPreviewViewModel(
                        id: "1", imageName: "SpidermanPreview", content: TestUtils.generateLoremItSum(iteration: 10), title: "mi title")
                    self.configurator.configure(self.heroPreviewView, for: viewModel)
                    self.containerView.insertInContainer(self.heroPreviewView)
                    let snapshotView = TestUtils.createViewForSnapshot(containerView: self.containerView)
                    expect(snapshotView) == TestUtils.snapshot(record: self.record)
                }
            }
        }
    }
    
    private func createButtons(buttonsText: [String]) -> ButtonFooterViewModel {
        var buttonsViewModel: [ButtonViewModel] = []
        for buttonText in buttonsText {
            buttonsViewModel.append(ButtonViewModel(text: buttonText))
        }
        return ButtonFooterViewModel.init(buttons: buttonsViewModel)
    }
}
