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

import { resolveText, displayValue } from '../core/UiText';
import { SeriesHistoryView, SeriesHistoryRow } from '../core/SeriesHistoryPresentation';
import { ReportFormat } from '../core/report/ReportExport';

@Component
export struct SeriesHistoryPanel {

  private text(resource: Resource, args: (string | number)[] = []): string {
    return resolveText(this.getUIContext().getHostContext(), resource, args);
  }


  @Prop view: SeriesHistoryView = new SeriesHistoryView();
  onSelect: (ownerId: string) => void = (_ownerId: string): void => {};
  onCompareBase: (ownerId: string) => void = (_ownerId: string): void => {};
  onFormatChange: (format: ReportFormat) => void = (_format: ReportFormat): void => {};
  onCopySelected: () => void = (): void => {};

  build(): void {
    Column({ space: 12 }) {
      Text(this.text($r('app.string.ap_ui_series_history'))).fontSize(18).fontWeight(FontWeight.Medium).fontColor('#182238').width('100%')
      if (this.view.rows.length === 0) {
        Text(this.text($r('app.string.ap_ui_no_series_history'))).id('apSeriesHistoryEmpty').fontSize(14).fontColor('#667085').width('100%')
      }
      ForEach(this.view.rows, (row: SeriesHistoryRow, index: number) => {
        Column({ space: 10 }) {
          Text(row.title).fontSize(14).fontWeight(FontWeight.Medium).fontColor('#182238').width('100%')
          Text(row.detail).fontSize(12).fontColor('#667085').width('100%')
          Row({ space: 8 }) {
            Button(row.selected ? this.text($r('app.string.ap_ui_selected_series')) : this.text($r('app.string.ap_ui_select_series'))).id(`apSeriesHistorySelect${index}`)
              .type(ButtonType.Normal).layoutWeight(1).height(44).borderRadius(12).fontSize(14)
              .fontColor(row.selected ? '#FFFFFF' : '#182238')
              .backgroundColor(row.selected ? '#246BFD' : '#EEF2F6')
              .enabled(!row.selected).onClick((): void => { this.onSelect(row.ownerId); })
            Button(row.comparisonBase ? this.text($r('app.string.ap_ui_current_baseline')) : this.text($r('app.string.ap_ui_use_as_baseline'))).id(`apSeriesHistoryBase${index}`)
              .type(ButtonType.Normal).layoutWeight(1).height(44).borderRadius(12).fontSize(14)
              .fontColor('#246BFD').backgroundColor('#EEF4FF')
              .enabled(!row.selected && !row.comparisonBase)
              .onClick((): void => { this.onCompareBase(row.ownerId); })
          }.width('100%')
        }.width('100%').padding(12).backgroundColor('#F5F7FA').borderRadius(12)
      }, (row: SeriesHistoryRow) => row.ownerId)
      Text(this.view.selectedText).id('apSeriesHistorySelected').fontSize(14).fontColor('#182238').width('100%')
      Text(this.view.comparisonText).id('apSeriesHistoryBase').fontSize(14).fontColor('#667085').width('100%')
      Text(this.view.availabilityText).id('apSeriesHistoryAvailability').fontSize(12).fontColor('#667085').width('100%')
      Row({ space: 8 }) {
        Button(this.view.format === ReportFormat.MARKDOWN ? this.text($r('app.string.ap_ui_markdown_selected')) : 'Markdown')
          .id('apSeriesHistoryFormatMarkdown').type(ButtonType.Normal).layoutWeight(1).height(44)
          .fontSize(14).borderRadius(12).fontColor(this.view.format === ReportFormat.MARKDOWN ? '#246BFD' : '#667085')
          .backgroundColor(this.view.format === ReportFormat.MARKDOWN ? '#EEF4FF' : '#EEF2F6')
          .onClick((): void => { this.onFormatChange(ReportFormat.MARKDOWN); })
        Button(this.view.format === ReportFormat.CSV ? this.text($r('app.string.ap_ui_csv_selected')) : 'CSV')
          .id('apSeriesHistoryFormatCsv').type(ButtonType.Normal).layoutWeight(1).height(44)
          .fontSize(14).borderRadius(12).fontColor(this.view.format === ReportFormat.CSV ? '#246BFD' : '#667085')
          .backgroundColor(this.view.format === ReportFormat.CSV ? '#EEF4FF' : '#EEF2F6')
          .onClick((): void => { this.onFormatChange(ReportFormat.CSV); })
      }.width('100%')
      Button(this.text($r('app.string.ap_ui_format_b7127c6410'), [this.view.formatText])).id('apSeriesHistoryCopy')
        .type(ButtonType.Normal).width('100%').height(48).fontSize(14).borderRadius(12)
        .fontColor('#FFFFFF').backgroundColor('#246BFD').enabled(this.view.canCopy)
        .opacity(this.view.canCopy ? 1 : 0.45).onClick((): void => { this.onCopySelected(); })
      Text(this.view.status).id('apSeriesHistoryStatus').fontSize(14).fontColor('#667085').width('100%')
      Column({ space: 8 }) {
        ForEach(this.view.comparisonLines, (line: string) => {
          Text(line).fontSize(14).fontColor('#182238').width('100%')
        }, (line: string, index: number) => `${index}-${line}`)
      }.id('apSeriesHistoryComparison').width('100%')
    }.width('100%').padding(16).backgroundColor('#FFFFFF').borderRadius(16)
    .alignItems(HorizontalAlign.Start)
  }
}
