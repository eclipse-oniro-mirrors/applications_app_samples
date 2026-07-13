'use static'

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// [Start navigation]
// entry\src\main\ets\pages\routerAndNavigation\navigationDep.ets
import {
  Entry,
  Button,
  ClickEvent,
  Column,
  Component,
  Text,
  FontWeight,
  ColumnOptions,
  Navigation,
  UIContext,
  State
} from '@kit.ArkUI';
import router from '@ohos.router';


@Component
struct NavigationExample {
  @State message: string = "Navigation"

  // [Start toolBar]
  @Builder
  MyToolBar() {
    // ...
  }

  build() {
    Navigation().toolbarConfiguration(this.MyToolBar).width('100%').height('25%')
  }

  // [End toolBar]
}

@Component
struct NavigatorExample {
  build() {
    Column() {
      // [Start Navigator]
      // ArkTS-Sta版本Navigator组件全面废弃，将由router进行替代
      Button("Push").onClick(() => {
        this.getUIContext().getRouter().pushUrl({ url: "url" });
      })
      Button("Back").onClick(() => {
        this.getUIContext().getRouter().back({ url: "url" });
      })
      Button("Replace").onClick(() => {
        this.getUIContext().getRouter().replaceUrl({ url: "url" });
      })
      // [End Navigator]
    }
    .width('100%')
  }
}

// [Start subTitle]
@Entry
@Component
struct NavigationTitle {
  @State message: string = "NavigationTitle"

  build() {
    Column({ space: 8 } as ColumnOptions) {
      Navigation().title({ main: "标题", sub: "子标题" }).width('100%').height('25%')
      // [StartExclude toolbarConfiguration]
      NavigatorExample()
      NavigationExample()
      // [EndExclude toolbarConfiguration]
    }
    .width('100%')
  }
}

// [End subTitle]

// [End navigation]
