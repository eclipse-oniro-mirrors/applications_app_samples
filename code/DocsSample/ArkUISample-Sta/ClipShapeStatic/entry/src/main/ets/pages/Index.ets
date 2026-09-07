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

// [Start ClipShapeExample_index]
import { Route } from './common/Index';
import {
  $r, Entry, Component, State, Column, Text, List, ListItem, Row, Blank, Image,
  CustomStyles, CommonMethod, FontWeight, ForEach, Padding
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
struct Index {
  @State routes: Array<Route> = new Array<Route>(
    // $r('app.string.EntryAbility_title1')需要替换为开发者所需的资源文件，在本示例中该资源文件的value值为"裁剪圆形"
    { name: 'ClipShapeExample1', label: $r('app.string.EntryAbility_title1') },
    // $r('app.string.EntryAbility_title2')需要替换为开发者所需的资源文件，在本示例中该资源文件的value值为"裁剪椭圆形"
    { name: 'ClipShapeExample2', label: $r('app.string.EntryAbility_title2') },
    // $r('app.string.EntryAbility_title3')需要替换为开发者所需的资源文件，在本示例中该资源文件的value值为"裁剪矩形"
    { name: 'ClipShapeExample3', label: $r('app.string.EntryAbility_title3') },
    // $r('app.string.EntryAbility_title4')需要替换为开发者所需的资源文件，在本示例中该资源文件的value值为"裁剪不规则形状"
    { name: 'ClipShapeExample4', label: $r('app.string.EntryAbility_title4') }
  );

  build(): void {
    Column() {
      // $r('app.string.ClipShapeIndex')需要替换为开发者所需的资源文件，在本示例中该资源文件的value值为"ClipShape"
      Text($r('app.string.ClipShapeIndex'))
      List() {
        ForEach(this.routes, (route: Route) => {
          ListItem() {
            Row() {
              Text(route.label).fontSize(16)
              Blank()
              // $r('sys.media.ohos_ic_public_arrow_right')需要替换为开发者所需的资源文件
              Image($r('sys.media.ohos_ic_public_arrow_right'))
                // $r('sys.color.ohos_id_color_fourth')需要替换为开发者所需的资源文件
                .fillColor($r('sys.color.ohos_id_color_fourth'))
                .height(24)
                .width(24)
            }
            .stateStyles({
              pressed: cardPressedStyle,
              normal: cardNormalStyle,
              disabled: cardDisabledStyle
            })
            .borderRadius(20)
            .padding(8)
            .width('100%')
            .onClick(() => {
              let name: string = `View/${route.name}`;
              this.getUIContext().getRouter().pushUrl({ url: name });
            })
          }
          .width('100%')
        })
      }.padding({ bottom: 10 } as Padding)
    }
  }
}
// [End ClipShapeExample_index]