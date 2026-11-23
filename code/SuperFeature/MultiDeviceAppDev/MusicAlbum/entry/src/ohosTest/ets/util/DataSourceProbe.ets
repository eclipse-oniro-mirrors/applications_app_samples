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
 * Probes over the real MyDataSource (entry/src/main/ets/model/SongModule.ets).
 *
 * Every probe builds a data source from a deterministic seed, drives one
 * operation and returns a compact snapshot of the observable state. Suites
 * compare the snapshot against the frozen rule of the SUT (Array#splice
 * based insertion, index passthrough on notify) instead of re-implementing it.
 *
 * Snapshot grammar:
 *   runDataSource      -> '<total>'
 *   runDataSourceIndex -> '<id>|<title>' | 'undefined'
 *   runDataSourceAdd   -> '<total>|<positionOfNew>|<notifiedIndex>'
 *   runDataSourcePush  -> '<total>|<lastId>|<addCount>|<notifiedIndex>'
 *   runListener*       -> counts joined by '|'
 */
import MyDataSource, { SongItem } from '../../../main/ets/model/SongModule';
import { ProbeListener } from './ListenerProbe';

export const SEED_BASE: number = 7000;
export const NEW_ID: number = 9000;
export const PUSH_BASE: number = 9100;

export function seedSongs(count: number): SongItem[] {
  const list: SongItem[] = [];
  for (let i = 0; i < count; i++) {
    list.push({
      id: SEED_BASE + i,
      title: 'seed_' + i.toString(),
      singer: 'singer_' + i.toString(),
      label: $r('app.media.ic_SQ')
    });
  }
  return list;
}

export function makeSong(id: number): SongItem {
  return {
    id: id,
    title: 'probe_' + id.toString(),
    singer: 'probe_singer',
    label: $r('app.media.ic_vip')
  };
}

function itemOf(ds: MyDataSource, index: number): SongItem | undefined {
  const raw: Object | undefined = ds.getData(index) as Object | undefined;
  if (raw === undefined || raw === null) {
    return undefined;
  }
  return raw as SongItem;
}

function positionOf(ds: MyDataSource, id: number, title: string): number {
  for (let i = 0; i < ds.totalCount(); i++) {
    const item: SongItem | undefined = itemOf(ds, i);
    // the id alone is ambiguous once the seed range grows past NEW_ID, so the
    // seeded rows ('seed_<i>') and the probed row ('probe_<id>') are told apart
    // by their title as well
    if (item !== undefined && item.id === id && item.title === title) {
      return i;
    }
  }
  return -1;
}

/** total | first id | last id | getData(totalCount) */
export function runDataSource(count: number): string {
  const ds: MyDataSource = new MyDataSource(seedSongs(count));
  const first: SongItem | undefined = itemOf(ds, 0);
  const last: SongItem | undefined = itemOf(ds, count - 1);
  const oob: SongItem | undefined = itemOf(ds, count);
  const firstText: string = first === undefined ? 'empty' : first.id.toString();
  const lastText: string = last === undefined ? 'empty' : last.id.toString();
  const oobText: string = oob === undefined ? 'undefined' : 'leak';
  return ds.totalCount().toString() + '|' + firstText + '|' + lastText + '|' + oobText;
}

/** '<id>|<title>' for a valid index, 'undefined' otherwise */
export function runDataSourceIndex(count: number, index: number): string {
  const ds: MyDataSource = new MyDataSource(seedSongs(count));
  const item: SongItem | undefined = itemOf(ds, index);
  if (item === undefined) {
    return 'undefined';
  }
  return item.id.toString() + '|' + item.title;
}

/** '<total>|<positionOfNew>|<notifiedIndex>' */
export function runDataSourceAdd(count: number, insertAt: number): string {
  const ds: MyDataSource = new MyDataSource(seedSongs(count));
  const listener: ProbeListener = new ProbeListener();
  ds.registerDataChangeListener(listener);
  ds.addData(insertAt, makeSong(NEW_ID));
  return ds.totalCount().toString() + '|' + positionOf(ds, NEW_ID, 'probe_' + NEW_ID.toString()).toString() + '|' +
    listener.lastIndex.toString();
}

/** '<total>|<lastId>|<addCount>|<notifiedIndex>' */
export function runDataSourcePush(count: number, times: number): string {
  const ds: MyDataSource = new MyDataSource(seedSongs(count));
  const listener: ProbeListener = new ProbeListener();
  ds.registerDataChangeListener(listener);
  for (let i = 0; i < times; i++) {
    ds.pushData(makeSong(PUSH_BASE + i));
  }
  const last: SongItem | undefined = itemOf(ds, ds.totalCount() - 1);
  const lastText: string = last === undefined ? 'undefined' : last.id.toString();
  return ds.totalCount().toString() + '|' + lastText + '|' + listener.addCount.toString() + '|' +
    listener.lastIndex.toString();
}

/** '<total>|<headId>|<tailId>|<addCount>' after add + push on the same instance */
export function runDataSourceMixed(count: number, insertAt: number, times: number): string {
  const ds: MyDataSource = new MyDataSource(seedSongs(count));
  const listener: ProbeListener = new ProbeListener();
  ds.registerDataChangeListener(listener);
  ds.addData(insertAt, makeSong(NEW_ID));
  for (let i = 0; i < times; i++) {
    ds.pushData(makeSong(PUSH_BASE + i));
  }
  const head: SongItem | undefined = itemOf(ds, 0);
  const tail: SongItem | undefined = itemOf(ds, ds.totalCount() - 1);
  const headText: string = head === undefined ? 'empty' : head.id.toString();
  const tailText: string = tail === undefined ? 'empty' : tail.id.toString();
  return ds.totalCount().toString() + '|' + headText + '|' + tailText + '|' +
    listener.addCount.toString();
}

/** Boundary probes that do not fit the numeric matrix. */
export function runDataSourceBoundary(kind: string): string {
  if (kind === 'max-safe') {
    const ds: MyDataSource = new MyDataSource(seedSongs(3));
    const item: SongItem | undefined = itemOf(ds, Number.MAX_SAFE_INTEGER);
    return item === undefined ? 'undefined' : 'leak';
  }
  if (kind === 'neg-index') {
    const ds: MyDataSource = new MyDataSource(seedSongs(3));
    const item: SongItem | undefined = itemOf(ds, -1);
    return item === undefined ? 'undefined' : 'leak';
  }
  if (kind === 'empty-push') {
    const ds: MyDataSource = new MyDataSource(seedSongs(0));
    ds.pushData(makeSong(NEW_ID));
    const item: SongItem | undefined = itemOf(ds, 0);
    return ds.totalCount().toString() + '|' + (item === undefined ? 'empty' : item.id.toString());
  }
  if (kind === 'empty-add-zero') {
    const ds: MyDataSource = new MyDataSource(seedSongs(0));
    ds.addData(0, makeSong(NEW_ID));
    const item: SongItem | undefined = itemOf(ds, 0);
    return ds.totalCount().toString() + '|' + (item === undefined ? 'empty' : item.id.toString());
  }
  if (kind === 'empty-add-over') {
    const ds: MyDataSource = new MyDataSource(seedSongs(0));
    ds.addData(5, makeSong(NEW_ID));
    const item: SongItem | undefined = itemOf(ds, 0);
    return ds.totalCount().toString() + '|' + (item === undefined ? 'empty' : item.id.toString());
  }
  if (kind === 'empty-add-neg') {
    const ds: MyDataSource = new MyDataSource(seedSongs(0));
    ds.addData(-1, makeSong(NEW_ID));
    const item: SongItem | undefined = itemOf(ds, 0);
    return ds.totalCount().toString() + '|' + (item === undefined ? 'empty' : item.id.toString());
  }
  if (kind === 'seed-isolation') {
    const seed: SongItem[] = seedSongs(3);
    const ds: MyDataSource = new MyDataSource(seed);
    seed.push(makeSong(NEW_ID));
    return ds.totalCount().toString() + '|' + seed.length.toString();
  }
  if (kind === 'seed-empty') {
    const ds: MyDataSource = new MyDataSource([]);
    return ds.totalCount().toString() + '|' + (itemOf(ds, 0) === undefined ? 'undefined' : 'leak');
  }
  return 'unknown';
}

/** listener bookkeeping observed through notifyDataAdd(0) */
export function runListenerRegister(kind: string): string {
  const ds: MyDataSource = new MyDataSource(seedSongs(2));
  const first: ProbeListener = new ProbeListener();
  const second: ProbeListener = new ProbeListener();
  if (kind === 'once') {
    ds.registerDataChangeListener(first);
  } else if (kind === 'twice') {
    ds.registerDataChangeListener(first);
    ds.registerDataChangeListener(first);
  } else if (kind === 'three') {
    ds.registerDataChangeListener(first);
    ds.registerDataChangeListener(first);
    ds.registerDataChangeListener(first);
  } else if (kind === 'two') {
    ds.registerDataChangeListener(first);
    ds.registerDataChangeListener(second);
  } else if (kind === 'unreg') {
    ds.registerDataChangeListener(first);
    ds.unregisterDataChangeListener(first);
  } else if (kind === 'unreg-unknown') {
    ds.registerDataChangeListener(first);
    ds.unregisterDataChangeListener(second);
  } else if (kind === 'unreg-twice') {
    ds.registerDataChangeListener(first);
    ds.unregisterDataChangeListener(first);
    ds.unregisterDataChangeListener(first);
  } else if (kind === 're-reg') {
    ds.registerDataChangeListener(first);
    ds.unregisterDataChangeListener(first);
    ds.registerDataChangeListener(first);
  }
  ds.notifyDataAdd(0);
  return first.addCount.toString() + '|' + second.addCount.toString();
}

function notifyCount(listener: ProbeListener, kind: string): number {
  if (kind === 'reload') {
    return listener.reloadCount;
  }
  if (kind === 'add') {
    return listener.addCount;
  }
  if (kind === 'change') {
    return listener.changeCount;
  }
  if (kind === 'delete') {
    return listener.deleteCount;
  }
  return listener.moveCount;
}

/**
 * Register bookkeeping combined with the forwarded index.
 * Snapshot: '<firstAdd>|<secondAdd>|<firstLastIndex>'.
 */
export function runListenerRegisterIndex(kind: string, index: number): string {
  const ds: MyDataSource = new MyDataSource(seedSongs(2));
  const first: ProbeListener = new ProbeListener();
  const second: ProbeListener = new ProbeListener();
  if (kind === 'once') {
    ds.registerDataChangeListener(first);
  } else if (kind === 'twice') {
    ds.registerDataChangeListener(first);
    ds.registerDataChangeListener(first);
  } else if (kind === 'three') {
    ds.registerDataChangeListener(first);
    ds.registerDataChangeListener(first);
    ds.registerDataChangeListener(first);
  } else if (kind === 'two') {
    ds.registerDataChangeListener(first);
    ds.registerDataChangeListener(second);
  } else if (kind === 'unreg') {
    ds.registerDataChangeListener(first);
    ds.unregisterDataChangeListener(first);
  } else if (kind === 'unreg-unknown') {
    ds.registerDataChangeListener(first);
    ds.unregisterDataChangeListener(second);
  } else if (kind === 'unreg-twice') {
    ds.registerDataChangeListener(first);
    ds.unregisterDataChangeListener(first);
    ds.unregisterDataChangeListener(first);
  } else if (kind === 're-reg') {
    ds.registerDataChangeListener(first);
    ds.unregisterDataChangeListener(first);
    ds.registerDataChangeListener(first);
  }
  ds.notifyDataAdd(index);
  return first.addCount.toString() + '|' + second.addCount.toString() + '|' +
    first.lastIndex.toString();
}

/** '<c1>|<c2>|<c3>|<lastIndex>|<lastFrom>|<lastTo>' */
export function runListenerNotify(kind: string, index: number, listenerCount: number): string {
  const ds: MyDataSource = new MyDataSource(seedSongs(3));
  const first: ProbeListener = new ProbeListener();
  const second: ProbeListener = new ProbeListener();
  const third: ProbeListener = new ProbeListener();
  ds.registerDataChangeListener(first);
  if (listenerCount >= 2) {
    ds.registerDataChangeListener(second);
  }
  if (listenerCount >= 3) {
    ds.registerDataChangeListener(third);
  }
  if (kind === 'reload') {
    ds.notifyDataReload();
  } else if (kind === 'add') {
    ds.notifyDataAdd(index);
  } else if (kind === 'change') {
    ds.notifyDataChange(index);
  } else if (kind === 'delete') {
    ds.notifyDataDelete(index);
  } else if (kind === 'move') {
    ds.notifyDataMove(index, index + 1);
  }
  return notifyCount(first, kind).toString() + '|' + notifyCount(second, kind).toString() + '|' +
    notifyCount(third, kind).toString() + '|' + first.lastIndex.toString() + '|' +
    first.lastFrom.toString() + '|' + first.lastTo.toString();
}
