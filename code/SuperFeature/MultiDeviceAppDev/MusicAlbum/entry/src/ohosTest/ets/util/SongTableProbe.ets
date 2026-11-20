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
 * Frozen baseline probes for the data tables in
 * entry/src/main/ets/model/SongList.ets.
 *
 * songList holds 24 rows (ids 1..21, 23..25 - id 22 is absent on purpose),
 * optionList holds 4 rows. Resource objects are resolved back to their media
 * or string name by comparing resource ids with the same $r() literals, which
 * is the only stable way to assert a Resource value.
 */
import { songList, optionList, OptionItem } from '../../../main/ets/model/SongList';
import { SongItem } from '../../../main/ets/model/SongModule';

export const SONG_COUNT: number = 24;
export const OPTION_COUNT: number = 4;

function songAt(index: number): SongItem | undefined {
  const raw: Object | undefined = songList[index] as Object | undefined;
  if (raw === undefined || raw === null) {
    return undefined;
  }
  return raw as SongItem;
}

function optionAt(index: number): OptionItem | undefined {
  const raw: Object | undefined = optionList[index] as Object | undefined;
  if (raw === undefined || raw === null) {
    return undefined;
  }
  return raw as OptionItem;
}

export function labelName(label: Resource): string {
  if (label.id === $r('app.media.ic_vip').id) {
    return 'ic_vip';
  }
  if (label.id === $r('app.media.ic_SQ').id) {
    return 'ic_SQ';
  }
  return 'other';
}

function optionImageName(image: Resource): string {
  if (image.id === $r('app.media.ic_collect').id) {
    return 'ic_collect';
  }
  if (image.id === $r('app.media.ic_download').id) {
    return 'ic_download';
  }
  if (image.id === $r('app.media.icon_comments').id) {
    return 'icon_comments';
  }
  if (image.id === $r('app.media.icon_share').id) {
    return 'icon_share';
  }
  return 'other';
}

function optionTextName(text: ResourceStr): string {
  if (typeof text === 'string') {
    return 'literal:' + text;
  }
  const res: Resource = text as Resource;
  if (res.id === $r('app.string.download').id) {
    return 'string:download';
  }
  if (res.id === $r('app.string.comment').id) {
    return 'string:comment';
  }
  if (res.id === $r('app.string.share').id) {
    return 'string:share';
  }
  return 'string:other';
}

function songTextValue(text: ResourceStr): string {
  if (typeof text === 'string') {
    return text;
  }
  const res: Resource = text as Resource;
  if (res.id === $r('app.string.song_title_01').id) {
    return '不知道';
  }
  if (res.id === $r('app.string.song_title_02').id) {
    return '歌名你好';
  }
  if (res.id === $r('app.string.song_title_03').id) {
    return '还是歌名';
  }
  if (res.id === $r('app.string.song_title_04').id) {
    return 'AIUHGVNHK';
  }
  if (res.id === $r('app.string.song_title_05').id) {
    return '可可不喜欢';
  }
  if (res.id === $r('app.string.song_title_06').id) {
    return '我是UOUYGBJ';
  }
  if (res.id === $r('app.string.song_title_07').id) {
    return '好好学习';
  }
  if (res.id === $r('app.string.song_title_08').id) {
    return '安心安心';
  }
  if (res.id === $r('app.string.song_title_09').id) {
    return 'HBNJGHJHB';
  }
  if (res.id === $r('app.string.song_title_10').id) {
    return 'Notebook';
  }
  if (res.id === $r('app.string.song_singer_01').id) {
    return '小碗你好';
  }
  if (res.id === $r('app.string.song_singer_02').id) {
    return '张三-你好我好都好';
  }
  if (res.id === $r('app.string.song_singer_03').id) {
    return '不知道你是谁';
  }
  if (res.id === $r('app.string.song_singer_04').id) {
    return 'Gwyu-Hjjiyabn';
  }
  if (res.id === $r('app.string.song_singer_05').id) {
    return '名佚';
  }
  if (res.id === $r('app.string.song_singer_06').id) {
    return '我是小树';
  }
  if (res.id === $r('app.string.song_singer_07').id) {
    return '全村最帅';
  }
  if (res.id === $r('app.string.song_singer_08').id) {
    return '小安安';
  }
  return 'unknown';
}

/** '<id>|<title>|<singer>|<labelName>' or 'undefined' */
export function runSongRow(index: number): string {
  const item: SongItem | undefined = songAt(index);
  if (item === undefined) {
    return 'undefined';
  }
  return item.id.toString() + '|' + songTextValue(item.title) + '|' +
    songTextValue(item.singer) + '|' + labelName(item.label);
}

/** single field of a row: id | title | singer | label */
export function runSongField(index: number, field: string): string {
  const item: SongItem | undefined = songAt(index);
  if (item === undefined) {
    return 'undefined';
  }
  if (field === 'id') {
    return item.id.toString();
  }
  if (field === 'title') {
    return songTextValue(item.title);
  }
  if (field === 'singer') {
    return songTextValue(item.singer);
  }
  if (field === 'label') {
    return labelName(item.label);
  }
  return 'unknown';
}

function distinctCount(values: string[]): number {
  const seen: string[] = [];
  for (let i = 0; i < values.length; i++) {
    if (seen.indexOf(values[i]) < 0) {
      seen.push(values[i]);
    }
  }
  return seen.length;
}

function countValue(values: string[], target: string): number {
  let count: number = 0;
  for (let i = 0; i < values.length; i++) {
    if (values[i] === target) {
      count++;
    }
  }
  return count;
}

function titles(): string[] {
  const out: string[] = [];
  for (let i = 0; i < SONG_COUNT; i++) {
    const item: SongItem | undefined = songAt(i);
    if (item !== undefined) {
      out.push(songTextValue(item.title));
    }
  }
  return out;
}

function singers(): string[] {
  const out: string[] = [];
  for (let i = 0; i < SONG_COUNT; i++) {
    const item: SongItem | undefined = songAt(i);
    if (item !== undefined) {
      out.push(songTextValue(item.singer));
    }
  }
  return out;
}

function idValues(): number[] {
  const out: number[] = [];
  for (let i = 0; i < SONG_COUNT; i++) {
    const item: SongItem | undefined = songAt(i);
    if (item !== undefined) {
      out.push(item.id);
    }
  }
  return out;
}

function missingIds(): string {
  const ids: number[] = idValues();
  const max: number = Math.max(...ids);
  const missing: string[] = [];
  for (let i = 1; i <= max; i++) {
    if (ids.indexOf(i) < 0) {
      missing.push(i.toString());
    }
  }
  return missing.length === 0 ? 'none' : missing.join(',');
}

function topEntry(values: string[]): string {
  let best: string = '';
  let bestCount: number = -1;
  for (let i = 0; i < values.length; i++) {
    const current: number = countValue(values, values[i]);
    if (current > bestCount) {
      best = values[i];
      bestCount = current;
    }
  }
  return best + '|' + bestCount.toString();
}

/** Table level statistics derived from the frozen rows. */
export function runSongStats(kind: string): string {
  const ids: number[] = idValues();
  if (kind === 'count') {
    return songList.length.toString();
  }
  if (kind === 'min-id') {
    return Math.min(...ids).toString();
  }
  if (kind === 'max-id') {
    return Math.max(...ids).toString();
  }
  if (kind === 'id-sum') {
    let sum: number = 0;
    for (let i = 0; i < ids.length; i++) {
      sum += ids[i];
    }
    return sum.toString();
  }
  if (kind === 'missing-ids') {
    return missingIds();
  }
  if (kind === 'distinct-title') {
    return distinctCount(titles()).toString();
  }
  if (kind === 'distinct-singer') {
    return distinctCount(singers()).toString();
  }
  if (kind === 'top-title') {
    return topEntry(titles());
  }
  if (kind === 'top-singer') {
    return topEntry(singers());
  }
  if (kind === 'vip-count') {
    let count: number = 0;
    for (let i = 0; i < SONG_COUNT; i++) {
      const item: SongItem | undefined = songAt(i);
      if (item !== undefined && labelName(item.label) === 'ic_vip') {
        count++;
      }
    }
    return count.toString();
  }
  if (kind === 'sq-count') {
    let count: number = 0;
    for (let i = 0; i < SONG_COUNT; i++) {
      const item: SongItem | undefined = songAt(i);
      if (item !== undefined && labelName(item.label) === 'ic_SQ') {
        count++;
      }
    }
    return count.toString();
  }
  if (kind === 'duplicate-title-count') {
    return (SONG_COUNT - distinctCount(titles())).toString();
  }
  if (kind === 'first-title') {
    const item: SongItem | undefined = songAt(0);
    return item === undefined ? 'undefined' : songTextValue(item.title);
  }
  if (kind === 'last-title') {
    const item: SongItem | undefined = songAt(SONG_COUNT - 1);
    return item === undefined ? 'undefined' : songTextValue(item.title);
  }
  return 'unknown';
}

/** Occurrences of one title / singer inside the frozen table. */
export function runSongCount(value: string, field: string): string {
  const values: string[] = field === 'singer' ? singers() : titles();
  return countValue(values, value).toString();
}

/** '<image>|<text>' or 'undefined' */
export function runOptionRow(index: number): string {
  const item: OptionItem | undefined = optionAt(index);
  if (item === undefined) {
    return 'undefined';
  }
  return optionImageName(item.image) + '|' + optionTextName(item.text);
}

export function runOptionField(index: number, field: string): string {
  const item: OptionItem | undefined = optionAt(index);
  if (item === undefined) {
    return 'undefined';
  }
  if (field === 'image') {
    return optionImageName(item.image);
  }
  if (field === 'text') {
    return optionTextName(item.text);
  }
  return 'unknown';
}

export function runOptionStats(kind: string): string {
  if (kind === 'count') {
    return optionList.length.toString();
  }
  if (kind === 'first-image') {
    const item: OptionItem | undefined = optionAt(0);
    return item === undefined ? 'undefined' : optionImageName(item.image);
  }
  if (kind === 'last-image') {
    const item: OptionItem | undefined = optionAt(OPTION_COUNT - 1);
    return item === undefined ? 'undefined' : optionImageName(item.image);
  }
  if (kind === 'distinct-image') {
    const values: string[] = [];
    for (let i = 0; i < OPTION_COUNT; i++) {
      const item: OptionItem | undefined = optionAt(i);
      if (item !== undefined) {
        values.push(optionImageName(item.image));
      }
    }
    return distinctCount(values).toString();
  }
  return 'unknown';
}
