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
// [Start reusable_if_scene]
// 数据模型，使用@ObservedV2和@Trace实现深度观察
@ObservedV2
class Message {
  // 使用@Trace装饰需要观察变化的属性
  @Trace public value: string | undefined;

  constructor(value: string) {
    this.value = value;
  }
}

@Entry
@ComponentV2
struct ReusableIfScene {
  // 控制子组件显示与隐藏的开关
  @Local isSwitch: boolean = true;

  build() {
    Column() {
      // 点击按钮切换子组件的显示与隐藏，触发组件的创建与复用
      Button('Hello')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          this.isSwitch = !this.isSwitch;
        })
      if (this.isSwitch) {
        // 如果只有一个复用的组件，可以不用设置reuse
        Child({ message: new Message('Child') })
          .reuse({ reuseId: () => 'Child' })
      }
    }
    .height('100%')
    .width('100%')
  }
}

// 复用组件
@ReusableV2
@ComponentV2
struct Child {
  // @Param @Once接收外部传入值，仅初始化时同步一次
  @Require @Param @Once message: Message = new Message('AboutToReuse');

  // 组件复用时回调，如无需对状态变量做额外修改可移除
  aboutToReuse() {
    console.info('Reuse====Child==');
  }

  build() {
    Column() {
      // 显示当前消息内容
      Text(this.message.value)
        .fontSize(30)
        .margin(20)
    }
    .borderWidth(1)
    .margin({ top: 10 })
    .height(100)
  }
}

// [End reusable_if_scene]
