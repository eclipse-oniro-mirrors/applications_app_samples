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

// [Start StaDynComponent]
// entry/src/main/ets/pages/StaDynComponent.ets
import { Entry, Component, Column, ComponentV2 } from '@ohos.arkui.component';

import { ChildComponent, ChildComponentV2 } from 'dynamic_module';

@Entry
@Component
struct Index {
  build() {
    Column() {
      // 直接使用ArkTS-Dyn自定义组件
      ChildComponent()

      // 也可以将ArkTS-Dyn自定义组件封装在ArkTS-Sta自定义组件中嵌套使用
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
      ChildComponent()
    }
    .width('100%')
  }
}

@ComponentV2
struct IndexV2 {
  build() {
    Column() {
      // 直接使用ArkTS-Dyn自定义组件
      ChildComponentV2()

      // 也可以将ArkTS-Dyn自定义组件封装在ArkTS-Sta自定义组件中嵌套使用
      MainPageV2()
    }
    .width('100%')
    .height('100%')
  }
}

@ComponentV2
struct MainPageV2 {
  build() {
    Column() {
      ChildComponentV2()
    }
    .width('100%')
  }
}
// [End StaDynComponent]
