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
import { logWarning } from '../services/Logger';
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
      return uiText("shortcut_text_0055");
    }
    if (this.view.draftDirty) {
      return uiText("shortcut_text_0703");
    }
    return this.view.draftKept ? uiText("shortcut_text_0143") : uiText("shortcut_text_0618");
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
      case 'create': return uiText("shortcut_text_0170");
      case 'restore': return uiText("shortcut_text_0280");
      default: return uiText("shortcut_text_0076");
    }
  }

  @Builder
  private historyPanel() {
    Column({ space: 12 }) {
      Row() {
        Text(uiText("shortcut_text_0038")).fontSize(24).fontWeight(FontWeight.Bold).fontColor(TEXT).layoutWeight(1)
        Button(uiText("shortcut_text_0253"), { type: ButtonType.Normal }).height(44).fontSize(14).fontColor(ACCENT)
          .backgroundColor(Color.Transparent).onClick(() => { this.historyOpen = false; })
      }
      .width('100%')
      Text(uiText("shortcut_text_0462"))
        .fontSize(14).fontColor(MUTED).width('100%')
      if (this.revisions.length === 0) {
        EmptyState({ title: uiText("shortcut_text_0723") })
      } else {
        List({ space: 10 }) {
          ForEach(this.revisions, (revision: NoteRevision) => {
            ListItem() {
              Column({ space: 6 }) {
                Row() {
                  Text(`${this.actionLabel(revision.action)} · ${localDateKey(revision.savedAt)} ` +
                    `${clockText(revision.savedAt)}`)
                    .fontSize(12).fontColor(MUTED).layoutWeight(1)
                  Button(uiText("shortcut_text_0226"), { type: ButtonType.Normal }).fontSize(14).fontColor(ACCENT)
                    .backgroundColor($r('app.color.accent_soft')).height(44)
                    .margin({ right: 6 })
                    .onClick(() => this.compareRevision(revision))
                  Button(uiText("shortcut_text_0275"), { type: ButtonType.Normal }).fontSize(14).fontColor(ACCENT)
                    .backgroundColor($r('app.color.accent_soft')).height(44)
                    .onClick(() => this.restoreRevision(revision))
                }
                .width('100%')
                Text(revision.title.length > 0 ? revision.title : uiText("shortcut_text_0007"))
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
        Text(uiText("shortcut_text_0037")).fontSize(24).fontWeight(FontWeight.Bold).fontColor(TEXT).layoutWeight(1)
        Button(uiText("shortcut_text_0253"), { type: ButtonType.Normal }).height(44).fontSize(14).fontColor(ACCENT)
          .backgroundColor(Color.Transparent).onClick(() => this.closeCompare())
      }
      .width('100%')
      Text(uiText("shortcut_text_0243", [String(this.compareSummary)])).fontSize(14).fontColor(MUTED).width('100%')
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
      title: uiText("shortcut_text_0646"),
      message: uiText("shortcut_text_0323", [String(note.title)]),
      primaryButton: { value: uiText("shortcut_text_0452"), action: () => {} },
      secondaryButton: { value: uiText("shortcut_text_0646"), fontColor: DANGER,
        action: () => { void businessStore.deleteNote(note.id); } }
    });
  }

  private async chooseTrashEditing(note: NoteItem): Promise<void> {
    try {
      const answer = await promptAction.showDialog({
        title: uiText("shortcut_text_0162"),
        message: uiText("shortcut_text_0647", [String(note.title)]),
        buttons: [
          { text: uiText("shortcut_text_0061"), color: '#315CF5' },
          { text: uiText("shortcut_text_0237"), color: '#C23F4A' },
          { text: uiText("shortcut_text_0452"), color: '#667085' }
        ]
      });
      if (answer.index === 0) {
        await businessStore.moveNoteToTrash(note.id, TrashEditDecision.KEEP_CHANGES);
      } else if (answer.index === 1) {
        await businessStore.moveNoteToTrash(note.id, TrashEditDecision.DISCARD_CHANGES);
      }
    } catch (_) {
      // Dialog dismissal is non-destructive: keep the note and editing buffer unchanged.
      logWarning('Move-to-trash dialog canceled or unavailable; no action taken');
    }
  }

  @Builder
  private recyclePanel() {
    NoteRecyclePanel({ store: businessStore, onClose: () => { this.recycleOpen = false; } })
  }

  private confirmClear(): void {
    this.getUIContext().showAlertDialog({
      title: uiText("shortcut_text_0436"),
      message: uiText("shortcut_text_0437"),
      primaryButton: { value: uiText("shortcut_text_0452"), action: () => {} },
      secondaryButton: {
        value: uiText("shortcut_text_0435"),
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
        Text(this.editing() ? uiText("shortcut_text_0077") : this.draftStatus()).fontSize(15).fontWeight(FontWeight.Medium)
          .fontColor(this.editing() ? ACCENT : MUTED).layoutWeight(1)
        Text(`${this.view.draftBody.length} / 4000`).fontSize(12).fontColor(MUTED)
      }
      .width('100%')
      TextInput({ text: this.view.draftTitle, placeholder: uiText("shortcut_text_0120") })
        .maxLength(60)
        .height(44)
        .fontSize(17)
        .fontColor(TEXT)
        .backgroundColor(BG)
        .borderRadius(10)
        .enabled(this.view.ready && !this.view.busy && !this.view.storageRecoveryRequired)
        .onChange((value: string) => businessStore.setDraftTitle(value))
      TextArea({ text: this.view.draftBody, placeholder: uiText("shortcut_text_0616") })
        .maxLength(4000)
        .height(180)
        .fontSize(15)
        .fontColor(TEXT)
        .backgroundColor(BG)
        .borderRadius(10)
        .enabled(this.view.ready && !this.view.busy && !this.view.storageRecoveryRequired)
        .onChange((value: string) => businessStore.setDraftBody(value))
      Button(this.view.busy ? uiText("shortcut_text_0055") : (this.editing() ? uiText("shortcut_text_0054") : uiText("shortcut_text_0046")))
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
        Button(uiText("shortcut_text_0453"), { type: ButtonType.Normal })
          .width('100%').height(44).fontSize(14).fontColor(MUTED).backgroundColor(BG)
          .borderRadius(10).enabled(this.view.ready && !this.view.busy && !this.view.storageRecoveryRequired)
          .onClick(() => businessStore.cancelEdit())
        Button(uiText("shortcut_text_0057"), { type: ButtonType.Normal })
          .width('100%').height(44).fontSize(14).fontColor(ACCENT).backgroundColor(BG)
          .borderRadius(10)
          .enabled(this.view.ready && !this.view.busy && !this.view.storageRecoveryRequired && this.view.draftDirty &&
            this.view.draftTitle.trim().length <= 60 && this.view.draftBody.trim().length <= 4000)
          .onClick(() => {
            void businessStore.keepEditDraft();
          })
        if (this.view.editDraftPersisted) {
          Text(uiText("shortcut_text_0078")).fontSize(12).fontColor(MUTED).width('100%')
        }
      }
      Row({ space: 12 }) {
        Button(uiText("shortcut_text_0058"), { type: ButtonType.Normal })
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
        Button(uiText("shortcut_text_0435"), { type: ButtonType.Normal })
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
        Button(uiText("shortcut_text_0076"), { type: ButtonType.Normal }).fontSize(14).fontColor(ACCENT)
          .backgroundColor(BG).height(44).layoutWeight(1).padding({ left: 4, right: 4 })
          .enabled(!this.view.busy && !this.view.storageRecoveryRequired)
          .onClick(() => businessStore.beginEditNote(note.id))
        Button(uiText("shortcut_text_0378"), { type: ButtonType.Normal }).fontSize(14).fontColor(ACCENT)
          .backgroundColor(BG).height(44).layoutWeight(1).padding({ left: 4, right: 4 })
          .enabled(!this.view.busy && !this.view.storageRecoveryRequired).onClick(() => this.openHistory(note))
        Button(uiText("shortcut_text_0646"), { type: ButtonType.Normal }).fontSize(14).fontColor(DANGER)
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
        title: this.editing() ? uiText("shortcut_text_0077") : uiText("shortcut_text_0619"),
        onBack: () => {
          void appNavigation.back();
        }
      })
      Scroll() {
        Column({ space: 16 }) {
          StatusBanner({
            message: this.view.loading ? uiText("shortcut_text_0225") :
              (this.view.error.length > 0 ? this.view.error : this.view.message),
            error: !this.view.loading && this.view.error.length > 0
          })
          if (!this.view.ready && !this.view.loading) {
            Button(uiText("shortcut_text_0777")).height(44).fontSize(14).onClick(() => businessStore.retry())
          }
          if (this.view.storageRecoveryRequired) {
            Button(uiText("shortcut_text_0778")).id('note-storage-recovery').height(44).fontSize(14).enabled(!this.view.busy)
              .onClick(() => { void businessStore.recoverStorage(); })
          }
          this.editor()
          Row() {
            Text(uiText("shortcut_text_0649")).fontSize(18).fontWeight(FontWeight.Medium).fontColor(TEXT).layoutWeight(1)
            Text(`${this.view.notes.length} / 50`).fontSize(14).fontColor(MUTED)
            Button(uiText("shortcut_text_0301", [String(this.view.recycledNotes.length)]), { type: ButtonType.Normal })
              .id('note-trash-open').height(44).fontSize(14).fontColor(ACCENT).backgroundColor(Color.Transparent)
              .onClick(() => { this.recycleOpen = true; })
          }
          .width('100%')
          TextInput({ text: this.view.noteQuery, placeholder: uiText("shortcut_text_0541") })
            .fontSize(14).height(44).backgroundColor(CARD).borderRadius(10)
            .onChange((value: string) => businessStore.setNoteQuery(value))
          if (this.view.visibleNotes.length === 0) {
            EmptyState({ title: this.view.noteQuery.length > 0 ? uiText("shortcut_text_0391") : uiText("shortcut_text_0718") })
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
