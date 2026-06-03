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
import { Entry, Component, State, Builder, CommonMethod, CustomStyles, Column, Text, Scroll, Row, Blank, Image, ForEach, FontWeight, Padding, $r } from '@kit.ArkUI';
import router from '@ohos.router';

const cardPressedStyle: CustomStyles = (instance: CommonMethod): void => {
  instance.backgroundColor('rgba(0,0,0,0.1)');
  instance.opacity(1);
  // instance.animation({ curve: curves.cubicBezierCurve(0.33, 0, 0.67, 1), duration: 100 });
}

const cardNormalStyle: CustomStyles = (instance: CommonMethod): void => {
  instance.backgroundColor('rgba(0,0,0,0)');
  instance.opacity(1);
  // instance.animation({ curve: curves.cubicBezierCurve(0.33, 0, 0.67, 1), duration: 100 });
}

const cardDisabledStyle: CustomStyles = (instance: CommonMethod): void => {
  instance.backgroundColor('rgba(0,0,0,0)');
  instance.opacity(0.5);
  // instance.animation({ curve: curves.cubicBezierCurve(0.33, 0, 0.67, 1), duration: 100 });
}

@Entry
@Component
struct ComponentExtension {
  @State routes: RouteGroup[] = [
    {
      name: 'StateStyle',
      label: $r('app.string.StateStyles'),
      children: [
        { name: 'StateStylesSample', label: $r('app.string.StateStylesExample') } as Route
      ]
    } as RouteGroup,
    {
      name: 'FocusStyle',
      label: $r('app.string.CompWithInlineStateStyles'),
      children: [
        { name: 'CompWithInlineStateStyles', label: $r('app.string.CompWithInlineStateStylesExample') } as Route
      ]
    } as RouteGroup
  ];
  @State selection: string = '';

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
    .padding(8)
    .enabled(route.children.length > 0)
    .stateStyles({
      pressed: cardPressedStyle,
      normal: cardNormalStyle,
      disabled: cardDisabledStyle,
    })
    .onClick(() => {
      if (this.selection === route.name) {
        this.selection = '';
      } else {
        this.selection = route.name;
      }
    })
  }

  @Builder
  RouteListItem(route: Route, routeGroupName: string): void {
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
    .width('100%')
    .onClick(() => {
      const name: string = `pages/${routeGroupName}/${route.name}`;
      this.getUIContext().getRouter().pushUrl({ url: name });
    })
  }

  build() {
    Column() {
      Text('ComponentExtension')
      Scroll() {
        Column() {
          ForEach(this.routes, (routeGroup: RouteGroup) => {
            Column() {
              this.ListItemGroupHeader(routeGroup)
              if (routeGroup.name === this.selection) {
                ForEach(routeGroup.children, (route: Route) => {
                  // Column()
                  this.RouteListItem(route, routeGroup.name)
                    // .width('100%')
                })
              }
            }
            .width('100%')
            .padding(2)
          })
        }
        .padding({ bottom: 10 } as Padding)
      }
    }
  }
}
