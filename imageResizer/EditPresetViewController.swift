//
//  EditPresetViewController.swift
//  imageResizer
//
//  Created by Jared Kozar on 6/20/21.
//

import UIKit

class EditPresetViewController: UIViewController {


    @IBOutlet var editedHeightField: UITextField!
    
    @IBOutlet var editedWidthField: UITextField!
    
    @IBOutlet var savePresetButton: StandardButton!
    let nc = NotificationCenter.default
    var height = String()
    var width = String()
    let editedDimension = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.preferredContentSize = CGSize(width: 400, height: 250)
        self.savePresetButton.isEnabled = false
        savePresetButton.alpha = 0.5;
        editedWidthField.text = width
        editedHeightField.text = height
        
    }
    
    override func viewWillLayoutSubviews() {
       let width = self.view.frame.width
       let navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 4, width: width, height: 60))
       self.view.addSubview(navigationBar);
       let navigationItem = UINavigationItem(title: "Edit Preset")

       navigationBar.setItems([navigationItem], animated: false)
    }
    
    
    @IBAction func checkText(_ sender: Any) {
        if editedHeightField.text!.isEmpty || editedWidthField.text!.isEmpty {
            self.savePresetButton.isEnabled = false
            savePresetButton.alpha = 0.5;
        } else {
            self.savePresetButton.isEnabled = true
            savePresetButton.alpha = 1.0;
        }
    }
    
    @IBAction func saveEditPresetButtonTapped(_ sender: Any) {
        
        let editedWidth = editedWidthField.text
        let editedHeight = editedHeightField.text
        
        let editedDimension = "\(editedHeight!) x \(editedWidth!)"
        UserDefaults.standard.set(editedDimension, forKey: "editedDimension")
        dismiss(animated: true, completion: nil)
        
        NotificationCenter.default.post(name: Notification.Name( "editedPreset"), object: nil)
    }
}
