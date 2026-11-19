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

// Transcription of the dragandexchange HAR (GridSceneView, ListSceneView, DataSource) with item names in place of
// AppInfo objects, so the swap rules can be checked without ArkUI drag events.

// Mirrors ICON_NUM_IN_GRID, the 5 x 3 columnsTemplate/rowsTemplate and ICON_NUM_IN_LIST / LIST_SPACE.
export const ICON_NUM_IN_GRID: number = 15;
export const GRID_COLUMNS: number = 5;
export const GRID_ROWS: number = 3;
export const ICON_NUM_IN_LIST: number = 4;
export const LIST_SPACE: number = 30;

// Mirrors the drag params passed to onDragStart/onDrop (JsonObjType).
export class DragParams {
  public insertIndex: number = -1;
  public selectedIndex: number = -1;
}

// Mirrors GridSceneView.aboutToAppear(): App1 ... App15.
export function gridAppNames(count: number): string[] {
  const names: string[] = [];
  for (let index: number = 1; index <= count; index++) {
    names.push(`App${index}`);
  }
  return names;
}

// Mirrors ListSceneView.aboutToAppear(): Item1 ... Item4.
export function listItemNames(count: number): string[] {
  const names: string[] = [];
  for (let index: number = 0; index < count; index++) {
    names.push(`Item${index + 1}`);
  }
  return names;
}

// Mirrors the media names used for the grid icons ($r(`app.media.drag_and_exchange_ic_public_app${index}`)).
export function gridIconName(index: number): string {
  return `drag_and_exchange_ic_public_app${index}`;
}

// Mirrors the media names used for the list icons (game${index + 1}).
export function listIconName(index: number): string {
  return `drag_and_exchange_ic_public_game${index + 1}`;
}

// Row of a grid cell for the 5-column template; -1 outside the grid.
export function gridRowOf(index: number): number {
  if (!Number.isInteger(index) || index < 0 || index >= GRID_COLUMNS * GRID_ROWS) {
    return -1;
  }
  return Math.floor(index / GRID_COLUMNS);
}

// Column of a grid cell for the 5-column template; -1 outside the grid.
export function gridColumnOf(index: number): number {
  if (!Number.isInteger(index) || index < 0 || index >= GRID_COLUMNS * GRID_ROWS) {
    return -1;
  }
  return index % GRID_COLUMNS;
}

// Inverse of gridRowOf/gridColumnOf; -1 when the cell is outside the template.
export function gridIndexOf(row: number, column: number): number {
  if (!Number.isInteger(row) || !Number.isInteger(column) || row < 0 || row >= GRID_ROWS || column < 0 ||
    column >= GRID_COLUMNS) {
    return -1;
  }
  return row * GRID_COLUMNS + column;
}

// Mirrors onItemDrop(): the swap happens only when isSuccess && insertIndex < totalCount().
export function isGridDropAccepted(isSuccess: boolean, insertIndex: number, totalCount: number): boolean {
  return isSuccess && insertIndex < totalCount;
}

// Mirrors ListSceneView.onDrop(): the drop is ignored when insertIndex >= totalCount().
export function isListDropAccepted(insertIndex: number, totalCount: number): boolean {
  return !(insertIndex >= totalCount);
}

// Mirrors the temp/setData/setData swap of onItemDrop() and changeIndex() on a copy of the names.
export function swapNames(names: string[], index1: number, index2: number): string[] {
  const result: string[] = names.slice();
  const temp: string = result[index1];
  result[index1] = result[index2];
  result[index2] = temp;
  return result;
}

// Mirrors GridSceneView.onItemDrop() on an ordered list of names.
export function gridDropResult(names: string[], itemIndex: number, insertIndex: number, isSuccess: boolean): string[] {
  if (!isGridDropAccepted(isSuccess, insertIndex, names.length)) {
    return names.slice();
  }
  return swapNames(names, itemIndex, insertIndex);
}

// Mirrors ListSceneView.onDrop() + changeIndex(dragIndex, insertIndex).
export function listDropResult(names: string[], dragIndex: number, insertIndex: number): string[] {
  if (!isListDropAccepted(insertIndex, names.length)) {
    return names.slice();
  }
  return swapNames(names, dragIndex, insertIndex);
}

// Mirrors (JSON.parse(extraParams) as JsonObjType); missing or invalid fields stay -1.
export function parseDragParams(extraParams: string): DragParams {
  const params: DragParams = new DragParams();
  try {
    const parsed: DragParams = JSON.parse(extraParams) as DragParams;
    if (parsed !== null && typeof parsed === 'object') {
      params.insertIndex = typeof parsed.insertIndex === 'number' ? parsed.insertIndex : -1;
      params.selectedIndex = typeof parsed.selectedIndex === 'number' ? parsed.selectedIndex : -1;
    }
  } catch (e) {
    params.insertIndex = -1;
    params.selectedIndex = -1;
  }
  return params;
}

// Builds the extraParams string the framework passes to the drag callbacks.
export function dragParamsText(selectedIndex: number, insertIndex: number): string {
  const params: DragParams = new DragParams();
  params.insertIndex = insertIndex;
  params.selectedIndex = selectedIndex;
  return JSON.stringify(params);
}

// Mirrors the DataSource notification flow: each registered listener records the callbacks it receives.
export class DataSourceModel {
  private listeners: string[] = [];
  private names: string[] = [];
  private notificationEvents: string[] = [];

  totalCount(): number {
    return this.names.length;
  }

  getData(index: number): string {
    return this.names[index];
  }

  setData(index: number, name: string): void {
    this.names[index] = name;
  }

  registerDataChangeListener(listener: string): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: string): void {
    const pos: number = this.listeners.indexOf(listener);
    if (pos >= 0) {
      this.listeners.splice(pos, 1);
    }
  }

  pushData(name: string): void {
    this.names.push(name);
    this.notifyDataAdd(this.names.length - 1);
  }

  notifyDataReload(): void {
    this.listeners.forEach((listener: string) => {
      this.notificationEvents.push(`${listener}:reload`);
    });
  }

  notifyDataAdd(index: number): void {
    this.listeners.forEach((listener: string) => {
      this.notificationEvents.push(`${listener}:add${index}`);
    });
  }

  notifyDataChange(index: number): void {
    this.listeners.forEach((listener: string) => {
      this.notificationEvents.push(`${listener}:change${index}`);
    });
  }

  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach((listener: string) => {
      this.notificationEvents.push(`${listener}:move${from}-${to}`);
    });
  }

  listenerCount(): number {
    return this.listeners.length;
  }

  order(): string[] {
    return this.names.slice();
  }

  events(): string[] {
    return this.notificationEvents.slice();
  }
}

// Mirrors GridSceneView: drag start remembers movedItem, drop swaps and reloads.
export class GridDragSession {
  private source: DataSourceModel = new DataSourceModel();
  private movedItem: string = '';

  constructor(count: number) {
    this.source.registerDataChangeListener('grid');
    gridAppNames(count).forEach((name: string) => {
      this.source.pushData(name);
    });
  }

  dragStart(itemIndex: number): string {
    this.movedItem = this.source.getData(itemIndex) ?? '';
    return this.movedItem;
  }

  drop(itemIndex: number, insertIndex: number, isSuccess: boolean): boolean {
    if (!isGridDropAccepted(isSuccess, insertIndex, this.source.totalCount())) {
      return false;
    }
    const temp: string = this.source.getData(itemIndex);
    this.source.setData(itemIndex, this.source.getData(insertIndex));
    this.source.setData(insertIndex, temp);
    this.source.notifyDataReload();
    return true;
  }

  movedName(): string {
    return this.movedItem;
  }

  order(): string[] {
    return this.source.order();
  }

  events(): string[] {
    return this.source.events();
  }
}

// Mirrors ListSceneView: onDragStart hides the item and records dragIndex, onDragEnd shows it again,
// onDrop swaps dragIndex with insertIndex when insertIndex is inside the list.
export class ListDragSession {
  private source: DataSourceModel = new DataSourceModel();
  private visible: boolean[] = [];
  private dragIndex: number = 0;

  constructor(count: number) {
    this.source.registerDataChangeListener('list');
    listItemNames(count).forEach((name: string) => {
      this.source.pushData(name);
      this.visible.push(true);
    });
  }

  dragStart(index: number, extraParams: string): number {
    if (index >= 0 && index < this.visible.length) {
      this.visible[index] = false;
    }
    this.dragIndex = parseDragParams(extraParams).selectedIndex;
    return this.dragIndex;
  }

  dragEnd(index: number): void {
    if (index >= 0 && index < this.visible.length) {
      this.visible[index] = true;
    }
  }

  drop(extraParams: string): boolean {
    const insertIndex: number = parseDragParams(extraParams).insertIndex;
    if (insertIndex >= this.source.totalCount()) {
      return false;
    }
    const temp: string = this.source.getData(this.dragIndex);
    this.source.setData(this.dragIndex, this.source.getData(insertIndex));
    this.source.setData(insertIndex, temp);
    this.source.notifyDataReload();
    return true;
  }

  currentDragIndex(): number {
    return this.dragIndex;
  }

  visibleCount(): number {
    return this.visible.filter((v: boolean) => v).length;
  }

  order(): string[] {
    return this.source.order();
  }

  events(): string[] {
    return this.source.events();
  }
}
