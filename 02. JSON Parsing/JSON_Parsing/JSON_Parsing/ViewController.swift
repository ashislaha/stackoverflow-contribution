//
//  ViewController.swift
//  JSON_Parsing
//
//  Created by Ashis Laha on 06/12/17.
//  Copyright © 2017 Ashis Laha. All rights reserved.
//

import UIKit

struct Item : Decodable { // Properties must be the same name as specified in JSON , else it will return nil
    var Number : String
    var Name : String
}

struct Language : Decodable {
    var Field : [Item]
}

struct Result : Decodable {
    var Language : Language
}

class ViewController: UIViewController {

    let url = "http://www.mocky.io/v2/5a280c282f0000f92c0635e6"
    
    private func parseSinglePersonJSON() {
        guard let url = URL(string: url) else { return }
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            guard let result = try? JSONDecoder().decode(Result.self, from: data) else { return }
            print("\n\n Result : \(result)")
        }
        session.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseSinglePersonJSON()
    }
}

