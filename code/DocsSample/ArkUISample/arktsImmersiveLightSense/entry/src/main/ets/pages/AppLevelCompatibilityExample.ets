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
// [Start app_level_compatibility]
import { uiMaterial } from '@kit.ArkUI';

@Entry
@Component
struct AppLevelCompatibility {
  private info: uiMaterial.MaterialInfo = uiMaterial.getMaterialInfo();

  build() {
    Stack({ alignContent: Alignment.Top }) {
      Column() {}
        .width('100%')
        .height('100%')
        // $r('app.media.invert')需要替换为开发者所需的图像资源文件
        .backgroundImage($r('app.media.invert'))

      Column() {
        // 请将$r('app.string.select_option_1')替换为实际资源文件，在本示例中该资源文件的value值为"选项1"
        // 请将$r('app.string.select_option_2')替换为实际资源文件，在本示例中该资源文件的value值为"选项2"
        Select([{ value: $r('app.string.select_option_1') }, { value: $r('app.string.select_option_2') }])
          // 请将$r('app.string.select_placeholder')替换为实际资源文件，在本示例中该资源文件的value值为"选择"
          .value($r('app.string.select_placeholder'))
          // 应用级沉浸式系统材质开启时，将backgroundColor置为undefined，避免遮挡材质效果
          .backgroundColor(this.info.state === uiMaterial.MaterialState.ENABLE ? undefined :  Color.White)
      }
      .width(100)
      .height(100)
      .justifyContent(FlexAlign.Center)
    }
  }
}
// [End app_level_compatibility]
