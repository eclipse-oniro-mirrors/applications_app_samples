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
/**
* One observed data change callback.
* The current and the deprecated callback names are recorded with distinct
* kinds, so a test can prove which entry point the data source really invokes.
*/
class ChangeEvent {
  public kind: string;
  public index: number;
  public toIndex: number;
  public operandCount: number;
  constructor(kind: string, index: number, toIndex: number, operandCount: number) {
    this.kind = kind;
    this.index = index;
    this.toIndex = toIndex;
    this.operandCount = operandCount;
  }
}
/**
* Data source listener that keeps every callback in order.
* A data source is expected to call only the non-deprecated entries
* (onDataAdd, onDataMove, ...), therefore the deprecated entries are recorded
* under their own kinds and never alias the modern ones.
*/
export class RecordingListener implements DataChangeListener {
  public label: string;
  public events: Array<ChangeEvent> = [];
  constructor(label: string) {
    this.label = label;
  }
  /**
  * Number of callbacks observed so far.
  */
  public eventCount(): number {
    return this.events.length;
  }
  /**
  * True when no callback was delivered.
  */
  public isSilent(): boolean {
    return this.events.length === 0;
  }
  /**
  * Kind of the callback at the given position, or an empty string when the
  * position is out of range. Returning a string keeps the assertion readable
  * without exposing the event array itself.
  */
  public kindAt(position: number): string {
    if (position < 0 || position >= this.events.length) {
      return '';
    }
    return this.events[position].kind;
  }
  /**
  * Index carried by the callback at the given position, or -1 when absent.
  */
  public indexAt(position: number): number {
    if (position < 0 || position >= this.events.length) {
      return -1;
    }
    return this.events[position].index;
  }
  /**
  * Destination index carried by the callback at the given position.
  */
  public toIndexAt(position: number): number {
    if (position < 0 || position >= this.events.length) {
      return -1;
    }
    return this.events[position].toIndex;
  }
  /**
  * Operation count carried by a dataset callback at the given position.
  */
  public operandCountAt(position: number): number {
    if (position < 0 || position >= this.events.length) {
      return -1;
    }
    return this.events[position].operandCount;
  }
  /**
  * All kinds joined in delivery order, used by order sensitive assertions.
  */
  public kindSequence(): string {
    let sequence: string = '';
    for (let position: number = 0; position < this.events.length; position++) {
      if (position > 0) {
        sequence += '|';
      }
      sequence += this.events[position].kind;
    }
    return sequence;
  }
  /**
  * Discards everything recorded so far without unregistering the listener.
  */
  public reset(): void {
    this.events = [];
  }
  private record(kind: string, index: number, toIndex: number, operandCount: number): void {
    this.events.push(new ChangeEvent(kind, index, toIndex, operandCount));
  }
  onDataReloaded(): void {
    this.record('reload', -1, -1, 0);
  }
  onDataAdd(index: number): void {
    this.record('add', index, -1, 1);
  }
  onDataMove(from: number, to: number): void {
    this.record('move', from, to, 1);
  }
  onDataDelete(index: number): void {
    this.record('delete', index, -1, 1);
  }
  onDataChange(index: number): void {
    this.record('change', index, -1, 1);
  }
  onDatasetChange(dataOperations: DataOperation[]): void {
    this.record('dataset', -1, -1, dataOperations.length);
  }
  onDataAdded(index: number): void {
    this.record('deprecatedAdded', index, -1, 1);
  }
  onDataMoved(from: number, to: number): void {
    this.record('deprecatedMoved', from, to, 1);
  }
  onDataDeleted(index: number): void {
    this.record('deprecatedDeleted', index, -1, 1);
  }
  onDataChanged(index: number): void {
    this.record('deprecatedChanged', index, -1, 1);
  }
}
