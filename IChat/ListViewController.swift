//
//  ListViewController.swift
//  IChat
//
//  Created by Commander on 26.09.2023.
//

import UIKit
import SwiftUI



class ListViewController: UIViewController {
  
    enum Section: Int, CaseIterable {
        case activeChats
    }
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Chat>?
    
    let mockChat: [Chat] = Bundle.main.decode([Chat].self, from: "activeChats.json")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupSearchBar()
        configureDataSource()
        reloadData()
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = UIColor(named: "titanWhite")
        view.addSubview(collectionView)
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellid")
        
    }
    
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Chat>()
        snapshot.appendSections([.activeChats])
        snapshot.appendItems(mockChat, toSection: .activeChats)
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(84))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 20, bottom: 0, trailing: 20)
        
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
        
    }
    private func configureDataSource() {
    
        
        dataSource = UICollectionViewDiffableDataSource<Section, Chat>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, chat: Chat) -> UICollectionViewCell? in
            guard let section = Section(rawValue: indexPath.section) else {
                fatalError("Cant get section")
            }
            
            switch section {
            case .activeChats:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath)
                cell.backgroundColor = .darkGray
             return cell
            }
            
        }
        
    }
    
}
extension ListViewController:  UISearchBarDelegate {
    
    /*func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath)
        cell.backgroundColor = .darkGray
        cell.layer.borderWidth = 1
        return cell
    }
     */
    
    private func setupSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self

    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
    
}

struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        
        let viewController = TabViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
        
        
    }
}
