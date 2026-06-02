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
  LaunchMode
} from '@kit.ArkUI';
import { Consume } from '@ohos.arkui.stateManagement';
import { CompletedRoutableCard } from '../../common/Card';
import { CreatSymbolGlyph } from './CreatSymbolGlyph';
import { SymbolGlyphSpanAddToText } from './SymbolAddToText';
import { SymbolGlyphSpanCustomIconAnimation } from './SymbolCustomIconAnimation';
import { SymbolGlyphSpanAddEvent } from './SymbolAddEvent';
import { SymbolGlyphSpanSceneExample } from './SymbolSceneExample';
import { Route } from '../../common/Route';
import resourceToStringManager from '../../common/resource';
import { SymbolShadowAndColor } from './SymbolShadowAndColor';

export const SYMBOL_GLYPH_SPAN: string = 'symbol';

const routes: Array<Route> = [
  new Route('symbol/CreatSymbolGlyph',
    resourceToStringManager.resourceToString($r('app.string.CreatSymbolGlyph_title')),
    $r('app.string.CreatSymbolGlyph_description')),
  new Route('symbol/SymbolGlyphSpanAddToText',
    resourceToStringManager.resourceToString($r('app.string.SymbolGlyphSpanAddToText_title')),
    $r('app.string.SymbolGlyphSpanAddToText_description')),
  new Route('symbol/SymbolGlyphSpanCustomIconAnimation',
    resourceToStringManager.resourceToString($r('app.string.SymbolGlyphSpanCustomIconAnimation_title')),
    $r('app.string.SymbolGlyphSpanCustomIconAnimation_description')),
  new Route('symbol/SymbolShadowAndColor',
    resourceToStringManager.resourceToString($r('app.string.SymbolShadowAndColor_title')),
    $r('app.string.SymbolShadowAndColor_description')),
  new Route('symbol/SymbolGlyphSpanAddEvent',
    resourceToStringManager.resourceToString($r('app.string.SymbolGlyphSpanAddEvent_title')),
    $r('app.string.SymbolGlyphSpanAddEvent_description')),
  new Route('symbol/SymbolGlyphSpanSceneExample',
    resourceToStringManager.resourceToString($r('app.string.SymbolGlyphSpanSceneExample_title')),
    $r('app.string.SymbolGlyphSpanSceneExample_description'))
];

@Builder
export function SymbolGlyphSpanDestination(name: string): void {
  if (name === SYMBOL_GLYPH_SPAN) {
    SymbolGlyphSpanExample();
  } else if (name === routes[0].name) {
    CreatSymbolGlyph();
  } else if (name === routes[1].name) {
    SymbolGlyphSpanAddToText();
  } else if (name === routes[2].name) {
    SymbolGlyphSpanCustomIconAnimation();
  } else if (name === routes[3].name) {
    SymbolShadowAndColor();
  } else if (name === routes[4].name) {
    SymbolGlyphSpanAddEvent();
  } else if (name === routes[5].name) {
    SymbolGlyphSpanSceneExample();
  }
}

@Entry
@Component
export struct SymbolGlyphSpanExample {
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
    .title('symbol', {
      backgroundBlurStyle: BlurStyle.COMPONENT_THICK,
      barStyle: BarStyle.STACK
    })
  }
}
