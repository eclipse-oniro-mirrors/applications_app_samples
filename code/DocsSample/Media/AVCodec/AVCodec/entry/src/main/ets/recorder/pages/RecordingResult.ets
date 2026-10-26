/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { common } from '@kit.AbilityKit';
import { pasteboard } from '@kit.BasicServicesKit';
import { RecordingReport, RecordingReportStore } from '../../model/RecordingReportStore';
import { RecordingSessionController } from '../../controller/RecordingSessionController';
import { LocalizedText } from '../../common/LocalizedText';
import { RecorderLiveDiagnosticsModel } from '../../model/RecorderLiveDiagnosticsModel';

interface RecordingResultParams { sessionId: string; }

@Entry
@Component
struct RecordingResult {
  @State private report: RecordingReport | undefined = undefined;
  @State private status: string = '';
  @State private expanded: boolean = false;
  private alive: boolean = true;

  aboutToAppear(): void { void this.load(); }
  aboutToDisappear(): void { this.alive = false; }

  private async load(): Promise<void> {
    const params = this.getUIContext().getRouter().getParams() as RecordingResultParams;
    const context = this.getUIContext().getHostContext();
    if (context === undefined) { return; }
    try {
      const report: RecordingReport = await RecordingReportStore.read(context, params.sessionId);
      if (!this.alive) { return; }
      this.report = report;
      if (report.persistenceFailed === true) {
        this.status = LocalizedText.get($r('app.string.rec_report_save_failed'));
      }
      try {
        const enriched: RecordingReport = await RecordingSessionController.enrich(context, report);
        if (this.alive) {
          this.report = JSON.parse(JSON.stringify(enriched)) as RecordingReport;
          this.status = '';
        }
      } catch (_error) { /* 已保存的快照仍可用，不把元数据或再次保存失败当成录制失败。 */ }
    } catch (_error) { this.status = RecordingReportStore.unavailable(); }
  }

  private play(uri: string): void {
    if (uri.length === 0) { return; }
    AppStorage.setOrCreate('recordingResultPlayback', uri);
    this.getUIContext().getRouter().back({ url: 'pages/Index' });
  }

  private async exportReport(json: boolean): Promise<void> {
    const context = this.getUIContext().getHostContext();
    if (context === undefined || this.report === undefined) { return; }
    try {
      if (await RecordingReportStore.export(context, this.report, json)) {
        this.status = LocalizedText.get($r('app.string.device_report_saved'));
      }
    } catch (_error) { this.status = LocalizedText.get($r('app.string.device_report_save_failed')); }
  }

  private async copyReport(): Promise<void> {
    if (this.report === undefined) { return; }
    try {
      await pasteboard.getSystemPasteboard().setData(
        pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, this.report.text));
      this.status = LocalizedText.get($r('app.string.device_report_copied'));
    } catch (_error) { this.status = LocalizedText.get($r('app.string.device_report_copy_failed')); }
  }

  build() {
    Column({ space: 12 }) {
      Text($r('app.string.rec_result_title')).fontSize(24).fontWeight(FontWeight.Bold).width('100%')
      Scroll() {
        Column({ space: 12 }) {
          if (this.report !== undefined) {
            Text(this.report.title).fontSize(17).width('100%')
            Text(this.report.sessionId + ' · ' + this.report.durationSeconds.toFixed(1) + ' s').fontSize(12).width('100%')
            Text(RecorderLiveDiagnosticsModel.endReason(this.report.diagnostics.endReason)).fontSize(13).width('100%')
            if (this.report.primaryDump.length > 0) {
              Text('Dump: ' + this.report.primaryDump.split('/').pop()).fontSize(12).width('100%')
            }
            if (this.report.secondaryDump.length > 0) {
              Text('Dump: ' + this.report.secondaryDump.split('/').pop()).fontSize(12).width('100%')
            }
            Text(this.report.diagnostics.endReason === 'user_stop' &&
              this.report.diagnostics.failure.stage.length === 0 && this.report.diagnostics.primary.frames > 0 ?
              $r('app.string.rec_result_complete') :
              $r('app.string.rec_result_partial')).width('100%')
            Text(this.report.fileMetadata || LocalizedText.get($r('app.string.rec_result_loading')))
              .fontSize(13).width('100%')
            Text($r('app.string.rec_result_metadata_note')).fontSize(12).fontColor('#667085').width('100%')
            Flex({ wrap: FlexWrap.Wrap }) {
              Button($r('app.string.rec_result_primary')).margin(4).fontSize(13)
                .enabled(this.report.primaryUri.length > 0).onClick((): void => this.play(this.report?.primaryUri ?? ''))
              if (this.report.secondaryUri.length > 0) {
                Button($r('app.string.rec_result_secondary')).margin(4).fontSize(13)
                  .onClick((): void => this.play(this.report?.secondaryUri ?? ''))
              }
            }.width('100%')
            Button(this.expanded ? $r('app.string.rec_result_hide_report') : $r('app.string.rec_result_report'))
              .fontSize(13).onClick((): void => { this.expanded = !this.expanded; })
            if (this.expanded) {
              Text(this.report.text).fontSize(12).width('100%').copyOption(CopyOptions.LocalDevice)
            }
            Flex({ wrap: FlexWrap.Wrap }) {
              Button($r('app.string.rec_result_copy')).fontSize(12).margin(4).onClick((): void => { void this.copyReport(); })
              Button('TXT').fontSize(12).margin(4).onClick((): void => { void this.exportReport(false); })
              Button('JSON').fontSize(12).margin(4).onClick((): void => { void this.exportReport(true); })
            }.width('100%')
          }
          Text(this.status).fontSize(13).width('100%')
        }.width('100%').alignItems(HorizontalAlign.Start)
      }.layoutWeight(1).width('100%')
      Button($r('app.string.rec_result_back')).onClick((): void => { this.getUIContext().getRouter().back(); })
    }.width('100%').height('100%').padding(20).backgroundColor('#F5F7FA')
  }
}
