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

// [Start priority_binding]
// xxx.ets
import { Column, Text, TapGesture, GestureMask, Entry, Component } from '@kit.ArkUI'
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: int = 0x0001;
const TAG: string = 'Sample_gesturebinding';

@Entry
@Component
struct PriorityBinding {
  build() {
    Column(undefined) {
      Text('Gesture').fontSize(28)
        .gesture(
          TapGesture()
            .onAction(() => {
              hilog.info(DOMAIN, TAG,'Text TapGesture is onAction');
            }))
    }
    .height(200)
    .width(250)
    // 设置为priorityGesture时，点击文本区域会忽略Text组件的TapGesture手势事件，优先响应父组件Column的TapGesture手势事件
    .priorityGesture(
      TapGesture()
        .onAction(() => {
          hilog.info(DOMAIN, TAG,'Column TapGesture is onAction');
        }), GestureMask.IgnoreInternal)
  }
}
//  [End priority_binding]
