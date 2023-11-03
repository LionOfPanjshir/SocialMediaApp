//
//  PostTableViewCell.swift
//  SocialMediaApp
//
//  Created by Andrew Higbee on 10/30/23.
//

import UIKit

/*
 protocol PlayerScoreDelegate {
     func scoreWasChanged(for player: Player, newScore: Int)
 }
 */



class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextField!
    @IBOutlet weak var commentsTextField: UITextField!
    
    var post: Post?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleTextField.isEnabled = false
        bodyTextField.isEnabled = false
        commentsTextField.isEnabled = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func update(with post: Post) {
        self.post = post
        userNameLabel.text = post.user
        dateLabel.text = post.date.formatted(date: .abbreviated, time: .omitted)
        titleTextField.text = post.title
        bodyTextField.text = post.bodyText
        commentsTextField.text = post.comments
    }
    
 
    
}
