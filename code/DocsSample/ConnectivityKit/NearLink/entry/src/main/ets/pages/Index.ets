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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { MainPage } from '../nearlink/pages/MainPage';
import { ManagerPage } from '../nearlink/pages/ManagerPage';
import { AdvertisingPage } from '../nearlink/pages/AdvertisingPage';
import { ScanConfigPage } from '../nearlink/pages/ScanConfigPage';
import { SsapServerPage } from '../nearlink/pages/SsapServerPage';
import { SsapClientPage } from '../nearlink/pages/SsapClientPage';
import { DataTransferPage } from '../nearlink/pages/DataTransferPage';
import { CdsmPage } from '../nearlink/pages/CdsmPage';

@Entry
@Component
export struct Index {
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack();

  aboutToAppear() {
    hilog.info(0x0000, 'testTag', 'aboutToAppear');
  }

  @Builder
  PageMap(name: string) {
    if (name === 'ManagerPage') {
      NavDestination() {
        ManagerPage()
      }
      .hideTitleBar(true)
    } else if (name === 'AdvertisingPage') {
      NavDestination() {
        AdvertisingPage()
      }
      .hideTitleBar(true)
    } else if (name === 'ScanConfigPage') {
      NavDestination() {
        ScanConfigPage()
      }
      .hideTitleBar(true)
    } else if (name === 'SsapServerPage') {
      NavDestination() {
        SsapServerPage()
      }
      .hideTitleBar(true)
    } else if (name === 'SsapClientPage') {
      NavDestination() {
        SsapClientPage()
      }
      .hideTitleBar(true)
    } else if (name === 'DataTransferPage') {
      NavDestination() {
        DataTransferPage()
      }
      .hideTitleBar(true)
    } else if (name === 'CdsmPage') {
      NavDestination() {
        CdsmPage()
      }
      .hideTitleBar(true)
    } else {
      NavDestination() {
        MainPage()
      }
      .hideTitleBar(true)
    }
  }

  build() {
    Navigation(this.pageInfos) {
      MainPage()
    }
    .titleMode(NavigationTitleMode.Free)
    .hideTitleBar(true)
    .hideToolBar(true)
    .mode(NavigationMode.Stack)
    .navDestination(this.PageMap)
  }
}
