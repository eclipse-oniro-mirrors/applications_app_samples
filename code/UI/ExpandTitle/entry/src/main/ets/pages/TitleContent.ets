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
 * @file entry/src/main/ets/pages/TitleContent.ets
 * 文件职责：TitleContent 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：titleContent、TitleContent。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { MemoDataSource } from './DataSource';
import { MemoInfo } from './MemoInfo';
import MemoItem from './MemoItem';
import { promptAction } from '@kit.ArkUI';

/**
 * titleContent：函数定义，承载本文件对应的逻辑与数据。
 */
@Builder
export function titleContent() {
  // TitleContent：TitleContent 自定义组件
  /**
   * TitleContent：执行 TitleContent 相关逻辑。
   */
  TitleContent().id('title_content_title_content_1');
}

/**
 * 页面内容
 */
/**
 * TitleContent：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
struct TitleContent {

  // 懒加载模拟数据源
  // @State memoData：组件内部状态
  @State memoData: MemoDataSource = new MemoDataSource();

  // 滚动控制器
  private scroller: ListScroller = new ListScroller();

  // toast弹窗时长
  private toastDuration: number = 2000;
  private searchMemoSpace: number = 12;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // List：列表容器
    // 关键属性：外边距、宽度
    List({ space: this.searchMemoSpace, scroller: this.scroller }) {
      // ListItem：列表项
      ListItem() {
        // Search：搜索框
        // 关键属性：宽度、高度、背景色
        Search({ placeholder: $r('app.string.expanded_title_search_placeholder') })
          .width($r('app.string.expanded_title_layout_100_percent'))
          .height($r('app.string.expanded_title_layout_8_percent'))
          .backgroundColor(Color.White)
          .id('memoSearch')
      }.id('title_content_list_item_2')

      // TODO: 性能知识点：动态加载数据场景可以使用LazyForEach遍历数据。参考资料：
      // https://gitee.com/openharmony/docs/blob/OpenHarmony-5.0.0-Release/zh-cn/application-dev/quick-start/arkts-rendering-control-lazyforeach.md
      LazyForEach(this.memoData, (item: MemoInfo) => {
        // ListItem：列表项
        // 关键属性：点击事件回调、showToast
        // 交互：可点击交互
        ListItem() {
          // MemoItem：MemoItem 自定义组件
          MemoItem({ memoItem: item }).id('title_content_memo_item_4')
        }.id('title_content_list_item_3')
        .onClick(() => {
          promptAction.showToast({
            message: $r('app.string.expanded_title_toast_hint_message'),
            duration: this.toastDuration
          });
        })
      }, (item: MemoInfo) => JSON.stringify(item))
    }.id('memoList')
    .margin({ left: $r('app.string.expanded_title_layout_10'), right: $r('app.string.expanded_title_layout_10') })
    .width($r('app.string.expanded_title_layout_90_percent'))
  }
}