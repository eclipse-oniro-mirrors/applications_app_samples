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

// entry\src\main\ets\pages\ResInterop.ets
// [Start call_resource_sta]
import { Entry, Button, ClickEvent, Column, Component, Text, FontWeight, ColumnOptions } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { $r } from 'arkui.component.common';
import { Resource } from 'global.resource';
import transfer from '@ohos.transfer';
import { createResource } from 'library';

@Entry
@Component
struct ResInterop {
  // $r("app.string.res")需替换为开发者所需要的资源
  @State resText: Resource = $r("app.string.res");
  // $r("app.color.start_window_background"需替换为开发者所需要的资源
  @State resTextColor: Resource = $r("app.color.start_window_background");

  build() {
    Column() {
      Button("createResource").height(35)
        .onClick((e: ClickEvent) => {
          let res = createResource();
          let res2 = transfer.transferStatic(res, 'Global.Resource');
          this.resText = res2 as Resource;
        })
      Text(this.resText).backgroundColor(this.resTextColor).fontSize(26)
    }
  }
}

// [End call_resource_sta]