//
//  ViewController.swift
//  blueethOpen
//
//  Created by fc on 2019/11/27.
//  Copyright © 2019 fc. All rights reserved.
//

import UIKit
import CoreBluetooth
class ViewController: UIViewController {
    
//    let bluemanage = CBCentralManager(delegate: self as? CBCentralManagerDelegate, queue: nil, options: [CBCentralManagerOptionShowPowerAlertKey:true])

    var bluemanage = CBCentralManager()
    var tempperipheral : CBPeripheral?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bluemanage = CBCentralManager(delegate: self, queue: nil)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       print("开始连接了")
        if let tempper = self.tempperipheral{
            connectDevicebySelf(peripheral: tempper)
        }
    }
    func connectDevicebySelf(peripheral:CBPeripheral)  {
        self.bluemanage.connect(peripheral, options: nil)
    }
    
}
extension ViewController:CBCentralManagerDelegate{
//   监听蓝牙的状态变化
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
//       print(central.state)
        switch central.state {
        case .poweredOff:
            print("蓝牙关闭状态")
        case .poweredOn:
            print("蓝牙开启状态")
            bluemanage.scanForPeripherals(withServices: nil, options: nil)
        case .resetting:
            print("准备状态")
        case .unsupported:
            print("不支持状态")
        default:
            print("蓝牙default状态")
        }
    }
    ///@optional发现外围设备，双方可以约定外围设备唯一参数，一般是外围设备的MAC地址
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        var deviceDic : [String : CBPeripheral] = [:]
        if let temppername = peripheral.name{//过滤需要的蓝牙名字并保存起来
           deviceDic["temppername"] = peripheral
//            bluemanage.stopScan()//停止扫描
        }
        
        
        
        
        print("central === \(central)")

        print("name==" + (peripheral.name ?? ""))
    
        print("advertisementData === \(advertisementData)")

        print("rssi === \(RSSI)")

    }
    
//    connectDeviceWithPeriphera
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("开始连接")
        
    }
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print("连接失败")
    }
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        print("断开连接")
    }
    override func beginRequest(with context: NSExtensionContext) {
        print("开始请求数据")
    }

}






















