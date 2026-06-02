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
  $r,
  BarStyle,
  BlurStyle,
  Builder,
  Component,
  Entry,
  ForEach,
  List,
  ListOptions,
  NavDestination,
  NavPathInfo,
  NavPathStack,
  Scroll
} from '@kit.ArkUI';
import { Consume } from '@ohos.arkui.stateManagement';
import { CompletedRoutableCard } from '../../common/Card';
import resourceToStringManager from '../../common/resource';
import { Route } from '../../common/Route';
import { CursorPersistsWhenTextInputIsCoveredExample } from './CursorPersistsWhenTextInputIsCovered';

export const TEXT_FAQ: string = 'faq';

const routes: Route[] = [
  new Route('faq/CursorPersistsWhenTextInputIsCovered',
    resourceToStringManager.resourceToString($r('app.string.How_To_Draw_Multiple_Decoration_Lines')),
    $r('app.string.Special_Characters_Display_Incorrectly_description'))
];

@Builder
export function TextFAQDestination(name: string): void {
  if (name === TEXT_FAQ) {
    TextFAQExample();
  } else if (name === routes[0].name) {
    CursorPersistsWhenTextInputIsCoveredExample();
  }
}

@Entry
@Component
struct TextFAQExample {
  @Consume pathStack: NavPathStack;

  build(): void {
    NavDestination() {
      List({ space: 12 } as ListOptions) {
        ForEach(routes, (route: Route) => {
          CompletedRoutableCard({ title: route.title, description: route.description })
            .width('100%')
            .onClick(() => {
              this.pathStack.pushPath(new NavPathInfo(route.name, undefined));
            })

        })
      }
      .contentStartOffset(56)
      .padding({ left: 16, right: 16 })
    }
    .backgroundColor('#f1f3f5')
    .title('TextFAQ', {
      backgroundBlurStyle: BlurStyle.COMPONENT_THICK,
      barStyle: BarStyle.STACK
    })
  }
}