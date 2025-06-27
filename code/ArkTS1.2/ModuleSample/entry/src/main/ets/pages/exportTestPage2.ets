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
import {
  memo,
  __memo_context_type,
  __memo_id_type
} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import {
  Text,
  TextAttribute,
  Column,
  Component,
  Button,
  ButtonAttribute,
  ClickEvent,
  UserView,
  Row,
  Scroll,
  Entry,
  Divider,
  $r
} from '@ohos.arkui.component' // TextAttribute should be insert by ui-plugins
import {
  State,
  MutableState,
  stateOf,
  observableProxy
} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import hilog from '@ohos.hilog'
import router from '@ohos.router'
import { ExportSmallClass } from './mod/mod5';
let exportTime: double = ExportSmallClass.exportTime;
let dur = Date.now() - exportTime;
@Entry
@Component
struct page2 {
  build() {
    Column() {
      Text('page2')
        .fontSize(30)
      Text('耗时' + dur + 'ms')
        .fontSize(20)
      if(ExportSmallClass.isExportOtherClass) {
        Text($r('app.string.Unnecessary_class_loading'))
      }
      Button("back")
        .onClick((e: ClickEvent) => {
          this.getUIContext().getRouter().back();
        })
    }
    .width('100%')
    .height('100%')
  }
}

export class ComExampleTrivialApplication extends UserView {
  getBuilder() {
    let wrapper = @memo() => {
      page2(undefined)
    }
    return wrapper
  }
}