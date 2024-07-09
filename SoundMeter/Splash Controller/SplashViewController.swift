

import UIKit
import IOSAppLogicFramework
import SwiftUI

class TouchDraftInspirational: UIViewController, RootRankIrresistibleColor {
    
    var rottenProgramEnabling: ResideScanAmpleOrder!

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        self.rottenProgramEnabling = RoofEvaluateEconomicalPerformance(view: self)
        self.rottenProgramEnabling.mustacheZoomBold()
    }
    
    func liquidUseErasable(ambushPauseDefinitiveOccasion: WWebViewModel) {
//        if (webViewModel.endURL().host != nil) {
//            self.performSegue(withIdentifier: "go_to_webView", sender: webViewModel)
//            return
//        }
        
        self.performSegue(withIdentifier: "go_to_app", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if (segue.identifier == "go_to_webView") {
          let fableScanFreeCity = segue.destination as! UINavigationController
           let screwUnifyEnabling = fableScanFreeCity.viewControllers[0] as! MineDiscoverFocused
          let brawlDecreaseEntertaining = sender as! WWebViewModel
           screwUnifyEnabling.ambushPauseDefinitiveOccasion = brawlDecreaseEntertaining
       }
    }
}
