/*
 * Copyright (c) 2024 Hunan OpenValley Digital Industry Development Co., Ltd.
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
  label: string = '';
  value: string = '';
}

/**
 * Connection Log page.
 * View Bluetooth connection history and events
 */
@Entry
@Component
struct ConnectionLogPage {
  @State infoItems: InfoItem[] = [];

  aboutToAppear(): void {
    hilog.info(DOMAIN, TAG, 'ConnectionLogPage aboutToAppear');
    hiTraceMeter.startTrace('ConnectionLogPage_load', 0);
    this.loadMockData();
    hiTraceMeter.finishTrace('ConnectionLogPage_load', 0);
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
    const logs: InfoItem[] = [];
    const actions: string[] = ['Connected', 'Disconnected', 'Paired', 'Error', 'Timeout'];
    const profiles: string[] = ['A2DP', 'HFP', 'HID', 'PAN', 'PBAP', 'MAP', 'AVRCP', 'HDP'];
    for (let i: number = 0; i < 20; i++) {
      const time: string = new Date(Date.now() - i * 300000).toLocaleTimeString();
      const action: string = actions[i % actions.length];
      const profile: string = profiles[i % profiles.length];
      logs.push({ label: time, value: action + ' - ' + profile + ' - Device-' + (1000 + i) });
    }
    return logs;
  }

  build() {
    Column() {
      Row() {
        Text('Connection Log')
          .fontSize(PageConstants.FONT_SIZE_TITLE)
          .fontWeight(PageConstants.FONT_WEIGHT_BOLD)
          .fontColor(PageConstants.COLOR_TEXT_PRIMARY)
      }
      .width('100%')
      .height(PageConstants.NAV_BAR_HEIGHT)
      .padding({ left: PageConstants.PAGE_PADDING, right: PageConstants.PAGE_PADDING })
      .backgroundColor(PageConstants.COLOR_SURFACE)

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
            .backgroundColor(PageConstants.COLOR_SURFACE)
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
