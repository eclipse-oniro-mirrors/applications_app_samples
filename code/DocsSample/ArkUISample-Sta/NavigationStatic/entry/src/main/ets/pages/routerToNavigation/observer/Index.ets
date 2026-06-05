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

// [Start observer_index]
// EntryAbility.ets
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
} from '@ohos.arkui.component';
import {
  UIContext, UIObserver
} from '@ohos.arkui.UIContext';
import { State } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';
import uiObserver from '@ohos.arkui.observer';
import window from '@ohos.window';

import { BusinessError } from '@kit.BasicServicesKit';
import { UIAbility } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN = 0xF811;
const TAG = '[Sample_ArkTSRouter]';

export default class EntryAbility extends UIAbility {
  // ...
  onWindowStageCreate(windowStage: window.WindowStage): void {
    // ...
    windowStage.getMainWindow((err: BusinessError<void> | null, data) => {
      // ...
      let windowClass = data;
      // 获取UIContext实例。
      let uiContext: UIContext | undefined = windowClass?.getUIContext();
      // 获取UIObserver实例。
      let uiObserver: UIObserver | undefined = uiContext?.getUIObserver();
      // 注册DevNavigation的状态监听.
      uiObserver?.onNavDestinationUpdate((info) => {
        // NavDestinationState.ON_SHOWN = 0, NavDestinationState.ON_HIDE = 1
        if (info.state == 0) {
          // NavDestination组件显示时操作
          hilog.info(DOMAIN, TAG, 'page ON_SHOWN:' + info.name.toString());
        }
      });
    });
  }
}

// [End observer_index]