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

import { DataChangeListener } from '@ohos.arkui.component';
import { textFingerprint } from './Support';
import { DataOperation } from '@ohos.arkui.component';

/**
 * Minimal string oriented listener. Some suites only need to know how many
 * callbacks arrived and in which order, so the recorder stores short tokens
 * instead of full objects.
 */
export class ListenerRecorder implements DataChangeListener {
  public tokens: string[] = [];

  public onDatasetChange(dataOperations: DataOperation[]): void {
    this.tokens.push('S' + dataOperations.length.toString());
  }

  public onDataReloaded(): void {
    this.tokens.push('R');
  }

  public onDataAdd(index: int): void {
    this.tokens.push('A' + index.toInt().toString());
  }

  public onDataChange(index: int): void {
    this.tokens.push('C' + index.toInt().toString());
  }

  public onDataDelete(index: int): void {
    this.tokens.push('D' + index.toInt().toString());
  }

  public onDataMove(from: int, to: int): void {
    this.tokens.push('M' + from.toInt().toString() + '>' + to.toInt().toString());
  }

  public onDataAdded(index: number): void {
    this.onDataAdd(index.toInt());
  }

  public onDataChanged(index: number): void {
    this.onDataChange(index.toInt());
  }

  public onDataDeleted(index: number): void {
    this.onDataDelete(index.toInt());
  }

  public onDataMoved(from: number, to: number): void {
    this.onDataMove(from.toInt(), to.toInt());
  }

  public size(): int {
    return this.tokens.length;
  }

  public combined(): string {
    let text: string = '';
    for (let index = 0; index < this.tokens.length; index++) {
      text = text + this.tokens[index];
    }
    return text;
  }

  public fingerprint(): int {
    return textFingerprint(this.combined());
  }

  public clear(): void {
    this.tokens = [];
  }
}
