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

import { DataValidator } from '../utils/DataValidator';
import { DataStoreConstants } from '../constants/DataStoreConstants';
import { ArrayMetadata, DataType } from '../models/DataModels';
import { Logger } from '../utils/Logger';

const DEFAULT_CAPACITY: number = 16;
const MAX_RESIZE_CAPACITY: number = 100000;

/**
 * SendableArrayManager provides array creation, element manipulation,
 * batch operations, searching, sorting, and conversion utilities.
 */
export class SendableArrayManager {
  private numberData: number[] = [];
  private stringData: string[] = [];
  private capacity: number = 0;
  private dataType: DataType = DataType.NULL;
  private createdAt: number = 0;
  private updatedAt: number = 0;
  private readCount: number = 0;
  private writeCount: number = 0;
  private searchCount: number = 0;

  constructor() {
  }

  createNumberArray(capacity: number): string {
    if (!DataValidator.isValidCapacity(capacity, MAX_RESIZE_CAPACITY)) {
      return `createNumberArray failed: invalid capacity ${capacity}`;
    }
    this.numberData = new Array<number>(capacity);
    for (let i = 0; i < capacity; i++) {
      this.numberData[i] = 0;
    }
    this.stringData = [];
    this.capacity = capacity;
    this.dataType = DataType.NUMBER;
    this.createdAt = Date.now();
    this.updatedAt = this.createdAt;
    return `createNumberArray completed: capacity=${capacity}`;
  }

  createStringArray(capacity: number): string {
    if (!DataValidator.isValidCapacity(capacity, MAX_RESIZE_CAPACITY)) {
      return `createStringArray failed: invalid capacity ${capacity}`;
    }
    this.stringData = new Array<string>(capacity);
    for (let i = 0; i < capacity; i++) {
      this.stringData[i] = '';
    }
    this.numberData = [];
    this.capacity = capacity;
    this.dataType = DataType.STRING;
    this.createdAt = Date.now();
    this.updatedAt = this.createdAt;
    return `createStringArray completed: capacity=${capacity}`;
  }

  createFromArray(values: number[]): string {
    if (values.length === 0) {
      return 'createFromArray failed: empty input';
    }
    if (values.length > MAX_RESIZE_CAPACITY) {
      return `createFromArray failed: size ${values.length} exceeds max`;
    }
    this.numberData = new Array<number>(values.length);
    for (let i = 0; i < values.length; i++) {
      this.numberData[i] = values[i];
    }
    this.stringData = [];
    this.capacity = values.length;
    this.dataType = DataType.NUMBER;
    this.createdAt = Date.now();
    this.updatedAt = this.createdAt;
    return `createFromArray completed: size=${values.length}`;
  }

  createFromStringArray(values: string[]): string {
    if (values.length === 0) {
      return 'createFromStringArray failed: empty input';
    }
    if (values.length > MAX_RESIZE_CAPACITY) {
      return `createFromStringArray failed: size ${values.length} exceeds max`;
    }
    this.stringData = new Array<string>(values.length);
    for (let i = 0; i < values.length; i++) {
      this.stringData[i] = values[i];
    }
    this.numberData = [];
    this.capacity = values.length;
    this.dataType = DataType.STRING;
    this.createdAt = Date.now();
    this.updatedAt = this.createdAt;
    return `createFromStringArray completed: size=${values.length}`;
  }

  setNumberElement(index: number, value: number): string {
    if (this.dataType !== DataType.NUMBER) {
      return 'setNumberElement failed: array is not number type';
    }
    if (!DataValidator.isValidIndex(index, this.capacity)) {
      return `setNumberElement failed: index ${index} out of bounds [0, ${this.capacity})`;
    }
    this.numberData[index] = value;
    this.writeCount++;
    this.updatedAt = Date.now();
    return `setNumberElement completed: [${index}]=${value}`;
  }

  getNumberElement(index: number): string {
    if (this.dataType !== DataType.NUMBER) {
      return 'getNumberElement failed: array is not number type';
    }
    if (!DataValidator.isValidIndex(index, this.capacity)) {
      return `getNumberElement failed: index ${index} out of bounds`;
    }
    this.readCount++;
    return `getNumberElement: [${index}]=${this.numberData[index]}`;
  }

  setStringElement(index: number, value: string): string {
    if (this.dataType !== DataType.STRING) {
      return 'setStringElement failed: array is not string type';
    }
    if (!DataValidator.isValidIndex(index, this.capacity)) {
      return `setStringElement failed: index ${index} out of bounds`;
    }
    this.stringData[index] = value;
    this.writeCount++;
    this.updatedAt = Date.now();
    return `setStringElement completed: [${index}]=${value}`;
  }

  getStringElement(index: number): string {
    if (this.dataType !== DataType.STRING) {
      return 'getStringElement failed: array is not string type';
    }
    if (!DataValidator.isValidIndex(index, this.capacity)) {
      return `getStringElement failed: index ${index} out of bounds`;
    }
    this.readCount++;
    return `getStringElement: [${index}]=${this.stringData[index]}`;
  }

  swapElements(i: number, j: number): string {
    if (this.dataType === DataType.NULL) {
      return 'swapElements failed: array not initialized';
    }
    if (!DataValidator.isValidIndex(i, this.capacity) || !DataValidator.isValidIndex(j, this.capacity)) {
      return `swapElements failed: invalid index i=${i}, j=${j}`;
    }
    if (this.dataType === DataType.NUMBER) {
      const temp = this.numberData[i];
      this.numberData[i] = this.numberData[j];
      this.numberData[j] = temp;
    } else if (this.dataType === DataType.STRING) {
      const temp = this.stringData[i];
      this.stringData[i] = this.stringData[j];
      this.stringData[j] = temp;
    }
    this.writeCount += 2;
    this.updatedAt = Date.now();
    return `swapElements completed: [${i}]<->[${j}]`;
  }

  fillNumberArray(value: number): string {
    if (this.dataType !== DataType.NUMBER) {
      return 'fillNumberArray failed: array is not number type';
    }
    for (let i = 0; i < this.capacity; i++) {
      this.numberData[i] = value;
    }
    this.writeCount += this.capacity;
    this.updatedAt = Date.now();
    return `fillNumberArray completed: all=${value}`;
  }

  fillStringArray(value: string): string {
    if (this.dataType !== DataType.STRING) {
      return 'fillStringArray failed: array is not string type';
    }
    for (let i = 0; i < this.capacity; i++) {
      this.stringData[i] = value;
    }
    this.writeCount += this.capacity;
    this.updatedAt = Date.now();
    return `fillStringArray completed: all=${value}`;
  }

  sortNumberArray(): string {
    if (this.dataType !== DataType.NUMBER) {
      return 'sortNumberArray failed: array is not number type';
    }
    for (let i = 0; i < this.capacity - 1; i++) {
      for (let j = 0; j < this.capacity - 1 - i; j++) {
        if (this.numberData[j] > this.numberData[j + 1]) {
          const temp = this.numberData[j];
          this.numberData[j] = this.numberData[j + 1];
          this.numberData[j + 1] = temp;
        }
      }
    }
    this.writeCount += this.capacity;
    this.updatedAt = Date.now();
    return `sortNumberArray completed: [${this.numberData.join(',')}]`;
  }

  reverseArray(): string {
    if (this.dataType === DataType.NULL) {
      return 'reverseArray failed: array not initialized';
    }
    if (this.dataType === DataType.NUMBER) {
      for (let i = 0; i < Math.floor(this.capacity / 2); i++) {
        const temp = this.numberData[i];
        this.numberData[i] = this.numberData[this.capacity - 1 - i];
        this.numberData[this.capacity - 1 - i] = temp;
      }
    } else if (this.dataType === DataType.STRING) {
      for (let i = 0; i < Math.floor(this.capacity / 2); i++) {
        const temp = this.stringData[i];
        this.stringData[i] = this.stringData[this.capacity - 1 - i];
        this.stringData[this.capacity - 1 - i] = temp;
      }
    }
    this.writeCount += this.capacity;
    this.updatedAt = Date.now();
    return 'reverseArray completed';
  }

  sliceNumberArray(start: number, end: number): string {
    if (this.dataType !== DataType.NUMBER) {
      return 'sliceNumberArray failed: array is not number type';
    }
    if (start < 0 || end > this.capacity || start > end) {
      return `sliceNumberArray failed: invalid range [${start}, ${end})`;
    }
    const result: number[] = [];
    for (let i = start; i < end; i++) {
      result.push(this.numberData[i]);
    }
    this.readCount += (end - start);
    return `sliceNumberArray: [${result.join(',')}] (${result.length} elements)`;
  }

  sliceStringArray(start: number, end: number): string {
    if (this.dataType !== DataType.STRING) {
      return 'sliceStringArray failed: array is not string type';
    }
    if (start < 0 || end > this.capacity || start > end) {
      return `sliceStringArray failed: invalid range [${start}, ${end})`;
    }
    const result: string[] = [];
    for (let i = start; i < end; i++) {
      result.push(this.stringData[i]);
    }
    this.readCount += (end - start);
    return `sliceStringArray: [${result.join(',')}] (${result.length} elements)`;
  }

  findNumberIndex(value: number): string {
    if (this.dataType !== DataType.NUMBER) {
      return 'findNumberIndex failed: array is not number type';
    }
    let foundIndex = -1;
    for (let i = 0; i < this.capacity; i++) {
      if (this.numberData[i] === value) {
        foundIndex = i;
        break;
      }
    }
    this.searchCount++;
    this.readCount += this.capacity;
    return `findNumberIndex(${value}): ${foundIndex}`;
  }

  findStringIndex(value: string): string {
    if (this.dataType !== DataType.STRING) {
      return 'findStringIndex failed: array is not string type';
    }
    let foundIndex = -1;
    for (let i = 0; i < this.capacity; i++) {
      if (this.stringData[i] === value) {
        foundIndex = i;
        break;
      }
    }
    this.searchCount++;
    this.readCount += this.capacity;
    return `findStringIndex(${value}): ${foundIndex}`;
  }

  filterNumberGreaterThan(threshold: number): string {
    if (this.dataType !== DataType.NUMBER) {
      return 'filterNumberGreaterThan failed: not number type';
    }
    const result: number[] = [];
    for (let i = 0; i < this.capacity; i++) {
      if (this.numberData[i] > threshold) {
        result.push(this.numberData[i]);
      }
    }
    this.searchCount++;
    this.readCount += this.capacity;
    return `filterNumberGreaterThan(${threshold}): [${result.join(',')}] (${result.length} matches)`;
  }

  filterNumberLessThan(threshold: number): string {
    if (this.dataType !== DataType.NUMBER) {
      return 'filterNumberLessThan failed: not number type';
    }
    const result: number[] = [];
    for (let i = 0; i < this.capacity; i++) {
      if (this.numberData[i] < threshold) {
        result.push(this.numberData[i]);
      }
    }
    this.searchCount++;
    this.readCount += this.capacity;
    return `filterNumberLessThan(${threshold}): [${result.join(',')}] (${result.length} matches)`;
  }

  filterStringContains(substring: string): string {
    if (this.dataType !== DataType.STRING) {
      return 'filterStringContains failed: not string type';
    }
    const result: string[] = [];
    for (let i = 0; i < this.capacity; i++) {
      if (this.stringData[i].indexOf(substring) >= 0) {
        result.push(this.stringData[i]);
      }
    }
    this.searchCount++;
    this.readCount += this.capacity;
    return `filterStringContains('${substring}'): [${result.join(',')}] (${result.length} matches)`;
  }

  containsNumber(value: number): string {
    if (this.dataType !== DataType.NUMBER) {
      return 'containsNumber failed: not number type';
    }
    let found = false;
    for (let i = 0; i < this.capacity; i++) {
      if (this.numberData[i] === value) {
        found = true;
        break;
      }
    }
    this.searchCount++;
    this.readCount += this.capacity;
    return `containsNumber(${value}): ${found}`;
  }

  containsString(value: string): string {
    if (this.dataType !== DataType.STRING) {
      return 'containsString failed: not string type';
    }
    let found = false;
    for (let i = 0; i < this.capacity; i++) {
      if (this.stringData[i] === value) {
        found = true;
        break;
      }
    }
    this.searchCount++;
    this.readCount += this.capacity;
    return `containsString('${value}'): ${found}`;
  }

  sumNumberArray(): string {
    if (this.dataType !== DataType.NUMBER) {
      return 'sumNumberArray failed: not number type';
    }
    let sum = 0;
    for (let i = 0; i < this.capacity; i++) {
      sum += this.numberData[i];
    }
    this.readCount += this.capacity;
    return `sumNumberArray: ${sum}`;
  }

  minNumber(): string {
    if (this.dataType !== DataType.NUMBER) {
      return 'minNumber failed: not number type';
    }
    if (this.capacity === 0) {
      return 'minNumber failed: empty array';
    }
    let minVal = this.numberData[0];
    for (let i = 1; i < this.capacity; i++) {
      if (this.numberData[i] < minVal) {
        minVal = this.numberData[i];
      }
    }
    this.readCount += this.capacity;
    return `minNumber: ${minVal}`;
  }

  maxNumber(): string {
    if (this.dataType !== DataType.NUMBER) {
      return 'maxNumber failed: not number type';
    }
    if (this.capacity === 0) {
      return 'maxNumber failed: empty array';
    }
    let maxVal = this.numberData[0];
    for (let i = 1; i < this.capacity; i++) {
      if (this.numberData[i] > maxVal) {
        maxVal = this.numberData[i];
      }
    }
    this.readCount += this.capacity;
    return `maxNumber: ${maxVal}`;
  }

  averageNumber(): string {
    if (this.dataType !== DataType.NUMBER) {
      return 'averageNumber failed: not number type';
    }
    if (this.capacity === 0) {
      return 'averageNumber failed: empty array';
    }
    let sum = 0;
    for (let i = 0; i < this.capacity; i++) {
      sum += this.numberData[i];
    }
    const avg = sum / this.capacity;
    this.readCount += this.capacity;
    return `averageNumber: ${avg}`;
  }

  toNumberJSON(): string {
    if (this.dataType !== DataType.NUMBER) {
      return 'toNumberJSON failed: not number type';
    }
    return JSON.stringify(this.numberData);
  }

  toStringJSON(): string {
    if (this.dataType !== DataType.STRING) {
      return 'toStringJSON failed: not string type';
    }
    return JSON.stringify(this.stringData);
  }

  toJSON(): string {
    if (this.dataType === DataType.NUMBER) {
      return this.toNumberJSON();
    } else if (this.dataType === DataType.STRING) {
      return this.toStringJSON();
    }
    return '[]';
  }

  getMetadata(): string {
    const meta: ArrayMetadata = {
      capacity: this.capacity,
      length: this.capacity,
      dataType: this.dataType,
      createdAt: this.createdAt,
      updatedAt: this.updatedAt
    };
    return `Metadata: capacity=${meta.capacity}, type=${meta.dataType}, ` +
      `created=${meta.createdAt}, updated=${meta.updatedAt}`;
  }

  getStatistics(): string {
    return `Array Statistics: capacity=${this.capacity}, type=${this.dataType}, ` +
      `reads=${this.readCount}, writes=${this.writeCount}, searches=${this.searchCount}, ` +
      `createdAt=${this.createdAt}, updatedAt=${this.updatedAt}`;
  }

  resetStatistics(): string {
    this.readCount = 0;
    this.writeCount = 0;
    this.searchCount = 0;
    return 'Array statistics reset';
  }

  clearArray(): string {
    this.numberData = [];
    this.stringData = [];
    this.capacity = 0;
    this.dataType = DataType.NULL;
    this.updatedAt = Date.now();
    return 'Array cleared';
  }

  isInitialized(): boolean {
    return this.dataType !== DataType.NULL && this.capacity > 0;
  }

  getCapacity(): number {
    return this.capacity;
  }

  getDataType(): DataType {
    return this.dataType;
  }

  release(): void {
    this.numberData = [];
    this.stringData = [];
    this.capacity = 0;
    this.dataType = DataType.NULL;
    this.createdAt = 0;
    this.updatedAt = 0;
    this.readCount = 0;
    this.writeCount = 0;
    this.searchCount = 0;
    Logger.info('SendableArrayManager released');
  }
}
