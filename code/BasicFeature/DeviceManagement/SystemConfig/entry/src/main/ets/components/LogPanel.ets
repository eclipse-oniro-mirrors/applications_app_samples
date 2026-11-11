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
 * 日志面板组件。
 * 显示操作日志列表，支持自动滚动到最新日志。
 */
@Component
export struct LogPanel {
  /** 日志标题 */
  @Prop panelTitle: ResourceStr = $r('app.string.log_panel_title');
  /** 日志条目列表 */
  @Prop logs: string[] = [];
  /** 面板最大高度 */
  @Prop maxHeight: number = 200;

  /** 日志滚动控制器 */
  private logScroller: Scroller = new Scroller();

  build() {
    Column() {
      // 面板标题
      Row() {
        Text(this.panelTitle)
          .fontSize(PageConstants.FONT_SIZE_SUBTITLE)
          .fontWeight(PageConstants.FONT_WEIGHT_BOLD)
          .fontColor(PageConstants.COLOR_TEXT_PRIMARY)

        Blank()

        Text($r('app.string.log_count', this.logs.length))
          .fontSize(PageConstants.FONT_SIZE_SMALL)
          .fontColor(PageConstants.COLOR_TEXT_HINT)
      }
      .width('100%')
      .padding({ left: PageConstants.CARD_PADDING, right: PageConstants.CARD_PADDING, top: 8, bottom: 8 })

      Divider()
        .color('#E0E0E0')

      // 日志列表区域
      if (this.logs.length === 0) {
        Column() {
          Text($r('app.string.log_empty'))
            .fontSize(PageConstants.FONT_SIZE_BODY)
            .fontColor(PageConstants.COLOR_TEXT_HINT)
        }
        .width('100%')
        .height(80)
        .justifyContent(FlexAlign.Center)
      } else {
        List({ scroller: this.logScroller }) {
          ForEach(this.logs, (logItem: string, index: number) => {
            ListItem() {
              Text(logItem)
                .fontSize(PageConstants.FONT_SIZE_SMALL)
                .fontColor(PageConstants.COLOR_TEXT_SECONDARY)
                .width('100%')
                .padding({
                  left: PageConstants.CARD_PADDING,
                  right: PageConstants.CARD_PADDING,
                  top: 6,
                  bottom: 6
                })
                .backgroundColor(index % 2 === 0 ? '#FAFAFA' : PageConstants.COLOR_CARD)
            }
          }, (logItem: string, index: number) => `${index}_${logItem}`)
        }
        .width('100%')
        .height(this.maxHeight)
        .onAppear(() => {
          // 滚动到最新日志
          if (this.logs.length > 0) {
            this.logScroller.scrollToIndex(this.logs.length - 1);
          }
        })
      }
    }
    .width('100%')
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
