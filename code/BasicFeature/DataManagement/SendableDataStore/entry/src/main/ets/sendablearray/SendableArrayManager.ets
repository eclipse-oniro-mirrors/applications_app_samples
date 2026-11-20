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
import { ResultText } from '../utils/ResultText';

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
      return ResultText.ofArgs($r('app.string.result_array_create_number_invalid_capacity'), [capacity],
        `createNumberArray failed: invalid capacity ${capacity}`);
    }
    this.numberData = new Array<number>(capacity);
    for (let i: number = 0; i < capacity; i++) {
      this.numberData[i] = 0;
    }
    this.stringData = [];
    this.capacity = capacity;
    this.dataType = DataType.NUMBER;
    this.createdAt = Date.now();
    this.updatedAt = this.createdAt;
    return ResultText.ofArgs($r('app.string.result_array_create_number_completed'), [capacity],
      `createNumberArray completed: capacity=${capacity}`);
  }

  createStringArray(capacity: number): string {
    if (!DataValidator.isValidCapacity(capacity, MAX_RESIZE_CAPACITY)) {
      return ResultText.ofArgs($r('app.string.result_array_create_string_invalid_capacity'), [capacity],
        `createStringArray failed: invalid capacity ${capacity}`);
    }
    this.stringData = new Array<string>(capacity);
    for (let i: number = 0; i < capacity; i++) {
      this.stringData[i] = '';
    }
    this.numberData = [];
    this.capacity = capacity;
    this.dataType = DataType.STRING;
    this.createdAt = Date.now();
    this.updatedAt = this.createdAt;
    return ResultText.ofArgs($r('app.string.result_array_create_string_completed'), [capacity],
      `createStringArray completed: capacity=${capacity}`);
  }

  createFromArray(values: number[]): string {
    if (values.length === 0) {
      return ResultText.of($r('app.string.result_array_create_from_array_empty'),
        'createFromArray failed: empty input');
    }
    if (values.length > MAX_RESIZE_CAPACITY) {
      return ResultText.ofArgs($r('app.string.result_array_create_from_array_exceeds_max'), [values.length],
        `createFromArray failed: size ${values.length} exceeds max`);
    }
    this.numberData = new Array<number>(values.length);
    for (let i: number = 0; i < values.length; i++) {
      this.numberData[i] = values[i];
    }
    this.stringData = [];
    this.capacity = values.length;
    this.dataType = DataType.NUMBER;
    this.createdAt = Date.now();
    this.updatedAt = this.createdAt;
    return ResultText.ofArgs($r('app.string.result_array_create_from_array_completed'), [values.length],
      `createFromArray completed: size=${values.length}`);
  }

  createFromStringArray(values: string[]): string {
    if (values.length === 0) {
      return ResultText.of($r('app.string.result_array_create_from_strings_empty'),
        'createFromStringArray failed: empty input');
    }
    if (values.length > MAX_RESIZE_CAPACITY) {
      return ResultText.ofArgs($r('app.string.result_array_create_from_strings_exceeds_max'), [values.length],
        `createFromStringArray failed: size ${values.length} exceeds max`);
    }
    this.stringData = new Array<string>(values.length);
    for (let i: number = 0; i < values.length; i++) {
      this.stringData[i] = values[i];
    }
    this.numberData = [];
    this.capacity = values.length;
    this.dataType = DataType.STRING;
    this.createdAt = Date.now();
    this.updatedAt = this.createdAt;
    return ResultText.ofArgs($r('app.string.result_array_create_from_strings_completed'), [values.length],
      `createFromStringArray completed: size=${values.length}`);
  }

  setNumberElement(index: number, value: number): string {
    if (this.dataType !== DataType.NUMBER) {
      return ResultText.of($r('app.string.result_array_set_number_not_number_type'),
        'setNumberElement failed: array is not number type');
    }
    if (!DataValidator.isValidIndex(index, this.capacity)) {
      return ResultText.ofArgs($r('app.string.result_array_set_number_out_of_bounds'), [index, this.capacity],
        `setNumberElement failed: index ${index} out of bounds [0, ${this.capacity})`);
    }
    this.numberData[index] = value;
    this.writeCount++;
    this.updatedAt = Date.now();
    return ResultText.ofArgs($r('app.string.result_array_set_number_completed'), [index, String(value)],
      `setNumberElement completed: [${index}]=${value}`);
  }

  getNumberElement(index: number): string {
    if (this.dataType !== DataType.NUMBER) {
      return ResultText.of($r('app.string.result_array_get_number_not_number_type'),
        'getNumberElement failed: array is not number type');
    }
    if (!DataValidator.isValidIndex(index, this.capacity)) {
      return ResultText.ofArgs($r('app.string.result_array_get_number_out_of_bounds'), [index],
        `getNumberElement failed: index ${index} out of bounds`);
    }
    this.readCount++;
    return ResultText.ofArgs($r('app.string.result_array_get_number_value'), [index, String(this.numberData[index])],
      `getNumberElement: [${index}]=${this.numberData[index]}`);
  }

  setStringElement(index: number, value: string): string {
    if (this.dataType !== DataType.STRING) {
      return ResultText.of($r('app.string.result_array_set_string_not_string_type'),
        'setStringElement failed: array is not string type');
    }
    if (!DataValidator.isValidIndex(index, this.capacity)) {
      return ResultText.ofArgs($r('app.string.result_array_set_string_out_of_bounds'), [index],
        `setStringElement failed: index ${index} out of bounds`);
    }
    this.stringData[index] = value;
    this.writeCount++;
    this.updatedAt = Date.now();
    return ResultText.ofArgs($r('app.string.result_array_set_string_completed'), [index, value],
      `setStringElement completed: [${index}]=${value}`);
  }

  getStringElement(index: number): string {
    if (this.dataType !== DataType.STRING) {
      return ResultText.of($r('app.string.result_array_get_string_not_string_type'),
        'getStringElement failed: array is not string type');
    }
    if (!DataValidator.isValidIndex(index, this.capacity)) {
      return ResultText.ofArgs($r('app.string.result_array_get_string_out_of_bounds'), [index],
        `getStringElement failed: index ${index} out of bounds`);
    }
    this.readCount++;
    return ResultText.ofArgs($r('app.string.result_array_get_string_value'), [index, this.stringData[index]],
      `getStringElement: [${index}]=${this.stringData[index]}`);
  }

  swapElements(i: number, j: number): string {
    if (this.dataType === DataType.NULL) {
      return ResultText.of($r('app.string.result_array_swap_not_initialized'),
        'swapElements failed: array not initialized');
    }
    if (!DataValidator.isValidIndex(i, this.capacity) || !DataValidator.isValidIndex(j, this.capacity)) {
      return ResultText.ofArgs($r('app.string.result_array_swap_invalid_index'), [i, j],
        `swapElements failed: invalid index i=${i}, j=${j}`);
    }
    if (this.dataType === DataType.NUMBER) {
      const temp: number = this.numberData[i];
      this.numberData[i] = this.numberData[j];
      this.numberData[j] = temp;
    } else if (this.dataType === DataType.STRING) {
      const temp: string = this.stringData[i];
      this.stringData[i] = this.stringData[j];
      this.stringData[j] = temp;
    }
    this.writeCount += 2;
    this.updatedAt = Date.now();
    return ResultText.ofArgs($r('app.string.result_array_swap_completed'), [i, j],
      `swapElements completed: [${i}]<->[${j}]`);
  }

  fillNumberArray(value: number): string {
    if (this.dataType !== DataType.NUMBER) {
      return ResultText.of($r('app.string.result_array_fill_number_not_number_type'),
        'fillNumberArray failed: array is not number type');
    }
    for (let i: number = 0; i < this.capacity; i++) {
      this.numberData[i] = value;
    }
    this.writeCount += this.capacity;
    this.updatedAt = Date.now();
    return ResultText.ofArgs($r('app.string.result_array_fill_number_completed'), [String(value)],
      `fillNumberArray completed: all=${value}`);
  }

  fillStringArray(value: string): string {
    if (this.dataType !== DataType.STRING) {
      return ResultText.of($r('app.string.result_array_fill_string_not_string_type'),
        'fillStringArray failed: array is not string type');
    }
    for (let i: number = 0; i < this.capacity; i++) {
      this.stringData[i] = value;
    }
    this.writeCount += this.capacity;
    this.updatedAt = Date.now();
    return ResultText.ofArgs($r('app.string.result_array_fill_string_completed'), [value],
      `fillStringArray completed: all=${value}`);
  }

  sortNumberArray(): string {
    if (this.dataType !== DataType.NUMBER) {
      return ResultText.of($r('app.string.result_array_sort_not_number_type'),
        'sortNumberArray failed: array is not number type');
    }
    for (let i: number = 0; i < this.capacity - 1; i++) {
      for (let j: number = 0; j < this.capacity - 1 - i; j++) {
        if (this.numberData[j] > this.numberData[j + 1]) {
          const temp: number = this.numberData[j];
          this.numberData[j] = this.numberData[j + 1];
          this.numberData[j + 1] = temp;
        }
      }
    }
    this.writeCount += this.capacity;
    this.updatedAt = Date.now();
    return ResultText.ofArgs($r('app.string.result_array_sort_completed'), [this.numberData.join(',')],
      `sortNumberArray completed: [${this.numberData.join(',')}]`);
  }

  reverseArray(): string {
    if (this.dataType === DataType.NULL) {
      return ResultText.of($r('app.string.result_array_reverse_not_initialized'),
        'reverseArray failed: array not initialized');
    }
    if (this.dataType === DataType.NUMBER) {
      for (let i: number = 0; i < Math.floor(this.capacity / 2); i++) {
        const temp: number = this.numberData[i];
        this.numberData[i] = this.numberData[this.capacity - 1 - i];
        this.numberData[this.capacity - 1 - i] = temp;
      }
    } else if (this.dataType === DataType.STRING) {
      for (let i: number = 0; i < Math.floor(this.capacity / 2); i++) {
        const temp: string = this.stringData[i];
        this.stringData[i] = this.stringData[this.capacity - 1 - i];
        this.stringData[this.capacity - 1 - i] = temp;
      }
    }
    this.writeCount += this.capacity;
    this.updatedAt = Date.now();
    return ResultText.of($r('app.string.result_array_reverse_completed'), 'reverseArray completed');
  }

  sliceNumberArray(start: number, end: number): string {
    if (this.dataType !== DataType.NUMBER) {
      return ResultText.of($r('app.string.result_array_slice_number_not_number_type'),
        'sliceNumberArray failed: array is not number type');
    }
    if (start < 0 || end > this.capacity || start > end) {
      return ResultText.ofArgs($r('app.string.result_array_slice_number_invalid_range'), [start, end],
        `sliceNumberArray failed: invalid range [${start}, ${end})`);
    }
    const result: number[] = [];
    for (let i: number = start; i < end; i++) {
      result.push(this.numberData[i]);
    }
    this.readCount += (end - start);
    return ResultText.ofArgs($r('app.string.result_array_slice_number_result'), [result.join(','), result.length],
      `sliceNumberArray: [${result.join(',')}] (${result.length} elements)`);
  }

  sliceStringArray(start: number, end: number): string {
    if (this.dataType !== DataType.STRING) {
      return ResultText.of($r('app.string.result_array_slice_string_not_string_type'),
        'sliceStringArray failed: array is not string type');
    }
    if (start < 0 || end > this.capacity || start > end) {
      return ResultText.ofArgs($r('app.string.result_array_slice_string_invalid_range'), [start, end],
        `sliceStringArray failed: invalid range [${start}, ${end})`);
    }
    const result: string[] = [];
    for (let i: number = start; i < end; i++) {
      result.push(this.stringData[i]);
    }
    this.readCount += (end - start);
    return ResultText.ofArgs($r('app.string.result_array_slice_string_result'), [result.join(','), result.length],
      `sliceStringArray: [${result.join(',')}] (${result.length} elements)`);
  }

  findNumberIndex(value: number): string {
    if (this.dataType !== DataType.NUMBER) {
      return ResultText.of($r('app.string.result_array_find_number_not_number_type'),
        'findNumberIndex failed: array is not number type');
    }
    let foundIndex: number = -1;
    for (let i: number = 0; i < this.capacity; i++) {
      if (this.numberData[i] === value) {
        foundIndex = i;
        break;
      }
    }
    this.searchCount++;
    this.readCount += this.capacity;
    return ResultText.ofArgs($r('app.string.result_array_find_number_result'), [String(value), foundIndex],
      `findNumberIndex(${value}): ${foundIndex}`);
  }

  findStringIndex(value: string): string {
    if (this.dataType !== DataType.STRING) {
      return ResultText.of($r('app.string.result_array_find_string_not_string_type'),
        'findStringIndex failed: array is not string type');
    }
    let foundIndex: number = -1;
    for (let i: number = 0; i < this.capacity; i++) {
      if (this.stringData[i] === value) {
        foundIndex = i;
        break;
      }
    }
    this.searchCount++;
    this.readCount += this.capacity;
    return ResultText.ofArgs($r('app.string.result_array_find_string_result'), [value, foundIndex],
      `findStringIndex(${value}): ${foundIndex}`);
  }

  filterNumberGreaterThan(threshold: number): string {
    if (this.dataType !== DataType.NUMBER) {
      return ResultText.of($r('app.string.result_array_filter_greater_not_number_type'),
        'filterNumberGreaterThan failed: not number type');
    }
    const result: number[] = [];
    for (let i: number = 0; i < this.capacity; i++) {
      if (this.numberData[i] > threshold) {
        result.push(this.numberData[i]);
      }
    }
    this.searchCount++;
    this.readCount += this.capacity;
    return ResultText.ofArgs($r('app.string.result_array_filter_greater_result'),
      [String(threshold), result.join(','), result.length],
      `filterNumberGreaterThan(${threshold}): [${result.join(',')}] (${result.length} matches)`);
  }

  filterNumberLessThan(threshold: number): string {
    if (this.dataType !== DataType.NUMBER) {
      return ResultText.of($r('app.string.result_array_filter_less_not_number_type'),
        'filterNumberLessThan failed: not number type');
    }
    const result: number[] = [];
    for (let i: number = 0; i < this.capacity; i++) {
      if (this.numberData[i] < threshold) {
        result.push(this.numberData[i]);
      }
    }
    this.searchCount++;
    this.readCount += this.capacity;
    return ResultText.ofArgs($r('app.string.result_array_filter_less_result'),
      [String(threshold), result.join(','), result.length],
      `filterNumberLessThan(${threshold}): [${result.join(',')}] (${result.length} matches)`);
  }

  filterStringContains(substring: string): string {
    if (this.dataType !== DataType.STRING) {
      return ResultText.of($r('app.string.result_array_filter_contains_not_string_type'),
        'filterStringContains failed: not string type');
    }
    const result: string[] = [];
    for (let i: number = 0; i < this.capacity; i++) {
      if (this.stringData[i].indexOf(substring) >= 0) {
        result.push(this.stringData[i]);
      }
    }
    this.searchCount++;
    this.readCount += this.capacity;
    return ResultText.ofArgs($r('app.string.result_array_filter_contains_result'),
      [substring, result.join(','), result.length],
      `filterStringContains('${substring}'): [${result.join(',')}] (${result.length} matches)`);
  }

  containsNumber(value: number): string {
    if (this.dataType !== DataType.NUMBER) {
      return ResultText.of($r('app.string.result_array_contains_number_not_number_type'),
        'containsNumber failed: not number type');
    }
    let found: boolean = false;
    for (let i: number = 0; i < this.capacity; i++) {
      if (this.numberData[i] === value) {
        found = true;
        break;
      }
    }
    this.searchCount++;
    this.readCount += this.capacity;
    return ResultText.ofArgs($r('app.string.result_array_contains_number_result'), [String(value), String(found)],
      `containsNumber(${value}): ${found}`);
  }

  containsString(value: string): string {
    if (this.dataType !== DataType.STRING) {
      return ResultText.of($r('app.string.result_array_contains_string_not_string_type'),
        'containsString failed: not string type');
    }
    let found: boolean = false;
    for (let i: number = 0; i < this.capacity; i++) {
      if (this.stringData[i] === value) {
        found = true;
        break;
      }
    }
    this.searchCount++;
    this.readCount += this.capacity;
    return ResultText.ofArgs($r('app.string.result_array_contains_string_result'), [value, String(found)],
      `containsString('${value}'): ${found}`);
  }

  sumNumberArray(): string {
    if (this.dataType !== DataType.NUMBER) {
      return ResultText.of($r('app.string.result_array_sum_not_number_type'), 'sumNumberArray failed: not number type');
    }
    let sum: number = 0;
    for (let i: number = 0; i < this.capacity; i++) {
      sum += this.numberData[i];
    }
    this.readCount += this.capacity;
    return ResultText.ofArgs($r('app.string.result_array_sum_result'), [String(sum)],
      `sumNumberArray: ${sum}`);
  }

  minNumber(): string {
    if (this.dataType !== DataType.NUMBER) {
      return ResultText.of($r('app.string.result_array_min_not_number_type'), 'minNumber failed: not number type');
    }
    if (this.capacity === 0) {
      return ResultText.of($r('app.string.result_array_min_empty'), 'minNumber failed: empty array');
    }
    let minVal: number = this.numberData[0];
    for (let i: number = 1; i < this.capacity; i++) {
      if (this.numberData[i] < minVal) {
        minVal = this.numberData[i];
      }
    }
    this.readCount += this.capacity;
    return ResultText.ofArgs($r('app.string.result_array_min_result'), [String(minVal)],
      `minNumber: ${minVal}`);
  }

  maxNumber(): string {
    if (this.dataType !== DataType.NUMBER) {
      return ResultText.of($r('app.string.result_array_max_not_number_type'), 'maxNumber failed: not number type');
    }
    if (this.capacity === 0) {
      return ResultText.of($r('app.string.result_array_max_empty'), 'maxNumber failed: empty array');
    }
    let maxVal: number = this.numberData[0];
    for (let i: number = 1; i < this.capacity; i++) {
      if (this.numberData[i] > maxVal) {
        maxVal = this.numberData[i];
      }
    }
    this.readCount += this.capacity;
    return ResultText.ofArgs($r('app.string.result_array_max_result'), [String(maxVal)],
      `maxNumber: ${maxVal}`);
  }

  averageNumber(): string {
    if (this.dataType !== DataType.NUMBER) {
      return ResultText.of($r('app.string.result_array_average_not_number_type'),
        'averageNumber failed: not number type');
    }
    if (this.capacity === 0) {
      return ResultText.of($r('app.string.result_array_average_empty'), 'averageNumber failed: empty array');
    }
    let sum: number = 0;
    for (let i: number = 0; i < this.capacity; i++) {
      sum += this.numberData[i];
    }
    const avg: number = sum / this.capacity;
    this.readCount += this.capacity;
    return ResultText.ofArgs($r('app.string.result_array_average_result'), [String(avg)],
      `averageNumber: ${avg}`);
  }

  toNumberJSON(): string {
    if (this.dataType !== DataType.NUMBER) {
      return ResultText.of($r('app.string.result_array_to_number_json_not_number_type'),
        'toNumberJSON failed: not number type');
    }
    return JSON.stringify(this.numberData);
  }

  toStringJSON(): string {
    if (this.dataType !== DataType.STRING) {
      return ResultText.of($r('app.string.result_array_to_string_json_not_string_type'),
        'toStringJSON failed: not string type');
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
    return ResultText.ofArgs($r('app.string.result_array_metadata'),
      [meta.capacity, String(meta.dataType), meta.createdAt, meta.updatedAt],
      `Metadata: capacity=${meta.capacity}, type=${meta.dataType}, ` +
        `created=${meta.createdAt}, updated=${meta.updatedAt}`);
  }

  getStatistics(): string {
    return ResultText.ofArgs($r('app.string.result_array_statistics'),
      [this.capacity, String(this.dataType), this.readCount, this.writeCount, this.searchCount,
        this.createdAt, this.updatedAt],
      `Array Statistics: capacity=${this.capacity}, type=${this.dataType}, ` +
        `reads=${this.readCount}, writes=${this.writeCount}, searches=${this.searchCount}, ` +
        `createdAt=${this.createdAt}, updatedAt=${this.updatedAt}`);
  }

  resetStatistics(): string {
    this.readCount = 0;
    this.writeCount = 0;
    this.searchCount = 0;
    return ResultText.of($r('app.string.result_array_stats_reset'), 'Array statistics reset');
  }

  clearArray(): string {
    this.numberData = [];
    this.stringData = [];
    this.capacity = 0;
    this.dataType = DataType.NULL;
    this.updatedAt = Date.now();
    return ResultText.of($r('app.string.result_array_cleared'), 'Array cleared');
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
