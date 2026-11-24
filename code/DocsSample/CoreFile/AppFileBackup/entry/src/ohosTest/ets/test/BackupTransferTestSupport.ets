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

import { expect as hypiumExpect } from '@ohos/hypium';
import type { Assert } from '@ohos/hypium';
import type { BackupTransferIo } from '../../../main/ets/backuprestore/BackupFileTransfer';

export interface BackupTransferOutcome {
  threw: boolean;
  error: Error | undefined;
}

export interface BackupCopyRecord {
  source: string | number;
  destination: string | number;
}

/** Logs assertion values before delegating to Hypium. */
export function expect(actual: boolean | number | string | undefined): Assert {
  console.info(`assert actual=${actual}`);
  return hypiumExpect(actual);
}

/** Captures failure independently from the truthiness of its thrown value. */
export function captureTransfer(operation: () => void): BackupTransferOutcome {
  try {
    operation();
    return { threw: false, error: undefined };
  } catch (error) {
    return { threw: true, error: error as Error };
  }
}

export class RecordingBackupIo implements BackupTransferIo {
  events: string[] = [];
  copies: BackupCopyRecord[] = [];
  exists: boolean = false;
  failAt: string = '';
  operationError: Error = new Error('transfer operation failed');
  closeError: Error | undefined = undefined;
  onOperation: ((phase: string) => void) | undefined = undefined;

  accessSync(path: string): boolean {
    this.events.push(`access:${path}`);
    this.onOperation?.('access');
    if (this.failAt === 'access') {
      throw this.operationError;
    }
    return this.exists;
  }

  mkdirSync(path: string): void {
    this.events.push(`mkdir:${path}`);
    this.onOperation?.('mkdir');
    if (this.failAt === 'mkdir') {
      throw this.operationError;
    }
    this.exists = true;
  }

  copyFileSync(source: string | number, destination: string | number): void {
    this.events.push(`copy:${source}->${destination}`);
    this.copies.push({ source: source, destination: destination });
    this.onOperation?.('copy');
    if (this.failAt === 'copy') {
      throw this.operationError;
    }
  }

  closeSync(fd: number): void {
    this.events.push(`close:${fd}`);
    this.onOperation?.('close');
    if (this.closeError !== undefined) {
      throw this.closeError;
    }
  }
}
