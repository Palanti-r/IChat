//
//  WaitingChatCell.swift
//  IChat
//
//  Created by Commander on 08.10.2023.
//


import UIKit

final class WaitingChatCell: UICollectionViewCell {

    static let reuseIdentifier = "ActiveChatCell"
    let imageView = UIImageView()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        self.layer.borderWidth = 1
        self.layer.borderColor = CGColor(gray: 0.9, alpha: 0.9)
        self.clipsToBounds = true
        self.layer.cornerRadius = frame.height / 2
        //print(frame)
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension WaitingChatCell {
    func configure() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
       

        addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 88),
            imageView.heightAnchor.constraint(equalToConstant: 88)
            ])
    }
}
