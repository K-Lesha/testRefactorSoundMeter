//
// THIS APPLICATION WAS DEVELOPED BY IURII DOLOTOV
//
// IF YOU HAVE ANY QUESTIONS PLEASE DO NOT TO HESITATE TO CONTACT ME VIA MARKETPLACE OR EMAIL: utilityman.development@gmail.com
//
// THE AUTHOR REMAINS ALL RIGHTS TO THE PROJECT
//
// THE ILLEGAL DISTRIBUTION IS PROHIBITED
//

import UIKit

class SettingsTableCell: UITableViewCell {

    @IBOutlet weak var settingsImage: UIImageView!
    @IBOutlet weak var optionLabel: UILabel!
    
    var tableContent: Settings! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        settingsImage.image = UIImage(named: tableContent.imageName)
        optionLabel.text = tableContent.settingsOption
    }
}
