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
// [Start EntryDecorator]
import { Column, Component, Entry, LocalStorage, Text } from '@kit.ArkUI';

const myStorage: () => LocalStorage = () => new LocalStorage();

@Entry({routeName: 'myPage', storage: 'myStorage', useSharedStorage: false})
@Component
struct MyComponent {
  build() {
    Column() {
      Text('@Entry with routeName, storage, useSharedStorage')
    }
  }
}
// [End EntryDecorator]

@Builder
export function entryDecorator(): void {
  NavDestination() {
    MyComponent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.entry_decorator_title'))
}
