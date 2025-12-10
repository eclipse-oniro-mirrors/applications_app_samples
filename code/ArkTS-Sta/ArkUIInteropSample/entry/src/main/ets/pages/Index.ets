'use static'

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

// ArkTS-Sta主页面功能：通过调用ArkTS-Dyn har包中的模块，展示ArkTS-Sta与ArkTS-Dyn互操作的基础场景

// 导入ArkTS-Sta组件及状态管理相关注解
import { Entry, Component, Text, Column, Scroll, Button, ClickEvent, compatibleWrappedBuilder } from '@ohos.arkui.component';
import { State, Link, Provide, StorageLink } from '@ohos.arkui.stateManagement';

// 从ArkTS-Dyn模块中导入自定义组件和自定义构建函数
import { DynamicComp1, DynamicComp2, DynamicComp3, DynamicComp4, DynamicComp5, myBuilder, globalBuilder } from 'har_dynamic';

import hilog from '@ohos.hilog';

// ArkTS-Sta主组件，作为应用入口
@Entry
@Component
struct Parent {
  // 组件中的各种状态管理注解成员属性，包括基本类型及复杂类型
  @State primState: string = 'stateVar';
  @State arrState: number[] = [1.0, 2.0, 3.0];
  @State setState: Set<number> = new Set<number>([1.0, 2.0, 3.0]);
  @State dateState: Date = new Date('2025-08-08');

  @Provide provideStr: string = 'provideVar';
  @StorageLink('keyA') storageLink: string = 'storageLinkVar';

  build() {
    Column() {
      Text('----- static -----')
      Button(`provideStr: ${this.provideStr}`)
        .onClick((e: ClickEvent) => {
          // 点击按钮修改provide状态管理成员属性
          this.provideStr += '~';
        })
      Button(`storageLink: ${this.storageLink}`)
        .onClick((e: ClickEvent) => {
          // 点击按钮修改storageLink状态管理成员属性
          this.storageLink += '~';
        })

      // 使用ArkTS-Dyn模块中的自定义构建函数，传递状态管理注解成员属性
      myBuilder({
        a: 'BuilderA',
        b: this.primState
      })

      // 使用ArkTS-Dyn模块中的全局自定义构建函数，传递状态管理注解成员属性
      let params = ESValue.instantiateEmptyObject()
      params.setProperty('a', 'WrappedBuilderA')
      params.setProperty('b', this.primState)
      compatibleWrappedBuilder(globalBuilder, params)

      // 使用ArkTS-Sta子组件，传递状态管理注解成员属性
      Child({
        primLink: this.primState,
        arrLink: this.arrState,
        setLink: this.setState,
        dateLink: this.dateState
      })
    }
  }
}

@Component
struct Child {
  @Link primLink: string;
  @Link arrLink: number[];
  @Link setLink: Set<number>;
  @Link dateLink: Date;

  build() {
    Scroll() {
      Column() {
        // 使用ArkTS-Dyn模块中的自定义组件，传递状态管理注解成员属性
        DynamicComp1({
          stateVar: this.primLink,
          propVar: this.primLink,
          linkVar: this.primLink,
          provideVar: this.primLink,
          regVar: this.primLink
        })
        DynamicComp2({
          stateVar: this.arrLink,
          linkVar: this.arrLink,
          provideVar: this.arrLink,
          regVar: this.arrLink
        })
        DynamicComp3({
          stateVar: this.setLink,
          linkVar: this.setLink,
          provideVar: this.setLink,
          regVar: this.setLink
        })
        DynamicComp4({
          stateVar: this.dateLink,
          linkVar: this.dateLink,
          provideVar: this.dateLink,
          regVar: this.dateLink
        })
        DynamicComp5()
      }
    }.width('100%')
  }
}
