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
 * 演示页三：输入法切换列表（@ohos.inputMethodList）。
 *
 * InputMethodListDialog 是系统提供的 @CustomDialog 组件，调用方只需给出
 * patterns（图标）与 action（选中回调）。本页用它列出两个模式项，
 * 并把 action 回调的下标原样写进"最近一次选择"，不替系统编造选择结果。
 *
 * 注意：文档写明该列表用于展示默认输入法子类型与三方输入法；没有安装任何
 * 三方输入法的设备上，列表内容由系统决定，页面只如实展示回调与否。
 */

import { InputMethodListDialog, Pattern } from '@kit.IMEKit';
import { AppColors, AppSpacing, AppText } from '../common/Theme';
import { ActionButton, KeyValueRow, SectionCard, WidgetTone, textOfResource } from './CommonWidgets';
import { ResultList, ResultRow } from './ResultList';
import { LogPanel } from './LogPanel';
import { PatternSpec, actionText, listSummary, patternSpecs } from '../utils/InputMethodListSession';
import { Logger } from '../utils/Logger';
import { text } from '../common/StringResource';

const LOG_SOURCE: string = 'List';
const MAX_ROWS: number = 8;

function buildPattern(icon: Resource): Pattern {
  const pattern: Pattern = { icon: icon, selectedIcon: icon };
  return pattern;
}

@Component
export struct InputMethodListDemoPage {
  @State selectedText: string = '';
  @State dialogOpen: boolean = false;
  @State rows: ResultRow[] = [];
  private specs: PatternSpec[] = patternSpecs();
  private patterns: Pattern[] = [
    buildPattern($r('app.media.startIcon')),
    buildPattern($r('app.media.foreground'))
  ];
  private summary: string = listSummary(this.specs);
  private dialogController: CustomDialogController = new CustomDialogController({
    builder: InputMethodListDialog({
      patternOptions: {
        defaultSelected: 0,
        patterns: this.patterns,
        action: (index: number) => {
          this.onPattern(index);
        }
      }
    }),
    customStyle: true,
    maskColor: '#66000000',
    autoCancel: true
  });

  aboutToAppear(): void {
    this.selectedText = this.textOf($r('app.string.list_not_selected'));
    Logger.info(LOG_SOURCE, 'Page', `page shown: ${this.summary}`);
  }

  /** ResultRow 的 title / detail 是字符串，这里按资源 id 取出本地化文案 */
  private textOf(res: Resource): string {
    return textOfResource(this.getUIContext().getHostContext(), res);
  }

  private push(row: ResultRow): void {
    const next: ResultRow[] = [row];
    for (let i = 0; i < this.rows.length && i < MAX_ROWS - 1; i++) {
      next.push(this.rows[i]);
    }
    this.rows = next;
  }

  /** action 回调：下标由系统给出，页面只翻译成"第几项、叫什么" */
  private onPattern(index: number): void {
    const message = actionText(index, this.specs);
    this.selectedText = message;
    Logger.info(LOG_SOURCE, 'action', message);
    this.push(new ResultRow(this.textOf($r('app.string.list_row_action_title')), message, WidgetTone.SUCCESS));
  }

  private openDialog(): void {
    try {
      this.dialogController.open();
      this.dialogOpen = true;
      Logger.info(LOG_SOURCE, 'open', 'InputMethodListDialog opened');
      this.push(new ResultRow('InputMethodListDialog.open()',
        this.textOf($r('app.string.list_row_opened_detail')), WidgetTone.PRIMARY));
    } catch (err) {
      this.dialogOpen = false;
      Logger.error(LOG_SOURCE, 'open', `open failed: ${err}`);
      this.push(new ResultRow('InputMethodListDialog.open()',
        text('list_row_failed_detail', `${err}`), WidgetTone.DANGER));
    }
  }

  @Builder
  specRow(spec: PatternSpec) {
    Row({ space: AppSpacing.MD }) {
      Text(`${spec.index + 1}`)
        .fontSize(AppText.SMALL)
        .fontColor(AppColors.PRIMARY)
        .backgroundColor(AppColors.PRIMARY_SOFT)
        .borderRadius(4)
        .width(20)
        .textAlign(TextAlign.Center)
      Column({ space: 2 }) {
        Text(spec.labelText())
          .fontSize(AppText.BODY)
          .fontColor(AppColors.TEXT_STRONG)
          .width('100%')
        Text(spec.hintText())
          .fontSize(AppText.CAPTION)
          .fontColor(AppColors.TEXT_MUTED)
          .width('100%')
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
  }

  build() {
    Scroll() {
      Column({ space: AppSpacing.LG }) {
        Text($r('app.string.list_intro_note'))
          .fontSize(AppText.CAPTION)
          .fontColor(AppColors.TEXT_MUTED)
          .width('100%')

        SectionCard({ title: $r('app.string.list_section_patterns'),
          subtitle: $r('app.string.common_count_items', this.specs.length) }) {
          Column({ space: AppSpacing.MD }) {
            ForEach(this.specs, (spec: PatternSpec) => {
              this.specRow(spec)
            }, (spec: PatternSpec) => spec.label)
            KeyValueRow({ label: $r('app.string.list_default_selected'),
              value: $r('app.string.list_default_selected_value') })
            KeyValueRow({ label: $r('app.string.list_recent'), value: this.selectedText })
          }
          .width('100%')
        }

        SectionCard({ title: $r('app.string.list_section_actions'),
          subtitle: $r('app.string.list_actions_subtitle') }) {
          Column({ space: AppSpacing.MD }) {
            Row({ space: AppSpacing.MD }) {
              ActionButton({
                label: $r('app.string.list_btn_open'),
                tone: WidgetTone.PRIMARY,
                onAction: () => {
                  this.openDialog();
                }
              })
              ActionButton({
                label: $r('app.string.list_btn_reset'),
                tone: WidgetTone.NEUTRAL,
                onAction: () => {
                  this.selectedText = this.textOf($r('app.string.list_not_selected'));
                  Logger.info(LOG_SOURCE, 'Reset', 'recent selection cleared');
                }
              })
            }
            .width('100%')
            Text($r('app.string.list_observed_note'))
              .fontSize(AppText.CAPTION)
              .fontColor(AppColors.TEXT_MUTED)
              .width('100%')
          }
          .width('100%')
        }

        SectionCard({ title: $r('app.string.common_section_result'),
          subtitle: $r('app.string.common_result_subtitle') }) {
          ResultList({ rows: this.rows, emptyText: $r('app.string.list_result_empty') })
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
