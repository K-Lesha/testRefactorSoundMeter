//
//  ContentView.swift
//  storekit-2-demo-app
//
//  Created by Aisultan Askarov on 11.01.2024.
//

import SwiftUI
import StoreKit
import ApphudSDK
import ProgressHUD

struct WallView: View {
    // MARK: - Properties
   
    @State private var selectedProduct: ApphudProduct? = nil
    private let features: [String] = LitePayt.shared.uiConfig.features
    @State var products:[ApphudProduct] = []
    @State var isPurchasing:Bool = Apphud.hasPremiumAccess()
    @State var closeAvailable:Bool = false
    @Environment(\.dismiss) var dismiss
    
    @State var smallScreen:Bool = !UIDevice.current.hasNotch
    
    var block:(()->Void)?
    
    // MARK: - Layout
    var body: some View {
        
        ZStack {
            
            BlurView(style: LitePayt.shared.uiConfig.backgroundStyle)
            
           
            
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
           
            if Apphud.hasPremiumAccess() {
                hasSubscriptionView
            } else {
                subscriptionOptionsView
                    .padding(.horizontal, 15)
                    .padding(.vertical, 15)
                    .onAppear {
                        
                
                        
                        Task {
                            guard  self.products.isEmpty else {
                                return
                            }
                            
                            if let paywall = await Apphud.paywall(ApphudPaywallID.main.rawValue) {
                                let apphudProducts = paywall.products
                                Apphud.paywallShown(paywall)
                                self.products = apphudProducts
                                self.closeAvailable = LitePayt.shared.config.closeAvailable
                            }
                        }
                    }.background(.clear).padding(EdgeInsets(top: 20, leading: 0, bottom: 15, trailing: 0))
            }
        }.ignoresSafeArea()
    }
    
    // MARK: - Views
    private var hasSubscriptionView: some View {
        VStack(spacing: 20) {
            Image(uiImage: LitePayt.shared.uiConfig.unlockIcon!)
                .resizable(resizingMode: .stretch)
            
            Text("You've Unlocked Pro Access")
                .font(.system(size: 30.0, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
        }
        .ignoresSafeArea(.all)
    }
    
    private var subscriptionOptionsView: some View {
        VStack(alignment: .center, spacing: smallScreen ? 3 : 10) {
            if !products.isEmpty {
                Spacer()
                proAccessView
                featuresView
                VStack(spacing: 2.5) {
                    productsListView
                    purchaseSection
                }
            } else {
                ProgressView()
                    .progressViewStyle(.circular)
                    .scaleEffect(1.5)
                    .ignoresSafeArea(.all)
            }
        }
    }
    
    private var proAccessView: some View {
        
        VStack(alignment: .center, spacing: 10) {
            if !smallScreen {
                Image(uiImage: LitePayt.shared.uiConfig.unlockIcon!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:90, height:120).padding(.top,30)
                
                Text("Unlock Pro Access")
                    .font(.system(size: 33.0, weight: .bold))
                    .multilineTextAlignment(.center).foregroundColor(LitePayt.shared.uiConfig.foreground)
                
                Text("Get access to all of our features")
                    .font(.system(size: 17.0, weight: .semibold))
                    .multilineTextAlignment(.center).foregroundColor(LitePayt.shared.uiConfig.foreground)
                    .padding(.horizontal, 30)
            }
        }
    }
    
    private var featuresView: some View {
        List(features, id: \.self) { feature in
            HStack(alignment: .center) {
                Image(systemName: "doc.circle")
                    .resizable()
                    .frame(width: 28, height: 28).foregroundColor(LitePayt.shared.uiConfig.foreground)
                
                Text(feature)
                    .font(.system(size: 15.0, weight: .semibold, design: .rounded))
                    .multilineTextAlignment(.leading).foregroundColor(LitePayt.shared.uiConfig.foreground)
            }
            .listRowSeparator(.hidden)
            .frame(height: 35)
            .listRowBackground(Color.clear)
        }
        //.scrollDisabled(true)
        .listStyle(.plain)
        .padding(.vertical, 5)
        .background(.clear)
        
    }
    
    private var productsListView: some View {
        List(products, id: \.self) { product in
            SubscriptionItemView(product: product, selectedProduct: $selectedProduct).listRowBackground(Color.clear)
        }
       // .scrollDisabled(true)
        .listStyle(.plain)
        .listRowSpacing(2.5)
        .frame(height: CGFloat(products.count) * 65, alignment: .bottom)
    }
    
    private var purchaseSection: some View {
        VStack(alignment: .center, spacing: 15) {
            
            Text(LitePayt.shared.uiConfig.payInfo)
                .font(.system(size: 10.0, weight: .light))
                .foregroundColor(LitePayt.shared.uiConfig.secondaryForeground)
                .multilineTextAlignment(.center)
                .lineLimit(nil).fixedSize()
            
            HStack{
                Spacer()
                
                Link("TERMS ", destination: URL(string: LitePayt.shared.uiConfig.termsLing)!).font(.system(size: 11.0, weight: .bold))
                    .foregroundColor(LitePayt.shared.uiConfig.buttonBackground)
                
                Link(" PRIVACY POLICY ", destination: URL(string: LitePayt.shared.uiConfig.privacyLing)!).font(.system(size: 11.0, weight: .bold))
                    .foregroundColor(LitePayt.shared.uiConfig.buttonBackground)
                
                Link(" HELP", destination: URL(string: LitePayt.shared.uiConfig.siteLing)!).font(.system(size: 11.0, weight: .bold))
                    .foregroundColor(LitePayt.shared.uiConfig.buttonBackground)
  
                Spacer()
            }
            
            purchaseButtonView
            
            Button("Restore Purchases") {
                Task {
                    await ProgressHUD.animate()
                    await Apphud.restorePurchases { subs, non, error in
                        if Apphud.hasPremiumAccess() {
                            DispatchQueue.main.async {
                                self.block?()
                                self.dismiss()
                            }
                        }
                        Task {
                            await ProgressHUD.dismiss()
                        }
                    }
                    await ProgressHUD.dismiss()
                }
            }
            .font(.system(size: 14.0, weight: .bold, design: .rounded))
            .frame(height: 15, alignment: .center)
            
        }
    }
    
    private var purchaseButtonView: some View {
        Button(action: {
            if let selectedProduct = selectedProduct {
                Task {
                    await ProgressHUD.animate()
                    let result = await Apphud.purchase(selectedProduct, isPurchasing: $isPurchasing)
                    await ProgressHUD.dismiss()
                    if Apphud.hasPremiumAccess() {
                        DispatchQueue.main.async {
                            self.dismiss()
                        }
                    }
                }
            } else {
                print("Please select a product before purchasing.")
            }
        }) {
            RoundedRectangle(cornerRadius: 12.5)
                .overlay {
                    Text("Purchase")
                        .foregroundStyle(LitePayt.shared.uiConfig.foreground)
                        .font(.system(size: 16.5, weight: .semibold, design: .rounded))
                       
                }
        }
        
        .tint( LitePayt.shared.uiConfig.buttonBackground )
        .padding(.horizontal, 20)
        .frame(height: 46)
        .disabled(selectedProduct == nil)
        
        
    }
}

// MARK: Subscription Item
struct SubscriptionItemView: View {
    var product: ApphudProduct
    @Binding var selectedProduct: ApphudProduct?
    @State var generalProcut:Product?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12.5)
                .stroke(selectedProduct == product ? LitePayt.shared.uiConfig.secondaryForeground : .gray.opacity(0.7), lineWidth: 1.0)
                .background(RoundedRectangle(cornerRadius: 10).fill(.clear))
            
            HStack {
                VStack(alignment: .leading, spacing: 3.5) {
                    Text(self.product.name ?? generalProcut?.displayName ?? "General")
                        .font(.system(size: 16.0, weight: .semibold, design: .rounded))
                        .multilineTextAlignment(.leading).foregroundColor(LitePayt.shared.uiConfig.foreground)
                  
                    if let introductoryOffer = generalProcut?.subscription?.introductoryOffer {
                        Text("Free for \(introductoryOffer.period.value) days then \(generalProcut?.displayPrice ?? "")")
                            .font(.system(size: 14.0, weight: .regular, design: .rounded))
                            .multilineTextAlignment(.leading).foregroundColor(LitePayt.shared.uiConfig.secondaryForeground)
                    } else {
                        Text("Enjoy full access for just \(generalProcut?.displayPrice ?? "")")
                            .font(.system(size: 14.0, weight: .regular, design: .rounded))
                            .multilineTextAlignment(.leading).foregroundColor(LitePayt.shared.uiConfig.secondaryForeground)
                    }
                   
                }
                Spacer()
                Image(systemName: selectedProduct == product ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(selectedProduct == product ? LitePayt.shared.uiConfig.buttonBackground : LitePayt.shared.uiConfig.secondaryForeground)
            }
            .padding(.horizontal, 20)
            .frame(height: 40, alignment: .center).onAppear(perform: {
                Task {
                    self.generalProcut =  try? await product.product()
                }
            })
        }
        .onTapGesture {
            selectedProduct = product
        }
        .background(.clear)
        .listRowSeparator(.hidden)
    }
}

