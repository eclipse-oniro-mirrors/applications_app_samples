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
import { Entry, Component, State, Builder, Column, Text, List, ListItemGroup, ListItem, Row, Blank, Image, TransitionEffect, $r, NavPathStack, Padding, CustomStyles, CommonMethod, Color, FontWeight, ForEach, Curve, AnimateParam, ListItemGroupOptions } from '@kit.ArkUI';
import { Route, RouteGroup } from './common/Index';
// 使用 CustomStyles 类型定义样式
const cardPressedStyle: CustomStyles = (instance: CommonMethod): void => {
  instance.backgroundColor(Color.Gray).opacity(1);
}

const cardNormalStyle: CustomStyles = (instance: CommonMethod): void => {
  instance.backgroundColor(Color.Transparent).opacity(1);
}

const cardDisabledStyle: CustomStyles = (instance: CommonMethod): void => {
  instance.backgroundColor(Color.Transparent).opacity(0.5);
}


@Entry
@Component
struct ComponentExtension {
  @State router: NavPathStack = new NavPathStack();
  // $r('app.string.xxx')需要替换为开发者所需的资源文件
  @State routes: Array<RouteGroup> = new Array<RouteGroup>(
    {
      name: 'FocusOnclickExample',
      label: $r('app.string.FocusOnclick'),
      children: [
        { name: 'FocusOnclickExample', label: $r('app.string.FocusOnclickExample') },
      ]
    } as RouteGroup,
    {
      name: 'PreventBubbling',
      label: $r('app.string.PreventBubbling'),
      children: [
        { name: 'PreventBubbling', label: $r('app.string.PreventBubblingExample') },
      ]
    } as RouteGroup,
    {
      name: 'sampling',
      label: $r('app.string.sampling'),
      children: [
        { name: 'Sampling', label: $r('app.string.samplingExample') },
      ]
    } as RouteGroup,
    {
      name: 'MultipleFingerInformation',
      label: $r('app.string.MultipleFingerInformation'),
      children: [
        { name: 'MultipleFingerInformation', label: $r('app.string.MultipleFingerInformationExample') },
      ]
    } as RouteGroup,
    {
      name: 'mouseMove',
      label: $r('app.string.mouseMove'),
      children: [
        { name: 'MouseMove', label: $r('app.string.mouseMoveExample') },
      ]
    } as RouteGroup,
    {
      name: 'stopPropagation',
      label: $r('app.string.stopPropagation'),
      children: [
        { name: 'StopPropagation', label: $r('app.string.stopPropagationExample') },
      ]
    } as RouteGroup,
    {
      name: 'onHover',
      label: $r('app.string.onHover'),
      children: [
        { name: 'OnHover', label: $r('app.string.onHoverExample') },
      ]
    } as RouteGroup,
    {
      name: 'MouseButton',
      label: $r('app.string.MouseButton'),
      children: [
        { name: 'MouseButton', label: $r('app.string.MouseButtonExample') },
      ]
    } as RouteGroup,
    {
      name: 'MouseWheel',
      label: $r('app.string.MouseWheel'),
      children: [
        { name: 'MouseWheel', label: $r('app.string.MouseWheelExample') },
      ]
    } as RouteGroup,
    {
      name: 'gamepad',
      label: $r('app.string.gamepad'),
      children: [
        { name: 'CommonKey', label: $r('app.string.CommonKey') },
        { name: 'DirectionKey', label: $r('app.string.DirectionKey') },
        { name: 'Joystick', label: $r('app.string.Joystick') },
        { name: 'NewJoystick', label: $r('app.string.NewJoystick') },
        { name: 'GamepadSample', label: $r('app.string.GamepadSample') }
      ]
    } as RouteGroup
  );
  @State selection: string | null = null;

  @Builder
  ListItemGroupHeader(route: RouteGroup) {
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
        .animation({ curve: Curve.Linear })
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
        { curve: Curve.Linear } as AnimateParam,
        () => {
          if (this.selection === route.name) {
            this.selection = null;
          } else {
            this.selection = route.name;
          }
        });
    })
  }

  build() {
    Column() {
      Text('ComponentExtension')
      List() {
        ForEach(this.routes, (routeGroup: RouteGroup) => {
          ListItemGroup({ header: () => { this.ListItemGroupHeader(routeGroup) } } as ListItemGroupOptions) {
            if (routeGroup.name === this.selection) {
              ForEach(routeGroup.children, (route: Route, idx: int) => {
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
                  // .transition(
                  //   TransitionEffect.OPACITY.animation({
                  //     curve: curves.interpolatingSpring(0, 1, 228, 30)
                  //   })
                  // )
                  .width('100%')
                  .onClick(() => {
                    let name: string = `pages/${routeGroup.name}/${route.name}`;
                    this.getUIContext().getRouter().pushUrl({ url: name });
                  })
                }
                .width('100%')
              }, (route: Route) => route.name)
            }
          }
          .padding({ top: 2, bottom: 2, left: 2, right: 2 } as Padding)
          .divider({ strokeWidth: 0.5 })
        }, (routeGroup: RouteGroup) => routeGroup.name)
      }.padding({ bottom: 10 } as Padding)
    }
  }
}