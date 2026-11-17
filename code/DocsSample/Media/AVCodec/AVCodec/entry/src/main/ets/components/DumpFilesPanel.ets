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

import { LocalizedText } from '../common/LocalizedText';
import { DumpFileEntry, DumpFilesModel, DumpSessionEntry } from '../model/DumpFilesModel';
import { DumpPolicyModel } from '../model/DumpPolicyModel';
import player from 'libplayer.so';
import recorder from 'librecorder.so';

@Component
export struct DumpFilesPanel {
  @Prop @Watch('syncPolicy') policyRevision: number = 0;
  onPolicyChanged: () => void = (): void => {};
  @State private sessions: DumpSessionEntry[] = [];
  @State private expandedSession: string = '';
  @State private totalBytes: number = 0;
  @State private availableBytes: number = -1;
  @State private busy: boolean = false;
  @State private maxMiB: number = DumpPolicyModel.maxMiB;
  @State private maxSeconds: number = DumpPolicyModel.maxSeconds;
  @State private notice: string = '';

  aboutToAppear(): void {
    this.syncPolicy();
    void this.refresh();
  }

  private syncPolicy(): void {
    this.maxMiB = DumpPolicyModel.maxMiB;
    this.maxSeconds = DumpPolicyModel.maxSeconds;
  }

  private async refresh(): Promise<void> {
    const context = this.getUIContext().getHostContext();
    if (context === undefined) {
      return;
    }
    try {
      this.sessions = await DumpFilesModel.sessions(context.filesDir);
      this.totalBytes = this.sessions.reduce(
        (sum: number, session: DumpSessionEntry): number => sum + session.bytes, 0);
      this.availableBytes = await DumpFilesModel.freeBytes(context.filesDir);
    } catch (_error) {
      this.notice = LocalizedText.get($r('app.string.dump_list_failed'));
    }
  }

  private async exportEntry(entry: DumpFileEntry): Promise<void> {
    const context = this.getUIContext().getHostContext();
    if (context === undefined || this.busy) {
      return;
    }
    if (player.getState() !== player.PlayerState.IDLE || recorder.getDiagnostics().active) {
      this.notice = LocalizedText.get($r('app.string.dump_wait_export'));
      return;
    }
    this.busy = true;
    try {
      const saved: boolean = await DumpFilesModel.exportFile(context, entry);
      this.notice = saved ? LocalizedText.get($r('app.string.dump_exported_prefix')) + entry.name : LocalizedText.get($r('app.string.dump_export_cancelled'));
    } catch (error) {
      this.notice = LocalizedText.get($r('app.string.dump_export_failed_prefix')) + String(error);
    } finally {
      this.busy = false;
    }
  }

  private async exportGroup(session: DumpSessionEntry): Promise<void> {
    const context = this.getUIContext().getHostContext();
    if (context === undefined || this.busy) {
      return;
    }
    if (player.getState() !== player.PlayerState.IDLE || recorder.getDiagnostics().active) {
      this.notice = LocalizedText.get($r('app.string.dump_wait_export'));
      return;
    }
    this.busy = true;
    this.notice = LocalizedText.get($r('app.string.dump_exporting_prefix')) + session.id;
    try {
      const saved: boolean = await DumpFilesModel.exportSession(context, session);
      this.notice = saved ? LocalizedText.get($r('app.string.dump_group_exported_prefix')) + session.id + '.zip' : LocalizedText.get($r('app.string.dump_export_cancelled'));
    } catch (error) {
      this.notice = LocalizedText.get($r('app.string.dump_group_failed_prefix')) + String(error);
    } finally {
      this.busy = false;
    }
  }

  private confirmRemove(session: DumpSessionEntry): void {
    if (this.busy) {
      return;
    }
    this.getUIContext().showAlertDialog({
      title: LocalizedText.get($r('app.string.dump_cleanup_title')),
      message: session.id + LocalizedText.get($r('app.string.dump_cleanup_message_prefix')) + session.files.length +
        LocalizedText.get($r('app.string.dump_cleanup_message_suffix')),
      primaryButton: { value: LocalizedText.get($r('app.string.action_cancel')), action: (): void => {} },
      secondaryButton: { value: LocalizedText.get($r('app.string.action_cleanup')), action: (): void => { void this.removeGroup(session.id); } }
    });
  }

  private async removeGroup(sessionId: string): Promise<void> {
    const context = this.getUIContext().getHostContext();
    if (context === undefined || this.busy) {
      return;
    }
    this.busy = true;
    try {
      const removed: number = await DumpFilesModel.removeSession(context.filesDir, sessionId);
      this.notice = LocalizedText.get($r('app.string.dump_cleaned_prefix')) + removed + LocalizedText.get($r('app.string.dump_cleaned_suffix'));
    } catch (error) {
      this.notice = LocalizedText.get($r('app.string.dump_cleanup_failed_prefix')) + String(error);
    } finally {
      await this.refresh();
      this.busy = false;
    }
  }

  build() {
    Column({ space: 8 }) {
      Text(LocalizedText.get($r('app.string.dump_files_title'))).fontSize(16).fontWeight(FontWeight.Medium).width('100%')
      Text(LocalizedText.get($r('app.string.dump_total_prefix')) + (this.totalBytes / 1048576).toFixed(2) + LocalizedText.get($r('app.string.dump_available_prefix')) +
        (this.availableBytes < 0 ? '--' : (this.availableBytes / 1073741824).toFixed(2) + ' GiB'))
        .fontSize(12).fontColor('#475467').width('100%')
      Text(LocalizedText.get($r('app.string.dump_policy_hint')))
        .fontSize(12).fontColor('#667085').width('100%')
      Row({ space: 8 }) {
        Button(this.maxMiB === DumpPolicyModel.UNLIMITED ? $r('app.string.dump_size_unlimited') :
          this.maxMiB + ' MiB')
          .layoutWeight(1).fontSize(12).padding({ left: 8, right: 8 })
          .onClick((): void => {
            const options = DumpPolicyModel.SIZE_OPTIONS;
            this.maxMiB = options[(options.indexOf(this.maxMiB) + 1) % options.length];
            DumpPolicyModel.maxMiB = this.maxMiB;
            this.onPolicyChanged();
          })
        Button(this.maxSeconds === DumpPolicyModel.UNLIMITED ? $r('app.string.dump_duration_unlimited') :
          this.maxSeconds + ' s')
          .layoutWeight(1).fontSize(12).padding({ left: 8, right: 8 })
          .onClick((): void => {
            const options = DumpPolicyModel.DURATION_OPTIONS;
            this.maxSeconds = options[(options.indexOf(this.maxSeconds) + 1) % options.length];
            DumpPolicyModel.maxSeconds = this.maxSeconds;
            this.onPolicyChanged();
          })
        Button(LocalizedText.get($r('app.string.action_refresh'))).fontSize(12).padding({ left: 12, right: 12 }).enabled(!this.busy)
          .onClick((): void => { void this.refresh(); })
      }.width('100%')
      if (this.maxMiB === DumpPolicyModel.UNLIMITED || this.maxSeconds === DumpPolicyModel.UNLIMITED) {
        Text($r('app.string.dump_unlimited_hint')).fontSize(11).fontColor('#9A6700').width('100%')
      }
      Text(LocalizedText.get($r('app.string.dump_layout_hint')))
        .fontSize(11).fontColor('#667085').width('100%')
      Text(LocalizedText.get($r('app.string.dump_space_hint')))
        .fontSize(11).fontColor('#667085').width('100%')
      if (this.sessions.length === 0) {
        Text(LocalizedText.get($r('app.string.dump_files_empty'))).fontSize(12).fontColor('#667085')
      }
      ForEach(this.sessions, (session: DumpSessionEntry): void => {
        Column({ space: 8 }) {
          Row({ space: 8 }) {
            Column({ space: 4 }) {
              Text(session.id).fontSize(12).width('100%').maxLines(2)
              Text(session.files.length + LocalizedText.get($r('app.string.dump_file_count_suffix')) + (session.bytes / 1048576).toFixed(2) + ' MiB')
                .fontSize(11).fontColor('#667085').width('100%')
              Text(session.status).fontSize(11).fontColor('#475467').width('100%')
            }.layoutWeight(1)
            Button(LocalizedText.get($r('app.string.dump_export_session'))).fontSize(12).enabled(!this.busy)
              .onClick((): void => { void this.exportGroup(session); })
          }.width('100%')
          Button(this.expandedSession === session.id ? LocalizedText.get($r('app.string.dump_files_collapse')) : LocalizedText.get($r('app.string.dump_files_expand')))
            .fontSize(11).backgroundColor('#EEF2F6').fontColor('#475467')
            .onClick((): void => { this.expandedSession = this.expandedSession === session.id ? '' : session.id; })
          Button(LocalizedText.get($r('app.string.dump_cleanup_session'))).fontSize(11).fontColor('#B42318').backgroundColor('#FEF3F2')
            .enabled(!this.busy).onClick((): void => this.confirmRemove(session))
          if (this.expandedSession === session.id) {
            ForEach(session.files, (entry: DumpFileEntry): void => {
              Row({ space: 8 }) {
                Text(entry.name + ' · ' + (entry.bytes / 1048576).toFixed(2) + ' MiB')
                  .fontSize(11).layoutWeight(1).maxLines(3)
                Button(LocalizedText.get($r('app.string.action_export'))).fontSize(11).enabled(!this.busy)
                  .onClick((): void => { void this.exportEntry(entry); })
              }.width('100%')
            }, (entry: DumpFileEntry): string => entry.path)
          }
        }.width('100%').padding(8).backgroundColor(Color.White).borderRadius(8)
      }, (session: DumpSessionEntry): string => session.id)
      if (this.notice.length > 0) {
        Text(this.notice).fontSize(12).fontColor('#175CD3').width('100%')
      }
    }.width('100%').padding(14).backgroundColor('#F8FAFC').borderRadius(16)
  }
}
