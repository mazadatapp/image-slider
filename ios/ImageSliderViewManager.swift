@objc(ImageSliderViewManager)
class ImageSliderViewManager: RCTViewManager {

  override func view() -> (ImageSliderView) {
    return ImageSliderView()
  }

  @objc override static func requiresMainQueueSetup() -> Bool {
    return false
  }
}


