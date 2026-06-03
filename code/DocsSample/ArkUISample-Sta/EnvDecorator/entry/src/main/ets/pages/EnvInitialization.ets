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
// [Start env_initialization]
import {
  Env,
  Entry,
  Component,
  ComponentV2,
  Column,
  Require,
  Param,
  ObjectLink,
  SystemProperties,
  Text
} from '@kit.ArkUI';
import uiObserver from '@ohos.arkui.observer';

@Entry
@Component
struct Index {
  build() {
    Column() {
      Text(`Index`)
      Child1()
      Child2()
    }
    .height('100%')
    .width('100%')
  }
}

@Component
struct Child1 {
  // 父组件Index不存在对应的@Env实例，在此处创建。
  @Env(SystemProperties.BREAK_POINT) breakpoint: uiObserver.WindowSizeLayoutBreakpointInfo;

  build() {
    Column() {
      // 打印当前窗口宽度所在的布局断点枚举值
      Text(`Child1 breakpoint width: ${this.breakpoint.widthBreakpoint}`)
        .fontSize(20)
      // 打印当前窗口高度所在的布局断点枚举值
      Text(`Child1 breakpoint height: ${this.breakpoint.heightBreakpoint}`)
        .fontSize(20)
      GrandChild1()
    }
  }
}

@Component
struct Child2 {
  build() {
    Column() {
      GrandChild2()
    }
  }
}

@Component
struct GrandChild1 {
  // 复用Child1组件中对应的@Env实例。
  @Env(SystemProperties.BREAK_POINT) breakpoint: uiObserver.WindowSizeLayoutBreakpointInfo;

  build() {
    Column() {
      // 打印当前窗口宽度所在的布局断点枚举值
      Text(`GrandChild1 breakpoint width: ${this.breakpoint.widthBreakpoint}`)
        .fontSize(20)
      // 打印当前窗口高度所在的布局断点枚举值
      Text(`GrandChild1 breakpoint height: ${this.breakpoint.heightBreakpoint}`)
        .fontSize(20)
    }
  }
}

@Component
struct GrandChild2 {
  // Index与Child2组件均不存在对应的@Env实例，故在此处创建。
  @Env(SystemProperties.BREAK_POINT) breakpoint: uiObserver.WindowSizeLayoutBreakpointInfo;

  build() {
    Column() {
      // 打印当前窗口宽度所在的布局断点枚举值
      Text(`GrandChild2 breakpoint width: ${this.breakpoint.widthBreakpoint}`)
        .fontSize(20)
      // 打印当前窗口高度所在的布局断点枚举值
      Text(`GrandChild2 breakpoint height: ${this.breakpoint.heightBreakpoint}`)
        .fontSize(20)
    }
  }
}
// [End env_initialization]

@Builder
export function envInitialization(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.env_initialization_title'))
}