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
// [Start ComponentBasicUsage]
import { ClickEvent, Column, Component, Divider, Entry, State, Text } from '@kit.ArkUI';

@Component
struct HelloComponent {
  @State message: string = 'Hello, World!';

  build() {
    // HelloComponent自定义组件组合系统组件Row和Text
    Column() {
      Text(this.message)
        .onClick((e: ClickEvent) => {
          this.message = 'Hello, ArkUI!';
        })
    }
  }
}

@Entry
@Component
struct ParentComponent {
  build() {
    Column() {
      Text('ArkUI message')
      HelloComponent({ message: 'Hello World!' });
      Divider()
      HelloComponent({ message: '你好，世界!' });
    }
  }
}
// [End ComponentBasicUsage]

@Builder
export function componentBasicUsage(): void {
  NavDestination() {
    ParentComponent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.component_basic_usage_title'))
}
