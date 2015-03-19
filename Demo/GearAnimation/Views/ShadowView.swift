import UIKit

class ShadowView: UIView {
    var gradient: CAGradientLayer!
    var shadowPercentage = 0.0

    override func layoutSubviews() {
        self.clipsToBounds = true
        if (self.gradient == nil) {
            self.gradient = CAGradientLayer()
            var frame = self.frame
            let offset = frame.size.height * CGFloat(self.shadowPercentage)
            frame.size.height = offset
            self.gradient.frame = frame
            self.gradient.colors = [
                UIColor.blackColor().colorWithAlphaComponent(0.6).CGColor,
                UIColor.blackColor().colorWithAlphaComponent(0.15).CGColor,
                UIColor.clearColor().CGColor]
            self.layer.insertSublayer(self.gradient, atIndex:0)
        }
    }
}
