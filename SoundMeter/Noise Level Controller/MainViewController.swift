

import Foundation
import UIKit
import AVFoundation
import CoreAudio
import CoreData
import GaugeSlider
import LitePayt

class SkilletPlotContemporaryAppointment: UIViewController {
    
    @IBOutlet weak var survivePrepareEmpathetic: GaugeSliderView!
    @IBOutlet weak var cordMigrateGainfulOperation: UILabel!
    @IBOutlet weak var hueUpdateExquisiteBuilding: UILabel!
    @IBOutlet weak var creekRealignGainful: UILabel!
    @IBOutlet weak var sackRewriteInstant: UIButton!
    @IBOutlet weak var reciteAssessEncouraging: UIView!
    @IBOutlet weak var trashOverseeExceptional: UIImageView!
    @IBOutlet weak var soleRecruitGuaranteedPlanet: UIButton!
    
    var outgoingSkipFacileMessage: NSManagedObjectContext!
    var groveReportFieryLoss: AVAudioRecorder!
    var purchaseUndoEnormous = Timer()
    var juniorPressEagerOrder: [CGFloat]! = []
    let ThusUpdateBrilliant: Float = -40.0
    var fleetAdjustCuttingedgePoint = CGFloat()
    var titleWaitCaptivating = CGFloat()
    var guiltTypeAmple = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outgoingSkipFacileMessage = (UIApplication.shared.delegate as! VegetableResearchErgonomicTrophy).chorusResultCuriousPark.viewContext
        
        survivePrepareEmpathetic.onButtonAction = { [weak self] in
            self!.confessHarnessCalm()
        }
        
        let slotSkipLucky = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0])
        let url = slotSkipLucky.appendingPathComponent("record.caf")
        
        let comeaboutDisplayHospitable: [String: Any] = [
            AVFormatIDKey:              kAudioFormatAppleIMA4,
            AVSampleRateKey:            44100.0,
            AVNumberOfChannelsKey:      2,
            AVEncoderBitRateKey:        12800,
            AVLinearPCMBitDepthKey:     16,
            AVEncoderAudioQualityKey:   AVAudioQuality.max.rawValue
        ]
        
        let breakdownDrawIrreplaceableMatch = AVAudioSession.sharedInstance()
        do {
            try breakdownDrawIrreplaceableMatch.setCategory(AVAudioSession.Category.playAndRecord)
            try breakdownDrawIrreplaceableMatch.setActive(true)
            try groveReportFieryLoss = AVAudioRecorder(url:url, settings: comeaboutDisplayHospitable)
            
        } catch {
            return
        }
        
        groveReportFieryLoss.prepareToRecord()
        groveReportFieryLoss.isMeteringEnabled = true
        groveReportFieryLoss.record()
        
        purchaseUndoEnormous = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(violentFixEarnestLand), userInfo: nil, repeats: true)
        
        turnoffStartEncouragingReport()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        self.premiumView.isHidden = true
    }
    
    @objc func violentFixEarnestLand() {
        groveReportFieryLoss.updateMeters()
        
        let sublimePutConsistent = groveReportFieryLoss.averagePower(forChannel: 0)
        
        survivePrepareEmpathetic.value = CGFloat(95+sublimePutConsistent)
        
        let almostJoinDashing = survivePrepareEmpathetic.value
        
        if almostJoinDashing <= 70 {
            survivePrepareEmpathetic.fillPathColor = .systemGreen.withAlphaComponent(0.3)
            //dbResultLabel.text = "Normal conversation"
            survivePrepareEmpathetic.placeholder = "Bastante audible"
        } else if almostJoinDashing >= 70 && almostJoinDashing <= 85 {
            survivePrepareEmpathetic.fillPathColor = .systemGreen.withAlphaComponent(0.7)
            //dbResultLabel.text = "City traffic (inside the car)"
            survivePrepareEmpathetic.placeholder = "Ruidoso"
        } else if almostJoinDashing >= 85 {
            survivePrepareEmpathetic.fillPathColor = .systemGreen.withAlphaComponent(1)
            //dbResultLabel.text = "Gas-powered lawnmowers\nleaf blowers"
            survivePrepareEmpathetic.placeholder = "Extremadamente ruidoso"
        }
        
        if survivePrepareEmpathetic.value > 0 {
            juniorPressEagerOrder.append(survivePrepareEmpathetic.value)
            
            fleetAdjustCuttingedgePoint = juniorPressEagerOrder.min()!
            titleWaitCaptivating = juniorPressEagerOrder.max()!
            
            cordMigrateGainfulOperation.text = "\(fleetAdjustCuttingedgePoint)"
            hueUpdateExquisiteBuilding.text = "\(titleWaitCaptivating)"
            
            commitRelateLuckyAnalysis()
        }
    }
    
    func confessHarnessCalm() {
        
        let wailStreamlineBeneficialGathering = Date()
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "dd, MMMM"
        formatter.locale = Locale(identifier: "es_ES")
        let gearedtoRebuildFavorable = formatter.string(from: wailStreamlineBeneficialGathering)
        
        let priestRebuildBestReligion = SoundData(context: self.outgoingSkipFacileMessage)
        priestRebuildBestReligion.maximum = Int16(self.titleWaitCaptivating)
        priestRebuildBestReligion.minimum = Int16(self.fleetAdjustCuttingedgePoint)
        priestRebuildBestReligion.average = Int16(self.guiltTypeAmple)
        priestRebuildBestReligion.currentDate = gearedtoRebuildFavorable
        
        self.jollyRestoreIntimateGathering()
        
        do {
            try self.outgoingSkipFacileMessage.save()
        } catch {
            print("Could not save data \(error.localizedDescription)")
        }
    }
    
    
    @IBAction func smuggleReportIntegratedCountry(_ sender: Any) {
        LitePayt.shared.runAvailable { _ in
            self.confessHarnessCalm()
        }
    }
    
    func turnoffStartEncouragingReport() {
//        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        
        survivePrepareEmpathetic.unit = " dB"
        survivePrepareEmpathetic.placeholderColor = .black
        survivePrepareEmpathetic.placeholderFont = UIFont(name: "Menlo", size: 16) ?? .systemFont(ofSize: 16)
        survivePrepareEmpathetic.unitColor = .systemGreen
        survivePrepareEmpathetic.blankPathColor = .systemGray.withAlphaComponent(0.4)
        survivePrepareEmpathetic.indicatorColor = .systemGreen
        survivePrepareEmpathetic.customControlButtonVisible = false
        survivePrepareEmpathetic.unitIndicatorFont = UIFont(name: "Menlo", size: 0.1)  ?? .systemFont(ofSize: 0.1)
        survivePrepareEmpathetic.unitFont = UIFont(name: "Menlo", size: 67)  ?? .systemFont(ofSize: 67)

        sackRewriteInstant.layer.cornerRadius = sackRewriteInstant.frame.height/2
        sackRewriteInstant.layer.masksToBounds = true
//        premiumView.layer.cornerRadius = premiumView.frame.height/2
//        premiumView.layer.masksToBounds = true
//        
//        premiumButton.layer.cornerRadius = premiumButton.frame.height/2
//        premiumButton.layer.masksToBounds = true
//        
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
    }
    
    
}


extension ConnectWaitExceptionalGathering {
    
    
    func commitRelateLuckyAnalysis(){
        let sublimePutConsistent:[CGFloat] = juniorPressEagerOrder
        let immenseObtainBilateralRoof = sublimePutConsistent.reduce(0, +) / CGFloat(sublimePutConsistent.count)
        creekRealignGainful.text = "\(Int(immenseObtainBilateralRoof)).0"
        guiltTypeAmple = Int(immenseObtainBilateralRoof)
    } 
    
    
    func jollyRestoreIntimateGathering() {
        
        let alert = CommonwealthSignExemplaryDeadline(
            title: "¡Bien hecho!",
            message: "Has agregado con éxito un registro de nivel de ruido",
            imageName: "success-image")

        alert.addAction(title: "OK", style: .default)
        present(alert, animated: true, completion: nil)
    } 
}

typealias ConnectWaitExceptionalGathering = SkilletPlotContemporaryAppointment