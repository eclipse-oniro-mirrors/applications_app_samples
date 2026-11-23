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

// Non-generic transcription of ListExchange/src/main/ets/model/ListExchangeCtrl.ets (drag, swap, delete, add)
// without animateTo(); the Curve.Sharp interpolation result is passed in as curveValue.

// Mirrors ITEM_HEIGHT and the fixed values of ListExchangeCtrl.
export const ITEM_HEIGHT: number = 50;
export const PRESS_SCALE: number = 1.04;
export const DELETE_OFFSET_X: number = 150;
export const ANIMATE_DURATION: number = 300;

// Mirrors the private OperationStatus enum of ListExchangeCtrl.
export enum OperationStatus {
  IDLE = 0,
  PRESSING = 1,
  MOVING = 2,
  DROPPING = 3,
  DELETE = 4
}

// Mirrors onMove(): this.offsetY = offsetY - this.dragRefOffset.
export function relativeOffsetOf(offsetY: number, dragRefOffset: number): number {
  return offsetY - dragRefOffset;
}

// Mirrors onMove(): direction = this.offsetY > 0 ? 1 : -1.
export function directionOf(offsetY: number): number {
  return offsetY > 0 ? 1 : -1;
}

// Mirrors onMove(): curve input Math.abs(this.offsetY) / ITEM_HEIGHT.
export function curveInputOf(offsetY: number): number {
  return Math.abs(offsetY) / ITEM_HEIGHT;
}

// Mirrors onMove(): shrinkScale = 1 - value / 10.
export function shrinkScaleOf(curveValue: number): number {
  return 1 - curveValue / 10;
}

// Mirrors onMove(): the next item shrinks when dragging down, the previous one when dragging up.
export function neighbourScaleOf(isNext: boolean, direction: number, shrinkScale: number): number {
  if (isNext) {
    return direction > 0 ? shrinkScale : 1;
  }
  return direction > 0 ? 1 : shrinkScale;
}

// Mirrors onMove(): a swap is considered once the drag passes half an item.
export function passesSwapThreshold(offsetY: number): boolean {
  return Math.abs(offsetY) > ITEM_HEIGHT / 2;
}

// Mirrors onMove(): the first item cannot move up and the last item cannot move down.
export function canSwap(index: number, direction: number, length: number): boolean {
  if (index === 0 && direction === -1) {
    return false;
  }
  if (index === length - 1 && direction === 1) {
    return false;
  }
  return true;
}

// Mirrors onMove(): target = index + direction, used only when target !== -1 && target <= length.
export function swapTargetOf(index: number, direction: number, length: number): number {
  const target: number = index + direction;
  if (target !== -1 && target <= length) {
    return target;
  }
  return -1;
}

// Mirrors the offsets after a swap: offsetY -= direction * ITEM_HEIGHT.
export function offsetAfterSwapOf(offsetY: number, direction: number): number {
  return offsetY - direction * ITEM_HEIGHT;
}

// Mirrors the reference after a swap: dragRefOffset += direction * ITEM_HEIGHT.
export function refAfterSwapOf(dragRefOffset: number, direction: number): number {
  return dragRefOffset + direction * ITEM_HEIGHT;
}

// Mirrors changeItem(index, newIndex): splice the item out and insert it at the new index.
export function reorder(items: string[], index: number, newIndex: number): string[] {
  const result: string[] = items.slice();
  const tmp: string[] = result.splice(index, 1);
  result.splice(newIndex, 0, tmp[0]);
  return result;
}

// Mirrors the per-item modifier state of ListExchangeCtrl (ListItemModifier fields).
export class ExchangeItemState {
  hasShadow: boolean = false;
  scale: number = 1;
  offsetY: number = 0;
  offsetX: number = 0;
  opacity: number = 1;
}

// Mirrors ListExchangeCtrl<string>: items with their modifier state and the drag bookkeeping.
export class ListExchangeModel {
  items: string[] = [];
  scales: number[] = [];
  offsets: number[] = [];
  shadows: boolean[] = [];
  dragRefOffset: number = 0;
  offsetY: number = 0;
  state: number = OperationStatus.IDLE;

  // Mirrors initData(): one modifier per item.
  initData(items: string[]): number {
    this.items = items.slice();
    this.scales = items.map((): number => 1);
    this.offsets = items.map((): number => 0);
    this.shadows = items.map((): boolean => false);
    return this.items.length;
  }

  // Mirrors onLongPress(): the pressed item gets a shadow and the 1.04 scale.
  longPress(item: string): number {
    const index: number = this.items.indexOf(item);
    this.dragRefOffset = 0;
    this.state = OperationStatus.PRESSING;
    if (index >= 0) {
      this.shadows[index] = true;
      this.scales[index] = PRESS_SCALE;
    }
    return index;
  }

  // Mirrors onMove() with the curve value of Curve.Sharp; returns the index the item ends at.
  move(item: string, offsetY: number, curveValue: number): number {
    const index: number = this.items.indexOf(item);
    if (index < 0) {
      return -1;
    }
    this.offsetY = relativeOffsetOf(offsetY, this.dragRefOffset);
    this.offsets[index] = this.offsetY;
    const direction: number = directionOf(this.offsetY);
    const shrink: number = shrinkScaleOf(curveValue);
    if (index < this.scales.length - 1) {
      this.scales[index + 1] = neighbourScaleOf(true, direction, shrink);
    }
    if (index > 0) {
      this.scales[index - 1] = neighbourScaleOf(false, direction, shrink);
    }
    if (!passesSwapThreshold(this.offsetY) || !canSwap(index, direction, this.items.length)) {
      return index;
    }
    this.offsetY = offsetAfterSwapOf(this.offsetY, direction);
    this.dragRefOffset = refAfterSwapOf(this.dragRefOffset, direction);
    this.offsets[index] = this.offsetY;
    const target: number = swapTargetOf(index, direction, this.scales.length);
    if (target === -1) {
      return index;
    }
    this.changeItem(index, target);
    return target;
  }

  // Mirrors onDrop(): neighbours and the dropped item are reset.
  drop(item: string): number {
    const index: number = this.items.indexOf(item);
    this.dragRefOffset = 0;
    this.offsetY = 0;
    this.state = OperationStatus.IDLE;
    if (index < 0) {
      return -1;
    }
    if (index < this.scales.length - 1) {
      this.scales[index + 1] = 1;
    }
    if (index > 0) {
      this.scales[index - 1] = 1;
    }
    this.shadows[index] = false;
    this.scales[index] = 1;
    this.offsets[index] = 0;
    return index;
  }

  // Mirrors changeItem().
  changeItem(index: number, newIndex: number): void {
    this.items = reorder(this.items, index, newIndex);
    const scale: number[] = this.scales.splice(index, 1);
    this.scales.splice(newIndex, 0, scale[0]);
    const offset: number[] = this.offsets.splice(index, 1);
    this.offsets.splice(newIndex, 0, offset[0]);
    const shadow: boolean[] = this.shadows.splice(index, 1);
    this.shadows.splice(newIndex, 0, shadow[0]);
  }

  // Mirrors deleteItem(): the item is removed after the slide-out animation.
  deleteItem(item: string): number {
    const index: number = this.items.indexOf(item);
    this.dragRefOffset = 0;
    if (index >= 0) {
      this.items.splice(index, 1);
      this.scales.splice(index, 1);
      this.offsets.splice(index, 1);
      this.shadows.splice(index, 1);
    }
    this.state = OperationStatus.IDLE;
    return this.items.length;
  }

  // Mirrors addItem(): a new item with a fresh modifier.
  addItem(item: string): number {
    this.items.push(item);
    this.scales.push(1);
    this.offsets.push(0);
    this.shadows.push(false);
    return this.items.length;
  }

  // Mirrors the list order rendered by ListExchangeView.
  order(): string {
    return this.items.join(',');
  }
}
