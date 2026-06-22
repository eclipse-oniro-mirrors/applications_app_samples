'use static'

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import curves from '@ohos.curves';
import { Route, RouteGroup } from './common/Index';
import { ThemeControl } from '@ohos.arkui.theme';
import {
  CommonMethod,
  Component,
  Column,
  Text,
  List,
  ListItem,
  $r,
  Entry,
  Row,
  NavPathStack,
  FontWeight,
  Blank,
  Image,
  ForEach,
  ListItemGroup,
  TransitionEffect,
  ListItemGroupStyle,
  Provide,
  State
} from '@kit.ArkUI';
import { KeyboardAvoidMode } from '@ohos.arkui.UIContext';

ThemeControl.setDefaultTheme(undefined);

function cardPressedStyle(instance: CommonMethod) {
  instance.backgroundColor('rgba(0,0,0,0.1)')
  instance.opacity(1)
  instance.animation({ curve: curves.cubicBezierCurve(0.33, 0, 0.67, 1), duration: 100 })
}

function cardNormalStyle(instance: CommonMethod) {
  instance.backgroundColor('rgba(0,0,0,0)')
  instance.opacity(1)
  instance.animation({ curve: curves.cubicBezierCurve(0.33, 0, 0.67, 1), duration: 100 })
}

function cardDisabledStyle(instance: CommonMethod) {
  instance.backgroundColor('rgba(0,0,0,0)')
  instance.opacity(0.5)
  instance.animation({ curve: curves.cubicBezierCurve(0.33, 0, 0.67, 1), duration: 100 })
}


@Entry
@Component
struct themeskinning {
  @Provide router: NavPathStack = new NavPathStack();
  // 请将$r('app.string.xxx')替换为实际资源文件
  @State routes: Array<RouteGroup> = [
    {
      name: 'Theme1',
      label: $r('app.string.Theme1'),
      children: [
        { name: 'Theme1', label: $r('app.string.Theme1_label1') },
      ]
    } as RouteGroup,
    {
      name: 'Theme2',
      label: $r('app.string.Theme2'),
      children: [
        { name: 'Theme2', label: $r('app.string.Theme2_label1') },
      ]
    } as RouteGroup,
    {
      name: 'Theme3',
      label: $r('app.string.Theme3'),
      children: [
        { name: 'Theme3', label: $r('app.string.Theme3_label1') },
      ]
    } as RouteGroup,
  ];
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
        .animation({ curve: curves.interpolatingSpring(0, 1, 228, 30) })
    }
    .borderRadius(20)
    .width('100%')
    .padding(8)
    .enabled(!!route.children.length)
    .stateStyles({
      pressed: cardPressedStyle,
      normal: cardNormalStyle,
      disabled: cardDisabledStyle,
    })
    .onClick(() => {
      this.getUIContext().animateTo(
        { curve: curves.interpolatingSpring(0, 1, 228, 25) },
        () => {
          if (this.selection === route.name) {
            this.selection = null;
          } else {
            this.selection = route.name;
          }
        });
    })
  }

  aboutToAppear(): void {
    this.getUIContext().setKeyboardAvoidMode(KeyboardAvoidMode.RESIZE);
  }

  build() {
    Column() {
      Text('ComponentExtension')
      List() {
        ForEach(this.routes, (routeGroup: RouteGroup) => {
          ListItemGroup({
            header: () => this.ListItemGroupHeader(routeGroup),
            style: ListItemGroupStyle.CARD,
          }) {
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
                    const name = `pages/${routeGroup.name}/${route.name}`;
                    this.getUIContext().getRouter().pushUrl({ url: name });
                  })
                }
                .width('100%')
              })
            }
          }
          .padding(2)
          .divider({ strokeWidth: 0.5 })
        })
      }.padding({ bottom: 10 })
    }
  }
}