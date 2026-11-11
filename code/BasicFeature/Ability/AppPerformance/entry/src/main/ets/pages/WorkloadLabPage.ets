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

import { resolveText, displayValue, workloadTitle, workloadDescription } from '../core/UiText';
import { AppService, getAppService } from '../core/AppService';
import { ExperimentRecord, ExperimentStage, WorkloadDigest, digestLedger,
  latestPairOf } from '../core/ExperimentLedger';
import { WORKLOADS, WorkloadSpec, workloadLines } from '../core/WorkloadCatalog';
import { SERIES_DEFAULT_REPETITIONS, validSeriesCount } from '../core/ExperimentSeries';
import { SeriesPanelView, buildSeriesPanelView } from '../core/SeriesPresentation';
import { ExperimentSeriesPanel } from '../components/ExperimentSeriesPanel';
import { SeriesHistoryController } from '../core/SeriesHistoryController';
import { SeriesHistoryView } from '../core/SeriesHistoryPresentation';
import { SeriesHistoryPanel } from '../components/SeriesHistoryPanel';
import { ReportFormat } from '../core/report/ReportExport';

const MODES: string[] = ['control', 'files', 'modules'];
function modeLabel(mode: string): ResourceStr {
  return mode === 'files' ? $r('app.string.ap_ui_file_eviction') : mode === 'modules' ? $r('app.string.ap_ui_module_eviction') : $r('app.string.ap_ui_no_eviction_control');
}

/** View only: all SDK sequencing, integrity checks and ledger commits belong to AppService. */
@Entry
@Component
struct WorkloadLabPage {

  private text(resource: Resource, args: (string | number)[] = []): string {
    return resolveText(this.getUIContext().getHostContext(), resource, args);
  }

  private display(value: string): string {
    return displayValue(this.getUIContext().getHostContext(), value);
  }

  @State private selected: number = 0;
  @State private mode: number = 0;
  @State private busy: boolean = false;
  @State private quarantined: boolean = false;
  @State private failedOnly: boolean = false;
  @State private stageLines: string[] = [];
  @State private resultLines: string[] = [];
  @State private records: ExperimentRecord[] = [];
  @State private notice: string = '';
  @State private detailId: string = '';
  @State private historyOpen: boolean = false;
  @State private detailsOpen: boolean = false;
  private service: AppService | undefined = undefined;
  private observerId: number = -1;
  private ownsRun: boolean = false;
  private seriesOwnerId: string = '';
  @State private repetitions: number = SERIES_DEFAULT_REPETITIONS;
  @State private seriesView: SeriesPanelView = new SeriesPanelView();
  @State private historyView: SeriesHistoryView = new SeriesHistoryView();
  private historyController: SeriesHistoryController | undefined = undefined;

  aboutToAppear(): void {
    this.service = getAppService();
    this.historyController = new SeriesHistoryController(this.service);
    this.observerId = this.service.subscribe((): void => { this.refresh(); });
    this.refresh();
  }

  aboutToDisappear(): void {
    if (this.seriesOwnerId.length > 0) { this.service?.cancelExperimentSeries(this.seriesOwnerId); }
    this.seriesOwnerId = '';
    this.historyController?.dispose(); this.historyController = undefined;
    if (this.ownsRun) { this.service?.cancelExperiment(); }
    if (this.observerId >= 0) { this.service?.unsubscribe(this.observerId); }
    this.observerId = -1;
  }

  private refresh(): void {
    const service = this.service;
    if (service === undefined) { return; }
    const state = service.getState();
    this.records = service.ledgerRecords();
    this.busy = service.isExperimentBusy();
    this.quarantined = service.isQuarantined();
    this.notice = state.storageMessage || state.notice;
    const series = service.seriesState();
    const records = series === undefined ? [] : service.seriesRecords(series.ownerId);
    const view = buildSeriesPanelView(series, records, this.repetitions, this.busy, this.quarantined, this.notice);
    if (series !== undefined && series.leaseHeld && series.ownerId !== this.seriesOwnerId) {
      view.canStopAfterCurrent = false; view.canCancelNow = false;
    }
    this.seriesView = view;
    const history = this.historyController;
    if (history !== undefined) { this.historyView = history.view(); }
    if (state.maintenance !== undefined && (this.ownsRun ||
      (series !== undefined && series.ownerId === this.seriesOwnerId && series.startedCount > 0))) {
      this.stageLines = state.maintenance.steps.map((step): string =>
        `${step.label} · ${step.status} · ${step.elapsed} ms · ${step.detail}`);
    }
  }

  private filteredRecords(): ExperimentRecord[] {
    return this.records.filter((record: ExperimentRecord): boolean =>
      record.workloadId === WORKLOADS[this.selected].id && record.mode === MODES[this.mode] &&
      (!this.failedOnly || !record.complete()));
  }

  private summaryLines(): string[] {
    return digestLedger(this.filteredRecords()).map((digest: WorkloadDigest): string => digest.text());
  }

  private comparison(): string {
    return latestPairOf(this.filteredRecords(), WORKLOADS[this.selected].id).text();
  }

  private details(): string[] {
    const record = this.records.find((item: ExperimentRecord): boolean => item.id === this.detailId);
    if (record === undefined) { return [this.text($r('app.string.ap_ui_select_a_record_to_view_details'))]; }
    const lines: string[] = [record.text(), this.text($r('app.string.ap_ui_format_719269605f'), [record.asset || this.text($r('app.string.ap_ui_not_recorded_in_legacy_data'))]),
      this.text($r('app.string.ap_ui_format_fe240eb7a9'), [record.requestStatus, this.display(record.observability)]),
      this.text($r('app.string.ap_ui_format_b97fc0e2fc'), [record.beforeBytes, record.afterBytes]),
      this.text($r('app.string.ap_ui_format_1020a92250'), [record.digestBefore || this.text($r('app.string.ap_ui_missing')), record.digestAfter || this.text($r('app.string.ap_ui_missing'))]),
      record.condition.length > 0 ? this.text($r('app.string.ap_ui_device_version_foreground_background_and_installed_target_conditions_rec')) : this.text($r('app.string.ap_ui_legacy_record_lacks_conditions_and_cannot_be_compared'))];
    record.stages.forEach((stage: ExperimentStage): void => { lines.push(stage.text()); });
    record.missing.forEach((text: string): void => { lines.push(this.text($r('app.string.ap_ui_format_903956ee80'), [text])); });
    return lines;
  }

  private async runExperiment(): Promise<void> {
    const service = this.service;
    if (service === undefined || service.isExperimentBusy()) { return; }
    this.ownsRun = true;
    this.busy = true;
    try {
      const record = await service.runExperiment(WORKLOADS[this.selected].id, MODES[this.mode]);
      if (record === undefined) { this.notice = this.text($r('app.string.ap_ui_not_started_a_request_is_in_flight_or_parameters_are_invalid')); return; }
      this.detailId = record.id;
      this.stageLines = record.stages.map((stage: ExperimentStage): string => stage.text());
      this.resultLines = [record.text(), this.text($r('app.string.ap_ui_format_571e700029'), [record.requestStatus]),
        this.text($r('app.string.ap_ui_format_91331090f0'), [this.display(record.observability)]), record.note];
    } finally {
      this.ownsRun = false;
      this.refresh();
    }
  }

  private changeSeriesCount(count: number): void {
    const service = this.service;
    if (service === undefined || service.isExperimentBusy() || !validSeriesCount(count)) { return; }
    this.repetitions = count; this.refresh();
  }

  private async startSeries(): Promise<void> {
    const service = this.service;
    if (service === undefined) { return; }
    const started = service.startExperimentSeries(WORKLOADS[this.selected].id, MODES[this.mode], this.repetitions);
    if (!started.accepted) { this.notice = started.message; return; }
    this.seriesOwnerId = started.ownerId;
    this.stageLines = []; this.resultLines = []; this.refresh();
    await service.whenSeriesFinished(started.ownerId);
    if (this.seriesOwnerId !== started.ownerId || this.observerId < 0) { return; }
    const records = service.seriesRecords(started.ownerId);
    if (records.length > 0) { this.detailId = records[records.length - 1].id; }
    this.refresh();
  }

  private stopSeries(): void {
    this.service?.stopExperimentSeries(this.seriesOwnerId); this.refresh();
  }

  private cancelSeries(): void {
    this.service?.cancelExperimentSeries(this.seriesOwnerId); this.refresh();
  }

  private copySeries(): void {
    const service = this.service;
    if (service === undefined) { return; }
    const state = service.seriesState();
    if (state !== undefined) { void service.copySeriesAnalysisReport(state.ownerId); }
  }

  private selectHistory(ownerId: string, comparison: boolean): void {
    const controller = this.historyController;
    if (controller === undefined) { return; }
    if (comparison) {
      controller.selectComparisonBase(ownerId);
    } else {
      controller.selectSeries(ownerId);
    }
    this.refresh();
  }

  private historyFormat(format: ReportFormat): void {
    this.historyController?.setFormat(format); this.refresh();
  }

  private async copyHistory(): Promise<void> {
    const controller = this.historyController;
    if (controller === undefined) { return; }
    const pending = controller.copySelected(); this.refresh();
    await pending;
    if (this.historyController === controller && this.observerId >= 0) { this.refresh(); }
  }

  private exportLedger(): void {
    const service = this.service;
    if (service !== undefined) { void service.copyText(service.exportLedger()); }
  }

  /** 把当前账本导出为可交付的分析报告（Markdown）：条件分组、阶段耗时与缺口说明。 */
  private exportAnalysisReport(): void {
    const service = this.service;
    if (service === undefined) { return; }
    void service.copyAnalysisReport(WORKLOADS[this.selected].id, MODES[this.mode], this.failedOnly);
  }

  private clearLedger(): void {
    this.getUIContext().showAlertDialog({ title: this.text($r('app.string.ap_ui_clear_experiment_records')), message: this.text($r('app.string.ap_ui_clear_the_local_experiment_ledger_without_changing_system_settings')),
      primaryButton: { value: this.text($r('app.string.ap_ui_cancel')), action: (): void => {} },
      secondaryButton: { value: this.text($r('app.string.ap_ui_clear')), action: (): void => {
        this.service?.clearLedger(); this.detailId = ''; this.refresh();
      } }
    });
  }

  @Builder
  private card(title: string, lines: string[]) {
    Column({ space: 8 }) {
      Text(title).fontSize(18).fontWeight(FontWeight.Medium).fontColor('#182238').width('100%')
      ForEach(lines.length === 0 ? [this.text($r('app.string.ap_ui_no_data_available'))] : lines, (line: string) => {
        Text(line).fontSize(14).fontColor('#667085').lineHeight(22).width('100%')
      }, (line: string, index: number) => `${index}-${line}`)
    }.width('100%').padding(16).backgroundColor('#FFFFFF').borderRadius(16)
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Scroll() {
      Column({ space: 16 }) {
        Row({ space: 12 }) {
          Text(this.text($r('app.string.ap_ui_workload_experiments'))).fontSize(26).fontWeight(FontWeight.Bold).fontColor('#182238').layoutWeight(1)
          Text(this.quarantined ? this.text($r('app.string.ap_ui_waiting_for_the_system_request_to_finish')) : this.busy ? this.text($r('app.string.ap_ui_running')) : this.text($r('app.string.ap_ui_ready')))
            .fontSize(12).fontColor('#667085')
        }.width('100%')
        Column({ space: 12 }) {
          Text(this.text($r('app.string.ap_ui_select_workload'))).fontSize(18).fontWeight(FontWeight.Medium).fontColor('#182238').width('100%')
          Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.SpaceBetween }) {
            ForEach(WORKLOADS, (spec: WorkloadSpec, index: number) => {
              Button(workloadTitle(this.getUIContext().getHostContext(), spec.id, spec.label)).type(ButtonType.Normal).width('48%').height(48).margin({ bottom: 8 })
                .fontSize(14).borderRadius(12).enabled(!this.busy)
                .fontColor(this.selected === index ? '#246BFD' : '#667085')
                .backgroundColor(this.selected === index ? '#EEF4FF' : '#F5F7FA')
                .onClick(() => { this.selected = index; })
            }, (spec: WorkloadSpec) => spec.id)
          }.width('100%')
          Text(workloadDescription(this.getUIContext().getHostContext(),
            WORKLOADS[this.selected].id, WORKLOADS[this.selected].description)).fontSize(12).fontColor('#667085')
            .maxLines(2).textOverflow({ overflow: TextOverflow.Ellipsis }).width('100%')
          Row({ space: 6 }) {
            ForEach(MODES, (item: string, index: number) => {
              Button(modeLabel(item)).type(ButtonType.Normal).layoutWeight(1).height(44).fontSize(14)
                .padding({ left: 4, right: 4 }).borderRadius(12).enabled(!this.busy)
                .fontColor(this.mode === index ? '#246BFD' : '#667085')
                .backgroundColor(this.mode === index ? '#EEF4FF' : '#F5F7FA')
                .onClick(() => { this.mode = index; })
            }, (item: string) => item)
          }.width('100%')
          Row({ space: 8 }) {
            Button(this.text($r('app.string.ap_ui_run_one_experiment'))).type(ButtonType.Normal).layoutWeight(1).height(48).fontSize(15)
              .fontColor('#FFFFFF').backgroundColor('#246BFD').borderRadius(12).enabled(!this.busy)
              .onClick(() => { void this.runExperiment(); })
            Button(this.text($r('app.string.ap_ui_cancel_waiting'))).type(ButtonType.Normal).layoutWeight(1).height(48).fontSize(14)
              .fontColor('#B42318').backgroundColor('#FEF3F2').borderRadius(12)
              .enabled(this.busy && !this.quarantined)
              .onClick(() => { this.service?.cancelExperiment(); })
          }.width('100%')
        }.width('100%').padding(16).alignItems(HorizontalAlign.Start).backgroundColor('#FFFFFF').borderRadius(16)
        if (this.notice.length > 0 && this.notice !== this.seriesView.message) {
          Text(this.notice).fontSize(14).fontColor('#182238').width('100%')
            .padding(12).backgroundColor('#EEF4FF').borderRadius(12)
        }
        if (this.resultLines.length > 0) { this.card(this.text($r('app.string.ap_ui_current_result')), this.resultLines) }
        ExperimentSeriesPanel({
          view: this.seriesView,
          onCountChange: (count: number): void => { this.changeSeriesCount(count); },
          onStart: (): void => { void this.startSeries(); },
          onStopAfterCurrent: (): void => { this.stopSeries(); },
          onCancelNow: (): void => { this.cancelSeries(); },
          onCopyReport: (): void => { this.copySeries(); }
        })
        Button(this.historyOpen ? this.text($r('app.string.ap_ui_hide_history_and_ledger')) : this.text($r('app.string.ap_ui_history_and_ledger'))).id('apLabHistoryToggle')
          .type(ButtonType.Normal).width('100%').height(44).fontSize(14)
          .fontColor('#246BFD').backgroundColor('#FFFFFF').borderRadius(12)
          .onClick((): void => { this.historyOpen = !this.historyOpen; })
        if (this.historyOpen) {
          SeriesHistoryPanel({
            view: this.historyView,
            onSelect: (ownerId: string): void => { this.selectHistory(ownerId, false); },
            onCompareBase: (ownerId: string): void => { this.selectHistory(ownerId, true); },
            onFormatChange: (format: ReportFormat): void => { this.historyFormat(format); },
            onCopySelected: (): void => { void this.copyHistory(); }
          })
          Text(this.text($r('app.string.ap_ui_experiment_records_for_the_selected_workload_and_mode'))).fontSize(18).fontWeight(FontWeight.Medium).fontColor('#182238').width('100%')
          Button(this.failedOnly ? this.text($r('app.string.ap_ui_show_all_results')) : this.text($r('app.string.ap_ui_failed_missing_records_only'))).type(ButtonType.Normal)
            .width('100%').height(44).fontSize(14).fontColor('#667085').backgroundColor('#FFFFFF').borderRadius(12)
            .onClick(() => { this.failedOnly = !this.failedOnly; })
          ForEach(this.filteredRecords(), (record: ExperimentRecord) => {
            Button() {
              Text(record.text()).fontSize(14).fontColor('#182238').maxLines(2)
                .textOverflow({ overflow: TextOverflow.Ellipsis }).width('100%')
            }.type(ButtonType.Normal).width('100%').constraintSize({ minHeight: 56 })
            .padding(12).backgroundColor('#FFFFFF').borderRadius(12)
            .onClick(() => { this.detailId = record.id; })
          }, (record: ExperimentRecord) => record.id)
          this.card(this.text($r('app.string.ap_ui_record_details')), this.details())
          this.card(this.text($r('app.string.ap_ui_sample_percentiles_under_matching_conditions')), this.summaryLines())
          this.card(this.text($r('app.string.ap_ui_comparison_under_matching_conditions')), [this.comparison()])
          Button(this.text($r('app.string.ap_ui_copy_filtered_ledger_report_markdown'))).type(ButtonType.Normal).width('100%').height(48)
            .fontSize(14).fontColor('#FFFFFF').backgroundColor('#246BFD').borderRadius(12)
            .onClick(() => { this.exportAnalysisReport(); })
          Row({ space: 8 }) {
            Button(this.text($r('app.string.ap_ui_copy_redacted_ledger'))).type(ButtonType.Normal).layoutWeight(1).height(44)
              .fontSize(14).fontColor('#667085').backgroundColor('#FFFFFF').borderRadius(12)
              .onClick(() => { this.exportLedger(); })
            Button(this.text($r('app.string.ap_ui_clear_ledger'))).type(ButtonType.Normal).layoutWeight(1).height(44)
              .fontSize(14).fontColor('#B42318').backgroundColor('#FEF3F2').borderRadius(12)
              .enabled(!this.busy).onClick(() => { this.clearLedger(); })
          }.width('100%')
        }
        Button(this.detailsOpen ? this.text($r('app.string.ap_ui_hide_experiment_details')) : this.text($r('app.string.ap_ui_experiment_details'))).id('apLabDetailsToggle')
          .type(ButtonType.Normal).width('100%').height(44).fontSize(14)
          .fontColor('#667085').backgroundColor('#FFFFFF').borderRadius(12)
          .onClick((): void => { this.detailsOpen = !this.detailsOpen; })
        if (this.detailsOpen) {
          this.card(this.text($r('app.string.ap_ui_stage_results')), this.stageLines)
          this.card(this.text($r('app.string.ap_ui_packaged_workload_catalog')), workloadLines())
        }
      }.width('100%').padding({ left: 20, right: 20, top: 20, bottom: 28 }).alignItems(HorizontalAlign.Start)
    }.width('100%').height('100%').backgroundColor('#F5F7FA')
  }
}
