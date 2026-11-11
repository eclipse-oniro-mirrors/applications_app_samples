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
 * 信息卡片组件。
 * 通用的信息展示卡片，包含标题和内容区域。
 */
@Component
export struct InfoCard {
  /** 卡片标题 */
  @Prop title: ResourceStr = '';
  /** 卡片副标题 */
  @Prop subtitle: ResourceStr = '';
  /** 是否显示分割线 */
  @Prop showDivider: boolean = true;
  /** 卡片内容构建器 */
  @BuilderParam content: () => void = this.defaultContent;

  /**
   * 判断副标题是否有效（支持字符串与资源两种类型）。
   * @returns {boolean} 是否需要展示副标题
   */
  private hasSubtitle(): boolean {
    if (typeof this.subtitle === 'string') {
      return this.subtitle.length > 0;
    }
    return this.subtitle !== undefined;
  }

  /**
   * 默认内容构建器。
   * 当未提供自定义内容时显示占位文本。
   */
  @Builder
  defaultContent() {
    Text($r('app.string.info_card_empty'))
      .fontSize(PageConstants.FONT_SIZE_BODY)
      .fontColor(PageConstants.COLOR_TEXT_HINT)
  }

  build() {
    Column() {
      // 卡片头部区域
      Column() {
        Text(this.title)
          .fontSize(PageConstants.FONT_SIZE_SUBTITLE)
          .fontWeight(PageConstants.FONT_WEIGHT_BOLD)
          .fontColor(PageConstants.COLOR_TEXT_PRIMARY)
          .width('100%')

        if (this.hasSubtitle()) {
          Text(this.subtitle)
            .fontSize(PageConstants.FONT_SIZE_SMALL)
            .fontColor(PageConstants.COLOR_TEXT_SECONDARY)
            .margin({ top: 4 })
            .width('100%')
        }
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)

      if (this.showDivider) {
        Divider()
          .color('#E0E0E0')
          .margin({ top: PageConstants.ITEM_SPACING, bottom: PageConstants.ITEM_SPACING })
      }

      // 卡片内容区域
      Column() {
        this.content()
      }
      .width('100%')
    }
    .width('100%')
    .padding(PageConstants.CARD_PADDING)
    .backgroundColor(PageConstants.COLOR_CARD)
    .borderRadius(PageConstants.CARD_BORDER_RADIUS)
    .shadow({
      radius: 4,
      color: 'rgba(0,0,0,0.1)',
      offsetX: 0,
      offsetY: 2
    })
  }
}
