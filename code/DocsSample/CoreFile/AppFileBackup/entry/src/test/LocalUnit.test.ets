/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect as hypiumExpect, TestType, Size, Level } from '@ohos/hypium';
import type { Assert } from '@ohos/hypium';
import { storeBackupFile, restoreBackupFile } from '../main/ets/backuprestore/BackupFileTransfer';
import type { BackupTransferFile, BackupTransferIo } from '../main/ets/backuprestore/BackupFileTransfer';

function expect(actual: boolean | number | string | undefined): Assert {
  console.info(`assert actual=${actual}`);
  return hypiumExpect(actual);
}

class LocalTransferIoProbe implements BackupTransferIo {
  events: string[] = [];

  accessSync(path: string): boolean {
    this.events.push(`access:${path}`);
    return false;
  }

  mkdirSync(path: string): void {
    this.events.push(`mkdir:${path}`);
  }

  copyFileSync(source: string | number, destination: string | number): void {
    this.events.push(`copy:${source}->${destination}`);
  }

  closeSync(fd: number): void {
    this.events.push(`close:${fd}`);
  }
}

/** Registers a local production transfer ownership check. */
export default function localUnitTest(): void {
  describe('localUnitTest', (): void => {
    /**
     * @tc.number SUB_APP_FILE_BACKUP_LOCAL_0100
     * @tc.name testAppFileBackupLocal0001
     * @tc.desc Verify production store and restore directions, descriptor closure, and unchanged inputs.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupLocal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupLocal0001';
      console.info(`${TAG} start`);
      try {
        const io: LocalTransferIoProbe = new LocalTransferIoProbe();
        const source: BackupTransferFile = {
          fd: 7,
          bundleName: 'com.samples.target',
          uri: 'manage.json'
        };
        const destination: BackupTransferFile = {
          fd: 8,
          bundleName: 'com.samples.target',
          uri: 'manage.json'
        };
        storeBackupFile('/sandbox', source, io);
        restoreBackupFile('/sandbox', destination, io);
        expect(io.events.join(',')).assertEqual(
          'access:/sandbox/com.samples.target,mkdir:/sandbox/com.samples.target,' +
          'copy:7->/sandbox/com.samples.target/manage.json,close:7,' +
          'copy:/sandbox/com.samples.target/manage.json->8,close:8');
        expect(source.fd).assertEqual(7);
        expect(source.bundleName).assertEqual('com.samples.target');
        expect(source.uri).assertEqual('manage.json');
        expect(destination.fd).assertEqual(8);
        expect(destination.bundleName).assertEqual('com.samples.target');
        expect(destination.uri).assertEqual('manage.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });
  });
}
