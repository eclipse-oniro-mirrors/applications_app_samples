/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

/**
 * @file entry/src/main/ets/pages/Index.ets
 * 文件职责：Index 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：TitleExpansionView、TitleAttributeModifier、SubTitleAttributeModifier。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { AnimationAttribute } from '../model/AnimationAttribute';
import { TitleAttribute } from '../model/TitleAttribute';
import { TitleExpansion } from '../utils/TitleExpansion';
import { Configure } from './Configure';
import { titleContent } from './TitleContent'
import { titleMenu } from './TitleMenu'

/**
 * 功能描述: 本文以备忘录应用为示例，介绍如何在实现标题跟随手势移动并放缩的动效
 *
 * 推荐场景: 滑动过程中需要根据滑动偏移量或者监听手势变化实现图片或者标题渐变效果的场景
 *
 * 核心组件:
 * 1. TitleExpansion: 标题扩展组件
 * 2. TitleAttribute: 标题属性
 * 3. AnimationAttribute： 动效属性
 *
 * 实现步骤:
 * 1. 构建主标题与子标题属性
 * @example
 * private titleAttribute: TitleAttribute = new TitleAttribute($r("app.string.expanded_title_memo_title"), new TitleAttributeModifier());
 * private subTitleAttribute: TitleAttribute = new TitleAttribute($r("app.string.expanded_title_memo_counts"), new SubTitleAttributeModifier());
 * 2. 构建动效属性
 * @example
 * private animationAttribute: AnimationAttribute = new AnimationAttribute(Configure.NORMAL_TITLE_HEIGHT, Configure.EXPAND_TITLE_HEIGHT,
 Configure.CONTINUE_PULL_THRESHOLD, Configure.TITLE_SCALE_MAX_VALUE, Configure.ANIMATION_DURATION);
 * 3. 设置主标题及子标题位置
 * @example
 * private titlePostion: HorizontalAlign = HorizontalAlign.Start;
 * 4. 构建菜单栏样式
 * @example
 * @Builder
 * export function titleMenu(): void {
 *   TitleMenu();
 * }
 * 5. 构建页面内容
 * @example
 * @Builder
 * export function titleContent() {
 *   TitleContent();
 * }
 * 6. 构建标题扩展组件
 * TitleExpansion({
 *   titleAttribute: this.titleAttribute,
 *   subTitleAttribute: this.subTitleAttribute,
 *   titlePosition: this.titlePostion,
 *   animationAttribute: this.animationAttribute,
 *   menu: titleMenu,
 *   content: titleContent
 * })
 */
/**
 * TitleExpansionView：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
export struct TitleExpansionView {

  private titleAttribute: TitleAttribute = new TitleAttribute($r('app.string.expanded_title_memo_title'), new TitleAttributeModifier());
  private subTitleAttribute: TitleAttribute = new TitleAttribute($r('app.string.expanded_title_memo_counts'), new SubTitleAttributeModifier());
  private titlePostion: HorizontalAlign = HorizontalAlign.Start;
  private animationAttribute: AnimationAttribute = new AnimationAttribute(Configure.NORMAL_TITLE_HEIGHT, Configure.EXPAND_TITLE_HEIGHT,
    Configure.CONTINUE_PULL_THRESHOLD, Configure.TITLE_SCALE_MAX_VALUE, Configure.ANIMATION_DURATION);

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // RelativeContainer：相对布局容器
    // 关键属性：高度、宽度
    RelativeContainer() {
      /**
       * 构建标题扩展组件
       * titleAttribute: 主标题属性
       * subTitleAttribute: 子标题属性
       * titlePosition: 主标题及子标题位置
       * animationAttribute: 动效属性
       * menu: 菜单栏样式
       * content: 页面内容
       */
      // TitleExpansion：TitleExpansion 自定义组件
      // 关键属性：高度、宽度
      TitleExpansion({
        titleAttribute: this.titleAttribute,
        subTitleAttribute: this.subTitleAttribute,
        titlePosition: this.titlePostion,
        animationAttribute: this.animationAttribute,
        menu: titleMenu,
        content: titleContent
      }).id('index_title_expansion_2')
        .height($r('app.string.expanded_title_layout_100_percent'))
        .width($r('app.string.expanded_title_layout_100_percent'))
    }.id('index_relative_container_1')
    .height($r('app.string.expanded_title_layout_100_percent'))
    .width($r('app.string.expanded_title_layout_100_percent'))
  }
}

/**
 * TitleAttributeModifier：类定义，承载本文件对应的逻辑与数据。
 */
class TitleAttributeModifier implements AttributeModifier<TextAttribute> {

  /**
   * applyNormalAttribute：执行 applyNormalAttribute 相关逻辑。
   */
  applyNormalAttribute(instance: TextAttribute): void {
    instance
      .fontSize($r('app.string.expanded_title_init_title_font_size'))
  }
}

/**
 * SubTitleAttributeModifier：类定义，承载本文件对应的逻辑与数据。
 */
class SubTitleAttributeModifier implements AttributeModifier<TextAttribute> {

  /**
   * applyNormalAttribute：执行 applyNormalAttribute 相关逻辑。
   */
  applyNormalAttribute(instance: TextAttribute): void {
    instance
      .fontSize($r('app.string.expanded_title_memo_counts_font_size'))
      .fontColor(Color.Grey)
  }
}