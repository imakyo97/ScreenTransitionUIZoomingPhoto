//
//  VFLViewController.swift
//  AutoLayout-Sample
//
//  Created by 今村京平 on 2021/12/15.
//

import UIKit

class VFLViewController: UIViewController {
    @IBOutlet private weak var headerView: UIView!
    @IBOutlet private weak var bodyView: UIView!
    @IBOutlet private weak var bodyLabel: UILabel!

    private var headerViewHeightConstraint: NSLayoutConstraint!
    private var headerViewTopConstraint: NSLayoutConstraint!
    private var bodyViewHeightConstraint: NSLayoutConstraint!

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAutoresizingMask()
        setupConstraints()
    }

    private func setupAutoresizingMask() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        bodyView.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupConstraints() {
        let views = ["headerView": headerView as Any,
                     "bodyView": bodyView as Any,
                     "bodyLabel": bodyLabel as Any]
        let headerViewConstraintH = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|[headerView]|",
            options: NSLayoutConstraint.FormatOptions.init(rawValue: 0),
            metrics: nil,
            views: views
        )
        let bodyViewConstraintH = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|[bodyView]|",
            options: NSLayoutConstraint.FormatOptions.init(rawValue: 0),
            metrics: nil,
            views: views
        )
        let bodyLabelConstraintH = NSLayoutConstraint.constraints(
            withVisualFormat: "H:[bodyView]-(<=100)-[bodyLabel]",
            options: NSLayoutConstraint.FormatOptions.alignAllCenterY,
            metrics: nil,
            views: views
        )
        let bodyLabelConstraintV = NSLayoutConstraint.constraints(
            withVisualFormat: "V:[bodyView]-(<=100)-[bodyLabel]",
            options: NSLayoutConstraint.FormatOptions.alignAllCenterX,
            metrics: nil,
            views: views
        )
        let verticalConstraint = NSLayoutConstraint.constraints(
            withVisualFormat: "V:[headerView][bodyView]",
            options: NSLayoutConstraint.FormatOptions.init(rawValue: 0),
            metrics: nil,
            views: views
        )
        view.addConstraints(headerViewConstraintH)
        view.addConstraints(bodyViewConstraintH)
        view.addConstraints(bodyLabelConstraintH)
        view.addConstraints(bodyLabelConstraintV)
        view.addConstraints(verticalConstraint)

        headerViewHeightConstraint = NSLayoutConstraint(item: headerView as Any, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 0)
        headerViewTopConstraint = NSLayoutConstraint(item: headerView as Any, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
        bodyViewHeightConstraint = NSLayoutConstraint(item: bodyView as Any, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 0)
        view.addConstraints([
        headerViewHeightConstraint,
        headerViewTopConstraint,
        bodyViewHeightConstraint
        ])
    }

    // MARK: - viewDidLayoutSubviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateConstraints(safeAreaInsets: view.safeAreaInsets)
    }

    private func updateConstraints(safeAreaInsets: UIEdgeInsets) {
        let viewHeight = view.bounds.height - safeAreaInsets.top - safeAreaInsets.bottom
        headerViewHeightConstraint.constant = viewHeight * 0.3
        headerViewTopConstraint.constant = safeAreaInsets.top
        bodyViewHeightConstraint.constant = viewHeight * 0.7
        view.setNeedsLayout()
    }
}
