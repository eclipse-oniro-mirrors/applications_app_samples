"use static"
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
import { Entry, Text, TextAttribute, Column, Row, Component, Button, ButtonAttribute, ClickEvent, List, ListItem, Color } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column(){
      Button('start backend service')
        .margin({ top: '40vp' })
        .onClick(() => {
          let aRouter = this.getUIContext().getRouter();
          aRouter.pushUrl({
              url:'pages/StartAppServiceExt'
            })
            .then(() => {
              console.info('pushUrl success');
            })
            .catch((err) => {
              console.error(`pushUrl failed, code is ${(err as BusinessError).code}, message is ${(err as BusinessError).message}`);
            })
        })
      Button('stop backend service')
        .margin({ top: '40vp' })
        .onClick(() => {
          let aRouter = this.getUIContext().getRouter();
          aRouter.pushUrl({
              url:'pages/StopAppServiceExt'
            })
            .then(() => {
              console.info('pushUrl success');
            })
            .catch((err) => {
              console.error(`pushUrl failed, code is ${(err as BusinessError).code}, message is ${(err as BusinessError).message}`);
            })
        })
      Button('connect backend service')
        .margin({ top: '40vp' })
        .onClick(() => {
          let aRouter = this.getUIContext().getRouter();
          aRouter.pushUrl({
              url:'pages/ConnectAppServiceExt'
            })
            .then(() => {
              console.info('pushUrl success');
            })
            .catch((err) => {
              console.error(`pushUrl failed, code is ${(err as BusinessError).code}, message is ${(err as BusinessError).message}`);
            })
        })
      Button('dis connect backend service')
        .margin({ top: '40vp' })
        .onClick(() => {
          let aRouter = this.getUIContext().getRouter();
          aRouter.pushUrl({
              url:'pages/DisConnectAppServiceExt'
            })
            .then(() => {
              console.info('pushUrl success');
            })
            .catch((err) => {
              console.error(`pushUrl failed, code is ${(err as BusinessError).code}, message is ${(err as BusinessError).message}`);
            })
        })
      Button('client service')
        .margin({ top: '40vp' })
        .onClick(() => {
          let aRouter = this.getUIContext().getRouter();
          aRouter.pushUrl({
              url:'pages/ClientServerExt'
            })
            .then(() => {
              console.info('pushUrl success');
            })
            .catch((err) => {
              console.error(`pushUrl failed, code is ${(err as BusinessError).code}, message is ${(err as BusinessError).message}`);
            })
        })

    }
  }
}