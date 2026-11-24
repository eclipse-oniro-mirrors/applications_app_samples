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

export class SlotModel {
  public static readonly MIN_SLOT_ID: number = 0;
  public static readonly MAX_SLOT_ID: number = 3;
  public static readonly DEFAULT_SLOT_ID: number = 0;
  public static readonly UNKNOWN: string = 'unknown';
  public static readonly SELECTION_MODE_NAMES: string[] = ['unknown', 'automatic', 'manual'];

  public static isValidSlotId(value: number): boolean {
    return Number.isInteger(value) && value >= SlotModel.MIN_SLOT_ID && value <= SlotModel.MAX_SLOT_ID;
  }

  public static normalizeSlotId(value: number): number {
    if (!SlotModel.isValidSlotId(value)) {
      return SlotModel.DEFAULT_SLOT_ID;
    }
    return value;
  }

  public static formatTitle(value: number): string {
    if (!SlotModel.isValidSlotId(value)) {
      return 'SIM status';
    }
    return `SIM${value + 1} status`;
  }

  public static selectionModeName(value: number): string {
    if (!Number.isInteger(value) || value < 0 || value >= SlotModel.SELECTION_MODE_NAMES.length) {
      return SlotModel.UNKNOWN;
    }
    return SlotModel.SELECTION_MODE_NAMES[value];
  }

  public static slotIndexFromTitle(title: string): number {
    for (let index: number = SlotModel.MIN_SLOT_ID; index <= SlotModel.MAX_SLOT_ID; index++) {
      if (title === `SIM${index + 1} status`) {
        return index;
      }
    }
    return -1;
  }
}
