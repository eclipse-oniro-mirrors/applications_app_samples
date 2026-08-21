'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

// [Start webview_and_native_modules_are_used_to_implement_complex_message_interaction_between_applications_and_h5_pages]
import { $rawfile, BarState, Button, Column, Component, Entry, Row, Scroll } from '@kit.ArkUI';
import { TextArea, ScrollDirection, State, Text, Web } from '@kit.ArkUI';
import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';
import * as testNapi from 'libentry5.so';;

@Entry
@Component
struct Index {
  @State webTag: string = 'postMessage';
  controller: webview.WebviewController = new webview.WebviewController(this.webTag);
  @State h5Log: string = 'Display received message send from HTML';

  aboutToAppear() {
    webview.WebviewController.setWebDebuggingAccess(true);
    // 初始化web Native Development Kit
    testNapi.nativeWebInit(this.webTag);
  }

  aboutToDisAppear() {
    console.error('aboutToDisAppear');
  }

  build() {
    Scroll() {
      Column() {
        // 展示H5接收到的内容
        Text('H5_Side_Message_Display_From_App')
        TextArea({text: this.h5Log})
          .id('log_area')
          .width('100%')
          .height(100)
          .border({ width: 1 })
        Text('App_Side_Button')
        Row() {
          Button('createNoControllerTagPort')
            .id('create_no_tag_btn')
            .onClick(() => {
              try {
                testNapi.createWebMessagePorts('noTag');
              } catch (err) {
                console.error(
                  `ErrorCode: ${(err as BusinessError).code},  Message: ${(err as BusinessError).message}`);
              }
            })
          Button('createPort')
            .id('create_port_btn')
            .onClick(() => {
              try {
                testNapi.createWebMessagePorts(this.webTag);
              } catch (err) {
                console.error(
                  `ErrorCode: ${(err as BusinessError).code},  Message: ${(err as BusinessError).message}`);
              }
            })
        }

        Row() {
          Button('setHandler')
            .id('set_handler_btn')
            .onClick(() => {
              try {
                testNapi.setMessageEventHandler(this.webTag);
              } catch (err) {
                console.error(
                  `ErrorCode: ${(err as BusinessError).code},  Message: ${(err as BusinessError).message}`);
              }
            })

          Button('setHandlerThread')
            .id('set_handler_thread_btn')
            .onClick(() => {
              try {
                testNapi.setMessageEventHandlerThread(this.webTag);
              } catch (err) {
                console.error(
                  `ErrorCode: ${(err as BusinessError).code},  Message: ${(err as BusinessError).message}`);
              }
            })
        }

        Row() {
          Button('SendString')
            .id('send_string_btn')
            .onClick(() => {
              try {
                this.h5Log = ''
                testNapi.postMessage(this.webTag);
              } catch (err) {
                console.error(
                  `ErrorCode: ${(err as BusinessError).code},  Message: ${(err as BusinessError).message}`);
              }
            })
          Button('SendStringThread')
            .id('send_string_thread_btn')
            .onClick(() => {
              try {
                this.h5Log = ''
                testNapi.postMessageThread(this.webTag);
              } catch (err) {
                console.error(
                  `ErrorCode: ${(err as BusinessError).code},  Message: ${(err as BusinessError).message}`);
              }
            })
        }

        Row() {
          Button('SendBuffer')
            .id('send_buffer_btn')
            .onClick(() => {
              try {
                this.h5Log = ''
                testNapi.postBufferMessage(this.webTag);
              } catch (err) {
                console.error(
                  `ErrorCode: ${(err as BusinessError).code},  Message: ${(err as BusinessError).message}`);
              }
            })
          Button('SendNone')
            .id('send_none_btn')
            .onClick(() => {
              try {
                this.h5Log = ''
                testNapi.postNoneMessage(this.webTag);
              } catch (err) {
                console.error(
                  `ErrorCode: ${(err as BusinessError).code},  Message: ${(err as BusinessError).message}`);
              }
            })
        }

        Row() {
          Button('closePort')
            .id('close_port_btn')
            .onClick(() => {
              try {
                testNapi.closeMessagePort(this.webTag);
              } catch (err) {
                console.error(
                  `ErrorCode: ${(err as BusinessError).code},  Message: ${(err as BusinessError).message}`);
              }
            })
          Button('destroyNullPort')
            .id('destroy_null_btn')
            .onClick(() => {
              try {
                testNapi.destroyNullMessagePort(this.webTag);
              } catch (err) {
                console.error(
                  `ErrorCode: ${(err as BusinessError).code},  Message: ${(err as BusinessError).message}`);
              }
            })
          Button('destroyPort')
            .id('destroy_port_btn')
            .onClick(() => {
              try {
                testNapi.destroyMessagePort(this.webTag);
              } catch (err) {
                console.error(
                  `ErrorCode: ${(err as BusinessError).code},  Message: ${(err as BusinessError).message}`);
              }
            })
        }
        .width('100%')
        .padding(10)
        .border({ width: 1 })

        Column() {
          Text('H5_Side_Send_Button')
          Row() {
            Button('H5String')
              .id('h5_send_string_btn')
              .onClick(() => {
                try {
                  this.controller.runJavaScript('for(var i = 0; i < 2000; i++) postStringToApp()');
                } catch (err) {
                  console.error(
                    `ErrorCode: ${(err as BusinessError).code},  Message: ${(err as BusinessError).message}`);
                }
              })
            Button('H5Buffer')
              .id('h5_send_buffer_btn')
              .onClick(() => {
                try {
                  this.controller.runJavaScript('postBufferToApp()');
                } catch (err) {
                  console.error(
                    `ErrorCode: ${(err as BusinessError).code},  Message: ${(err as BusinessError).message}`);
                }
              })
            Button('H5Number')
              .id('h5_send_number_btn')
              .onClick(() => {
                try {
                  this.controller.runJavaScript('postNumberToApp()');
                } catch (err) {
                  console.error(
                    `ErrorCode: ${(err as BusinessError).code},  Message: ${(err as BusinessError).message}`);
                }
              })
          }

          Row() {
            Button('H5Json')
              .id('h5_send_json_btn')
              .onClick(() => {
                try {
                  this.controller.runJavaScript('postJsonToApp()');
                } catch (err) {
                  console.error(
                    `ErrorCode: ${(err as BusinessError).code},  Message: ${(err as BusinessError).message}`);
                }
              })
            Button('H5Array')
              .id('h5_send_array_btn')
              .onClick(() => {
                try {
                  this.controller.runJavaScript('postArrayStringToApp()');
                } catch (err) {
                  console.error(
                    `ErrorCode: ${(err as BusinessError).code},  Message: ${(err as BusinessError).message}`);
                }
              })
            Button('H5Object')
              .id('h5_send_object_btn')
              .onClick(() => {
                try {
                  this.controller.runJavaScript('postObjectToApp()');
                } catch (err) {
                  console.error(
                    `ErrorCode: ${(err as BusinessError).code},  Message: ${(err as BusinessError).message}`);
                }
              })
          }
        }
        .width('100%')
        .margin(10)
        .padding(10)
        .border({ width: 1 })

        Web({ src: $rawfile('index.html'), controller: this.controller })
          .onConsole((event) => {
            if (event) {
              let msg = event.message.getMessage();
              if (msg.startsWith('H5')) {
                this.h5Log = event.message.getMessage() + '\n' + this.h5Log;
              }
            }
            return false;
          })
      }
    }.height('100%')
    .scrollable(ScrollDirection.Vertical)
    .scrollBar(BarState.Off)
    .edgeEffect(EdgeEffect.Spring)
  }
}
// [End webview_and_native_modules_are_used_to_implement_complex_message_interaction_between_applications_and_h5_pages]
