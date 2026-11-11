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

import { formatResource, localText } from '../autostart/text/LocalizedText';

import { pasteboard } from '@kit.BasicServicesKit';
import { StartupArchivePanel } from '../components/StartupArchivePanel';
import { promptAction, router } from '@kit.ArkUI';
import { autoStartupService } from '../autostart/AutoStartupService';
import { QueryRecord } from '../autostart/AutoStartupTypes';
import { HistoryComparison, HistorySummary } from '../autostart/AutoStartupHistory';
import {
  HistoryFilter, RANGE_OPTIONS, RangeOption, RangePreset, OUTCOME_OPTIONS, OutcomeOption,
  SOURCE_OPTIONS, SourceOption, TimeRange, comparisonLines, dayCountLines, exportPreview,
  HistoryScope, describeRecord, detailLines, rangeOf, recordLines, summaryLines, validRange
} from '../autostart/history/HistoryView';

@Entry
@Component
struct HistoryPage {
  @State private filter: HistoryFilter = new HistoryFilter();
  @State private recordText: string[] = [];
  @State private summaryText: string[] = [];
  @State private comparisonText: string[] = [];
  @State private dayText: string[] = [];
  @State private exportText: string[] = [];
  @State private notice: string = '';
  @State private rangeText: string = localText('startup_text_0512');
  private unsubscribe: (() => void) | undefined = undefined;
  private lastExport: string = '';
  private scope: HistoryScope = new HistoryScope();
  @State private records: QueryRecord[] = [];
  @State private selectedBefore: number = 0;
  @State private selectedAfter: number = 0;
  @State private selectedDetail: number = 0;
  @State private details: string[] = [];
  @State private latestText: string = '';
  @State private storageNotice: string = '';
  @State private showFilters: boolean = false;
  @State private showHistoryTools: boolean = false;
  @State private showAnalysis: boolean = false;
  @State private showArchive: boolean = false;

  aboutToAppear(): void {
    this.unsubscribe = autoStartupService.subscribe((): void => {
      this.refresh();
    });
    this.refresh();
  }

  aboutToDisappear(): void {
    const unsubscribe: (() => void) | undefined = this.unsubscribe;
    if (unsubscribe !== undefined) {
      unsubscribe();
      this.unsubscribe = undefined;
    }
  }

  private refresh(): void {
    this.scope = autoStartupService.historyScope(this.filter, this.selectedBefore, this.selectedAfter);
    this.rangeText = rangeOf(this.filter.preset, this.scope.generatedAt).text();
    this.records = this.scope.records;
    this.recordText = recordLines(this.records);
    this.summaryText = summaryLines(this.scope.summary);
    this.comparisonText = this.scope.comparisonText;
    this.dayText = dayCountLines(this.records);
    this.latestText = this.scope.latestValid === undefined ? localText('startup_text_0916') :
      formatResource('startup_format_c13c67ff9a02', [String(describeRecord(this.scope.latestValid))]);
    this.details = detailLines(this.records.find((row: QueryRecord): boolean => row.id === this.selectedDetail));
    this.storageNotice = autoStartupService.historyNotice();
    this.exportText = exportPreview(this.lastExport);
  }

  private chooseOutcome(value: string): void {
    this.filter.outcome = value;
    this.notice = formatResource('startup_format_928a140542fd', [String(this.filter.text())]);
    this.refresh();
  }

  private chooseSource(value: string): void {
    this.filter.source = value;
    this.notice = formatResource('startup_format_5e01e113b688', [String(this.filter.text())]);
    this.refresh();
  }

  private chooseRange(preset: RangePreset): void {
    this.filter.preset = preset;
    this.notice = formatResource('startup_format_80619f799169', [String(this.filter.text())]);
    this.refresh();
  }

  private resetFilter(): void {
    this.filter.reset();
    this.selectedBefore = 0;
    this.selectedAfter = 0;
    this.selectedDetail = 0;
    this.notice = localText('startup_text_0921');
    this.refresh();
  }

  private exportHistory(all: boolean = false): void {
    const text: string = all ? autoStartupService.exportHistory() : this.scope.exportText;
    if (!all && this.records.length === 0) {
      this.notice = localText('startup_text_0922');
      return;
    }
    this.lastExport = `${all ? localText('startup_text_0923') : localText('startup_text_0924')}\n${text}`;
    this.exportText = exportPreview(this.lastExport);
    try {
      const data = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, this.lastExport);
      pasteboard.getSystemPasteboard().setData(data).then((): void => {
        this.notice = formatResource('startup_format_d13ec67220c6', [String(all ? localText('startup_text_0925') : localText('startup_text_0926'))]);
      }).catch((): void => { this.notice = localText('startup_text_0928'); });
    } catch (_) { this.notice = localText('startup_text_0928'); }
  }

  private confirmClear(): void {
    this.getUIContext().showAlertDialog({
      title: localText('startup_text_0929'),
      message: localText('startup_text_0930'),
      primaryButton: { value: localText('startup_text_0769'), action: (): void => {} },
      secondaryButton: {
        value: localText('startup_text_0931'),
        action: (): void => {
          autoStartupService.clearRecords();
          this.lastExport = '';
          this.notice = localText('startup_text_0932');
          this.refresh();
        }
      }
    });
  }

  private retryPersistence(): void {
    autoStartupService.retryPersistence();
    this.notice = localText('startup_text_0933');
    this.refresh();
  }

  private retryRead(): void {
    autoStartupService.retryHistoryRead();
    this.notice = localText('startup_text_0934');
    this.refresh();
  }

  @Builder
  private chip(label: string, active: boolean, onTap: () => void) {
    Button(label, { type: ButtonType.Normal })
      .height(44)
      .fontSize(12)
      .fontColor(active ? Color.White : $r('app.color.accent_color'))
      .backgroundColor(active ? $r('app.color.accent_color') : $r('app.color.accent_soft'))
      .borderRadius(9)
      .padding({ left: 12, right: 12 })
      .margin({ right: 8, bottom: 8 })
      .onClick(onTap)
  }

  @Builder
  private card(title: string, lines: string[]) {
    Column({ space: 8 }) {
      Text(title).fontSize(17).fontWeight(FontWeight.Bold).fontColor($r('app.color.text_primary')).width('100%')
      ForEach(lines, (line: string) => {
        Text(line).fontSize(14).fontColor($r('app.color.text_secondary')).width('100%')
      }, (line: string) => line)
    }
    .width('100%')
    .padding(16)
    .backgroundColor($r('app.color.card_background'))
    .borderRadius(16)
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Scroll() {
      Column({ space: 16 }) {
        Button(localText('startup_text_0842'), { type: ButtonType.Normal }).height(44).fontSize(14)
          .fontColor($r('app.color.accent_color')).backgroundColor(Color.Transparent).padding(0)
          .onClick((): void => { router.back(); })
        Text(localText('startup_text_0935')).fontSize(26).fontWeight(FontWeight.Bold).fontColor($r('app.color.text_primary')).width('100%')
        Text(formatResource('startup_format_f81a5f60798c', [String(this.records.length), String(this.filter.text())]))
          .fontSize(12).fontColor($r('app.color.text_secondary')).width('100%')
        Row({ space: 12 }) {
          Button(this.showFilters ? localText('startup_text_0937') : localText('startup_text_0938'), { type: ButtonType.Normal })
            .layoutWeight(1).height(44).fontSize(14).fontColor($r('app.color.accent_color'))
            .backgroundColor($r('app.color.card_background')).borderRadius(12)
            .onClick(() => { this.showFilters = !this.showFilters; })
          Button(localText('startup_text_0939'), { type: ButtonType.Normal }).layoutWeight(1).height(44).fontSize(14)
            .fontColor(Color.White).backgroundColor($r('app.color.accent_color')).borderRadius(12)
            .onClick((): void => this.exportHistory())
        }.width('100%')
        if (this.showFilters) {
          Column({ space: 8 }) {
            Text(localText('startup_text_0940')).fontSize(14).fontColor($r('app.color.text_primary')).width('100%')
            Flex({ wrap: FlexWrap.Wrap }) {
              ForEach(OUTCOME_OPTIONS, (option: OutcomeOption) => {
                this.chip(option.label, this.filter.outcome === option.value, (): void => {
                  this.chooseOutcome(option.value);
                })
              }, (option: OutcomeOption) => `outcome-${option.value}`)
            }.width('100%')
            Text(localText('startup_text_0941')).fontSize(14).fontColor($r('app.color.text_primary')).width('100%')
            Flex({ wrap: FlexWrap.Wrap }) {
              ForEach(SOURCE_OPTIONS, (option: SourceOption) => {
                this.chip(option.label, this.filter.source === option.value, (): void => {
                  this.chooseSource(option.value);
                })
              }, (option: SourceOption) => `source-${option.value}`)
            }.width('100%')
            Text(localText('startup_text_0942')).fontSize(14).fontColor($r('app.color.text_primary')).width('100%')
            Flex({ wrap: FlexWrap.Wrap }) {
              ForEach(RANGE_OPTIONS, (option: RangeOption) => {
                this.chip(option.label, this.filter.preset === option.preset, (): void => {
                  this.chooseRange(option.preset);
                })
              }, (option: RangeOption) => `range-${option.preset}`)
            }.width('100%')
            Button(localText('startup_text_0943')).height(44).fontSize(14).onClick((): void => this.resetFilter())
          }.width('100%').padding(16).backgroundColor($r('app.color.card_background')).borderRadius(16)
            .alignItems(HorizontalAlign.Start)
        }
        if (this.storageNotice.length > 0) {
          Text(this.storageNotice).fontSize(14).fontColor($r('app.color.error_color')).width('100%')
        }
        if (this.notice.length > 0) {
          Text(this.notice).fontSize(14).fontColor($r('app.color.accent_color')).width('100%')
        }
        Button(this.showHistoryTools ? localText('startup_text_0903') : localText('startup_text_0944'), { type: ButtonType.Normal })
          .height(44).width('100%').fontSize(14).fontColor($r('app.color.text_secondary'))
          .backgroundColor($r('app.color.card_background')).borderRadius(12)
          .onClick(() => { this.showHistoryTools = !this.showHistoryTools; })
        if (this.showHistoryTools || this.storageNotice.length > 0) {
          Column({ space: 12 }) {
            Row({ space: 12 }) {
              Button(localText('startup_text_0945')).layoutWeight(1).height(44).fontSize(14).onClick((): void => this.retryRead())
              Button(localText('startup_text_0905')).layoutWeight(1).height(44).fontSize(14).onClick((): void => this.retryPersistence())
            }.width('100%')
            Button(localText('startup_text_0946')).height(44).fontSize(14).onClick((): void => this.exportHistory(true))
            Button(localText('startup_text_0931')).height(44).fontSize(14).fontColor($r('app.color.error_color'))
              .onClick((): void => this.confirmClear())
          }.width('100%').padding(16).backgroundColor($r('app.color.card_background')).borderRadius(16)
        }
        Button(this.showArchive ? localText('startup_text_0947') : localText('startup_text_0948'), { type: ButtonType.Normal })
          .height(44).width('100%').fontSize(14).fontColor($r('app.color.accent_color'))
          .backgroundColor($r('app.color.card_background')).borderRadius(12)
          .onClick(() => { this.showArchive = !this.showArchive; })
        if (this.showArchive) { StartupArchivePanel({ liveRecords: this.records }) }
        Text(this.latestText).fontSize(13).fontColor($r('app.color.text_secondary')).width('100%')
        if (this.records.length === 0) { this.card(localText('startup_text_0949'), this.recordText) }
        ForEach(this.records, (record: QueryRecord) => {
          Column({ space: 12 }) {
            Text(describeRecord(record)).fontSize(14).fontColor($r('app.color.text_primary')).width('100%')
            Row({ space: 8 }) {
              Button(this.selectedBefore === record.id ? localText('startup_text_0950') : localText('startup_text_0951')).height(44).fontSize(13).layoutWeight(1)
                .onClick((): void => { this.selectedBefore = record.id; this.refresh(); })
              Button(this.selectedAfter === record.id ? localText('startup_text_0952') : localText('startup_text_0953')).height(44).fontSize(13).layoutWeight(1)
                .onClick((): void => { this.selectedAfter = record.id; this.refresh(); })
              Button(localText('startup_text_0954')).height(44).fontSize(13).layoutWeight(1)
                .onClick((): void => { this.selectedDetail = record.id; this.refresh(); })
            }.width('100%')
          }.width('100%').padding(16).backgroundColor($r('app.color.card_background')).borderRadius(16)
        }, (record: QueryRecord): string => String(record.id))
        if (this.selectedDetail > 0) { this.card(localText('startup_text_0955'), this.details) }
        if (this.selectedBefore > 0 || this.selectedAfter > 0) { this.card(localText('startup_text_0956'), this.comparisonText) }
        Button(this.showAnalysis ? localText('startup_text_0957') : localText('startup_text_0958'), { type: ButtonType.Normal })
          .height(44).width('100%').fontSize(14).fontColor($r('app.color.text_secondary'))
          .backgroundColor($r('app.color.card_background')).borderRadius(12)
          .onClick(() => { this.showAnalysis = !this.showAnalysis; })
        if (this.showAnalysis) {
          this.card(localText('startup_text_0959'), this.summaryText)
          if (this.selectedBefore === 0 && this.selectedAfter === 0) { this.card(localText('startup_text_0956'), this.comparisonText) }
          this.card(localText('startup_text_0827'), this.dayText)
          this.card(localText('startup_text_0960'), this.exportText)
        }
      }.width('100%').padding({ left: 20, right: 20, top: 20, bottom: 28 }).alignItems(HorizontalAlign.Start)
    }.width('100%').height('100%').backgroundColor($r('app.color.page_background')).scrollBar(BarState.Auto)
  }
}
