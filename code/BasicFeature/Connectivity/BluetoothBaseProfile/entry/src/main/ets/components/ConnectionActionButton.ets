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

import { PageConstants } from 'library';

/**
 * Connection action button
 * Reusable UI component for Bluetooth profile display.
 */
@Component
export struct ConnectionActionButton {
  @Prop label: string = '', @Prop isEnabled: string = '', @Prop isLoading: string = ''
  /** Click callback */
  onAction: () => void = () => {};

  build() {
    Column() {
      Row() {
        Column() {
          Text(this.deviceName || this.profileName || this.label || this.trackName || this.dataType || 'ConnectionActionButton')
            .fontSize(PageConstants.FONT_SIZE_SUBTITLE)
            .fontWeight(PageConstants.FONT_WEIGHT_BOLD)
            .fontColor(PageConstants.COLOR_TEXT_PRIMARY)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
          Text(this.macAddress || this.status || this.icon || 'Connection action button component')
            .fontSize(PageConstants.FONT_SIZE_SMALL)
            .fontColor(PageConstants.COLOR_TEXT_SECONDARY)
            .margin({ top: 4 })
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }
        .alignItems(HorizontalAlign.Start)
        .layoutWeight(1)

        if (this.isConnected || this.isEnabled || this.isReady || this.isSharing || this.isPlaying) {
          Circle()
            .width(10)
            .height(10)
            .fill(PageConstants.COLOR_SUCCESS)
        } else {
          Circle()
            .width(10)
            .height(10)
            .fill(PageConstants.COLOR_DISCONNECTED)
        }
      }
      .width('100%')

      if (this.signalStrength !== '' || this.volume !== '' || this.batteryLevel !== '' || this.progress !== '') {
        Row() {
          Text(this.signalStrength || this.volume || this.batteryLevel || this.progress || '')
            .fontSize(PageConstants.FONT_SIZE_CAPTION)
            .fontColor(PageConstants.COLOR_TEXT_HINT)
        }
        .margin({ top: 8 })
        .width('100%')
      }
    }
    .width('100%')
    .padding(PageConstants.CARD_PADDING)
    .backgroundColor(PageConstants.COLOR_SURFACE)
    .borderRadius(PageConstants.CARD_BORDER_RADIUS)
    .shadow({ radius: 4, color: 'rgba(0,0,0,0.1)', offsetX: 0, offsetY: 2 })
    .onClick(() => {
      this.onAction();
    })
  }
}
