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

// [Start entry2_prerender_web_page_index2_static]
// Index2.ets
import { Entry, Column, Row, Component, NodeContainer } from '@ohos.arkui.component'
import { getNWeb, MyNodeController } from './Common'

@Entry
@Component
struct Index2 {
  build() {
    Row() {
      Column() {
        // NodeContainer用于与NodeController节点绑定，rebuild会触发makeNode
        // Page页通过NodeContainer接口绑定NodeController，实现动态组件页面显示
        NodeContainer(getNWeb('www.example.com') as MyNodeController)
          .height('90%')
          .width('100%')
      }
      .width('100%')
    }
    .height('100%')
  }
}

// [End entry2_prerender_web_page_index2_static]

