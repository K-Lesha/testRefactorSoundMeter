

import Foundation
import LitePayt

struct Settings {
    
    let settingsOption: String
    let imageName: String
    
    static func fetchSettings() -> [Settings] {

        let v1 = Settings(settingsOption: "Calificar la App", imageName: "rate-image")
        
        let v2 = Settings(settingsOption: "Contáctenos", imageName: "email-image")
        
        let v3 = Settings(settingsOption: "Buy Premium", imageName: "privacy-image")
        
        if LitePayt.shared.isPremium() {
            return [v2, v1]
        } else {
            return [v2, v1, v3]
        }
        
      
    }
}
