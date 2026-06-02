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
  Builder,
  BarStyle,
  BlurStyle,
  Component,
  Entry,
  ForEach,
  List,
  ListOptions,
  NavDestination,
  NavPathInfo,
  NavPathStack,
  NavigationTitleOptions,
  ResourceStr,
  Scroll
} from '@kit.ArkUI';
import { Consume } from '@ohos.arkui.stateManagement';
import { CompletedRoutableCard } from '../../common/Card';
import { Route } from '../../common/Route';
import resourceToStringManager from '../../common/resource';
import { TextImageComponent } from './TextImageComponent';
import { TextImageAttribute } from './TextImageAttribute';

export const TEXT_IMAGE_MIXED_LAYOUT: string = 'TextImageMixedLayout';

const routes: Array<Route> = [
  new Route('TextImageMixedLayout/TextImageComponent',
    resourceToStringManager.resourceToString($r('app.string.TextImage_MixedLayout_Text_1')),
    $r('app.string.TextImage_MixedLayout_Component_desc')),
  new Route('TextImageMixedLayout/TextImageAttribute',
    resourceToStringManager.resourceToString($r('app.string.TextImage_MixedLayout_Text_2')),
    $r('app.string.TextImage_MixedLayout_Attribute_desc'))
];

@Builder
export function TextImageMixedLayoutDestination(name: string): void {
  if (name === TEXT_IMAGE_MIXED_LAYOUT) {
    PropertyStringExample();
  } else if (name === routes[0].name) {
    TextImageComponent();
  } else if (name === routes[1].name) {
    TextImageAttribute();
  }
}

@Entry
@Component
struct PropertyStringExample {
  @Consume pathStack: NavPathStack;

  build(): void {
    NavDestination() {
      Scroll() {
        List({ space: 12 } as ListOptions) {
          ForEach(routes, (route: Route) => {
            CompletedRoutableCard({ title: route.title, description: route.description as ResourceStr })
              .width('100%')
              .onClick(() => {
                this.pathStack.pushPath(new NavPathInfo(route.name, undefined));
              })
          })
        }
        .contentStartOffset(56)
        .padding({ left: 16, right: 16 })
      }.id('scroll_')
    }
    .backgroundColor('#f1f3f5')
    .title('TextImageMixedLayout', {
      backgroundBlurStyle: BlurStyle.COMPONENT_THICK,
      barStyle: BarStyle.STACK
    } as NavigationTitleOptions)
  }
}