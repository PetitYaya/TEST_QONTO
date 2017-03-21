//
//  UsersListViewController.swift
//  QontoTest
//
//  Created by Yacine on 21/03/2017.
//  Copyright © 2017 Yacine YAZMAN. All rights reserved.
//

import UIKit

class UsersListViewController: UITableViewController {

    // MARK: - Properties
    static let seguePushUserAlbums = "pushUserAlbums"
    
    fileprivate var users: [User]? {
        didSet {
            tableView.reloadData()
        }
    }
    fileprivate var selectedUser: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users"
        
        UsersService.users { [weak self] (result) in
            switch result {
            case .Success(let downloadedUsers):
                self?.users = downloadedUsers
                break
            }
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: UserCell.identifier, for: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let users = users else { return }
        if let userCell = cell as? UserCell {
            let user = users[indexPath.row] as User
            userCell.configure(with: user.name)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let users = users else { return }
        let user = users[indexPath.row] as User
        selectedUser = user
        performSegue(withIdentifier: UsersListViewController.seguePushUserAlbums, sender: nil)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == UsersListViewController.seguePushUserAlbums {
                if let albumPhotosVC = segue.destination as? AlbumsListViewController, let user = selectedUser {
                    albumPhotosVC.configure(with: user)
                }
            }
        }
    }
}
