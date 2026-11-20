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

import type { DownloadFileApi } from '../../../main/ets/model/DownloadFiles';

export class DownloadMatrixProbe implements DownloadFileApi {
  downloadPath: string = '/download';
  sandboxPath: string = '/sandbox';
  entries: string[] = [];
  sandboxEntries: string[] = ['preexisting.txt'];
  regularPaths: string[] = [];
  events: string[] = [];
  copied: string[] = [];
  statPaths: string[] = [];
  opened: string[] = [];
  written: string[] = [];
  closed: number[] = [];
  sourceListCalls: number = 0;
  sandboxListCalls: number = 0;
  faultEvent: string = '';
  failure: Error = new Error('injected dependency failure');
  writeFailure: Error | undefined = undefined;
  closeFailure: Error | undefined = undefined;
  mutationEvent: string = '';
  mutationKind: string = '';
  aliasSandboxToSource: boolean = false;
  descriptor: number = 37;
  hook: ((event: string) => void) | undefined = undefined;

  private record(event: string): void {
    this.events.push(event);
    if (event === this.mutationEvent) {
      if (this.mutationKind === 'appendTraversal') {
        this.entries.push('../late');
      } else if (this.mutationKind === 'replaceFirst') {
        this.entries[0] = 'evil\\late';
      } else if (this.mutationKind === 'reverse') {
        this.entries.reverse();
      } else if (this.mutationKind === 'removeLast') {
        this.entries.pop();
      } else if (this.mutationKind === 'clear') {
        this.entries.splice(0, this.entries.length);
      } else if (this.mutationKind === 'duplicateFirst') {
        this.entries.splice(1, 0, this.entries[0]);
      } else {
        throw new Error('Unconfigured mutation kind');
      }
    }
    const callback: ((event: string) => void) | undefined = this.hook;
    if (callback !== undefined) {
      callback(event);
    }
    if (event === this.faultEvent) {
      throw this.failure;
    }
  }

  /** Returns the configured source or destination array without cloning it. */
  list(path: string): string[] {
    if (path === this.downloadPath) {
      this.sourceListCalls++;
      this.record(`list:${path}`);
      return this.entries;
    }
    if (path === this.sandboxPath) {
      this.sandboxListCalls++;
      this.record(`list:${path}`);
      return this.aliasSandboxToSource ? this.entries : this.sandboxEntries;
    }
    throw new Error('Unexpected list path');
  }

  /** Records stat order and supplies the independently configured classification. */
  isFile(path: string): boolean {
    this.statPaths.push(path);
    this.record(`stat:${path}`);
    return this.regularPaths.includes(path);
  }

  /** Commits a destination entry only after its configured dependency callback succeeds. */
  copy(source: string, destination: string): void {
    this.record(`copy:${source}->${destination}`);
    this.copied.push(`${source}->${destination}`);
    this.sandboxEntries.push(destination.substring(this.sandboxPath.length + 1));
  }

  /** Supplies the descriptor only if opening completes successfully. */
  open(path: string): number {
    this.opened.push(path);
    this.record(`open:${path}`);
    return this.descriptor;
  }

  /** Records the attempted payload, including failed writes. */
  write(fd: number, message: string): void {
    this.written.push(`${fd}:${message}`);
    this.record(`write:${fd}:${message}`);
    if (this.writeFailure !== undefined) {
      throw this.writeFailure;
    }
  }

  /** Records every close attempt before optionally reporting a close failure. */
  close(fd: number): void {
    this.closed.push(fd);
    this.record(`close:${fd}`);
    if (this.closeFailure !== undefined) {
      throw this.closeFailure;
    }
  }
}
