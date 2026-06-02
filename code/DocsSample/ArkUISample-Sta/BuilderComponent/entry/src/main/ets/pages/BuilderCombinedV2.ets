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
// [Start BuilderCombinedV2]
import { Entry, Column, Text, Builder, Button, ClickEvent, ComponentV2, ObservedV2, Trace, Require, Param } from '@kit.ArkUI';

@ObservedV2
class Info {
  @Trace name: string;
  @Trace age: number;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}

@Builder
function overBuilder(param: Info) {
  Column() {
    Text(`全局@Builder name: ${param.name}`)
    Text(`全局@Builder age: ${param.age}`)
  }
  .width(230)
  .height(40)
  .margin(10)
  .backgroundColor('#0d000000')
  .borderRadius(20)
}

@ComponentV2
struct ChildPage {
  @Require @Param childInfo: Info;

  build() {
    Column() {
      // 此处必须为值传递方式，如果使用引用传递的方式会被ArkTS语法拦截
      overBuilder(this.childInfo)
    }
  }
}

@Entry
@ComponentV2
struct ParentPage {
  info1: Info = new Info('Tom', 25);
  info2: Info = new Info('Tom', 25);

  @Builder
  privateBuilder() {
    Column() {
      Text(`局部@Builder name: ${this.info1.name}`)
      Text(`局部@Builder age: ${this.info1.age}`)
    }
    .width(230)
    .height(40)
    .margin(10)
    .backgroundColor('#0d000000')
    .borderRadius(20)
  }

  build() {
    Column() {
      Column() {
        Text(`info1: ${this.info1.name}  ${this.info1.age}`) // Text1
        Text(`info2: ${this.info2.name}  ${this.info2.age}`) // Text2
      }
      .width(230)
      .height(40)
      .margin(10)
      .backgroundColor('#0d000000')
      .borderRadius(20)

      // 调用局部@Builder
      this.privateBuilder()
      // 调用全局@Builder, 此处必须为值传递方式，如果使用引用传递的方式会被ArkTS语法拦截
      overBuilder(this.info2)
      ChildPage({ childInfo: this.info1 }) // 调用自定义组件
      ChildPage({ childInfo: this.info2 }) // 调用自定义组件
      Button('change info1&info2')
        .onClick((e: ClickEvent) => {
          this.info1.name = 'Cat'; // 修改Text1显示的info1的name值
          this.info1.age = 18; // 修改Text1显示的info1的age值
          this.info2.name = 'Cat'; // 修改Text2显示的info2的name值
          this.info2.age = 18; // 修改Text2显示的info2的age值
        })
    }
    .height('100%')
    .width('100%')
  }
}

// [End BuilderCombinedV2]

@Builder
export function builderCombinedV2(): void {
  NavDestination() {
    ParentPage();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.builder_combined_v2_title'))
}
