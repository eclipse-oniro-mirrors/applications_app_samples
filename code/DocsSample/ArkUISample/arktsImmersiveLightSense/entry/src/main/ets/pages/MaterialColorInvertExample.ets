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
// [Start material_color_invert]
import { uiMaterial } from '@kit.ArkUI';

@Component
struct ContentOne {
  build() {
    Scroll() {
      Column() {
        // $r('app.media.greyBackground')需要替换为开发者所需的图像资源文件
        Image($r('app.media.greyBackground'))
          .width('100%')
          .height('150%')
          .objectFit(ImageFit.Fill)
        // $r('app.media.greyBackground')需要替换为开发者所需的图像资源文件
        Image($r('app.media.greyBackground'))
          .width('100%')
          .height('150%')
          .objectFit(ImageFit.Fill)
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
  }
}

@Entry
@Component
struct PageMaterialReverse {
  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End }) {
        TabContent() {
          ContentOne()
        }.tabBar(new BottomTabBarStyle($r('sys.media.ohos_icon_mask_svg'), 'tab1')
        // BottomTabBarStyle样式支持反色，且设置支持反色的系统颜色资源
          .labelStyle({ selectedColor: $r('sys.color.brand'), unselectedColor: $r('sys.color.font_primary') })
          .iconStyle({ selectedColor: $r('sys.color.brand'), unselectedColor: $r('sys.color.font_primary') })
        )

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar(new BottomTabBarStyle($r('sys.media.ohos_icon_mask_svg'), 'tab2')
          .labelStyle({ selectedColor: $r('sys.color.brand'), unselectedColor: $r('sys.color.font_primary') })
          .iconStyle({ selectedColor: $r('sys.color.brand'), unselectedColor: $r('sys.color.font_primary') })
        )
      }
      .barFloatingStyle({
        adaptToHandedness: true,
        systemMaterial: new uiMaterial.ImmersiveMaterial(
          {
            style: uiMaterial.ImmersiveStyle.ULTRA_THIN,
            // 设置tabBar的材质为允许反色，且需配合ULTRA_THIN或THIN的style才能反色
            colorInvert: true,
          }
        )
      })
      .barOverlap(true)
      .height('100%')
    }
    .width('100%')
    .height('100%')
  }
}
// [End material_color_invert]
