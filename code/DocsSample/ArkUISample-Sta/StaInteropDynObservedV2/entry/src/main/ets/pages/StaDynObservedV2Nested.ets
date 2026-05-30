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

// [Start StaDynObservedV2Nested]
// entry/src/main/ets/pages/StaDynObservedV2Nested.ets

import { Entry, Row, Text, Column, Component, Button, ComponentV2, enableCompatibleObservedV2ForStatic } from '@ohos.arkui.component';
import { State, ObservedV2, Trace } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog';
import { Student } from 'dynamic_module';

@Entry
@ComponentV2
struct Index {// ArkTS-Sta自定义组件
  // 创建ArkTS-Dyn @ObservedV2修饰类的实例
  student: Student = new Student();
  aboutToAppear() {
    // 启用ArkTS-Dyn @ObservedV2与ArkTS-Sta组件的互操作开关，以支持@Trace属性变化观测
    enableCompatibleObservedV2ForStatic(this.student);
  }

  build() {
    Column() {
      // 显示length属性
      Text('pencil length'+ this.student.bag.pencil.length)
      .fontSize(30)
      .margin(10)
      Button('change length')
        .onClick(() => {
          // 修改@Trace修饰的length属性，UI会刷新
          this.student.bag.pencil.length += 100;
        })
        .width(300)
        .margin(10)
    }
  }
}
// [End StaDynObservedV2Nested]
