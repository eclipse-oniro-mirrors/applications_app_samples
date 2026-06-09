'use static'

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// [Start ui_information]
// entry\src\main\ets\pages\ohosRouter.ets
import { Entry, Button, ClickEvent, Column, Component, Text, FontWeight, ColumnOptions } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct OHOSRouter {
  @State message: string = "OHOSRouter"

  build() {
    Column({ space: 8 } as ColumnOptions) {
      Text(this.message)
        .fontWeight(FontWeight.Bold)
        .fontSize(26)
      Button("push").onClick((event: ClickEvent) => {
        // [Start push]
        this.getUIContext().getRouter().pushUrl({ url: "url" })
        // [End push]
      })
      Button("pushUrl").onClick((event: ClickEvent) => {
        // [Start pushUrl]
        this.getUIContext().getRouter().pushUrl({url: "url"})
        // [End pushUrl]
      })
      Button("pushUrl2").onClick((event: ClickEvent) => {
        // [Start pushUrl2]
        this.getUIContext().getRouter().pushUrl({url: "url"}, router.RouterMode.Standard)
        // [End pushUrl2]
      })
      Button("pushUrl3").onClick((event: ClickEvent) => {
        // [Start pushUrl3]
        this.getUIContext().getRouter().pushUrl({url: "url"}, router.RouterMode.Standard, ()=>{})
        // [End pushUrl3]
      })
      Button("back").onClick((event: ClickEvent) => {
        // [Start back]
        this.getUIContext().getRouter().back({url: "url"})
        // [End back]
      })
      Button("back1").onClick((event: ClickEvent) => {
        // [Start back1]
        this.getUIContext().getRouter().back(1)
        // [End back1]
      })
      Button("replace").onClick((event: ClickEvent) => {
        // [Start replace]
        this.getUIContext().getRouter().replaceUrl({url: "url"})
        // [End replace]
      })
      Button("replaceUrl").onClick((event: ClickEvent) => {
        // [Start replaceUrl]
        this.getUIContext().getRouter().replaceUrl({url: "url"})
        // [End replaceUrl]
      })
      Button("replaceUrl2").onClick((event: ClickEvent) => {
        // [Start replaceUrl2]
        this.getUIContext().getRouter().replaceUrl({url: "url"}, ()=>{})
        // [End replaceUrl2]
      })
      Button("replaceUrl3").onClick((event: ClickEvent) => {
        // [Start replaceUrl3]
        this.getUIContext().getRouter().replaceUrl({url: "url"}, router.RouterMode.Standard)
        // [End replaceUrl3]
      })
      Button("replaceUrl4").onClick((event: ClickEvent) => {
        // [Start replaceUrl4]
        this.getUIContext().getRouter().replaceUrl({url: "url"}, router.RouterMode.Standard, ()=>{})
        // [End replaceUrl4]
      })
      Button("pushNamedRoute").onClick((event: ClickEvent) => {
        // [Start pushNamedRoute]
        this.getUIContext().getRouter().pushNamedRoute({name: "路由名"})
        // [End pushNamedRoute]
      })
      Button("pushNamedRoute2").onClick((event: ClickEvent) => {
        // [Start pushNamedRoute2]
        this.getUIContext().getRouter().pushNamedRoute({name: "路由名"}, ()=>{})
        // [End pushNamedRoute2]
      })
      Button("pushNamedRoute3").onClick((event: ClickEvent) => {
        // [Start pushNamedRoute3]
        this.getUIContext().getRouter().pushNamedRoute({name: "路由名"}, router.RouterMode.Standard)
        // [End pushNamedRoute3]
      })
      Button("pushNamedRoute4").onClick((event: ClickEvent) => {
        // [Start pushNamedRoute4]
        this.getUIContext().getRouter().pushNamedRoute({name: "路由名"}, router.RouterMode.Standard, ()=>{})
        // [End pushNamedRoute4]
      })
      Button("replaceNamedRoute").onClick((event: ClickEvent) => {
        // [Start replaceNamedRoute]
        this.getUIContext().getRouter().replaceNamedRoute({name: "路由名"})
        // [End replaceNamedRoute]
      })
      Button("replaceNamedRoute2").onClick((event: ClickEvent) => {
        // [Start replaceNamedRoute2]
        this.getUIContext().getRouter().replaceNamedRoute({name: "路由名"}, ()=>{})
        // [End replaceNamedRoute2]
      })
      Button("replaceNamedRoute3").onClick((event: ClickEvent) => {
        // [Start replaceNamedRoute3]
        this.getUIContext().getRouter().replaceNamedRoute({name: "路由名"}, router.RouterMode.Standard)
        // [End replaceNamedRoute3]
      })
      Button("replaceNamedRoute4").onClick((event: ClickEvent) => {
        // [Start replaceNamedRoute4]
        this.getUIContext().getRouter().replaceNamedRoute({name: "路由名"}, router.RouterMode.Standard, ()=>{})
        // [End replaceNamedRoute4]
      })
      Button("getParams").onClick((event: ClickEvent) => {
        // [Start getParams]
        this.getUIContext().getRouter().getParams()
        // [End getParams]
      })
      Button("getStateByUrl").onClick((event: ClickEvent) => {
        // [Start getStateByUrl]
        this.getUIContext().getRouter().getStateByUrl("url")
        // [End getStateByUrl]
      })
      Button("getStateByIndex").onClick((event: ClickEvent) => {
        // [Start getStateByIndex]
        this.getUIContext().getRouter().getStateByIndex(1)
        // [End getStateByIndex]
      })
      Button("getState").onClick((event: ClickEvent) => {
        // [Start getState]
        this.getUIContext().getRouter().getState()
        // [End getState]
      })
      Button("getLength").onClick((event: ClickEvent) => {
        // [Start getLength]
        this.getUIContext().getRouter().getLength()
        // [End getLength]
      })
      Button("clear").onClick((event: ClickEvent) => {
        // [Start clear]
        this.getUIContext().getRouter().clear()
        // [End clear]
      })
      Button("enableAlertBeforeBackPage").onClick((event: ClickEvent) => {
        // [Start enableAlertBeforeBackPage]
        this.getUIContext().getRouter().showAlertBeforeBackPage({message: "1111"})
        // [End enableAlertBeforeBackPage]
      })
      Button("showAlertBeforeBackPage").onClick((event: ClickEvent) => {
        // [Start showAlertBeforeBackPage]
        this.getUIContext().getRouter().showAlertBeforeBackPage({message: "1111"})
        // [End showAlertBeforeBackPage]
      })
      Button("disableAlertBeforeBackPage").onClick((event: ClickEvent) => {
        // [Start disableAlertBeforeBackPage]
        this.getUIContext().getRouter().hideAlertBeforeBackPage()
        // [End disableAlertBeforeBackPage]
      })
      Button("hideAlertBeforeBackPage").onClick((event: ClickEvent) => {
        // [Start hideAlertBeforeBackPage]
        this.getUIContext().getRouter().hideAlertBeforeBackPage()
        // [End hideAlertBeforeBackPage]
      })
    }
  }
}

// [End ui_information]
