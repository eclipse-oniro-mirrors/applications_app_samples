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

import { TranscodeFilesModel, TranscodeHistoryEntry } from '../model/TranscodeFilesModel';

@Observed
export class TranscodeHistoryController {
  public entries: TranscodeHistoryEntry[] = [];
  public hasMore: boolean = false;
  public loading: boolean = false;
  public storageBytes: number = 0;
  public orphanCount: number = 0;
  private offset: number = 0;
  private revision: number = 0;
  private disposed: boolean = false;

  activate(): void { this.disposed = false; }
  invalidate(): void { ++this.revision; this.loading = false; }
  dispose(): void { this.disposed = true; this.invalidate(); }

  async load(directory: string, more: boolean = false): Promise<void> {
    if (this.disposed || this.loading || (more && !this.hasMore)) { return; }
    const request: number = ++this.revision;
    this.loading = true;
    try {
      const page = await TranscodeFilesModel.listPage(directory, more ? this.offset : 0,
        TranscodeFilesModel.HISTORY_PAGE_SIZE);
      const usage = more ? undefined : await TranscodeFilesModel.storageUsage(directory);
      if (request !== this.revision || this.disposed) { return; }
      this.entries = more ? this.entries.concat(page.entries) : page.entries;
      this.offset = page.nextOffset;
      this.hasMore = page.hasMore;
      if (usage !== undefined) { this.storageBytes = usage.bytes; this.orphanCount = usage.orphanCount; }
    } finally {
      if (request === this.revision) { this.loading = false; }
    }
  }

  async refresh(directory: string): Promise<void> {
    this.invalidate();
    await this.load(directory);
  }
}
