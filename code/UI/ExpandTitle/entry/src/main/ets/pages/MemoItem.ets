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
 * @file entry/src/main/ets/pages/MemoItem.ets
 * 文件职责：MemoItem 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：MemoItem、memoTextExpand。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { MEMO_DATA } from './MockData';
import { MemoInfo } from './MemoInfo';
import Constants from '../constants/Constants';

/**
 * 笔记内容视图
 *
 */
/**
 * MemoItem：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export default struct MemoItem {
  // @State memoItem：组件内部状态
  @State memoItem: MemoInfo = MEMO_DATA[0];

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Row：水平布局容器
    // 关键属性：高度、背景色、宽度、主轴对齐、圆角、内边距
    Row() {
      // Column：垂直布局容器
      // 关键属性：交叉轴对齐、宽度
      Column({ space: Constants.MEMO_COL_SPACE }) {
        // Text：文本
        // 关键属性：字号、memoTextExpand、字体颜色
        Text(this.memoItem.title).id('memo_item_text_2')
          .fontSize($r('app.float.expanded_title_font_size_normal'))
          .memoTextExpand()
          .fontColor($r('app.color.expanded_title_font_color_light_dark'))
        // Text：文本
        // 关键属性：字号、memoTextExpand、外边距、字体颜色
        Text(this.memoItem.content).id('memo_item_text_3')
          .fontSize($r('app.float.expanded_title_font_size_smaller'))
          .memoTextExpand()
          .margin({ top: $r('app.string.expanded_title_layout_10'), bottom: $r('app.string.expanded_title_layout_10') })
          .fontColor($r('app.color.expanded_title_font_color_light_dark'))
        // Text：文本
        // 关键属性：字号、memoTextExpand、字体颜色
        Text(this.memoItem.time).id('memo_item_text_4')
          .fontSize($r('app.float.expanded_title_font_size_smaller'))
          .memoTextExpand()
          .fontColor(Color.Grey)
      }.id('memo_item_column_1')
      .alignItems(HorizontalAlign.Start)
      .width($r('app.string.expanded_title_layout_70_percent'))

      // Image：图片
      // 关键属性：宽度、aspectRatio、圆角
      Image($r(this.memoItem.imageSrc)).id('memo_item_image_5')
        .width($r('app.string.expanded_title_layout_90'))
        .aspectRatio(Constants.MEMO_IMAGE_ASPECT_RATIO)
        .borderRadius($r('app.string.expanded_title_layout_10'))

    }.id('memoItem_' + this.memoItem.memoId)
    .height($r('app.string.expanded_title_layout_110'))
    .backgroundColor($r('app.color.expanded_title_list_item_normal_color'))
    .width($r('app.string.expanded_title_layout_100_percent'))
    .justifyContent(FlexAlign.SpaceBetween)
    .borderRadius($r('app.float.expanded_title_list_item_border_radius'))
    .padding({ left: $r('app.float.expanded_title_list_item_padding'), right: $r('app.float.expanded_title_list_item_padding') })
  }
}

/**
 * memoTextExpand：函数定义，承载本文件对应的逻辑与数据。
 */
@Extend(Text)
function memoTextExpand() {
  .textOverflow({ overflow: TextOverflow.Ellipsis })
  .maxLines(Constants.MAX_TEXT_LINES)
}
