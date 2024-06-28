//
//  WebViewViewController.swift
//  SoundMeter
//
//  Created by Илья on 17.04.2023.
//

import Foundation
import IOSAppLogicFramework
import SwiftUI


class WebViewViewController: UIViewController {
    
    var webViewModel: WWebViewModel!
    
    override func viewDidLoad() {
        let childVC = UIHostingController(rootView: WWebView(self.webViewModel))
        self.addChild(childVC)
        childVC.view.frame = self.view.bounds
        self.view.addSubview(childVC.view)
        childVC.didMove(toParent: self)
    }
    
}
