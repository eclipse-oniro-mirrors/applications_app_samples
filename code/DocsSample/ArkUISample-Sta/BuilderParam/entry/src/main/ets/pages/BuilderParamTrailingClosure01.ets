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

import { NavDestination, $r } from '@kit.ArkUI';
// [Start BuilderParamTrailingClosure01]
import { Entry, Component, Column, Builder, BuilderParam, Text, Color, ClickEvent, State, PropRef } from '@kit.ArkUI';

@Component
struct CustomContainer {
  @PropRef header: string = '';

  @Builder
  closerBuilder() {
    Text('CustomContainer')
        .fontSize(30)
  }

  // this.closerBuilder初始化子组件@BuilderParam
  @BuilderParam mainContentBuilder: () => void = this.closerBuilder;
  // 使用父组件的尾随闭包{}(@Builder装饰的方法)初始化子组件@BuilderParam
  @BuilderParam closer: () => void = this.closerBuilder;

  build() {
    Column() {
      Text(this.header)
        .fontSize(30)
      this.mainContentBuilder()
      this.closer()
    }
  }
}

@Builder
function specificParam(label1: string, label2: string) {
  Column() {
    Text(label1)
      .fontSize(30)
    Text(label2)
      .fontSize(30)
  }
}

@Entry
@Component
struct CustomContainerUser {
  @State text: string = 'header';

  build() {
    Column() {
      // 创建CustomContainer，在创建CustomContainer时，通过其后紧跟一个大括号"{}"形成尾随闭包
      // 这里用尾随闭包传递closer属性（其他@BuilderParam需要通过字面量初始化）
      CustomContainer({ header: this.text }) {
        Column() {
          specificParam('testA', 'testB')
        }.backgroundColor(Color.Yellow)
        .onClick((e: ClickEvent) => {
          this.text = 'changeHeader';
        })
      }
    }
  }
}

// [End BuilderParamTrailingClosure01]

@Builder
export function builderParamTrailingClosure01(): void {
  NavDestination() {
    CustomContainerUser();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.builderparam_trailing_closure01_title'))
}
