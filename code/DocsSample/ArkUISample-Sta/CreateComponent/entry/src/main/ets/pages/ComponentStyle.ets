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
// [Start ComponentStyle]
import { Button, Color, Component, Entry, Row } from '@kit.ArkUI';

@Component
struct ChildComponent {
  build() {
    Button(`Hello World`)
  }
}

@Entry
@Component
struct MyComponent {
  build() {
    Row() {
      ChildComponent()
        .width(200)
        .height(300)
        .backgroundColor(Color.Red)
    }
  }
}
// [End ComponentStyle]

@Builder
export function componentStyle(): void {
  NavDestination() {
    MyComponent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.component_style_title'))
}
