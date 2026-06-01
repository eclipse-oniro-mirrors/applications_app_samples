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

import { Entry, Column, Component, Button, ForEach, Scroll } from '@ohos.arkui.component';

interface DemoItem {
  name: string;
  path: string;
}

@Entry
@Component
struct Index {
  demos: DemoItem[] = [
    { name: 'ParallelizeUI外部状态变量示例', path: 'pages/ExternalState' },
    { name: 'ParallelizeUI参数构造示例', path: 'pages/ParameterConstruction' },
    { name: '并行化创建组件示例', path: 'pages/Page' },
    { name: '非List和Grid并行循环创建示例', path: 'pages/ParallelDemo' },
    { name: 'List并行创建子组件示例', path: 'pages/ListParallel' },
  ];

  build() {
    Scroll() {
      Column() {
        ForEach(this.demos, (item: DemoItem) => {
          Button(item.name)
            .onClick(() => {
              this.getUIContext().getRouter().pushUrl({ url: item.path })
            })
            .fontSize(18)
            .margin(15)
            .width('100%')
        }, (item: DemoItem) => item.path)
      }
      .padding(15)
      .width('100%')
    }
    .width('100%')
    .height('100%')
  }
}
