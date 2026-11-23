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
 * @file casesfeature/tabcontentoverflow/src/main/ets/view/Side.ets
 * 文件职责：Side 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：Side、VideoDes、TopView。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

// 本文件包含三个视图组件：
// 1. Side：视频右侧互动栏（头像、关注、点赞、评论、收藏、分享）
// 2. VideoDes：视频信息区（昵称、文案、发布时间、上升热点、在线人数）
// 3. TopView：顶部导航区（搜索入口与四个页签）
import { CONFIGURATION, STRINGCONFIGURATION } from '../common/Constants';
import { promptAction } from '@kit.ArkUI';
import { Utils } from '../common/Utils';

// 展示视频播放界面右侧用户头像、视频评论数量、收藏数量、分享数量、作者是否被用户关注等信息
/**
 * Side：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct Side {
  // 头像资源：右侧互动栏顶部展示的用户头像
  private head: Resource = $r('app.media.tabcontentoverflow_head_image'); // 头像
  // @State likeCount：组件内部状态
  // 点赞数量
  @State likeCount: number = 1234; // 点赞数量
  // 评论数量
  @State commentCount: number = 2234; // 评论数量
  // 收藏数量
  @State favoriteCount: number = 3234; // 收藏数量
  // 是否已关注作者
  @State isFocus: boolean = false; // 是否关注
  // 是否已点赞
  @State isLike: boolean = false; // 是否点赞
  // @State isFavorite：组件内部状态
  // 是否收藏
  @State isFavorite: boolean = false; // 是否收藏
  // 通用工具类实例：统一提供未开发功能的 toast 提示
  private utils = new Utils();

  // 点击点赞按钮的回调函数
  /**
   * changeLikeCount：切换点赞状态并同步更新点赞数量。
   */
  private changeLikeCount() {
    // 分支说明：未点赞 → 计数 +1；已点赞 → 计数 -1（取消点赞）
    if (!this.isLike) {
      // 更新 likeCount
      this.likeCount++;
    } else {
      // 更新 likeCount
      this.likeCount--;
    }
    // 图标切换使用显式动画，时长与曲线取自统一配置
    animateTo({ duration: CONFIGURATION.TABCONTENT_OVERFLOW_DURATION, curve: Curve.EaseInOut }, () => {
      // 更新 isLike
      this.isLike = !this.isLike;
    })
  }

  // 点击收藏按钮的回调函数
  /**
   * changeFavoriteCount：切换收藏状态并同步更新收藏数量。
   */
  private changeFavoriteCount() {
    // 分支说明：未收藏 → 计数 +1；已收藏 → 计数 -1（取消收藏）
    if (!this.isFavorite) {
      // 更新 favoriteCount
      this.favoriteCount++;
    } else {
      // 更新 favoriteCount
      this.favoriteCount--;
    }
    // 图标切换使用显式动画，时长与曲线取自统一配置
    animateTo({ duration: CONFIGURATION.TABCONTENT_OVERFLOW_DURATION, curve: Curve.EaseInOut }, () => {
      // 更新 isFavorite
      this.isFavorite = !this.isFavorite;
    })
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   * 结构：RelativeContainer 内按 alignRules 依次纵向排布头像与各互动按钮。
   * 说明：所有按钮点击后统一调用 utils.showPromptAction 提示功能未开发。
   * 布局：头像位于顶部，其余按钮依次向下排列，整体右对齐。
   * 状态：点赞、收藏、关注均使用 @State 驱动图标切换与计数更新。
   * 样式：图标尺寸、圆角与间距均取自资源文件，便于统一调整。
   * 交互：点赞与收藏点击后带 EaseInOut 过渡动画。
   * 层级：各元素通过 alignRules 锚定前一个元素，形成自上而下的链条。
   * 备注：本组件不持有业务数据，仅负责展示与本地交互状态。
   */
  build() {
    // 右侧互动栏：头像、关注、点赞、评论、收藏、分享自上而下排列
    // RelativeContainer：相对布局容器
    // 关键属性：高度、宽度
    RelativeContainer() {
      // 用户头像：点击后弹出未开发功能提示
      // Image：图片
      // 关键属性：宽度、高度、圆角、边框
      Image(this.head)
        .width($r('app.integer.tabcontentoverflow_head_image_width'))
        .height($r('app.integer.tabcontentoverflow_head_image_height'))
        .borderRadius(CONFIGURATION.TABCONTENT_OVERFLOW_HEADIMAGE_BORDER_RADIUS)
        .border({
          // 字段 width：声明并维护该成员的状态
          width: $r('app.integer.tabcontentoverflow_head_image_border_width'),
          // 字段 color：声明并维护该成员的状态
          color: Color.White
        })
        .id(STRINGCONFIGURATION.TABCONTENT_OVERFLOW_HEAD_IMAGE)
        .alignRules({
          // 字段 top：声明并维护该成员的状态
          top: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_CONTAINER, align: VerticalAlign.Top },
          // 字段 left：声明并维护该成员的状态
          left: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_CONTAINER, align: HorizontalAlign.Start },
        })
        .margin({ left: CONFIGURATION.TABCONTENT_OVERFLOW_HEADIMAGE_MARGIN_LEFT })
        .onClick(() => {
          // 更新 utils
          this.utils.showPromptAction();
        })
      // 关注按钮：点击切换关注/已关注图标，并带过渡动画
      // Image：图片
      // 关键属性：宽度、高度、圆角、外边距
      Image(this.isFocus ? $r('app.media.tabcontentoverflow_follow') : $r('app.media.tabcontentoverflow_foucs_add'))
        .width($r('app.integer.tabcontentoverflow_focus_image_width'))
        .height($r('app.integer.tabcontentoverflow_focus_image_height'))
        .borderRadius($r('app.integer.tabcontentoverflow_focus_image_border_radius'))
        .margin({
          // 字段 top：声明并维护该成员的状态
          top: $r('app.integer.tabcontentoverflow_focus_image_margin'),
          // 字段 left：声明并维护该成员的状态
          left: $r('app.integer.tabcontentoverflow_focus_image_margin')
        })
        .onClick(() => {
          animateTo({ duration: CONFIGURATION.TABCONTENT_OVERFLOW_DURATION, curve: Curve.EaseInOut }, () => {
            // 更新 isFocus
            this.isFocus = !this.isFocus;
          })
        })
        .id(STRINGCONFIGURATION.TABCONTENT_OVERFLOW_FOCUS_IMAGE)
        .alignRules({
          // 字段 top：声明并维护该成员的状态
          top: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_HEAD_IMAGE, align: VerticalAlign.Bottom },
          // 字段 left：声明并维护该成员的状态
          left: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_HEAD_IMAGE, align: HorizontalAlign.Center },
        })
      // 点赞图标：点击切换点赞状态并更新计数
      // Image：图片
      // 关键属性：宽度、高度、objectFit、点击事件回调、changeLikeCount
      // 交互：可点击交互
      Image(this.isLike ? $r('app.media.tabcontentoverflow_fabulo') : $r('app.media.tabcontentoverflow_fabulous'))
        .width($r('app.integer.tabcontentoverflow_like_image_width'))
        .height($r('app.integer.tabcontentoverflow_like_image_height'))
        .objectFit(ImageFit.ScaleDown)
        .onClick(() => {
          // 更新 changeLikeCount
          this.changeLikeCount();
        })
        .id(STRINGCONFIGURATION.TABCONTENT_OVERFLOW_LIKE_IMAGE)
        .alignRules({
          // 字段 top：声明并维护该成员的状态
          top: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_FOCUS_IMAGE, align: VerticalAlign.Bottom },
          left: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_CONTAINER, align: HorizontalAlign.Start },
          right: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_CONTAINER, align: HorizontalAlign.End },
        })
        .margin({ top: $r('app.integer.tabcontentoverflow_like_image_margin_top') })
      // 点赞数量文本：展示当前点赞数
      // Text：文本
      // 关键属性：字号、字体颜色、透明度、文本对齐、相对对齐规则
      Text(this.likeCount.toString())
        .fontSize($r('app.integer.tabcontentoverflow_like_text_font_size'))
        .fontColor(Color.White)
        .opacity(CONFIGURATION.TABCONTENT_OVERFLOW_TEXT_OPACITY)
        .id(STRINGCONFIGURATION.TABCONTENT_OVERFLOW_LIKE_TEXT)
        .textAlign(TextAlign.Center)
        .alignRules({
          top: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_LIKE_IMAGE, align: VerticalAlign.Bottom },
          left: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_CONTAINER, align: HorizontalAlign.Start },
          right: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_CONTAINER, align: HorizontalAlign.End },
        })
        .margin({ top: $r('app.integer.tabcontentoverflow_like_text_margin_top') })
      // 评论图标：点击后弹出未开发功能提示
      // Image：图片
      // 关键属性：宽度、高度、objectFit、相对对齐规则
      Image($r('app.media.tabcontentoverflow_comment'))
        .width($r('app.integer.tabcontentoverflow_like_image_width'))
        .height($r('app.integer.tabcontentoverflow_like_image_height'))
        .objectFit(ImageFit.ScaleDown)
        .id(STRINGCONFIGURATION.TABCONTENT_OVERFLOW_COMMENT_IMAGE)
        .alignRules({
          top: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_LIKE_TEXT, align: VerticalAlign.Bottom },
          left: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_CONTAINER, align: HorizontalAlign.Start },
          right: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_CONTAINER, align: HorizontalAlign.End },
        })
        .margin({ top: $r('app.integer.tabcontentoverflow_like_image_margin_top') })
        .onClick(() => {
          this.utils.showPromptAction();
        })
      // 评论数量文本：展示当前评论数
      // Text：文本
      // 关键属性：字号、字体颜色、透明度、文本对齐、相对对齐规则
      Text(this.commentCount.toString())
        .fontSize($r('app.integer.tabcontentoverflow_like_text_font_size'))
        .fontColor(Color.White)
        .opacity(CONFIGURATION.TABCONTENT_OVERFLOW_TEXT_OPACITY)
        .id(STRINGCONFIGURATION.TABCONTENT_OVERFLOW_COMMENT_TEXT)
        .textAlign(TextAlign.Center)
        .alignRules({
          top: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_COMMENT_IMAGE, align: VerticalAlign.Bottom },
          left: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_CONTAINER, align: HorizontalAlign.Start },
          right: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_CONTAINER, align: HorizontalAlign.End },
        })
        .margin({ top: $r('app.integer.tabcontentoverflow_like_text_margin_top') })
      // 收藏图标：点击切换收藏状态并更新计数
      // Image：图片
      // 关键属性：宽度、高度、点击事件回调、changeFavoriteCount
      // 交互：可点击交互
      Image(this.isFavorite ? $r('app.media.tabcontentoverflow_highlightsed_yellow') : $r('app.media.tabcontentoverflow_highlightsed_white'))
        .width($r('app.integer.tabcontentoverflow_like_image_width'))
        .height($r('app.integer.tabcontentoverflow_like_image_height'))
        .onClick(() => {
          this.changeFavoriteCount();
        })
        .id(STRINGCONFIGURATION.TABCONTENT_OVERFLOW_FAVORITE_IMAGE)
        .alignRules({
          top: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_COMMENT_TEXT, align: VerticalAlign.Bottom },
          left: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_CONTAINER, align: HorizontalAlign.Start },
          right: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_CONTAINER, align: HorizontalAlign.End },
        })
        .margin({ top: $r('app.integer.tabcontentoverflow_like_image_margin_top') })
      // 收藏数量文本：展示当前收藏数
      // Text：文本
      // 关键属性：字号、字体颜色、透明度、文本对齐、相对对齐规则
      Text(this.favoriteCount.toString())
        .fontSize($r('app.integer.tabcontentoverflow_like_text_font_size'))
        .fontColor(Color.White)
        .opacity(CONFIGURATION.TABCONTENT_OVERFLOW_TEXT_OPACITY)
        .id(STRINGCONFIGURATION.TABCONTEN_TOVERFLOW_FAVORITE_TEXT)
        .textAlign(TextAlign.Center)
        .alignRules({
          top: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_FAVORITE_IMAGE, align: VerticalAlign.Bottom },
          left: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_CONTAINER, align: HorizontalAlign.Start },
          right: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_CONTAINER, align: HorizontalAlign.End },
        })
        .margin({ top: $r('app.integer.tabcontentoverflow_like_text_margin_top') })
      // 分享图标：点击后弹出未开发功能提示
      // Image：图片
      // 关键属性：宽度、高度、objectFit、相对对齐规则
      Image($r('app.media.tabcontentoverflow_share'))
        .width($r('app.integer.tabcontentoverflow_like_image_width'))
        .height($r('app.integer.tabcontentoverflow_like_image_height'))
        .objectFit(ImageFit.ScaleDown)
        .id(STRINGCONFIGURATION.TABCONTENT_OVERFLOW_SHARE_IMAGE)
        .alignRules({
          top: { anchor: STRINGCONFIGURATION.TABCONTEN_TOVERFLOW_FAVORITE_TEXT, align: VerticalAlign.Bottom },
          left: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_CONTAINER, align: HorizontalAlign.Start },
          right: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_CONTAINER, align: HorizontalAlign.End },
        })
        .margin({ top: $r('app.integer.tabcontentoverflow_like_image_margin_top') })
        .onClick(() => {
          this.utils.showPromptAction();
        })
      // 分享文本：展示「分享」字样
      // Text：文本
      // 关键属性：字号、字体颜色、透明度、文本对齐、相对对齐规则
      Text($r('app.string.tabcontentoverflow_share'))
        .fontSize($r('app.integer.tabcontentoverflow_like_text_font_size'))
        .fontColor(Color.White)
        .opacity(CONFIGURATION.TABCONTENT_OVERFLOW_TEXT_OPACITY)
        .id(STRINGCONFIGURATION.TABCONTENT_OVERFLOW_SHARE_TEXT)
        .textAlign(TextAlign.Center)
        .alignRules({
          top: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_SHARE_IMAGE, align: VerticalAlign.Bottom },
          left: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_CONTAINER, align: HorizontalAlign.Start },
          right: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_CONTAINER, align: HorizontalAlign.End },
        })
        .margin({ top: $r('app.integer.tabcontentoverflow_like_text_margin_top') })
    }.id('side_relative_container_1')
    // 互动栏整体高度与宽度由资源文件统一控制
    .height($r('app.integer.tabcontentoverflow_relativecontainer_height'))
    .width($r('app.integer.tabcontentoverflow_relativecontainer_width'))
  }
}

// 展示视频相关信息，比如视频作者的昵称、视频文案、搭配的音乐以及发布时间
/**
 * VideoDes：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct VideoDes {
  // 视频作者昵称
  @State name: string = STRINGCONFIGURATION.TABCONTENT_OVERFLOW_VIDEO_DES_NAME; // 昵称
  // 视频文案
  @State description: string = STRINGCONFIGURATION.TABCONTENT_OVERFLOW_VIDEO_DES_DESCRIPTION; // 文案
  // 上升热点文案
  @State hotspot: string = STRINGCONFIGURATION.TABCONTENT_OVERFLOW_VIDEO_DES_HOTSPOT; // 上升热点
  // 视频发布时间
  @State time: string = STRINGCONFIGURATION.TABCONTENT_OVERFLOW_VIDEO_DES_TIME; // 发布时间

  // 点击未开发功能按钮弹出提示函数
  /**
   * showPromptAction：弹出统一的「功能未开发」提示。
   */
  private showPromptAction() {
    // 统一提示文案：说明该功能仅为示例占位
    promptAction.showToast({
      message: $r('app.string.tabcontentoverflow_toast_message'),
      duration: CONFIGURATION.TABCONTENT_OVERFLOW_DURATION
    });
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   * 结构：RelativeContainer 内按 alignRules 依次纵向排布昵称、文案、时间与热点区域。
   * 说明：上升热点区域使用灰色半透明背景条作为底衬，右侧展示在线人数。
   * 布局：昵称位于顶部，其余文本依次向下排列，整体左对齐。
   * 状态：昵称、文案、热点与时间均为 @State，便于后续动态刷新。
   * 样式：字号与颜色均取自资源文件，保持与整体深色主题一致。
   */
  build() {
    // 视频信息区：作者昵称、文案、发布时间与上升热点自上而下排列
    // RelativeContainer：相对布局容器
    // 关键属性：高度
    RelativeContainer() {
      // 作者昵称文本
      // Text：文本
      // 关键属性：字号、字重、字体颜色、内边距
      Text(this.name)
        .fontSize($r('app.integer.tabcontentoverflow_name_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.White)
        .id(STRINGCONFIGURATION.TABCONTENT_OVERFLOW_NAME_TEXT)
        .padding({ left: $r('app.integer.tabcontentoverflow_name_text_margin_left') })
      // 视频文案文本：最多两行，超出省略
      // Text：文本
      // 关键属性：字号、字体颜色、最大行数、溢出处理、相对对齐规则
      Text(this.description)
        .fontSize($r('app.integer.tabcontentoverflow_des_text_font_size'))
        .fontColor(Color.White)
        .maxLines(CONFIGURATION.TABCONTENT_OVERFLOW_MAXLINE)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .id(STRINGCONFIGURATION.TABCONTENT_OVERFLOW_DESCRIPTION_TEXT)
        .alignRules({
          top: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_NAME_TEXT, align: VerticalAlign.Bottom },
          left: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_NAME_TEXT, align: HorizontalAlign.Start },
        })
        .margin({ top: $r('app.integer.tabcontentoverflow_des_text_margin_top') })
        .padding({ left: $r('app.integer.tabcontentoverflow_des_text_padding_left') })
      // 发布时间文本
      // Text：文本
      // 关键属性：字号、字体颜色、相对对齐规则
      Text(this.time)
        .fontSize($r('app.integer.tabcontentoverflow_time_text_font_size'))
        .fontColor($r('app.color.tabcontentoverflow_time_text_font_color'))
        .id(STRINGCONFIGURATION.TABCONTENT_OVERFLOW_TIME_TEXT)
        .alignRules({
          top: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_DESCRIPTION_TEXT, align: VerticalAlign.Bottom },
          left: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_DESCRIPTION_TEXT, align: HorizontalAlign.Start },
        })
        .padding({ left: $r('app.integer.tabcontentoverflow_des_text_padding_left') })
      // 灰色背景条：作为上升热点区域的底衬
      // Text：文本
      // 关键属性：宽度、高度、背景色、透明度、内边距
      Text()
        .width($r('app.string.tabcontentoverflow_full_size'))
        .height($r('app.integer.tabcontentoverflow_upgrade_height'))
        .backgroundColor($r('app.color.tabcontentoverflow_gray_background_color'))
        .opacity(CONFIGURATION.TABCONTENT_OVERFLOW_OPACITY)
        .padding({
          left: $r('app.integer.tabcontentoverflow_upgrade_padding'),
          right: $r('app.integer.tabcontentoverflow_upgrade_padding')
        })
        .margin({ top: $r('app.integer.tabcontentoverflow_gray_background_margin_top') })
        .id(STRINGCONFIGURATION.TABCONTENT_OVERFLOW_GRAY_BACKGROUND)
        .alignRules({
          top: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_TIME_TEXT, align: VerticalAlign.Bottom },
          left: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_TIME_TEXT, align: HorizontalAlign.Start },
        })
        .onClick(() => {
          this.showPromptAction();
        })
      // 上升热点图标
      // Image：图片
      // 关键属性：高度、宽度、相对对齐规则
      Image($r('app.media.tabcontentoverflow_upgrade_filled'))
        .height($r('app.integer.tabcontentoverflow_upgrade_icon_size'))
        .width($r('app.integer.tabcontentoverflow_upgrade_icon_size'))
        .id(STRINGCONFIGURATION.TABCONTENT_OVERFLOW_HOT_IMAGE)
        .alignRules({
          top: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_GRAY_BACKGROUND, align: VerticalAlign.Top },
          left: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_GRAY_BACKGROUND, align: HorizontalAlign.Start },
        })
        .margin({
          top: $r('app.integer.tabcontentoverflow_upgrade_filled_margin_top'),
          left: $r('app.integer.tabcontentoverflow_des_text_padding_left')
        })
        .onClick(() => {
          this.showPromptAction();
        })
      // 「上升热点」标题文本
      // Text：文本
      // 关键属性：字号、字体颜色、相对对齐规则
      Text($r('app.string.tabcontentoverflow_upgrade_hot'))
        .fontSize($r('app.integer.tabcontentoverflow_upgrade_text_font_size'))
        .fontColor($r('app.color.tabcontentoverflow_up_color'))
        .id(STRINGCONFIGURATION.TABCONTENT_OVERFLOW_HOT_TEXT)
        .alignRules({
          top: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_HOT_IMAGE, align: VerticalAlign.Top },
          left: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_HOT_IMAGE, align: HorizontalAlign.End },
        })
        .onClick(() => {
          this.showPromptAction();
        })
      // 热点内容文本：单行展示，超出省略
      // Text：文本
      // 关键属性：字号、字体颜色、溢出处理、相对对齐规则
      Text(this.hotspot)
        .fontSize($r('app.integer.tabcontentoverflow_mus_font_size'))
        .fontColor(Color.White)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .id(STRINGCONFIGURATION.TABCONTENT_OVERFLOW_HOT_SPOT)
        .alignRules({
          top: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_HOT_TEXT, align: VerticalAlign.Top },
          bottom: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_HOT_TEXT, align: VerticalAlign.Bottom },
          left: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_HOT_TEXT, align: HorizontalAlign.End },
        })
        .onClick(() => {
          this.showPromptAction();
        })
      // 在线人数右侧箭头图标
      // Image：图片
      // 关键属性：高度、宽度、相对对齐规则
      Image($r('app.media.tabcontentoverflow_arrow_right'))
        .height($r('app.integer.tabcontentoverflow_upgrade_icon_size'))
        .width($r('app.integer.tabcontentoverflow_upgrade_icon_size'))
        .id(STRINGCONFIGURATION.TABCONTENT_OVERFLOW_PEOPLE_NUMARROW)
        .alignRules({
          top: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_HOT_TEXT, align: VerticalAlign.Top },
          bottom: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_HOT_TEXT, align: VerticalAlign.Bottom },
          right: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_CONTAINER, align: HorizontalAlign.End },
        })
        .margin({ right: $r('app.integer.tabcontentoverflow_arrow_right_margin_right') })
        .onClick(() => {
          this.showPromptAction();
        })
      // 在线人数文本
      // Text：文本
      // 关键属性：字号、字体颜色、相对对齐规则
      Text($r('app.string.tabcontentoverflow_online_people'))
        .fontSize($r('app.integer.tabcontentoverflow_mus_font_size'))
        .fontColor(Color.White)
        .id(STRINGCONFIGURATION.TABCONTENT_OVERFLOW_PEOPLE_NUM)
        .alignRules({
          top: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_PEOPLE_NUMARROW, align: VerticalAlign.Top },
          bottom: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_PEOPLE_NUMARROW, align: VerticalAlign.Bottom },
          right: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_PEOPLE_NUMARROW, align: HorizontalAlign.Start },
        })
        .onClick(() => {
          this.showPromptAction();
        })
      // 竖分割线：分隔在线人数与右侧箭头
      // Divider：分割线
      // 关键属性：是否纵向、color、strokeWidth、高度、相对对齐规则
      Divider()
        .vertical(true)
        .color(Color.White)
        .strokeWidth(CONFIGURATION.TABCONTENT_OVERFLOW_ONE)
        .height($r('app.integer.tabcontentoverflow_upgrade_text_font_size'))
        .id(STRINGCONFIGURATION.TABCONTENT_OVERFLOW_DIVIDER)
        .alignRules({
          top: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_PEOPLE_NUMARROW, align: VerticalAlign.Top },
          bottom: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_PEOPLE_NUMARROW, align: VerticalAlign.Bottom },
          right: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_PEOPLE_NUM, align: HorizontalAlign.Start },
        })
        .margin({ right: $r('app.integer.tabcontentoverflow_divider_margin_right') })
        .onClick(() => {
          this.showPromptAction();
        })
    }.id('side_relative_container_2')
    // 视频信息区高度由资源文件统一控制
    .height($r('app.integer.tabcontentoverflow_video_des_relativecontainer_height'))
  }
}

// 顶部视图
/**
 * TopView：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct TopView {
  // 通用工具类实例：统一提供未开发功能的 toast 提示
  private utils = new Utils();

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   * 结构：RelativeContainer 内按 alignRules 排布搜索图标、四个页签与新增图标。
   * 说明：四个页签横向依次排列，选中项下方展示白色指示分割线。
   * 布局：搜索图标居左、新增图标居右，页签位于两者之间。
   * 交互：所有可点击元素均调用 utils.showPromptAction 提示功能未开发。
   * 样式：页签字号与宽度取自资源文件，选中项使用白色高亮。
   */
  build() {
    // 顶部导航区：搜索入口与「关注/精选/推荐/放映厅」页签
    // RelativeContainer：相对布局容器
    // 关键属性：高度
    RelativeContainer() {
      // 搜索图标：点击后弹出未开发功能提示
      // Image：图片
      // 关键属性：宽度、高度、相对对齐规则
      Image($r('app.media.tabcontentoverflow_search_icon'))
        .width($r('app.integer.tabcontentoverflow_search_icon_width'))
        .height($r('app.integer.tabcontentoverflow_search_icon_height'))
        .id(STRINGCONFIGURATION.TABCONTENT_OVERFLOW_SEARCH_IMAGE)
        .alignRules({
          top: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_CONTAINER, align: VerticalAlign.Top },
          left: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_CONTAINER, align: HorizontalAlign.Start },
        })
        .margin({
          top: $r('app.integer.tabcontentoverflow_search_image_margin'),
          left: $r('app.integer.tabcontentoverflow_search_image_margin')
        })
        .onClick(() => {
          this.utils.showPromptAction();
        })
      // 「关注」页签文本
      // Text：文本
      // 关键属性：字体颜色、字号、宽度、相对对齐规则
      Text($r('app.string.tabcontentoverflow_focus'))
        .fontColor($r('app.color.tabcontentoverflow_font_color'))
        .fontSize($r('app.integer.tabcontentoverflow_tab_font_size'))
        .width($r('app.string.tabcontentoverflow_focus_width'))
        .id(STRINGCONFIGURATION.TABCONTENT_OVERFLOW_FOLLOW_TEXT)
        .alignRules({
          top: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_SEARCH_IMAGE, align: VerticalAlign.Top },
          left: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_SEARCH_IMAGE, align: HorizontalAlign.End },
        })
        .textAlign(TextAlign.Center)
        .margin({ left: $r('app.integer.tabcontentoverflow_search_image_margin') })
        .onClick(() => {
          this.utils.showPromptAction();
        })
      // 「精选」页签文本：当前选中项，使用白色高亮
      // Text：文本
      // 关键属性：字体颜色、字号、宽度、文本对齐、相对对齐规则
      Text($r('app.string.tabcontentoverflow_selected'))
        .fontColor(Color.White)
        .fontSize($r('app.integer.tabcontentoverflow_tab_font_size'))
        .width($r('app.string.tabcontentoverflow_focus_width'))
        .id(STRINGCONFIGURATION.TABCONTENT_OVERFLOW_SELECTED_TEXT)
        .textAlign(TextAlign.Center)
        .alignRules({
          top: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_FOLLOW_TEXT, align: VerticalAlign.Top },
          left: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_FOLLOW_TEXT, align: HorizontalAlign.End },
        })
        .onClick(() => {
          this.utils.showPromptAction();
        })
      // 「推荐」页签文本
      // Text：文本
      // 关键属性：字体颜色、字号、宽度、文本对齐、相对对齐规则
      Text($r('app.string.tabcontentoverflow_recommendation'))
        .fontColor($r('app.color.tabcontentoverflow_font_color'))
        .fontSize($r('app.integer.tabcontentoverflow_tab_font_size'))
        .width($r('app.string.tabcontentoverflow_focus_width'))
        .id(STRINGCONFIGURATION.TABCONTENT_OVERFLOW_RECOMMENDATION_TEXT)
        .textAlign(TextAlign.Center)
        .alignRules({
          top: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_SELECTED_TEXT, align: VerticalAlign.Top },
          left: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_SELECTED_TEXT, align: HorizontalAlign.End },
        })
        .onClick(() => {
          this.utils.showPromptAction();
        })
      // 「放映厅」页签文本
      // Text：文本
      // 关键属性：字体颜色、字号、宽度、文本对齐、相对对齐规则
      Text($r('app.string.tabcontentoverflow_screeninghall'))
        .fontColor($r('app.color.tabcontentoverflow_font_color'))
        .fontSize($r('app.integer.tabcontentoverflow_tab_font_size'))
        .width($r('app.string.tabcontentoverflow_focus_width'))
        .id(STRINGCONFIGURATION.TABCONTENT_OVERFLOW_SCREENINGHALL_TEXT)
        .textAlign(TextAlign.Center)
        .alignRules({
          top: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_RECOMMENDATION_TEXT, align: VerticalAlign.Top },
          left: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_RECOMMENDATION_TEXT, align: HorizontalAlign.End },
        })
        .margin({ right: $r('app.integer.tabcontentoverflow_search_image_margin') })
        .onClick(() => {
          this.utils.showPromptAction();
        })
      // 选中页签下方的指示分割线
      // Divider：分割线
      // 关键属性：宽度、strokeWidth、color、外边距
      Divider()
        .width($r('app.integer.tabcontentoverflow_tab_divider_width'))
        .strokeWidth(CONFIGURATION.TABCONTENT_OVERFLOW_TWO)
        .color(Color.White)
        .margin({
          top: $r('app.integer.tabcontentoverflow_divider_margin_top')
        })
        .id(STRINGCONFIGURATION.TABCONTENT_OVERFLOW_TOPVIEW_DIVIDER)
        .alignRules({
          top: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_SELECTED_TEXT, align: VerticalAlign.Bottom },
          left: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_SELECTED_TEXT, align: HorizontalAlign.Center },
        })
        .margin({
          top: $r('app.integer.tabcontentoverflow_top_view_divider_margin_top'),
          left: $r('app.integer.tabcontentoverflow_top_view_divider_margin_left')
        })
      // 右上角新增图标：点击后弹出未开发功能提示
      // Image：图片
      // 关键属性：宽度、高度、相对对齐规则
      Image($r('app.media.tabcontentoverflow_add'))
        .width($r('app.integer.tabcontentoverflow_search_icon_width'))
        .height($r('app.integer.tabcontentoverflow_search_icon_height'))
        .id(STRINGCONFIGURATION.TABCONTENT_OVERFLOW_ADD_IMAGE)
        .alignRules({
          top: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_CONTAINER, align: VerticalAlign.Top },
          right: { anchor: STRINGCONFIGURATION.TABCONTENT_OVERFLOW_CONTAINER, align: HorizontalAlign.End },
        })
        .margin({
          top: $r('app.integer.tabcontentoverflow_search_image_margin'),
          right: $r('app.integer.tabcontentoverflow_search_image_margin')
        })
        .onClick(() => {
          this.utils.showPromptAction();
        })
    }.id('side_relative_container_3')
    // 顶部导航区高度由资源文件统一控制
    .height($r('app.integer.tabcontentoverflow_top_view_relativecontainer_height'))
  }
}