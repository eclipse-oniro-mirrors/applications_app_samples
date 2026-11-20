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
// SDK contract: SDK/23/ets/component/lazy_for_each.d.ts DataChangeListener.
// Records callbacks only; never substitutes production notification routing.
export class RecordingDataChangeListener implements DataChangeListener {
  private label: string;
  private calls: string[];

  constructor(label: string, calls: string[]) {
    this.label = label;
    this.calls = calls;
  }
  onDataReloaded(): void {
    this.calls.push(`${this.label}:reload`);
  }
  onDataAdd(index: number): void {
    this.calls.push(`${this.label}:add:${index}`);
  }
  onDataChange(index: number): void {
    this.calls.push(`${this.label}:change:${index}`);
  }
  onDataAdded(index: number): void {
    this.calls.push(`${this.label}:added:${index}`);
  }
  onDataChanged(index: number): void {
    this.calls.push(`${this.label}:changed:${index}`);
  }
  onDataDeleted(index: number): void {
    this.calls.push(`${this.label}:deleted:${index}`);
  }
  onDataDelete(index: number): void {
    this.calls.push(`${this.label}:delete:${index}`);
  }
  onDataMoved(from: number, to: number): void {
    this.calls.push(`${this.label}:moved:${from}:${to}`);
  }
  onDataMove(from: number, to: number): void {
    this.calls.push(`${this.label}:move:${from}:${to}`);
  }
  onDatasetChange(operations: DataOperation[]): void {
    this.calls.push(`${this.label}:dataset:${operations.length}`);
  }
}
