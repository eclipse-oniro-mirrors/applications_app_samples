/*
 * Copyright (c) 2022-2025 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/pages/Login.ets
 * 文件职责：Login 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：Login。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import wifi from '@ohos.wifi';
import router from '@ohos.router';
import { resolveIP } from '../utils/Util';
import socket from '@ohos.net.socket';
import Logger from '../model/Logger';
import { BusinessError } from '@kit.BasicServicesKit';
import { AddrType } from '../model/DataType';

// const 语句
const TAG: string = '[Login]';

// let 语句
let localAddr:AddrType = {
  // 字段 address：声明并维护该成员的状态
  address: resolveIP(wifi.getIpInfo().ipAddress),
  // 字段 family：声明并维护该成员的状态
  family: 1,
  // 字段 port：声明并维护该成员的状态
  port: 0
}
// let 语句
let oppositeAddr:AddrType = {
  // 字段 address：声明并维护该成员的状态
  address: '',
  // 字段 family：声明并维护该成员的状态
  family: 1,
  // 字段 port：声明并维护该成员的状态
  port: 0
}
// let 语句
let loginCount = 0;

// let 语句
let udp = socket.constructUDPSocketInstance();
// let 语句
let callOnceForudpObj = 0;

/**
 * Login：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct Login {
  // @State login_feng：组件内部状态
  @State login_feng: boolean = false;

  // @State login_wen：组件内部状态
  @State login_wen: boolean = false;

  // @State user：组件内部状态
  @State user: string = '';

  // @State roomDialog：组件内部状态
  @State roomDialog: boolean = false;

  // @State confirmDialog：组件内部状态
  @State confirmDialog: boolean = false;

  // @State ipDialog：组件内部状态
  @State ipDialog: boolean = true;

  // @State warnDialog：组件内部状态
  @State warnDialog: boolean = false;

  // @State warnText：组件内部状态
  @State warnText: string = '';

  // @State roomNumber：组件内部状态
  @State roomNumber: string = '';

  // @State receiveMsg：组件内部状态
  @State receiveMsg: string = '';

  /**
   * bindOption：执行 bindOption 相关逻辑。
   */
  bindOption() {
    // if 语句
    if (callOnceForudpObj == 0) {
      // let 语句
      let bindOption = udp.bind(localAddr);
      bindOption.then(() => {
        Logger.info(TAG, 'bind success');
      }).catch((err: BusinessError) => {
        Logger.info(TAG, 'bind fail');
      })
      callOnceForudpObj = 1;
    }

    udp.on('message', data => {
      Logger.info(TAG, `data:${JSON.stringify(data)}`);
      // let 语句
      let buffer = data.message;
      // let 语句
      let dataView = new DataView(buffer);
      Logger.info(TAG, `length = ${dataView.byteLength}`);
      // let 语句
      let str = '';
      // for 语句
      for (let i = 0; i < dataView.byteLength; ++i) {
        // let 语句
        let c = String.fromCharCode(dataView.getUint8(i));
        // if 语句
        if (c != '') {
          str += c;
        }
      }
      // if 语句
      if (str == 'ok') {
        router.clear();
        loginCount += 1;
        router.push({
          // 字段 url：声明并维护该成员的状态
          url: 'pages/Index',
          // 字段 params：声明并维护该成员的状态
          params: { address: oppositeAddr.address, port: oppositeAddr.port, loginCount: loginCount }
        })
      } else {
        // 更新 receiveMsg
        this.receiveMsg = str;
        // 更新 confirmDialog
        this.confirmDialog = true;
      }
    })
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Stack：层叠布局容器
    Stack({ alignContent: Alignment.Center }) {
      // Column：垂直布局容器
      // 关键属性：宽度、高度
      Column() {
        // Text：文本
        // 关键属性：宽度、高度、背景色、文本对齐、字号、内边距
        Text($r('app.string.MainAbility_label'))
          .id('loginTitleText')
          .width('100%')
          .height(50)
          .backgroundColor('#0D9FFB')
          .textAlign(TextAlign.Start)
          .fontSize(25)
          .padding({ left: 10 })
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
        if (!this.ipDialog) {
          // Column：垂直布局容器
          // 关键属性：宽度、外边距
          Column() {
            // Image：图片
            // 关键属性：宽度、高度、objectFit、字号、外边距
            Image(this.login_feng ? $r('app.media.fengziOn') : $r('app.media.wenziOn')).id('login_image_4')
              .width(100)
              .height(100)
              .objectFit(ImageFit.Fill)
            // Text：文本
            // 关键属性：字号、外边距
            Text($r('app.string.login_user_prefix', this.user)).id('login_text_5').fontSize(25).margin({ top: 50 })

            // Button：按钮
            // 关键属性：宽度、高度、外边距、输入类型、点击事件回调
            // 交互：可点击交互
            Button() {
              // Text：文本
              // 关键属性：字号、字体颜色
              Text($r('app.string.create_room')).id('login_text_7').fontSize(25).fontColor(Color.White)
            }.id('login_button_6')
            .width('150')
            .height(50)
            .margin({ top: 30 })
            .type(ButtonType.Capsule)
            .onClick(() => {
              // 更新 roomDialog
              this.roomDialog = true
              this.bindOption()
            })
          }.id('login_column_3').width('90%').margin({ top: 100 })
        }

      }.id('login_column_2').width('100%').height('100%')

      // if 语句
      if (this.confirmDialog) {
        // Column：垂直布局容器
        // 关键属性：宽度、高度、外边距、背景色、边框
        Column() {
          // Text：文本
          // 关键属性：字号
          Text($r('app.string.login_confirm_code_prefix', this.receiveMsg)).id('login_text_9').fontSize(25)
          // Row：水平布局容器
          // 关键属性：外边距、主轴对齐
          Row() {
            // Button：按钮
            // 关键属性：点击事件回调
            // 交互：可点击交互
            Button($r('app.string.cancel')).id('login_button_11')
              .onClick(() => {
                // 更新 confirmDialog
                this.confirmDialog = false
              }).backgroundColor(0xffffff).fontColor(Color.Black)
            // Button：按钮
            // 关键属性：点击事件回调、send
            // 交互：可点击交互
            Button($r('app.string.confirm')).id('login_button_12')
              .onClick(() => {
                udp.send({
                  // 字段 data：声明并维护该成员的状态
                  data: 'ok',
                  // 字段 address：声明并维护该成员的状态
                  address: oppositeAddr
                }).then((data) => {
                  Logger.info(TAG, `send ${JSON.stringify(data)}`);
                }).catch((err: BusinessError) => {
                  Logger.info(TAG, `send ${JSON.stringify(err)}`);
                })
                router.clear()
                loginCount += 1;
                router.push({
                  // 字段 url：声明并维护该成员的状态
                  url: 'pages/Index',
                  // 字段 params：声明并维护该成员的状态
                  params: { address: oppositeAddr.address, port: oppositeAddr.port, loginCount: loginCount }
                })
                this.confirmDialog = false;
              }).backgroundColor(0xffffff).fontColor(Color.Red)
          }.id('login_row_10').margin({ bottom: 10 })
          .justifyContent(FlexAlign.SpaceAround)
        }.id('login_column_8')
        .width('80%')
        .height(150)
        .margin({ top: '10%' })
        .backgroundColor(Color.White)
        .border({ radius: 10, width: 3 })
      }
      // if 语句
      if (this.ipDialog) {
        // Column：垂直布局容器
        // 关键属性：宽度、高度、外边距、背景色、边框
        Column() {
          // Text：文本
          // 关键属性：字号、外边距
          Text($r('app.string.login_local_ip_prefix', localAddr.address))
            .id('localIpText')
            .fontSize(25).margin({ top: 10 })
          // Text：文本
          // 关键属性：字号、外边距、bindMenu
          Text($r('app.string.login_user_label', this.user))
            .id('userSelectorText')
            .fontSize(20).margin({ top: 10 })
            .bindMenu([{
              value: '风子',
              action: () => {
                this.user = '风子'
                this.login_feng = true
                this.login_wen = false
                localAddr.port = 8080
                oppositeAddr.port = 9090
              }
            },
              {
                value: '蚊子',
                action: () => {
                  this.user = '蚊子'
                  this.login_wen = true
                  this.login_feng = false
                  localAddr.port = 9090
                  oppositeAddr.port = 8080
                }
              }
            ])
          // TextInput：单行输入框
          // 关键属性：宽度、字号、外边距、内容变更回调
          // 交互：输入/提交回调
          TextInput({ placeholder: '请输入对端ip' })
            .id('TextInput1')
            .width(200)
            .fontSize(25)
            .margin({ top: 10 })
            .onChange((value: string) => {
              oppositeAddr.address = value;
            })

          if (this.warnDialog) {
            // Text：文本
            // 关键属性：字号、字体颜色、外边距
            Text(this.warnText)
              .id('warnText')
              .fontSize(10).fontColor(Color.Red).margin({ top: 5 })
          }
          // Button：按钮
          // 关键属性：字体颜色、高度、外边距、点击事件回调
          // 交互：可点击交互
          Button($r('app.string.confirm'))
            .id('confirmIpButton')
            .fontColor(Color.Black)
            .height(30)
            .margin({ bottom: 10 })
            .onClick(() => {
              if (this.user == '') {
                this.warnDialog = true;
                this.warnText = '请先选择用户';
              } else if (oppositeAddr.address === '') {
                this.warnDialog = true;
                this.warnText = '请先输入对端IP';
              } else {
                this.bindOption()
                this.ipDialog = false;
                Logger.debug(TAG, `peer ip=${oppositeAddr.address}`);
                Logger.debug(TAG, `peer port=${oppositeAddr.port}`);
                Logger.debug(TAG, `peer port=${localAddr.port}`);
              }
            })
            .backgroundColor(0xffffff)
        }.id('login_column_13')
        .width('80%')
        .height(200)
        .margin({ top: '10%' })
        .backgroundColor(Color.White)
        .border({ radius: 10, width: 3 })
      }
      if (this.roomDialog) {
        // Column：垂直布局容器
        // 关键属性：宽度、高度、外边距、背景色、边框
        Column() {
          // Text：文本
          // 关键属性：字号、外边距
          Text($r('app.string.input_roomNumber')).id('login_text_15').fontSize(25).margin({ top: 10 })
          // TextInput：单行输入框
          // 关键属性：宽度、字号、外边距、内容变更回调
          // 交互：输入/提交回调
          TextInput().id('login_text_input_16')
            .width(100)
            .fontSize(25)
            .margin({ top: 10 })
            .onChange((value: string) => {
              this.roomNumber = value;
            })
          // Row：水平布局容器
          // 关键属性：外边距、主轴对齐
          Row() {
            // Button：按钮
            // 关键属性：点击事件回调
            // 交互：可点击交互
            Button($r('app.string.cancel')).id('login_button_18')
              .onClick(() => {
                this.roomDialog = false
              }).backgroundColor(0xffffff).fontColor(Color.Black)
            // Button：按钮
            // 关键属性：点击事件回调、info
            // 交互：可点击交互
            Button($r('app.string.confirm')).id('login_button_19')
              .onClick(() => {
                Logger.info(TAG, `[ROOM]address=${oppositeAddr.address}`);
                Logger.info(TAG, `[ROOM]port=${oppositeAddr.port}`);
                /*点击确定后发送房间号，另一端开始监听*/
                Logger.info(TAG, `[ROOM]oppositeAddr.address=${oppositeAddr.address}`);
                Logger.info(TAG, `[ROOM]oppositeAddr.port=${oppositeAddr.port}`);
                Logger.info(TAG, `[ROOM]localAddr.address=${localAddr.address}`);
                Logger.info(TAG, `[ROOM]localAddr.port=${localAddr.port}`);
                this.bindOption()
                udp.send({
                  data: this.roomNumber,
                  address: oppositeAddr
                }).then((data) => {
                  Logger.info(TAG, `send success, data = ${JSON.stringify(data)}`);
                }).catch((err: BusinessError) => {
                  Logger.info(TAG, `send fail, err = ${JSON.stringify(err)}`);
                })
                this.roomDialog = false;
              }).backgroundColor(0xffffff).fontColor(Color.Red)
          }.id('login_row_17').margin({ bottom: 10 })
          .justifyContent(FlexAlign.SpaceAround)
        }.id('login_column_14')
        .width('80%')
        .height(150)
        .margin({ top: '10%' })
        .backgroundColor(Color.White)
        .border({ radius: 10, width: 3 })
      }
    }.id('login_stack_1')
  }
}