/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @file entry/src/main/ets/pages/Index.ets
 * 文件职责：Index 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：serialCommunication。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { socket } from '@kit.ConnectivityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { ToastReport } from '../common/ToastReport';
import util from '@ohos.util';

// const 语句
const TAG: string = 'SerialCommunication';
// let 语句
let encoder = new util.TextEncoder();

/**
 * serialCommunication：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct serialCommunication {
  // @State serverNumber：组件内部状态
  @State serverNumber: number = 0;

  // @State clientNumber：组件内部状态
  @State clientNumber: number = 1;

  // @State deviceId：组件内部状态
  @State deviceId: string = '';

  // @State uuid：组件内部状态
  @State uuid: string = '00001101-0000-1000-8000-00805f9b34fb';

  // @State dataValue：组件内部状态
  @State dataValue: string = '';

  // 字段 toastReport：声明并维护该成员的状态
  private toastReport: ToastReport = new ToastReport();

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度、背景色
    // Column：垂直布局容器
    // 关键属性：宽度、高度、背景色
    Column({ space: 12 }) {
      // Text：文本
      // 关键属性：字号、字重、相对对齐规则
      // Text：文本
      Text('serial communication').id('index_text_1')
        // fontSize：字号
        .fontSize(45)
        // fontWeight：字重
        .fontWeight(FontWeight.Bold)
        // id：id 属性
        
        // alignRules：alignRules 属性
        .alignRules({
          // 字段 center：声明并维护该成员的状态
          center: { anchor: '__container__', align: VerticalAlign.Top },
          // 字段 middle：声明并维护该成员的状态
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })

      // Text：文本
      Text($r('app.string.deviceId_style')).id('index_text_2')
      // Row：水平布局容器
      // 关键属性：宽度
      // Row：水平布局容器
      // 关键属性：宽度
      Row() {
        // Text：文本
        Text('deviceId: ').id('index_text_4')

        // TextInput：单行输入框
        // 关键属性：内容变更回调
        // 交互：输入/提交回调
        // TextInput：单行输入框
        // 关键属性：内容变更回调
        // 交互：输入/提交回调
        TextInput().id('deviceIdInput').onChange((value: string) => {
          // 更新 deviceId
          this.deviceId = value;
        }).height('40vp').width('70%')
      }.id('index_row_3').width('80%')

      // Text：文本
      Text($r('app.string.uuid_style')).id('index_text_5')
      // Row：水平布局容器
      // 关键属性：宽度
      // Row：水平布局容器
      // 关键属性：宽度
      Row() {
        // Text：文本
        Text('uuid: ').id('index_text_7')

        // TextInput：单行输入框
        // 关键属性：内容变更回调
        // 交互：输入/提交回调
        // TextInput：单行输入框
        // 关键属性：内容变更回调
        // 交互：输入/提交回调
        TextInput().id('uuidInput').onChange((value: string) => {
          // 更新 uuid
          this.uuid = value;
        }).height('40vp').width('70%')
      }.id('index_row_6').width('80%')

      // Row：水平布局容器
      // 关键属性：宽度
      // Row：水平布局容器
      // 关键属性：宽度
      Row() {
        // Text：文本
        Text('dataValue: ').id('index_text_9')

        // TextInput：单行输入框
        // 关键属性：内容变更回调
        // 交互：输入/提交回调
        // TextInput：单行输入框
        // 关键属性：内容变更回调
        // 交互：输入/提交回调
        TextInput().id('dataValueInput').onChange((value: string) => {
          // 更新 dataValue
          this.dataValue = value;
        }).height('40vp').width('70%')
      }.id('index_row_8').width('80%')

      // [Start server_write_client]
      // Button：按钮
      // 关键属性：宽度、背景色、点击事件回调
      // 交互：可点击交互
      // Button：按钮
      Button('listenSocket').id('index_button_2')
        // width：宽度
        .width('50%')
        // backgroundColor：背景色
        .backgroundColor('#8CE072')
        // onClick：点击事件回调
        .onClick(() => {
          // let 语句
          let serverNumber = -1;
          // let 语句
          let sppOption: socket.SppOptions = {
            // 字段 uuid：声明并维护该成员的状态
            uuid: this.uuid,
            // 字段 secure：声明并维护该成员的状态
            secure: true,
            // 字段 type：声明并维护该成员的状态
            type: 0
          };
          // try 语句
          try {
            socket.sppListen('server1', sppOption, (code: BusinessError | null, serverSocketID: number) => {
              // if 语句
              if (code != null) {
                console.error(TAG, 'sppListen error, code is ' + (code as BusinessError).code);
                this.toastReport.showResult('sppListen error, code is ' + (code as BusinessError).code);
                return;
              } else {
                serverNumber = serverSocketID;
                this.serverNumber = serverNumber;
                console.info(TAG, 'sppListen success, serverNumber = ' + serverNumber);
                this.toastReport.showResult('sppListen success, serverNumber = ' + serverNumber)
              }
            });
          } catch (err) {
            console.error('errCode: ' + (err as BusinessError).code + ', errMessage: ' +
            (err as BusinessError).message);
            this.toastReport.showResult('errCode: ' + (err as BusinessError).code + ', errMessage: ' +
            (err as BusinessError).message);
          }
        })

      // Button：按钮
      // 关键属性：宽度、背景色、点击事件回调
      // 交互：可点击交互
      // Button：按钮
      // 关键属性：宽度、背景色、点击事件回调
      // 交互：可点击交互
      Button('ServerConnect')
        .width('50%')
        .id('ServerConnect')
        .backgroundColor('#8CE072')
        .onClick(() => {
          let clientNumber = -1;
          try {

            socket.sppAccept(this.serverNumber, (code: BusinessError | null, clientSocketID: number) => {
              if (code != null) {
                console.error(TAG, 'sppAccept error, code is ' + (code as BusinessError).code);
                this.toastReport.showResult('sppAccept error, code is ' + (code as BusinessError).code);
                return;
              } else {
                clientNumber = clientSocketID;
                this.clientNumber = clientNumber
                console.info(TAG, 'accept the client success');
                this.toastReport.showResult('accept the client success');
              }
            })
            console.info(TAG, 'waiting for client connection');
            this.toastReport.showResult('waiting for client connection');
          } catch (err) {
            console.error('errCode: ' + (err as BusinessError).code + ', errMessage: ' +
            (err as BusinessError).message);
            this.toastReport.showResult('errCode: ' + (err as BusinessError).code + ', errMessage: ' +
            (err as BusinessError).message);

          }
        })

      // [Start socket_spp_connect]
      // Button：按钮
      // 关键属性：宽度、背景色、点击事件回调
      // 交互：可点击交互
      // Button：按钮
      // 关键属性：宽度、背景色、点击事件回调
      // 交互：可点击交互
      Button('connectDevice')
        .width('50%')
        .id('connectDevice')
        .backgroundColor('#8CE072')
        .onClick(() => {
          try {
            socket.sppConnect(this.deviceId, {
              uuid: this.uuid,
              secure: true,
              type: 0
            }, (code: BusinessError | null, socketID: number) => {
              if (code != null) {
                console.error(TAG, 'sppConnect error, code = ' + (code as BusinessError).code);
                this.toastReport.showResult('sppConnect error, code = ' + (code as BusinessError).code);
                return;
              }
              console.info(TAG, 'sppConnect success, socketId = ' + socketID);
              this.toastReport.showResult('sppConnect success, socketId = ' + socketID);
            })
          } catch (err) {
            console.error('errCode: ' + (err as BusinessError).code + ', errMessage: ' +
            (err as BusinessError).message);
            this.toastReport.showResult('errCode: ' + (err as BusinessError).code + ', errMessage: ' +
            (err as BusinessError).message);
          }
        })
      // [End socket_spp_connect]

      // Button：按钮
      // 关键属性：宽度、背景色、点击事件回调
      // 交互：可点击交互
      // Button：按钮
      // 关键属性：宽度、背景色、点击事件回调
      // 交互：可点击交互
      Button('writeData')
        .width('50%')
        .id('writeData')
        .backgroundColor('#8CE072')
        .onClick(() => {
          let array = new Uint8Array(this.dataValue.length);
          encoder.encodeIntoUint8Array(this.dataValue, array);

          try {
            socket.sppWrite(this.clientNumber, array.buffer);
            console.info(TAG, 'sppWrite success');
            this.toastReport.showResult('sppWrite success');
          } catch (err) {
            console.error('errCode: ' + (err as BusinessError).code + ', errMessage: ' +
            (err as BusinessError).message);
            this.toastReport.showResult('errCode: ' + (err as BusinessError).code + ', errMessage: ' +
            (err as BusinessError).message);
          }
        })

      // Button：按钮
      // 关键属性：宽度、背景色、点击事件回调
      // 交互：可点击交互
      // Button：按钮
      // 关键属性：宽度、背景色、点击事件回调
      // 交互：可点击交互
      Button('subscribeEvent')
        .width('50%')
        .id('subscribeEvent')
        .backgroundColor('#8CE072')
        .onClick(() => {
          try {
            socket.on('sppRead', this.clientNumber, (dataBuffer: ArrayBuffer) => {
              const data = new Uint8Array(dataBuffer);
              if (data != null) {
                console.info(TAG, 'sppRead success, data = ' + JSON.stringify(data));
                this.toastReport.showResult('sppRead success, data = ' + JSON.stringify(data));
              } else {
                console.error(TAG, 'sppRead error, data is null');
                this.toastReport.showResult('sppRead error, data is null');
              }
            })
          } catch (err) {
            console.error('errCode: ' + (err as BusinessError).code + ', errMessage: ' +
            (err as BusinessError).message);
            this.toastReport.showResult('errCode: ' + (err as BusinessError).code + ', errMessage: ' +
            (err as BusinessError).message);
          }
        })

      // Button：按钮
      // 关键属性：宽度、背景色、点击事件回调
      // 交互：可点击交互
      // Button：按钮
      // 关键属性：宽度、背景色、点击事件回调
      // 交互：可点击交互
      Button('unsubscribeEvent')
        .width('50%')
        .id('unsubscribeEvent')
        .backgroundColor('#8CE072')
        .onClick(() => {
          try {
            socket.off('sppRead', this.clientNumber, (dataBuffer: ArrayBuffer) => {
              const data = new Uint8Array(dataBuffer);
              if (data != null) {
                console.info(TAG, 'offSppRead success, data = ' + JSON.stringify(data));
                this.toastReport.showResult('offSppRead success, data = ' + JSON.stringify(data));
              } else {
                console.error(TAG, 'offSppRead error, data is null');
                this.toastReport.showResult('offSppRead error, data is null');
              }
            })
          } catch (err) {
            console.error('errCode: ' + (err as BusinessError).code + ', errMessage: ' +
            (err as BusinessError).message);
            this.toastReport.showResult('errCode: ' + (err as BusinessError).code + ', errMessage: ' +
            (err as BusinessError).message);
          }
        })

      // Button：按钮
      // 关键属性：宽度、背景色、点击事件回调
      // 交互：可点击交互
      // Button：按钮
      // 关键属性：宽度、背景色、点击事件回调
      // 交互：可点击交互
      Button('closeServer')
        .width('50%')
        .id('closeServer')
        .backgroundColor('#8CE072')
        .onClick(() => {
          try {
            socket.sppCloseServerSocket(this.serverNumber);
            console.info(TAG, 'sppCloseServerSocket success');
            this.toastReport.showResult('sppCloseServerSocket success');
          } catch (err) {
            console.error('errCode: ' + (err as BusinessError).code + ', errMessage: ' +
            (err as BusinessError).message);
            this.toastReport.showResult('errCode: ' + (err as BusinessError).code + ', errMessage: ' +
            (err as BusinessError).message);
          }
        })

      // Button：按钮
      // 关键属性：宽度、背景色、点击事件回调、sppCloseClientSocket
      // 交互：可点击交互
      // Button：按钮
      // 关键属性：宽度、背景色、点击事件回调、sppCloseClientSocket
      // 交互：可点击交互
      Button('closeClient')
        .width('50%')
        .id('closeClient')
        .backgroundColor('#8CE072')
        .onClick(() => {
          socket.sppCloseClientSocket(this.clientNumber);
          console.info(TAG, 'sppCloseClientSocket success');
          this.toastReport.showResult('sppCloseClientSocket success');
        })
      // [End server_write_client]
    }.id('index_column_1')
    .width('100%')
    .height('100%')
    .backgroundColor('#E6F7FF')
  }
}
