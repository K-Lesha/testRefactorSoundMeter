//
//  TutorialWall.swift
//  WTMP
//
//  Created by ankudinov aleksandr on 04.06.2024.
//

import Foundation
import UIKit
import SwiftUI

import StoreKit
import ApphudSDK
import ProgressHUD

struct TutorialWall: View {
    // MARK: - Properties
    
    @Environment(\.dismiss) var dismiss
    
    @State var closeAvailable:Bool = true
    
    @State var smallScreen:Bool = !UIDevice.current.hasNotch
    
    var block:(()->Void)?
    
    @State var product: ApphudProduct? = nil
    
    @State var isPurchasing:Bool = Apphud.hasPremiumAccess()
    
    @State var generalProcut:Product?
    
    @State var paymentText:String? = ""

    @State var slides:[Slide] = LitePayt.shared.uiConfig.slides
    
    @State var activeSlide:Int = 0 {
        willSet {
            if newValue > slides.count {
                dismiss()
            }
        }
    }
    
    // MARK: - Layout
    var body: some View {
        
        ZStack {

            BlurView(style: LitePayt.shared.uiConfig.backgroundStyle)
            
            if activeSlide == (self.slides.count - 1) {
                if closeAvailable || Apphud.hasPremiumAccess() {
                    HStack{
                        
                        Spacer()
                        
                        VStack{
                            Button {
                                dismiss()
                                block?()
                            } label: {
                                Image("close").resizable().frame(width: 30,height: 30).opacity(0.3).padding( smallScreen ? 5 : 30).tint(.purple)
                            }
                            
                            Spacer()
                            
                            
                        }.padding(EdgeInsets(top: 38, leading: 0, bottom: 0, trailing: 0))
                     
         
                    }
                }
            }
            
            
            VStack{
            
                Spacer()
                
                Image(uiImage: slides[activeSlide].picture).resizable()
                    .scaledToFit().padding(10).padding(.top,60)
                
                Text( slides[activeSlide].text).multilineTextAlignment(.center).foregroundColor(LitePayt.shared.uiConfig.foreground).fontWeight(.bold).padding(10).font(.title).onAppear(perform: {
                })

                if let description = self.paymentText {
                    Text(description).foregroundColor(LitePayt.shared.uiConfig.foreground.opacity(0.8)).multilineTextAlignment(.center).font(.system(size: 16)).fontWeight(.light).padding(.leading,20).padding(.trailing,20).padding(.top,0)
                    Spacer()
                }
                

                    HStack {
                        
      
                        Link(self.activeSlide == (self.slides.count - 1) ? "Terms" : "", destination: URL(string: LitePayt.shared.uiConfig.termsLing)!).foregroundColor(LitePayt.shared.uiConfig.buttonBackground)
                        

                        Link(self.activeSlide == (self.slides.count - 1) ? "Privacy" : "", destination: URL(string: LitePayt.shared.uiConfig.privacyLing)!).foregroundColor(LitePayt.shared.uiConfig.buttonBackground)
            
                    }
     
                
                
                Button(action: {
                    
                    if self.activeSlide == (self.slides.count - 2) {
                        LitePayt.shared.config.onboardingComplete = true
                    }
                    
                    if let currentProduct = self.product, self.activeSlide == (self.slides.count - 1)  {
                        
                        Task {
                            await ProgressHUD.animate()
                            let result = await Apphud.purchase(currentProduct, isPurchasing: $isPurchasing)
                            await ProgressHUD.dismiss()
                            if Apphud.hasPremiumAccess() {
                                DispatchQueue.main.async {
                                    self.block?()
                                    self.dismiss()
                                }
                            }
                        }
                    } else {
                        activeSlide += 1
                    }
                    
                    self.paymentText = slides[activeSlide].description
                    
                    var replaceText = ""
                    
                    if let introductoryOffer = generalProcut?.subscription?.introductoryOffer {
                        replaceText = "free \(introductoryOffer.period.value) days then \(generalProcut?.displayPrice ?? "")"
                    } else {
                        replaceText = "\(generalProcut?.displayPrice ?? "") per \(generalProcut?.subscription?.subscriptionPeriod.unit.localizedDescription.lowercased() ?? "")"
                    }
                    
                    self.paymentText = self.paymentText?.replacingOccurrences(of: "%PRICE%", with: replaceText)
                    
                    
                    
                }) {
                    RoundedRectangle(cornerRadius: 12.5)
                        .overlay {
                            Text(slides[activeSlide].buttonText)
                                .foregroundStyle(.white)
                                .font(.system(size: 16.5, weight: .semibold, design: .rounded))
                        }
                }
                
                .tint( LitePayt.shared.uiConfig.buttonBackground )
                .padding(.horizontal, 20)
                .frame(height: 46)
                
                HStack {
                    Button(  self.activeSlide == (self.slides.count - 1) ? "Restore Purchases" : "") {
                        Task {
                            await ProgressHUD.animate()
                            await Apphud.restorePurchases { subs, non, error in
                                if Apphud.hasPremiumAccess() {
                                    DispatchQueue.main.async {
                                        self.block?()
                                        self.dismiss()
                                    }
                                    Task {
                                        await ProgressHUD.succeed()
                                    }
                                } else{
                                    Task {
                                        await ProgressHUD.error()
                                    }
                                }
                            }
                        }
                    }
                    .font(.system(size: 14.0, weight: .bold, design: .rounded))
                    .frame(height: 15, alignment: .center)
                    .foregroundColor(LitePayt.shared.uiConfig.buttonBackground).opacity(0.7)
                    .padding(.top, 10)
                    
                    if closeAvailable {
                        
                        Button(  self.activeSlide == (self.slides.count - 1) ? "Suscription options" : "") {
                            Task {
                                self.dismiss()
                                LitePayt.shared.fullCheckPremium()
                            }
                        }
                        .font(.system(size: 14.0, weight: .bold, design: .rounded))
                        .frame(height: 15, alignment: .center)
                        .foregroundColor(LitePayt.shared.uiConfig.buttonBackground).opacity(0.7)
                        .padding(.top, 10)
                        
                    }
                }
        
   
            }.padding(.bottom,44)
           
        }.ignoresSafeArea()
         
        .onAppear {
        
            Task {
                
                if LitePayt.shared.config.onboardingComplete {
                    activeSlide = (slides.count - 1)
                }
                
                if let paywall = await Apphud.paywall(ApphudPaywallID.onboarding.rawValue) {
                    
                    if let product = paywall.products.last {
                            let productId = product.productId
                            self.product = product
                            self.closeAvailable = LitePayt.shared.config.closeAvailable ?? true
                            Task {
                                self.generalProcut =  try? await product.product()
                                
                                var replaceText = ""
                                
                                self.paymentText = slides[activeSlide].description
                                
                                if let introductoryOffer = generalProcut?.subscription?.introductoryOffer {
                                    replaceText = "for free \(introductoryOffer.period.value) days then \(generalProcut?.displayPrice ?? "")"
                                } else {
                                    replaceText = "for \(generalProcut?.displayPrice ?? "") per \(generalProcut?.subscription?.subscriptionPeriod.unit.localizedDescription.lowercased() ?? "")"
                                }
                                
                                self.paymentText = self.paymentText?.replacingOccurrences(of: "%PRICE%", with: replaceText)
                            }
 
                    }
            
                }
            }
        }
    }
}
