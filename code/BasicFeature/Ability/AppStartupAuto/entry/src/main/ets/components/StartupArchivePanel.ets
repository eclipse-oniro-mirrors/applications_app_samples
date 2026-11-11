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
import { QueryOutcome, QueryRecord, RefreshSource } from '../autostart/AutoStartupTypes';
import { detailLines, describeRecord } from '../autostart/history/HistoryView';
import {
  ArchiveAction, ArchiveCleanup, ArchiveClipboardPort, ArchiveQuery, ArchivedQuery,
  ArchiveSnapshot, ArchiveStage, ArchiveView, StartupArchiveRepository, startupArchiveRepository
} from '../autostart/archive/StartupArchive';

export class SystemArchiveClipboard implements ArchiveClipboardPort {
  async writeText(text: string): Promise<void> {
    const data = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, text);
    await pasteboard.getSystemPasteboard().setData(data);
  }
}

/** The production history page and isolated test pages embed this same component. */
@Component
export struct StartupArchivePanel {
  repository: StartupArchiveRepository = startupArchiveRepository;
  clipboard: ArchiveClipboardPort = new SystemArchiveClipboard();
  @Prop liveRecords: QueryRecord[] = [];
  @State private state: ArchiveSnapshot = new ArchiveSnapshot();
  @State private viewState: ArchiveView = new ArchiveView();
  @State private query: ArchiveQuery = new ArchiveQuery();
  @State private selectedId: number = 0;
  @State private details: string = localText('startup_text_0780');
  @State private confirmation: string = '';
  @State private actionNotice: string = '';
  @State private working: boolean = false;
  @State private showInformation: boolean = false;
  private unsubscribe: (() => void) | undefined = undefined;
  private generation: number = 0;
  private operation: number = 0;
  private confirmationRevision: number = 0;
  private automaticTarget: boolean = false;
  private cleanup: ArchiveCleanup = new ArchiveCleanup();

  aboutToAppear(): void {
    this.generation++; this.working = false; this.confirmation = ''; this.actionNotice = '';
    const unsubscribe = this.unsubscribe;
    if (unsubscribe !== undefined) { unsubscribe(); }
    this.unsubscribe = this.repository.subscribe((): void => this.refresh());
    this.refresh();
  }

  aboutToDisappear(): void {
    this.generation++; this.operation++;
    const unsubscribe = this.unsubscribe;
    if (unsubscribe !== undefined) { unsubscribe(); this.unsubscribe = undefined; }
  }

  private refresh(): void {
    this.state = this.repository.snapshot();
    this.viewState = this.repository.view(this.query);
    const selected = this.state.rows.find((row: ArchivedQuery): boolean => row.archiveId === this.selectedId);
    const inRange = selected !== undefined && this.repository.view(this.query).rows.some(
      (row: ArchivedQuery): boolean => row.archiveId === this.selectedId);
    this.details = selected === undefined || !inRange ? localText('startup_text_0780') :
      formatResource('startup_format_6d031965ef02', [String(selected.archiveId), String(selected.record.id)]) +
      detailLines(selected.viewRecord()).join('\n') + localText('startup_text_0783');
  }

  private run(request: Promise<ArchiveAction>): void {
    const generation = this.generation; const operation = ++this.operation;
    this.working = true; this.confirmation = ''; this.actionNotice = localText('startup_text_0784');
    request.then((result: ArchiveAction): void => {
      if (generation !== this.generation || operation !== this.operation) { return; }
      this.working = false; this.actionNotice = result.message; this.refresh();
    }).catch((): void => {
      if (generation !== this.generation || operation !== this.operation) { return; }
      this.working = false; this.actionNotice = localText('startup_text_0785'); this.refresh();
    });
  }

  private chooseSource(value: string): void {
    this.operation++; this.working = false; this.query.source = value; this.query.page = 0;
    this.query = this.query.clone(); this.actionNotice = localText('startup_text_0786'); this.confirmation = ''; this.refresh();
  }

  private chooseOutcome(value: string): void {
    this.operation++; this.working = false; this.query.outcome = value; this.query.page = 0;
    this.query = this.query.clone(); this.actionNotice = localText('startup_text_0787'); this.confirmation = ''; this.refresh();
  }

  private ask(kind: string): void {
    this.confirmationRevision = this.state.revision; this.confirmation = kind;
    if (kind === 'auto') { this.automaticTarget = !this.state.automatic; }
    if (kind === 'clean') {
      this.cleanup = this.repository.previewCleanup(); this.actionNotice = this.cleanup.preview.text();
    } else if (kind === 'clear') {
      this.actionNotice = formatResource('startup_format_250354fd74be', [String(this.state.rows.length)]);
    } else {
      this.actionNotice = this.state.automatic ? localText('startup_text_0790') :
        localText('startup_text_0791');
    }
  }

  private confirmAutomatic(): void {
    this.run(this.repository.setAutomatic(this.automaticTarget, this.liveRecords));
  }

  @Builder
  private filterButton(label: string, id: string, active: boolean, onTap: () => void) {
    Button(label, { type: ButtonType.Normal }).id(id).height(44).fontSize(13)
      .fontColor(active ? Color.White : $r('app.color.accent_color'))
      .backgroundColor(active ? $r('app.color.accent_color') : $r('app.color.accent_soft'))
      .borderRadius(10).padding({ left: 12, right: 12 }).margin({ right: 8, bottom: 8 })
      .onClick(onTap)
  }

  @Builder
  private filters() {
    TextInput({ text: this.query.needle, placeholder: localText('startup_text_0792') })
      .id('archive-search').maxLength(64)
      .onChange((text: string): void => {
        this.operation++; this.working = false; this.query.needle = text; this.query.page = 0;
        this.query = this.query.clone(); this.confirmation = ''; this.actionNotice = localText('startup_text_0793'); this.refresh();
      })
    TextInput({ text: this.query.day, placeholder: localText('startup_text_0794') })
      .id('archive-day').maxLength(10)
      .onChange((text: string): void => {
        this.operation++; this.working = false; this.confirmation = ''; this.actionNotice = localText('startup_text_0795');
        this.query.day = text; this.query.page = 0; this.query = this.query.clone(); this.refresh();
      })
    Flex({ wrap: FlexWrap.Wrap }) {
      this.filterButton(localText('startup_text_0510'), 'archive-source-all', this.query.source === '', (): void => this.chooseSource(''))
      this.filterButton(localText('startup_text_0796'), 'archive-source-manual', this.query.source === RefreshSource.MANUAL,
        (): void => this.chooseSource(RefreshSource.MANUAL))
      this.filterButton(localText('startup_text_0797'), 'archive-source-settings', this.query.source === RefreshSource.SETTINGS,
        (): void => this.chooseSource(RefreshSource.SETTINGS))
      this.filterButton(localText('startup_text_0798'), 'archive-source-initial', this.query.source === RefreshSource.INITIAL,
        (): void => this.chooseSource(RefreshSource.INITIAL))
      this.filterButton(localText('startup_text_0799'), 'archive-source-foreground', this.query.source === RefreshSource.FOREGROUND,
        (): void => this.chooseSource(RefreshSource.FOREGROUND))
    }.width('100%')
    Flex({ wrap: FlexWrap.Wrap }) {
      this.filterButton(localText('startup_text_0509'), 'archive-outcome-all', this.query.outcome === '', (): void => this.chooseOutcome(''))
      this.filterButton(localText('startup_text_0001'), 'archive-outcome-success', this.query.outcome === QueryOutcome.SUCCESS,
        (): void => this.chooseOutcome(QueryOutcome.SUCCESS))
      this.filterButton(localText('startup_text_0002'), 'archive-outcome-failure', this.query.outcome === QueryOutcome.FAILURE,
        (): void => this.chooseOutcome(QueryOutcome.FAILURE))
      this.filterButton(localText('startup_text_0003'), 'archive-outcome-unsupported', this.query.outcome === QueryOutcome.UNSUPPORTED,
        (): void => this.chooseOutcome(QueryOutcome.UNSUPPORTED))
      this.filterButton(localText('startup_text_0004'), 'archive-outcome-timeout', this.query.outcome === QueryOutcome.TIMEOUT,
        (): void => this.chooseOutcome(QueryOutcome.TIMEOUT))
      this.filterButton(localText('startup_text_0005'), 'archive-outcome-unknown', this.query.outcome === QueryOutcome.UNKNOWN,
        (): void => this.chooseOutcome(QueryOutcome.UNKNOWN))
    }.width('100%')
  }

  build() {
    Column({ space: 12 }) {
      Text(localText('startup_text_0800')).fontSize(18).fontColor($r('app.color.text_primary')).fontWeight(FontWeight.Bold)
      Button(this.showInformation ? localText('startup_text_0801') : localText('startup_text_0802'), { type: ButtonType.Normal })
        .height(44).fontSize(13).fontColor($r('app.color.text_secondary')).backgroundColor(Color.Transparent).padding(0)
        .onClick(() => { this.showInformation = !this.showInformation; })
      if (this.showInformation) {
        Text(localText('startup_text_0803'))
          .fontSize(12).fontColor($r('app.color.text_secondary')).width('100%')
      }
      Text(formatResource('startup_format_106ca484f859', [String(this.state.stage), String(this.state.automatic ? localText('startup_text_0805') : localText('startup_text_0776'))]) +
        formatResource('startup_format_0a37325a996c', [String(this.state.pending), String(this.state.paused ? localText('startup_text_0807') : localText('startup_text_0808'))]))
        .id('archive-status').fontSize(12).width('100%')
      Text(formatResource('startup_format_4d47b0140922', [String(this.state.rows.length), String(this.viewState.matchedTotal), String(this.state.bytes)]))
        .id('archive-count').fontSize(12).width('100%')
      Text(this.actionNotice || this.viewState.notice || this.state.notice)
        .id('archive-notice').fontSize(12).width('100%').fontColor($r('app.color.warning_color'))
      if (this.state.pending > 0) {
        Text(localText('startup_text_0812'))
          .fontSize(12).width('100%')
      }
      Column({ space: 8 }) {
        Button(localText('startup_text_0813')).id('archive-save').fontColor(Color.White)
          .backgroundColor($r('app.color.accent_color')).width('100%')
          .constraintSize({ minHeight: 44 }).fontSize(14)
          .enabled(this.state.canWrite && !this.working && this.liveRecords.length > 0)
          .onClick((): void => this.run(this.repository.save(this.liveRecords)))
        Button(this.state.automatic ? localText('startup_text_0814') : localText('startup_text_0815')).id('archive-auto')
          .fontColor($r('app.color.accent_color')).backgroundColor($r('app.color.accent_soft'))
          .width('100%').constraintSize({ minHeight: 44 }).fontSize(14)
          .enabled(this.state.canWrite && !this.working).onClick((): void => this.ask('auto'))
        if (this.confirmation === 'auto') {
          Button(localText('startup_text_0816')).id('archive-auto-confirm').constraintSize({ minHeight: 44 }).fontSize(14)
            .enabled(!this.working)
            .onClick((): void => this.confirmAutomatic())
          Button(localText('startup_text_0769')).id('archive-cancel').constraintSize({ minHeight: 44 }).fontSize(14)
            .onClick((): void => {
              this.confirmation = '';
              this.actionNotice = localText('startup_text_0817');
            })
        }
      }.width('100%')
      Row({ space: 6 }) {
        Button(localText('startup_text_0818')).id('archive-retry').layoutWeight(1)
          .fontColor($r('app.color.accent_color')).backgroundColor($r('app.color.accent_soft'))
          .constraintSize({ minHeight: 44 }).fontSize(14).enabled(!this.working)
          .onClick((): void => {
            if (this.state.stage === ArchiveStage.BLOCKED || this.state.stage === ArchiveStage.DETACHED) {
              const generation = this.generation;
              this.repository.reload().then((): void => {
                if (generation === this.generation) { this.run(this.repository.retryPending()); }
              });
            } else { this.run(this.repository.retryPending()); }
          })
        Button(localText('startup_text_0819')).id('archive-copy').layoutWeight(1)
          .fontColor($r('app.color.accent_color')).backgroundColor($r('app.color.accent_soft'))
          .constraintSize({ minHeight: 44 }).fontSize(14)
          .enabled(this.state.canWrite && !this.working && this.viewState.matchedTotal > 0)
          .onClick((): void => this.run(this.repository.copy(this.query, this.clipboard)))
      }.width('100%')
      Row({ space: 6 }) {
        Button(localText('startup_text_0820')).id('archive-clean-preview').layoutWeight(1)
          .fontColor($r('app.color.accent_color')).backgroundColor($r('app.color.accent_soft'))
          .constraintSize({ minHeight: 44 }).fontSize(14).enabled(this.state.canWrite && !this.working)
          .onClick((): void => this.ask('clean'))
        Button(localText('startup_text_0821')).id('archive-clear').layoutWeight(1)
          .fontColor($r('app.color.error_color')).backgroundColor($r('app.color.error_soft'))
          .constraintSize({ minHeight: 44 }).fontSize(14)
          .enabled(this.state.canWrite && !this.working && this.state.rows.length > 0)
          .onClick((): void => this.ask('clear'))
      }
      if (this.confirmation === 'clean') {
        Button(localText('startup_text_0822')).id('archive-clean-confirm').constraintSize({ minHeight: 44 }).fontSize(14).enabled(!this.working)
          .onClick((): void => this.run(this.repository.applyCleanup(this.cleanup)))
      }
      if (this.confirmation === 'clear') {
        Button(localText('startup_text_0823')).id('archive-clear-confirm').constraintSize({ minHeight: 44 }).fontSize(14).enabled(!this.working)
          .onClick((): void => this.run(this.repository.clear(this.confirmationRevision)))
      }
      if (this.confirmation.length > 0 && this.confirmation !== 'auto') {
        Button(localText('startup_text_0769')).id('archive-cancel').constraintSize({ minHeight: 44 }).fontSize(14)
          .onClick((): void => {
            this.confirmation = '';
            this.actionNotice = localText('startup_text_0817');
          })
      }
      this.filters()
      Text(this.viewState.summary).id('archive-summary').fontSize(12).width('100%')
      if (this.viewState.matchedTotal === 0) {
        Text(localText('startup_text_0824')).id('archive-empty').fontSize(13)
      }
      ForEach(this.viewState.rows, (row: ArchivedQuery) => {
        Button(formatResource('startup_format_0d580d1b7775', [String(row.archiveId), String(row.record.id), String(describeRecord(row.viewRecord()))]))
          .id(`archive-row-${row.archiveId}`).constraintSize({ minHeight: 44 }).fontSize(14)
          .fontColor($r('app.color.text_primary')).backgroundColor($r('app.color.muted_background')).width('100%')
          .onClick((): void => { this.selectedId = row.archiveId; this.refresh(); })
      }, (row: ArchivedQuery): string => String(row.archiveId))
      Row({ space: 10 }) {
        Button(localText('startup_text_0825')).id('archive-prev').constraintSize({ minHeight: 44 }).fontSize(14).enabled(this.viewState.page > 0)
          .onClick((): void => {
            this.query.page = this.viewState.page - 1;
            this.query = this.query.clone();
            this.refresh();
          })
        Text(`${this.viewState.page + 1}/${this.viewState.pageCount}`).id('archive-page')
        Button(localText('startup_text_0826')).id('archive-next').constraintSize({ minHeight: 44 }).fontSize(14)
          .enabled(this.viewState.page + 1 < this.viewState.pageCount)
          .onClick((): void => {
            this.query.page = this.viewState.page + 1;
            this.query = this.query.clone();
            this.refresh();
          })
      }
      Text(this.details).id('archive-details').fontSize(12).width('100%')
      Text(localText('startup_text_0827')).fontSize(14)
      ForEach(this.viewState.dayLines, (line: string) => {
        Text(line).fontSize(12).width('100%')
      }, (line: string): string => line)
    }.id('archive-panel').width('100%').padding(16).backgroundColor($r('app.color.card_background')).borderRadius(16)
  }
}
