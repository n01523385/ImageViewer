//
//  NewImageViewController.swift
//  ImageViewer
//
//  Created by Arunima Das on 2023-04-04.
//

import UIKit
protocol AddingImageDelegateProtocol {
    func NewImageAdded(si: imagesadded)
    func Cancelled()
}
class NewImageViewController: UIViewController {
    public var delegate: AddingImageDelegateProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBOutlet weak var imageURL: UITextField!
    @IBOutlet weak var imagetitle: UITextField!
    
    @IBAction func adding(_ sender: UIButton) {
        if let ti = imagetitle.text {
            if let li = imageURL.text {
                if !ti.isEmpty && !li.isEmpty{
                        let newImage = imagesadded(t: ti, l: li)
                        delegate?.NewImageAdded(si: newImage)
                        dismiss(animated: true, completion: nil)
                    }
                else
                {
                    let alert = UIAlertController(title: "Error", message: "Please enter details", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default)
                    alert.addAction(okAction)
                    present(alert, animated: true)
                }
            }
        }
    }
    @IBAction func cancel(_ sender: UIButton) {
        delegate?.Cancelled()
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
