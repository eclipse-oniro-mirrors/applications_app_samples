import {
  BG, CARD, TEXT, MUTED, ACCENT, DANGER, OK, LINE, PageHeader, StatusBanner, EmptyState
} from '../components/Ui';
import { BusinessSnapshot, NoteItem, NoteRevision, businessStore, localDateKey } from '../business/BusinessStore';
import { DiffResult, diffBadge, diffLines } from '../business/TextDiff';
import { PageKey, clockText } from '../model/ShortcutModels';
import { appNavigation } from '../navigation/AppNavigation';
import { promptAction } from '@kit.ArkUI';
import { TrashEditDecision } from '../business/NoteRecyclePolicy';
import { NoteRecyclePanel } from '../components/NoteRecyclePanel';

@Entry
@Component
struct NotePage {
  @State private view: BusinessSnapshot = new BusinessSnapshot();
  @State private historyOpen: boolean = false;
  @State private recycleOpen: boolean = false;
  @State private historyNoteId: string = '';
  @State private revisions: NoteRevision[] = [];
  @State private compareOpen: boolean = false;
  @State private compareSummary: string = '';
  @State private compareDetail: string = '';
  @State private compareLines: string[] = [];
  private subscribed: boolean = false;
  private changed: () => void = () => {
    this.view = businessStore.snapshot();
  };

  aboutToAppear(): void {
    this.activate();
  }

  onPageShow(): void {
    this.activate();
  }

  onPageHide(): void {
    this.deactivate();
  }

  aboutToDisappear(): void {
    this.deactivate();
  }

  onBackPress(): boolean {
    void appNavigation.back();
    return true;
  }

  private activate(): void {
    if (!this.subscribed) {
      businessStore.subscribe(this.changed);
      this.subscribed = true;
    }
    this.changed();
    appNavigation.activate(PageKey.NOTE, this.changed);
  }

  private deactivate(): void {
    if (this.subscribed) {
      businessStore.unsubscribe(this.changed);
      this.subscribed = false;
    }
    appNavigation.deactivate(PageKey.NOTE);
  }

  private draftStatus(): string {
    if (this.view.busy) {
      return '保存中…';
    }
    if (this.view.draftDirty) {
      return '有未保存修改';
    }
    return this.view.draftKept ? '草稿已保留' : '新便签';
  }

  private editing(): boolean {
    return this.view.editingNoteId.length > 0;
  }

  private openHistory(note: NoteItem): void {
    this.historyNoteId = note.id;
    this.revisions = businessStore.historyFor(note.id);
    this.historyOpen = true;
  }

  private restoreRevision(revision: NoteRevision): void {
    void businessStore.restoreRevision(revision.noteId, revision.revisionId).then((ok: boolean) => {
      if (ok) {
        this.revisions = businessStore.historyFor(this.historyNoteId);
        this.historyOpen = false;
      }
    });
  }

  private actionLabel(action: string): string {
    switch (action) {
      case 'create': return '创建';
      case 'restore': return '恢复前';
      default: return '编辑';
    }
  }

  @Builder
  private historyPanel() {
    Column({ space: 12 }) {
      Row() {
        Text('版本历史').fontSize(24).fontWeight(FontWeight.Bold).fontColor(TEXT).layoutWeight(1)
        Button('关闭', { type: ButtonType.Normal }).height(44).fontSize(14).fontColor(ACCENT)
          .backgroundColor(Color.Transparent).onClick(() => { this.historyOpen = false; })
      }
      .width('100%')
      Text('全部便签共保留最近100次修订')
        .fontSize(14).fontColor(MUTED).width('100%')
      if (this.revisions.length === 0) {
        EmptyState({ title: '暂无历史版本' })
      } else {
        List({ space: 10 }) {
          ForEach(this.revisions, (revision: NoteRevision) => {
            ListItem() {
              Column({ space: 6 }) {
                Row() {
                  Text(`${this.actionLabel(revision.action)} · ${localDateKey(revision.savedAt)} ` +
                    `${clockText(revision.savedAt)}`)
                    .fontSize(12).fontColor(MUTED).layoutWeight(1)
                  Button('对比', { type: ButtonType.Normal }).fontSize(14).fontColor(ACCENT)
                    .backgroundColor($r('app.color.accent_soft')).height(44)
                    .margin({ right: 6 })
                    .onClick(() => this.compareRevision(revision))
                  Button('恢复', { type: ButtonType.Normal }).fontSize(14).fontColor(ACCENT)
                    .backgroundColor($r('app.color.accent_soft')).height(44)
                    .onClick(() => this.restoreRevision(revision))
                }
                .width('100%')
                Text(revision.title.length > 0 ? revision.title : '（无标题）')
                  .fontSize(15).fontWeight(FontWeight.Medium).fontColor(TEXT).width('100%')
                if (revision.body.length > 0) {
                  Text(revision.body).fontSize(14).fontColor(MUTED).maxLines(2)
                    .textOverflow({ overflow: TextOverflow.Ellipsis }).width('100%')
                }
              }
              .width('100%').padding(12).backgroundColor(BG).borderRadius(12)
            }
          }, (revision: NoteRevision) => revision.revisionId)
        }
        .layoutWeight(1).width('100%')
      }
    }
    .width('100%').height('100%').padding({ left: 20, right: 20, top: 24, bottom: 20 })
    .backgroundColor(CARD)
  }

  private compareRevision(revision: NoteRevision): void {
    const note: NoteItem | undefined = this.view.notes.find((item: NoteItem): boolean =>
      item.id === this.historyNoteId);
    const currentBody: string = note === undefined ? '' : note.body;
    const result: DiffResult = diffLines(revision.body, currentBody);
    this.compareSummary = diffBadge(result.summary);
    this.compareDetail = result.summary.text();
    this.compareLines = result.changeLines();
    this.compareOpen = true;
  }

  private closeCompare(): void {
    this.compareOpen = false;
    this.compareLines = [];
    this.compareSummary = '';
    this.compareDetail = '';
  }

  @Builder
  private comparePanel() {
    Column({ space: 10 }) {
      Row() {
        Text('版本对比').fontSize(24).fontWeight(FontWeight.Bold).fontColor(TEXT).layoutWeight(1)
        Button('关闭', { type: ButtonType.Normal }).height(44).fontSize(14).fontColor(ACCENT)
          .backgroundColor(Color.Transparent).onClick(() => this.closeCompare())
      }
      .width('100%')
      Text(`改动：${this.compareSummary}`).fontSize(14).fontColor(MUTED).width('100%')
      Text(this.compareDetail).fontSize(12).fontColor(MUTED).width('100%')
      Scroll() {
        Column({ space: 4 }) {
          ForEach(this.compareLines, (line: string) => {
            Text(line).fontSize(12)
              .fontColor(line.startsWith('+') ? OK : (line.startsWith('-') ? DANGER : MUTED))
              .width('100%')
          }, (line: string) => `cmp-${line}`)
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
      }
      .height(180)
      .width('100%')
      .backgroundColor(BG)
      .borderRadius(10)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(CARD)
    .borderRadius(16)
    .alignItems(HorizontalAlign.Start)
  }

  private confirmDelete(note: NoteItem): void {
    if (businessStore.requiresTrashEditDecision(note.id)) {
      void this.chooseTrashEditing(note);
      return;
    }
    this.getUIContext().showAlertDialog({
      title: '移入回收站',
      message: `将“${note.title}”及现有历史移入回收站？正文30天内可恢复。`,
      primaryButton: { value: '取消', action: () => {} },
      secondaryButton: { value: '移入回收站', fontColor: DANGER,
        action: () => { void businessStore.deleteNote(note.id); } }
    });
  }

  private async chooseTrashEditing(note: NoteItem): Promise<void> {
    try {
      const answer = await promptAction.showDialog({
        title: '处理编辑内容',
        message: `移入回收站前，要保留“${note.title}”的修改吗？`,
        buttons: [
          { text: '保留修改并移入', color: '#315CF5' },
          { text: '放弃修改并移入', color: '#C23F4A' },
          { text: '取消', color: '#667085' }
        ]
      });
      if (answer.index === 0) {
        await businessStore.moveNoteToTrash(note.id, TrashEditDecision.KEEP_CHANGES);
      } else if (answer.index === 1) {
        await businessStore.moveNoteToTrash(note.id, TrashEditDecision.DISCARD_CHANGES);
      }
    } catch (_) {}
  }

  @Builder
  private recyclePanel() {
    NoteRecyclePanel({ store: businessStore, onClose: () => { this.recycleOpen = false; } })
  }

  private confirmClear(): void {
    this.getUIContext().showAlertDialog({
      title: '清空草稿',
      message: '清空当前标题和内容？',
      primaryButton: { value: '取消', action: () => {} },
      secondaryButton: {
        value: '清空',
        fontColor: DANGER,
        action: () => {
          void businessStore.discardDraft();
        }
      }
    });
  }

  @Builder
  private editor() {
    Column({ space: 12 }) {
      Row() {
        Text(this.editing() ? '编辑便签' : this.draftStatus()).fontSize(15).fontWeight(FontWeight.Medium)
          .fontColor(this.editing() ? ACCENT : MUTED).layoutWeight(1)
        Text(`${this.view.draftBody.length} / 4000`).fontSize(12).fontColor(MUTED)
      }
      .width('100%')
      TextInput({ text: this.view.draftTitle, placeholder: '标题' })
        .maxLength(60)
        .height(44)
        .fontSize(17)
        .fontColor(TEXT)
        .backgroundColor(BG)
        .borderRadius(10)
        .enabled(this.view.ready && !this.view.busy && !this.view.storageRecoveryRequired)
        .onChange((value: string) => businessStore.setDraftTitle(value))
      TextArea({ text: this.view.draftBody, placeholder: '写点什么…' })
        .maxLength(4000)
        .height(180)
        .fontSize(15)
        .fontColor(TEXT)
        .backgroundColor(BG)
        .borderRadius(10)
        .enabled(this.view.ready && !this.view.busy && !this.view.storageRecoveryRequired)
        .onChange((value: string) => businessStore.setDraftBody(value))
      Button(this.view.busy ? '保存中…' : (this.editing() ? '保存修改' : '保存便签'))
        .width('100%')
        .height(44)
        .fontSize(15)
        .backgroundColor(ACCENT)
        .fontColor($r('app.color.on_accent'))
        .enabled(this.view.ready && !this.view.busy && !this.view.storageRecoveryRequired &&
          (this.editing() || this.view.notes.length < 50) &&
          (this.view.draftTitle.trim().length > 0 || this.view.draftBody.trim().length > 0))
        .onClick(() => {
          void businessStore.saveNote();
        })
      if (this.editing()) {
        Button('取消编辑', { type: ButtonType.Normal })
          .width('100%').height(44).fontSize(14).fontColor(MUTED).backgroundColor(BG)
          .borderRadius(10).enabled(this.view.ready && !this.view.busy && !this.view.storageRecoveryRequired)
          .onClick(() => businessStore.cancelEdit())
        Button('保留编辑草稿', { type: ButtonType.Normal })
          .width('100%').height(44).fontSize(14).fontColor(ACCENT).backgroundColor(BG)
          .borderRadius(10)
          .enabled(this.view.ready && !this.view.busy && !this.view.storageRecoveryRequired && this.view.draftDirty &&
            this.view.draftTitle.trim().length <= 60 && this.view.draftBody.trim().length <= 4000)
          .onClick(() => {
            void businessStore.keepEditDraft();
          })
        if (this.view.editDraftPersisted) {
          Text('编辑草稿已保留').fontSize(12).fontColor(MUTED).width('100%')
        }
      }
      Row({ space: 12 }) {
        Button('保留草稿', { type: ButtonType.Normal })
          .layoutWeight(1)
          .height(44)
          .fontSize(14)
          .fontColor(ACCENT)
          .backgroundColor(BG)
          .borderRadius(10)
          .enabled(this.view.ready && !this.view.busy && !this.view.storageRecoveryRequired &&
            this.view.draftDirty && !this.editing())
          .onClick(() => {
            void businessStore.keepDraft();
          })
        Button('清空', { type: ButtonType.Normal })
          .layoutWeight(1)
          .height(44)
          .fontSize(14)
          .fontColor(DANGER)
          .backgroundColor(BG)
          .borderRadius(10)
          .enabled(this.view.ready && !this.view.busy && !this.view.storageRecoveryRequired &&
            (this.view.draftTitle.length > 0 || this.view.draftBody.length > 0))
          .onClick(() => this.confirmClear())
      }
      .width('100%')
    }
    .width('100%')
    .padding(16)
    .backgroundColor(CARD)
    .borderRadius(16)
  }

  @Builder
  private noteCard(note: NoteItem) {
    Column({ space: 12 }) {
      Text(note.title).fontSize(17).fontWeight(FontWeight.Medium).fontColor(TEXT).width('100%')
      if (note.body.length > 0) {
        Text(note.body).fontSize(15).fontColor(TEXT).width('100%').copyOption(CopyOptions.InApp)
      }
      Text(`${localDateKey(note.createdAt)} ${clockText(note.createdAt)}`)
        .fontSize(12).fontColor(MUTED).width('100%')
      Row({ space: 8 }) {
        Button('编辑', { type: ButtonType.Normal }).fontSize(14).fontColor(ACCENT)
          .backgroundColor(BG).height(44).layoutWeight(1).padding({ left: 4, right: 4 })
          .enabled(!this.view.busy && !this.view.storageRecoveryRequired)
          .onClick(() => businessStore.beginEditNote(note.id))
        Button('历史', { type: ButtonType.Normal }).fontSize(14).fontColor(ACCENT)
          .backgroundColor(BG).height(44).layoutWeight(1).padding({ left: 4, right: 4 })
          .enabled(!this.view.busy && !this.view.storageRecoveryRequired).onClick(() => this.openHistory(note))
        Button('移入回收站', { type: ButtonType.Normal }).fontSize(14).fontColor(DANGER)
          .backgroundColor(BG).height(44).layoutWeight(1).padding({ left: 4, right: 4 })
          .enabled(!this.view.busy && !this.view.storageRecoveryRequired)
          .onClick(() => this.confirmDelete(note))
      }.width('100%')
    }
    .width('100%')
    .padding(16)
    .backgroundColor(CARD)
    .border({ width: 1, color: LINE })
    .borderRadius(16)
  }

  build() {
    Column() {
      PageHeader({
        title: this.editing() ? '编辑便签' : '新建便签',
        onBack: () => {
          void appNavigation.back();
        }
      })
      Scroll() {
        Column({ space: 16 }) {
          StatusBanner({
            message: this.view.loading ? '读取中…' :
              (this.view.error.length > 0 ? this.view.error : this.view.message),
            error: !this.view.loading && this.view.error.length > 0
          })
          if (!this.view.ready && !this.view.loading) {
            Button('重新读取').height(44).fontSize(14).onClick(() => businessStore.retry())
          }
          if (this.view.storageRecoveryRequired) {
            Button('重新读取核对').id('note-storage-recovery').height(44).fontSize(14).enabled(!this.view.busy)
              .onClick(() => { void businessStore.recoverStorage(); })
          }
          this.editor()
          Row() {
            Text('已保存').fontSize(18).fontWeight(FontWeight.Medium).fontColor(TEXT).layoutWeight(1)
            Text(`${this.view.notes.length} / 50`).fontSize(14).fontColor(MUTED)
            Button(`回收站（${this.view.recycledNotes.length}）`, { type: ButtonType.Normal })
              .id('note-trash-open').height(44).fontSize(14).fontColor(ACCENT).backgroundColor(Color.Transparent)
              .onClick(() => { this.recycleOpen = true; })
          }
          .width('100%')
          TextInput({ text: this.view.noteQuery, placeholder: '搜索标题或内容' })
            .fontSize(14).height(44).backgroundColor(CARD).borderRadius(10)
            .onChange((value: string) => businessStore.setNoteQuery(value))
          if (this.view.visibleNotes.length === 0) {
            EmptyState({ title: this.view.noteQuery.length > 0 ? '没有匹配的便签' : '暂无便签' })
          } else {
            ForEach(this.view.visibleNotes, (note: NoteItem) => {
              this.noteCard(note)
            }, (note: NoteItem) => note.id)
          }
        }
        .width('100%')
        .padding({ left: 20, right: 20, bottom: 24 })
      }
      .layoutWeight(1)
      .width('100%')
      .align(Alignment.TopStart)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(BG)
    .bindSheet($$this.historyOpen, this.historyPanel(), { height: SheetSize.MEDIUM, showClose: true })
    .bindSheet($$this.compareOpen, this.comparePanel(), { height: SheetSize.MEDIUM, showClose: true })
    .bindSheet($$this.recycleOpen, this.recyclePanel(), { height: SheetSize.LARGE, showClose: true })
  }
}
