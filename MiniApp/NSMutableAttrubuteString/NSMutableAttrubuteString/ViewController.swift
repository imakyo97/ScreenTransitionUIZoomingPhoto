//
//  ViewController.swift
//  NSMutableAttrubuteString
//
//  Created by 今村京平 on 2021/12/18.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var textViewWithLink: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextView()
    }

    private let apple = "https://apple.com"
    private let amazon = "https://amazon.com"
    private let google = "https://google.com"

    private func setupTextView() {
        let textLink = "・Apple: \n" + apple
        + "\n・Amazon: \n" + amazon
        + "\n・Google: \n" + google
        textViewWithLink.text = textLink
        let attributedString = NSMutableAttributedString(string: textLink)
        attributedString.addAttributes([.font: UIFont.boldSystemFont(ofSize: 20)],
                                       range: NSString(string: textLink).range(of: textLink))
        attributedString.addAttributes([.link: apple,
                                        .underlineStyle: NSUnderlineStyle.single.rawValue],
                                       range: NSString(string: textLink).range(of: apple))
        attributedString.addAttribute(.link,
                                      value: amazon,
                                      range: NSString(string: textLink).range(of: amazon))
        attributedString.addAttribute(.link,
                                      value: google,
                                      range: NSString(string: textLink).range(of: google))
        textViewWithLink.attributedText = attributedString
    }
}

