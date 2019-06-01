//
//  ViewController.swift
//  CasimirJustin_DoggyDiet
//
//  Created by Justin Casimir on 5/16/19.
//  Copyright © 2019 Justin Casimir. All rights reserved.
//
import UIKit
import SwiftKeychainWrapper

class ViewController: UIViewController {
    
    
    

    
    
    // FIELDS
    @IBOutlet weak var fieldWeight: UITextField!
    @IBOutlet weak var fieldAge: UITextField!
    
    //BUTTONS
    @IBOutlet weak var btnMeasure: UIButton!
    @IBOutlet weak var switchMonth: UISwitch!
    
    @IBOutlet weak var textView: UITextView!
    var cups : Double = 0
    var calories : Int = 0
    var weight : Double = 0
    var age : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Function to measure food intakett
    @IBAction func pressMeasure(_ sender: Any) {
        
        
        if Double(fieldAge.text!) != nil && Double(fieldWeight.text!) != nil{
            let newAge = Double(fieldAge.text ?? "")
            let newWeight = Double(fieldWeight.text ?? "")
            
            age = newAge!
            weight = newWeight!
            
            
            if weight <= 3 {
                cups = 1/3
                calories = 139
            }
            else if weight <= 6 {
                cups = 1/2
                calories = 233
            }
            else if weight <= 10 {
                cups = 3/4
                calories = 342
            }
            else if weight <= 15 {
                cups = 1
                calories = 464
            }
            else if weight <= 20 {
                cups = 1.33
                calories = 576
            }
            else if weight <= 30 {
                cups = 1.75
                calories = 781
            }
            else if weight <= 40 {
                cups = 2.25
                calories = 969
            }
            else if weight <= 50 {
                cups = 2.66
                calories = 1145
            }
            else if weight <= 50 {
                cups = 2.66
                calories = 1145
            }
            else if weight <= 60 {
                cups = 3
                calories = 1145
            }
            else if weight <= 70 {
                cups = 3.50
                calories = 1313
            }
            else if weight <= 80 {
                cups = 3.75
                calories = 1629
            }
            else if weight <= 90 {
                cups = 2.66
                calories = 1
            }
            else if weight > 99.9 {
                cups = 4.25
                calories = 1926
                
                if weight >= 110 {
                    cups += 0.33
                    calories += 139
                }
                
                if weight >= 120 {
                    cups += 0.33
                    calories += 139
                }
                if weight >= 130 {
                    cups += 0.33
                    calories += 139
                }
                if weight >= 140 {
                    cups += 0.33
                    calories += 139
                }
                if weight >= 150 {
                    cups += 0.33
                    calories += 139
                }
                if weight >= 160 {
                    cups += 0.33
                    calories += 139
                }
                if weight >= 170 {
                    cups += 0.33
                    calories += 139
                }
                if weight >= 180 {
                    cups += 0.33
                    calories += 139
                }
                if weight >= 190 {
                    cups += 0.33
                    calories += 139
                }
                if weight >= 200 {
                    cups += 0.33
                    calories += 139
                }
                if weight >= 210 {
                    cups += 0.33
                    calories += 139
                }
                if weight >= 220 {
                    cups += 0.33
                    calories += 139
                }
                

            }
            
            
            
            if switchMonth.isOn == true {
                if age < 3{
                    cups *= 2
                    calories *= 2
                    
                }
                else if age < 8{
                    cups *= 1/2
                    calories *= 1/2
                }
                
            }
            textView.text = "Your dog should eat \(cups) cups of food, and he/she will consume \(calories) calories"
            
            if weight > 220 {
                textView.text = "Are you sure your dog is this big? Please enter a valid weight."
            
            }
            
            
         
        }
        
        
    }
    
    
    
    @IBAction func saveButton(_ sender: Any) {

        let _: Bool = KeychainWrapper.standard.set("Your dog should eat \(cups) cups of food, and he/she will consume \(calories) calories", forKey: "result")
        
    }
    
    
    @IBAction func loadButton(_ sender: Any) {
        let string: String? = KeychainWrapper.standard.string(forKey: "result")
        
        textView.text = string
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    
    
}

