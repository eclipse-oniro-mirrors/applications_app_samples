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

import { fileIo } from '@kit.CoreFileKit';
import { TranscodeStatus } from 'libtranscoder.so';
import { MediaTaskLease } from '../model/MediaTaskCoordinator';
import { MediaInputIdentity } from '../model/MediaSessionReport';
import { TranscodeHistoryEntry } from '../model/TranscodeFilesModel';
import { TranscodeTaskSnapshot } from '../model/TranscodeTaskSnapshot';
import { idleTranscodeStatus } from '../model/TranscodeStatusModel';

// 本次执行持有文件和配置，直到异步收尾结束；界面草稿不参与后续提交。
export interface TranscodeExecutionResult {
  status: TranscodeStatus;
  path: string;
  sourceUri: string;
  directory: string;
  entry?: TranscodeHistoryEntry;
  notice: string;
  closePending: boolean;
}

export class TranscodeExecution {
  public readonly directory: string;
  public readonly sessionId: string;
  public readonly sourceUri: string;
  public readonly title: string;
  public readonly snapshot: TranscodeTaskSnapshot;
  public readonly lease: MediaTaskLease | undefined;
  public input: fileIo.File | undefined = undefined;
  public output: fileIo.File | undefined = undefined;
  public status: TranscodeStatus = idleTranscodeStatus();
  public resultPath: string = '';
  public notice: string = '';
  public entry: TranscodeHistoryEntry | undefined = undefined;
  public closePending: boolean = false;
  public sourceIdentity: MediaInputIdentity | undefined = undefined;
  private artifactId: string = '';

  constructor(filesDir: string, sourceUri: string, title: string, snapshot: TranscodeTaskSnapshot,
    lease: MediaTaskLease | undefined) {
    this.directory = `${filesDir}/transcodes`;
    this.lease = lease;
    this.sessionId = this.lease?.id ?? `transcoded_${Date.now()}`;
    this.sourceUri = sourceUri;
    this.title = title;
    this.snapshot = snapshot;
  }

  get id(): string { return this.artifactId; }
  get outputPath(): string { return `${this.directory}/${this.artifactId}.mp4`; }
  get partialPath(): string { return `${this.outputPath}.part`; }

  // 在持有转码任务租约时分配文件名。已存在的成品、历史和临时文件都占用编号。
  allocateArtifactId(existingNames: string[]): void {
    const names: Set<string> = new Set<string>(existingNames);
    let timestamp: number = Date.now();
    let candidate: string = `transcoded_${timestamp}`;
    while (names.has(`${candidate}.mp4`) || names.has(`${candidate}.mp4.part`) ||
      names.has(`${candidate}.json`) || names.has(`${candidate}.json.pending`)) {
      timestamp++;
      candidate = `transcoded_${timestamp}`;
    }
    this.artifactId = candidate;
  }

  result(): TranscodeExecutionResult {
    return {
      status: this.status,
      path: this.resultPath,
      sourceUri: this.sourceUri,
      directory: this.directory,
      entry: this.entry,
      notice: this.notice,
      closePending: this.closePending
    };
  }
}
