/**
 Defines a big gear as a Bezier path
 */
public class BigGear: UIView {

    /**
     Draws the gear in the given rect
     - Parameter rect: the rect drawn
     */
    override public func drawRect(rect: CGRect) {
        let color0 = self.tintColor

        let bigGear: CGRect = CGRectMake(rect.minX, rect.minY, rect.width - 0.03, rect.height)

        let rectangle14Path = UIBezierPath()
        rectangle14Path.moveToPoint(CGPointMake(bigGear.minX + 0.54057 * bigGear.width, bigGear.minY + 0.08763 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.52246 * bigGear.width, bigGear.minY + 0.00000 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.47754 * bigGear.width, bigGear.minY + 0.00000 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.45930 * bigGear.width, bigGear.minY + 0.08825 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.39658 * bigGear.width, bigGear.minY + 0.09964 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.43787 * bigGear.width, bigGear.minY + 0.09048 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.41692 * bigGear.width, bigGear.minY + 0.09431 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.34881 * bigGear.width, bigGear.minY + 0.02252 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.30660 * bigGear.width, bigGear.minY + 0.03778 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.32000 * bigGear.width, bigGear.minY + 0.12795 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.26573 * bigGear.width, bigGear.minY + 0.15957 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.30106 * bigGear.width, bigGear.minY + 0.13715 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.28293 * bigGear.width, bigGear.minY + 0.14774 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.19340 * bigGear.width, bigGear.minY + 0.10264 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.15899 * bigGear.width, bigGear.minY + 0.13132 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.20313 * bigGear.width, bigGear.minY + 0.21240 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.16334 * bigGear.width, bigGear.minY + 0.25988 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.18872 * bigGear.width, bigGear.minY + 0.22721 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.17541 * bigGear.width, bigGear.minY + 0.24308 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.07497 * bigGear.width, bigGear.minY + 0.23068 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.05251 * bigGear.width, bigGear.minY + 0.26932 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.12232 * bigGear.width, bigGear.minY + 0.33089 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.10132 * bigGear.width, bigGear.minY + 0.38861 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.11394 * bigGear.width, bigGear.minY + 0.34945 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.10690 * bigGear.width, bigGear.minY + 0.36873 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.00780 * bigGear.width, bigGear.minY + 0.39120 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.00000 * bigGear.width, bigGear.minY + 0.43515 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.08717 * bigGear.width, bigGear.minY + 0.46943 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.08605 * bigGear.width, bigGear.minY + 0.50000 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.08643 * bigGear.width, bigGear.minY + 0.47952 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.08605 * bigGear.width, bigGear.minY + 0.48972 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.08717 * bigGear.width, bigGear.minY + 0.53057 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.08605 * bigGear.width, bigGear.minY + 0.51028 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.08643 * bigGear.width, bigGear.minY + 0.52048 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.00000 * bigGear.width, bigGear.minY + 0.56485 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.00780 * bigGear.width, bigGear.minY + 0.60880 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.10132 * bigGear.width, bigGear.minY + 0.61139 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.12232 * bigGear.width, bigGear.minY + 0.66911 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.10690 * bigGear.width, bigGear.minY + 0.63127 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.11394 * bigGear.width, bigGear.minY + 0.65055 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.05251 * bigGear.width, bigGear.minY + 0.73068 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.07497 * bigGear.width, bigGear.minY + 0.76932 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.16334 * bigGear.width, bigGear.minY + 0.74012 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.20313 * bigGear.width, bigGear.minY + 0.78760 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.17541 * bigGear.width, bigGear.minY + 0.75692 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.18872 * bigGear.width, bigGear.minY + 0.77279 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.15899 * bigGear.width, bigGear.minY + 0.86868 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.19340 * bigGear.width, bigGear.minY + 0.89736 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.26573 * bigGear.width, bigGear.minY + 0.84043 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.32000 * bigGear.width, bigGear.minY + 0.87205 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.28293 * bigGear.width, bigGear.minY + 0.85226 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.30106 * bigGear.width, bigGear.minY + 0.86285 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.30660 * bigGear.width, bigGear.minY + 0.96222 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.34881 * bigGear.width, bigGear.minY + 0.97748 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.39658 * bigGear.width, bigGear.minY + 0.90036 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.45930 * bigGear.width, bigGear.minY + 0.91175 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.41692 * bigGear.width, bigGear.minY + 0.90569 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.43787 * bigGear.width, bigGear.minY + 0.90952 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.47754 * bigGear.width, bigGear.minY + 1.00000 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.52246 * bigGear.width, bigGear.minY + 1.00000 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.54057 * bigGear.width, bigGear.minY + 0.91237 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.60429 * bigGear.width, bigGear.minY + 0.90177 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.56234 * bigGear.width, bigGear.minY + 0.91046 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.58362 * bigGear.width, bigGear.minY + 0.90688 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.65119 * bigGear.width, bigGear.minY + 0.97748 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.69340 * bigGear.width, bigGear.minY + 0.96222 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.68042 * bigGear.width, bigGear.minY + 0.87491 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.73725 * bigGear.width, bigGear.minY + 0.84277 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.70027 * bigGear.width, bigGear.minY + 0.86565 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.71926 * bigGear.width, bigGear.minY + 0.85489 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.80660 * bigGear.width, bigGear.minY + 0.89736 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.84101 * bigGear.width, bigGear.minY + 0.86868 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.79916 * bigGear.width, bigGear.minY + 0.79179 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.84184 * bigGear.width, bigGear.minY + 0.74184 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.81466 * bigGear.width, bigGear.minY + 0.77630 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.82894 * bigGear.width, bigGear.minY + 0.75959 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.92503 * bigGear.width, bigGear.minY + 0.76932 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.94749 * bigGear.width, bigGear.minY + 0.73068 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.88225 * bigGear.width, bigGear.minY + 0.67314 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.90515 * bigGear.width, bigGear.minY + 0.61121 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.89147 * bigGear.width, bigGear.minY + 0.65330 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.89915 * bigGear.width, bigGear.minY + 0.63260 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.99220 * bigGear.width, bigGear.minY + 0.60880 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 1.00000 * bigGear.width, bigGear.minY + 0.56485 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.91906 * bigGear.width, bigGear.minY + 0.53302 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.92037 * bigGear.width, bigGear.minY + 0.50000 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.91993 * bigGear.width, bigGear.minY + 0.52213 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.92037 * bigGear.width, bigGear.minY + 0.51112 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.91906 * bigGear.width, bigGear.minY + 0.46698 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.92037 * bigGear.width, bigGear.minY + 0.48888 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.91993 * bigGear.width, bigGear.minY + 0.47787 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 1.00000 * bigGear.width, bigGear.minY + 0.43515 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.99220 * bigGear.width, bigGear.minY + 0.39120 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.90515 * bigGear.width, bigGear.minY + 0.38879 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.88225 * bigGear.width, bigGear.minY + 0.32686 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.89915 * bigGear.width, bigGear.minY + 0.36740 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.89147 * bigGear.width, bigGear.minY + 0.34670 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.94749 * bigGear.width, bigGear.minY + 0.26932 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.92503 * bigGear.width, bigGear.minY + 0.23068 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.84184 * bigGear.width, bigGear.minY + 0.25816 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.79916 * bigGear.width, bigGear.minY + 0.20821 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.82894 * bigGear.width, bigGear.minY + 0.24041 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.81466 * bigGear.width, bigGear.minY + 0.22370 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.84101 * bigGear.width, bigGear.minY + 0.13132 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.80660 * bigGear.width, bigGear.minY + 0.10264 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.73725 * bigGear.width, bigGear.minY + 0.15723 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.68042 * bigGear.width, bigGear.minY + 0.12509 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.71926 * bigGear.width, bigGear.minY + 0.14511 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.70027 * bigGear.width, bigGear.minY + 0.13435 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.69340 * bigGear.width, bigGear.minY + 0.03778 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.65119 * bigGear.width, bigGear.minY + 0.02252 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.60429 * bigGear.width, bigGear.minY + 0.09823 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.54057 * bigGear.width, bigGear.minY + 0.08763 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.58362 * bigGear.width, bigGear.minY + 0.09312 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.56234 * bigGear.width, bigGear.minY + 0.08954 * bigGear.height))
        rectangle14Path.closePath()
        rectangle14Path.miterLimit = 4;

        rectangle14Path.usesEvenOddFillRule = true;

        color0.setFill()
        rectangle14Path.fill()
    }
}

