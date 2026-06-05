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

// [Start OHOSRouter]
// entry\src\main\ets\pages\routerAndNavigation\ohosRouter.ets
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
      Button("Router").onClick((event: ClickEvent) => {
        // [Start Router]
        this.getUIContext().getRouter()
        // [End Router]
      })
      Button("push").onClick((event: ClickEvent) => {
        // [Start push]
        this.getUIContext().getRouter().pushUrl({ url: "url" }, () => {
        })
        // [End push]
      })
      Button("back").onClick((event: ClickEvent) => {
        // [Start back]
        this.getUIContext().getRouter().back()
        // [End back]
      })
      Button("replace").onClick((event: ClickEvent) => {
        // [Start replace]
        this.getUIContext().getRouter().replaceUrl({ url: "url" }, () => {
        })
        // [End replace]
      })
      Button("clear").onClick((event: ClickEvent) => {
        // [Start clear]
        this.getUIContext().getRouter().clear()
        // [End clear]
      })
      Button("enableAlertBeforeBackPage").onClick((event: ClickEvent) => {
        // [Start enableAlertBeforeBackPage]
        this.getUIContext().getRouter().showAlertBeforeBackPage({ message: "" })
        // [End enableAlertBeforeBackPage]
      })
      Button("disableAlertBeforeBackPage").onClick((event: ClickEvent) => {
        // [Start disableAlertBeforeBackPage]
        this.getUIContext().getRouter().hideAlertBeforeBackPage()
        // [End disableAlertBeforeBackPage]
      })
      Button("getLength").onClick((event: ClickEvent) => {
        // [Start getLength]
        let length: string = this.getUIContext().getRouter().getLength()
        // [End getLength]
      })
      Button("getParams").onClick((event: ClickEvent) => {
        // [Start getParams]
        this.getUIContext().getRouter().getParams()
        // [End getParams]
      })
      Button("getState").onClick((event: ClickEvent) => {
        // [Start getState]
        this.getUIContext().getRouter().getState()
        // [End getState]
      })
      Button("BackRouterOptions").onClick((event: ClickEvent) => {
        // [Start BackRouterOptions]
        let options: router.RouterOptions = { url: "url" }
        // [End BackRouterOptions]
      })
      Button("BackRouterOptions_uri").onClick((event: ClickEvent) => {
        // [Start BackRouterOptions_uri]
        let options: router.RouterOptions = { url: "url" }
        // [End BackRouterOptions_uri]
      })
      Button("BackRouterOptions_params").onClick((event: ClickEvent) => {
        // [Start BackRouterOptions_params]
        let options: router.RouterOptions = { url: "url", params: "" }
        // [End BackRouterOptions_params]
      })
      Button("RouterOptions").onClick((event: ClickEvent) => {
        // [Start RouterOptions]
        let options: router.RouterOptions = { url: "url" }
        // [End RouterOptions]
      })
      Button("RouterOptions_uri").onClick((event: ClickEvent) => {
        // [Start RouterOptions_uri]
        let options: router.RouterOptions = { url: "url" }
        // [End RouterOptions_uri]
      })
      Button("RouterOptions_params").onClick((event: ClickEvent) => {
        // [Start RouterOptions_params]
        let options: router.RouterOptions = { url: "url", params: "" }
        // [End RouterOptions_params]
      })
      Button("RouterState").onClick((event: ClickEvent) => {
        // [Start RouterState]
        let state: router.RouterState = { index: 0, name: "name", path: "url", params: {} }
        // [End RouterState]
      })
      Button("RouterState_index").onClick((event: ClickEvent) => {
        // [Start RouterState_index]
        let state: router.RouterState = this.getUIContext().getRouter().getState()
        let index: number = state.index
        // [End RouterState_index]
      })
      Button("RouterState_name").onClick((event: ClickEvent) => {
        // [Start RouterState_name]
        let state: router.RouterState = this.getUIContext().getRouter().getState()
        let name: string = state.name
        // [End RouterState_name]
      })
      Button("RouterState_path").onClick((event: ClickEvent) => {
        // [Start RouterState_path]
        let state: router.RouterState = this.getUIContext().getRouter().getState()
        let path: string = state.path
        // [End RouterState_path]
      })
      Button("EnableAlertBeforeBackPageOptions").onClick((event: ClickEvent) => {
        // [Start EnableAlertBeforeBackPageOptions]
        let options: router.EnableAlertOptions = { message: "" }
        // [End EnableAlertBeforeBackPageOptions]
      })
      Button("EnableAlertBeforeBackPageOptions_message").onClick((event: ClickEvent) => {
        // [Start EnableAlertBeforeBackPageOptions_message]
        let options: router.EnableAlertOptions = { message: "" }
        // [End EnableAlertBeforeBackPageOptions_message]
      })
      Button("EnableAlertBeforeBackPageOptions_success").onClick((event: ClickEvent) => {
        // [Start EnableAlertBeforeBackPageOptions_success]
        // ArkTS-Sta版本，默认用户选择success，不再接受success、cancel、complete回调
        this.getUIContext().getRouter().showAlertBeforeBackPage({ message: "" })
        // [End EnableAlertBeforeBackPageOptions_success]
      })
      Button("EnableAlertBeforeBackPageOptions_cancel").onClick((event: ClickEvent) => {
        // [Start EnableAlertBeforeBackPageOptions_cancel]
        // ArkTS-Sta版本，默认用户选择success，不再接受success、cancel、complete回调
        this.getUIContext().getRouter().showAlertBeforeBackPage({ message: "" })
        // [End EnableAlertBeforeBackPageOptions_cancel]
      })
      Button("EnableAlertBeforeBackPageOptions_complete").onClick((event: ClickEvent) => {
        // [Start EnableAlertBeforeBackPageOptions_complete]
        // ArkTS-Sta版本，默认用户选择success，不再接受success、cancel、complete回调
        this.getUIContext().getRouter().showAlertBeforeBackPage({ message: "" })
        // [End EnableAlertBeforeBackPageOptions_complete]
      })
      Button("DisableAlertBeforeBackPageOptions_success").onClick((event: ClickEvent) => {
        // [Start DisableAlertBeforeBackPageOptions_success]
        // ArkTS-Sta版本，默认用户选择success，不再接受success、cancel、complete回调
        this.getUIContext().getRouter().hideAlertBeforeBackPage()
        // [End DisableAlertBeforeBackPageOptions_success]
      })
      Button("DisableAlertBeforeBackPageOptions_cancel").onClick((event: ClickEvent) => {
        // [Start DisableAlertBeforeBackPageOptions_cancel]
        // ArkTS-Sta版本，默认用户选择success，不再接受success、cancel、complete回调
        this.getUIContext().getRouter().hideAlertBeforeBackPage()
        // [End DisableAlertBeforeBackPageOptions_cancel]
      })
      Button("DisableAlertBeforeBackPageOptions_complete").onClick((event: ClickEvent) => {
        // [Start DisableAlertBeforeBackPageOptions_complete]
        // ArkTS-Sta版本，默认用户选择success，不再接受success、cancel、complete回调
        this.getUIContext().getRouter().hideAlertBeforeBackPage()
        // [End DisableAlertBeforeBackPageOptions_complete]
      })
      Button("ParamsInterface").onClick((event: ClickEvent) => {
        // [Start ParamsInterface]
        let params: Object = this.getUIContext().getRouter().getParams()
        // [End ParamsInterface]
      })
    }
  }
}

// [End OHOSRouter]
