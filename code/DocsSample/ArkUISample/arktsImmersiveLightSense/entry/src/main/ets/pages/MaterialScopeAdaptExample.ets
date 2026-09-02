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
// [Start material_scope_adapt]
import { CircleShape, TitleBarType, uiMaterial } from '@kit.ArkUI';

@Entry
@Component
struct MaterialScopeAdaptExample {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  @Builder
  NavigationTitle() {
    Row() {
      // 请将$r('app.string.title_bar')替换为实际资源文件，在本示例中该资源文件的value值为"标题栏"
      Text($r('app.string.title_bar'))
        .fontColor('#182431')
        .fontSize(30)
        .lineHeight(41)
        .fontWeight(700)
      Blank()
      Column() {
        SymbolGlyph($r('sys.symbol.a_3d_square_fill'))
      }
      .width(50)
      .height(50)
      .clipShape(new CircleShape({
        width: 50,
        height: 50
      }))
      .justifyContent(FlexAlign.Center)
      .backgroundColor(Color.Transparent)
      // 在Navigation标题栏中开启沉浸光感，处于生效范围内，沉浸光感效果生效
      .systemMaterial(new uiMaterial.ImmersiveMaterial({
        style: uiMaterial.ImmersiveStyle.THIN,
      }))
    }
    .alignItems(VerticalAlign.Center)
    .width('100%')
    .padding(16)
  }

  build() {
    Column() {
      Navigation() {
        Column() {
          Row() {
            // 请将$r('app.string.content_area')替换为实际资源文件，在本示例中该资源文件的value值为"内容区"
            Text($r('app.string.content_area'))

            Blank()

            Column() {
              SymbolGlyph($r('sys.symbol.a_3d_square_fill'))
            }
            .width(50)
            .height(50)
            .clipShape(new CircleShape({
              width: 50,
              height: 50
            }))
            .justifyContent(FlexAlign.Center)
            .backgroundColor(Color.Transparent)
            // 在Navigation内容中开启沉浸光感，处于生效范围外，不生效沉浸光感效果
            .systemMaterial(new uiMaterial.ImmersiveMaterial({
              style: uiMaterial.ImmersiveStyle.THIN,
            }))
          }
          .width('100%')
          .padding(16)
          .borderRadius(16)
        }
        .width('100%')
        .height('100%')
        .padding(16)
        .backgroundColor('#FFFFFF')
        .linearGradient({
          angle: 0,
          colors: [
            ['#004AAF', 0.0],
            ['#2787D9', 0.5],
            ['#F0FAFF', 1.0]
          ]
        })
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
      }
      .title(this.NavigationTitle, { barStyle: BarStyle.STACK })
    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}
// [End material_scope_adapt]
