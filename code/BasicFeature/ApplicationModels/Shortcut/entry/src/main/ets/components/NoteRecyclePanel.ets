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

import { uiText } from '../i18n/Strings';
import { BusinessSnapshot, BusinessStore, RecycledNote, businessStore, localDateKey } from '../business/BusinessStore';
import { RecycleBatchAction, RecycleBatchPreview, RecycleBatchRow } from '../business/RecycleBatch';
import {
  MAX_ACTIVE_NOTES, MAX_RECYCLED_NOTES, isTrashExpired, trashDaysRemaining
} from '../business/NoteRecyclePolicy';
import { BG, CARD, TEXT, MUTED, ACCENT, DANGER, LINE } from './Ui';

/** Actual recycle view; the same component accepts an isolated real store in native UI tests. */
@Component
export struct NoteRecyclePanel {
  store: BusinessStore = businessStore;
  onClose: (() => void) | undefined = undefined;
  @State private view: BusinessSnapshot = new BusinessSnapshot();
  @State private multiSelect: boolean = false;
  @State private selectedIds: string[] = [];
  @State private batchPreview: RecycleBatchPreview = new RecycleBatchPreview();
  private pendingBatchToken: string = '';
  private panelEpoch: number = 0;
  private listening: boolean = false;
  private changed: () => void = (): void => {
    this.view = this.store.snapshot();
    if (this.pendingBatchToken.length > 0 && !this.view.storageRecoveryRequired && !this.view.busy) {
      if (this.view.lastRecycleBatchResult.token === this.pendingBatchToken &&
        this.view.lastRecycleBatchResult.success) {
        this.selectedIds = [];
      }
      this.pendingBatchToken = '';
    }
  };

  aboutToAppear(): void {
    this.panelEpoch++;
    this.multiSelect = false;
    this.selectedIds = [];
    this.batchPreview = new RecycleBatchPreview();
    this.pendingBatchToken = '';
    if (!this.listening) { this.store.subscribe(this.changed); this.listening = true; }
    this.changed();
  }

  aboutToDisappear(): void {
    this.panelEpoch++;
    if (this.listening) { this.store.unsubscribe(this.changed); this.listening = false; }
    this.store.cancelRecycleBatchPreview(this.batchPreview.token);
  }

  private writable(): boolean {
    return this.view.ready && !this.view.busy && !this.view.storageRecoveryRequired;
  }

  private closePanel(): void {
    this.store.cancelRecycleBatchPreview(this.batchPreview.token);
    this.onClose?.();
  }

  private cancelBatch(): void {
    this.store.cancelRecycleBatchPreview(this.batchPreview.token);
    this.batchPreview = new RecycleBatchPreview();
  }

  private toggleSelection(trashId: string, selected: boolean): void {
    this.cancelBatch();
    if (selected && !this.selectedIds.includes(trashId)) {
      this.selectedIds = this.selectedIds.concat([trashId]);
    } else if (!selected) {
      this.selectedIds = this.selectedIds.filter((id: string): boolean => id !== trashId);
    }
  }

  private selectAll(restorable: boolean): void {
    this.cancelBatch();
    this.changed();
    this.selectedIds = this.view.recycledNotes.filter((entry: RecycledNote): boolean =>
      !restorable || !isTrashExpired(entry.deletedAt, this.view.observedAt))
      .map((entry: RecycledNote): string => entry.trashId);
  }

  private clearSelection(): void {
    this.cancelBatch();
    this.selectedIds = [];
  }

  private previewSelection(action: RecycleBatchAction): void {
    this.batchPreview = this.store.previewRecycleBatch(this.selectedIds, action);
  }

  private confirmBatch(): void {
    const preview: RecycleBatchPreview = this.batchPreview;
    if (!preview.eligible || preview.token.length === 0) { return; }
    const restoring: boolean = preview.action === RecycleBatchAction.RESTORE;
    this.getUIContext().showAlertDialog({
      title: restoring ? uiText("shortcut_text_0478") : uiText("shortcut_text_0481"),
      message: restoring ? uiText("shortcut_text_0278", [String(preview.selectedCount)]) :
        uiText("shortcut_text_0698", [String(preview.selectedCount)]),
      primaryButton: { value: uiText("shortcut_text_0452"), action: () => this.cancelBatch() },
      secondaryButton: { value: restoring ? uiText("shortcut_text_0425") : uiText("shortcut_text_0701"),
        fontColor: restoring ? ACCENT : DANGER,
        action: () => { void this.applyBatch(preview.token); } }
    });
  }

  private async applyBatch(token: string): Promise<void> {
    const epoch: number = this.panelEpoch;
    this.pendingBatchToken = token;
    const result = await this.store.applyRecycleBatch(token);
    if (epoch !== this.panelEpoch) { return; }
    this.batchPreview = new RecycleBatchPreview();
    if (result.success) { this.selectedIds = []; }
    if (!result.requiresRecovery) { this.pendingBatchToken = ''; }
  }

  @Builder
  private batchControls() {
    Column({ space: 8 }) {
      Row({ space: 8 }) {
        Text(uiText("shortcut_text_0684", [String(this.selectedIds.length)]))
          .id('note-trash-selection-summary').fontSize(14).fontColor(TEXT).layoutWeight(1)
        Button(uiText("shortcut_text_0442"), { type: ButtonType.Normal }).id('note-trash-clear-selection')
          .height(44).fontSize(14).fontColor(ACCENT).backgroundColor(Color.Transparent)
          .enabled(!this.view.busy).onClick(() => this.clearSelection())
      }.width('100%')
      Row({ space: 8 }) {
        Button(uiText("shortcut_text_0631"), { type: ButtonType.Normal }).id('note-trash-select-all-restorable')
          .height(44).layoutWeight(1).fontSize(14).fontColor(ACCENT).backgroundColor(BG)
          .enabled(this.writable()).onClick(() => this.selectAll(true))
        Button(uiText("shortcut_text_0630"), { type: ButtonType.Normal }).id('note-trash-select-all')
          .height(44).layoutWeight(1).fontSize(14).fontColor(ACCENT).backgroundColor(BG)
          .enabled(this.writable()).onClick(() => this.selectAll(false))
      }.width('100%')
      Row({ space: 12 }) {
        Button(uiText("shortcut_text_0426"), { type: ButtonType.Normal }).id('note-trash-batch-restore').height(44).fontSize(14)
          .layoutWeight(1).enabled(this.writable() && this.selectedIds.length > 0)
          .onClick(() => this.previewSelection(RecycleBatchAction.RESTORE))
        Button(uiText("shortcut_text_0428"), { type: ButtonType.Normal }).id('note-trash-batch-purge').height(44).fontSize(14)
          .layoutWeight(1).fontColor(DANGER).enabled(this.writable() && this.selectedIds.length > 0)
          .onClick(() => this.previewSelection(RecycleBatchAction.PURGE))
      }.width('100%')
    }.width('100%')
  }

  @Builder
  private batchReview() {
    Column({ space: 6 }) {
      Text(uiText("shortcut_text_0032", [String(this.batchPreview.action === RecycleBatchAction.RESTORE ? uiText("shortcut_text_0275") : uiText("shortcut_text_0696"))]) +
        uiText("shortcut_text_0031", [String(this.batchPreview.selectedCount)]))
        .fontSize(15).fontWeight(FontWeight.Medium).fontColor(TEXT).width('100%')
      Text(uiText("shortcut_text_0357", [String(this.batchPreview.availableSlots)]))
        .fontSize(12).fontColor(MUTED).width('100%')
      if (this.batchPreview.eligible) {
        Text(uiText("shortcut_text_0567", [String(this.batchPreview.resultingActiveCount)]) +
          uiText("shortcut_text_0296", [String(this.batchPreview.resultingTrashCount), String(this.batchPreview.resultingHistoryCount)]))
          .fontSize(12).fontColor(ACCENT).width('100%')
      } else {
        Text(uiText("shortcut_text_0737", [String(this.batchPreview.errors.join('；'))]))
          .id('note-trash-batch-errors').fontSize(14).fontColor(DANGER).width('100%')
      }
      Scroll() {
        Column({ space: 4 }) {
          ForEach(this.batchPreview.rows, (row: RecycleBatchRow) => {
            Text(`${row.title.length > 0 ? row.title : row.trashId}：` +
              `${row.eligible ? uiText("shortcut_text_0354", [String(row.historyCount)]) : row.reason}`)
              .id(`note-trash-batch-row-${row.trashId}`).fontSize(12)
              .fontColor(row.eligible ? TEXT : DANGER).width('100%')
          }, (row: RecycleBatchRow, index: number) => `${index}-${row.trashId}`)
        }.width('100%')
      }.layoutWeight(1).width('100%')
      Row({ space: 12 }) {
        Button(uiText("shortcut_text_0455"), { type: ButtonType.Normal }).id('note-trash-batch-cancel').height(44).fontSize(14)
          .layoutWeight(1).enabled(!this.view.busy).onClick(() => this.cancelBatch())
        Button(uiText("shortcut_text_0477"), { type: ButtonType.Normal }).id('note-trash-batch-confirm').height(44).fontSize(14)
          .layoutWeight(1).enabled(this.writable() && this.batchPreview.eligible)
          .onClick(() => this.confirmBatch())
      }.width('100%')
    }.id('note-trash-batch-preview').layoutWeight(1).width('100%').padding(16).backgroundColor(BG).borderRadius(8)
  }

  private confirmPurge(entry: RecycledNote): void {
    const trashId: string = entry.trashId;
    this.getUIContext().showAlertDialog({
      title: uiText("shortcut_text_0699"),
      message: uiText("shortcut_text_0697", [String(entry.note.title)]),
      primaryButton: { value: uiText("shortcut_text_0452"), action: () => {} },
      secondaryButton: { value: uiText("shortcut_text_0696"), fontColor: DANGER,
        action: () => { void this.store.purgeTrashedNote(trashId); } }
    });
  }

  private confirmCleanup(): void {
    this.getUIContext().showAlertDialog({
      title: uiText("shortcut_text_0440"),
      message: uiText("shortcut_text_0700"),
      primaryButton: { value: uiText("shortcut_text_0452"), action: () => {} },
      secondaryButton: { value: uiText("shortcut_text_0441"), fontColor: DANGER,
        action: () => { void this.store.purgeExpiredNotes(); } }
    });
  }

  @Builder
  private recycledCard(entry: RecycledNote) {
    Column({ space: 8 }) {
      if (this.multiSelect) {
        Checkbox({ name: entry.trashId, group: 'recycle-selection' })
          .id(`trash-select-${entry.trashId}`).width(24).height(24).margin(10)
          .responseRegion({ x: -10, y: -10, width: 44, height: 44 }).select(this.selectedIds.includes(entry.trashId))
          .enabled(this.writable()).onChange((selected: boolean) => this.toggleSelection(entry.trashId, selected))
      }
      Text(entry.note.title).fontSize(17).fontWeight(FontWeight.Medium).fontColor(TEXT).width('100%')
      Text(entry.note.body.length > 0 ? entry.note.body : uiText("shortcut_text_0008"))
        .fontSize(14).fontColor(MUTED).maxLines(3).width('100%')
        .textOverflow({ overflow: TextOverflow.Ellipsis }).copyOption(CopyOptions.InApp)
      Text(uiText("shortcut_text_0648", [String(localDateKey(entry.deletedAt)), String(entry.history.length)]))
        .fontSize(12).fontColor(MUTED).width('100%')
      Text(isTrashExpired(entry.deletedAt, this.view.observedAt) ? uiText("shortcut_text_0655") :
        uiText("shortcut_text_0512", [String(trashDaysRemaining(entry.deletedAt, this.view.observedAt))]))
        .fontSize(12).fontColor(isTrashExpired(entry.deletedAt, this.view.observedAt) ? DANGER : ACCENT).width('100%')
      Row({ space: 12 }) {
        Button(uiText("shortcut_text_0275"), { type: ButtonType.Normal })
          .id(`trash-restore-${entry.trashId}`).layoutWeight(1).height(44)
          .enabled(this.writable() && this.view.notes.length < MAX_ACTIVE_NOTES &&
            !isTrashExpired(entry.deletedAt, this.view.observedAt))
          .fontColor(ACCENT).backgroundColor($r('app.color.accent_soft'))
          .onClick(() => { void this.store.restoreTrashedNote(entry.trashId); })
        Button(uiText("shortcut_text_0696"), { type: ButtonType.Normal })
          .id(`trash-purge-${entry.trashId}`).layoutWeight(1).height(44)
          .enabled(this.writable()).fontColor(DANGER).backgroundColor($r('app.color.danger_soft'))
          .onClick(() => this.confirmPurge(entry))
      }.width('100%')
    }
    .id(`trash-item-${entry.trashId}`).width('100%').padding(16)
    .border({ width: 1, color: LINE }).backgroundColor(BG).borderRadius(16)
  }

  build() {
    Column({ space: 12 }) {
      Row() {
        Text(uiText("shortcut_text_0085")).fontSize(24).fontWeight(FontWeight.Bold).fontColor(TEXT).layoutWeight(1)
        Button(uiText("shortcut_text_0253"), { type: ButtonType.Normal }).id('note-trash-close').height(44).fontSize(14)
          .fontColor(ACCENT).backgroundColor(Color.Transparent).onClick(() => this.closePanel())
      }.width('100%')
      Text(uiText("shortcut_text_0299", [String(this.view.recycledNotes.length), String(MAX_RECYCLED_NOTES), String(this.view.expiredTrashCount)]))
        .id('note-trash-summary').fontSize(14).fontColor(TEXT).width('100%')
      if (this.batchPreview.token.length === 0) {
        Text(uiText("shortcut_text_0645"))
          .fontSize(12).fontColor(MUTED).width('100%')
      }
      if (this.view.busy) {
        Text(uiText("shortcut_text_0167")).id('note-trash-busy').fontSize(14).fontColor(ACCENT).width('100%')
      }
      if (this.view.error.length > 0 || this.view.message.length > 0) {
        Text(this.view.error.length > 0 ? this.view.error : this.view.message)
          .id('note-trash-status').fontSize(14).fontColor(this.view.error.length > 0 ? DANGER : ACCENT).width('100%')
      }
      if (this.view.notes.length >= MAX_ACTIVE_NOTES) {
        Text(uiText("shortcut_text_0310")).id('note-trash-capacity').fontSize(14).fontColor(DANGER).width('100%')
      }
      if (this.view.storageRecoveryRequired || !this.view.ready) {
        Button(this.view.storageRecoveryRequired ? uiText("shortcut_text_0778") : uiText("shortcut_text_0777"))
          .id('note-trash-reload').height(44).fontSize(14).enabled(!this.view.busy && !this.view.loading)
          .onClick(() => {
            if (this.view.storageRecoveryRequired) {
              void this.store.recoverStorage();
            } else {
              this.store.retry();
            }
          })
      }
      if (this.batchPreview.token.length === 0) {
        Row({ space: 8 }) {
          Button(uiText("shortcut_text_0535"), { type: ButtonType.Normal }).id('note-trash-refresh').height(44).fontSize(14)
            .fontSize(14).enabled(!this.view.busy).fontColor(ACCENT).onClick(() => this.changed())
          Button(uiText("shortcut_text_0441"), { type: ButtonType.Normal }).id('note-trash-cleanup').height(44).fontSize(14)
            .fontSize(14).enabled(this.writable() && this.view.expiredTrashCount > 0)
            .fontColor(DANGER).onClick(() => this.confirmCleanup())
          Button(this.multiSelect ? uiText("shortcut_text_0565") : uiText("shortcut_text_0230"), { type: ButtonType.Normal })
            .id('note-trash-multiselect').height(44).fontSize(14)
            .fontSize(14).enabled(this.writable()).onClick(() => {
              this.clearSelection(); this.multiSelect = !this.multiSelect;
            })
        }.width('100%')
        if (this.multiSelect) { this.batchControls() }
      }
      if (this.batchPreview.token.length > 0) {
        this.batchReview()
      } else if (this.view.recycledNotes.length === 0) {
        Text(uiText("shortcut_text_0304")).id('note-trash-empty').fontSize(16).fontColor(MUTED)
          .width('100%').padding({ top: 32, bottom: 32 })
      } else {
        List({ space: 12 }) {
          ForEach(this.view.recycledNotes, (entry: RecycledNote) => {
            ListItem() { this.recycledCard(entry) }
          }, (entry: RecycledNote) => entry.trashId)
        }.id('note-trash-list').layoutWeight(1).width('100%')
      }
    }
    .id('note-trash-panel').width('100%').height('100%').padding(20).backgroundColor(CARD)
  }
}
