import UIKit

public class ColorExtraction {
  
  public enum ExtractionType {
    case mostFrequent
  }
  
  public static func extractColor(from image: UIImage, type: ExtractionType) -> UIColor? {
    guard let resizedImage = image.resized(withPercentage: 0.2) else {
      return nil
    }
    switch type {
    case .mostFrequent:
      return mostFrequentColor(from: resizedImage)
    }
  }
  
  private static func mostFrequentColor(from image: UIImage) -> UIColor? {
    guard let provider = image.cgImage?.dataProvider,
          let data = CFDataGetBytePtr(provider.data) else {
            return nil
          }
    
    var frequencies: [ColorFactor: Int] = [:]
    let numberOfComponents = 4
    let maxWidth: Int = Int(image.size.width)
    let maxHeight: Int = Int(image.size.height)
    
    for x in 0..<maxWidth {
      for y in 0..<maxHeight {
        let targetPixel = (maxWidth * y + x) * numberOfComponents
        let factor = ColorFactor(
          red: CGFloat(data[targetPixel]),
          green: CGFloat(data[targetPixel + 1]),
          blue: CGFloat(data[targetPixel + 2]),
          alpha: CGFloat(data[targetPixel + 3])
        )
        
        // Ignore the color where alpha is 0
        if factor.alpha == 0 {
          continue
        }
        
        if let originalCount = frequencies[factor] {
          frequencies[factor] = originalCount + 1
        } else {
          frequencies[factor] = 1
        }
      }
    }
    
    let sorted: [(UIColor, Int)] = frequencies
      .enumerated()
      .sorted(by: { $0.element.value >= $1.element.value })
      .map{ return ($0.element.key.uiColor, $0.element.value) }
    let mostFrequentColor = sorted.first?.0
    return mostFrequentColor
  }
  
}
