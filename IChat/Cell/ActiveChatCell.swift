//
//  ActiveChatCell.swift
//  IChat
//
//  Created by Commander on 04.10.2023.
//


import UIKit

final class ActiveChatCell: UICollectionViewCell {

    static let reuseIdentifier = "ActiveChatCell"
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let categoryLabel = UILabel()
    let view = GradientView(from: .topTrailing, to: .bottomLeading, startColor: #colorLiteral(red: 0.7882352941, green: 0.631372549, blue: 0.9411764706, alpha: 1), endColor: #colorLiteral(red: 0.4784313725, green: 0.6980392157, blue: 0.9215686275, alpha: 1))

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.backgroundColor = .white
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension ActiveChatCell {
    func configure() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.translatesAutoresizingMaskIntoConstraints = false

        addSubview(imageView)
        addSubview(categoryLabel)
        addSubview(titleLabel)
        addSubview(view)


        titleLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        titleLabel.adjustsFontForContentSizeCategory = true
        categoryLabel.font = UIFont.preferredFont(forTextStyle: .caption2)
        categoryLabel.adjustsFontForContentSizeCategory = true
        categoryLabel.textColor = .placeholderText

    
        imageView.backgroundColor = .gray
        //view.layer.cornerRadius = 5
        //self.layer.cornerRadius = 5

        let spacing = CGFloat(10)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 80)
            ])
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor,
                                            constant: spacing),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20)
            ])
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            categoryLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            categoryLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -5)
            ])
        NSLayoutConstraint.activate([
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            view.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            view.widthAnchor.constraint(equalToConstant: 8),
            view.heightAnchor.constraint(equalToConstant: 80)

            ])
    }
}
