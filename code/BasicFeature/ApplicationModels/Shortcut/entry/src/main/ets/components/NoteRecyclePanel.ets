import { BusinessSnapshot, BusinessStore, RecycledNote, businessStore, localDateKey } from '../business/BusinessStore';
import { RecycleBatchAction, RecycleBatchPreview, RecycleBatchRow } from '../business/RecycleBatch';
import {
  MAX_ACTIVE_NOTES, MAX_RECYCLED_NOTES, isTrashExpired, trashDaysRemaining
} from '../business/NoteRecyclePolicy';
import { BG, CARD, TEXT, MUTED, ACCENT, DANGER, LINE } from './Ui';

/** Actual recycle surface; the same component accepts an isolated real store in native UI tests. */
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
      title: restoring ? '确认批量恢复' : '确认永久删除',
      message: restoring ? `恢复${preview.selectedCount}项便签？条目变化时不会执行。` :
        `永久删除${preview.selectedCount}项便签及历史，无法恢复。条目变化时不会执行。`,
      primaryButton: { value: '取消', action: () => this.cancelBatch() },
      secondaryButton: { value: restoring ? '批量恢复' : '永久删除所选项',
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
        Text(`已选${this.selectedIds.length}项`)
          .id('note-trash-selection-summary').fontSize(14).fontColor(TEXT).layoutWeight(1)
        Button('清选', { type: ButtonType.Normal }).id('note-trash-clear-selection')
          .height(44).fontSize(14).fontColor(ACCENT).backgroundColor(Color.Transparent)
          .enabled(!this.view.busy).onClick(() => this.clearSelection())
      }.width('100%')
      Row({ space: 8 }) {
        Button('选全部未过期', { type: ButtonType.Normal }).id('note-trash-select-all-restorable')
          .height(44).layoutWeight(1).fontSize(14).fontColor(ACCENT).backgroundColor(BG)
          .enabled(this.writable()).onClick(() => this.selectAll(true))
        Button('选全部回收项', { type: ButtonType.Normal }).id('note-trash-select-all')
          .height(44).layoutWeight(1).fontSize(14).fontColor(ACCENT).backgroundColor(BG)
          .enabled(this.writable()).onClick(() => this.selectAll(false))
      }.width('100%')
      Row({ space: 12 }) {
        Button('批量恢复预览', { type: ButtonType.Normal }).id('note-trash-batch-restore').height(44).fontSize(14)
          .layoutWeight(1).enabled(this.writable() && this.selectedIds.length > 0)
          .onClick(() => this.previewSelection(RecycleBatchAction.RESTORE))
        Button('批量永久删预览', { type: ButtonType.Normal }).id('note-trash-batch-purge').height(44).fontSize(14)
          .layoutWeight(1).fontColor(DANGER).enabled(this.writable() && this.selectedIds.length > 0)
          .onClick(() => this.previewSelection(RecycleBatchAction.PURGE))
      }.width('100%')
    }.width('100%')
  }

  @Builder
  private batchReview() {
    Column({ space: 6 }) {
      Text(`${this.batchPreview.action === RecycleBatchAction.RESTORE ? '恢复' : '永久删除'}预览：` +
        `${this.batchPreview.selectedCount}项`)
        .fontSize(15).fontWeight(FontWeight.Medium).fontColor(TEXT).width('100%')
      Text(`可恢复名额 ${this.batchPreview.availableSlots}`)
        .fontSize(12).fontColor(MUTED).width('100%')
      if (this.batchPreview.eligible) {
        Text(`完成后活动${this.batchPreview.resultingActiveCount}项，` +
          `回收${this.batchPreview.resultingTrashCount}项，历史${this.batchPreview.resultingHistoryCount}条`)
          .fontSize(12).fontColor(ACCENT).width('100%')
      } else {
        Text(`整体不可执行：${this.batchPreview.errors.join('；')}`)
          .id('note-trash-batch-errors').fontSize(14).fontColor(DANGER).width('100%')
      }
      Scroll() {
        Column({ space: 4 }) {
          ForEach(this.batchPreview.rows, (row: RecycleBatchRow) => {
            Text(`${row.title.length > 0 ? row.title : row.trashId}：` +
              `${row.eligible ? `可处理，历史${row.historyCount}条` : row.reason}`)
              .id(`note-trash-batch-row-${row.trashId}`).fontSize(12)
              .fontColor(row.eligible ? TEXT : DANGER).width('100%')
          }, (row: RecycleBatchRow, index: number) => `${index}-${row.trashId}`)
        }.width('100%')
      }.layoutWeight(1).width('100%')
      Row({ space: 12 }) {
        Button('取消预览', { type: ButtonType.Normal }).id('note-trash-batch-cancel').height(44).fontSize(14)
          .layoutWeight(1).enabled(!this.view.busy).onClick(() => this.cancelBatch())
        Button('确认批量操作', { type: ButtonType.Normal }).id('note-trash-batch-confirm').height(44).fontSize(14)
          .layoutWeight(1).enabled(this.writable() && this.batchPreview.eligible)
          .onClick(() => this.confirmBatch())
      }.width('100%')
    }.id('note-trash-batch-preview').layoutWeight(1).width('100%').padding(16).backgroundColor(BG).borderRadius(8)
  }

  private confirmPurge(entry: RecycledNote): void {
    const trashId: string = entry.trashId;
    this.getUIContext().showAlertDialog({
      title: '永久删除便签',
      message: `永久删除“${entry.note.title}”及其历史？此操作无法恢复。`,
      primaryButton: { value: '取消', action: () => {} },
      secondaryButton: { value: '永久删除', fontColor: DANGER,
        action: () => { void this.store.purgeTrashedNote(trashId); } }
    });
  }

  private confirmCleanup(): void {
    this.getUIContext().showAlertDialog({
      title: '清理过期便签',
      message: '永久删除操作时已过期的便签及历史，无法恢复；未过期便签保留。',
      primaryButton: { value: '取消', action: () => {} },
      secondaryButton: { value: '清理过期项', fontColor: DANGER,
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
      Text(entry.note.body.length > 0 ? entry.note.body : '（无正文）')
        .fontSize(14).fontColor(MUTED).maxLines(3).width('100%')
        .textOverflow({ overflow: TextOverflow.Ellipsis }).copyOption(CopyOptions.InApp)
      Text(`移入时间 ${localDateKey(entry.deletedAt)} · 保留历史 ${entry.history.length} 条`)
        .fontSize(12).fontColor(MUTED).width('100%')
      Text(isTrashExpired(entry.deletedAt, this.view.observedAt) ? '已过期，不能恢复' :
        `剩余约${trashDaysRemaining(entry.deletedAt, this.view.observedAt)}天`)
        .fontSize(12).fontColor(isTrashExpired(entry.deletedAt, this.view.observedAt) ? DANGER : ACCENT).width('100%')
      Row({ space: 12 }) {
        Button('恢复', { type: ButtonType.Normal })
          .id(`trash-restore-${entry.trashId}`).layoutWeight(1).height(44)
          .enabled(this.writable() && this.view.notes.length < MAX_ACTIVE_NOTES &&
            !isTrashExpired(entry.deletedAt, this.view.observedAt))
          .fontColor(ACCENT).backgroundColor($r('app.color.accent_soft'))
          .onClick(() => { void this.store.restoreTrashedNote(entry.trashId); })
        Button('永久删除', { type: ButtonType.Normal })
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
        Text('便签回收站').fontSize(24).fontWeight(FontWeight.Bold).fontColor(TEXT).layoutWeight(1)
        Button('关闭', { type: ButtonType.Normal }).id('note-trash-close').height(44).fontSize(14)
          .fontColor(ACCENT).backgroundColor(Color.Transparent).onClick(() => this.closePanel())
      }.width('100%')
      Text(`回收站 ${this.view.recycledNotes.length} / ${MAX_RECYCLED_NOTES} · 已过期 ${this.view.expiredTrashCount}`)
        .id('note-trash-summary').fontSize(14).fontColor(TEXT).width('100%')
      if (this.batchPreview.token.length === 0) {
        Text('移入后30天内可恢复')
          .fontSize(12).fontColor(MUTED).width('100%')
      }
      if (this.view.busy) {
        Text('处理中…').id('note-trash-busy').fontSize(14).fontColor(ACCENT).width('100%')
      }
      if (this.view.error.length > 0 || this.view.message.length > 0) {
        Text(this.view.error.length > 0 ? this.view.error : this.view.message)
          .id('note-trash-status').fontSize(14).fontColor(this.view.error.length > 0 ? DANGER : ACCENT).width('100%')
      }
      if (this.view.notes.length >= MAX_ACTIVE_NOTES) {
        Text('活动便签已满，释放名额后可恢复').id('note-trash-capacity').fontSize(14).fontColor(DANGER).width('100%')
      }
      if (this.view.storageRecoveryRequired || !this.view.ready) {
        Button(this.view.storageRecoveryRequired ? '重新读取核对' : '重新读取')
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
          Button('刷新列表', { type: ButtonType.Normal }).id('note-trash-refresh').height(44).fontSize(14)
            .fontSize(14).enabled(!this.view.busy).fontColor(ACCENT).onClick(() => this.changed())
          Button('清理过期项', { type: ButtonType.Normal }).id('note-trash-cleanup').height(44).fontSize(14)
            .fontSize(14).enabled(this.writable() && this.view.expiredTrashCount > 0)
            .fontColor(DANGER).onClick(() => this.confirmCleanup())
          Button(this.multiSelect ? '退出多选' : '多选', { type: ButtonType.Normal })
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
        Text('回收站为空').id('note-trash-empty').fontSize(16).fontColor(MUTED)
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
