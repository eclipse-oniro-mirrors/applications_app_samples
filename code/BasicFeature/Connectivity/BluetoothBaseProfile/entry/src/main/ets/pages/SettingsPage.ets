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

import { hilog, hiTraceMeter } from '@kit.PerformanceAnalysisKit';
import { PageConstants, BluetoothConstants } from 'library';

const TAG: string = BluetoothConstants.TAG;
const DOMAIN: number = BluetoothConstants.DOMAIN;

class InfoItem {
  public label: string = '';
  public value: string = '';
}

/**
 * Bluetooth Settings page.
 * Configure Bluetooth preferences and options
 */
@Entry
@Component
struct SettingsPage {
  @State infoItems: InfoItem[] = [];

  aboutToAppear(): void {
    hilog.info(DOMAIN, TAG, 'SettingsPage aboutToAppear');
    hiTraceMeter.startTrace('SettingsPage_load', 0);
    this.loadMockData();
    hiTraceMeter.finishTrace('SettingsPage_load', 0);
  }

  /**
   * Load mock data for display.
   */
  private loadMockData(): void {
    this.infoItems = this.getMockItems();
  }

  /**
   * Get mock data items.
   * @returns Array of label-value pairs
   */
  private getMockItems(): InfoItem[] {
    return [
      { label: 'Bluetooth Enabled', value: 'Yes' },
      { label: 'Discoverable', value: 'Yes (300s timeout)' },
      { label: 'Device Name', value: 'OpenHarmony Device' },
      { label: 'MAC Address', value: BluetoothConstants.MOCK_MAC_ADDRESS },
      { label: 'Scan Mode', value: 'Connectable & Discoverable' },
      { label: 'Auto-reconnect', value: 'Enabled' },
      { label: 'Connection Timeout', value: '10 seconds' },
      { label: 'Max Connections', value: '7' },
      { label: 'Log Level', value: 'INFO' },
      { label: 'Mock Mode', value: 'Enabled (no real peripherals)' },
    ];
  }

  build() {
    Column() {
      Row() {
        Text($r('app.string.title_settings'))
          .fontSize(PageConstants.FONT_SIZE_TITLE)
          .fontWeight(PageConstants.FONT_WEIGHT_BOLD)
          .fontColor(PageConstants.COLOR_TEXT_PRIMARY)
      }
      .width('100%')
      .height(PageConstants.NAV_BAR_HEIGHT)
      .padding({ left: PageConstants.PAGE_PADDING, right: PageConstants.PAGE_PADDING })
      .backgroundColor(PageConstants.COLOR_CARD)

      List({ space: 8 }) {
        ForEach(this.infoItems, (item: InfoItem) => {
          ListItem() {
            Row() {
              Text(item.label)
                .fontSize(PageConstants.FONT_SIZE_BODY)
                .fontWeight(PageConstants.FONT_WEIGHT_BOLD)
                .fontColor(PageConstants.COLOR_TEXT_PRIMARY)
                .layoutWeight(1)
              Text(item.value)
                .fontSize(PageConstants.FONT_SIZE_BODY)
                .fontColor(PageConstants.COLOR_TEXT_SECONDARY)
                .textAlign(TextAlign.End)
            }
            .width('100%')
            .padding(12)
            .backgroundColor(PageConstants.COLOR_CARD)
            .borderRadius(8)
          }
        }, (item: InfoItem) => item.label)
      }
      .width('100%')
      .padding({
        left: PageConstants.PAGE_PADDING,
        right: PageConstants.PAGE_PADDING,
        top: PageConstants.SECTION_SPACING
      })
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(PageConstants.COLOR_BACKGROUND)
  }
}
