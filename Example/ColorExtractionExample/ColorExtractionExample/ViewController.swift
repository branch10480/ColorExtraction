//
//  ViewController.swift
//  ColorExtractionExample
//
//  Created by branch10480 on 2022/01/20.
//

import UIKit
import ColorExtraction

class ViewController: UIViewController {
  
  private let images: [UIImage] = [
    UIImage(named: "illust01"),
    UIImage(named: "illust02"),
    UIImage(named: "illust03"),
    UIImage(named: "illust04"),
  ].compactMap{ $0 }
  
  @IBOutlet var imageViews: [UIImageView]!
  
  private var selectedIndex: Int = 0

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }
  
  private func setup() {
    for (i, imageView) in imageViews.enumerated() {
      imageView.image = images[i]
    }
    refreshImageViews()
  }
  
  @IBAction private func didTapButton(_ sender: UIButton) {
    let tag = sender.tag
    guard tag < images.count else { return }
    selectedIndex = tag
    refreshImageViews()
  }
  
  @IBAction private func didTapBackgroundChangeButton(_ sender: Any) {
    DispatchQueue.main.async { [weak self] in
      guard let self = self else { return }
      let image = self.images[self.selectedIndex]
      let color = ColorExtraction.extractColor(from: image, type: .mostFrequent)
      self.view.backgroundColor = color
    }
  }
  
  private func refreshImageViews() {
    for (i, imageView) in imageViews.enumerated() {
      imageView.alpha = selectedIndex == i ? 1 : 0.1
    }
  }
  
}

