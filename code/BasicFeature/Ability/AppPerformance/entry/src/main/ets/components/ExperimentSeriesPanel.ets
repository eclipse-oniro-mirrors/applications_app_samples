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
import { SeriesPanelView } from '../core/SeriesPresentation';

/** Shared production controls; progress and action gates remain service-owned. */
@Component
export struct ExperimentSeriesPanel {

  private text(resource: Resource, args: (string | number)[] = []): string {
    return resolveText(this.getUIContext().getHostContext(), resource, args);
  }


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
        Text(this.text($r('app.string.ap_ui_repeated_experiments'))).fontSize(18).fontWeight(FontWeight.Medium).fontColor('#182238').layoutWeight(1)
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
        Text(this.text($r('app.string.ap_ui_format_8321d92a2b'), [this.view.repetitions])).id('apSeriesCountValue').layoutWeight(1)
          .fontSize(14).fontColor('#182238').textAlign(TextAlign.Center)
        Button('+').id('apSeriesCountPlus').type(ButtonType.Normal).width(44).height(44)
          .borderRadius(12).fontSize(20).fontColor('#246BFD').backgroundColor('#EEF4FF')
          .enabled(this.view.canIncrease).opacity(this.view.canIncrease ? 1 : 0.45)
          .onClick((): void => { this.onCountChange(this.view.repetitions + 1); })
      }.width('100%')
      Button(this.text($r('app.string.ap_ui_start_repeated_experiments'))).id('apSeriesStart').type(ButtonType.Normal).width('100%').height(48)
        .fontSize(15).fontWeight(FontWeight.Medium).fontColor('#FFFFFF').backgroundColor('#246BFD').borderRadius(12)
        .enabled(this.view.canStart).opacity(this.view.canStart ? 1 : 0.45)
        .onClick((): void => { this.onStart(); })
      Row({ space: 8 }) {
        Button(this.text($r('app.string.ap_ui_stop_after_this_run'))).id('apSeriesStopAfter').type(ButtonType.Normal).layoutWeight(1).height(44)
          .fontSize(14).fontColor('#182238').backgroundColor('#EEF2F6').borderRadius(12)
          .enabled(this.view.canStopAfterCurrent).opacity(this.view.canStopAfterCurrent ? 1 : 0.45)
          .onClick((): void => { this.onStopAfterCurrent(); })
        Button(this.text($r('app.string.ap_ui_cancel_waiting'))).id('apSeriesCancelNow').type(ButtonType.Normal).layoutWeight(1).height(44)
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
          Text(this.text($r('app.string.ap_ui_no_usable_samples'))).fontSize(12).fontColor('#667085').width('100%')
        }
      }.id('apSeriesStatistics').width('100%')
      Button(this.text($r('app.string.ap_ui_copy_this_series_report'))).id('apSeriesCopyReport').type(ButtonType.Normal).width('100%').height(44)
        .fontSize(14).fontColor('#246BFD').backgroundColor('#EEF4FF').borderRadius(12)
        .enabled(this.view.canCopyReport).opacity(this.view.canCopyReport ? 1 : 0.45)
        .onClick((): void => { this.onCopyReport(); })
      Button(this.explanationOpen ? this.text($r('app.string.ap_ui_hide_experiment_notes')) : this.text($r('app.string.ap_ui_experiment_notes'))).id('apSeriesHelpToggle')
        .type(ButtonType.Normal).width('100%').height(44).fontSize(14)
        .fontColor('#667085').backgroundColor('#F5F7FA').borderRadius(12)
        .onClick((): void => { this.explanationOpen = !this.explanationOpen; })
      if (this.explanationOpen) {
        Text(this.text($r('app.string.ap_ui_runs_read_the_same_workload_sequentially_compare_stage_timings_only_unde')))
          .fontSize(13).fontColor('#667085').lineHeight(20).width('100%')
      }
    }.width('100%').padding(16).backgroundColor('#FFFFFF').borderRadius(16)
    .alignItems(HorizontalAlign.Start)
  }
}
