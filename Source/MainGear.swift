/**
 Defines the smaller gear as a Bezier path
 */
public class MainGear : UIView {

    /**
     Draws the gear in the given rect
     - Parameter rect: the rect drawn
     */
    override public func drawRect(rect: CGRect) {
        let color0 = self.tintColor

        let centerGear: CGRect = CGRectMake(rect.minX, rect.minY, rect.width + 0.42, rect.height)

        let rectangle1Path = UIBezierPath()
        rectangle1Path.moveToPoint(CGPointMake(centerGear.minX + 0.58954 * centerGear.width, centerGear.minY + 0.11232 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.56841 * centerGear.width, centerGear.minY + 0.00000 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.42589 * centerGear.width, centerGear.minY + 0.00000 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.40820 * centerGear.width, centerGear.minY + 0.11285 * centerGear.height))
        rectangle1Path.addCurveToPoint(CGPointMake(centerGear.minX + 0.34380 * centerGear.width, centerGear.minY + 0.13390 * centerGear.height), controlPoint1: CGPointMake(centerGear.minX + 0.38596 * centerGear.width, centerGear.minY + 0.11807 * centerGear.height), controlPoint2: CGPointMake(centerGear.minX + 0.36444 * centerGear.width, centerGear.minY + 0.12514 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.26048 * centerGear.width, centerGear.minY + 0.05542 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.14518 * centerGear.width, centerGear.minY + 0.13891 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.19746 * centerGear.width, centerGear.minY + 0.24065 * centerGear.height))
        rectangle1Path.addCurveToPoint(CGPointMake(centerGear.minX + 0.15778 * centerGear.width, centerGear.minY + 0.29533 * centerGear.height), controlPoint1: CGPointMake(centerGear.minX + 0.18275 * centerGear.width, centerGear.minY + 0.25768 * centerGear.height), controlPoint2: CGPointMake(centerGear.minX + 0.16946 * centerGear.width, centerGear.minY + 0.27597 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.04404 * centerGear.width, centerGear.minY + 0.28065 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.00000 * centerGear.width, centerGear.minY + 0.41574 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.10228 * centerGear.width, centerGear.minY + 0.46741 * centerGear.height))
        rectangle1Path.addCurveToPoint(CGPointMake(centerGear.minX + 0.10096 * centerGear.width, centerGear.minY + 0.50000 * centerGear.height), controlPoint1: CGPointMake(centerGear.minX + 0.10140 * centerGear.width, centerGear.minY + 0.47816 * centerGear.height), controlPoint2: CGPointMake(centerGear.minX + 0.10096 * centerGear.width, centerGear.minY + 0.48903 * centerGear.height))
        rectangle1Path.addCurveToPoint(CGPointMake(centerGear.minX + 0.10247 * centerGear.width, centerGear.minY + 0.53489 * centerGear.height), controlPoint1: CGPointMake(centerGear.minX + 0.10096 * centerGear.width, centerGear.minY + 0.51176 * centerGear.height), controlPoint2: CGPointMake(centerGear.minX + 0.10147 * centerGear.width, centerGear.minY + 0.52339 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.00176 * centerGear.width, centerGear.minY + 0.58966 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.04580 * centerGear.width, centerGear.minY + 0.72476 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.15898 * centerGear.width, centerGear.minY + 0.70665 * centerGear.height))
        rectangle1Path.addCurveToPoint(CGPointMake(centerGear.minX + 0.19898 * centerGear.width, centerGear.minY + 0.76110 * centerGear.height), controlPoint1: CGPointMake(centerGear.minX + 0.17077 * centerGear.width, centerGear.minY + 0.72594 * centerGear.height), controlPoint2: CGPointMake(centerGear.minX + 0.18417 * centerGear.width, centerGear.minY + 0.74415 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.14979 * centerGear.width, centerGear.minY + 0.86443 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.26509 * centerGear.width, centerGear.minY + 0.94792 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.34594 * centerGear.width, centerGear.minY + 0.86700 * centerGear.height))
        rectangle1Path.addCurveToPoint(CGPointMake(centerGear.minX + 0.41046 * centerGear.width, centerGear.minY + 0.88768 * centerGear.height), controlPoint1: CGPointMake(centerGear.minX + 0.36662 * centerGear.width, centerGear.minY + 0.87564 * centerGear.height), controlPoint2: CGPointMake(centerGear.minX + 0.38819 * centerGear.width, centerGear.minY + 0.88259 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.43159 * centerGear.width, centerGear.minY + 1.00000 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.57411 * centerGear.width, centerGear.minY + 1.00000 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.59180 * centerGear.width, centerGear.minY + 0.88715 * centerGear.height))
        rectangle1Path.addCurveToPoint(CGPointMake(centerGear.minX + 0.65620 * centerGear.width, centerGear.minY + 0.86610 * centerGear.height), controlPoint1: CGPointMake(centerGear.minX + 0.61404 * centerGear.width, centerGear.minY + 0.88193 * centerGear.height), controlPoint2: CGPointMake(centerGear.minX + 0.63556 * centerGear.width, centerGear.minY + 0.87486 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.73952 * centerGear.width, centerGear.minY + 0.94458 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.85482 * centerGear.width, centerGear.minY + 0.86109 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.80254 * centerGear.width, centerGear.minY + 0.75935 * centerGear.height))
        rectangle1Path.addCurveToPoint(CGPointMake(centerGear.minX + 0.84222 * centerGear.width, centerGear.minY + 0.70467 * centerGear.height), controlPoint1: CGPointMake(centerGear.minX + 0.81725 * centerGear.width, centerGear.minY + 0.74232 * centerGear.height), controlPoint2: CGPointMake(centerGear.minX + 0.83054 * centerGear.width, centerGear.minY + 0.72403 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.95596 * centerGear.width, centerGear.minY + 0.71935 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 1.00000 * centerGear.width, centerGear.minY + 0.58426 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.89772 * centerGear.width, centerGear.minY + 0.53259 * centerGear.height))
        rectangle1Path.addCurveToPoint(CGPointMake(centerGear.minX + 0.89904 * centerGear.width, centerGear.minY + 0.50000 * centerGear.height), controlPoint1: CGPointMake(centerGear.minX + 0.89860 * centerGear.width, centerGear.minY + 0.52184 * centerGear.height), controlPoint2: CGPointMake(centerGear.minX + 0.89904 * centerGear.width, centerGear.minY + 0.51097 * centerGear.height))
        rectangle1Path.addCurveToPoint(CGPointMake(centerGear.minX + 0.89753 * centerGear.width, centerGear.minY + 0.46511 * centerGear.height), controlPoint1: CGPointMake(centerGear.minX + 0.89904 * centerGear.width, centerGear.minY + 0.48824 * centerGear.height), controlPoint2: CGPointMake(centerGear.minX + 0.89853 * centerGear.width, centerGear.minY + 0.47661 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.99824 * centerGear.width, centerGear.minY + 0.41034 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.95420 * centerGear.width, centerGear.minY + 0.27524 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.84102 * centerGear.width, centerGear.minY + 0.29335 * centerGear.height))
        rectangle1Path.addCurveToPoint(CGPointMake(centerGear.minX + 0.80102 * centerGear.width, centerGear.minY + 0.23890 * centerGear.height), controlPoint1: CGPointMake(centerGear.minX + 0.82923 * centerGear.width, centerGear.minY + 0.27406 * centerGear.height), controlPoint2: CGPointMake(centerGear.minX + 0.81583 * centerGear.width, centerGear.minY + 0.25585 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.85021 * centerGear.width, centerGear.minY + 0.13557 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.73491 * centerGear.width, centerGear.minY + 0.05208 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.65406 * centerGear.width, centerGear.minY + 0.13300 * centerGear.height))
        rectangle1Path.addCurveToPoint(CGPointMake(centerGear.minX + 0.58954 * centerGear.width, centerGear.minY + 0.11232 * centerGear.height), controlPoint1: CGPointMake(centerGear.minX + 0.63338 * centerGear.width, centerGear.minY + 0.12436 * centerGear.height), controlPoint2: CGPointMake(centerGear.minX + 0.61181 * centerGear.width, centerGear.minY + 0.11741 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.58954 * centerGear.width, centerGear.minY + 0.11232 * centerGear.height))
        rectangle1Path.closePath()
        rectangle1Path.moveToPoint(CGPointMake(centerGear.minX + 0.50165 * centerGear.width, centerGear.minY + 0.63636 * centerGear.height))
        rectangle1Path.addCurveToPoint(CGPointMake(centerGear.minX + 0.63847 * centerGear.width, centerGear.minY + 0.50000 * centerGear.height), controlPoint1: CGPointMake(centerGear.minX + 0.57721 * centerGear.width, centerGear.minY + 0.63636 * centerGear.height), controlPoint2: CGPointMake(centerGear.minX + 0.63847 * centerGear.width, centerGear.minY + 0.57531 * centerGear.height))
        rectangle1Path.addCurveToPoint(CGPointMake(centerGear.minX + 0.50165 * centerGear.width, centerGear.minY + 0.36364 * centerGear.height), controlPoint1: CGPointMake(centerGear.minX + 0.63847 * centerGear.width, centerGear.minY + 0.42469 * centerGear.height), controlPoint2: CGPointMake(centerGear.minX + 0.57721 * centerGear.width, centerGear.minY + 0.36364 * centerGear.height))
        rectangle1Path.addCurveToPoint(CGPointMake(centerGear.minX + 0.36484 * centerGear.width, centerGear.minY + 0.50000 * centerGear.height), controlPoint1: CGPointMake(centerGear.minX + 0.42609 * centerGear.width, centerGear.minY + 0.36364 * centerGear.height), controlPoint2: CGPointMake(centerGear.minX + 0.36484 * centerGear.width, centerGear.minY + 0.42469 * centerGear.height))
        rectangle1Path.addCurveToPoint(CGPointMake(centerGear.minX + 0.50165 * centerGear.width, centerGear.minY + 0.63636 * centerGear.height), controlPoint1: CGPointMake(centerGear.minX + 0.36484 * centerGear.width, centerGear.minY + 0.57531 * centerGear.height), controlPoint2: CGPointMake(centerGear.minX + 0.42609 * centerGear.width, centerGear.minY + 0.63636 * centerGear.height))
        rectangle1Path.closePath()
        rectangle1Path.miterLimit = 4;

        rectangle1Path.usesEvenOddFillRule = true;

        color0.setFill()
        rectangle1Path.fill()
    }
}
