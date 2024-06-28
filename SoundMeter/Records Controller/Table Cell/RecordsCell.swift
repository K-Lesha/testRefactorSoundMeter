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
import MKRingProgressView

class RecordsCell: UITableViewCell {
    
    @IBOutlet weak var maximumLabel: UILabel!
    @IBOutlet weak var minimumLabel: UILabel!
    @IBOutlet weak var averagelLabel: UILabel!
    @IBOutlet weak var maximumProgressView: RingProgressView!
    @IBOutlet weak var minimumProgressView: RingProgressView!
    @IBOutlet weak var averageProgressView: RingProgressView!
    @IBOutlet weak var datelabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
