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
        case waitingChats
        case activeChats
    }
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Chat>?
    
    let mockChat: [Chat] = Bundle.main.decode([Chat].self, from: "activeChats.json")
    let mockChat2: [Chat] = Bundle.main.decode([Chat].self, from: "waitingChats.json")

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        configureDataSource()
        setupSearchBar()
        reloadData()
     
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = UIColor(named: "titanWhite")
        view.addSubview(collectionView)
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellid")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellid2")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: SectionHeader.reuseId)
        
    }
    
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Chat>()
        snapshot.appendSections([.activeChats, .waitingChats])
        
        snapshot.appendItems(mockChat2, toSection: .waitingChats)
        snapshot.appendItems(mockChat, toSection: .activeChats)

        dataSource?.apply(snapshot, animatingDifferences: true)
    }
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            
            guard let section = Section(rawValue: sectionIndex) else {
                fatalError("Unknown section kind")
            }
        
            switch section {
            case .activeChats:
                return self.createActiveChats()
            case .waitingChats:
                return self.createWaitingChats()
            }
        }
        return layout
    }
    
    private func createActiveChats() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(78))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 20, bottom: 0, trailing: 20)
        
        return section
    }
    
    private func createWaitingChats() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(88),
                                               heightDimension: .absolute(88))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 8
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 20, bottom: 16, trailing: 20)
        let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
        layoutSize: sectionHeaderSize,
        elementKind: UICollectionView.elementKindSectionHeader,
        alignment: .top)
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
    private func configureDataSource() {
    
        let cellRegistration = UICollectionView.CellRegistration
        <ActiveChatCell, Chat> { (cell, indexPath, activeChat) in
            // Populate the cell with our item description.
            cell.titleLabel.text = activeChat.username
            cell.categoryLabel.text = activeChat.lastMessage
            cell.imageView.image = UIImage(named: activeChat.userImageString)
        }
        let cellRegistration1 = UICollectionView.CellRegistration
        <WaitingChatCell, Chat> { (cell, indexPath, waitingChats) in
            // Populate the cell with our item description.
            cell.imageView.image = UIImage(named: waitingChats.userImageString)
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Chat>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, chat: Chat) -> UICollectionViewCell? in
            guard let section = Section(rawValue: indexPath.section) else {
                return nil
            }
            
            switch section {
            case .activeChats:
                return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: chat)

            case .waitingChats:
                return collectionView.dequeueConfiguredReusableCell(using: cellRegistration1, for: indexPath, item: chat)

            }
            
        }
        
    }
    
}
extension ListViewController:  UISearchBarDelegate {
    

    
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
