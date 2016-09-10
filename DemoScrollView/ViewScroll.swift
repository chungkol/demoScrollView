

import UIKit

class ViewScroll: UIViewController, UIScrollViewDelegate {
    var photo: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var slider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if (photo != nil)
        {
            return
        }
        let imgView = UIImageView(image: UIImage(named: "shop.jpg"))
        imgView.frame = CGRectMake(0, 0, scrollView.frame.size.width, scrollView.frame.size.height)
        imgView.contentMode = .ScaleAspectFit
        photo = imgView
        //set sự kiện click để zoomin zoomout
        imgView.userInteractionEnabled = true
        imgView.multipleTouchEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: Selector("tapImg:"))
        tap.numberOfTapsRequired = 1
        imgView.addGestureRecognizer(tap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: Selector("doubleTab:"))
        doubleTap.numberOfTapsRequired = 2
        tap.requireGestureRecognizerToFail(doubleTap)
        imgView.addGestureRecognizer(doubleTap)
        
        scrollView.contentSize = CGSizeMake(imgView.bounds.width, imgView.bounds.height)
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 2
        
        scrollView.backgroundColor = UIColor.blueColor()
//        scrollView.contentSize = CGSizeMake(imgView.frame.width, imgView.frame.height)
//        scrollView.bounces = true
//        scrollView.contentOffset = CGPointMake(-100, -50)
        scrollView.clipsToBounds = true
//        scrollView.contentInset
        
//        let scale = 1
//        let point = scrollView.center
//        zoomRectForScale(CGFloat(scale), center: point)
        
        self.scrollView.addSubview(imgView)
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return photo
    }
    func tapImg(gesture: UITapGestureRecognizer){
        let position = gesture.locationInView(photo)
        zoomRectForScale(scrollView.zoomScale * 1.5, center: position)
        
    }
    func doubleTab(gesture: UITapGestureRecognizer){
        let position = gesture.locationInView(photo)
        zoomRectForScale(scrollView.zoomScale * -1.5, center: position)
    }
    
    func zoomRectForScale(scale: CGFloat , center: CGPoint){
        var zoomRect = CGRect()
        let scrollViewSize = scrollView.bounds.size
        zoomRect.size.height = scrollViewSize.height / scale
        zoomRect.size.width = scrollViewSize.width / scale
        
        zoomRect.origin.x = center.x - (zoomRect.size.width / 2.0)
        zoomRect.origin.y = center.y - (zoomRect.size.height / 2.0)
        
        print(zoomRect)
        scrollView.zoomToRect(zoomRect, animated: true)
}
    
    @IBAction func slider(sender: AnyObject) {

        slider.maximumValue = Float(scrollView.maximumZoomScale)
        let scale = slider.value
        scrollView.setZoomScale(CGFloat(scale), animated: true)
    }
    
    
    
    
}
