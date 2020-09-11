# DottedCircleActivityIndicator

Here's what it looks like:

![gif](http://i.imgur.com/Ke14Iiw.gif)

## Installation

The old version "DottedCircleProgressView" is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "DottedCircleProgressView"
```

Newer version is SPM compatible.

## Usage

```swift
import AsyncDisplayKit
import UIKit
import DottedCircleActivityIndicator
/**
* ASDK based version of self-written progress view
*/
class DottedCircleProgressNode: ASDisplayNode {
  var progressLayer : DottedCircleProgressLayer!

  override init() {
    super.init()
  }

  public convenience init(frame: CGRect, progressConfigurator : ProgressLayerConfigurator) {
    self.init()
    self.frame = frame
    self.progressLayer = DottedCircleProgressLayer(progressConfig: progressConfigurator)
    DispatchQueue.main.async {
      self.layer.addSublayer(self.progressLayer)
    }
  }

  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

let progressViewFrame = TrainingCardViewConfigurator.progressViewFrameInCardFrame(cardFrame: CGRect(origin: .zero, size: CGSize(width: 33, height: 33)))
let progressConfig  = ProgressLayerConfigurator(
  fillColor: UIColor.white.cgColor,
  backgroundColor: UIColor.white.cgColor,
  strokeColor: UIColor.white.cgColor,
  instanceColor: UIColor.white.cgColor,
  frame: TrainingCardViewConfigurator.progressLayerFrame(containerFrame: progressViewFrame),
  instanceCount: 8,
  dotSize: 3
)

let progrNode = DottedCircleProgressNode(frame: progressViewFrame, progressConfigurator: progressConfig)
progrNode.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
progrNode.style.preferredSize = CGSize(width: 33, height: 33)
return progrNode
```
