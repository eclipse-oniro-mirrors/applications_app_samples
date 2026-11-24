'use static';

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

// A pure model of the wish board wiring in Index.ets, MainPage.ets and Bottom.ets.
// MainPage owns placeholderVal and receives textVal through @Link; Bottom receives
// the same @Link; the @Builder writes textVal back through its MutableBinding.
export const RESET_PLACEHOLDER: string = '\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...';
export const UPDATED_PLACEHOLDER: string = '\u65b0\u5e74\u5feb\u4e50!';
export const INITIAL_TEXT: string = '"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"';

export class WishBoard {
  parentText: string = INITIAL_TEXT;
  mainPlaceholder: string = RESET_PLACEHOLDER;
  bottomPlaceholder: string = RESET_PLACEHOLDER;
  updateClicks: number = 0;
  inputEvents: number = 0;

  clickUpdate(): void {
    this.mainPlaceholder = UPDATED_PLACEHOLDER;
    this.updateClicks++;
  }

  typeText(value: string): void {
    this.parentText = value;
    this.inputEvents++;
  }

  clearText(): void {
    this.typeText('');
  }

  mainTitle(): string {
    return this.parentText;
  }

  bottomEcho(): string {
    return this.parentText;
  }

  inputPlaceholder(): string {
    return this.mainPlaceholder;
  }

  isEmpty(): boolean {
    return this.parentText.length === 0;
  }
}
