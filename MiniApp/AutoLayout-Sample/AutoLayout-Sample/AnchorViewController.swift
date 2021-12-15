//
//  AnchorViewController.swift
//  AutoLayout-Sample
//
//  Created by 今村京平 on 2021/12/15.
//

import UIKit

class AnchorViewController: UIViewController {
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
        setupHeaderViewLayout()
        setupBodyViewLayout()
        setupBodyLabelLayout()
    }

    private func setupAutoresizingMask() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        bodyView.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupHeaderViewLayout() {
        headerViewHeightConstraint = headerView.heightAnchor.constraint(
            equalTo: view.heightAnchor, multiplier: 0.3)
        headerViewTopConstraint = headerView.topAnchor.constraint(equalTo: view.topAnchor)
        NSLayoutConstraint.activate([
            headerViewHeightConstraint,
            headerViewTopConstraint,
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func setupBodyViewLayout() {
        bodyViewHeightConstraint = bodyView.heightAnchor.constraint(
            equalTo: view.heightAnchor, multiplier: 0.7)
        NSLayoutConstraint.activate([
            bodyViewHeightConstraint,
            bodyView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            bodyView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bodyView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func setupBodyLabelLayout() {
        NSLayoutConstraint.activate([
            bodyLabel.centerXAnchor.constraint(equalTo: bodyView.centerXAnchor),
            bodyLabel.centerYAnchor.constraint(equalTo: bodyView.centerYAnchor)
        ])
    }

    // MARK: - viewDidLayoutSubviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateConstraints(safeAreaInsets: view.safeAreaInsets)
    }

    private func updateConstraints(safeAreaInsets: UIEdgeInsets) {
        headerViewHeightConstraint.constant = -safeAreaInsets.top
        headerViewTopConstraint.constant = safeAreaInsets.top
        bodyViewHeightConstraint.constant = -safeAreaInsets.bottom
        view.setNeedsLayout()
    }
}

