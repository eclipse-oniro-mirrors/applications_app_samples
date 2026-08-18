/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

export const INVALID_PICKER_INDEX: number = -1;

export function getPickerSelectedIndex(index: number | number[]): number {
  if (typeof index === 'number') {
    return index;
  }
  return index.length > 0 ? index[0] : INVALID_PICKER_INDEX;
}

export function getPickerSelectedValues(value: string | string[]): string[] {
  return typeof value === 'string' ? [value] : value;
}

export function isPickerIndexValid(index: number, optionCount: number): boolean {
  return index >= 0 && index < optionCount;
}

export function isMediaFileEmpty(fileSize: number): boolean {
  return fileSize <= 0;
}
