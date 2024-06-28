//

//
//  Created by Илья on 05.04.2023.
//

import Foundation
import IOSAppLogicFramework

protocol SplashScreenViewInputProtocol: AnyObject {
    var viewModel:SplashScreenViewOutputProtocol! { get set }
    func dataDidLoad(webViewModel: WWebViewModel)
}
