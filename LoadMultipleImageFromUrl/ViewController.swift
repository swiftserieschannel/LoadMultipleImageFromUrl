//
//  ViewController.swift
//  LoadMultipleImageFromUrl
//
//  Created by chander bhushan on 01/04/19.
//  Copyright © 2019 Educational. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage
class ViewController: UITableViewController {

    var myData:MasterResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.getJSONData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData?.result?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell") as? MyTableViewCell
        cell?.label.text = myData?.result?[indexPath.row].name
        cell?.imageView?.sd_setShowActivityIndicatorView(true)
        cell?.imageView?.sd_setIndicatorStyle(UIActivityIndicatorView.Style.gray)
        cell?.imageView?.sd_setImage(with: URL(string: myData?.result?[indexPath.row]._links?.avatar?.href ?? ""), placeholderImage: #imageLiteral(resourceName: "download"), options: .handleCookies, completed: nil)
        return cell!

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func getJSONData(){
        Alamofire.request(URL(string: "https://gorest.co.in/public-api/users?_format=json&access-token=iXmeCn6s8Ro0l1GbEXiu5bBviQqdnflLprsd") ?? "").responseJSON { (response) in
            do {
                let myData = try JSONDecoder().decode(MasterResponse.self, from: response.data!)
                self.myData = myData
                self.tableView.reloadData()
            }catch let error {
                print(error.localizedDescription)
            }
        }
    }
}

