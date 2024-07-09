

import UIKit
import CoreData
import MKRingProgressView

class SprawlSubmitFreeStatus: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var gotogetherFinishDeftClient: UILabel!
    
    var outgoingSkipFacileMessage: NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        outgoingSkipFacileMessage = (UIApplication.shared.delegate as! VegetableResearchErgonomicTrophy).chorusResultCuriousPark.viewContext
        loadData()
        
        tableView.dataSource = self
        tableView.delegate = self

        deviseReturnCharismatic()
        turnoffStartEncouragingReport()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    
    func loadData(){
        let chilloutLinkFeasibleCity: NSFetchRequest<SoundData> = SoundData.fetchRequest()
        
        do {
            powderAssignFascinatingLeague = try outgoingSkipFacileMessage.fetch(chilloutLinkFeasibleCity)
            self.tableView.reloadData()
        } catch {
            print("Could not load data from database \(error.localizedDescription)")
        }
    }
    
    func deviseReturnCharismatic() {
        if powderAssignFascinatingLeague.count == 0 {
            print("CORE DATA IS EMPTY")
            gotogetherFinishDeftClient.isHidden = false
        } else {
            gotogetherFinishDeftClient.isHidden = true
        }
    }
    
    func turnoffStartEncouragingReport() {
//        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
        
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
    }
}

extension SprawlSubmitFreeStatus: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return powderAssignFascinatingLeague.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountrysideRewindInternal", for: indexPath) as! CountrysideRewindInternal
        
        let priestRebuildBestReligion = powderAssignFascinatingLeague[indexPath.row]
        
        
        
        cell.uniqueDevelopConciseSport.text = "Mínimo: \(priestRebuildBestReligion.minimum)dB"
        cell.proceedAssessAppreciative.text = "Máximo: \(priestRebuildBestReligion.maximum)dB"
        cell.witherRecoverContemporaryMeeting.text = "Promedio: \(priestRebuildBestReligion.average)dB"
        
        let sturdyWaveInvincible = DateFormatter()
        sturdyWaveInvincible.locale = Locale(identifier: "es_ES")
        sturdyWaveInvincible.dateStyle = .medium

        cell.lookaroundUnpackLegendaryAircraft.text = priestRebuildBestReligion.currentDate
        
        cell.scantExplainImpressive.progress = Double(priestRebuildBestReligion.minimum)/100
        cell.cautionExpandLucky.progress = Double(priestRebuildBestReligion.maximum)/100
        cell.contractOrderEffective.progress = Double(priestRebuildBestReligion.average)/100
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
