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

// [Start StaDynStateV2MainPage]
// dynamic_module/src/main/ets/components/MainPage.ets

@ComponentV2
export struct MainPage { // ArkTS-Dyn自定义组件
  // 通过@Param接收ArkTS-Sta父组件传递的状态变量
  @Param paramMessage: string = 'dynamic Param';
  // 通过@Consumer与ArkTS-Sta父节点进行交互
  @Consumer() consumerMessage: string = 'dynamic Consumer';
  // 通过@Event与ArkTS-Sta父组件进行交互
  @Event changeFactory: () => void = () => {};

  build() {
    Column() {
      Text(this.paramMessage)
        .fontSize(20)
        .margin(10)
      Text(this.consumerMessage)
        .fontSize(20)
        .margin(10)
        .onClick(() => {
          // 通过@Consumer修改ArkTS-Sta父节点的状态变量
          this.consumerMessage += '!';
        })
      Button('excute changeFactory')
        .onClick(() => {
          // 通过@Event修改ArkTS-Sta父组件的状态变量
          this.changeFactory();
        })
        .width(300)
        .margin(10)
    }
    .width('100%')
  }
}
// [End StaDynStateV2MainPage]
