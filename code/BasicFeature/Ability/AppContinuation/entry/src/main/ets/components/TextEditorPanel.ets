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

import { MAX_TEXT_LENGTH } from '../learning/LearningTypes';
import { LEARNING_INK, LearningAction, LearningLine } from './LearningUi';

/** Shared production text controls; state and persistence remain owned by the caller's controller. */
@Component
export struct TextEditorPanel {
  @Prop text: string = '';
  @Prop selectionStart: number = 0;
  @Prop selectionEnd: number = 0;
  @Prop savedStatus: string = '';
  @Prop editable: boolean = true;
  editor: TextAreaController = new TextAreaController();
  onTextChanged: (value: string) => void = (_value: string): void => {};
  onSelectionChanged: (start: number, end: number) => void = (_start: number, _end: number): void => {};
  onEditingChanged: (editing: boolean) => void = (_editing: boolean): void => {};
  onEditorAppeared: () => void = (): void => {};
  onSave: () => void = (): void => {};

  build() {
    Column({ space: 12 }) {
      TextArea({ text: this.text, placeholder: $r('app.string.ac_index_052'), controller: this.editor })
        .id('ACTextEditor')
        .width('100%')
        .height(160)
        .fontSize(15)
        .fontColor(LEARNING_INK)
        .backgroundColor('#F5F7FA')
        .borderRadius(12)
        .maxLength(MAX_TEXT_LENGTH)
        .enabled(this.editable)
        .onChange((value: string): void => this.onTextChanged(value))
        .onTextSelectionChange((start: number, end: number): void => this.onSelectionChanged(start, end))
        .onEditChange((editing: boolean): void => this.onEditingChanged(editing))
        .onAppear((): void => this.onEditorAppeared())
      LearningLine({
        label: $r('app.string.ac_index_053'),
        value: `${this.text.length} / ${MAX_TEXT_LENGTH}  ·  [${this.selectionStart}, ${this.selectionEnd})`
      })
      LearningLine({ label: $r('app.string.ac_index_054'), value: this.savedStatus,
        valueId: 'ACTextSavedState' })
      LearningAction({ label: $r('app.string.ac_index_055'), actionEnabled: this.editable,
        onTap: (): void => this.onSave() })
        .id('ACTextSave')
    }
    .width('100%')
  }
}
