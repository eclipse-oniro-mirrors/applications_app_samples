/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { bundleManager } from '@kit.AbilityKit'
import { BusinessError } from '@kit.BasicServicesKit'
import { Logger, Style } from '@ohos/common'

const TAG: string = 'IndexEnd'

@Preview
@Component
export default struct IndexEnd {
  @State versionName: string = ''

  aboutToAppear() {
    try {
      const bundleInfo = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT)
      this.versionName = bundleInfo.versionName
    } catch (error) {
      const err = error as BusinessError
      Logger.error(TAG, `Failed to get bundle info. Cause: ${err.message}`)
    }
  }

  build() {
    Column() {
      Row() {
        Image($r('app.media.icon_china_weather'))
          .width(Style.ICON_SIZE_SMALL)
          .height(Style.ICON_SIZE_SMALL)
          .objectFit(ImageFit.Contain)
          .opacity(Style.OPACITY_SECONDARY)
        Text($r('app.string.china_weather'))
          .fontColor($r('app.color.text_white_60'))
          .fontSize(Style.FONT_SIZE_SMALL)
      }

      Text($r('app.string.weather_version', this.versionName))
        .fontColor($r('app.color.text_white_60'))
        .fontSize(Style.FONT_SIZE_SMALL)
        .margin({ top: Style.FOOTER_VERSION_MARGIN_TOP })
      Text($r('app.string.weather_statement'))
        .fontColor($r('app.color.white'))
        .fontSize(Style.FONT_SIZE_SMALL)
        .margin({ top: Style.FOOTER_TEXT_MARGIN_TOP })
      Text($r('app.string.weather_copyright'))
        .fontColor($r('app.color.text_white_60'))
        .fontSize(Style.FONT_SIZE_SMALL)
        .margin({ top: Style.FOOTER_TEXT_MARGIN_TOP })
    }
    .width('100%')
    .padding({ top: Style.FOOTER_PADDING_TOP, bottom: Style.FOOTER_PADDING_BOTTOM })
  }
}