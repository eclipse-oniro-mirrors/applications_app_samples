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

// [Start DynInteropStaComponentComponent]
// entry/src/main/ets/pages/Component.ets
import { ChildComponentV1, ChildComponentV2 } from 'static_module';

@Entry
@Component
struct Index {
  build() {
    Column() {
      // 直接使用ArkTS-Sta自定义组件
      ChildComponentV1()

      // 也可以将ArkTS-Sta自定义组件封装在ArkTS-Dyn自定义组件中嵌套使用
      MainPage()

      IndexV2()
    }
    .width('100%')
    .height('100%')
  }
}

@Component
struct MainPage {
  build() {
    Column() {
      // 使用ArkTS-Sta自定义组件
      ChildComponentV1()
    }
    .width('100%')
  }
}

@ComponentV2
struct IndexV2 {
  build(): void {
    Column() {
      // 直接使用ArkTS-Sta自定义组件
      ChildComponentV2()

      // 也可以将ArkTS-Sta自定义组件封装在ArkTS-Dyn自定义组件中嵌套使用
      MainPageV2()
    }
    .width('100%')
    .height('100%')
  }
}

@ComponentV2
struct MainPageV2 {
  build(): void {
    Column() {
      // 使用ArkTS-Sta自定义组件
      ChildComponentV2()
    }
    .width('100%')
  }
}
// [End DynInteropStaComponentComponent]
