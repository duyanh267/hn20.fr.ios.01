//
//  ScreenAViewController.swift
//  Exe3.iOSBasic.AnhND47
//
//  Created by Nguyen Duy anh on 4/2/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import UIKit

class ScreenAViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ScreenA viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ScreenA viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ScreenA viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ScreenA viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ScreenA viewDidDisappear")
    }
}
/*
    Exe3/.1: Push screen B từ screen A
    ScreenB viewWillApear -> ScreenA viewWillDisappear -> ScreenB viewWillAppear -> ScreenB viewDidAppear -> ScreenA viewDidDisappear
    Exe3/.2: Back lại screen A từ screen B
    ScreenB viewWillDisappear -> ScreenA viewWillAppear -> ScreenA viewDidAppear -> ScreenB viewDidDisappear
    Exe3/.3: User tap button Home của iPhone để cho app xuống background rồi mở lại app
    Sẽ không có hàm nào chạy vào vì khi app xuống background, app sẽ chưa bị kill vẫn còn trong memory nên ==> các hàm khi run app lên sẽ không chạy tiếp nữa
*/
