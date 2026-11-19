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

import type { MediaData } from '../../../main/ets/view/BasicDataSource';

export function createMediaRows(count: number, seed: number, type: number): MediaData[] {
  const data: MediaData[] = [];
  for (let index: number = 0; index < count; index++) {
    const id: number = seed + index;
    data.push({
      uri: `/logic/item-${id}`,
      fileType: type,
      displayName: `item-${id}`,
      duration: id * 1001,
      dateAdded: 1700000000 + id
    });
  }
  return data;
}

export class DataSourceProbe implements DataChangeListener {
  public events: string[] = [];

  public onDataReloaded(): void {
    this.events.push('reload');
  }

  public onDataAdd(index: number): void {
    this.events.push(`add:${index}`);
  }

  public onDataChange(index: number): void {
    this.events.push(`change:${index}`);
  }

  public onDataDelete(index: number): void {
    this.events.push(`delete:${index}`);
  }

  public onDataMove(from: number, to: number): void {
    this.events.push(`move:${from}:${to}`);
  }

  public onDataAdded(index: number): void {
    this.events.push(`added:${index}`);
  }

  public onDataMoved(from: number, to: number): void {
    this.events.push(`moved:${from}:${to}`);
  }

  public onDataDeleted(index: number): void {
    this.events.push(`deleted:${index}`);
  }

  public onDataChanged(index: number): void {
    this.events.push(`changed:${index}`);
  }

  public onDatasetChange(dataOperations: DataOperation[]): void {
    this.events.push(`batch:${dataOperations.length}`);
  }
}
