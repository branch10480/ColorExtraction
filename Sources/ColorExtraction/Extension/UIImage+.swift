//
//  File.swift
//  
//
//  Created by branch10480 on 2022/01/24.
//

import UIKit
import CoreImage

extension UIImage {
  func resized(withPercentage percentage: CGFloat) -> UIImage? {
    let canvas = CGSize(width: size.width * percentage, height: size.height * percentage)
    return UIGraphicsImageRenderer(size: canvas).image { _ in
      draw(in: CGRect(origin: .zero, size: canvas))
    }
  }
}
