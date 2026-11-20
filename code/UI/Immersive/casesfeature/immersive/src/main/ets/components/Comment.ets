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
 * @file casesfeature/immersive/src/main/ets/components/Comment.ets
 * 文件职责：Comment 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：Comment。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { Constants } from '../common/Constants';
import { promptAction, window } from '@kit.ArkUI';
import { CommentDataSource } from '../model/CommentDataSource';

/**
 * Comment：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct Comment {
  close: () => void = () => {
  };
  private data: CommentDataSource = new CommentDataSource([]);
  private scroller: Scroller = new Scroller();

  // @State bottomHeight：组件内部状态
  @State bottomHeight: number = 0;

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear(): void {
    // 获取导航条高度，手动进行避让
    window.getLastWindow(getContext(), (err, data) => {
      const avoidAreaBottom = data.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR);
      this.bottomHeight = avoidAreaBottom.bottomRect.height;
    })
    // 加载示例评论
    for (let i = 0; i < Constants.TEST_COMMENTS_COUNT; i++) {
      this.data.pushItem(i);
    }
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度
    // Column：垂直布局容器
    // 关键属性：宽度、高度
    Column() {
      // title
      // Row：水平布局容器
      // 关键属性：宽度、高度、主轴对齐、内边距
      // Row：水平布局容器
      // 关键属性：宽度、高度、主轴对齐、内边距
      Row() {
        // Blank：占位空白
        // 关键属性：宽度
        // Blank：占位空白
        // 关键属性：宽度
        Blank().id('comment_blank_3')
          .width($r('app.integer.immersive_comment_title_blank_width'))
        // Text：文本
        // 关键属性：字号、字重、宽度、文本对齐
        // Text：文本
        // 关键属性：字号、字重、宽度、文本对齐
        Text($r('app.string.immersive_comment_title_label'))
          .fontSize($r('app.integer.immersive_comment_title_font_size'))
          .fontWeight(FontWeight.Bold)
          .width($r('app.integer.immersive_comment_title_font_width'))
          .textAlign(TextAlign.Center)
          .id('commentTitle')
        // Row：水平布局容器
        // 关键属性：宽度、高度、主轴对齐、点击事件回调
        // 交互：可点击交互
        // Row：水平布局容器
        // 关键属性：宽度、高度、主轴对齐、点击事件回调
        // 交互：可点击交互
        Row() {
          // Image：图片
          // 关键属性：宽度、高度
          // Image：图片
          // 关键属性：宽度、高度
          Image($r('app.media.immersive_close')).id('comment_image_4')
            .width($r('app.integer.immersive_comment_title_close_img_size'))
            .height($r('app.integer.immersive_comment_title_close_img_size'))
        }
        .width($r('app.integer.immersive_comment_title_close_button_width'))
        .height($r('app.integer.immersive_comment_title_close_button_height'))
        .justifyContent(FlexAlign.Center)
        .onClick(this.close)
        .id('close_button')
      }.id('comment_row_2')
      .width($r('app.string.immersive_full_size'))
      .height($r('app.integer.immersive_comment_title_height'))
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({
        left: $r('app.integer.immersive_comment_padding'),
        right: $r('app.integer.immersive_comment_padding')
      })

      // commets list
      // List：列表容器
      // 关键属性：宽度
      // List：列表容器
      // 关键属性：宽度
      List({ space: Constants.COMMENT_SPACE, scroller: this.scroller }) {
        // TODO: 高性能知识点: LazyForEach按需加载，提高加载性能。
        LazyForEach(this.data, (item: number, index: number) => {
          // ListItem：列表项
          // 关键属性：外边距、totalCount、function toString() { [native code] }
          // ListItem：列表项
          // 关键属性：外边距、totalCount、function toString() { [native code] }
          ListItem() {
            this.commentItem(index + 1) // index from 1
          }.id('comment_list_item_6')
          .margin({ bottom: index === this.data.totalCount() - 1 ? px2vp(this.bottomHeight) : 0 })
        }, (item: number) => item.toString())
      }.id('comment_list_5')
      .width($r('app.string.immersive_full_size'))
      // TODO: 高性能知识点: 使用了cachedCount设置预加载的评论，提高快速滑动时的性能。
      .cachedCount(Constants.COMMENTS_LIST_CACHE)
      .padding({
        left: $r('app.integer.immersive_comment_padding'),
        right: $r('app.integer.immersive_comment_padding')
      })
      .edgeEffect(EdgeEffect.Spring)
      .layoutWeight(1) // 自适应布局
      .id('commentList')
    }.id('comment_column_1')
    .width($r('app.string.immersive_full_size'))
    .height($r('app.string.immersive_full_size'))
  }

  /**
   * commentItem：执行 commentItem 相关逻辑。
   */
  @Builder
  commentItem(index: number) {
    // Row：水平布局容器
    // 关键属性：交叉轴对齐、宽度
    // Row：水平布局容器
    // 关键属性：交叉轴对齐、宽度
    Row({ space: Constants.COMMENT_ITEM_SPACE }) {
      // Image：图片
      // 关键属性：宽度、高度、圆角
      // Image：图片
      // 关键属性：宽度、高度、圆角
      Image($r('app.media.immersive_portrait_1')).id('comment_image_7')
        .width($r('app.integer.immersive_comment_portrait_size'))
        .height($r('app.integer.immersive_comment_portrait_size'))
        .borderRadius($r('app.integer.immersive_comment_portrait_radius'))

      // Column：垂直布局容器
      // 关键属性：布局权重、交叉轴对齐
      // Column：垂直布局容器
      // 关键属性：布局权重、交叉轴对齐
      Column({ space: Constants.COMMENT_CONTENT_SPACE }) {
        // id
        // Text：文本
        // 关键属性：字号、字体颜色
        // Text：文本
        // 关键属性：字号、字体颜色
        Text(Constants.COMMENTS_DEFAULT_USERNAME + index.toString()).id('comment_text_9')
          .fontSize($r('app.integer.immersive_comment_username_font_size'))
          .fontColor(Color.Gray)
        // comment
        // Text：文本
        Text($r('app.string.immersive_comment_example')).id('comment_text_10')
        // comment image
        // Image：图片
        // 关键属性：宽度、高度、圆角
        // Image：图片
        // 关键属性：宽度、高度、圆角
        Image($r('app.media.immersive_comment_pic')).id('comment_image_11')
          .width($r('app.integer.immersive_comment_image_size'))
          .height($r('app.integer.immersive_comment_image_size'))
          .borderRadius($r('app.integer.immersive_comment_image_radius'))
        // Row：水平布局容器
        // 关键属性：宽度
        // Row：水平布局容器
        // 关键属性：宽度
        Row() {
          // Text：文本
          // 关键属性：字号、字体颜色
          // Text：文本
          // 关键属性：字号、字体颜色
          Text($r('app.string.immersive_comment_time')).id('comment_text_13')
            .fontSize($r('app.integer.immersive_comment_time_font_size'))
            .fontColor(Color.Gray)
          // Blank：占位空白
          // 关键属性：宽度
          // Blank：占位空白
          // 关键属性：宽度
          Blank().id('comment_blank_14')
            .width($r('app.integer.immersive_comment_info_blank_width'))
          // Text：文本
          // 关键属性：字号、字体颜色、点击事件回调、showToast
          // 交互：可点击交互
          // Text：文本
          // 关键属性：字号、字体颜色、点击事件回调、showToast
          // 交互：可点击交互
          Text($r('app.string.immersive_comment_reply_label')).id('comment_text_15')
            .fontSize($r('app.integer.immersive_comment_reply_font_size'))
            .fontColor($r('app.color.immersive_comment_reply_font_color'))
            .onClick(() => {
              promptAction.showToast({ message: $r('app.string.immersive_mode_other_function') });
            })
          // Blank：占位空白
          Blank().id('comment_blank_16')
          // Image：图片
          // 关键属性：宽度、高度、点击事件回调、showToast
          // 交互：可点击交互
          // Image：图片
          // 关键属性：宽度、高度、点击事件回调、showToast
          // 交互：可点击交互
          Image($r('app.media.immersive_like')).id('comment_image_17')
            .width($r('app.integer.immersive_comment_like_icon_size'))
            .height($r('app.integer.immersive_comment_like_icon_size'))
            .onClick(() => {
              promptAction.showToast({ message: $r('app.string.immersive_mode_other_function') });
            })
        }.id('comment_row_12')
        .width($r('app.string.immersive_full_size'))

      }.id('comment_column_8')
      .layoutWeight(1) // 自适应布局
      .alignItems(HorizontalAlign.Start)
    }
    .alignItems(VerticalAlign.Top)
    .width($r('app.string.immersive_full_size'))
    .id(`commentItem${index}`)
  }
}
