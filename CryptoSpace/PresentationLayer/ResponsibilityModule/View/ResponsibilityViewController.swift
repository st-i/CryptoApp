//
//  ResponsibilityViewController.swift
//  CryptoSpace
//
//  Created by st.i on 28.01.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class ResponsibilityViewController: UIViewController {

    @IBOutlet weak var exclamationSignView: UIView!
    @IBOutlet weak var exclamationSignLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exclamationSignView.layer.cornerRadius = exclamationSignView.frame.width/2
        exclamationSignView.layer.borderWidth = 4
        exclamationSignView.layer.borderColor = UIColor.graphColumnsColor().cgColor
        exclamationSignView.backgroundColor = UIColor.clear
        
        exclamationSignLabel.textColor = UIColor.graphColumnsColor()
        
        let titleView = UIView.init(frame: CGRect(x: 0, y: 0, width: 160, height: 30))
        let titleViewLabel = UILabel.init(frame: titleView.frame)
        titleViewLabel.textAlignment = .center
        titleViewLabel.font = UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.medium)
        titleViewLabel.textColor = UIColor.white
        titleViewLabel.text = "Ответственность"
        titleView.addSubview(titleViewLabel)
        self.navigationItem.titleView = titleView
    }
}
