//
//  ViewController.swift
//  TAX_COLLECTION
//
//  Created by Long Nguyen on 3/12/20.
//  Copyright © 2020 Ho Tin Nghia Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playerA: UITextField!
    @IBOutlet weak var playerB: UITextField!
    @IBOutlet var textFields: [UITextField]!
    
    @IBAction func startGame(_ sender: UIButton) {
        if playerA.text != "" && playerB.text != "" {
        performSegue(withIdentifier: "toGameBoard", sender: self)
        }
        else {
            let message = "Please input your names!"
            let alertController = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func textInputA(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func textInputB(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func topContainerTap(_ sender: UIControl) {
        for name in textFields {
            name.resignFirstResponder()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let secondView = segue.destination as? PlayViewController {
            secondView.nameAstorage = playerA.text!
            secondView.nameBstorage = playerB.text!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

