

import UIKit
import CoreData
import MKRingProgressView

class RecordsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var alertLabel: UILabel!
    
    var managedObjextContext: NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        managedObjextContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        loadData()
        
        tableView.dataSource = self
        tableView.delegate = self

        checkCoreData()
        setupUserInterface()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    
    func loadData(){
        let dbDataRequest: NSFetchRequest<SoundData> = SoundData.fetchRequest()
        
        do {
            dbDataValues = try managedObjextContext.fetch(dbDataRequest)
            self.tableView.reloadData()
        } catch {
            print("Could not load data from database \(error.localizedDescription)")
        }
    }
    
    func checkCoreData() {
        if dbDataValues.count == 0 {
            print("CORE DATA IS EMPTY")
            alertLabel.isHidden = false
        } else {
            alertLabel.isHidden = true
        }
    }
    
    func setupUserInterface() {
//        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
        
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
    }
}

extension RecordsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dbDataValues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecordsCell", for: indexPath) as! RecordsCell
        
        let dbItem = dbDataValues[indexPath.row]
        
        cell.minimumLabel.text = "Minimum: \(dbItem.minimum)dB"
        cell.maximumLabel.text = "Maximum: \(dbItem.maximum)dB"
        cell.averagelLabel.text = "Average: \(dbItem.average)dB"
        cell.datelabel.text = dbItem.currentDate
        
        cell.minimumProgressView.progress = Double(dbItem.minimum)/100
        cell.maximumProgressView.progress = Double(dbItem.maximum)/100
        cell.averageProgressView.progress = Double(dbItem.average)/100
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
