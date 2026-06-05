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

// [Start with_theme]
import { CustomColors, CustomTheme, Theme, ThemeControl } from '@ohos.arkui.theme';
import {
  Color,
  Component,
  Column,
  Button,
  ButtonType,
  Text,
  List,
  ListItem,
  TextAlign,
  $r,
  Entry,
  Row,
  ColumnOptions,
  ItemAlign,
  Radio,
  RadioOptions,
  Slider,
  Toggle,
  ToggleType,
  ButtonRole,
  ResourceColor,
  WithTheme,
  FontWeight,
  ThemeColorMode,
  SafeAreaType,
  SafeAreaEdge
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

ThemeControl.setDefaultTheme(undefined);

@Entry
@Component
struct DisplayPage3 {
  @State message: string = 'Hello World';
  @State colorMode: ThemeColorMode = ThemeColorMode.DARK;

  build() {
    WithTheme({ colorMode: this.colorMode }) {
      Row() {
        Column() {
          Text(this.message)
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
          Button('Switch ColorMode').onClick(() => {
            if (this.colorMode === ThemeColorMode.LIGHT) {
              this.colorMode = ThemeColorMode.DARK;
            } else if (this.colorMode === ThemeColorMode.DARK) {
              this.colorMode = ThemeColorMode.LIGHT;
            }
          })
        }
        .width('100%')
      }
      .backgroundColor($r('sys.color.background_primary'))
      .height('100%')
      // 扩展安全区，实现沉浸式深浅色变更效果
      .expandSafeArea(
        [SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.END, SafeAreaEdge.BOTTOM, SafeAreaEdge.START])
    }
  }
}
// [End with_theme]