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
} from '@ohos.arkui.stateManagement';
import {
  Text,
  TextAttribute,
  Column,
  Component,
  Button,
  ButtonAttribute,
  ClickEvent,
  Row,
  Scroll,
  Entry,
  Divider,
  $r
} from '@ohos.arkui.component';
import {
  State,
  MutableState,
  stateOf,
  observableProxy
} from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog';
import router from '@ohos.router';
import { ExportSmallClassTest } from './mod/mod4';
let exportTime: double = ExportSmallClassTest.exportTime;
let dur = Date.now() - exportTime;

@Entry
@Component
struct page1 {
  build() {
    Column() {
      Text('page1')
        .fontSize(30)
      Text('耗时' + dur + 'ms')
        .fontSize(20)
      Button('back')
        .onClick((e: ClickEvent) => {
          this.getUIContext().getRouter().back();
        })
    }
    .width('100%')
    .height('100%')
  }
}