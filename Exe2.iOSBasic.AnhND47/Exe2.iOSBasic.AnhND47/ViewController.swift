//
//  ViewController.swift
//  Exe2.iOSBasic.AnhND47
//
//  Created by Nguyen Duy anh on 4/1/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import UIKit
/*
    Exe2/.1: Khi user quit app từ fast app switcher(multi task):
    User run app, app run xong sẽ vào active sau đó ng dùng vuốt lên để quit app -> rơi vào trạng thái inactive hàm "WillResignActive" sẽ đc gọi sau đó hàm sẽ xuống background -> hàm "DidEnterBackground" được gọi và user quit app thì app sẽ rơi vào trạng thái not running -> hàm "WillTerminate" đc gọi
*/
/*
    Exe2/.2:
    Khi run app đầu tiên sẽ chạy vào "willFinishLaunchingWithOptions,
    Tiếp đến sẽ chạy vào didFinishLaunchingWithOption (2 hàm này là 2 hàm khởi tạo của app chỉ chạy 1 lần duy nhất)
    TH1: App crash ngay khi view đã hiển thị lên divice thì sẽ không có hàm nào run
    TH2: Khi app đã chạy xong vào trạng thái active hiện thị UI lên device, user thực hiện 1 action app xảy ra crash thì sẽ chạy vào hàm DidBecomeActive
*/
/*
    Exe2/.3: Khi app bị suspended
    Khi app bị suspended là khi app đang chạy ở background(vd: user ấn nút home thì hàm "WillResignActive"( active -> inactive) sau đó app xuống background và vẫn còn trong memory -> hàm "DidEnterBackground" sẽ được gọi
*/
/*
    Exe2/.4: Khi user mở app khác (bằng cách tap vào notification của app khác hoặc open app khác từ app hiện tại)
    Khi user mở app khác app đang được bật sẽ đang ở trạng thái active -> inactive và xuống background =>> các hàm sẽ được gọi là "WillResignActive" -> "DidEnterBackground"
*/
class ViewController: UIViewController {
    var username: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //print(username!)
        view.backgroundColor = .black
        print("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
        //print(username!)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        //print(username!)
        if let url = URL(string: "https://magz.techover.io/") {
            UIApplication.shared.open(url)
        }
    }
}

