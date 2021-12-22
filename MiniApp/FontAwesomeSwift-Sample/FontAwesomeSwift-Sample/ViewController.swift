//
//  ViewController.swift
//  FontAwesomeSwift-Sample
//
//  Created by 今村京平 on 2021/12/21.
//

import UIKit
import FontAwesome_swift

class ViewController: UIViewController {

    @IBOutlet private weak var label1: UILabel!
    @IBOutlet private weak var label2: UILabel!
    @IBOutlet private weak var label3: UILabel!
    @IBOutlet private weak var label4: UILabel!
    @IBOutlet private weak var button: UIButton!
    @IBOutlet private weak var barButton: UIBarButtonItem!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var imageViewColored: UIImageView!

    private lazy var labels: [UILabel] = [label1, label2, label3, label4]
    private let styles: [FontAwesomeStyle] = [.solid, .light, .regular, .brands]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel()
        setupButton()
        setupBarButton()
        setupImageView()
    }

    private func setupLabel() {
        zip(labels, styles).forEach { label, style in
            label.font = UIFont.fontAwesome(ofSize: 50, style: style)
            label.text = String.fontAwesomeIcon(name: .school)
        }
    }

    private func setupButton() {
        button.titleLabel?.font = UIFont.fontAwesome(ofSize: 50, style: .brands)
        button.setTitle(String.fontAwesomeIcon(name: .git), for: .normal)
    }

    private func setupBarButton() {
        let attributes = [NSAttributedString.Key.font: UIFont.fontAwesome(ofSize: 20, style: .brands)]
        barButton.setTitleTextAttributes(attributes, for: .normal)
        barButton.title = String.fontAwesomeIcon(name: .apple)
    }

    private func setupImageView() {
        imageView.image = UIImage.fontAwesomeIcon(name: .applePay, style: .brands, textColor: .black, size: CGSize(width: 100, height: 50))

        imageViewColored.image = UIImage.fontAwesomeIcon(name: .applePay, style: .brands, textColor: .white, size: CGSize(width: 100, height: 50), backgroundColor: .black)
    }
}

