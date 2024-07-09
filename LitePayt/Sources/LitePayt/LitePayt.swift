//
//  File.swift
//  
//
//  Created by ankudinov aleksandr on 04.06.2024.
//

import Foundation
import SwiftUI
import ApphudSDK

public class LitePayt {
    
    static public let shared = LitePayt()
    
    public var config = SimpleConfig()
    public var uiConfig = UIConfig()
    
    private init(){
        
    }
    
    public func setup(key:String)  {
        Task {
            await Apphud.start(apiKey: key)
            
            await Apphud.paywallsDidLoadCallback { paywallsList, error in
                DispatchQueue.main.async {
                    Task {
                        if let paywall = await Apphud.paywall(ApphudPaywallID.main.rawValue) {
                            self.config.runLimit = (paywall.json?["runLimit"] as? Int) ?? 10
                            self.config.rateTimer = (paywall.json?["rateTimer"] as? TimeInterval) ?? 0
                            self.config.closeAvailable = (paywall.json?["closeAvailable"] as? Bool) ?? true
                            self.config.appid = (paywall.json?["appid"] as? String) ?? ""
                            
                            if let value = paywall.json?["site"] as? String {
                                self.uiConfig.siteLing = value
                            }
                            
                            if let value = paywall.json?["terms"] as? String {
                                self.uiConfig.termsLing = value
                            }
                            
                            if let value = paywall.json?["privacy"] as? String {
                                self.uiConfig.privacyLing = value
                            }
                          
                        }
                        
                        if !Apphud.hasPremiumAccess()   {
                            let vc = UIApplication.shared.firstKeyWindow?.rootViewController ?? UIApplication.shared.windows.first?.rootViewController
                            await  vc?.checkPremium()
                        }
                    }
                }
            }
        }
    }
    
    public func isPremium()->Bool {
        return Apphud.hasPremiumAccess()
    }
    
    public func fullCheckPremium(block: (()->Void)? = nil) {
        Task {
            
        await Apphud.paywallsDidLoadCallback { paywallsList, error in
            DispatchQueue.main.async {
            Task {
              if let paywall = await Apphud.paywall(ApphudPaywallID.main.rawValue) {
                  Apphud.paywallShown(paywall)
                  
                  var upgradeViewController:UIViewController!
                  upgradeViewController = await UIHostingController(rootView: WallView(block: block))
                  await upgradeViewController.view.backgroundColor = .clear
                  upgradeViewController.modalPresentationStyle = .overFullScreen
                  

                          await UIApplication.shared.firstKeyWindow?.rootViewController?.present( upgradeViewController, animated: true, completion: nil)
                      
                  }
                  

              }
            }
        }
        }
    }
    
    public func runAvailable(_ block:@escaping  (Bool)->()){
        
        if Apphud.hasPremiumAccess() {
            block(true)
        } else {
            
            self.config.runCount += 1;
            
            UIApplication.shared.firstKeyWindow?.rootViewController?.checkPremium(block: {
                if self.config.runCount <= LitePayt.shared.config.runLimit {
                    block(false)
                }
            })
        }
    }
  
}


public struct HeaderView: View {
    
    public init(){
        
    }
    
    public var body: some View {
        VStack(spacing:0){
            HStack {
                VStack {
                    HStack {
                        Text("Easy photo Collage+")
                            .font(.system(size: 22.0, weight: .bold, design: .rounded))
                            .foregroundColor(.accentColor)
                            .padding(.top)
                        Spacer()
                    }
                    
                    HStack {
                        Text("Craft Unforgettable Collages")
                            .font(.system(size: 16.0, weight: .thin, design: .rounded))
                            .padding(.top,0)
                        
                        Spacer()
                    }
                }.padding(.leading,20)
                    .padding(.top,-30)
                
                Spacer()
                
                Image("icon33")
                    .resizable()
                    .frame(width: 56,height: 56)
                    .padding(15).padding(.trailing, 7)
            }
            .padding(.top, 55)
            .padding(.bottom, 10)
            .background(.white)
            .clipShape(
                .rect(
                    topLeadingRadius: 0,
                    bottomLeadingRadius: 30,
                    bottomTrailingRadius: 30,
                    topTrailingRadius: 0
                )
            ).shadow(radius: 30)

            Spacer()
        }
    }
}
