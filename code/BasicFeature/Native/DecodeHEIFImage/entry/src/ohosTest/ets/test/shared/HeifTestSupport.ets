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

export class RecordingListener implements DataChangeListener {
  reloadCount: number = 0;
  addIndexes: number[] = [];
  changeIndexes: number[] = [];
  deleteIndexes: number[] = [];
  moveFrom: number[] = [];
  moveTo: number[] = [];
  datasetCount: number = 0;

  onDataReloaded(): void {
    this.reloadCount += 1;
  }

  onDataAdded(index: number): void {
  }

  onDataAdd(index: number): void {
    this.addIndexes.push(index);
  }

  onDataMoved(from: number, to: number): void {
  }

  onDataMove(from: number, to: number): void {
    this.moveFrom.push(from);
    this.moveTo.push(to);
  }

  onDataDeleted(index: number): void {
  }

  onDataDelete(index: number): void {
    this.deleteIndexes.push(index);
  }

  onDataChanged(index: number): void {
  }

  onDataChange(index: number): void {
    this.changeIndexes.push(index);
  }

  onDatasetChange(dataOperations: DataOperation[]): void {
    this.datasetCount += 1;
  }

  reset(): void {
    this.reloadCount = 0;
    this.addIndexes = [];
    this.changeIndexes = [];
    this.deleteIndexes = [];
    this.moveFrom = [];
    this.moveTo = [];
    this.datasetCount = 0;
  }
}
