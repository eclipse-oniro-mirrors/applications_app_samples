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

// [Start StaBuilderparamMainPage]
// dynamic_module/src/main/ets/components/MainPage.ets

@Component
export struct CustomContainer { // 导出ArkTS-Dyn自定义组件
  text: number = 0;

  @Builder
  closerBuilder() {
  }

  // 使用@BuilderParam装饰器声明成员属性closer，ArkTS-Sta的@Builder函数将传递给该成员属性
  @BuilderParam closer: () => void = this.closerBuilder;

  build() {
    Column() {
      // 使用传入的@BuilderParam成员属性closer构建UI
      this.closer()
    }
    .width('100%')
  }
}
// [End StaBuilderparamMainPage]
