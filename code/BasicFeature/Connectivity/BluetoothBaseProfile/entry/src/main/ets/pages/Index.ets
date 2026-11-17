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

/** Leading icon glyph font size inside a navigation card. */
const ICON_FONT_SIZE: number = 24;
/** Trailing chevron indicator font size. */
const CHEVRON_FONT_SIZE: number = 20;
/** Width and height of the circular leading-icon container. */
const ICON_BOX_SIZE: number = 48;
/** Corner radius that turns the icon container into a circle (half of ICON_BOX_SIZE). */
const ICON_BOX_RADIUS: number = 24;
/** Vertical gap between stacked texts within a card. */
const TEXT_LINE_GAP: number = 8;
/** Tight vertical gap used around the icon and the description text. */
const TIGHT_GAP: number = 4;
/** Horizontal gap between the inline SDK and bundle hint texts. */
const HINT_TEXT_GAP: number = 16;
/** Horizontal gap between the icon container and the text column. */
const ICON_TEXT_GAP: number = 12;
/** Drop-shadow corner radius applied to the raised cards. */
const CARD_SHADOW_RADIUS: number = 4;
/** Vertical offset of the raised-card drop shadow. */
const CARD_SHADOW_OFFSET_Y: number = 2;
/** Shadow color used by the raised cards. */
const CARD_SHADOW_COLOR: string = 'rgba(0,0,0,0.1)';

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
          .margin({ bottom: TEXT_LINE_GAP })
        Text($r('app.string.index_subtitle'))
          .fontSize(PageConstants.FONT_SIZE_BODY)
          .fontColor(PageConstants.COLOR_TEXT_SECONDARY)
          .width('100%')
        Row() {
          Text($r('app.string.index_sdk_info'))
            .fontSize(PageConstants.FONT_SIZE_SMALL)
            .fontColor(PageConstants.COLOR_TEXT_HINT)
            .margin({ right: HINT_TEXT_GAP })
          Text($r('app.string.index_bundle_name'))
            .fontSize(PageConstants.FONT_SIZE_SMALL)
            .fontColor(PageConstants.COLOR_TEXT_HINT)
        }
        .margin({ top: TEXT_LINE_GAP })
      }
      .width('100%')
      .padding(PageConstants.CARD_PADDING)
      .margin({ left: PageConstants.PAGE_PADDING, right: PageConstants.PAGE_PADDING,
          top: PageConstants.SECTION_SPACING })
      .backgroundColor(PageConstants.COLOR_CARD)
      .borderRadius(PageConstants.CARD_BORDER_RADIUS)
      .shadow({ radius: CARD_SHADOW_RADIUS, color: CARD_SHADOW_COLOR, offsetX: 0, offsetY: CARD_SHADOW_OFFSET_Y })
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
          .fontSize(ICON_FONT_SIZE)
          .fontColor(PageConstants.COLOR_BLUETOOTH)
          .margin({ bottom: TIGHT_GAP })
      }
      .width(ICON_BOX_SIZE)
      .height(ICON_BOX_SIZE)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .backgroundColor($r('app.color.color_light_blue'))
      .borderRadius(ICON_BOX_RADIUS)
      .margin({ right: ICON_TEXT_GAP })

      Column() {
        Text(item.title)
          .fontSize(PageConstants.FONT_SIZE_SUBTITLE)
          .fontWeight(PageConstants.FONT_WEIGHT_BOLD)
          .fontColor(PageConstants.COLOR_TEXT_PRIMARY)
        Text(item.description)
          .fontSize(PageConstants.FONT_SIZE_SMALL)
          .fontColor(PageConstants.COLOR_TEXT_SECONDARY)
          .margin({ top: TIGHT_GAP })
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

      Text('>')
        .fontSize(CHEVRON_FONT_SIZE)
        .fontColor(PageConstants.COLOR_TEXT_HINT)
    }
    .width('100%')
    .padding(PageConstants.CARD_PADDING)
    .backgroundColor(PageConstants.COLOR_CARD)
    .borderRadius(PageConstants.CARD_BORDER_RADIUS)
    .shadow({ radius: CARD_SHADOW_RADIUS, color: CARD_SHADOW_COLOR, offsetX: 0, offsetY: CARD_SHADOW_OFFSET_Y })
    .onClick(() => {
      hilog.info(DOMAIN, TAG, 'Index: navigating to %{public}s', item.targetPage);
      router.pushUrl({ url: item.targetPage });
    })
  }
}
