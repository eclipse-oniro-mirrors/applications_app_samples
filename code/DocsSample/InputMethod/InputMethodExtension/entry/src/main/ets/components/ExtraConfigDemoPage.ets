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
    Logger.info(LOG_SOURCE, '页面', `扩展信息页显示，默认 ${this.entries.length} 项 / ${this.bytes} 字节`);
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
          label: '构造默认配置',
          tone: WidgetTone.PRIMARY,
          onAction: () => {
            this.push(buildDefaultOutcome());
          }
        })
        ActionButton({
          label: '读取打桩编辑框',
          tone: WidgetTone.PRIMARY,
          onAction: () => {
            this.push(readStubOutcome());
          }
        })
      }
      .width('100%')

      Row({ space: AppSpacing.MD }) {
        ActionButton({
          label: '读取空扩展信息',
          tone: WidgetTone.NEUTRAL,
          onAction: () => {
            this.push(readAbsentOutcome());
          }
        })
        ActionButton({
          label: '压线 32KB',
          tone: WidgetTone.NEUTRAL,
          onAction: () => {
            this.push(nearLimitOutcome());
          }
        })
      }
      .width('100%')

      Row({ space: AppSpacing.MD }) {
        ActionButton({
          label: '越界 1 字节',
          tone: WidgetTone.WARNING,
          onAction: () => {
            this.push(oversizedOutcome());
          }
        })
        ActionButton({
          label: 'JSON 往返',
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
        Text('编辑框设置 customSettings 后，系统在拉起输入法时把它交给输入法应用的 EditorAttribute.extraConfig。' +
          '本应用是 UIAbility，拿不到"被拉起"那一刻，所以用打桩对象复现同样的数据形状。')
          .fontSize(AppText.CAPTION)
          .fontColor(AppColors.TEXT_MUTED)
          .width('100%')

        SectionCard({ title: '当前键值', subtitle: `${this.entries.length} 项` }) {
          Column({ space: AppSpacing.MD }) {
            ForEach(this.entries, (entry: ConfigEntry) => {
              this.entryRow(entry)
            }, (entry: ConfigEntry) => entry.key)
            KeyValueRow({ label: '额度上限', value: `${this.bytes} 字节（32KB）`, mono: true })
            Text(`值类型只能是 number / string / boolean，总长按 UTF-8 计算；超过 ${EXTRA_CONFIG_MAX_BYTES} 字节属于入参问题。`)
              .fontSize(AppText.CAPTION)
              .fontColor(AppColors.TEXT_MUTED)
              .width('100%')
          }
          .width('100%')
        }

        SectionCard({ title: '调用', subtitle: '全部为本地计算，不访问系统服务' }) {
          this.callButtons()
        }

        SectionCard({ title: '调用结果', subtitle: '最新在上' }) {
          ResultList({ rows: this.rows, emptyText: '点上面的按钮开始调用' })
        }

        LogPanel({ title: '本页事件', filterSource: LOG_SOURCE })
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
