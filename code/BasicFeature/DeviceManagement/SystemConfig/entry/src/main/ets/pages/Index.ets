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
import { SystemConfigConstants, PageConstants } from 'library';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

/**
 * Navigation item data interface.
 * Defines the data structure of each item in the home page navigation list.
 */
interface NavItem {
  /** Navigation item unique id (used as list key) */
  id: string;
  /** Navigation item title */
  title: ResourceStr;
  /** Navigation item description */
  description: ResourceStr;
  /** Navigation item icon */
  icon: ResourceStr;
  /** Target page route */
  targetPage: string;
}

/**
 * Home page.
 * Shows all feature entries of the system config sample,
 * including the Custom Config, Intelligent Scene and Settings Lite modules.
 */
@Entry
@Component
struct Index {
  /** Navigation item list */
  @State navItems: NavItem[] = [
    {
      id: 'custom_config',
      title: $r('app.string.page_custom_config'),
      description: $r('app.string.nav_desc_custom_config'),
      icon: $r('app.media.ic_nav_custom_config'),
      targetPage: PageConstants.PAGE_CUSTOM_CONFIG
    },
    {
      id: 'intelligent_scene',
      title: $r('app.string.page_intelligent_scene'),
      description: $r('app.string.nav_desc_intelligent_scene'),
      icon: $r('app.media.ic_nav_intelligent_scene'),
      targetPage: PageConstants.PAGE_INTELLIGENT_SCENE
    },
    {
      id: 'settings_lite',
      title: $r('app.string.page_settings_lite'),
      description: $r('app.string.nav_desc_settings_lite'),
      icon: $r('app.media.ic_nav_settings_lite'),
      targetPage: PageConstants.PAGE_SETTINGS_LITE
    }
  ];

  /**
   * Page build method.
   * Renders the home page navigation list and title bar.
   */
  build() {
    Column() {
      // Title bar
      Row() {
        Text($r('app.string.page_index_title'))
          .fontSize(PageConstants.FONT_SIZE_TITLE)
          .fontWeight(PageConstants.FONT_WEIGHT_BOLD)
          .fontColor(PageConstants.COLOR_TEXT_PRIMARY)
      }
      .width('100%')
      .height(PageConstants.NAV_BAR_HEIGHT)
      .padding({
        left: PageConstants.PAGE_PADDING,
        right: PageConstants.PAGE_PADDING
      })
      .backgroundColor(PageConstants.COLOR_CARD)
      .justifyContent(FlexAlign.Center)

      // App info card
      Column() {
        Text($r('app.string.app_intro_title'))
          .fontSize(PageConstants.FONT_SIZE_SUBTITLE)
          .fontWeight(PageConstants.FONT_WEIGHT_BOLD)
          .fontColor(PageConstants.COLOR_TEXT_PRIMARY)
          .margin({ bottom: 8 })

        Text($r('app.string.app_intro_desc'))
          .fontSize(PageConstants.FONT_SIZE_BODY)
          .fontColor(PageConstants.COLOR_TEXT_SECONDARY)
          .width('100%')

        Row() {
          Text(`API: 26`)
            .fontSize(PageConstants.FONT_SIZE_SMALL)
            .fontColor(PageConstants.COLOR_TEXT_HINT)
            .margin({ right: 16 })

          Text(`BundleName: ${SystemConfigConstants.BUNDLE_NAME}`)
            .fontSize(PageConstants.FONT_SIZE_SMALL)
            .fontColor(PageConstants.COLOR_TEXT_HINT)
        }
        .margin({ top: 8 })
      }
      .width('100%')
      .padding(PageConstants.CARD_PADDING)
      .margin({
        left: PageConstants.PAGE_PADDING,
        right: PageConstants.PAGE_PADDING,
        top: PageConstants.SECTION_SPACING
      })
      .backgroundColor(PageConstants.COLOR_CARD)
      .borderRadius(PageConstants.CARD_BORDER_RADIUS)
      .shadow({
        radius: 4,
        color: PageConstants.COLOR_SHADOW,
        offsetX: 0,
        offsetY: 2
      })
      .alignItems(HorizontalAlign.Start)

      // Feature entry list
      List({ space: PageConstants.ITEM_SPACING }) {
        ForEach(this.navItems, (item: NavItem) => {
          ListItem() {
            this.navItemCard(item)
          }
        }, (item: NavItem) => item.id)
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

  /**
   * Navigation item card builder.
   * Renders a single feature entry card; tapping it navigates to the corresponding page.
   * @param {NavItem} item - Navigation item data
   */
  @Builder
  navItemCard(item: NavItem) {
    Row() {
      // Icon area
      Image(item.icon)
        .width(PageConstants.NAV_ICON_SIZE)
        .height(PageConstants.NAV_ICON_SIZE)
        .margin({ right: PageConstants.ITEM_SPACING })

      // Text area
      Column() {
        Text(item.title)
          .fontSize(PageConstants.FONT_SIZE_SUBTITLE)
          .fontWeight(PageConstants.FONT_WEIGHT_BOLD)
          .fontColor(PageConstants.COLOR_TEXT_PRIMARY)

        Text(item.description)
          .fontSize(PageConstants.FONT_SIZE_SMALL)
          .fontColor(PageConstants.COLOR_TEXT_SECONDARY)
          .margin({ top: PageConstants.SPACING_TINY })
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

      // Arrow indicator
      SymbolGlyph($r('sys.symbol.chevron_right'))
        .fontSize(PageConstants.FONT_SIZE_TITLE)
        .fontColor([PageConstants.COLOR_TEXT_HINT])
    }
    .width('100%')
    .padding(PageConstants.CARD_PADDING)
    .backgroundColor(PageConstants.COLOR_CARD)
    .borderRadius(PageConstants.CARD_BORDER_RADIUS)
    .shadow({
      radius: 4,
      color: PageConstants.COLOR_SHADOW,
      offsetX: 0,
      offsetY: 2
    })
    .onClick(() => {
      hilog.info(DOMAIN, TAG, 'Index navItemCard: navigating to %{public}s', item.targetPage);
      router.pushUrl({ url: item.targetPage });
    })
  }
}
