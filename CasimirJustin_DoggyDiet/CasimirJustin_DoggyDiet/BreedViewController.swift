//
//  BreedViewController.swift
//  CasimirJustin_DoggyDiet
//
//  Created by Justin Casimir on 5/23/19.
//  Copyright © 2019 Justin Casimir. All rights reserved.
//

import UIKit

import SwiftKeychainWrapper


class BreedViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var breedGroup: UILabel!
    @IBOutlet weak var temperament: UILabel!
    @IBOutlet weak var lifeSpan: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    
    var id : Int = 0
    var changingText : String = ""
    
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    
    var breedInfo = [BreedInfo]()
    var urlInfo = [URLInfo]()

    override func viewDidLoad() {

        
        loadingData(jsonAtUrl: "https://api.thedogapi.com/v1/breeds/search?q=a")

        
        super.viewDidLoad()
        
        
        
    // Do any additional setup after loading the view.
    }
   

    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        
        
        
        
        changingText = sender.text ?? ""
       
        loadingData(jsonAtUrl: "https://api.thedogapi.com/v1/breeds/search?q=\(changingText)")
            
            
            
            
        
        


    }
    
    

    
    
    @IBAction func textFieldEditingDidEnd(_ sender: UITextField) {
        breedInfo.removeAll()

    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func loadingData(jsonAtUrl urlString: String) {

        let config = URLSessionConfiguration.default
        
        let session = URLSession(configuration: config)
        
        if let validURL = URL(string: urlString){
            
            var request = URLRequest(url: validURL)
            
            //Putting in key and requesting
            request.setValue("da375378-ca59-4b63-aa78-7f3ad2aeace4", forHTTPHeaderField: "x-api-key")
            
            request.httpMethod = "GET"
            
            let task = session.dataTask(with: request, completionHandler: {(data, response, error) in
                
                if error != nil { return }
                
                //Check the response, statusCode, and data
                guard let response = response as? HTTPURLResponse,
                    response.statusCode == 200,
                    let data = data
                    else { return }
                
                do {
                    //De-Serialize data object
                    if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [Any] {
                        for object in json {
                            guard let object = object as? [String : Any],
                                let name = object["name"] as? String,
                                let breedGroup = object["breed_group"] as? String,
                                let temperament = object["temperament"] as? String,
                                let lifeSpan = object["life_span"] as? String,
                                let id = object["id"] as? Int
                                else{continue}
                            
                            print(name, breedGroup, temperament, lifeSpan, id)
                            
                            self.breedInfo.append(BreedInfo(name: name, breedGroup: breedGroup, temperament: temperament, lifeSpan: lifeSpan, id: id))

                        }
                        
                    }
                }
                catch{
                    print(error.localizedDescription)
                    
                }
                //Running the reloadData on the asynchonously so it does run with main thread.
                DispatchQueue.main.async {
                    
                    
                    self.name.text = self.breedInfo.first?.name
                    self.breedGroup.text = self.breedInfo.first?.breedGroup
                    self.temperament.text = self.breedInfo.first?.temperament
                    self.lifeSpan.text = self.breedInfo.first?.lifeSpan
                    self.check()
                    self.loadingData2(jsonAtUrl: "https://api.thedogapi.com/v1/images/search?breed_ids=\(self.id)")

                    self.breedInfo.removeAll()
                    

                }
            })
            task.resume()
            
        }
    }
    
    
    
    func loadingData2(jsonAtUrl urlString: String){
        
        let config = URLSessionConfiguration.default
        
        let session = URLSession(configuration: config)
        
        if let validURL = URL(string: urlString){
            
            var request = URLRequest(url: validURL)
            
            //Putting in key and requesting
            request.setValue("da375378-ca59-4b63-aa78-7f3ad2aeace4", forHTTPHeaderField: "x-api-key")
            
            request.httpMethod = "GET"
            
            let task = session.dataTask(with: request, completionHandler: {(data, response, error) in
                
                if error != nil { return }
                
                //Check the response, statusCode, and data
                guard let response = response as? HTTPURLResponse,
                    response.statusCode == 200,
                    let data = data
                    else { return }
                
                do {
                    //De-Serialize data object
                    if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [Any] {
                        for object in json {
                             let object = object as? [String : Any]
                            let url = object?["url"] as? String
                            if let breeds = object?["breeds"] as? [Any]{
                                for object in breeds {
                                    let object = object as? [String : Any]
                                    let id = object?["id"] as? Int
                                    
                                    self.urlInfo.append(URLInfo(id: id!, url: url!))
                                    
                                }

                            }
                            
                        }
                        
                    }
                }
                catch{
                    print(error.localizedDescription)
                    
                }
                //Running the reloadData on the asynchonously so it does run with main thread.
                DispatchQueue.main.async {
                }
            })
            task.resume()
            
        }
    }
    
    func check(){
      
    
    
    
    

}
}
