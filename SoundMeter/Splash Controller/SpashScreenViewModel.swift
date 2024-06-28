//
//  SpashScreenViewModel.swift
//  SoundMeter
//
//  Created by Илья on 17.04.2023.
//

import Foundation

import IOSAppLogicFramework

class SplashScreenViewModel: SplashScreenViewOutputProtocol {
    var preLoadService: PreloadService!
    
    weak var view:(SplashScreenViewInputProtocol)?
    
    init(view: SplashScreenViewInputProtocol) {
        self.view = view
    }
    
    lazy var webViewModel: WWebViewModel = WWebViewModel(baseURLStr: self.preLoadService.preloadModel.wConfig.urlStr,
                             conversionInfo: self.preLoadService.preloadModel.marketingModel.conversionInfo,
                             uuid: self.preLoadService.preloadModel.marketingModel.uuid,
                             idfa: self.preLoadService.preloadModel.idfaModel.idfa)
    
    public func loadPreLoadData() {
        self.preLoadService = PreloadService(completionAction: CommandWith(action: { [weak self] loaded in
            guard let self = self else { return }
            self.view?.dataDidLoad(webViewModel: self.webViewModel)
        }))
        self.preLoadService.loadData()
    }
}
