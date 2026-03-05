'use static'
/*
* Copyright (C) 2026 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

// [Start head]
// 导入usbManager模块
import {
  $r,
  Button,
  ButtonAttribute,
  ClickEvent,
  Color,
  Column,
  Component,
  EditableTextOnChangeCallback,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  ForEach,
  HorizontalAlign,
  Image,
  ItemAlign,
  List,
  ListItem,
  Margin,
  Padding,
  Row,
  RowAttribute,
  Scroll,
  ScrollDirection,
  Text,
  TextAlign,
  TextArea,
  TextAttribute
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog';
import serialManager from '@ohos.usbManager.serial';
import { BusinessError } from '@ohos.base';
import { buffer } from '@kit.ArkTS';

// [End head]
@Entry
@Component
struct Index {
  @State logInfo_: string = '';
  @State portList_: Array<serialManager.SerialPort> = new Array<serialManager.SerialPort>(0);
  @State portId_: int = 0;

  private getPortList() {
    // [Start getPortList]
    // 获取连接主设备的USB设备列表
    let portList: serialManager.SerialPort[] = serialManager.getPortList();
    console.info(`usbSerial portList: ${portList}`);
    if (portList === undefined || portList.length === 0) {
      console.error('usbSerial portList is empty');
      this.logInfo_ += '\n[ERROR] usbSerial portList is empty';
      return;
    }
    this.portList_ = portList;
    // [End getPortList]
  }

  private requestSerialRight() {
    // [Start requestSerialRight]
    if (this.portList_ === undefined || this.portList_.length === 0) {
      console.error('usbSerial portList is empty');
      this.logInfo_ += '\n[ERROR] usbSerial portList is empty';
      return;
    }
    let portList: serialManager.SerialPort[] = this.portList_;
    let portId: int = portList[0].portId;
    if (!serialManager.hasSerialRight(portId)) {
      try {
        serialManager.requestSerialRight(portId).then((result: Boolean)=> {
          console.info('serial device request right result: ' + result);
        });
      } catch(error: BusinessError) {
        console.error(`usb device request right failed : ${error}`);
      };
    } else {
      console.info('serial device already request right');
      this.logInfo_ += '\n[INFO] serial device already request right';
    }
    this.portId_ = portId;
    // [End requestSerialRight]
  }

  private openSerialDevice() {
    // [Start openSerialDevice]
    let portId: int = this.portId_;
    try {
      serialManager.open(portId);
      console.info(`open usbSerial success, portId: ${portId}`);
    } catch (error) {
      console.error(`open usbSerial error： ${error}`);
    }
    // [End openSerialDevice]
  }

  private serialRead() {
    // [Start serialRead]
    let portId: int = this.portId_;
    // 异步读取
    let readBuffer: Uint8Array = new Uint8Array(64);
    serialManager.read(portId, readBuffer, 2000).then((size: int) => {
      console.info(`readAsync usbSerial success, readAsyncBuffer: ${readBuffer}`);
    }).catch((error: Error) => {
      console.error(`readAsync usbSerial error: ${error}`);
    });

    // 同步读取
    let readSyncBuffer: Uint8Array = new Uint8Array(64);
    try {
      serialManager.readSync(portId, readSyncBuffer, 2000);
      console.info(`readSync usbSerial success, readSyncBuffer: ${readSyncBuffer}`);
    } catch (error) {
      console.error(`readSync usbSerial error: ${error}`);
    }
    // [End serialRead]
  }

  private serialWrite() {
    // [Start serialWrite]
    let portId: int = this.portId_;
    // 异步写入
    let writeBuffer: Uint8Array = new Uint8Array(buffer.from('Hello World', 'utf-8').buffer);
    serialManager.write(portId, writeBuffer, 2000).then((size: int) => {
      console.info(`writeAsync usbSerial success, writeAsyncBuffer: ${writeBuffer}`);
    }).catch((error: Error) => {
      console.error(`writeAsync usbSerial error: ${error}`);
    });

    // 同步写入
    let writeSyncBuffer: Uint8Array = new Uint8Array(buffer.from('Hello World', 'utf-8').buffer);
    try {
      serialManager.writeSync(portId, writeSyncBuffer, 2000);
      console.info(`writeSync usbSerial success, writeSyncBuffer: ${writeSyncBuffer}`);
    } catch (error) {
      console.error(`writeSync usbSerial error: ${error}`);
    }
    // [End serialWrite]
  }

  private getSerialConfig() {
    // [Start getSerialConfig]
    let portId: int = this.portId_;
    // 获取串口配置
    try {
      let attribute: serialManager.SerialAttribute = serialManager.getAttribute(portId);
      if (attribute === undefined) {
        console.error('getAttribute usbSerial error, attribute is undefined');
        this.logInfo_ += '\n[ERROR] getAttribute usbSerial error, attribute is undefined';
      } else {
        console.info(`getAttribute usbSerial success, attribute: ${attribute}`);
      }
    } catch (error) {
      console.error(`getAttribute usbSerial error: ${error}`);
    }
    // [End getSerialConfig]
  }

  private setSerialConfig() {
    // [Start setSerialConfig]
    let portId: int = this.portId_;
    // 设置串口配置
    try {
      let attribute: serialManager.SerialAttribute = {
        baudRate: serialManager.BaudRates.BAUDRATE_9600,
        dataBits: serialManager.DataBits.DATABIT_8,
        parity: serialManager.Parity.PARITY_NONE,
        stopBits: serialManager.StopBits.STOPBIT_1
      };
      serialManager.setAttribute(portId, attribute);
      console.info(`setAttribute usbSerial success, attribute: ${attribute}`);
    } catch (error) {
      console.error(`setAttribute usbSerial error: ${error}`);
    }
    // [End setSerialConfig]
  }

  private closeSerialDevice() {
    // [Start closeSerialDevice]
    let portId: int = this.portId_;
    try {
      serialManager.close(portId);
      console.info(`close usbSerial success, portId: ${portId}`);
    } catch (error) {
      console.error(`close usbSerial error: ${error}`);
    }
    // [End closeSerialDevice]
  }

  build() {
    Column() {
      Row() {
        Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {
          TextArea({ text: this.logInfo_ })
            .height('100%')
            .width('100%')
            .fontSize(12)
            .onChange((value: string) => {
              this.logInfo_ = value;
            })
        }.height('100%').width('100%')
      }.height('40%')

      Row() {
        Button('获取设备列表')
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .onClick(() => {

            this.getPortList();
          })
          .width('100%')
      }.padding(10)

      Row() {
        Button('获取设备操作权限')
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .onClick(() => {
            this.requestSerialRight();
          })
          .width('100%')
      }.padding(10)

      Row() {
        Button('打开串口设备')
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .onClick(() => {
            this.openSerialDevice();
          })
          .width('100%')
      }.padding(10)

      Row() {
        Button('读取数据')
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .onClick(() => {
            this.serialRead();
          })
          .width('100%')
      }.padding(10)

      Row() {
        Button('写入数据')
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .onClick(() => {
            this.serialWrite();
          })
          .width('100%')
      }.padding(10)

      Row() {
        Button('获取串口配置')
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .onClick(() => {
            this.getSerialConfig();
          })
          .width('100%')
      }.padding(10)

      Row() {
        Button('修改串口配置')
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .onClick(() => {
            this.setSerialConfig();
          })
          .width('100%')
      }.padding(10)

      Row() {
        Button('关闭串口设备')
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .onClick(() => {
            this.closeSerialDevice();
          })
          .width('100%')
      }.padding(10)
    }.height('100%').width('100%').padding({ left: 10, right: 10 })
  }
}