//
//  AboutAppViewController.swift
//  CryptoSpace
//
//  Created by st.i on 28.01.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class AboutAppViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleView = UIView.init(frame: CGRect(x: 0, y: 0, width: 140, height: 30))
        let titleViewLabel = UILabel.init(frame: titleView.frame)
        titleViewLabel.textAlignment = .center
        titleViewLabel.font = UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.medium)
        titleViewLabel.textColor = UIColor.white
        titleViewLabel.text = "О приложении"
        titleView.addSubview(titleViewLabel)
        self.navigationItem.titleView = titleView
    }
}
