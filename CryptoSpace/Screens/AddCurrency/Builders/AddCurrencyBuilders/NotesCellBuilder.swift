//
//  NotesCellBuilder.swift
//  CryptoSpace
//
//  Created by iStef on 27.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

private let kNotesCellIdentifier = "NotesCell"

class NotesCellBuilder: NSObject {
    
    class func buildNotesCell(for tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kNotesCellIdentifier) as! NotesCell
        cell.selectionStyle = .none
        cell.notesTextView.autocorrectionType = .no
//        cell.contentView.backgroundColor = UIColor.groupTableViewBackground
        
        return cell
    }
}
