//
//  AlbumsListViewController.swift
//  QontoTest
//
//  Created by Yacine on 21/03/2017.
//  Copyright © 2017 Yacine YAZMAN. All rights reserved.
//

import UIKit

class AlbumsListViewController: UITableViewController {

    static let seguePushAlbumsPhotos = "pushAlbumsPhotos"
    
    fileprivate var albums: [Album]? {
        didSet {
            tableView.reloadData()
        }
    }
    fileprivate var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Albums"
        
        AlbumsService.albums(with: user.id) { [weak self] (result) in
            switch result {
            case .Success(let downloadedAlbums):
                self?.albums = downloadedAlbums
                break
            }
        }
    }
    
    // MARK: - Public methods
    func configure(with user: User) {
        self.user = user
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: AlbumCell.identifier, for: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let albums = albums else { return }
        if let albumCell = cell as? AlbumCell {
            let album = albums[indexPath.row] as Album
            albumCell.configure(with: album.title)
        }
    }
}
