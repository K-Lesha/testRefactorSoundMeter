

import UIKit
import CoreData
import LitePayt
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UITabBar.setTransparentTabbar()
        UITabBar.appearance().unselectedItemTintColor = .lightGray
        
        setupLitePayt()
        
        return true
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DbData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
    func setupLitePayt(){
        LitePayt.shared.setup(key: "app_xD5Hx2jPXnT77hXRseGPLohyhw8HrL")
        
        LitePayt.shared.uiConfig.slides =
        [
            
            TutorialSlide(picture: UIImage(named: "Image 0") ?? UIImage(), text: "¡Bienvenido a Scanner de Som!",description: "¡Bienvenido a Scanner de Som! La mejor aplicación de utilidades de escaneo de sonido para tu teléfono."),
            TutorialSlide(picture: UIImage(named: "Image") ?? UIImage(), text: "Rápido y seguro",description: " Escanea el sonido en la aplicación, rápido y seguro."),
            TutorialSlide(picture: UIImage(named: "Image 1") ?? UIImage(), text: "Fácil de usar",description: "Fácil de usar y cómodo para guardar audio."),
            TutorialSlide(picture: UIImage(named: "Image 2") ?? UIImage(), text: "Bienvenido a la aplicación Scanner de Som",description: "Bienvenido a la aplicación Scanner de Som, creamos esta aplicación para hacer la vida de cada usuario más cómoda."),
            
            PaymentSlide(picture: UIImage(named: "Image 3") ?? UIImage(), text: "Desbloquea todas las funciones de nuestra aplicación", description: "Desbloquea todas las funciones de nuestra aplicación por $1.99 por semana o prueba nuestra aplicación de forma gratuita - 5 guardados de audio gratis, luego debes elegir un plan de suscripción pagado. El plan pagado incluye guardados de audio ilimitados.", closeAvailable: LitePayt.shared.config.closeAvailable)
        ]
        
        LitePayt.shared.uiConfig.features = [
            "Unlimited scaning",
            "AD Free",
        ]
        
        LitePayt.shared.uiConfig.unlockIcon = UIImage(named: "premium") ?? UIImage()
        
        //TODO:  CHANGE APP ID в двух местах на аппхад
        
        LitePayt.shared.uiConfig.payInfo = "By continuing you agree to our Terms and Privacy Policy. \nRenews automatically unless auto-renew is turned off \nat least 24h before the trial period ends"
        
        LitePayt.shared.uiConfig.backgroundColor = Color("bg_color")
        LitePayt.shared.uiConfig.foreground = .black
        LitePayt.shared.uiConfig.secondaryForeground = .gray

        LitePayt.shared.uiConfig.buttonBackground = Color("AccentColor")
    }


}

