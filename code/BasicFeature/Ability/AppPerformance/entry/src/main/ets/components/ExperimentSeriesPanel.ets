import { SeriesPanelView } from '../core/SeriesPresentation';

/** Shared production controls; progress and action gates remain service-owned. */
@Component
export struct ExperimentSeriesPanel {
  @Prop view: SeriesPanelView = new SeriesPanelView();
  @State private explanationOpen: boolean = false;
  onCountChange: (count: number) => void = (_count: number): void => {};
  onStart: () => void = (): void => {};
  onStopAfterCurrent: () => void = (): void => {};
  onCancelNow: () => void = (): void => {};
  onCopyReport: () => void = (): void => {};

  build(): void {
    Column({ space: 12 }) {
      Row({ space: 12 }) {
        Text('重复实验').fontSize(18).fontWeight(FontWeight.Medium).fontColor('#182238').layoutWeight(1)
        Text(this.view.phaseText).id('apSeriesPhase').fontSize(14).fontWeight(FontWeight.Medium)
          .fontColor(this.view.phaseText.indexOf('失败') >= 0 ? '#B42318' : '#246BFD')
          .padding({ left: 8, right: 8, top: 5, bottom: 5 }).backgroundColor('#F5F7FA').borderRadius(8)
      }.width('100%')
      Text(this.view.progressText).id('apSeriesProgress').fontSize(14).fontColor('#182238').width('100%')
      Row({ space: 12 }) {
        Button('−').id('apSeriesCountMinus').type(ButtonType.Normal).width(44).height(44)
          .borderRadius(12).fontSize(20).fontColor('#246BFD').backgroundColor('#EEF4FF')
          .enabled(this.view.canDecrease).opacity(this.view.canDecrease ? 1 : 0.45)
          .onClick((): void => { this.onCountChange(this.view.repetitions - 1); })
        Text(`重复次数 ${this.view.repetitions}`).id('apSeriesCountValue').layoutWeight(1)
          .fontSize(14).fontColor('#182238').textAlign(TextAlign.Center)
        Button('+').id('apSeriesCountPlus').type(ButtonType.Normal).width(44).height(44)
          .borderRadius(12).fontSize(20).fontColor('#246BFD').backgroundColor('#EEF4FF')
          .enabled(this.view.canIncrease).opacity(this.view.canIncrease ? 1 : 0.45)
          .onClick((): void => { this.onCountChange(this.view.repetitions + 1); })
      }.width('100%')
      Button('开始重复实验').id('apSeriesStart').type(ButtonType.Normal).width('100%').height(48)
        .fontSize(15).fontWeight(FontWeight.Medium).fontColor('#FFFFFF').backgroundColor('#246BFD').borderRadius(12)
        .enabled(this.view.canStart).opacity(this.view.canStart ? 1 : 0.45)
        .onClick((): void => { this.onStart(); })
      Row({ space: 8 }) {
        Button('本次完成后停止').id('apSeriesStopAfter').type(ButtonType.Normal).layoutWeight(1).height(44)
          .fontSize(14).fontColor('#182238').backgroundColor('#EEF2F6').borderRadius(12)
          .enabled(this.view.canStopAfterCurrent).opacity(this.view.canStopAfterCurrent ? 1 : 0.45)
          .onClick((): void => { this.onStopAfterCurrent(); })
        Button('取消等待').id('apSeriesCancelNow').type(ButtonType.Normal).layoutWeight(1).height(44)
          .fontSize(14).fontColor('#B42318').backgroundColor('#FEF3F2').borderRadius(12)
          .enabled(this.view.canCancelNow).opacity(this.view.canCancelNow ? 1 : 0.45)
          .onClick((): void => { this.onCancelNow(); })
      }.width('100%')
      Text(this.view.saveText).id('apSeriesSaveState').fontSize(14)
        .fontColor(this.view.saveText.indexOf('失败') >= 0 ? '#B42318' : '#667085').width('100%')
      Text(this.view.referenceText).id('apSeriesReferences').fontSize(14).fontColor('#667085').width('100%')
      if (this.view.isolationText.length > 0) {
        Text(this.view.isolationText).id('apSeriesSdkIsolation').fontSize(12).fontColor('#B54708')
          .width('100%').padding(10).backgroundColor('#FFFAEB').borderRadius(10)
      }
      if (this.view.message.length > 0) {
        Text(this.view.message).fontSize(12).fontColor('#667085').width('100%')
      }
      Text(this.view.scopeText).id('apSeriesScope').fontSize(12).fontColor('#667085').width('100%')
      Column({ space: 8 }) {
        ForEach(this.view.statistics, (line: string) => {
          Text(line).fontSize(14).fontColor('#182238').width('100%')
        }, (line: string, index: number) => `${index}-${line}`)
        if (this.view.statistics.length === 0) {
          Text('暂无可用样本').fontSize(12).fontColor('#667085').width('100%')
        }
      }.id('apSeriesStatistics').width('100%')
      Button('复制本系列分析报告').id('apSeriesCopyReport').type(ButtonType.Normal).width('100%').height(44)
        .fontSize(14).fontColor('#246BFD').backgroundColor('#EEF4FF').borderRadius(12)
        .enabled(this.view.canCopyReport).opacity(this.view.canCopyReport ? 1 : 0.45)
        .onClick((): void => { this.onCopyReport(); })
      Button(this.explanationOpen ? '收起实验说明' : '实验说明').id('apSeriesHelpToggle')
        .type(ButtonType.Normal).width('100%').height(44).fontSize(14)
        .fontColor('#667085').backgroundColor('#F5F7FA').borderRadius(12)
        .onClick((): void => { this.explanationOpen = !this.explanationOpen; })
      if (this.explanationOpen) {
        Text('每次读取同一负载并串行执行。仅比较同条件的阶段耗时，缺失样本不记为0，也不据此量化系统回收量。取消等待不会中断系统请求。')
          .fontSize(13).fontColor('#667085').lineHeight(20).width('100%')
      }
    }.width('100%').padding(16).backgroundColor('#FFFFFF').borderRadius(16)
    .alignItems(HorizontalAlign.Start)
  }
}
