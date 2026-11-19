/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @file entry/src/main/ets/utils/TitleExpansion.ets
 * 文件职责：TitleExpansion 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：TitleExpansion、TitleAttributeModifier、SubTitleAttributeModifier。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { Callback } from '@kit.BasicServicesKit';
import { AnimationAttribute } from '../model/AnimationAttribute';
import Constants from '../constants/Constants';
import { TitleAttribute } from '../model/TitleAttribute';

/**
 * 功能描述:
 * 1. 标题栏跟随手势产生移动、放缩以及显隐动效
 * 2. 菜单栏跟随手势产生移动动效
 * 3. 手势松开后，标题栏、菜单栏可以跳转或回弹至对应位置
 *
 * 实现原理:
 * 1. 标题高度变化，通过状态变量heightValue控制，通过onScrollFrameBegin获取list偏移，并将其分配给标题高度变化和实际list偏移
 * 2. 标题展开继续下拉偏移，通过状态变量curOffset控制，通过onDidScroll获取标题展开后，标题继续下拉的偏移
 * 3. 滚动停止动画，通过onScrollStop获取滚动停止时的标题高度。当标题高度大于阈值时，产生展开标题动画；相反，则产生收缩标题动画
 *
 * @param {TitleAttribute} [titleAttribute] - 主标题属性
 * @param {TitleAttribute} [subTitleAttribute] - 子标题属性
 * @param {HorizontalAlign} [titlePosition] - 主标题及子标题位置
 * @param {AnimationAttribute} [animationAttribute] - 动效属性
 * @param {() => void} [menu] - 菜单栏样式
 * @param {() => void} [content] - 页面内容样式
 */
/**
 * TitleExpansion：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct TitleExpansion {
  // 主标题属性
  titleAttribute: TitleAttribute = new TitleAttribute(Constants.MEMO_TITLE, new TitleAttributeModifier());

  // 子标题属性
  subTitleAttribute: TitleAttribute = new TitleAttribute(Constants.MEMO_SUB_TITLE, new SubTitleAttributeModifier());

  // 主标题及子标题位置
  titlePosition: HorizontalAlign = HorizontalAlign.Start;

  // 动效属性
  animationAttribute: AnimationAttribute = new AnimationAttribute(Constants.NORMAL_TITLE_HEIGHT,
    Constants.EXPAND_TITLE_HEIGHT, Constants.CONTINUE_PULL_THRESHOLD,
    Constants.TITLE_SCALE_MAX_VALUE, Constants.ANIMATION_DURATION);

  // 菜单栏样式
  // @BuilderParam menu：构建函数参数
  @BuilderParam menu: () => void = this.titleExpansionMenu;

  // 页面内容样式
  // @BuilderParam content：构建函数参数
  @BuilderParam content: () => void = this.titleExpansionContent;

  // ---------私有变量---------
  // 标题栏高度
  // @State heightValue：组件内部状态
  @State heightValue: number = this.animationAttribute.normalTitleHeight;

  // 子标题显隐参数
  // @State textOpacity：组件内部状态
  @State textOpacity: number = 1;

  // 标题扩展后，继续下拉的偏移
  // @State curOffset：组件内部状态
  @State curOffset: number = 0;

  // 动画持续时间
  private animationDuration: number = this.animationAttribute.animationDuration;

  // 节流器状态
  private throttleStatus: boolean = true;

  // 节流器延迟时间
  private delay: number = 240;

  // 标题栏扩展或收缩阈值
  private thresholdValue: number = (this.animationAttribute.normalTitleHeight +
  this.animationAttribute.expandTitleHeight) / 2;

  // 滚动控制器
  private scroller: ListScroller = new ListScroller();

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // RelativeContainer：相对布局容器
    // 关键属性：背景色
    RelativeContainer() {
      // RelativeContainer：相对布局容器
      // 关键属性：高度、宽度、内边距
      RelativeContainer() {
        // 标题
        // Column：垂直布局容器
        // 关键属性：高度、主轴对齐、交叉轴对齐、相对对齐规则
        Column() {
          // Text：文本
          // 关键属性：attributeModifier、缩放、getTitleScaleOptions、平移、getTitleTranslateOptions
          Text(this.titleAttribute.text)
            .attributeModifier(this.titleAttribute.attribute)
            .scale(this.getTitleScaleOptions())
            .translate(this.getTitleTranslateOptions())
            .id('titleMainText')
          // 子标题
          // Text：文本
          // 关键属性：attributeModifier、透明度、getTitleOpacityOptions、平移、getTitleTranslateOptions
          Text(this.subTitleAttribute.text)
            .attributeModifier(this.subTitleAttribute.attribute)
            .opacity(this.getTitleOpacityOptions())
            .translate(this.getTitleTranslateOptions())
            .id('titleSubText')
        }.id('title_expansion_column_2')
        .height(Constants.ONE_HUNDRED_PERCENT)
        .justifyContent(FlexAlign.Start)
        .alignItems(this.titlePosition)
        .alignRules({
          left: {anchor: '__container__', align: HorizontalAlign.Start},
          right: {anchor: 'titleImage', align: HorizontalAlign.Start}
        })

        // 菜单
        // Column：垂直布局容器
        // 关键属性：高度、主轴对齐、平移、getMenuTranslateOptions、相对对齐规则
        Column() {
          this.menu();
        }.id('titleImage')
        .height(Constants.ONE_HUNDRED_PERCENT)
        .justifyContent(FlexAlign.Start)
        .translate(this.getMenuTranslateOptions()) // TODO：知识点：配置菜单平移参数
        .alignRules({
          right: {anchor: '__container__', align: HorizontalAlign.End}
        })
      }
      .id('title')
      .height(this.heightValue)
      .width(Constants.ONE_HUNDRED_PERCENT)
      .padding(Constants.TITLE_LAYOUT_PADDING)

      // List：列表容器
      // 关键属性：滚动条、宽度
      List({ space: Constants.SEARCH_MEMO_SPACE, scroller: this.scroller }) {
        // ListItem：列表项
        ListItem() {
          // 内容
          this.content();
        }.id('title_expansion_list_item_3')
      }.id('contentList')
      .scrollBar(BarState.Off)
      .width(Constants.ONE_HUNDRED_PERCENT)
      // 获取标题展开后，标题继续下拉及下拉回弹偏移
      .onDidScroll((scrollOffset: number, scrollState: ScrollState) => {
        this.curOffset = this.scroller.currentOffset().yOffset;
      })
      .onScrollFrameBegin((offset: number, state: ScrollState) => {
        let listOffset: number = 0;
        // 保证list没有在起始位置时以list滑动为主
        if (offset < 0) {
          listOffset = Math.max(offset, -this.scroller.currentOffset().yOffset);
          offset -= listOffset;
        }
        // 标题高度变化
        let titleHeightChange = this.getTitleHeightChangeOptions(-offset);
        this.heightValue += titleHeightChange;
        // list滑动距离
        offset += titleHeightChange;
        offset += listOffset;
        return {offsetRemain: offset};
      })
      // TODO: 知识点: 在滚动停止时判断是否需要展开或者收缩标题
      .onScrollStop(() => {
        if (this.heightValue >= this.thresholdValue) {
          this.animateToThrottle(() => {
            this.heightValue = Constants.EXPAND_TITLE_HEIGHT;
          }, this.delay)
        } else {
          this.animateToThrottle(() => {
            this.heightValue = Constants.NORMAL_TITLE_HEIGHT;
          }, this.delay)
        }
      })
      .alignRules({
        top: {anchor: 'title', align: VerticalAlign.Bottom},
        bottom: {anchor: '__container__', align: VerticalAlign.Bottom}
      })
    }.id('title_expansion_relative_container_1')
    .backgroundColor(Constants.BACKGROUND_COLOR)
  }

  /**
   * 默认菜单样式
   * @returns
   */
  /**
   * titleExpansionMenu：执行 titleExpansionMenu 相关逻辑。
   */
  @Builder
  titleExpansionMenu(): void {
  }

  /**
   * 默认内容样式
   * @returns
   */
  /**
   * titleExpansionContent：执行 titleExpansionContent 相关逻辑。
   */
  @Builder
  titleExpansionContent(): void {
    // Column：垂直布局容器
    // 关键属性：高度、宽度
    Column() {
    }.id('title_expansion_column_4')
      .height(Constants.ONE_HUNDRED_PERCENT)
      .width(Constants.ONE_HUNDRED_PERCENT)
  }

  /**
   * 获取标题展开时，继续下拉的菜单栏Translate参数
   * @returns {TranslateOptions} 标题展开后继续下拉的菜单栏Translate参数
   */
  getMenuTranslateOptions(): TranslateOptions {
    return { y: Math.max(-this.curOffset, 0) };
  }

  /**
   * 获取标题展开时，继续下拉的标题栏Translate参数
   * @returns {TranslateOptions} 标题展开后继续下拉的标题栏Translate参数
   */
  getTitleTranslateOptions(): TranslateOptions {
    return {y: Math.max(-this.curOffset, 0)};
  }

  /**
   * 获取标题栏高度变化参数
   * @param offset: 当前产生的偏移
   * @returns {number} 标题栏高度变化值
   */
  getTitleHeightChangeOptions(offset: number): number {
    return Math.max(Math.min(offset, this.animationAttribute.expandTitleHeight - this.heightValue),
      this.animationAttribute.normalTitleHeight - this.heightValue);
  }

  /**
   * 获取主标题缩放的Scale参数
   * @returns {ScaleOptions} 主标题缩放系数
   */
  getTitleScaleOptions(): ScaleOptions {
    // 初始放缩系数为1
    let scaleRatio = 1 + (this.animationAttribute.titleScale - 1) *
      Math.min((this.heightValue - this.animationAttribute.normalTitleHeight +
      Math.max(-this.curOffset, 0)) / this.animationAttribute.continuePullThreshold,
        1);
    return {
      x: scaleRatio,
      y: scaleRatio,
      centerX: Constants.INIT_COORDINATE,
      centerY: Constants.INIT_COORDINATE
    };
  }

  /**
   * 获取子标题显隐参数
   * @returns {number} 子标题显隐系数
   */
  getTitleOpacityOptions(): number {
    return (this.heightValue - this.animationAttribute.normalTitleHeight) /
      (this.animationAttribute.expandTitleHeight - this.animationAttribute.normalTitleHeight)
  }

  /**
   * 节流器：如果短时间内多次触发了同一事件，那么在函数执行一次后，在一个限期内不再执行
   * @param {Callback<void>} fn: 动画函数
   * @param {number} delay: 同一事件触发间隔
   * @returns
   */
  animateToThrottle(fn: Callback<void>, delay: number): void {
    if (this.throttleStatus) {
      // TODO: 性能知识点：播放动画时，系统需要在一个刷新周期内完成动画变化曲线的计算，完成组件布局绘制等操作。建议使用系统提供的动画接口，
      // 只需设置曲线类型、终点位置、时长等信息，就能够满足常用的动画功能，减少UI主线程的负载。参考资料：
      // https://gitee.com/openharmony/docs/blob/OpenHarmony-5.0.0-Release/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-explicit-animation.md
      animateTo({
        duration: this.animationDuration, curve: Curve.FastOutLinearIn
      }, fn)
      this.throttleStatus = false;
      setTimeout(() => {
        this.throttleStatus = true;
      }, delay)
    }
  }
}

/**
 * 默认标题样式
 */
class TitleAttributeModifier implements AttributeModifier<TextAttribute> {

  /**
   * applyNormalAttribute：执行 applyNormalAttribute 相关逻辑。
   */
  applyNormalAttribute(instance: TextAttribute): void {
    instance
      .fontSize(Constants.TITLE_FONT_SIZE)
  }
}

/**
 * 默认子标题样式
 */
class SubTitleAttributeModifier implements AttributeModifier<TextAttribute> {

  /**
   * applyNormalAttribute：执行 applyNormalAttribute 相关逻辑。
   */
  applyNormalAttribute(instance: TextAttribute): void {
    instance
      .fontSize(Constants.SUB_TITLE_FONT_SIZE)
      .fontColor(Color.Grey)
  }
}