import { SeriesHistoryView, SeriesHistoryRow } from '../core/SeriesHistoryPresentation';
import { ReportFormat } from '../core/report/ReportExport';

@Component
export struct SeriesHistoryPanel {
  @Prop view: SeriesHistoryView = new SeriesHistoryView();
  onSelect: (ownerId: string) => void = (_ownerId: string): void => {};
  onCompareBase: (ownerId: string) => void = (_ownerId: string): void => {};
  onFormatChange: (format: ReportFormat) => void = (_format: ReportFormat): void => {};
  onCopySelected: () => void = (): void => {};

  build(): void {
    Column({ space: 12 }) {
      Text('系列历史').fontSize(18).fontWeight(FontWeight.Medium).fontColor('#182238').width('100%')
      if (this.view.rows.length === 0) {
        Text('暂无系列历史').id('apSeriesHistoryEmpty').fontSize(14).fontColor('#667085').width('100%')
      }
      ForEach(this.view.rows, (row: SeriesHistoryRow, index: number) => {
        Column({ space: 10 }) {
          Text(row.title).fontSize(14).fontWeight(FontWeight.Medium).fontColor('#182238').width('100%')
          Text(row.detail).fontSize(12).fontColor('#667085').width('100%')
          Row({ space: 8 }) {
            Button(row.selected ? '已选系列' : '选择系列').id(`apSeriesHistorySelect${index}`)
              .type(ButtonType.Normal).layoutWeight(1).height(44).borderRadius(12).fontSize(14)
              .fontColor(row.selected ? '#FFFFFF' : '#182238')
              .backgroundColor(row.selected ? '#246BFD' : '#EEF2F6')
              .enabled(!row.selected).onClick((): void => { this.onSelect(row.ownerId); })
            Button(row.comparisonBase ? '当前对照' : '作为对照').id(`apSeriesHistoryBase${index}`)
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
        Button(this.view.format === ReportFormat.MARKDOWN ? 'Markdown（已选）' : 'Markdown')
          .id('apSeriesHistoryFormatMarkdown').type(ButtonType.Normal).layoutWeight(1).height(44)
          .fontSize(14).borderRadius(12).fontColor(this.view.format === ReportFormat.MARKDOWN ? '#246BFD' : '#667085')
          .backgroundColor(this.view.format === ReportFormat.MARKDOWN ? '#EEF4FF' : '#EEF2F6')
          .onClick((): void => { this.onFormatChange(ReportFormat.MARKDOWN); })
        Button(this.view.format === ReportFormat.CSV ? 'CSV（已选）' : 'CSV')
          .id('apSeriesHistoryFormatCsv').type(ButtonType.Normal).layoutWeight(1).height(44)
          .fontSize(14).borderRadius(12).fontColor(this.view.format === ReportFormat.CSV ? '#246BFD' : '#667085')
          .backgroundColor(this.view.format === ReportFormat.CSV ? '#EEF4FF' : '#EEF2F6')
          .onClick((): void => { this.onFormatChange(ReportFormat.CSV); })
      }.width('100%')
      Button(`复制所选系列历史（${this.view.formatText}）`).id('apSeriesHistoryCopy')
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
