//
//  BreedViewController.swift
//  CasimirJustin_DoggyDiet
//
//  Created by Justin Casimir on 5/23/19.
//  Copyright © 2019 Justin Casimir. All rights reserved.
//

import UIKit

class BreedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadingData(jsonAtUrl: "https://api.thedogapi.com/v1/breeds/search?q=chi")

        // Do any additional setup after loading the view.
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
                        print(json)
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
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
