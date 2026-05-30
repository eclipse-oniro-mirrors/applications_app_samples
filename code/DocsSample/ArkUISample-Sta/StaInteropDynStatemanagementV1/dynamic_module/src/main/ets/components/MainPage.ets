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

// [Start StaDynStateV1StateMainPage]
// dynamic_module/src/main/ets/components/MainPage.ets

@Component
export struct StateChild { // 定义包含@State成员属性的子组件
  @State count: number = 0;

  build() {
    Column() {
      // 显示子组件count状态
      Text(`child count: ${this.count}`)
        .fontSize(20)
        .margin(10)
      Button('child change value')
        .onClick(() => {
          // 子组件@State状态的变化不会同步给ArkTS-Sta父组件，不会刷新父组件的UI，但子组件UI会刷新
          this.count += 1;
        })
        .width(300)
        .margin(10)
    }
    .width('100%')
  }
}
// [End StaDynStateV1StateMainPage]

// [Start StaDynStateV1PropMainPage]
// dynamic_module/src/main/ets/components/MainPage.ets

@Component
export struct PropChild { // 定义包含@Prop成员属性的子组件
  @Prop count: number = 0;

  build() {
    Column() {
      // 显示子组件count状态
      Text(`child count: ${this.count}`)
        .fontSize(20)
        .margin(10)
      Button('child change value')
        .onClick(() => {
          // 子组件@Prop状态的变化不会同步给ArkTS-Sta父组件，不会刷新父组件的UI，但子组件UI会刷新
          this.count += 1;
        })
        .width(300)
        .margin(10)
    }
    .width('100%')
  }
}
// [End StaDynStateV1PropMainPage]

// [Start StaDynStateV1LinkMainPage]
// dynamic_module/src/main/ets/components/MainPage.ets

@Component
export struct LinkChild { // 包含@Link成员属性的子组件
  @Link count: number;

  build() {
    Column() {
      // 显示子组件count状态
      Text(`child count: ${this.count}`)
        .fontSize(20)
        .margin(10)
      Button('child change value')
        .onClick(() => {
          // 子组件@Link状态的变化会同步给ArkTS-Sta父组件，父组件和子组件的UI都会刷新
          this.count += 1;
        })
        .width(300)
        .margin(10)
    }
    .width('100%')
  }
}
// [End StaDynStateV1LinkMainPage]

// [Start StaDynStateV1ProvideMainPage]
// dynamic_module/src/main/ets/components/MainPage.ets

@Component
export struct ProvideChild { // 包含@Provide成员属性的子组件
  @Provide message: string = '';

  build() {
    Column() {
      // 显示子组件@Provide状态变量message
      Text(`provide message: ${this.message}`)
        .fontSize(20)
        .margin(10)
      // ArkTS-Dyn自定义组件
      GrandSon()
    }
    .width('100%')
  }
}

@Component
export struct GrandSon { // 包含@Consume成员属性的子孙组件
  // 通过名称count与ArkTS-Sta祖先组件的@Provide状态变量建立联系
  @Consume count: number;

  build() {
    Column() {
      // 显示子孙组件count状态
      Text(`child count: ${this.count}`)
        .fontSize(20)
        .margin(10)
      Button('child change value')
        .onClick(() => {
          // 子孙组件的状态变化会同步给ArkTS-Sta祖先组件，祖先组件和子孙组件的UI都会刷新
          this.count += 1;
        })
        .width(300)
        .margin(10)
    }
    .width('100%')
  }
}
// [End StaDynStateV1ProvideMainPage]
