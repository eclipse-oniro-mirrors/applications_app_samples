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
  NavPathStack
} from '@kit.ArkUI';
import { Consume } from '@ohos.arkui.stateManagement';
import { CompletedRoutableCard } from '../../common/Card';
import { Route } from '../../common/Route';
import resourceToStringManager from '../../common/resource';

export const PROPERTY_STRING_ROUTE_PREFIX: string = 'propertyString';

const routes: Array<Route> = [
  new Route('propertyString/CreateApply',
    resourceToStringManager.resourceToString($r('app.string.Create_Apply_StyledString_MutableStyledString_title')),
    $r('app.string.Create_Apply_StyledString_MutableStyledString_desc')),
  new Route('propertyString/StyledStringTextStyle',
    resourceToStringManager.resourceToString($r('app.string.StyledStringStyle_title_1'))),
  new Route('propertyString/StyledStringTextShadowStyle',
    resourceToStringManager.resourceToString($r('app.string.StyledStringStyle_title_2'))),
  new Route('propertyString/StyledStringDecorationStyle',
    resourceToStringManager.resourceToString($r('app.string.StyledStringStyle_title_3'))),
  new Route('propertyString/StyledStringBaselineOffsetStyle',
    resourceToStringManager.resourceToString($r('app.string.StyledStringStyle_title_4'))),
  new Route('propertyString/StyledStringLineHeightStyle',
    resourceToStringManager.resourceToString($r('app.string.StyledStringStyle_title_5'))),
  new Route('propertyString/StyledStringLetterSpacingStyle',
    resourceToStringManager.resourceToString($r('app.string.StyledStringStyle_title_6'))),
  new Route('propertyString/StyledStringParagraphStyleOne',
    resourceToStringManager.resourceToString($r('app.string.StyledStringParagraphStyleOne_title'))),
  new Route('propertyString/StyledStringReplaceParagraphStyle',
    resourceToStringManager.resourceToString($r('app.string.StyledStringReplaceParagraphStyle_title'))),
  new Route('propertyString/StyledStringConvertedToParagraph',
    resourceToStringManager.resourceToString($r('app.string.StyledStringConvertedToParagraph_title'))),
  new Route('propertyString/StyledStringImageAttachment',
    resourceToStringManager.resourceToString($r('app.string.StyledStringImageAttachment_title')),
    $r('app.string.StyledStringImageAttachment_description')),
  new Route('propertyString/StyledStringGestureStyle',
    resourceToStringManager.resourceToString($r('app.string.TStyledStringGestureStyle_title')),
    $r('app.string.StyledStringGestureStyle_description')),
  new Route('propertyString/StyledStringHtml',
    resourceToStringManager.resourceToString($r('app.string.StyledStringHtml_title')),
    $r('app.string.StyledStringHtml_description')),
  new Route('propertyString/StyledStringHtmlOne',
    resourceToStringManager.resourceToString($r('app.string.StyledStringHtmlOne_title')),
    $r('app.string.StyledStringHtmlOne_description')),
  new Route('propertyString/StyledStringSceneExample',
    resourceToStringManager.resourceToString($r('app.string.StyledStringSceneExample_title')),
    $r('app.string.StyledStringSceneExample_description'))
];

@Builder
export function PropertyStringDestination(name: string): void {
  if (name === PROPERTY_STRING_ROUTE_PREFIX) {
    PropertyStringExample();
  }
}

@Entry
@Component
export struct PropertyStringExample {
  goToSample(url: string): void {
    this.getUIContext().getRouter().pushUrl({
      url: url,
    }, (err) => {
      if (err) {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        return;
      }
      console.info('pushUrl success');
    })
  }

  build(): void {
    NavDestination() {
      List({ space: 12 } as ListOptions) {
        ForEach(routes, (route: Route) => {
          CompletedRoutableCard({ title: route.title, description: route.description })
            .width('100%')
            .onClick(() => {
              this.goToSample('pages/' + route.name);
            })
        })
      }
      .contentStartOffset(56)
      .padding({ left: 16, right: 16 })
    }
    .backgroundColor('#f1f3f5')
    .title('propertyString', {
      backgroundBlurStyle: BlurStyle.COMPONENT_THICK,
      barStyle: BarStyle.STACK
    })
  }
}
