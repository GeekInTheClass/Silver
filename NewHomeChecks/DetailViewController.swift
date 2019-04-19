//
//  DetailViewController.swift
//  NewHomeChecks
//
//  Created by jjy on 2019. 4. 19..
//  Copyright © 2019년 MeiGuoFanDian. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var TempElement = Element(Title: "가칭", Type: .Text)
    
    @IBOutlet weak var this_title: UILabel!
    
    @IBOutlet weak var this_detail: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        this_title.text = TempElement.Title
        this_detail.text = TempElement.Show()
        // Do any additional setup after loading the view.
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
