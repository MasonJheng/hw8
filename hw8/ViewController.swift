//
//  ViewController.swift
//  hw8
//
//  Created by masonjheng on 2021/7/25.
//參考 練習
//


import UIKit

let moviesImages = ["玩命9.jpeg","黑寡婦.jpeg","柯南.jpeg","失控的審判.jpeg","花束般戀愛.jpeg"]

let movieNames = ["玩命關頭9","黑寡婦","名偵探柯南","失控的審判","花束般戀愛"]

var movieIndex = 0
class ViewController: UIViewController {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var moviePage: UIPageControl!
    @IBOutlet weak var movieSegment: UISegmentedControl!
    @IBOutlet weak var movieNameLabel: UILabel!
    
    func movieSelect(){
        // 可讓頭、尾圖片相接
        if movieIndex == 5 { //若movieIndex 超過4 回到第1個
            movieIndex = 0
        }else if movieIndex == -1{//若movieIndex 一直減一直減到0後 轉到最後一個
            movieIndex = 4
        }
        movieImageView.image = UIImage(named: moviesImages[movieIndex])
        movieNameLabel.text = movieNames[movieIndex]
        moviePage.currentPage = movieIndex //page 跟著目前movieIndex 走
        movieSegment.selectedSegmentIndex = movieIndex //segment 跟著目前movieIndex 走
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieSelect()
        // Do any additional setup after loading the view.
    }
    // segment 抓目前的位置
    @IBAction func changeSegment(_ sender: UISegmentedControl) {
        movieIndex = sender.selectedSegmentIndex
        movieSelect()
    }
    // page control 抓目前的位置
    @IBAction func changePage(_ sender: UIPageControl) {
        movieIndex = sender.currentPage
        movieSelect()
    }
    // 兩個 swipe 拉到同一個 IBAction，每個手勢拉一次
    @IBAction func swiptChange(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
            movieIndex = movieIndex + 1
            movieSelect()
        } else if sender.direction == .right {
            movieIndex = movieIndex - 1
            movieSelect()
        }
    }
    //下一頁
    @IBAction func prePage(_ sender: Any) {
        movieIndex = movieIndex - 1
        movieSelect()
    }
    //上一頁
    @IBAction func nextPage(_ sender: Any) {
        movieIndex = movieIndex + 1
        movieSelect()
    }
    
}

