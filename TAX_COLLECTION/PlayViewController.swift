//
//  PlayViewController.swift
//  TAX_COLLECTION
//
//  Created by Long Nguyen on 3/12/20.
//  Copyright © 2020 Ho Tin Nghia Le. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {

    @IBOutlet weak var nameA: UILabel!
    @IBOutlet weak var nameB: UILabel!
    
    var nameAstorage = ""
    var nameBstorage = ""
    
    @IBOutlet weak var B0: UIButton! //Outlet for Collection B
    @IBOutlet weak var B1: UIButton!
    @IBOutlet weak var B2: UIButton!
    @IBOutlet weak var B3: UIButton!
    @IBOutlet weak var B4: UIButton!
    @IBOutlet weak var B5: UIButton!
    @IBOutlet weak var BB: UIButton! //Outlet for treasury B
    
    @IBOutlet weak var A0: UIButton! //Outlet for Collection A
    @IBOutlet weak var A1: UIButton!
    @IBOutlet weak var A2: UIButton!
    @IBOutlet weak var A3: UIButton!
    @IBOutlet weak var A4: UIButton!
    @IBOutlet weak var A5: UIButton!
    @IBOutlet weak var AA: UIButton! //Outlet for treasury A
    
    @IBOutlet var AllButtons: [UIButton]! //Outlet for all the banks
    
    
    @IBOutlet var AButton: [UIButton]! //Outlet for 5 left banks
    @IBOutlet var BButton: [UIButton]! //Outlet for 5 right banks
    
    var Array: [Int] = [5,5,5,5,5,10,5,5,5,5,5,10]
    var CollectionA = 0
    var CollectionB = 0
    
    //Setup deselect button
    @IBAction func CancelSelection(_ sender: UIButton) {
        for i in AllButtons {
            i.backgroundColor = UIColor.darkGray
        }
    }
    
    func CheckEmptyA() -> Bool {
        if A1.title(for: UIControl.State.normal) == "0" && A2.title(for: .normal) == "0" && A3.title(for: .normal) == "0" && A4.title(for: .normal) == "0" && A5.title(for: .normal) == "0" {
                let message = "Please click your collection to refill the banks!"
                let alertController = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(cancelAction)
                present(alertController, animated: true, completion: nil)
                return true
        }
        else {
            return false
        }
    }
    
    func CheckEmptyB() -> Bool {
        if B1.title(for: .normal) == "0" && B2.title(for: .normal) == "0" && B3.title(for: .normal) == "0" && B4.title(for: .normal) == "0" && B5.title(for: .normal) == "0" {
                let message = "Please click your collection to refill the banks!"
                let alertController = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(cancelAction)
                present(alertController, animated: true, completion: nil)
                return true
        }
        else {
            return false
        }
    }
    
    //Setup changing color for button selected
    @IBAction func SelectButton(_ sender: UIButton) {
        var checkA = false
        var checkB = false
        if sender.tag == 0 || sender.tag == 1 || sender.tag == 2 || sender.tag == 3 || sender.tag == 4 {
            checkA = CheckEmptyA()
        }
        if sender.tag == 6 || sender.tag == 7 || sender.tag == 8 || sender.tag == 9 || sender.tag == 10 {
            checkB = CheckEmptyB()
        }
        if checkA == true || checkB == true {
            sender.backgroundColor = UIColor.darkGray
        }
        else {
            sender.backgroundColor = UIColor.red
        }
    }
    
    func reset() {
        Array = [5,5,5,5,5,10,5,5,5,5,5,10]
        CollectionA = 0
        CollectionB = 0
        A1.setTitle("5", for: .normal)
        A2.setTitle("5", for: .normal)
        A3.setTitle("5", for: .normal)
        A4.setTitle("5", for: .normal)
        A5.setTitle("5", for: .normal)
        AA.setTitle("10", for: .normal)
        B1.setTitle("5", for: .normal)
        B2.setTitle("5", for: .normal)
        B3.setTitle("5", for: .normal)
        B4.setTitle("5", for: .normal)
        B5.setTitle("5", for: .normal)
        BB.setTitle("10", for: .normal)

        A0.setTitle("0", for: .normal)
        B0.setTitle("0", for: .normal)
    }
    
    @IBAction func Replay(_ sender: UIButton) {
        reset()
    }
    
    
    func prepareArray() {
        CollectionA = Int(A0.title(for: .normal)!)!
        CollectionB = Int(B0.title(for: .normal)!)!
        
        Array[0] = Int(A1.title(for: .normal)!)!
        Array[1] = Int(A2.title(for: .normal)!)!
        Array[2] = Int(A3.title(for: .normal)!)!
        Array[3] = Int(A4.title(for: .normal)!)!
        Array[4] = Int(A5.title(for: .normal)!)!
        Array[5] = Int(AA.title(for: .normal)!)!
        Array[6] = Int(B1.title(for: .normal)!)!
        Array[7] = Int(B2.title(for: .normal)!)!
        Array[8] = Int(B3.title(for: .normal)!)!
        Array[9] = Int(B4.title(for: .normal)!)!
        Array[10] = Int(B5.title(for: .normal)!)!
        Array[11] = Int(BB.title(for: .normal)!)!
    }
    
    func updateTable() {
        A1.setTitle(String(Array[0]), for: .normal)
        A2.setTitle(String(Array[1]), for: .normal)
        A3.setTitle(String(Array[2]), for: .normal)
        A4.setTitle(String(Array[3]), for: .normal)
        A5.setTitle(String(Array[4]), for: .normal)
        AA.setTitle(String(Array[5]), for: .normal)
        B1.setTitle(String(Array[6]), for: .normal)
        B2.setTitle(String(Array[7]), for: .normal)
        B3.setTitle(String(Array[8]), for: .normal)
        B4.setTitle(String(Array[9]), for: .normal)
        B5.setTitle(String(Array[10]), for: .normal)
        BB.setTitle(String(Array[11]), for: .normal)
                
        A0.setTitle(String(CollectionA), for: .normal)
        B0.setTitle(String(CollectionB), for: .normal)
    }
    
    func announcement() {
        if AA.title(for: UIControl.State.normal) == "0" && BB.title(for: UIControl.State.normal) == "0" {
            CollectionA += Array[0] + Array[1] + Array[2] + Array[3] + Array[4]
            CollectionB += Array[6] + Array[7] + Array[8] + Array[9] + Array[10]
            print("\n")
            for i in 0...11 {
                Array[i] = 0
                print (Array[i])
            }
            updateTable()
            let FinalACollection = A0.title(for: .normal)
            let FinalBCollection = B0.title(for: .normal)
            if Int(A0.title(for: .normal)!)! > Int(B0.title(for: .normal)!)! {
                let message = "\(String(nameA.text!)) collected \(String(FinalACollection!)) dollars. \n \(String(nameB.text!)) collected \(String(FinalBCollection!)) dollars. \n \(String(nameA.text!)) wins!"
                let alertController = UIAlertController(title: "Announcement", message: message, preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(cancelAction)
                present(alertController, animated: true, completion: nil)
            }
            else if Int(A0.title(for: .normal)!)! < Int(B0.title(for: .normal)!)! {
                let message = "\(String(nameA.text!)) collected \(String(FinalACollection!)) dollars. \n \(String(nameB.text!)) collected \(String(FinalBCollection!)) dollars. \n \(String(nameB.text!)) wins!"
                let alertController = UIAlertController(title: "Announcement", message: message, preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(cancelAction)
                present(alertController, animated: true, completion: nil)
            }
            else {
                let message = "Both \(String(nameA.text!)) and \(String(nameB.text!)) collected \(String(FinalACollection!)) dollars. \n Draw Game!"
                let alertController = UIAlertController(title: "Announcement", message: message, preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(cancelAction)
                present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    //Setup swipeUp
    @objc func swipeActionUp(swipe: UISwipeGestureRecognizer) {
        
        //Update the array and 2 collections
        prepareArray()
        
        //SwipeUp for left side
        for buttonA in AButton {
            if buttonA.backgroundColor == UIColor.red {
                buttonA.backgroundColor = UIColor.darkGray
                print("Save buttonA.tag",buttonA.tag)
                var onHand = Int(buttonA.title(for: .normal)!)!
                Array[buttonA.tag] = 0
                
                var k = buttonA.tag
                
                while (true) {
                    print("pre-onhand", onHand)
                    k += 1
                    if k > 11 {k = 0}
                    print("Next k", k)
                    Array[k] += 1
                    print("Next Bank",Array[k])
                    onHand -= 1
                    print("On hand", onHand)
                    var collectbag = false
                    //Setup condition when no more dollar is on hand
                    if onHand == 0 {
                        //Setup to collect dollar if next spot is blank
                        var temp = k //current spot
                        while (true) {
                            var m = temp
                            if m == 11 { m = -1 }
                            if Array[m+1] == 0 {
                                if m == 10 { m = -2 }
                                let collect = Array[m+2]
                                if collect == 0 {
                                    collectbag = true
                                    break
                                }
                                else {
                                    Array[m+2] = 0
                                    CollectionA += collect
                                    temp += 2
                                    if temp == 12 { temp = 0 }
                                    if temp == 13 { temp = 1 }
                                    print ("tempt", temp)
                                    collectbag = true
                                }
                            }
                            else {break}
                        }
                        if collectbag == true {break}
                        if k == 11 { k = -1 }
                        if Array[k+1] != 0 {
                            if k+1 == 5 || k+1 == 11 {
                                print("CollectionA", CollectionA)
                                print("DeadEnd k.tag", k)
                                break
                            }
                            else {
                                onHand = Array[k+1]
                                Array[k+1] = 0
                                k += 1
                                print("End k", k)
                            }
                        }
                    }
                }
            }
        }
        
        //SwipeUp for right side
        for buttonB in BButton {
            if buttonB.backgroundColor == UIColor.red {
                buttonB.backgroundColor = UIColor.darkGray
                print("Save buttonB.tag",buttonB.tag)
                var onHand = Int(buttonB.title(for: .normal)!)!
                Array[buttonB.tag] = 0
                
                var k = buttonB.tag
                
                while (true) {
                    print("pre-onhand", onHand)
                    k -= 1
                    if k < 0 { k = 11 }
                    print("Next k", k)
                    Array[k] += 1
                    print("Next Bank",Array[k])
                    onHand -= 1
                    print("On hand", onHand)
                    var collectbag = false
                    //Setup condition when no more dollar is on hand
                    if onHand == 0 {
                        //Setup to collect dollar if  next spot is blank
                        var temp = k //current spot
                        while (true) {
                            var m = temp
                            if m == 0 { m = 12 }
                            if Array[m-1] == 0 {
                                if m == 1 { m = 13 }
                                let collect = Array[m-2]
                                if collect == 0 {
                                    collectbag = true
                                    break
                                }
                                else {
                                    Array[m-2] = 0
                                    CollectionB += collect
                                    temp -= 2
                                    if temp == -1 { temp = 11 }
                                    if temp == -2 { temp = 10 }
                                    print ("tempt", temp)
                                    collectbag = true
                                }
                            }
                            else {break}
                        }
                        if collectbag == true {break}
                        if k == 0 { k = 12 }
                        if Array[k-1] != 0 {
                            if k-1 == 11 || k-1 == 5 {
                                print("CollectionB", CollectionB)
                                print("DeadEnd k", k)
                                break
                            }
                            else {
                                onHand = Array[k-1]
                                Array[k-1] = 0
                                k -= 1
                                print("End k", k)
                            }
                        }
                    }
                }
            }
        }
        
        for h in Array {
            print(h)
        }
        
        //Table
        updateTable()
        announcement()
        
    }

    //Setup swipeDown
    @objc func swipeActionDown(swipe: UISwipeGestureRecognizer) {
        
        //Update the array and 2 collections
        prepareArray()
        
        //SwipeDown for right side
        for buttonB in BButton {
            if buttonB.backgroundColor == UIColor.red {
                buttonB.backgroundColor = UIColor.darkGray
                print("Save buttonB.tag",buttonB.tag)
                var onHand = Int(buttonB.title(for: .normal)!)!
                Array[buttonB.tag] = 0
                
                var k = buttonB.tag
                
                while (true) {
                    print("pre-onhand", onHand)
                    k += 1
                    if k > 11 {k = 0}
                    print("Next k", k)
                    Array[k] += 1
                    print("Next Bank",Array[k])
                    onHand -= 1
                    print("On hand", onHand)
                    var collectbag = false
                    //Setup condition when no more dollar is on hand
                    if onHand == 0 {
                        //Setup to collect dollar if next spot is blank
                        var temp = k //current spot
                        while (true) {
                            var m = temp
                            if m == 11 { m = -1 }
                            if Array[m+1] == 0 {
                                if m == 10 { m = -2 }
                                let collect = Array[m+2]
                                if collect == 0 {
                                    collectbag = true
                                    break
                                }
                                else {
                                    Array[m+2] = 0
                                    CollectionB += collect
                                    temp += 2
                                    if temp == 12 { temp = 0 }
                                    if temp == 13 { temp = 1 }
                                    print ("tempt", temp)
                                    collectbag = true
                                }
                            }
                            else {break}
                        }
                        if collectbag == true {break}
                        if k == 11 { k = -1 }
                        if Array[k+1] != 0 {
                            if k+1 == 5 || k+1 == 11 {
                                print("CollectionB", CollectionB)
                                print("DeadEnd k.tag", k)
                                break
                            }
                            else {
                                onHand = Array[k+1]
                                Array[k+1] = 0
                                k += 1
                                print("End k", k)
                            }
                        }
                    }
                }
            }
        }
        
        //SwipeDown for left side
        for buttonA in AButton {
            if buttonA.backgroundColor == UIColor.red {
                buttonA.backgroundColor = UIColor.darkGray
                print("Save buttonA.tag",buttonA.tag)
                var onHand = Int(buttonA.title(for: .normal)!)!
                Array[buttonA.tag] = 0
                
                var k = buttonA.tag
                
                while (true) {
                    print("pre-onhand", onHand)
                    k -= 1
                    if k < 0 { k = 11 }
                    print("Next k", k)
                    Array[k] += 1
                    print("Next Bank",Array[k])
                    onHand -= 1
                    print("On hand", onHand)
                    var collectbag = false
                    //Setup condition when no more dollar is on hand
                    if onHand == 0 {
                        //Setup to collect dollar if  next spot is blank
                        var temp = k //current spot
                        while (true) {
                            var m = temp
                            if m == 0 { m = 12 }
                            if Array[m-1] == 0 {
                                if m == 1 { m = 13 }
                                let collect = Array[m-2]
                                if collect == 0 {
                                    collectbag = true
                                    break
                                }
                                else {
                                    Array[m-2] = 0
                                    CollectionA += collect
                                    temp -= 2
                                    if temp == -1 { temp = 11 }
                                    if temp == -2 { temp = 10 }
                                    print ("tempt", temp)
                                    collectbag = true
                                }
                            }
                            else {break}
                        }
                        if collectbag == true {break}
                        if k == 0 { k = 12 }
                        if Array[k-1] != 0 {
                            if k-1 == 11 || k-1 == 5 {
                                print("CollectionB", CollectionA)
                                print("DeadEnd k", k)
                                break
                            }
                            else {
                                onHand = Array[k-1]
                                Array[k-1] = 0
                                k -= 1
                                print("End k", k)
                            }
                        }
                    }
                }
            }
        }
        
        for h in Array {
            print(h)
        }
        
        //Update Table
        updateTable()
        announcement()
    }
    
    @IBAction func AAAct(_ sender: UIButton) {
        
        //Check if all the banks of District A have no money
        if A1.title(for: UIControl.State.normal) == "0" && A2.title(for: .normal) == "0" && A3.title(for: .normal) == "0" && A4.title(for: .normal) == "0" && A5.title(for: .normal) == "0" {
            
            //Update Array
            for i in 0...4 {
                Array[i] = 1
            }
            
            //Update Collection A
            CollectionA = Int(A0.title(for: .normal)!)! - 5
            
            updateTable()
        }
        else {
            let message = "Click this button only when all your banks are empty!"
            let alertController = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func BBAct(_ sender: UIButton) {
        
        //Check if all the banks of District B have no money
        if B1.title(for: .normal) == "0" && B2.title(for: .normal) == "0" && B3.title(for: .normal) == "0" && B4.title(for: .normal) == "0" && B5.title(for: .normal) == "0" {
            
            //Update Array
            for i in 6...10 {
                Array[i] = 1
            }
            //Update Collection B
            CollectionB = Int(B0.title(for: .normal)!)! - 5
            
            updateTable()
        }
        else {
            let message = "Click this button only when all your banks are empty!"
            let alertController = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        nameA.text = nameAstorage
        nameB.text = nameBstorage
        
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeActionUp(swipe:)))
        upSwipe.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(upSwipe)
        
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeActionDown(swipe:)))
        downSwipe.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(downSwipe)
    }
}

