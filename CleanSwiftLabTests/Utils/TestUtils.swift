//
//  TestUtils.swift
//  CleanSwiftLabTests
//
//  Created by Juan Andres Vasquez Ferrer on 12/17/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation
import Nimble_Snapshots
import UIKit

class TestUtils {
    
    class func getWindow() -> UIWindow {
        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: 375, height: 600))
        window.makeKeyAndVisible()
        return window
    }
    
    
    class func createViewForSnapshot(containerView: UIContainerView) -> UIView {
        containerView.scrollView.layoutIfNeeded()
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: containerView.scrollView.contentSize.height))
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        view.backgroundColor = .white
        containerView.layoutIfNeeded()
        return view
    }
    
    class func generateLoremItSum(iteration: Int) -> String {
        
        let lorem = "Lorem it sum lorem"
        var result = ""
        for _ in 0...iteration {
            result += lorem
        }
        return result
    }
    
    class func snapshot(record: Bool) -> Snapshot {
        return record ? recordSnapshot() : Nimble_Snapshots.snapshot()
    }
}
