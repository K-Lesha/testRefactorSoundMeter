
import UIKit
import MessageUI
import UserNotifications

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var tableContent: [Settings] = Settings.fetchSettings()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        setupUserInterface()
    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        hapticFeedback()
        self.performSegue(withIdentifier: "go_to_app", sender: self)
    }
    
    func rateApp() {
        if let url = URL(string: rateAppUrl){
            UIApplication.shared.open(url, options: [:], completionHandler: {(result) in
                if result {
                    print ("Success")
                } else {
                    print ("Failed")
                }
            })
        }
    }
    
    func showMailComposer() {
        guard MFMailComposeViewController.canSendMail() else {
            return
        }
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients([contactEmail])
        composer.setSubject("Noise Level - Question")
        composer.setMessageBody("Hello!\n\nSubject:\n\nName:\n\nMessage:\n\n", isHTML: false)
        present(composer, animated: true)
    }
    
    func hapticFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
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

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableCell", for: indexPath) as! SettingsTableCell
        
        let content = tableContent[indexPath.row]
        cell.tableContent = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let indexPath = tableView.indexPathForSelectedRow!
//        let currentCell = tableView.cellForRow(at: indexPath)! as! SettingsTableCell

        if indexPath.row == 0 {
            rateApp()
        } else if indexPath.row == 1 {
            showMailComposer()
        } else if indexPath.row == 2 {
            if let url = URL(string: privacyUrl) {
                UIApplication.shared.open(url)
            }
        } else if indexPath.row == 3 {
            if let url = URL(string: termsOfUseUrl) {
                UIApplication.shared.open(url)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension SettingsViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        if let _ = error {
            controller.dismiss(animated: true)
            return
        }
        switch result {
        case .cancelled:
            print("Cancelled")
        case .failed:
            print("Failed to send")
        case .saved:
            print("Saved")
        case .sent:
            print("Email Sent")
        default: break
        }
        controller.dismiss(animated: true)
    }
}
