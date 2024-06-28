

import UIKit
import IOSAppLogicFramework
import SwiftUI

class SplashViewController: UIViewController, SplashScreenViewInputProtocol {
    
    var viewModel: SplashScreenViewOutputProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        self.viewModel = SplashScreenViewModel(view: self)
        self.viewModel.loadPreLoadData()
    }
    
    func dataDidLoad(webViewModel: WWebViewModel) {
//        if (webViewModel.endURL().host != nil) {
//            self.performSegue(withIdentifier: "go_to_webView", sender: webViewModel)
//            return
//        }
        
        self.performSegue(withIdentifier: "go_to_app", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if (segue.identifier == "go_to_webView") {
          let nc = segue.destination as! UINavigationController
           let vc = nc.viewControllers[0] as! WebViewViewController
          let object = sender as! WWebViewModel
           vc.webViewModel = object
       }
    }
}
