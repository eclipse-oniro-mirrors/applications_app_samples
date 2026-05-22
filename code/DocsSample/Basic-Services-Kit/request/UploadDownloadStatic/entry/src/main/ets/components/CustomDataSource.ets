'use static'

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

import { FileModel } from '../model/FileModel';
import { IDataSource, DataChangeListener } from '@ohos.arkui.component';

export class BasicDataSource implements IDataSource<FileModel> {
  private listeners: DataChangeListener[] = [];

  public totalCount(): int {
    return 0;
  }

  public getData(index: int): FileModel {
    return new FileModel('', false, ['']);
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      this.listeners.splice(pos, 1);
    }
  }

  notifyDataReload(): void {
    this.listeners.forEach((listener: DataChangeListener): void => {
      listener.onDataReloaded();
    })
  }

  notifyDataAdd(index: int): void {
    this.listeners.forEach((listener: DataChangeListener): void => {
      listener.onDataAdd(index)
    })
  }

  notifyDataChange(index: int): void {
    this.listeners.forEach((listener: DataChangeListener): void => {
      listener.onDataChange(index);
    })
  }
}

export class CustomDataSource extends BasicDataSource {
  public dataArray: Array<FileModel> = [new FileModel('', false, [''])];

  constructor() {
    super();
  }

  public totalCount(): int {
    return this.dataArray.length;
  }

  public getData(index: int): FileModel {
    if (index >= 0 && index < this.dataArray.length) {
      return this.dataArray[index];
    }
    return new FileModel('', false, ['']);
  }

  public addData(index: int, data: string): void {
    this.dataArray.splice(index, 0);
    this.notifyDataAdd(index);
  }

  public setData(data: Array<FileModel>): void {
    this.dataArray = data;
    this.notifyDataReload();
  }
}