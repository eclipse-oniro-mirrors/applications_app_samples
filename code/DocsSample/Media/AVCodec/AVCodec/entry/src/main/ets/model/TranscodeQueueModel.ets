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

export interface TranscodeQueueItem {
  id: string; uri: string; title: string; options: number[]; grayscale: boolean;
  state: string; progress: number; resultPath: string;
  startTimeMs?: number; endTimeMs?: number;
}

@Observed
export class TranscodeQueueModel {
  public items: TranscodeQueueItem[] = [];
  public paused: boolean = true;
  public activeId: string = '';
  private sequence: number = 0;

  static validated(entries: TranscodeQueueItem[]): TranscodeQueueItem[] {
    if (!Array.isArray(entries)) { throw new Error('Invalid transcode queue'); }
    const seen: Set<string> = new Set<string>();
    return entries.filter((item: TranscodeQueueItem): boolean => {
      if (item === null || typeof item !== 'object' || typeof item.id !== 'string' ||
        !/^queue_[0-9]+_[0-9]+$/.test(item.id) || seen.has(item.id) ||
        typeof item.uri !== 'string' || item.uri.length === 0 || item.uri.length > 8192 ||
        typeof item.title !== 'string' || item.title.length > 1024 || typeof item.grayscale !== 'boolean' ||
        typeof item.resultPath !== 'string' || item.resultPath.length > 8192 ||
        !Array.isArray(item.options) || (item.options.length !== 7 && item.options.length !== 8) ||
        !item.options.every((option: number): boolean => Number.isInteger(option) && option >= 0) ||
        item.options[0] > 1 || item.options[1] > 1 || item.options[2] > 3 || item.options[3] > 3 ||
        item.options[4] > 2 || item.options[5] > 2 || item.options[6] > 2147483647 ||
        (item.options.length === 8 && item.options[7] > 2) ||
        (item.options[1] === 1 && (item.options[2] !== 0 || item.grayscale || (item.options[7] ?? 0) !== 0)) ||
        !['waiting', 'running', 'completed', 'failed', 'cancelled', 'interrupted'].includes(item.state) ||
        !Number.isFinite(item.progress) || item.progress < 0 || item.progress > 100 ||
        !TranscodeQueueModel.validRange(item)) { return false; }
      seen.add(item.id);
      return true;
    }).slice(0, 30);
  }

  private static validRange(item: TranscodeQueueItem): boolean {
    const start: number = item.startTimeMs ?? 0;
    const end: number = item.endTimeMs ?? 0;
    return Number.isInteger(start) && Number.isInteger(end) && start >= 0 && end >= 0 &&
      start <= 2147483647 && end <= 2147483647 && (end === 0 || end > start) &&
      (item.options[1] === 0 || (start === 0 && end === 0));
  }

  add(uri: string, title: string, options: number[], grayscale: boolean, startTimeMs: number = 0,
    endTimeMs: number = 0): void {
    if (this.items.length >= 30) { return; }
    this.items = this.items.concat([{
      id: 'queue_' + Date.now() + '_' + (++this.sequence),
      uri: uri,
      title: title,
      options: options.slice(),
      grayscale: grayscale,
      state: 'waiting',
      progress: 0,
      resultPath: '',
      startTimeMs: startTimeMs,
      endTimeMs: endTimeMs
    }]);
  }
  update(id: string, state: string, progress: number, resultPath: string = ''): void {
    this.items = this.items.map((item: TranscodeQueueItem): TranscodeQueueItem => item.id !== id ? item :
      ({
        id: item.id,
        uri: item.uri,
        title: item.title,
        options: item.options,
        grayscale: item.grayscale,
        state: state,
        progress: progress,
        resultPath: resultPath,
        startTimeMs: item.startTimeMs,
        endTimeMs: item.endTimeMs
      }));
  }
  reassociate(id: string, uri: string, title: string): void {
    if (this.activeId.length > 0 || uri.length === 0) { return; }
    this.items = this.items.map((item: TranscodeQueueItem): TranscodeQueueItem => item.id !== id ? item : ({
      id: item.id, uri: uri, title: title, options: item.options, grayscale: item.grayscale,
      state: 'waiting', progress: 0, resultPath: '', startTimeMs: item.startTimeMs, endTimeMs: item.endTimeMs
    }));
  }
  next(): TranscodeQueueItem | undefined {
    return this.paused ? undefined : this.items.find((item: TranscodeQueueItem): boolean => item.state === 'waiting');
  }
  retry(id: string): void {
    const item: TranscodeQueueItem | undefined = this.items.find((entry: TranscodeQueueItem): boolean =>
      entry.id === id);
    if (item?.state === 'failed' || item?.state === 'cancelled' || item?.state === 'interrupted') {
      this.update(id, 'waiting', 0);
    }
  }
  remove(id: string): void {
    if (id !== this.activeId) { this.items = this.items.filter((item: TranscodeQueueItem): boolean => item.id !== id); }
  }
  totalProgress(): number {
    return this.items.length === 0 ? 0 : this.items.reduce((sum: number, item: TranscodeQueueItem): number =>
      sum + (item.state === 'completed' ? 100 : item.progress), 0) / this.items.length;
  }
}
