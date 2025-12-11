/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { memo, __memo_context_type, __memo_id_type } from '@ohos.arkui.stateManagement';
import { $r, HorizontalAlign, FlexAlign, Text, TextAttribute, Column, Component, Button, ButtonAttribute, ClickEvent } from '@ohos.arkui.component';
import { State, MutableState, stateOf, observableProxy } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog';
import { Mod1 } from './mod/mod1';
import { Mod2 } from './mod/mod2';
import promptAction from '@ohos.promptAction';
import { UIContext, PromptAction } from '@ohos.arkui.UIContext';
import { A, E } from './mod/mod3';
import { Har } from 'importhar';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct MyStateSample {
  @State stateVar: string = 'state var';
  uiContext: UIContext | undefined = undefined;

  aboutToAppear(): void {
    this.uiContext = this.getUIContext();
  }
  build() {
    Column(undefined) {
      Button('import')
        .width('60%')
        .onClick((e: ClickEvent) => {
          let mod1 = new Mod1();
        })
      Button('export1')
        .width('60%')
        .onClick((e: ClickEvent) => {
          let mod2 = new Mod2();
        })
      Button('export2')
        .width('60%')
        .onClick((e: ClickEvent) => {
          let modA = new A();
          let modE = new E();
          let promptAction: PromptAction = this.uiContext!.getPromptAction();
          promptAction.showToast({
            message: '共加载了 E.count: ' + E.count + '个类',
            duration: 20000
          });
        })
      Button('export3')
        .width('60%')
        .onClick((e: ClickEvent) => {
          this.getUIContext().getRouter().pushUrl({url: 'pages/exportTestPage1'});
        })
      Button('export4')
        .width('60%')
        .onClick((e: ClickEvent) => {
          this.getUIContext().getRouter().pushUrl({url: 'pages/exportTestPage2'});
        })
      Button('import har')
        .width('60%')
        .onClick((e: ClickEvent) => {
          let har = new Har();
        })
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}