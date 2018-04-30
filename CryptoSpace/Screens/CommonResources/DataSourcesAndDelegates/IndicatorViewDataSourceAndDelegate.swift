//
//  IndicatorViewDataSourceAndDelegate.swift
//  CryptoSpace
//
//  Created by st.i on 22.04.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

private let kIndicatorViewCellHeight = 50

class IndicatorViewDataSourceAndDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(kIndicatorViewCellHeight)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return IndicatorViewCellBuilder.buildCell(tableView) as! IndicatorViewCell
    }
}
