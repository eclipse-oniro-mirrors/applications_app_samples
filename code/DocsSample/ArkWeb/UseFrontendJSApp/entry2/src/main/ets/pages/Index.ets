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

import { router } from '@kit.ArkUI';

// 应用主入口页面，点击按钮跳转到对应的ArkWeb功能示例页面
@Entry
@Component
struct Index {
  build() {
    Column({ space: 10 }) {
      // 跳转到JavaScriptProxy示例：通过javaScriptProxy属性将对象注入web端，实现应用与前端页面交互
      Button('JavaScriptProxy')
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({ url: 'pages/JavaScriptProxy' });
        })
      // 跳转到Promise示例：注册的方法返回Promise对象，异步返回结果
      Button('Promise_one')
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({ url: 'pages/Promise_one' });
        })
      Button('Promise_two')
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({ url: 'pages/Promise_two' });
        })
      // 跳转到registerJavaScriptProxy注册示例
      Button('RegisterJavaScriptProxy')
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({ url: 'pages/RegisterJavaScriptProxy' });
        })
      Button('RegisterJavaScriptProxyOne')
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({ url: 'pages/RegisterJavaScriptProxyOne' });
        })
      Button('RegisterJavaScriptProxyTwo')
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({ url: 'pages/RegisterJavaScriptProxyTwo' });
        })
      // 跳转到复杂类型示例：演示应用侧与前端页面间传递数组、回调、对象等复杂类型
      Button('UsageOfComplexTypes_one')
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({ url: 'pages/UsageOfComplexTypes_one' });
        })
      Button('UsageOfComplexTypes_two')
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({ url: 'pages/UsageOfComplexTypes_two' });
        })
      Button('UsageOfComplexTypes_three')
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({ url: 'pages/UsageOfComplexTypes_three' });
        })
      Button('UsageOfComplexTypes_four')
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({ url: 'pages/UsageOfComplexTypes_four' });
        })
      Button('UsageOfComplexTypes_five')
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({ url: 'pages/UsageOfComplexTypes_five' });
        })
    }.height('100%')
    .width('100%')
  }
}