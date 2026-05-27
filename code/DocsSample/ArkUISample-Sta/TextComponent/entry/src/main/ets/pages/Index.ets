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

import {
  Entry,
  Component,
  $r,
  List,
  ListOptions,
  LengthMetrics,
  NavPathStack,
  Navigation,
  Builder,
  ForEach,
  NavPathInfo
} from '@kit.ArkUI';
import { State, Provide } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog';
import { RoutableCard } from '../common/Card';
import { Route } from '../common/Route';
import resourceToStringManager from '../common/resource'
import { RICH_EDITOR_ROUTE_PREFIX, RichEditorDestination } from './richEditor';

const TAG = '[Sample_StaticTextcomponent]';
const DOMAIN = 0xF811;
const BUNDLE = 'StaticTextcomponent_';
const routes: Array<Route> = [
  new Route(RICH_EDITOR_ROUTE_PREFIX, resourceToStringManager.resourceToString($r('app.string.pageIndex_RichEditor')))
];

@Builder
function Destination(name: string) {
  if (name.startsWith(RICH_EDITOR_ROUTE_PREFIX)) {
    RichEditorDestination(name);
  }
}

@Entry
@Component
struct Index {
  @State condition: string = '';
  @Provide pathStack: NavPathStack = new NavPathStack();

  build() {
    Navigation(this.pathStack) {
      List({ space: 12 } as ListOptions) {
        ForEach(routes, (route: Route, index: int) => {
          RoutableCard({ title: route.title })
            .width('100%')
            .onClick(() => {
              hilog.info(DOMAIN, TAG, BUNDLE + "route.name" + route.name);
              this.pathStack.pushPath(new NavPathInfo(route.name, undefined));
            })
        })
      }
      .padding({ start: LengthMetrics.vp(16), end: LengthMetrics.vp(16) })
      .contentStartOffset(56)
      .width('100%')
    }
    .backgroundColor('#f1f3f5')
    .navDestination(Destination)
  }
}