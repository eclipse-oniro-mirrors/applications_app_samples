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
 * @file entry/src/main/ets/pages/Index.ets
 * 文件职责：Index 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：Index。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import wifi from '@ohos.wifi';
import router from '@ohos.router';
import socket from '@ohos.net.socket';
import Logger from '../model/Logger';
import { ChatBox } from '../model/ChatBox';
import { resolveIP } from '../utils/Util';
import { ChatSource } from '../model/DataSource';
import { AddrType } from '../model/DataType';
import util from '@ohos.util';
import { BusinessError } from '@kit.BasicServicesKit';

// let 语句
let udp = socket.constructUDPSocketInstance();
// let 语句
let callOnceForudpObj = 0;
// const 语句
const TAG: string = '[Index]';

// let 语句
let localAddr: AddrType = {
  // 字段 address：声明并维护该成员的状态
  address: resolveIP(wifi.getIpInfo().ipAddress),
  // 字段 family：声明并维护该成员的状态
  family: 1,
  // 字段 port：声明并维护该成员的状态
  port: 0
}

// let 语句
let oppositeAddr: AddrType = {
  // 字段 address：声明并维护该成员的状态
  address: '',
  // 字段 family：声明并维护该成员的状态
  family: 1,
  // 字段 port：声明并维护该成员的状态
  port: 0
}

/**
 * Index：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct Index {
  // 字段 address：声明并维护该成员的状态
  private address: string = (router.getParams() as Record<string, number | Object>).address as string;

  // 字段 port：声明并维护该成员的状态
  private port: number = (router.getParams() as Record<string, number | Object>).port as number;

  // 字段 loginCount：声明并维护该成员的状态
  private loginCount: number = (router.getParams() as Record<string, number | Object>).loginCount as number;

  // @State user：组件内部状态
  @State user: string = '';

  // @State userImg：组件内部状态
  @State userImg: Resource = $r('app.media.fengzi');

  // @State otherImg：组件内部状态
  @State otherImg: Resource = $r('app.media.wenzi');

  // @State chats：组件内部状态
  @State chats: ChatSource = new ChatSource();

  // @State loginState：组件内部状态
  @State loginState: boolean = true;

  // @State message：组件内部状态
  @State message: string = '';

  // @State afterSend：组件内部状态
  @State afterSend: boolean = false;

  // @State onlineState：组件内部状态
  @State onlineState: boolean = true;

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear() {
    oppositeAddr.address = this.address;
    oppositeAddr.port = this.port + this.loginCount;
    localAddr.port = (this.port === 8080 ? 9090 : 8080) + this.loginCount;
    // 更新 user
    this.user = localAddr.port === (9090 + this.loginCount) ? 'wenzi' : 'fengzi';
    Logger.info(TAG, `this.port=${this.port}`);
    Logger.info(TAG, `oppositeAddr.port=${oppositeAddr.port}`);
    Logger.info(TAG, `localAddr.port=${localAddr.port}`);
    // 更新 userImg
    this.userImg = this.user === 'fengzi' ? $r('app.media.fengzi') : $r('app.media.wenzi');
    // 更新 otherImg
    this.otherImg = this.user === 'fengzi' ? $r('app.media.wenzi') : $r('app.media.fengzi');
    // 更新 bindOption
    this.bindOption();
  }

  /**
   * aboutToDisappear：组件即将销毁时回调，用于释放资源与取消订阅。
   */
  aboutToDisappear() {
    //   退出页面时关闭udp连接
    udp.getState((err: Error, data: socket.SocketStateBase) => {
      // if 语句
      if (err) {
        Logger.error(TAG, 'get socket state fail');
      } else {
        Logger.info(TAG, `get socket state success, state: ${JSON.stringify(data)}`);
        // if 语句
        if (data.isBound && !data.isClose) {
          udp.off('message', () => {
          });
          udp.close();
        }
      }
    })
  }

  /**
   * bindOption：执行 bindOption 相关逻辑。
   */
  bindOption() {
    // if 语句
    if (callOnceForudpObj == 0) {
      //绑定，开始监听消息
      let promise = udp.bind(localAddr);
      promise.then(() => {
        Logger.info(TAG, 'udp bind success');
      }).catch((err: BusinessError) => {
        Logger.info(TAG, `udp bind fail ${err}`);
      })
      callOnceForudpObj = 1
    }

    udp.on('message', data => {
      // let 语句
      let textDecoder = util.TextDecoder.create('utf-8');
      // if 语句
      if (data.message instanceof ArrayBuffer) {
        // let 语句
        let dataView = new Uint8Array(data.message);
        Logger.info(TAG, `length = ${dataView.byteLength}`);
        // let 语句
        let str = textDecoder.decodeWithStream(dataView);
        Logger.info(TAG, `message aray buffer:${str}`);

        // if 语句
        if (str == 'online') {
          // 更新 onlineState
          this.onlineState = true;
        } else if (str == 'offline') {
          // 更新 onlineState
          this.onlineState = false;
        } else if (str == 'exit') {
          udp.off('message', () => {
          });
          udp.close();
          Logger.info(TAG, 'receive udp exit 2');
          router.back();
          Logger.info(TAG, 'receive udp exit 3');
        } else {
          Logger.info(TAG, `receive in Chat sucess`);
          // let 语句
          let date = (new Date().getMonth() + 1) + '.' + new Date().getDate() + '-' + new Date().getHours() + ':' +
          new Date().getMinutes();
          Logger.info(TAG, `pre:this.chats=${JSON.stringify(this.chats.chatsArray)}`);
          // 更新 chats
          this.chats.pushData(new ChatBox(false, str, date));
          Logger.info(TAG, `after:this.chats=${JSON.stringify(this.chats.chatsArray)}`);
        }
        // 字段 str：声明并维护该成员的状态
        str = '';
      } else {
        Logger.info(TAG, `message:${data.message}`);
      }
    })
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Flex：弹性布局容器
    // 关键属性：宽度、高度
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Start }) {
      // Row：水平布局容器
      // 关键属性：高度、宽度、背景色、内边距
      Row() {
        // Text：文本
        // 关键属性：字号、字体颜色、文本对齐、字重
        Text($r('app.string.MainAbility_label')).id('index_text_3')
          .fontSize(25)
          .fontColor(Color.White)
          .textAlign(TextAlign.Start)
          .fontWeight(FontWeight.Bold)
        // Blank：占位空白
        Blank().id('index_blank_4')
        // Button：按钮
        // 关键属性：宽度、输入类型、背景色、点击事件回调
        // 交互：可点击交互
        Button() {
          // Image：图片
          // 关键属性：宽度、高度、objectFit
          Image($r('app.media.exit')).id('index_image_6')
            .width(35)
            .height(35)
            .objectFit(ImageFit.Fill)
        }.id('index_button_5')
        .width(100)
        .type(ButtonType.Capsule)
        .backgroundColor('#ff50afea')
        .onClick(() => {
          // if 语句
          if (!this.onlineState) {
            // 更新 chats
            this.chats.chatsArray = [];
            // 更新 chats
            this.chats.notifyDataReload();
            udp.off('message', () => {
            })
            router.back();
          }
          udp.send({
            // 字段 data：声明并维护该成员的状态
            data: 'exit',
            // 字段 address：声明并维护该成员的状态
            address: oppositeAddr
          }).then(data => {
            Logger.info(TAG, `send sucess : ${data}`);
            // 更新 chats
            this.chats.chatsArray = [];
            // 更新 chats
            this.chats.notifyDataReload();
            udp.off('message', () => {
            });
            udp.close();
            router.back();
          }).catch((err: BusinessError) => {
            Logger.info(TAG, `TAG,send : ${JSON.stringify(err)}`);
          })
        })
      }.id('index_row_2')
      .height(50)
      .width('100%')
      .backgroundColor('#0D9FFB')
      .padding({ left: 10, right: 10 })

      // Column：垂直布局容器
      // 关键属性：宽度、高度、背景色、bindMenu
      Column() {
        // Text：文本
        // 关键属性：字号、宽度、内边距、文本对齐
        Text(this.user === 'fengzi' ? $r('app.string.classmate_fengzi') : $r('app.string.classmate_wenzi'))
          .id('index_text_8')
          .fontSize(20)
          .width('100%')
          .padding({ top: 5 })
          .textAlign(TextAlign.Center)
        // Row：水平布局容器
        // 关键属性：内边距
        Row() {
          // Image：图片
          // 关键属性：宽度、高度、外边距、objectFit、自身对齐
          Image(this.onlineState ? $r('app.media.online') : $r('app.media.offline')).id('index_image_10')
            .width(15)
            .height(15)
            .margin({ top: 3 })
            .objectFit(ImageFit.Fill)
            .alignSelf(ItemAlign.Start)
          // Text：文本
          // 关键属性：字号、外边距、文本对齐、内边距
          Text(this.onlineState === true ? $r('app.string.online') : $r('app.string.offline')).id('index_text_11')
            .fontSize(15)
            .margin({ left: 5 })
            .textAlign(TextAlign.Center)
        }.id('index_row_9').padding({ top: 5 })
      }.id('index_column_7')
      .width('100%').height(55)
      .backgroundColor(this.onlineState ? '#ffcae4f5' : '#e5e5e5')
      .bindMenu([
        {
          // 字段 value：声明并维护该成员的状态
          value: '在线',
          // 字段 action：声明并维护该成员的状态
          action: () => {
            //设置为在线后，绑定本地的地址和端口，并向对方发送在线指令
            this.onlineState = true;
            udp.send({
              // 字段 data：声明并维护该成员的状态
              data: 'online',
              // 字段 address：声明并维护该成员的状态
              address: oppositeAddr
            }).then(data => {
              Logger.info(TAG, `send sucess : ${data}`);
            }).catch((err: BusinessError) => {
              Logger.info(TAG, `TAG,send : ${JSON.stringify(err)}`);
            })
            this.bindOption();
          }
        },
        {
          // 字段 value：声明并维护该成员的状态
          value: '离线',
          // 字段 action：声明并维护该成员的状态
          action: () => {
            //设置为离线后，先向对方发送发送离线信息，然后关闭udp
            this.onlineState = false;
            udp.send({
              // 字段 data：声明并维护该成员的状态
              data: 'offline',
              // 字段 address：声明并维护该成员的状态
              address: oppositeAddr
            }).then(data => {
              Logger.info(TAG, `send sucess : ${data}`);
            }).catch((err: BusinessError) => {
              Logger.info(TAG, `TAG,send : ${JSON.stringify(err)}`);
            })
          }
        }
      ])

      // Scroll：滚动容器
      // 关键属性：scrollable、滚动条、scrollBarColor、背景色、scrollBarWidth、宽度
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：宽度、内边距
        Column() {
          LazyForEach(this.chats, (item: ChatBox, index) => {
            // if 语句
            if (item.isSend) {
              // Row：水平布局容器
              // 关键属性：外边距、自身对齐
              Row() {
                // Column：垂直布局容器
                // 关键属性：宽度、外边距
                Column() {
                  // Text：文本
                  // 关键属性：字号、宽度、文本对齐
                  Text(item.date).id('index_text_16')
                    .fontSize(15)//时间
                    .width('100%')
                    .textAlign(TextAlign.End)
                  // Text：文本
                  // 关键属性：最大行数、内边距、字号、圆角、自身对齐、背景色
                  Text(item.message).id('index_text_17')
                    .maxLines(5)
                    .padding(10)
                    .fontSize(20)
                    .borderRadius(10)
                    .alignSelf(ItemAlign.End)
                    .backgroundColor('#ff78dd4d')
                }.id('index_column_15').width('70%').margin({ right: 5 })

                // Image：图片
                // 关键属性：宽度、高度、objectFit、外边距、自身对齐
                Image(item.isSend ? this.userImg : this.otherImg)
                  .id('index_image_18')
                  .width(50)
                  .height(50)
                  .objectFit(ImageFit.Fill)
              }.id('index_row_14').margin({ top: 5, bottom: 10 }).alignSelf(ItemAlign.End)
            } else {
              // Row：水平布局容器
              // 关键属性：外边距、自身对齐
              Row() {
                // Image：图片
                // 关键属性：宽度、高度、objectFit
                Image(item.isSend ? this.userImg : this.otherImg)
                  .id('index_image_20')
                  .width(50)
                  .height(50)
                  .objectFit(ImageFit.Fill)
                // Column：垂直布局容器
                // 关键属性：宽度、外边距、自身对齐
                Column() {
                  // Text：文本
                  // 关键属性：宽度、文本对齐、字号
                  Text(item.date).id('index_text_22').width('100%').textAlign(TextAlign.Start).fontSize(15) // 时间
                  // Text：文本
                  // 关键属性：字号、最大行数、内边距、圆角、自身对齐、背景色
                  Text(item.message).id('index_text_23')
                    .fontSize(20)
                    .maxLines(5)
                    .padding(10)
                    .borderRadius(10)
                    .alignSelf(ItemAlign.Start)
                    .backgroundColor('#ff78dd4d')
                }.id('index_column_21').width('70%').margin({ left: 5 })
              }.id('index_row_19').margin({ top: 5, bottom: 10 }).alignSelf(ItemAlign.Start)
            }
          }, (item: ChatBox) => item.message)
        }.id('index_column_13')
        .width('100%')
        .padding(5)
      }.id('index_scroll_12')
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Auto)
      .scrollBarColor(Color.Gray)
      .backgroundColor(Color.White)
      .scrollBarWidth(5)
      .width('100%')
      .layoutWeight(1)

      // Row：水平布局容器
      // 关键属性：宽度、高度、背景色
      Row() {
        // TextInput：单行输入框
        // 关键属性：高度、字号、布局权重、输入类型、背景色、外边距
        // 交互：输入/提交回调
        TextInput({ placeholder: this.message, text: this.message }).id('index_text_input_25')
          .height(50)
          .fontSize(20)
          .layoutWeight(3)
          .type(InputType.Normal)
          .backgroundColor(Color.White)
          .margin({ left: 2, right: 2 })
          .onChange((value: string) => {
            // 更新 message
            this.message = value;
          })

        // Button：按钮
        // 关键属性：高度、布局权重、圆角、输入类型、外边距、背景色
        // 交互：可点击交互
        Button() {
          // Text：文本
          // 关键属性：字号、字体颜色
          Text($r('app.string.send_message')).id('index_text_27').fontSize(23).fontColor(Color.White)
        }.id('index_button_26')
        .height(50)
        .layoutWeight(1)
        .borderRadius(10)
        .type(ButtonType.Normal)
        .margin({ left: 2, right: 2 })
        .backgroundColor('#ffadf58e')
        .onClick(() => {
          // let 语句
          let date = (new Date().getMonth() + 1) + '.' + new Date().getDate() + '-' + new Date().getHours() + ':' +
          new Date().getMinutes();
          // let 语句
          let sendMessage = new ChatBox(true, this.message, date);
          if (this.message !== '' && this.loginState && this.onlineState) {
            this.chats.pushData(sendMessage);
            //通过udp发送this.message文本
            this.bindOption();
            udp.send({
              data: this.message,
              address: oppositeAddr
            }).then(data => {
              Logger.info(TAG, 'send sucess');
              Logger.info(TAG, `send ${data}`);
              Logger.info(TAG, `this.chats=${JSON.stringify(this.chats.chatsArray)}`);
              Logger.info(TAG, `(send)opposite_address=${oppositeAddr.address}`);
              Logger.info(TAG, `(send)opposite_port=${oppositeAddr.port}`);
              Logger.info(TAG, `(send)this.message=${this.message}`);
              Logger.info(TAG, `this.chats=${JSON.stringify(this.chats.chatsArray)}`);
            }).catch((err: BusinessError) => {
              Logger.info(TAG, `send ${JSON.stringify(err)}`);
            })
          }
          this.message = '';
        })
      }.id('index_row_24').width('100%').height(70).backgroundColor('#f5f5f5')
    }.id('index_flex_1')
    .width('100%')
    .height('100%')
  }
}