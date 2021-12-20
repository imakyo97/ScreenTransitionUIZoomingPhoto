//
//  ViewController.swift
//  Cosmos-Sample
//
//  Created by 今村京平 on 2021/12/20.
//

import UIKit
import Cosmos

class ViewController: UIViewController {

    @IBOutlet private weak var cosmosView: CosmosView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCosmosView()
    }

    private func setupCosmosView() {
        cosmosView.didFinishTouchingCosmos = { [weak self] rating in
            guard let strongSelf = self else { return }
            strongSelf.cosmosView.text = String(rating)
        }
    }
}

