//
//  SetupProfileViewController.swift
//  IChat
//
//  Created by Commander on 19.09.2023.
//



import UIKit
import SwiftUI

class SetupProfileViewController: UIViewController {
    
    typealias viewConstraint = NSLayoutConstraint

    let fillImageView = AddPhotoView()
    
    let setLabel = UILabel(text: "Set up profile")
    let fullNameLabel = UILabel(text: "Full name")
    let aboutLabel = UILabel(text: "About me")
    let sexLabel = UILabel(text: "Sex")
  
    
  
    
    let fullNameTextField = UnderlineTextField(font: .avenir20())
    let aboutMeTextField = UnderlineTextField(font: .avenir20())
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
    }
    
   
}
// MARK: – SignUpViewController
extension SetupProfileViewController {
    
   
    private func setupUI() {
        
        let sexSegmentedControl: UISegmentedControl = {
            let segment = UISegmentedControl()
            segment.insertSegment(withTitle: "Male", at: 0, animated: true)
            segment.insertSegment(withTitle: "Female", at: 1, animated: true)
            segment.selectedSegmentIndex = 0

            return segment
        }()
        let nextButton = UIButton(title: "Next", titleColor: .whiteColor)

        
        let stackFields = UIStackView(arrangedSubView: [
            fullNameLabel,
            fullNameTextField,
            aboutLabel,
            aboutMeTextField
        ], axis: .vertical, spacing: 20)

        fillImageView.translatesAutoresizingMaskIntoConstraints = false
        sexSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        sexLabel.translatesAutoresizingMaskIntoConstraints = false
        stackFields.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(fillImageView)
        view.addSubview(sexSegmentedControl)
        view.addSubview(sexLabel)
        view.addSubview(stackFields)
        view.addSubview(nextButton)
        
        viewConstraint.activate([
            fillImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            fillImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sexLabel.bottomAnchor.constraint(equalTo: sexSegmentedControl.topAnchor, constant: -20),
            sexLabel.leftAnchor.constraint(equalTo: sexSegmentedControl.leftAnchor),
            sexSegmentedControl.topAnchor.constraint(equalTo: fillImageView.bottomAnchor, constant: 100),
            sexSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40),
            sexSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackFields.topAnchor.constraint(equalTo: sexSegmentedControl.bottomAnchor, constant: 20),
            stackFields.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackFields.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            nextButton.topAnchor.constraint(equalTo: stackFields.bottomAnchor, constant: 20),
            nextButton.leadingAnchor.constraint(equalTo: stackFields.leadingAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 100)
            

        ])

    }
}
struct SetupProfileViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        
        let viewController = SetupProfileViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
        
        
    }
}
