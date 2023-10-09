//
//  SectionHeader.swift
//  IChat
//
//  Created by Commander on 09.10.2023.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    
    static let reuseId = "SectionHeader"
    
    let title = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        title.translatesAutoresizingMaskIntoConstraints = false
        addSubview(title)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            title.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
    private func configure(text: String, font: UIFont?, color: UIColor) {
        
    }

}
