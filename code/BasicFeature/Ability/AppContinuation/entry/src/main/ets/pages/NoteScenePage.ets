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

import { localize } from '../common/LocaleStrings';
import { getLearningController } from '../learning/LearningContext';
import { ScenePositionTarget } from '../learning/LearningController';
import { SceneSnapshot } from '../learning/scene/SceneWorkbench';
import { ScenePageSession } from '../learning/scene/ScenePageSession';
import { SceneContinuationStatus } from '../components/SceneContinuationStatus';
import { LEARNING_BG, LEARNING_BLUE, LEARNING_INK, LEARNING_MUTED, openLearningTab } from '../components/LearningUi';

@Entry
@Component
struct NoteScenePage {
  @State private view: SceneSnapshot = new SceneSnapshot();
  @State private navigationMessage: string = '';
  @State private history: string[] = [];
  @State private historyExpanded: boolean = false;
  private readonly binding: ScenePageSession = new ScenePageSession('note');
  private readonly editor: TextAreaController = new TextAreaController();
  private timer: number = -1;
  private positionedRequest: number = -1;
  private awaitingReceipt: ScenePositionTarget | undefined = undefined;
  private applying: boolean = false;

  aboutToAppear(): void { this.bind(); }
  onPageShow(): void { this.bind(); }
  onPageHide(): void { this.detach(); }
  aboutToDisappear(): void { this.detach(); }
  private bind(): void {
    this.binding.bind(getLearningController(), (): void => { this.sync(); });
  }
  private detach(): void {
    this.binding.hide();
    if (this.timer !== -1) { clearTimeout(this.timer); this.timer = -1; }
    this.awaitingReceipt = undefined;
  }
  private sync(): void {
    this.applying = true;
    this.view = this.binding.snapshot();
    this.history = getLearningController()?.sceneWorkbench.historyLines('note') ?? [];
    this.applying = false;
    const target = this.binding.target();
    if (target !== undefined && target.document.state.kind === 'note' && target.request !== this.positionedRequest) {
      this.restoreSelection();
    }
  }
  private restoreSelection(): void {
    if (this.timer !== -1) { clearTimeout(this.timer); }
    const target = this.binding.target();
    this.timer = setTimeout((): void => {
      this.timer = -1;
      const current = this.binding.target();
      if (target !== undefined && (current === undefined || target.request !== current.request)) { return; }
      try {
        this.awaitingReceipt = target;
        if (target !== undefined) { this.positionedRequest = target.request; }
        // Completion is reported only by the widget's selection callback, not by this method returning.
        this.editor.setTextSelection(this.view.noteSelectionStart, this.view.noteSelectionEnd);
      } catch (error) {
        if (target !== undefined) { this.binding.receipt(target, -1, -1, false); }
      }
    }, 0);
  }
  private edit(title: string, body: string, start: number, end: number): void {
    if (this.applying || !this.view.editable) { return; }
    getLearningController()?.sceneWorkbench.editNote(title, body, start, end);
  }
  private selectionChanged(start: number, end: number): void {
    const target = this.awaitingReceipt;
    if (target !== undefined) {
      if (start === target.document.state.note.selectionStart && end === target.document.state.note.selectionEnd) {
        this.awaitingReceipt = undefined;
        this.binding.receipt(target, start, end, true);
      }
      return;
    }
    this.edit(this.view.noteTitle, this.view.noteBody, start, end);
  }
  private backToWorkbench(): void {
    this.navigationMessage = '';
    openLearningTab(this.getUIContext(), 1, (message: string): void => { this.navigationMessage = message; });
  }
  build() {
    Scroll() {
      Column({ space: 14 }) {
        Button($r('app.string.ac_formscenepage_001'), { type: ButtonType.Normal }).height(44).fontSize(14)
          .fontColor(LEARNING_BLUE).backgroundColor('#EEF4FF').borderRadius(10)
          .onClick((): void => { this.backToWorkbench(); })
        if (this.navigationMessage.length > 0) {
          Text(this.navigationMessage).fontSize(14).fontColor('#B42318').width('100%')
        }
        Text($r('app.string.ac_notescenepage_002')).fontSize(26).fontWeight(FontWeight.Bold).fontColor(LEARNING_INK).width('100%')
        Text(this.view.text()).fontSize(14).fontColor(LEARNING_MUTED).width('100%')
        SceneContinuationStatus()
        Column({ space: 12 }) {
          TextInput({ text: this.view.noteTitle, placeholder: localize('ac_notescenepage_003') }).maxLength(80)
            .height(48).fontSize(15).backgroundColor(LEARNING_BG).borderRadius(10).enabled(this.view.editable)
            .onChange((value: string): void => {
              this.edit(value, this.view.noteBody, this.view.noteSelectionStart, this.view.noteSelectionEnd);
            })
          TextArea({ text: this.view.noteBody, placeholder: localize('ac_notescenepage_004'), controller: this.editor })
            .height(220).fontSize(15).backgroundColor(LEARNING_BG).borderRadius(10).maxLength(4096)
            .enabled(this.view.editable)
            .onChange((value: string): void => this.edit(this.view.noteTitle, value, value.length, value.length))
            .onTextSelectionChange((start: number, end: number): void => this.selectionChanged(start, end))
            .onAppear((): void => this.restoreSelection())
          Text(localize('ac_notescenepage_005', [this.view.noteSelectionStart, this.view.noteSelectionEnd]))
            .fontSize(12).fontColor(LEARNING_MUTED).width('100%')
        }.width('100%').padding(16).backgroundColor('#FFFFFF').borderRadius(14)
        Button($r('app.string.ac_notescenepage_006')).width('100%').height(48).fontSize(15).backgroundColor(LEARNING_BLUE).borderRadius(10)
          .enabled(this.view.editable).onClick((): void => { getLearningController()?.sceneWorkbench.saveNote(); })
        Button($r('app.string.ac_notescenepage_007'), { type: ButtonType.Normal }).width('100%').height(44).fontSize(14)
          .fontColor(LEARNING_BLUE).backgroundColor('#EEF4FF').borderRadius(10).enabled(this.view.editable)
          .onClick((): void => { getLearningController()?.sceneWorkbench.discardNote(); this.restoreSelection(); })
        Text(this.view.error.length > 0 ? this.view.error : this.view.notice)
          .fontSize(14).fontColor(LEARNING_INK).width('100%')
        Button(this.historyExpanded ? localize('ac_notescenepage_008') : localize('ac_notescenepage_009', [this.history.length]), { type: ButtonType.Normal })
          .width('100%').height(44).fontSize(14).fontColor(LEARNING_BLUE).backgroundColor('#FFFFFF').borderRadius(10)
          .onClick((): void => { this.historyExpanded = !this.historyExpanded; })
        if (this.historyExpanded) {
          Text($r('app.string.ac_notescenepage_010')).fontSize(12).fontColor(LEARNING_MUTED).width('100%')
          ForEach(this.history, (line: string, index: number) => {
            Button(line, { type: ButtonType.Normal }).width('100%').constraintSize({ minHeight: 44 }).fontSize(12)
              .fontColor(LEARNING_BLUE).backgroundColor('#FFFFFF').borderRadius(10).enabled(this.view.editable)
              .onClick((): void => {
                getLearningController()?.sceneWorkbench.restoreHistory(index, 'note');
                this.restoreSelection();
              })
          }, (line: string, index: number) => `${index}:${line}`)
        }
      }.width('100%').padding(20).alignItems(HorizontalAlign.Start)
    }.width('100%').height('100%').backgroundColor(LEARNING_BG).align(Alignment.TopStart)
  }
}
