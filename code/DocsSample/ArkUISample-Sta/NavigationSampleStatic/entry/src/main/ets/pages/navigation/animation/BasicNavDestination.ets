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
 
// [Start AppStorageGetStack]

import {
  Color,
  Component,
  Column,
  NavPathStack,
  Button,
  NavPathInfo,
  NavDestinationContext,
  NavigationOperation,
  ButtonType,
  GestureEvent,
  PanGesture,
  NavDestination,
  ColumnOptions
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement';

@Builder
export function BasicNavDestinationBuilder(): void {
  BasicNavDestination();
}

@Component
struct BasicNavDestination {
  // 在NavDestination中获取导航控制器
  stack: NavPathStack = AppStorage.get<NavPathStack>('basicNavigationStack')!;

  build() {
    NavDestination() {
      // [StartExclude AppStorageGetStack]
      Column({ space: 20 } as ColumnOptions) {
        Button('pop')
          .onClick(() => {
            this.stack.pop();
          })

        Button('push DialogNavDestination')
          .onClick(() => {
            this.stack.pushPath(new NavPathInfo('animation-DialogNavDestination', undefined));
          })

        Button('push PageTwoNavDes')
          .onClick(() => {
            this.stack.pushPath(new NavPathInfo('animation-PageTwoNavDes', undefined));
          })
      }
      // [EndExclude AppStorageGetStack]
    }
    .title('BasicNavDestination')
  }
}
// [End AppStorageGetStack]