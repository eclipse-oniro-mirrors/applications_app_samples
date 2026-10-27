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

import { fileIo, picker } from '@kit.CoreFileKit';
import { MediaPendingSession, MediaSessionStore } from '../model/MediaSessionStore';
import { MediaReports, MediaSessionReport } from '../model/MediaSessionReport';
import { MediaPerformanceBaseline } from '../model/MediaPerformanceBaseline';
import { MediaStateFiles } from '../model/MediaStateFiles';
import { MediaTaskCoordinator } from '../model/MediaTaskCoordinator';
import { MediaFileWriter } from '../model/MediaFileWriter';
import { MediaRecoveryFiles, MediaPartialFile } from '../model/MediaRecoveryFiles';

@Component
export struct MediaSessionsPanel {
  @State private pending: MediaPendingSession[] = [];
  @State private reports: MediaSessionReport[] = [];
  @State private baselines: MediaSessionReport[] = [];
  @State private notice: string = '';
  @State private working: boolean = false;
  @State private expandedId: string = '';
  @State private partials: MediaPartialFile[] = [];

  aboutToAppear(): void { void this.refresh(); }

  private async refresh(): Promise<void> {
    const context = this.getUIContext().getHostContext();
    if (context === undefined || this.working) { return; }
    this.working = true;
    try {
      this.pending = (await MediaSessionStore.pending(context)).filter((item: MediaPendingSession): boolean =>
        item.id !== MediaTaskCoordinator.current()?.id);
      this.reports = await MediaSessionStore.reports(context);
      this.partials = MediaTaskCoordinator.busy() ? [] : await MediaRecoveryFiles.list(context);
      this.baselines = MediaReports.parseList(await MediaStateFiles.read(context, 'baselines.json', '[]'))
        .filter((item: MediaSessionReport): boolean => item.outcome === 'completed').slice(0, 20);
    } catch (error) { this.notice = JSON.stringify(error); }
    finally { this.working = false; }
  }

  private comparison(report: MediaSessionReport): string {
    const base: MediaSessionReport | undefined = this.baselines.find((item: MediaSessionReport): boolean =>
      MediaPerformanceBaseline.matches(item, report));
    return base === undefined ? '' : MediaPerformanceBaseline.compare(report, base);
  }

  private async baseline(report: MediaSessionReport): Promise<void> {
    const context = this.getUIContext().getHostContext();
    if (context === undefined || this.working || report.outcome !== 'completed') { return; }
    this.working = true;
    try {
      const next: MediaSessionReport[] = [report].concat(this.baselines.filter((item: MediaSessionReport): boolean =>
        !MediaPerformanceBaseline.matches(item, report))).slice(0, 20);
      await MediaStateFiles.write(context, 'baselines.json', JSON.stringify(next));
      this.baselines = next;
    } catch (error) { this.notice = JSON.stringify(error); }
    finally { this.working = false; }
  }

  private async acknowledge(item: MediaPendingSession): Promise<void> {
    const context = this.getUIContext().getHostContext();
    if (context === undefined || this.working || MediaTaskCoordinator.busy()) { return; }
    this.working = true;
    try {
      if (item.operation === 'recording') {
        await MediaSessionStore.finish(context, item.id);
      } else {
        const report: MediaSessionReport = MediaReports.base(item.id, item.operation, 'interrupted');
        report.error = MediaReports.error('process.interrupted', -1, 'Previous process ended before task completion');
        await MediaSessionStore.finish(context, item.id, report);
      }
    } catch (error) { this.notice = JSON.stringify(error); }
    finally { this.working = false; }
    await this.refresh();
  }

  private async clearPartials(): Promise<void> {
    const context = this.getUIContext().getHostContext();
    if (context === undefined || this.working || MediaTaskCoordinator.busy()) { return; }
    this.working = true;
    try {
      const result = await this.getUIContext().getPromptAction().showDialog({
        message: $r('app.string.task_partial_confirm'), buttons: [
          { text: $r('app.string.task_keep'), color: '#475467' },
          { text: $r('app.string.task_clear_partials'), color: '#B42318' } ] });
      if (result.index === 1) { await MediaRecoveryFiles.clear(context); }
    } catch (error) { this.notice = JSON.stringify(error); }
    finally { this.working = false; }
    await this.refresh();
  }

  private async exportReport(report: MediaSessionReport, json: boolean): Promise<void> {
    const context = this.getUIContext().getHostContext();
    if (context === undefined || this.working) { return; }
    this.working = true;
    try {
      const paths: string[] = await new picker.DocumentViewPicker(context).save({
        newFileNames: ['avcodec-session-' + report.createdAt + (json ? '.json' : '.txt')] });
      if (paths.length === 0) { return; }
      const shared: MediaSessionReport = MediaReports.shareable(report);
      const target: fileIo.File = await fileIo.open(paths[0], fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.TRUNC);
      try { await MediaFileWriter.writeAll(target.fd, json ? JSON.stringify(shared, null, 2) : MediaReports.text(shared)); }
      finally { await fileIo.close(target); }
    } catch (error) { this.notice = JSON.stringify(error); }
    finally { this.working = false; }
  }

  build() {
    Column({ space: 10 }) {
      Row() {
        Text($r('app.string.task_sessions')).fontSize(17).layoutWeight(1)
        Button($r('app.string.task_refresh')).fontSize(12).enabled(!this.working)
          .onClick((): void => { void this.refresh(); })
      }.width('100%')
      if (this.pending.length > 0) {
        Text($r('app.string.task_recovery')).fontWeight(FontWeight.Medium)
        Text($r('app.string.task_recovery_hint')).fontSize(12).fontColor('#667085')
        ForEach(this.pending, (item: MediaPendingSession) => {
          Row({ space: 6 }) {
            Text(item.operation + ' · ' + new Date(item.startedAt).toLocaleString()).fontSize(12).layoutWeight(1)
            Button($r('app.string.task_acknowledge')).fontSize(12).enabled(!this.working)
              .onClick((): void => { void this.acknowledge(item); })
          }.width('100%')
        }, (item: MediaPendingSession): string => item.id)
      }
      if (this.partials.length > 0) {
        Text($r('app.string.task_partials')).fontSize(13)
        Text(this.partials.length + ' · ' + (this.partials.reduce((sum: number, item: MediaPartialFile): number =>
          sum + item.bytes, 0) / 1048576).toFixed(1) + ' MiB').fontSize(12).fontColor('#667085')
        Button($r('app.string.task_clear_partials')).fontSize(12).enabled(!this.working)
          .onClick((): void => { void this.clearPartials(); })
      }
      Text($r('app.string.task_baseline_hint')).fontSize(12).fontColor('#667085')
      if (this.reports.length === 0) { Text($r('app.string.task_no_reports')).fontSize(13) }
      ForEach(this.reports, (report: MediaSessionReport) => {
        Column({ space: 8 }) {
          Text(report.operation + ' · ' + report.outcome + ' · ' + new Date(report.createdAt).toLocaleString())
            .fontSize(13).width('100%').onClick((): void => {
              this.expandedId = this.expandedId === report.id ? '' : report.id;
            })
          if (this.expandedId === report.id) {
            Text(MediaReports.text(MediaReports.shareable(report))).fontSize(11).copyOption(CopyOptions.InApp)
            Text(this.comparison(report).length > 0 ? this.comparison(report) : $r('app.string.task_no_baseline'))
              .fontSize(11).fontColor('#475467')
            Button($r('app.string.task_save_baseline')).fontSize(12)
              .enabled(!this.working && report.outcome === 'completed')
              .onClick((): void => { void this.baseline(report); })
            Row({ space: 6 }) {
              Button($r('app.string.task_export_text')).fontSize(12).layoutWeight(1).enabled(!this.working)
                .onClick((): void => { void this.exportReport(report, false); })
              Button($r('app.string.task_export_json')).fontSize(12).layoutWeight(1).enabled(!this.working)
                .onClick((): void => { void this.exportReport(report, true); })
            }.width('100%')
          }
        }.width('100%').alignItems(HorizontalAlign.Start).padding(10).backgroundColor('#F2F4F7').borderRadius(10)
      }, (report: MediaSessionReport): string => report.id)
      if (this.notice.length > 0) { Text(this.notice).fontSize(12).fontColor('#B42318') }
    }.width('100%').padding(14).alignItems(HorizontalAlign.Start).backgroundColor('#F8FAFC').borderRadius(16)
  }
}
