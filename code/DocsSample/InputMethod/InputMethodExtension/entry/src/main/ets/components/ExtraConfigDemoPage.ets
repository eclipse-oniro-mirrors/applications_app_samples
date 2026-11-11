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
 * 演示页二：输入法扩展信息（@ohos.inputMethod.ExtraConfig）。
 *
 * 页面把"编辑框交给输入法的 customSettings"完整走一遍：构造、按 UTF-8 算 32KB 额度、
 * 用打桩编辑框属性复现输入法侧读取、JSON 往返。所有按钮都是本地计算，
 * 不打到系统服务，因此结果可以逐条复算；真实取值时刻写进页头说明，不假装拿到过。
 */

import { AppColors, AppSpacing, AppText } from '../common/Theme';
import { EXTRA_CONFIG_MAX_BYTES } from '../common/AppConstants';
import { ConfigEntry, buildExtraConfig, configByteLength, defaultEntries } from '../model/ExtraConfigModel';
import { CallOutcome } from '../model/CallOutcome';
import { ActionButton, KeyValueRow, SectionCard, WidgetTone } from './CommonWidgets';
import { ResultList, ResultRow } from './ResultList';
import { LogPanel } from './LogPanel';
import { outcomeRow, outcomeRows } from './OutcomeView';
import {
  buildDefaultOutcome,
  nearLimitOutcome,
  oversizedOutcome,
  readAbsentOutcome,
  readStubOutcome,
  roundTripOutcome
} from '../utils/ExtraConfigSession';
import { Logger } from '../utils/Logger';

const LOG_SOURCE: string = 'ExtraConfig';
const MAX_ROWS: number = 10;

@Component
export struct ExtraConfigDemoPage {
  private entries: ConfigEntry[] = defaultEntries();
  @State bytes: number = 0;
  @State rows: ResultRow[] = [];

  aboutToAppear(): void {
    this.bytes = configByteLength(buildExtraConfig(this.entries));
    this.rows = outcomeRows([buildDefaultOutcome()]);
    Logger.info(LOG_SOURCE, 'Page', `page shown, default ${this.entries.length} entries / ${this.bytes} bytes`);
  }

  private push(outcome: CallOutcome): void {
    Logger.info(LOG_SOURCE, outcome.api, outcome.describe());
    const next: ResultRow[] = [outcomeRow(outcome)];
    for (let i = 0; i < this.rows.length && i < MAX_ROWS - 1; i++) {
      next.push(this.rows[i]);
    }
    this.rows = next;
  }

  @Builder
  entryRow(entry: ConfigEntry) {
    Row({ space: AppSpacing.MD }) {
      Text(entry.key)
        .fontSize(AppText.SMALL)
        .fontColor(AppColors.TEXT_TERTIARY)
        .fontFamily('monospace')
        .width(120)
      Text(`${entry.value}`)
        .fontSize(AppText.BODY)
        .fontColor(AppColors.TEXT_STRONG)
        .layoutWeight(1)
      Text(entry.typeName())
        .fontSize(AppText.CAPTION)
        .fontColor(AppColors.PRIMARY)
        .backgroundColor(AppColors.PRIMARY_SOFT)
        .borderRadius(4)
        .padding({ left: 6, right: 6, top: 2, bottom: 2 })
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  callButtons() {
    Column({ space: AppSpacing.MD }) {
      Row({ space: AppSpacing.MD }) {
        ActionButton({
          label: $r('app.string.extra_btn_default'),
          tone: WidgetTone.PRIMARY,
          onAction: () => {
            this.push(buildDefaultOutcome());
          }
        })
        ActionButton({
          label: $r('app.string.extra_btn_read_stub'),
          tone: WidgetTone.PRIMARY,
          onAction: () => {
            this.push(readStubOutcome());
          }
        })
      }
      .width('100%')

      Row({ space: AppSpacing.MD }) {
        ActionButton({
          label: $r('app.string.extra_btn_read_absent'),
          tone: WidgetTone.NEUTRAL,
          onAction: () => {
            this.push(readAbsentOutcome());
          }
        })
        ActionButton({
          label: $r('app.string.extra_btn_near_limit'),
          tone: WidgetTone.NEUTRAL,
          onAction: () => {
            this.push(nearLimitOutcome());
          }
        })
      }
      .width('100%')

      Row({ space: AppSpacing.MD }) {
        ActionButton({
          label: $r('app.string.extra_btn_oversized'),
          tone: WidgetTone.WARNING,
          onAction: () => {
            this.push(oversizedOutcome());
          }
        })
        ActionButton({
          label: $r('app.string.extra_btn_round_trip'),
          tone: WidgetTone.NEUTRAL,
          onAction: () => {
            this.push(roundTripOutcome());
          }
        })
      }
      .width('100%')
    }
    .width('100%')
  }

  build() {
    Scroll() {
      Column({ space: AppSpacing.LG }) {
        Text($r('app.string.extra_intro_note'))
          .fontSize(AppText.CAPTION)
          .fontColor(AppColors.TEXT_MUTED)
          .width('100%')

        SectionCard({ title: $r('app.string.extra_section_entries'),
          subtitle: $r('app.string.common_count_items', this.entries.length) }) {
          Column({ space: AppSpacing.MD }) {
            ForEach(this.entries, (entry: ConfigEntry) => {
              this.entryRow(entry)
            }, (entry: ConfigEntry) => entry.key)
            KeyValueRow({
              label: $r('app.string.extra_bytes_limit'),
              value: $r('app.string.extra_bytes_value', this.bytes),
              mono: true
            })
            Text($r('app.string.extra_type_note', EXTRA_CONFIG_MAX_BYTES))
              .fontSize(AppText.CAPTION)
              .fontColor(AppColors.TEXT_MUTED)
              .width('100%')
          }
          .width('100%')
        }

        SectionCard({ title: $r('app.string.extra_section_call'), subtitle: $r('app.string.extra_call_subtitle') }) {
          this.callButtons()
        }

        SectionCard({ title: $r('app.string.common_section_result'),
          subtitle: $r('app.string.common_result_subtitle') }) {
          ResultList({ rows: this.rows, emptyText: $r('app.string.extra_result_empty') })
        }

        LogPanel({ title: $r('app.string.page_log_title'), filterSource: LOG_SOURCE })
      }
      .width('100%')
      .padding(AppSpacing.PAGE)
    }
    .width('100%')
    .height('100%')
    .align(Alignment.TopStart)
    .scrollBar(BarState.Auto)
    .backgroundColor(AppColors.PAGE_BG)
  }
}
