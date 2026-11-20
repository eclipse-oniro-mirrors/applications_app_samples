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

export class CountingListener implements DataChangeListener {
  public addCount: number = 0;
  public deleteCount: number = 0;
  public reloadCount: number = 0;
  public changeCount: number = 0;
  public moveCount: number = 0;
  public lastAddIndex: number = -1;
  public lastDeleteIndex: number = -1;

  onDataReloaded(): void {
    this.reloadCount++;
  }

  onDataAdded(index: number): void {
  }

  onDataAdd(index: number): void {
    this.addCount++;
    this.lastAddIndex = index;
  }

  onDataChange(index: number): void {
    this.changeCount++;
  }

  onDataChanged(index: number): void {
  }

  onDataDelete(index: number): void {
    this.deleteCount++;
    this.lastDeleteIndex = index;
  }

  onDataDeleted(index: number): void {
  }

  onDataMove(from: number, to: number): void {
    this.moveCount++;
  }

  onDataMoved(from: number, to: number): void {
  }

  onDatasetChange(dataOperations: DataOperation[]): void {
  }
}
