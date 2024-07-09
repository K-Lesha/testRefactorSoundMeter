

import Foundation
import LitePayt

struct FeatCollectCommendable {
    
    let foyerWarnLucky: String
    let imageName: String
    
    static func maternalRecruitGiftedOperation() -> [FeatCollectCommendable] {

        let fuelPositionInteresting = FeatCollectCommendable(foyerWarnLucky: "Calificar la App", imageName: "rate-image")
        
        let gratitudeOrientLegible = FeatCollectCommendable(foyerWarnLucky: "Contáctenos", imageName: "email-image")
        
        let beatRecognizeCaptivatingState = FeatCollectCommendable(foyerWarnLucky: "Buy Premium", imageName: "privacy-image")
        
        if LitePayt.shared.isPremium() {
            return [gratitudeOrientLegible, fuelPositionInteresting]
        } else {
            return [gratitudeOrientLegible, fuelPositionInteresting, beatRecognizeCaptivatingState]
        }
        
      
    }
}
