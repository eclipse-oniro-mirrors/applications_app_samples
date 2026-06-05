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

// [Start router_3]
import {
  Entry,
  Component,
  Flex,
  FlexOptions,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Text,
  FontWeight,
  Row,
  Button,
  Column,
  ButtonType,
  NavPathStack,
  Navigation,
  NavigationMode,
  NavDestination
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';

@Entry
@Component
struct Index {
  pathStack: NavPathStack = new NavPathStack();

  // 全局设置一个NavPathStack
  aboutToAppear(): void {
    AppStorage.setOrCreate('PathStack', this.pathStack);
  }

  build(): void {
    Navigation(this.pathStack) {
      // ...
    }.title('Method 3: AppStorage')
    .mode(NavigationMode.Stack)
  }
}

// Navigation子页面
@Component
export struct PageOne {
  // 子页面中获取全局的NavPathStack
  pathStack: NavPathStack = AppStorage.get<NavPathStack>('PathStack') as NavPathStack;

  build(): void {
    NavDestination() {
      // ...
    }
    .title('PageOne')
  }
}
// [End router_3]