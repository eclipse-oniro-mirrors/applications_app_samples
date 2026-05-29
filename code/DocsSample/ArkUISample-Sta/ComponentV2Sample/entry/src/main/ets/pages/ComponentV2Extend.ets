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
// [Start ComponentV2Extend]
import { Color, ColorMetrics, Column, ComponentV2, Consumer, Entry, Local, Provider, ResourceColor, Text } from '@kit.ArkUI';
import hilog from '@ohos.hilog';

@ComponentV2
struct ChildComponent {
  @Consumer() message: string = 'default';
  @Local info: string = 'default';

  // override关键字可缺省
  override backgroundColor(value: ResourceColor | ColorMetrics | undefined): this {
    hilog.info(0X0000, 'testTag', `override backgroundColor`);
    // this.message = 'Change'; // 运行时报错，禁止在构建组件树的过程中修改有依赖的状态变量
    this.info = 'Change'; // 正常运行，可以在构建组件树的过程中修改没有依赖的状态变量
    super.backgroundColor(Color.Pink); // 背景颜色显示为粉色，开发者可以选择不调用基类的backgroundColor方法，即不设置背景颜色
    return this;
  }

  // overload
  backgroundColor(value: Array<number>): this {
    hilog.info(0X0000, 'testTag', `overload backgroundColor`);
    return this;
  }

  // myStyle没有返回this，仅可以在链式调用的最后一项被调用
  myStyle(): void {
    hilog.info(0X0000, 'testTag', `myStyle`);
  }

  build() {
    Column() {
      Text(`ChildComponent info ${this.info}`)
      Text(`ChildComponent message ${this.message}`)
    }
  }
}

@Entry
@ComponentV2
struct MyComponent {
  @Provider() message: string = 'Hello World';

  build() {
    Column() {
      Text(`MyComponent message ${this.message}`)

      ChildComponent()
        .width(300)
        .height(300)
        .backgroundColor(Color.Red)
        .backgroundColor([0])
        .myStyle()
    }
    .height(500)
    .width(300)
  }
}
// [End ComponentV2Extend]

@Builder
export function componentV2Extend(): void {
  NavDestination() {
    MyComponent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.componentv2_extend_title'))
}
