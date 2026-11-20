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

import { CardData } from 'library/src/main/ets/components/dyn/CardData';
import { DataModel } from 'library/src/main/ets/components/dyn/DataModel';
import { DataSource } from 'library/src/main/ets/components/dyn/DataSource';
import { IDataParser } from 'library/src/main/ets/components/dyn/DataParser';
import { LayoutData } from 'library/src/main/ets/components/dyn/CommonType';
import { ICardResolver } from 'library/src/main/ets/components/dyn/ResolverRegistry';
import { EtsFactory, IEtsFactory } from 'library/src/main/ets/components/sta_bridge/EtsFactory';
import { expect } from '@ohos/hypium';
import hilog from '@ohos.hilog';

export interface CardTitle {
  name: string;
}

export interface CardItem {
  title: CardTitle;
}

export interface CardStyle {
  width: string;
  theme: string;
}

export interface CardPayload {
  item: CardItem;
  style: CardStyle;
  sequence: number;
  enabled: boolean;
  amount: number;
  tags: string[];
}

export interface LayoutGroup {
  groupId: number;
  type: string;
  data: CardPayload[];
}

export function makePayload(title: string, width: string, sequence: number): CardPayload {
  return {
    item: { title: { name: title } },
    style: { width: width, theme: sequence % 2 === 0 ? 'light' : 'dark' },
    sequence: sequence,
    enabled: sequence % 2 === 0,
    amount: sequence / 2,
    tags: [title, String(sequence)]
  };
}

export function makeModel(type: string, payload: CardPayload): DataModel {
  return { type: type, data: payload };
}

export function makeGroup(type: string, count: number, prefix: string, offset: number = 0): LayoutGroup {
  const payloads: CardPayload[] = [];
  for (let index = 0; index < count; index++) {
    payloads.push(makePayload(prefix + ':' + index, '100%', offset + index));
  }
  return { groupId: offset, type: type, data: payloads };
}

export function makeSource(type: string, count: number, prefix: string): DataSource {
  const source = new DataSource();
  const group = makeGroup(type, count, prefix);
  for (const payload of group.data) {
    source.addData(new CardData(makeModel(type, payload)));
  }
  return source;
}

export async function assertSource(
  source: DataSource, type: string, count: number, prefix: string
): Promise<void> {
  expect(source.totalCount()).assertEqual(count);
  const ids: string[] = [];
  for (let index = 0; index < count; index++) {
    if (index % 32 === 0) {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    }
    const card = source.getData(index);
    expect(card.type).assertEqual(type);
    expect(card.opt('item').title.name).assertEqual(prefix + ':' + index);
    expect(card.opt('sequence')).assertEqual(index);
    const id = card.getObjectId();
    expect(id.length > 0).assertTrue();
    expect(ids.indexOf(id)).assertEqual(-1);
    ids.push(id);
  }
}

// A spy at the resolver boundary; returned values are production CardData instances.
export class RecordingResolver implements ICardResolver {
  calls: number = 0;
  models: DataModel[] = [];
  failure: Error | undefined = undefined;

  createData(model: DataModel): CardData {
    this.calls++;
    this.models.push(model);
    if (this.failure !== undefined) {
      throw this.failure;
    }
    return new CardData(model);
  }
}

// Only the native parser dependency is replaced in wrapper unit tests.
export class ControlledParser implements IDataParser {
  inputs: LayoutData[] = [];
  result: DataSource = new DataSource();
  failure: Error | undefined = undefined;
  synchronousFailure: boolean = false;

  parse(input: LayoutData): Promise<DataSource> {
    this.inputs.push(input);
    if (this.failure !== undefined) {
      if (this.synchronousFailure) {
        throw this.failure;
      }
      return Promise.reject(this.failure);
    }
    return Promise.resolve(this.result);
  }
}

export class ControlledFactory implements IEtsFactory {
  parser: ControlledParser;
  calls: number = 0;

  constructor(parser: ControlledParser) {
    this.parser = parser;
  }

  newDataParser(): IDataParser {
    this.calls++;
    return this.parser;
  }
}

export class ListenerRecorder implements DataChangeListener {
  events: string[] = [];

  onDataReloaded(): void {
    this.events.push('reload');
  }

  onDataAdded(index: number): void {
    this.events.push('add:' + index);
  }

  onDataMoved(from: number, to: number): void {
    this.events.push('move:' + from + ':' + to);
  }

  onDataDeleted(index: number): void {
    this.events.push('delete:' + index);
  }

  onDataChanged(index: number): void {
    this.events.push('change:' + index);
  }

  onDataAdd(index: number): void {
    this.onDataAdded(index);
  }

  onDataMove(from: number, to: number): void {
    this.onDataMoved(from, to);
  }

  onDataDelete(index: number): void {
    this.onDataDeleted(index);
  }

  onDataChange(index: number): void {
    this.onDataChanged(index);
  }

  onDatasetChange(operations: DataOperation[]): void {
    this.events.push('dataset:' + operations.length);
  }
}

export async function waitForNativeFactory(timeoutMs: number = 10000): Promise<void> {
  const deadline = Date.now() + timeoutMs;
  while (EtsFactory.get() === undefined) {
    if (Date.now() >= deadline) {
      throw new Error('Static factory initialization timed out');
    }
    await new Promise<void>((resolve) => {
      setTimeout(resolve, 20);
    });
  }
}

export function logSuite(name: string, state: string): void {
  hilog.info(0x0000, 'ArkTSStaticTest', '%{public}s %{public}s', name, state);
}

export function assertUniqueIds(source: DataSource): void {
  const seen: string[] = [];
  for (let index = 0; index < source.totalCount(); index++) {
    const id = source.getData(index).getObjectId();
    expect(seen.indexOf(id)).assertEqual(-1);
    seen.push(id);
  }
  expect(seen.length).assertEqual(source.totalCount());
}

export function snapshotTitles(source: DataSource): string[] {
  const titles: string[] = [];
  for (let index = 0; index < source.totalCount(); index++) {
    titles.push(source.getData(index).opt('item').title.name);
  }
  return titles;
}

export function expectedFibonacci(index: number): number {
  if (index <= 1) {
    return index;
  }
  let previous = 0;
  let current = 1;
  for (let step = 2; step <= index; step++) {
    const next = previous + current;
    previous = current;
    current = next;
  }
  return current;
}
