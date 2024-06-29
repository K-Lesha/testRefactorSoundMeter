

import Foundation

struct Settings {
    
    let settingsOption: String
    let imageName: String
    
    static func fetchSettings() -> [Settings] {

        let v1 = Settings(settingsOption: "Rate the App", imageName: "rate-image")
        
        let v2 = Settings(settingsOption: "Contact Us", imageName: "email-image")
        
        let v3 = Settings(settingsOption: "Privacy Policy", imageName: "privacy-image")
        
        let v4 = Settings(settingsOption: "Terms of Use", imageName: "terms-image")
        
        return [v1, v2, v3, v4]
    }
}
