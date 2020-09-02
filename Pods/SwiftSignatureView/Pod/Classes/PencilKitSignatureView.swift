//
//  PencilKitSignatureView.swift
//  Pods
//
//  Created by Alankar Avinash Misra on 16/05/20.
//

import UIKit;
import PencilKit;

@available(iOS 13.0, *)
class PencilKitSignatureView : UIView, ISignatureView {
    // MARK: Public Properties
    open weak var delegate: SwiftSignatureViewDelegate?

    /**
    The maximum stroke width.
    */
    open var maximumStrokeWidth: CGFloat = 4 {
        didSet {
            print("Setting maximum stroke width to \(maximumStrokeWidth)");
            resetTool()
        }
    }
    
    /**
    The minimum stroke width (ignored in PencilKit)
    */
    open var minimumStrokeWidth: CGFloat = 1;
    
    /**
    The stroke color.
    */
    open var strokeColor: UIColor = UIColor.black {
        didSet {
            resetTool()
        }
    }
    
    /**
    The stroke alpha. 
    */
    open var strokeAlpha: CGFloat = 1;
    
    /**
    The UIImage representation of the signature. Read/write.
    */
    open var signature: UIImage? {
        get {
            return canvas.drawing.image(from:bounds, scale:1.0);
        }
        
        set {
            guard let data = newValue?.pngData(), let drawing = try? PKDrawing(data:data) else {
                return
            }
            canvas.drawing = drawing;
        }
    }
    
    open func getCroppedSignature() -> UIImage? {
        // TODO: This should crop the image
        return canvas.drawing.image(from:canvas.bounds, scale:1.0);
    }
    
    open func clear() {
        canvas.drawing = PKDrawing();
    }
        
    public required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
         initialize()
     }
     
     override public init(frame: CGRect) {
         super.init(frame: frame)
         initialize()
     }
    
    private var canvas:PKCanvasView!;
    
    fileprivate func initialize() {
        canvas = PKCanvasView(frame:bounds)
        canvas.autoresizingMask = [.flexibleWidth, .flexibleHeight,.flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin]
        canvas.allowsFingerDrawing = true;
        self.addSubview(canvas);
        resetTool()
    }
    
    fileprivate func resetTool() {        
        canvas.tool = PKInkingTool(.pen, color:strokeColor.withAlphaComponent(strokeAlpha), width:maximumStrokeWidth);
    }
}
