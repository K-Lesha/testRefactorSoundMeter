

import Foundation

struct Settings {
    
    let settingsOption: String
    let imageName: String
    
    static func fetchSettings() -> [Settings] {

        let v1 = Settings(settingsOption: "Rate the App", imageName: "s1")
        
        let v2 = Settings(settingsOption: "Contact Us", imageName: "s2")
        
        let v3 = Settings(settingsOption: "Privacy Policy", imageName: "s4")
        
        let v4 = Settings(settingsOption: "Terms of Use", imageName: "s5")
        
        return [v1, v2, v3, v4]
    }
}
