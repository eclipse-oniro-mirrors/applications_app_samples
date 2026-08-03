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
import curves from '@ohos.curves';
import { Route, RouteGroup } from './common/Index';
import { KeyboardAvoidMode } from '@kit.ArkUI';
import { common } from '@kit.AbilityKit';
import {
  $r, Entry, Component, State, Builder, Column, Text, List, ListItemGroup,
  ListItem, Row, Blank, Image, TransitionEffect, NavPathStack, Padding,
  CustomStyles, CommonMethod, Color, FontWeight, ForEach, Curve, AnimateParam,
  ListItemGroupOptions, VerticalAlign
} from '@kit.ArkUI';

const cardPressedStyle: CustomStyles = (instance: CommonMethod): void => {
  instance.backgroundColor('rgba(0,0,0,0.1)').opacity(1);
}

const cardNormalStyle: CustomStyles = (instance: CommonMethod): void => {
  instance.backgroundColor('rgba(0,0,0,0)').opacity(1);
}

const cardDisabledStyle: CustomStyles = (instance: CommonMethod): void => {
  instance.backgroundColor('rgba(0,0,0,0)').opacity(0.5);
}

@Entry
@Component
struct AnimateIndex {
  private context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;
  @State router: NavPathStack = new NavPathStack();
  @State routes: Array<RouteGroup> = new Array<RouteGroup>(
    {
      name: "bindContentCover",
      label: $r('app.string.bindContentCover_label'),
      children: [
        { name:"template6/BindContentCoverDemo", label: $r('app.string.bindContentCover_label6') }
      ]
    },
    {
      name: "bindSheet",
      label: $r('app.string.bindSheet_label'),
      children: [
        { name:"template10/SheetDemo", label: $r('app.string.bindSheet_label10') },
        { name:"template11/OnWillDismiss_Dismiss", label: $r('app.string.bindSheet_label11') },
        { name:"template12/SheetTransitionExample", label: $r('app.string.bindSheet_label12') }
      ]
    } as RouteGroup
  );
  @State selection: string | null = null;

  @Builder
  ListItemGroupHeader(route: RouteGroup): void {
    Row() {
      Text(route.label)
        .fontColor($r('sys.color.ohos_id_color_text_primary'))
        .fontWeight(FontWeight.Medium)

      Blank()

      Text(`${route.children.length}`)
        .fontColor($r('sys.color.ohos_id_color_text_secondary'))
        .opacity(this.selection === route.name ? 0 : 1)

      Image($r('sys.media.ohos_ic_public_arrow_right'))
        .fillColor($r('sys.color.ohos_id_color_fourth'))
        .height(24)
        .width(24)
        .rotate({ angle: this.selection === route.name ? 90 : 0 })
        .animation({ curve: curves.interpolatingSpring(0, 1, 228, 30) })
    }
    .borderRadius(20)
    .width('100%')
    .padding({ top: 8, bottom: 8, left: 8, right: 8 } as Padding)
    .enabled(!!route.children.length)
    .stateStyles({
      pressed: cardPressedStyle,
      normal: cardNormalStyle,
      disabled: cardDisabledStyle,
    })
    .onClick(() => {
      this.getUIContext().animateTo(
        { curve: curves.interpolatingSpring(0, 1, 228, 25) } as AnimateParam,
        () => {
          if (this.selection === route.name) {
            this.selection = null;
          } else {
            this.selection = route.name;
          }
        }
      );
    })
  }

  build(): void {
    Column() {
      Text('Index')
      List() {
        ForEach(this.routes, (routeGroup: RouteGroup) => {
          ListItemGroup({ header: () => { this.ListItemGroupHeader(routeGroup) } } as ListItemGroupOptions) {
            if (routeGroup.name === this.selection) {
              ForEach(routeGroup.children, (route: Route) => {
                ListItem() {
                  Row() {
                    Text(route.label).fontSize(16)
                    Blank()
                    Image($r('sys.media.ohos_ic_public_arrow_right'))
                      .fillColor($r('sys.color.ohos_id_color_fourth'))
                      .height(24)
                      .width(24)
                  }
                  .stateStyles({
                    pressed: cardPressedStyle,
                    normal: cardNormalStyle,
                    disabled: cardDisabledStyle,
                  })
                  .borderRadius(20)
                  .padding(8)
                  .transition(
                    TransitionEffect.OPACITY.animation({
                      curve: curves.interpolatingSpring(0, 1, 228, 30)
                    })
                  )
                  .width('100%')
                  .onClick(() => {
                    let name: string = `pages/${routeGroup.name}/${route.name}`;
                    this.getUIContext().getRouter().pushUrl({ url: name });
                  })
                }
                .width('100%')
              })
            }
          }
          .padding({ top: 2, bottom: 2, left: 2, right: 2 } as Padding)
          .divider({ strokeWidth: 0.5 })
        })
      }.padding({ bottom: 10 } as Padding)
    }
  }
}