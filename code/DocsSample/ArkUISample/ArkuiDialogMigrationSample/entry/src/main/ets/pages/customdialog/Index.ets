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

import { CompletedRoutableCard } from '../../common/Card';
import resource from '../../common/resource';
import { Route } from '../../common/Route';
import { PageLevelDialogBox } from './pageleveldialogbox/PageLevelDialogBox';
import { PageLevelDialogInNavigation, PageLevelDialogInNavigationTestTwo } from './pageleveldialogbox/PageLevelDialogInNavigation';

export const Custom_ROUTE_PREFIX: string = 'Custom_ROUTE_PREFIX';

// $r('app.string.xxx')需要替换为开发者所需的资源文件
const routes: Route[] = [
  {
    name: `${Custom_ROUTE_PREFIX}/PageLevelDialog`,
    title: resource.resourceToString($r('app.string.CustomDialog_page_level')),
    description: $r('app.string.CustomDialog_controller_des'),
  },
  {
    name: `${Custom_ROUTE_PREFIX}/PageLevelDialogInNavigation`,
    title: resource.resourceToString($r('app.string.CustomDialog_page_level_navigation')),
    description: $r('app.string.CustomDialog_page_level_des'),
  },
]

@Builder
export function CustomDestination(name: string) {
  if (name === Custom_ROUTE_PREFIX) {
    CustomExample();
  } else if (name === routes[0].name) {
    PageLevelDialogBox();
  } else if (name === routes[1].name) {
    PageLevelDialogInNavigation()
  } else if (name === `${Custom_ROUTE_PREFIX}/PageLevelDialogInNavigationPageTwo`) {
    PageLevelDialogInNavigationTestTwo()
  }
}

@Entry
@Component
struct CustomExample {
  @Consume pathStack: NavPathStack;

  build() {
    NavDestination() {
      List({ space: 12 }) {
        ForEach(routes, (route: Route) => {
          ListItem() {
            CompletedRoutableCard({ title: route.title, description: route.description })
          }
          .width('100%')
          .onClick(() => {
            this.pathStack.pushPath({ name: route.name });
          })
        })
      }
      .contentStartOffset(20)
      .padding({ left: 16, right: 16 })
    }
    .backgroundColor('#f1f3f5')
    .title('', {
      backgroundBlurStyle: BlurStyle.COMPONENT_THICK,
      barStyle: BarStyle.STACK
    })
    // 请将$r('app.string.CustomDialog_dialog')替换为实际资源文件，在本示例中该资源文件的value值为"自定义弹窗"
    .title($r('app.string.CustomDialog_dialog'))
  }
}