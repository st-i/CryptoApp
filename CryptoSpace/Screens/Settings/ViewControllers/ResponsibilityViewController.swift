//
//  ResponsibilityViewController.swift
//  CryptoSpace
//
//  Created by Иван Стефанов on 28.01.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class ResponsibilityViewController: UIViewController {

    @IBOutlet weak var exclamationSignView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exclamationSignView.layer.cornerRadius = exclamationSignView.frame.width/2
        
        let titleView = UIView.init(frame: CGRect(x: 0, y: 0, width: 160, height: 30))
        let titleViewLabel = UILabel.init(frame: titleView.frame)
        titleViewLabel.textAlignment = .center
        titleViewLabel.font = UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.medium)
        titleViewLabel.textColor = UIColor.white
        titleViewLabel.text = "Ответственность"
        titleView.addSubview(titleViewLabel)
        self.navigationItem.titleView = titleView

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
