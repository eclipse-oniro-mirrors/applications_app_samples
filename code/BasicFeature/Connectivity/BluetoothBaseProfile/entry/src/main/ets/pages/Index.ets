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

import { router } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { PageConstants, BluetoothConstants } from 'library';

const TAG: string = BluetoothConstants.TAG;
const DOMAIN: number = BluetoothConstants.DOMAIN;

/**
 * Navigation item data interface.
 */
interface NavItem {
  title: Resource;
  description: Resource;
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
    { title: $r('app.string.nav_title_a2dp'), description: $r('app.string.nav_desc_a2dp'), icon: 'audio',
      targetPage: PageConstants.PAGE_A2DP },
    { title: $r('app.string.nav_title_hfp'), description: $r('app.string.nav_desc_hfp'), icon: 'phone',
      targetPage: PageConstants.PAGE_HFP },
    { title: $r('app.string.nav_title_hid'), description: $r('app.string.nav_desc_hid'), icon: 'keyboard',
      targetPage: PageConstants.PAGE_HID },
    { title: $r('app.string.nav_title_pan'), description: $r('app.string.nav_desc_pan'), icon: 'network',
      targetPage: PageConstants.PAGE_PAN },
    { title: $r('app.string.nav_title_pbap'), description: $r('app.string.nav_desc_pbap'), icon: 'contacts',
      targetPage: PageConstants.PAGE_PBAP },
    { title: $r('app.string.nav_title_map'), description: $r('app.string.nav_desc_map'), icon: 'message',
      targetPage: PageConstants.PAGE_MAP },
    { title: $r('app.string.nav_title_avrcp'), description: $r('app.string.nav_desc_avrcp'), icon: 'remote',
      targetPage: PageConstants.PAGE_AVRCP },
    { title: $r('app.string.nav_title_hdp'), description: $r('app.string.nav_desc_hdp'), icon: 'health',
      targetPage: PageConstants.PAGE_HDP },
    { title: $r('app.string.nav_title_scan'), description: $r('app.string.nav_desc_scan'), icon: 'scan',
      targetPage: PageConstants.PAGE_SCAN },
    { title: $r('app.string.nav_title_bonded'), description: $r('app.string.nav_desc_bonded'), icon: 'paired',
      targetPage: PageConstants.PAGE_BONDED_DEVICES },
    { title: $r('app.string.nav_title_connlog'), description: $r('app.string.nav_desc_connlog'), icon: 'log',
      targetPage: PageConstants.PAGE_CONNECTION_LOG },
    { title: $r('app.string.nav_title_stats'), description: $r('app.string.nav_desc_stats'), icon: 'stats',
      targetPage: PageConstants.PAGE_PROFILE_STATISTICS },
    { title: $r('app.string.nav_title_combined'), description: $r('app.string.nav_desc_combined'), icon: 'combined',
      targetPage: PageConstants.PAGE_COMBINED_SCENARIO },
    { title: $r('app.string.nav_title_settings'), description: $r('app.string.nav_desc_settings'), icon: 'settings',
      targetPage: PageConstants.PAGE_SETTINGS }
  ];

  build() {
    Column() {
      // Title bar
      Row() {
        Text($r('app.string.title_index'))
          .fontSize(PageConstants.FONT_SIZE_TITLE)
          .fontWeight(PageConstants.FONT_WEIGHT_BOLD)
          .fontColor(PageConstants.COLOR_TEXT_PRIMARY)
      }
      .width('100%')
      .height(PageConstants.NAV_BAR_HEIGHT)
      .padding({ left: PageConstants.PAGE_PADDING, right: PageConstants.PAGE_PADDING })
      .backgroundColor(PageConstants.COLOR_CARD)
      .justifyContent(FlexAlign.Center)

      // App info card
      Column() {
        Text($r('app.string.index_app_name'))
          .fontSize(PageConstants.FONT_SIZE_SUBTITLE)
          .fontWeight(PageConstants.FONT_WEIGHT_BOLD)
          .fontColor(PageConstants.COLOR_TEXT_PRIMARY)
          .margin({ bottom: 8 })
        Text($r('app.string.index_subtitle'))
          .fontSize(PageConstants.FONT_SIZE_BODY)
          .fontColor(PageConstants.COLOR_TEXT_SECONDARY)
          .width('100%')
        Row() {
          Text($r('app.string.index_sdk_info'))
            .fontSize(PageConstants.FONT_SIZE_SMALL)
            .fontColor(PageConstants.COLOR_TEXT_HINT)
            .margin({ right: 16 })
          Text($r('app.string.index_bundle_name'))
            .fontSize(PageConstants.FONT_SIZE_SMALL)
            .fontColor(PageConstants.COLOR_TEXT_HINT)
        }
        .margin({ top: 8 })
      }
      .width('100%')
      .padding(PageConstants.CARD_PADDING)
      .margin({ left: PageConstants.PAGE_PADDING, right: PageConstants.PAGE_PADDING,
          top: PageConstants.SECTION_SPACING })
      .backgroundColor(PageConstants.COLOR_CARD)
      .borderRadius(PageConstants.CARD_BORDER_RADIUS)
      .shadow({ radius: 4, color: 'rgba(0,0,0,0.1)', offsetX: 0, offsetY: 2 })
      .alignItems(HorizontalAlign.Start)

      // Navigation list
      List({ space: PageConstants.ITEM_SPACING }) {
        ForEach(this.navItems, (item: NavItem) => {
          ListItem() {
            this.navItemCard(item)
          }
        }, (item: NavItem) => item.targetPage)
      }
      .width('100%')
      .padding({ left: PageConstants.PAGE_PADDING, right: PageConstants.PAGE_PADDING,
          top: PageConstants.SECTION_SPACING })
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
      .backgroundColor($r('app.color.color_light_blue'))
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
    .backgroundColor(PageConstants.COLOR_CARD)
    .borderRadius(PageConstants.CARD_BORDER_RADIUS)
    .shadow({ radius: 4, color: 'rgba(0,0,0,0.1)', offsetX: 0, offsetY: 2 })
    .onClick(() => {
      hilog.info(DOMAIN, TAG, 'Index: navigating to %{public}s', item.targetPage);
      router.pushUrl({ url: item.targetPage });
    })
  }
}
