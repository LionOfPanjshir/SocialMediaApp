//
//  EditTableViewCell.swift
//  SocialMediaApp
//
//  Created by Andrew Higbee on 11/1/23.
//

import UIKit

protocol EditTableViewCellDelegate: AnyObject {
    func editTableViewCell(didGetPost post: Post)
}

class EditTableViewCell: UITableViewCell {
    

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextField!
    @IBOutlet weak var commentsTextField: UITextField!
    
    var post: Post?
    
    weak var delegate: EditTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if let post = post {
            userTextField.text = post.user
            dateLabel.text = post.date.formatted(date: .abbreviated, time: .omitted)
            titleTextField.text = post.title
            bodyTextField.text = post.bodyText
            commentsTextField.text = post.comments
        }
        // Initialization code
//        guard let userName = userTextField.text else { return }
//        dateLabel.text = Date().formatted(date: .abbreviated, time: .omitted)
//        let dateFormat = "MMM d, yyyy"
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = dateFormat
//        guard let dateString = dateLabel.text else { return }
//        guard let date = dateFormatter.date(from: dateString) else { return }
//        guard let title = titleTextField.text else { return }
//        guard let body = bodyTextField.text else { return }
//        guard let comments = commentsTextField.text else { return }
//        post = Post(title: title, bodyText: body, date: date, user: userName, comments: comments)
//        delegate?.editTableViewCell(didGetPost: post!)
    }

//    func update(with post: Post) {
//        self.post = post
//        userTextField.text = post.user
//        dateLabel.text = Date().formatted(date: .abbreviated, time: .omitted)
//        titleTextField.text = post.title
//        bodyTextField.text = post.bodyText
//        commentsTextField.text = post.comments
//    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
