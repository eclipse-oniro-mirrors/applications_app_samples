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
  NavPathInfo,
  Column,
  Search,
  LaunchMode
} from '@kit.ArkUI';
import { State, Provide } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog';
import { RoutableCard } from '../common/Card';
import { Route } from '../common/Route';
import resourceToStringManager from '../common/resource'
import { TEXT_ROUTE_PREFIX, TextDestination } from './text';
import { KEYBOARD_ROUTE_PREFIX, ManageKeyBoardDestination } from './manageKeyBoard';
import { INPUT_ROUTE_PREFIX, TextInputDestination } from './textInput';
import { RICH_EDITOR_ROUTE_PREFIX, RichEditorDestination } from './richEditor';
import { SYMBOL_GLYPH_SPAN, SymbolGlyphSpanDestination } from './symbol';
import { PROPERTY_STRING_ROUTE_PREFIX, PropertyStringDestination } from './propertyString';
import { TEXT_IMAGE_MIXED_LAYOUT, TextImageMixedLayoutDestination } from './textImageMixedLayout';
import { TEXT_FAQ, TextFAQDestination } from './faq';

const TAG = '[Sample_StaticTextcomponent]';
const DOMAIN = 0xF811;
const BUNDLE = 'StaticTextcomponent_';
const routes: Array<Route> = [
  new Route(TEXT_ROUTE_PREFIX, resourceToStringManager.resourceToString($r('app.string.pageIndex_Text'))),
  new Route(INPUT_ROUTE_PREFIX, resourceToStringManager.resourceToString($r('app.string.pageIndex_TextInput'))),
  new Route(RICH_EDITOR_ROUTE_PREFIX, resourceToStringManager.resourceToString($r('app.string.pageIndex_RichEditor'))),
  new Route(SYMBOL_GLYPH_SPAN, resourceToStringManager.resourceToString($r('app.string.pageIndex_symbolGlyphSpan'))),
  new Route(PROPERTY_STRING_ROUTE_PREFIX,
    resourceToStringManager.resourceToString($r('app.string.pageIndex_PropertyString'))),
  new Route(TEXT_IMAGE_MIXED_LAYOUT,
    resourceToStringManager.resourceToString($r('app.string.pageIndex_TextImageMixedLayout'))),
  new Route(KEYBOARD_ROUTE_PREFIX, resourceToStringManager.resourceToString($r('app.string.pageIndex_KeyBoard'))),
  new Route(TEXT_FAQ, resourceToStringManager.resourceToString($r('app.string.pageIndex_TextFAQ')))
];

@Builder
function Destination(name: string) {
  if (name.startsWith(TEXT_ROUTE_PREFIX)) {
    TextDestination(name);
  } else if (name.startsWith(INPUT_ROUTE_PREFIX)) {
    TextInputDestination(name);
  } else if (name.startsWith(RICH_EDITOR_ROUTE_PREFIX)) {
    RichEditorDestination(name);
  } else if (name.startsWith(SYMBOL_GLYPH_SPAN)) {
    SymbolGlyphSpanDestination(name);
  } else if (name.startsWith(PROPERTY_STRING_ROUTE_PREFIX)) {
    PropertyStringDestination(name);
  } else if (name.startsWith(TEXT_IMAGE_MIXED_LAYOUT)) {
    TextImageMixedLayoutDestination(name);
  } else if (name.startsWith(TEXT_FAQ)) {
    TextFAQDestination(name);
  } else if (name.startsWith(KEYBOARD_ROUTE_PREFIX)) {
    ManageKeyBoardDestination(name);
  }
}

@Entry
@Component
struct Index {
  @State condition: string = '';
  @Provide pathStack: NavPathStack = new NavPathStack();

  getFilteredRoutes(): Route[] {
    if (!this.condition) {
      return routes;
    }
    return routes.filter((route: Route) => {
      return route.title.toLowerCase().includes(this.condition.trim().toLowerCase());
    });
  }

  build() {
    Navigation(this.pathStack) {
      Column() {
        Search({ value: this.condition })
          .onChange(value => {
            this.condition = value;
          })
          .margin(16)

        List({ space: 12 } as ListOptions) {
          ForEach(this.getFilteredRoutes(), (route: Route, index: int) => {
            RoutableCard({ title: route.title })
              .width('100%')
              .onClick(() => {
                hilog.info(DOMAIN, TAG, BUNDLE + "route.name" + route.name);
                this.pathStack.pushPath(new NavPathInfo(route.name, undefined));
              })
          })
        }
        .padding(16)
        .width('100%')
      }
    }
    .backgroundColor('#f1f3f5')
    .navDestination(Destination)
  }
}