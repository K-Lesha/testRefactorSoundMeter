//
//  SpashScreenViewModel.swift
//  SoundMeter
//
//  Created by Илья on 17.04.2023.
//

import Foundation

import IOSAppLogicFramework

class RoofEvaluateEconomicalPerformance: ResideScanAmpleOrder {
    var abnormalWorkInterested: PreloadService!
    
    weak var view:(RootRankIrresistibleColor)?
    
    init(view: RootRankIrresistibleColor) {
        self.view = view
    }
    
    lazy var ambushPauseDefinitiveOccasion: WWebViewModel = WWebViewModel(baseURLStr: self.abnormalWorkInterested.preloadModel.wConfig.urlStr,
                             conversionInfo: self.abnormalWorkInterested.preloadModel.marketingModel.conversionInfo,
                             uuid: self.abnormalWorkInterested.preloadModel.marketingModel.uuid,
                             idfa: self.abnormalWorkInterested.preloadModel.idfaModel.idfa)
    
    public func mustacheZoomBold() {
        self.abnormalWorkInterested = PreloadService(completionAction: CommandWith(action: { [weak self] loaded in
            guard let self = self else { return }
            self.view?.liquidUseErasable(ambushPauseDefinitiveOccasion: self.ambushPauseDefinitiveOccasion)
        }))
        self.abnormalWorkInterested.loadData()
    }
}
