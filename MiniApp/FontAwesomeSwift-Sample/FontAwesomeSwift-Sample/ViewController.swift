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

    private lazy var labels: [UILabel] = [label1, label2, label3, label4]
    private let styles: [FontAwesomeStyle] = [.solid, .light, .regular, .brands]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel()
    }

    private func setupLabel() {
        zip(labels, styles).forEach { label, style in
            label.font = UIFont.fontAwesome(ofSize: 50, style: style)
            label.text = String.fontAwesomeIcon(name: .school)
        }
    }
}

