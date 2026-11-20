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

import { getDeviceTypeLabel, PowerState } from 'room';
import { DeviceView } from '../viewmodel/ConsoleViewModel';

/**
 * Card view that renders one device with its expected power state,
 * plus resend and correct actions driven by the parent page.
 */
@ComponentV2
export struct DeviceCard {
  /** Device view model rendered by this card. */
  @Param device: DeviceView = new DeviceView();
  /** When true, mutating actions are hidden or disabled. */
  @Param readOnly: boolean = false;
  /** Fired when the user taps resend for this device. */
  @Event onResend: (deviceId: string) => void = (deviceId: string): void => {};
  /** Fired when the user taps correct for this device. */
  @Event onCorrect: (deviceId: string) => void = (deviceId: string): void => {};

  /** Maps the expected power state to a localized label. */
  private expectedText(): Resource {
    switch (this.device.expected.power) {
      case PowerState.ON:
        return $r('app.string.expected_on');
      case PowerState.OFF:
        return $r('app.string.expected_off');
      default:
        return $r('app.string.expected_unknown');
    }
  }

  /** Renders the device name row and the type / expected state meta row. */
  build() {
    Column({ space: '6vp' }) {
      Row({ space: '8vp' }) {
        Text(this.device.device.name)
          .id('id_device_name_' + this.device.device.id)
          .fontSize($r('app.float.body_font'))
          .fontColor($r('app.color.text_primary'))
          .fontWeight(FontWeight.Medium)
          .layoutWeight(1)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })

        // The resend action mutates hardware state, so it is hidden in read-only mode.
        if (!this.readOnly) {
          Button($r('app.string.resend'))
            .id('id_device_resend_' + this.device.device.id)
            .height('32vp')
            .padding({ left: '12vp', right: '12vp' })
            .fontSize($r('app.float.caption_font'))
            .fontColor(Color.White)
            .backgroundColor($r('app.color.accent'))
            .borderRadius($r('app.float.card_radius'))
            .onClick(() => {
              this.onResend(this.device.device.id);
            })
        }

        Button($r('app.string.correct'))
          .id('id_device_correct_' + this.device.device.id)
          .height('32vp')
          .padding({ left: '12vp', right: '12vp' })
          .fontSize($r('app.float.caption_font'))
          .fontColor($r('app.color.accent'))
          .backgroundColor(Color.Transparent)
          .border({ width: '1vp', color: $r('app.color.border') })
          .borderRadius($r('app.float.card_radius'))
          .onClick(() => {
            this.onCorrect(this.device.device.id);
          })
      }
      .id('id_device_header_' + this.device.device.id)
      .width('100%')
      .alignItems(VerticalAlign.Center)

      Row({ space: '8vp' }) {
        Text(getDeviceTypeLabel(this.device.device.type))
          .id('id_device_type_' + this.device.device.id)
          .fontSize($r('app.float.caption_font'))
          .fontColor($r('app.color.text_secondary'))
        Text(this.expectedText())
          .id('id_device_expected_' + this.device.device.id)
          .fontSize($r('app.float.caption_font'))
          .fontColor($r('app.color.text_secondary'))
      }
      .id('id_device_meta_' + this.device.device.id)
      .width('100%')
    }
    .id('id_device_card_' + this.device.device.id)
    .width('100%')
    .padding($r('app.float.page_padding'))
    .backgroundColor($r('app.color.bg_card'))
    .borderRadius($r('app.float.card_radius'))
  }
}
