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

import { expect } from '@ohos/hypium';
import { WaterFlowDataSource } from '@ohos/WaterFlow';
import { BasicDataSource } from '@ohos/trace';
import { execColorInfo, splitRgbaShards } from '@ohos/ThreadDataTransfer';

export enum WaterEdit { Prepend, Append, Insert, DeleteFirst, DeleteSecond, DeleteLast, Reload }
export enum TraceEvent { Reload, Add, Change, Delete, Move }

class EventRecorder implements DataChangeListener {
  private output: string[];
  private label: string;
  private source?: WaterFlowDataSource;

  constructor(output: string[], label: string, source?: WaterFlowDataSource) {
    this.output = output;
    this.label = label;
    this.source = source;
  }

  private record(event: string): void {
    const count = this.source === undefined ? '' : `:${this.source.totalCount()}`;
    this.output.push(`${this.label}:${event}${count}`);
  }

  onDataReloaded(): void { this.record('reload'); }
  onDataAdd(index: number): void { this.record(`add:${index}`); }
  onDataDelete(index: number): void { this.record(`delete:${index}`); }
  onDataChange(index: number): void { this.record(`change:${index}`); }
  onDataMove(from: number, to: number): void { this.record(`move:${from}:${to}`); }
  onDataAdded(index: number): void { this.onDataAdd(index); }
  onDataDeleted(index: number): void { this.onDataDelete(index); }
  onDataChanged(index: number): void { this.onDataChange(index); }
  onDataMoved(from: number, to: number): void { this.onDataMove(from, to); }
  onDatasetChange(dataOperations: DataOperation[]): void { this.record(`dataset:${dataOperations.length}`); }
}

// The expected snapshots are prepared by the generator; this fixture only drives and inspects the HAR.
export class WaterFlowMatrix {
  private source: WaterFlowDataSource = new WaterFlowDataSource();
  private events: string[] = [];
  private primary: EventRecorder = new EventRecorder(this.events, 'primary', this.source);
  private secondary: EventRecorder = new EventRecorder(this.events, 'secondary', this.source);

  constructor() {
    this.source.registerDataChangeListener(this.primary);
    this.source.registerDataChangeListener(this.secondary);
  }

  unsubscribePrimary(): void {
    this.source.unregisterDataChangeListener(this.primary);
  }

  resubscribePrimary(): void {
    this.source.registerDataChangeListener(this.primary);
    this.source.registerDataChangeListener(this.primary);
  }

  perform(edit: WaterEdit, index: number): void {
    switch (edit) {
      case WaterEdit.Prepend: this.source.Add1stItem(); break;
      case WaterEdit.Append: this.source.AddLastItem(); break;
      case WaterEdit.Insert: this.source.AddItem(index); break;
      case WaterEdit.DeleteFirst: this.source.Delete1stItem(); break;
      case WaterEdit.DeleteSecond: this.source.Delete2ndItem(); break;
      case WaterEdit.DeleteLast: this.source.DeleteLastItem(); break;
      case WaterEdit.Reload: this.source.Reload(); break;
    }
  }

  assertState(expectedItems: string, expectedEvents: string): void {
    const actualItems: number[] = [];
    const count = this.source.totalCount();
    for (let index = 0; index < count; index++) {
      actualItems.push(this.source.getData(index));
    }
    const items = actualItems.join(',');
    const events = this.events.join(',');
    expect(items).assertEqual(expectedItems);
    expect(events).assertEqual(expectedEvents);
    this.events.length = 0;
  }
}

class StaticTraceSource extends BasicDataSource<number> {
  private items: number[] = [11, 19, 23, 37, 41, 53, 59, 71];

  totalCount(): number { return this.items.length; }
  getData(index: number): number { return this.items[index]; }
}

export class TraceMatrix {
  private source: StaticTraceSource = new StaticTraceSource();
  private events: string[] = [];
  private first: EventRecorder = new EventRecorder(this.events, 'first');
  private second: EventRecorder = new EventRecorder(this.events, 'second');
  private third: EventRecorder = new EventRecorder(this.events, 'third');

  constructor() {
    this.source.registerDataChangeListener(this.first);
    this.source.registerDataChangeListener(this.second);
  }

  firstLeaves(): void { this.source.unregisterDataChangeListener(this.first); }
  thirdJoins(): void { this.source.registerDataChangeListener(this.third); }
  firstReturns(): void {
    this.source.registerDataChangeListener(this.first);
    this.source.registerDataChangeListener(this.first);
  }

  publish(kind: TraceEvent, index: number, to: number): void {
    switch (kind) {
      case TraceEvent.Reload: this.source.notifyDataReload(); break;
      case TraceEvent.Add: this.source.notifyDataAdd(index); break;
      case TraceEvent.Change: this.source.notifyDataChange(index); break;
      case TraceEvent.Delete: this.source.notifyDataDelete(index); break;
      case TraceEvent.Move: this.source.notifyDataMove(index, to); break;
    }
  }

  assertPublished(expected: string): void {
    const actual = this.events.join(',');
    expect(actual).assertEqual(expected);
    this.events.length = 0;
  }

  assertDataUnchanged(): void {
    const actual: number[] = [];
    const count = this.source.totalCount();
    for (let index = 0; index < count; index++) {
      actual.push(this.source.getData(index));
    }
    const itemOrder = actual.join(',');
    expect(itemOrder).assertEqual('11,19,23,37,41,53,59,71');
  }
}

export class RgbaPipelineMatrix {
  private source: ArrayBuffer;
  private shards: ArrayBuffer[] = [];

  constructor(pixels: number) {
    this.source = new ArrayBuffer(pixels * 4);
    const bytes = new Uint8Array(this.source);
    for (let i = 0; i < pixels; i++) {
      bytes[i * 4 + i % 3] = 255;
      bytes[i * 4 + 3] = (29 * i + 17) % 256;
    }
  }

  split(tasks: number): void {
    this.shards = splitRgbaShards(this.source, tasks);
  }

  assertLayout(expectedCount: number, shortestPixels: number, longestPixels: number): void {
    const count = this.shards.length;
    expect(count).assertEqual(expectedCount);
    let min = Number.POSITIVE_INFINITY;
    let max = 0;
    let shardIndex = 0;
    const pixels = this.source.byteLength / 4;
    const sourceBytes = new Uint8Array(this.source);
    for (const shard of this.shards) {
      const aligned = shard.byteLength > 0 && shard.byteLength % 4 === 0;
      expect(aligned).assertTrue();
      const start = Math.floor(shardIndex * pixels / expectedCount) * 4;
      const end = Math.floor((shardIndex + 1) * pixels / expectedCount) * 4;
      const length = shard.byteLength;
      const expectedLength = end - start;
      expect(length).assertEqual(expectedLength);
      const bytes = new Uint8Array(shard);
      for (let byteIndex = 0; byteIndex < bytes.length; byteIndex++) {
        const actual = bytes[byteIndex];
        const expected = sourceBytes[start + byteIndex];
        expect(actual).assertEqual(expected);
      }
      shardIndex++;
      min = Math.min(min, shard.byteLength / 4);
      max = Math.max(max, shard.byteLength / 4);
    }
    expect(min).assertEqual(shortestPixels);
    expect(max).assertEqual(longestPixels);
  }

  transform(previous: number, target: number): void {
    this.shards = this.shards.map(shard => execColorInfo(shard, previous, target));
  }

  assertOutput(nonDominant: number): void {
    const source = new Uint8Array(this.source);
    let cursor = 0;
    for (const shard of this.shards) {
      for (const byte of new Uint8Array(shard)) {
        const channel = cursor % 4;
        const pixel = Math.floor(cursor / 4);
        const expected = channel === 3 ? (29 * pixel + 17) % 256 : (channel === pixel % 3 ? 255 : nonDominant);
        if (byte !== expected) {
          throw new Error(`Pixel ${pixel}, channel ${channel}: expected ${expected}, got ${byte}`);
        }
        cursor++;
      }
    }
    expect(cursor).assertEqual(source.length);
  }

  assertSourceUnchanged(): void {
    const bytes = new Uint8Array(this.source);
    for (let i = 0; i < bytes.length / 4; i++) {
      const offset = i * 4;
      const expected = [0, 0, 0, (29 * i + 17) % 256];
      expected[i % 3] = 255;
      const actual = [bytes[offset], bytes[offset + 1], bytes[offset + 2], bytes[offset + 3]].join(',');
      expect(actual).assertEqual(expected.join(','));
    }
  }
}
