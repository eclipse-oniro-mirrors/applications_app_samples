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

import { FormScene } from '../../../main/ets/continuation/components/FormScene';
import { NoteScene } from '../../../main/ets/continuation/components/NoteScene';
import { ReadingScene } from '../../../main/ets/continuation/components/ReadingScene';
import { TextEditorPanel } from '../../../main/ets/components/TextEditorPanel';
import { LearningSnapshot, emptyLearningSnapshot } from '../../../main/ets/learning/LearningTypes';
import {
  FormalSceneUiQaFixture, currentFormalSceneUiQa, failFormalSceneUiQaInitialization
} from '../support/FormalSceneUiQaSupport';

@Entry({ useSharedStorage: true })
@Component
struct FormalSceneUiQaHarness {
  @LocalStorageProp('ownscene') scene: string = '';
  @LocalStorageProp('uiSessionId') sessionId: string = '';
  @State private ready: boolean = false;
  @State private textView: LearningSnapshot = emptyLearningSnapshot();
  private fixture: FormalSceneUiQaFixture | undefined = undefined;
  private unsubscribe: (() => void) | undefined = undefined;

  aboutToAppear(): void {
    try {
      const fixture = currentFormalSceneUiQa(this.sessionId);
      if (fixture.scene !== this.scene) { throw new Error('Formal harness selection mismatch'); }
      this.fixture = fixture;
      this.unsubscribe = fixture.controller.subscribe((snapshot: LearningSnapshot): void => {
        if (this.fixture === fixture) { this.textView = snapshot; }
      });
      this.ready = true;
    } catch (error) {
      this.ready = false;
      failFormalSceneUiQaInitialization(this.sessionId, 'formal.harness');
    }
  }

  aboutToDisappear(): void {
    this.ready = false;
    const unsubscribe = this.unsubscribe;
    this.unsubscribe = undefined;
    if (unsubscribe !== undefined) { unsubscribe(); }
    this.fixture = undefined;
  }

  build(): void {
    Column() {
      if (this.ready && this.fixture !== undefined) {
        Text('Formal scene UI ready')
          .id(`formal-scene-ui-qa-ready-${this.sessionId}`)
          .fontSize(12)
        if (this.scene === 'text') {
          Scroll() {
            TextEditorPanel({
              text: this.textView.text,
              selectionStart: this.textView.selectionStart,
              selectionEnd: this.textView.selectionEnd,
              savedStatus: this.textView.savedTextStatus,
              editable: this.textView.canEdit,
              onTextChanged: (value: string): void => {
                const fixture = this.fixture;
                if (fixture !== undefined && fixture.controller.snapshot().text !== value) {
                  fixture.controller.updateText(value);
                }
              },
              onSelectionChanged: (start: number, end: number): void => {
                const fixture = this.fixture;
                if (fixture !== undefined) {
                  const current = fixture.controller.snapshot();
                  if (current.selectionStart !== start || current.selectionEnd !== end) {
                    fixture.controller.updateSelection(start, end);
                  }
                }
              },
              onEditingChanged: (_editing: boolean): void => {},
              onEditorAppeared: (): void => {},
              onSave: (): void => { this.fixture?.controller.saveText(); }
            })
          }
          .width('100%')
          .layoutWeight(1)
        } else if (this.scene === 'note') {
          NoteScene({ controller: this.fixture.controller }).layoutWeight(1)
        } else if (this.scene === 'reading') {
          ReadingScene({ controller: this.fixture.controller }).layoutWeight(1)
        } else if (this.scene === 'form') {
          FormScene({ controller: this.fixture.controller }).layoutWeight(1)
        }
      }
    }
    .id(`formal-scene-ui-qa-root-${this.sessionId}`)
    .width('100%')
    .height('100%')
  }
}
