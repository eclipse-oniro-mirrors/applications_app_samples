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

import {
  ArchiveDocument, ArchiveFailure, ArchiveStorage, StartupArchiveRepository, decodeArchive, encodeArchive
} from '../../../main/ets/autostart/archive/StartupArchive';
import { QueryOutcome, QueryRecord, RefreshSource } from '../../../main/ets/autostart/AutoStartupTypes';
import { AutoStartupService } from '../../../main/ets/autostart/AutoStartupService';
import { ControlledAutoStartupApi, ManualQueryClock, flushMicrotasks } from './TestSupport';

let archiveMemoryIdentity: number = 0;

/** An I/O fixture only: all validation, mutation and search stay in production. */
export class ArchiveMemoryData {
  public value: ArchiveDocument = new ArchiveDocument();
  public key: string = `archive-memory-${++archiveMemoryIdentity}`;
}

export class ArchiveMemoryStorage implements ArchiveStorage {
  public data: ArchiveMemoryData;
  public reads: number = 0;
  public writes: number = 0;
  public closes: number = 0;
  public closed: boolean = false;
  public failRead: boolean = false;
  public failBefore: boolean = false;
  public failAfter: boolean = false;
  public failConfirmation: boolean = false;
  public holdWrites: boolean = false;
  public attempts: ArchiveDocument[] = [];
  private releases: (() => void)[] = [];
  constructor(data: ArchiveMemoryData = new ArchiveMemoryData()) { this.data = data; }
  identity(): string { return this.data.key; }
  async load(): Promise<ArchiveDocument> {
    this.reads++;
    if (this.closed || this.failRead) { throw new Error('controlled read failure'); }
    return this.data.value.clone();
  }
  async commit(expectedRevision: number, document: ArchiveDocument): Promise<void> {
    this.writes++; this.attempts.push(document.clone());
    if (this.holdWrites) {
      await new Promise<void>((resolve): void => { this.releases.push(resolve); });
    }
    if (this.closed || this.failBefore) { throw new Error('controlled precommit failure'); }
    if (expectedRevision !== this.data.value.revision) { throw new ArchiveFailure('CONFLICT'); }
    this.data.value = decodeArchive(encodeArchive(document));
    if (this.failAfter) {
      if (this.failConfirmation) { this.failRead = true; }
      throw new Error('controlled ambiguous commit response');
    }
  }
  async close(): Promise<void> {
    if (!this.closed) { this.closes++; this.closed = true; }
  }
  release(): void {
    this.holdWrites = false;
    const releases = this.releases.slice(); this.releases = [];
    releases.forEach((release: () => void): void => { release(); });
  }
}

export function archiveSample(id: number, timestamp: number,
  outcome: QueryOutcome = QueryOutcome.SUCCESS, result: string = '已开启',
  source: RefreshSource = RefreshSource.MANUAL): QueryRecord {
  const record = new QueryRecord(); record.id = id; record.timestamp = timestamp;
  record.outcome = outcome; record.result = result; record.source = source;
  record.supportResult = 'true'; record.statusResult = 'true'; record.durationMillis = 3;
  return record;
}

export class StartupArchiveFixture {
  public clock: ManualQueryClock = new ManualQueryClock();
  public api: ControlledAutoStartupApi = new ControlledAutoStartupApi();
  public store: ArchiveMemoryStorage;
  public repository: StartupArchiveRepository;
  public service: AutoStartupService;
  constructor(store: ArchiveMemoryStorage = new ArchiveMemoryStorage()) {
    this.store = store;
    this.repository = new StartupArchiveRepository((): number => this.clock.now());
    this.service = new AutoStartupService(this.api, this.clock);
  }
  async open(): Promise<void> {
    const opened = await this.repository.attach(this.store);
    if (!opened) { throw new Error('Fixture archive could not open'); }
  }
  async sample(value: boolean, source: RefreshSource = RefreshSource.MANUAL): Promise<void> {
    this.service.refresh(source); this.clock.advance(7); this.api.resolveNext(value);
    await flushMicrotasks(); await this.repository.whenIdle();
  }
  async dispose(): Promise<void> {
    this.store.release(); this.service.dispose(); this.api.finishPending(); this.clock.clearAll();
    await flushMicrotasks(); await this.repository.whenIdle(); await this.repository.close();
  }
}

export function archiveFailureCode(action: () => void): string {
  try {
    action(); return 'NO_ERROR';
  } catch (error) {
    return error instanceof ArchiveFailure ? error.code : 'OTHER_ERROR';
  }
}
