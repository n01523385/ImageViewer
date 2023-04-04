//
//  ViewController.swift
//  ImageViewer
//
//  Created by Arunima Das on 2023-03-31.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, AddingImageDelegateProtocol {
    @IBOutlet weak var pickerview: UIPickerView!
    @IBOutlet weak var imageview: UIImageView!
    public var picture: ImageList = ImageList()
    var photo = 0
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picture.getAllImages().count
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let iVC = segue.destination as! NewImageViewController
        iVC.delegate = self
    }
    func NewImageAdded(si: imagesadded) {
        picture.addNewImage(ns: si)
        pickerview.reloadAllComponents()
        
        if let url = URL(string: picture.getAllImages()[photo].link) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
              // Error handling...
              guard let imageData = data else { return }

              DispatchQueue.main.async {
                  self.imageview.image = UIImage(data: imageData)
              }
            }.resume()
          }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        photo = row
        if let url = URL(string: picture.getAllImages()[row].link) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
              // Error handling...
              guard let imageData = data else { return }

              DispatchQueue.main.async {
                  self.imageview.image = UIImage(data: imageData)
              }
            }.resume()
          }
        
    }
    func Cancelled() {
        if picture.getAllImages().count != 0{
            if let url = URL(string: picture.getAllImages()[photo].link) {
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                  // Error handling...
                  guard let imageData = data else { return }

                  DispatchQueue.main.async {
                      self.imageview.image = UIImage(data: imageData)
                  }
                }.resume()
              }
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return picture.getAllImages()[row].title
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerview.delegate=self
        // Do any additional setup after loading the view.
    }
    

    
}

