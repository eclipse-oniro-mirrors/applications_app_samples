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
import { ActionButton, KeyValueRow, SectionCard, WidgetTone } from './CommonWidgets';
import { ResultList, ResultRow } from './ResultList';
import { LogPanel } from './LogPanel';
import { PatternSpec, actionText, listSummary, patternSpecs } from '../utils/InputMethodListSession';
import { Logger } from '../utils/Logger';

const LOG_SOURCE: string = 'List';
const MAX_ROWS: number = 8;

function buildPattern(icon: Resource): Pattern {
  const pattern: Pattern = { icon: icon, selectedIcon: icon };
  return pattern;
}

@Component
export struct InputMethodListDemoPage {
  @State selectedText: string = '尚未选择';
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
    Logger.info(LOG_SOURCE, '页面', `输入法列表页显示：${this.summary}`);
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
    const text = actionText(index, this.specs);
    this.selectedText = text;
    Logger.info(LOG_SOURCE, 'action', text);
    this.push(new ResultRow('action 回调', text, WidgetTone.SUCCESS));
  }

  private openDialog(): void {
    try {
      this.dialogController.open();
      this.dialogOpen = true;
      Logger.info(LOG_SOURCE, 'open', 'InputMethodListDialog 已打开');
      this.push(new ResultRow('InputMethodListDialog.open()', '对话框已打开，点选列表项观察 action 回调',
        WidgetTone.PRIMARY));
    } catch (err) {
      this.dialogOpen = false;
      Logger.error(LOG_SOURCE, 'open', `打开失败：${err}`);
      this.push(new ResultRow('InputMethodListDialog.open()', `打开失败：${err}`, WidgetTone.DANGER));
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
        Text(spec.label)
          .fontSize(AppText.BODY)
          .fontColor(AppColors.TEXT_STRONG)
          .width('100%')
        Text(spec.hint)
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
        Text('InputMethodListDialog 是系统提供的声明式组件：调用方只提供图标与回调，' +
          '列表内容由系统按已安装输入法填充。本页用它切换中文/英文两个模式项。')
          .fontSize(AppText.CAPTION)
          .fontColor(AppColors.TEXT_MUTED)
          .width('100%')

        SectionCard({ title: '模式项', subtitle: `${this.specs.length} 项` }) {
          Column({ space: AppSpacing.MD }) {
            ForEach(this.specs, (spec: PatternSpec) => {
              this.specRow(spec)
            }, (spec: PatternSpec) => spec.label)
            KeyValueRow({ label: '默认选中', value: '第 1 项（中文输入）' })
            KeyValueRow({ label: '最近选择', value: this.selectedText })
          }
          .width('100%')
        }

        SectionCard({ title: '操作', subtitle: '对话框由系统渲染' }) {
          Column({ space: AppSpacing.MD }) {
            Row({ space: AppSpacing.MD }) {
              ActionButton({
                label: '打开输入法列表',
                tone: WidgetTone.PRIMARY,
                onAction: () => {
                  this.openDialog();
                }
              })
              ActionButton({
                label: '重置选择',
                tone: WidgetTone.NEUTRAL,
                onAction: () => {
                  this.selectedText = '尚未选择';
                  Logger.info(LOG_SOURCE, '重置', '最近选择已清空');
                }
              })
            }
            .width('100%')
            Text('本机实测：对话框弹出的是系统输入法列表（kikaInput 与本应用的"输入法扩展"），两个模式项没有出现，' +
              'action 回调也未触发。入口文档的限制是"本组件仅系统应用和输入法应用可调用，patternOptions 参数' +
              '仅系统预置输入法支持"（d.ts 里同义写作 caller must be the current inputmethod），本应用两条都不满足，' +
              '所以只见列表、不见模式项。')
              .fontSize(AppText.CAPTION)
              .fontColor(AppColors.TEXT_MUTED)
              .width('100%')
          }
          .width('100%')
        }

        SectionCard({ title: '调用结果', subtitle: '最新在上' }) {
          ResultList({ rows: this.rows, emptyText: '点"打开输入法列表"开始' })
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
