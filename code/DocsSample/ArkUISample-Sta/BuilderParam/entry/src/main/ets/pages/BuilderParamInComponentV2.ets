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
// [Start BuilderParamInComponentV2]
import { Entry, Text, Row, Column, ComponentV2, Builder, Line, BuilderParam, Local, Param, FontWeight } from '@kit.ArkUI';

@ComponentV2
struct ChildPage {
  @Param label: string = 'Child Page';

  @Builder
  customBuilder() {
  }

  @BuilderParam customBuilderParam: () => void = this.customBuilder;

  build() {
    Column() {
      this.customBuilderParam()
    }
  }
}

const builder_value: string = 'Hello World';

@Builder
function overBuilder() {
  Row() {
    Text(`Global Builder: ${builder_value}`)
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
      .fontColor('#992787d9')
  }
}

@Entry
@ComponentV2
struct ParentPage {
  @Local label: string = 'Parent Page';

  @Builder
  componentBuilder() {
    Row() {
      Text(`Local Builder: ${this.label}`)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .fontColor('#cc2787d9')
    }
  }

  build() {
    Column() {
      // 调用this.componentBuilder()时，this指向当前@Entry所装饰的ParentPage组件，所以label变量的值为'Parent Page'。
      this.componentBuilder()
      ChildPage({
        // this指向的是父组件ParentPage，所以label变量的值为'Parent Page'。
        customBuilderParam: this.componentBuilder,
      })
      Line()
        .width('100%')
        .height(5)
        .backgroundColor('#66d5d5d5')
        .margin(10)
      // 调用全局overBuilder()时，this指向当前整个活动页，所以展示的内容为'Hello World'。
      overBuilder()
      ChildPage({
        customBuilderParam: overBuilder,
      })
    }
  }
}

// [End BuilderParamInComponentV2]

@Builder
export function builderParamInComponentV2(): void {
  NavDestination() {
    ParentPage();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.builderparam_in_componentv2_title'))
}
