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

import { router } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { PageConstants } from 'library';

const TAG: string = '[Sample_BluetoothBaseProfile]';
const DOMAIN: number = 0xF830;

/**
 * Navigation item data interface.
 */
interface NavItem {
  title: string;
  description: string;
  icon: string;
  targetPage: string;
}

/**
 * Home page.
 * Displays all Bluetooth BaseProfile feature entries.
 */
@Entry
@Component
struct Index {
  @State navItems: NavItem[] = [
    { title: 'Audio (A2DP)', description: 'Advanced Audio Distribution Profile', icon: 'audio', targetPage: PageConstants.PAGE_A2DP },
    { title: 'Hands-Free (HFP)', description: 'Hands-Free Profile for calls', icon: 'phone', targetPage: PageConstants.PAGE_HFP },
    { title: 'Input (HID)', description: 'Human Interface Device Profile', icon: 'keyboard', targetPage: PageConstants.PAGE_HID },
    { title: 'Network (PAN)', description: 'Personal Area Network Profile', icon: 'network', targetPage: PageConstants.PAGE_PAN },
    { title: 'Phonebook (PBAP)', description: 'Phone Book Access Profile', icon: 'contacts', targetPage: PageConstants.PAGE_PBAP },
    { title: 'Messages (MAP)', description: 'Message Access Profile', icon: 'message', targetPage: PageConstants.PAGE_MAP },
    { title: 'Media (AVRCP)', description: 'Audio/Video Remote Control', icon: 'remote', targetPage: PageConstants.PAGE_AVRCP },
    { title: 'Health (HDP)', description: 'Health Device Profile', icon: 'health', targetPage: PageConstants.PAGE_HDP },
    { title: 'Scan Devices', description: 'Discover nearby Bluetooth devices', icon: 'scan', targetPage: PageConstants.PAGE_SCAN },
    { title: 'Bonded Devices', description: 'View paired device list', icon: 'paired', targetPage: PageConstants.PAGE_BONDED_DEVICES },
    { title: 'Connection Log', description: 'View connection history', icon: 'log', targetPage: PageConstants.PAGE_CONNECTION_LOG },
    { title: 'Statistics', description: 'Profile usage statistics', icon: 'stats', targetPage: PageConstants.PAGE_PROFILE_STATISTICS },
    { title: 'Combined Scenario', description: 'Multi-profile combination', icon: 'combined', targetPage: PageConstants.PAGE_COMBINED_SCENARIO },
    { title: 'Settings', description: 'Bluetooth configuration', icon: 'settings', targetPage: PageConstants.PAGE_SETTINGS }
  ];

  build() {
    Column() {
      // Title bar
      Row() {
        Text(PageConstants.TITLE_INDEX)
          .fontSize(PageConstants.FONT_SIZE_TITLE)
          .fontWeight(PageConstants.FONT_WEIGHT_BOLD)
          .fontColor(PageConstants.COLOR_TEXT_PRIMARY)
      }
      .width('100%')
      .height(PageConstants.NAV_BAR_HEIGHT)
      .padding({ left: PageConstants.PAGE_PADDING, right: PageConstants.PAGE_PADDING })
      .backgroundColor(PageConstants.COLOR_SURFACE)
      .justifyContent(FlexAlign.Center)

      // App info card
      Column() {
        Text('Bluetooth BaseProfile Sample')
          .fontSize(PageConstants.FONT_SIZE_SUBTITLE)
          .fontWeight(PageConstants.FONT_WEIGHT_BOLD)
          .fontColor(PageConstants.COLOR_TEXT_PRIMARY)
          .margin({ bottom: 8 })
        Text('Demonstrates Bluetooth BaseProfile APIs including A2DP, HFP, HID, PAN, PBAP, MAP, AVRCP, and HDP.')
          .fontSize(PageConstants.FONT_SIZE_BODY)
          .fontColor(PageConstants.COLOR_TEXT_SECONDARY)
          .width('100%')
        Row() {
          Text('SDK: 26.0.0')
            .fontSize(PageConstants.FONT_SIZE_SMALL)
            .fontColor(PageConstants.COLOR_TEXT_HINT)
            .margin({ right: 16 })
          Text('BundleName: ohos.samples.bluetoothbaseprofile')
            .fontSize(PageConstants.FONT_SIZE_SMALL)
            .fontColor(PageConstants.COLOR_TEXT_HINT)
        }
        .margin({ top: 8 })
      }
      .width('100%')
      .padding(PageConstants.CARD_PADDING)
      .margin({ left: PageConstants.PAGE_PADDING, right: PageConstants.PAGE_PADDING, top: PageConstants.SECTION_SPACING })
      .backgroundColor(PageConstants.COLOR_SURFACE)
      .borderRadius(PageConstants.CARD_BORDER_RADIUS)
      .shadow({ radius: 4, color: 'rgba(0,0,0,0.1)', offsetX: 0, offsetY: 2 })
      .alignItems(HorizontalAlign.Start)

      // Navigation list
      List({ space: PageConstants.ITEM_SPACING }) {
        ForEach(this.navItems, (item: NavItem) => {
          ListItem() {
            this.navItemCard(item)
          }
        }, (item: NavItem) => item.title)
      }
      .width('100%')
      .padding({ left: PageConstants.PAGE_PADDING, right: PageConstants.PAGE_PADDING, top: PageConstants.SECTION_SPACING })
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(PageConstants.COLOR_BACKGROUND)
  }

  @Builder
  navItemCard(item: NavItem) {
    Row() {
      Column() {
        Text(item.icon)
          .fontSize(24)
          .fontColor(PageConstants.COLOR_BLUETOOTH)
          .margin({ bottom: 4 })
      }
      .width(48)
      .height(48)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .backgroundColor('#E3F2FD')
      .borderRadius(24)
      .margin({ right: 12 })

      Column() {
        Text(item.title)
          .fontSize(PageConstants.FONT_SIZE_SUBTITLE)
          .fontWeight(PageConstants.FONT_WEIGHT_BOLD)
          .fontColor(PageConstants.COLOR_TEXT_PRIMARY)
        Text(item.description)
          .fontSize(PageConstants.FONT_SIZE_SMALL)
          .fontColor(PageConstants.COLOR_TEXT_SECONDARY)
          .margin({ top: 4 })
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

      Text('>')
        .fontSize(20)
        .fontColor(PageConstants.COLOR_TEXT_HINT)
    }
    .width('100%')
    .padding(PageConstants.CARD_PADDING)
    .backgroundColor(PageConstants.COLOR_SURFACE)
    .borderRadius(PageConstants.CARD_BORDER_RADIUS)
    .shadow({ radius: 4, color: 'rgba(0,0,0,0.1)', offsetX: 0, offsetY: 2 })
    .onClick(() => {
      hilog.info(DOMAIN, TAG, 'Index: navigating to %{public}s', item.targetPage);
      router.pushUrl({ url: item.targetPage });
    })
  }
}
