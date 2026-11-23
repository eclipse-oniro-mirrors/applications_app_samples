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

/**
 * DataChangeListener probe shared by the data source suites.
 *
 * The listener only records what MyDataSource reports; it never re-implements
 * the notification rules, so every assertion stays on the SUT output.
 *
 * The interface carries both the legacy and the current method names
 * (onDataAdd / onDataAdded, ...) plus onDatasetChange, so every member is
 * implemented here; the legacy and current spellings fold into the same
 * counter, which keeps the probe correct whichever name the producer uses.
 * Snapshot grammar: 'reload|add|change|delete|move|lastIndex|lastFrom|lastTo'.
 */
export class ProbeListener implements DataChangeListener {
  public reloadCount: number = 0;
  public addCount: number = 0;
  public changeCount: number = 0;
  public deleteCount: number = 0;
  public moveCount: number = 0;
  public lastIndex: number = -1;
  public lastFrom: number = -1;
  public lastTo: number = -1;

  onDataReloaded(): void {
    this.reloadCount++;
  }

  onDataAdded(index: number): void {
    this.addCount++;
    this.lastIndex = index;
  }

  onDataAdd(index: number): void {
    this.addCount++;
    this.lastIndex = index;
  }

  onDataMoved(from: number, to: number): void {
    this.moveCount++;
    this.lastFrom = from;
    this.lastTo = to;
  }

  onDataMove(from: number, to: number): void {
    this.moveCount++;
    this.lastFrom = from;
    this.lastTo = to;
  }

  onDataDeleted(index: number): void {
    this.deleteCount++;
    this.lastIndex = index;
  }

  onDataDelete(index: number): void {
    this.deleteCount++;
    this.lastIndex = index;
  }

  onDataChanged(index: number): void {
    this.changeCount++;
    this.lastIndex = index;
  }

  onDataChange(index: number): void {
    this.changeCount++;
    this.lastIndex = index;
  }

  onDatasetChange(dataOperations: DataOperation[]): void {
    this.reloadCount++;
  }

  reset(): void {
    this.reloadCount = 0;
    this.addCount = 0;
    this.changeCount = 0;
    this.deleteCount = 0;
    this.moveCount = 0;
    this.lastIndex = -1;
    this.lastFrom = -1;
    this.lastTo = -1;
  }

  snapshot(): string {
    return this.reloadCount.toString() + '|' + this.addCount.toString() + '|' +
      this.changeCount.toString() + '|' + this.deleteCount.toString() + '|' +
      this.moveCount.toString() + '|' + this.lastIndex.toString() + '|' +
      this.lastFrom.toString() + '|' + this.lastTo.toString();
  }
}
