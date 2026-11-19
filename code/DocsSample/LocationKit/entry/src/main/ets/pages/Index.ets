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
import { MainPage } from '../location/pages/MainPage';
import { LocationPage } from '../location/pages/LocationPage';
import { GeocodePage } from '../location/pages/GeocodePage';
import { GeofencePage } from '../location/pages/GeofencePage';
import { LocationCapiPage } from '../location/pages/LocationCapiPage';

@Entry
@Component
export struct Index {
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack();

  aboutToAppear() {
    hilog.info(0x0000, '[Sample_LocationKit]', 'aboutToAppear');
  }

  @Builder
  PageMap(name: string) {
    if (name === 'LocationPage') {
      NavDestination() {
        LocationPage()
      }
      .hideTitleBar(true)
    } else if (name === 'GeocodePage') {
      NavDestination() {
        GeocodePage()
      }
      .hideTitleBar(true)
    } else if (name === 'GeofencePage') {
      NavDestination() {
        GeofencePage()
      }
      .hideTitleBar(true)
    } else if (name === 'LocationCapiPage') {
      NavDestination() {
        LocationCapiPage()
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
