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
import { SystemConfigConstants, PageConstants } from 'library';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

/**
 * 导航项数据接口。
 * 定义首页导航列表的每一项数据结构。
 */
interface NavItem {
  /** 导航项标题 */
  title: string;
  /** 导航项描述 */
  description: string;
  /** 导航项图标 */
  icon: string;
  /** 目标页面路由 */
  targetPage: string;
}

/**
 * 首页。
 * 展示系统配置示例的所有功能入口，
 * 包括定制配置、情景模式和设置信息三个模块。
 */
@Entry
@Component
struct Index {
  /** 导航项列表 */
  @State navItems: NavItem[] = [
    {
      title: '定制配置',
      description: '获取设备渠道标识符（customConfig.getChannelId）',
      icon: '📋',
      targetPage: PageConstants.PAGE_CUSTOM_CONFIG
    },
    {
      title: '情景模式',
      description: '查询免打扰状态和通知允许状态（intelligentScene）',
      icon: '🔕',
      targetPage: PageConstants.PAGE_INTELLIGENT_SCENE
    },
    {
      title: '设置信息',
      description: '打开系统设置页面和查询双击应用（settingsLite）',
      icon: '⚙️',
      targetPage: PageConstants.PAGE_SETTINGS_LITE
    }
  ];

  /**
   * 页面构建方法。
   * 渲染首页导航列表和标题栏。
   */
  build() {
    Column() {
      // 标题栏
      Row() {
        Text(PageConstants.TITLE_INDEX)
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
      .backgroundColor(PageConstants.COLOR_SURFACE)
      .justifyContent(FlexAlign.Center)

      // 应用信息卡片
      Column() {
        Text('SystemConfig 示例')
          .fontSize(PageConstants.FONT_SIZE_SUBTITLE)
          .fontWeight(PageConstants.FONT_WEIGHT_BOLD)
          .fontColor(PageConstants.COLOR_TEXT_PRIMARY)
          .margin({ bottom: 8 })

        Text('本示例演示 Basic Services Kit 中的定制配置、情景模式和设置信息接口。')
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
      .backgroundColor(PageConstants.COLOR_SURFACE)
      .borderRadius(PageConstants.CARD_BORDER_RADIUS)
      .shadow({
        radius: 4,
        color: 'rgba(0,0,0,0.1)',
        offsetX: 0,
        offsetY: 2
      })
      .alignItems(HorizontalAlign.Start)

      // 功能入口列表
      List({ space: PageConstants.ITEM_SPACING }) {
        ForEach(this.navItems, (item: NavItem) => {
          ListItem() {
            this.navItemCard(item)
          }
        }, (item: NavItem) => item.title)
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
   * 导航项卡片构建器。
   * 渲染单个功能入口卡片，点击后跳转到对应页面。
   * @param {NavItem} item - 导航项数据
   */
  @Builder
  navItemCard(item: NavItem) {
    Row() {
      // 图标区域
      Text(item.icon)
        .fontSize(32)
        .margin({ right: 12 })

      // 文本区域
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

      // 箭头指示
      Text('>')
        .fontSize(20)
        .fontColor(PageConstants.COLOR_TEXT_HINT)
    }
    .width('100%')
    .padding(PageConstants.CARD_PADDING)
    .backgroundColor(PageConstants.COLOR_SURFACE)
    .borderRadius(PageConstants.CARD_BORDER_RADIUS)
    .shadow({
      radius: 4,
      color: 'rgba(0,0,0,0.1)',
      offsetX: 0,
      offsetY: 2
    })
    .onClick(() => {
      hilog.info(DOMAIN, TAG, 'Index navItemCard: navigating to %{public}s', item.targetPage);
      router.pushUrl({ url: item.targetPage });
    })
  }
}
