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
 * @file casesfeature/citysearch/src/main/ets/view/SearchView.ets
 * 文件职责：SearchView 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：SearchView。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

/**
 * SearchView：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct SearchView {
  // List组件里可以绑定的可滚动组件的控制器
  private scroller: Scroller = new Scroller();

  // 搜索列表
  // @Link searchList：与父组件双向绑定的状态
  @Link searchList: string[];

  // 选定的城市
  // @Link changeValue：与父组件双向绑定的状态
  @Link changeValue: string;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Stack：层叠布局容器
    // 关键属性：宽度、高度、布局权重
    // Stack：层叠布局容器
    // 关键属性：宽度、高度、布局权重
    Stack({ alignContent: Alignment.TopEnd }) {
      // List：列表容器
      // 关键属性：布局权重、边缘效果、分割线
      // List：列表容器
      // 关键属性：布局权重、边缘效果、分割线
      List({ space: 14, initialIndex: 0, scroller: this.scroller }) {
        ForEach(this.searchList, (item: string) => {
          // ListItem：列表项
          ListItem() {
            // Column：垂直布局容器
            // 关键属性：点击事件回调
            // 交互：可点击交互
            // Column：垂直布局容器
            // 关键属性：点击事件回调
            // 交互：可点击交互
            Column() {
              // Text：文本
              // 关键属性：高度、字号、点击事件回调
              // 交互：可点击交互
              // Text：文本
              // 关键属性：高度、字号、点击事件回调
              // 交互：可点击交互
              Text(item)
                .height(30)
                .fontSize(14)
                .id('searchItem_' + item)
            }.id('search_view_column_4').onClick(() => {
              this.changeValue = item;
            })
          }.id('search_view_list_item_3')
        })
      }.id('search_view_list_2')
      .layoutWeight(1)
      .edgeEffect(EdgeEffect.None)
      .divider({
        strokeWidth: $r('app.integer.citysearch_divider_strokeWidth'),
        color: $r('app.color.citysearch_divider_color'),
        startMargin: $r('app.integer.citysearch_divider_start'),
        endMargin: $r('app.integer.citysearch_divider_end')
      })
      .listDirection(Axis.Vertical)
      .sticky(StickyStyle.Header)
    }.id('search_view_stack_1')
    .width('100%')
    .height('100%')
    .layoutWeight(1)
  }
}