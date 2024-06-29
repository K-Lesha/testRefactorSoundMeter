

import Foundation

struct Settings {
    
    let settingsOption: String
    let imageName: String
    
    static func fetchSettings() -> [Settings] {

        let v1 = Settings(settingsOption: "Calificar la App", imageName: "rate-image")
        
        let v2 = Settings(settingsOption: "Contáctenos", imageName: "email-image")
        
        let v3 = Settings(settingsOption: "Política de Privacidad", imageName: "privacy-image")
        
        let v4 = Settings(settingsOption: "Términos de Uso", imageName: "terms-image")
        
        return [v2, v1, v3, v4]
    }
}
