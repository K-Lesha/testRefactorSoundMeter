

import Foundation
import UIKit
import AVFoundation
import CoreAudio
import CoreData
import GaugeSlider
import LitePayt

class MainViewController: UIViewController {
    
    @IBOutlet weak var dbTrackerView: GaugeSliderView!
    @IBOutlet weak var minimumLevelLabel: UILabel!
    @IBOutlet weak var maximumLevelLabel: UILabel!
    @IBOutlet weak var averageLevelLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var premiumView: UIView!
    @IBOutlet weak var premiumImage: UIImageView!
    @IBOutlet weak var premiumButton: UIButton!
    
    var managedObjextContext: NSManagedObjectContext!
    var recorder: AVAudioRecorder!
    var levelTimer = Timer()
    var arrayLevel: [CGFloat]! = []
    let LEVEL_THRESHOLD: Float = -40.0
    var minimumLevel = CGFloat()
    var maximumLevel = CGFloat()
    var averageSoundLevel = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        managedObjextContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        dbTrackerView.onButtonAction = { [weak self] in
            self!.addRecord()
        }
        
        let documents = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0])
        let url = documents.appendingPathComponent("record.caf")
        
        let recordSettings: [String: Any] = [
            AVFormatIDKey:              kAudioFormatAppleIMA4,
            AVSampleRateKey:            44100.0,
            AVNumberOfChannelsKey:      2,
            AVEncoderBitRateKey:        12800,
            AVLinearPCMBitDepthKey:     16,
            AVEncoderAudioQualityKey:   AVAudioQuality.max.rawValue
        ]
        
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(AVAudioSession.Category.playAndRecord)
            try audioSession.setActive(true)
            try recorder = AVAudioRecorder(url:url, settings: recordSettings)
            
        } catch {
            return
        }
        
        recorder.prepareToRecord()
        recorder.isMeteringEnabled = true
        recorder.record()
        
        levelTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(levelTimerCallback), userInfo: nil, repeats: true)
        
        setupUserInterface()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        self.premiumView.isHidden = true
    }
    
    func showSuccessAlert() {
        
        let alert = MyAlertViewController(
            title: "¡Bien hecho!",
            message: "Has agregado con éxito un registro de nivel de ruido",
            imageName: "success-image")

        alert.addAction(title: "OK", style: .default)
        present(alert, animated: true, completion: nil)
    }
    
    @objc func levelTimerCallback() {
        recorder.updateMeters()
        
        let level = recorder.averagePower(forChannel: 0)
        
        dbTrackerView.value = CGFloat(95+level)
        
        let detectStatus = dbTrackerView.value
        
        if detectStatus <= 70 {
            dbTrackerView.fillPathColor = .systemGreen.withAlphaComponent(0.3)
            //dbResultLabel.text = "Normal conversation"
            dbTrackerView.placeholder = "Bastante audible"
        } else if detectStatus >= 70 && detectStatus <= 85 {
            dbTrackerView.fillPathColor = .systemGreen.withAlphaComponent(0.7)
            //dbResultLabel.text = "City traffic (inside the car)"
            dbTrackerView.placeholder = "Ruidoso"
        } else if detectStatus >= 85 {
            dbTrackerView.fillPathColor = .systemGreen.withAlphaComponent(1)
            //dbResultLabel.text = "Gas-powered lawnmowers\nleaf blowers"
            dbTrackerView.placeholder = "Extremadamente ruidoso"
        }
        
        if dbTrackerView.value > 0 {
            arrayLevel.append(dbTrackerView.value)
            
            minimumLevel = arrayLevel.min()!
            maximumLevel = arrayLevel.max()!
            
            minimumLevelLabel.text = "\(minimumLevel)"
            maximumLevelLabel.text = "\(maximumLevel)"
            
            averageLevel()
        }
    }
    
    func averageLevel(){
        let level:[CGFloat] = arrayLevel
        let levelAvg = level.reduce(0, +) / CGFloat(level.count)
        averageLevelLabel.text = "\(Int(levelAvg)).0"
        averageSoundLevel = Int(levelAvg)
    }
    
    func addRecord() {
        
        let now = Date()
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "dd, MMMM"
        formatter.locale = Locale(identifier: "es_ES")
        let dateString = formatter.string(from: now)
        
        let dbItem = SoundData(context: self.managedObjextContext)
        dbItem.maximum = Int16(self.maximumLevel)
        dbItem.minimum = Int16(self.minimumLevel)
        dbItem.average = Int16(self.averageSoundLevel)
        dbItem.currentDate = dateString
        
        self.showSuccessAlert()
        
        do {
            try self.managedObjextContext.save()
        } catch {
            print("Could not save data \(error.localizedDescription)")
        }
    }
    
    
    @IBAction func addToRecords(_ sender: Any) {
        LitePayt.shared.runAvailable { _ in
            self.addRecord()
        }
    }
    
    func setupUserInterface() {
//        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        
        dbTrackerView.unit = " dB"
        dbTrackerView.placeholderColor = .black
        dbTrackerView.placeholderFont = UIFont(name: "Menlo", size: 16) ?? .systemFont(ofSize: 16)
        dbTrackerView.unitColor = .systemGreen
        dbTrackerView.blankPathColor = .systemGray.withAlphaComponent(0.4)
        dbTrackerView.indicatorColor = .systemGreen
        dbTrackerView.customControlButtonVisible = false
        dbTrackerView.unitIndicatorFont = UIFont(name: "Menlo", size: 0.1)  ?? .systemFont(ofSize: 0.1)
        dbTrackerView.unitFont = UIFont(name: "Menlo", size: 67)  ?? .systemFont(ofSize: 67)

        recordButton.layer.cornerRadius = recordButton.frame.height/2
        recordButton.layer.masksToBounds = true
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
