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

/**
 * 结果列表：每个演示页把"刚刚调了什么、结果如何"按行铺开。
 * 用统一的 ResultRow 承载，页面不需要各自拼颜色与缩进。
 */

import { AppColors, AppRadius, AppSpacing, AppText } from '../common/Theme';
import { WidgetTone, toneSoftColor, toneTextColor } from './CommonWidgets';

export class ResultRow {
  title: string;
  detail: string;
  tone: WidgetTone;

  constructor(title: string, detail: string, tone: WidgetTone) {
    this.title = title;
    this.detail = detail;
    this.tone = tone;
  }
}

/** 成功用绿、失败用红、待定用中性；与 CommonWidgets 的 tone 映射共用一套颜色 */
export function rowOf(ok: boolean, title: string, detail: string): ResultRow {
  return new ResultRow(title, detail, ok ? WidgetTone.SUCCESS : WidgetTone.DANGER);
}

@Component
export struct ResultList {
  @Prop rows: ResultRow[] = [];
  @Prop emptyText: string = '还没有调用记录';
  @Prop maxRows: number = 8;

  private visible(): ResultRow[] {
    return this.rows.slice(0, this.maxRows);
  }

  build() {
    Column({ space: AppSpacing.SM }) {
      if (this.rows.length === 0) {
        Text(this.emptyText)
          .fontSize(AppText.BODY)
          .fontColor(AppColors.TEXT_MUTED)
          .width('100%')
      } else {
        ForEach(this.visible(), (row: ResultRow, index: number) => {
          Column({ space: 2 }) {
            Text(row.title)
              .fontSize(AppText.LABEL)
              .fontColor(toneTextColor(row.tone))
              .width('100%')
            if (row.detail.length > 0) {
              Text(row.detail)
                .fontSize(AppText.SMALL)
                .fontColor(AppColors.TEXT_SECONDARY)
                .width('100%')
            }
          }
          .width('100%')
          .alignItems(HorizontalAlign.Start)
          .padding(AppSpacing.MD)
          .backgroundColor(toneSoftColor(row.tone))
          .borderRadius(AppRadius.SMALL)
        }, (row: ResultRow, index: number) => `${index}-${row.title}`)
      }
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }
}
