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

import { describe, it, expect as hypiumExpect, TestType, Size, Level } from '@ohos/hypium';
import type { Assert } from '@ohos/hypium';
import { storeBackupFile, restoreBackupFile } from '../../../main/ets/backuprestore/BackupFileTransfer';
import type { BackupTransferIo, BackupTransferFile } from '../../../main/ets/backuprestore/BackupFileTransfer';

function expect(actual: boolean | number | string | undefined): Assert {
  console.info(`assert actual=${actual}`);
  return hypiumExpect(actual);
}

class TransferIoProbe implements BackupTransferIo {
  events: string[] = [];
  exists: boolean = false;
  failure: string = '';
  onAccess: (() => void) | undefined = undefined;
  onCopy: (() => void) | undefined = undefined;

  accessSync(path: string): boolean {
    this.events.push(`access:${path}`);
    this.onAccess?.();
    if (this.failure === 'access') {
      throw new Error('access failed');
    }
    return this.exists;
  }

  mkdirSync(path: string): void {
    this.events.push(`mkdir:${path}`);
    if (this.failure === 'mkdir') {
      throw new Error('mkdir failed');
    }
  }

  copyFileSync(source: string | number, destination: string | number): void {
    this.events.push(`copy:${source}->${destination}`);
    this.onCopy?.();
    if (this.failure === 'copy') {
      throw new Error('copy failed');
    }
  }

  closeSync(fd: number): void {
    this.events.push(`close:${fd}`);
  }
}

function transferFile(uri: string = 'manage.json'): BackupTransferFile {
  return { fd: 7, bundleName: 'com.samples.target', uri: uri };
}

function captureError(action: () => void): string {
  let message: string = '';
  try {
    action();
  } catch (error) {
    message = (error as Error).message;
  }
  return message;
}

/** Registers the production transfer scenarios with Hypium. */
export default function backupFileTransferTest(): void {
  describe('BackupFileTransferBusiness', (): void => {
    /**
     * @tc.number SUB_APP_FILE_BACKUP_TRANSFER_0100
     * @tc.name testAppFileBackupTransfer0001
     * @tc.desc Create the bundle directory before copying and close the original descriptor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupTransfer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupTransfer0001';
      console.info(`${TAG} start`);
      try {
        const io: TransferIoProbe = new TransferIoProbe();
        storeBackupFile('/sandbox', transferFile(), io);
        expect(io.events.join(',')).assertEqual(
          'access:/sandbox/com.samples.target,mkdir:/sandbox/com.samples.target,' +
          'copy:7->/sandbox/com.samples.target/manage.json,close:7');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_TRANSFER_0200
     * @tc.name testAppFileBackupTransfer0002
     * @tc.desc Reuse an existing bundle directory without recreating it.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupTransfer0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupTransfer0002';
      console.info(`${TAG} start`);
      try {
        const io: TransferIoProbe = new TransferIoProbe();
        io.exists = true;
        storeBackupFile('/sandbox', transferFile('part.0.tar'), io);
        expect(io.events.join(',')).assertEqual(
          'access:/sandbox/com.samples.target,copy:7->/sandbox/com.samples.target/part.0.tar,close:7');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_TRANSFER_0300
     * @tc.name testAppFileBackupTransfer0003
     * @tc.desc Propagate a store copy failure and still close the original descriptor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupTransfer0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupTransfer0003';
      console.info(`${TAG} start`);
      try {
        const io: TransferIoProbe = new TransferIoProbe();
        io.exists = true;
        io.failure = 'copy';
        const message: string = captureError((): void => {
          storeBackupFile('/sandbox', transferFile(), io);
        });
        expect(message).assertEqual('copy failed');
        expect(io.events.join(',')).assertEqual(
          'access:/sandbox/com.samples.target,copy:7->/sandbox/com.samples.target/manage.json,close:7');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_TRANSFER_0400
     * @tc.name testAppFileBackupTransfer0004
     * @tc.desc Stop copying after directory creation fails and release the original descriptor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupTransfer0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupTransfer0004';
      console.info(`${TAG} start`);
      try {
        const io: TransferIoProbe = new TransferIoProbe();
        io.failure = 'mkdir';
        const message: string = captureError((): void => {
          storeBackupFile('/sandbox', transferFile(), io);
        });
        expect(message).assertEqual('mkdir failed');
        expect(io.events.join(',')).assertEqual(
          'access:/sandbox/com.samples.target,mkdir:/sandbox/com.samples.target,close:7');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_TRANSFER_0500
     * @tc.name testAppFileBackupTransfer0005
     * @tc.desc Restore from the archive path into the descriptor and close it after copying.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupTransfer0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupTransfer0005';
      console.info(`${TAG} start`);
      try {
        const io: TransferIoProbe = new TransferIoProbe();
        restoreBackupFile('/sandbox', transferFile(), io);
        expect(io.events.join(',')).assertEqual('copy:/sandbox/com.samples.target/manage.json->7,close:7');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_TRANSFER_0600
     * @tc.name testAppFileBackupTransfer0006
     * @tc.desc Propagate a restore copy failure and release the original descriptor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupTransfer0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupTransfer0006';
      console.info(`${TAG} start`);
      try {
        const io: TransferIoProbe = new TransferIoProbe();
        io.failure = 'copy';
        const message: string = captureError((): void => {
          restoreBackupFile('/sandbox', transferFile(), io);
        });
        expect(message).assertEqual('copy failed');
        expect(io.events.join(',')).assertEqual('copy:/sandbox/com.samples.target/manage.json->7,close:7');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_TRANSFER_0700
     * @tc.name testAppFileBackupTransfer0007
     * @tc.desc Keep the original store path and descriptor when the access probe mutates the input.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupTransfer0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupTransfer0007';
      console.info(`${TAG} start`);
      try {
        const io: TransferIoProbe = new TransferIoProbe();
        const file: BackupTransferFile = transferFile();
        io.onAccess = (): void => {
          file.fd = 99;
          file.bundleName = 'com.samples.changed';
          file.uri = 'changed.tar';
        };
        storeBackupFile('/sandbox', file, io);
        expect(io.events.join(',')).assertEqual(
          'access:/sandbox/com.samples.target,mkdir:/sandbox/com.samples.target,' +
          'copy:7->/sandbox/com.samples.target/manage.json,close:7');
        expect(file.fd).assertEqual(99);
        expect(file.bundleName).assertEqual('com.samples.changed');
        expect(file.uri).assertEqual('changed.tar');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_TRANSFER_0800
     * @tc.name testAppFileBackupTransfer0008
     * @tc.desc Close the original restore descriptor when the copy probe mutates the input.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupTransfer0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupTransfer0008';
      console.info(`${TAG} start`);
      try {
        const io: TransferIoProbe = new TransferIoProbe();
        const file: BackupTransferFile = transferFile();
        io.onCopy = (): void => {
          file.fd = 99;
          file.uri = 'changed.tar';
        };
        restoreBackupFile('/sandbox', file, io);
        expect(io.events.join(',')).assertEqual('copy:/sandbox/com.samples.target/manage.json->7,close:7');
        expect(file.fd).assertEqual(99);
        expect(file.uri).assertEqual('changed.tar');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_TRANSFER_0900
     * @tc.name testAppFileBackupTransfer0009
     * @tc.desc Close the original store descriptor after a copy failure with a mutated input descriptor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupTransfer0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupTransfer0009';
      console.info(`${TAG} start`);
      try {
        const io: TransferIoProbe = new TransferIoProbe();
        const file: BackupTransferFile = transferFile();
        io.failure = 'copy';
        io.onCopy = (): void => {
          file.fd = 99;
        };
        const message: string = captureError((): void => {
          storeBackupFile('/sandbox', file, io);
        });
        expect(message).assertEqual('copy failed');
        expect(io.events.join(',')).assertEqual(
          'access:/sandbox/com.samples.target,mkdir:/sandbox/com.samples.target,' +
          'copy:7->/sandbox/com.samples.target/manage.json,close:7');
        expect(file.fd).assertEqual(99);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_TRANSFER_1000
     * @tc.name testAppFileBackupTransfer0010
     * @tc.desc Reject a parent traversal URI before filesystem access and still close the descriptor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupTransfer0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupTransfer0010';
      console.info(`${TAG} start`);
      try {
        const io: TransferIoProbe = new TransferIoProbe();
        const message: string = captureError((): void => {
          storeBackupFile('/sandbox', transferFile('../outside'), io);
        });
        expect(message).assertEqual('Invalid backup file URI');
        expect(io.events.join(',')).assertEqual('close:7');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_TRANSFER_1100
     * @tc.name testAppFileBackupTransfer0011
     * @tc.desc Reject absolute URIs and bundle traversal without copying or changing the input.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupTransfer0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupTransfer0011';
      console.info(`${TAG} start`);
      try {
        const first: TransferIoProbe = new TransferIoProbe();
        const second: TransferIoProbe = new TransferIoProbe();
        const firstMessage: string = captureError((): void => {
          storeBackupFile('/sandbox', transferFile('/outside'), first);
        });
        const file: BackupTransferFile = transferFile();
        file.bundleName = '../other';
        const secondMessage: string = captureError((): void => {
          restoreBackupFile('/sandbox', file, second);
        });
        expect(firstMessage).assertEqual('Invalid backup file URI');
        expect(secondMessage).assertEqual('Invalid backup bundle name');
        expect(first.events.join(',')).assertEqual('close:7');
        expect(second.events.join(',')).assertEqual('close:7');
        expect(file.bundleName).assertEqual('../other');
        expect(file.fd).assertEqual(7);
        expect(file.uri).assertEqual('manage.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });
  });
}
