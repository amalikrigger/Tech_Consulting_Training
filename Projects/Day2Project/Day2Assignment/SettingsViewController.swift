//
//  SettingsViewController.swift
//  Day2Assignment
//
//  Created by Amali Krigger on 8/31/23.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var settingsTableView: UITableView!
    var settings:Settings = Settings(settings: [
            0:
                [
                    Setting(name: "VoiceOver", icon: "person.wave.2.fill", state: "Off", category: .Vision),
                    Setting(name: "Zoom", icon: "dot.arrowtriangles.up.right.down.left.circle", state: "Off", category: .Vision),
                    Setting(name: "Display & Text Size", icon: "textformat", state: nil, category: .Vision),
                    Setting(name: "Motion", icon: "figure.walk.motion", state: nil, category: .Vision),
                    Setting(name: "Spoken Content", icon: "text.bubble.fill.rtl", state: nil, category: .Vision),
                    Setting(name: "Audio Descriptions", icon: "speaker.wave.2.bubble.left.fill", state: "Off", category: .Vision)
                ],
            1:
                [
                    Setting(name: "Touch", icon: "hand.point.up.left.fill", state: nil, category: .PhysicalAndMotor),
                    Setting(name: "Face ID & Attention", icon: "faceid", state: nil, category: .PhysicalAndMotor),
                    Setting(name: "Switch Control", icon: "switch.programmable.square", state: "Off", category: .PhysicalAndMotor),
                    Setting(name: "Voice Control", icon: "speaker.wave.2.bubble.left.fill.rtl",  state: "Off", category: .PhysicalAndMotor),
                    Setting(name: "Side Button", icon: "sidebar.left",  state: nil, category: .PhysicalAndMotor),
                    Setting(name: "Apple Watch Mirroring", icon: "applewatch.case.inset.filled", state: nil, category: .PhysicalAndMotor),
                    Setting(name: "Control Nearby Devices", icon: "iphone.homebutton.radiowaves.left.and.right", state: nil, category: .PhysicalAndMotor),
                    Setting(name: "Apple TV Remote", icon: "appletvremote.gen1.fill", state: nil, category: .PhysicalAndMotor),
                    Setting(name: "Keyboards", icon: "keyboard", state: nil, category: .PhysicalAndMotor)
                ],
            2:
                [
                    Setting(name: "Hearing Devices", icon: "square.and.arrow.up", state: nil, category: .Hearing),
                    Setting(name: "Sound Recognition", icon: "waveform.and.magnifyingglass",  state: "Off", category: .Hearing),
                    Setting(name: "Audio/Visual", icon: "speaker.circle.fill",  state: nil, category: .Hearing),
                    Setting(name: "Subtitles & Captioning", icon: "captions.bubble.fill", state: nil, category: .Hearing)
                ],
            3:
                [
                    Setting(name: "Guided Access", icon: "lock.square", state: "On", category: .General),
                    Setting(name: "Siri", icon: "smallcircle.filled.circle.fill", state: nil, category: .General),
                    Setting(name: "Accessibility Shortcut", icon: "figure.walk.arrival", state: "Ask", category: .General),
                    Setting(name: "Per-App Settings", icon: "gearshape.fill", state: nil, category: .General)
                ]
        ]
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.settings[section]?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingCell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath) as? SettingsTableViewCell
        settingCell?.settingsName.text = settings.settings[indexPath.section]?[indexPath.row].name
        settingCell?.settingsIcon.image = UIImage(systemName: settings.settings[indexPath.section]?[indexPath.row].icon ?? "square.and.arrow.up")
        settingCell?.settingsState.text = settings.settings[indexPath.section]?[indexPath.row].state ?? ""
        return settingCell ?? SettingsTableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settings.settings.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return settings.settings[section]?.first?.category.rawValue.uppercased()
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class Settings {
    var settings: [Int:[Setting]]
    init(settings: [Int:[Setting]]) {
        self.settings = settings
    }
}

struct Setting {
    let name:String
    let icon:String
    let state:String?
    let category:Category
    
    init(name:String, icon:String, state:String?, category:Category) {
        self.name = name
        self.icon = icon
        self.category = category
        self.state = state
    }
}

enum Category:String {
    case Vision = "Vision"
    case PhysicalAndMotor = "Physical And Motor"
    case Hearing = "Hearing"
    case General = "General"
}
