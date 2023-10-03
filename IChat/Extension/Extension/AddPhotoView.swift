//
//  AddPhotoView.swift
//  IChat
//
//  Created by Commander on 19.09.2023.
//

import UIKit

class AddPhotoView: UIView {
    
    
    let circleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person.crop.circle")
        imageView.tintColor = .gray
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.layer.borderWidth = 1
        return imageView
    }()
    
    let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "plus.circle.fill")
        button.setImage(image, for: .normal)
        button.tintColor = .darkGray
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(circleImageView)
        addSubview(addButton)
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        circleImageView.layer.masksToBounds = true
        circleImageView.layer.cornerRadius = circleImageView.frame.width / 2
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            circleImageView.topAnchor.constraint(equalTo: self.topAnchor),
            circleImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            circleImageView.widthAnchor.constraint(equalToConstant: 100),
            circleImageView.heightAnchor.constraint(equalTo: self.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            addButton.bottomAnchor.constraint(equalTo: circleImageView.bottomAnchor, constant: 30),
            addButton.trailingAnchor.constraint(equalTo: circleImageView.trailingAnchor),
            addButton.widthAnchor.constraint(equalToConstant: 50),
            addButton.heightAnchor.constraint(equalTo: self.widthAnchor)
            
        ])
        self.bottomAnchor.constraint(equalTo: circleImageView.bottomAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: circleImageView.trailingAnchor).isActive = true

    }
    
   
}
