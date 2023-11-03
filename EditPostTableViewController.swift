//
//  EditPostTableViewController.swift
//  SocialMediaApp
//
//  Created by Andrew Higbee on 11/1/23.
//

import UIKit

class EditPostTableViewController: UITableViewController, EditTableViewCellDelegate {
    func editTableViewCell(didGetPost post: Post) {
        self.post = post
    }
    
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var bodyTextField: UITextField!
    
    @IBOutlet weak var commentsTextField: UITextField!
    
    var post: Post?
    
    init?(coder: NSCoder, post: Post?) {
        super.init(coder: coder)
        self.post = post
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let post = post {
            userTextField.text = post.user
            dateLabel.text = post.date.formatted(date: .abbreviated, time: .omitted)
            titleTextField.text = post.title
            bodyTextField.text = post.bodyText
            commentsTextField.text = post.comments
            title = "Edit Post"
        } else {
            dateLabel.text = Date().formatted(date: .abbreviated, time: .omitted)
            title = "Add Post"
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem

    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 1
//    }

//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "editCell", for: indexPath) as! EditTableViewCell
//
//        guard let post = post else { return cell }
//        cell.delegate = self
//        cell.post = post
//        cell.update(with: post)
//
//        return cell
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "saveUnwind" else { return }
        print(sender)
        //guard var post = post else { return }
        
        
//        guard let cell = sender as? EditTableViewCell, let indexPath = tableView.indexPath(for: cell) else { return }
        
        guard let user = userTextField.text else { return }
        let dateFormat = "MMM d, yyyy"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        guard let dateString = dateLabel.text else { return }
        guard let date = dateFormatter.date(from: dateString) else { return }
        guard let title = titleTextField.text else { return }
        guard let body = bodyTextField.text else { return }
        guard let comments = commentsTextField.text else { return }
        
        post = Post(title: title, bodyText: body, date: date, user: user, comments: comments)
    }
}
