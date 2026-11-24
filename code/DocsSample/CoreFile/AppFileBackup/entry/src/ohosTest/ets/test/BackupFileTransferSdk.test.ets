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
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { describe, it, beforeAll, afterAll, expect as hypiumExpect, TestType, Size, Level } from '@ohos/hypium';
import type { Assert } from '@ohos/hypium';
import type { BusinessError } from '@kit.BasicServicesKit';
import { storeBackupFile, restoreBackupFile } from '../../../main/ets/backuprestore/BackupFileTransfer';
import type { BackupTransferFile } from '../../../main/ets/backuprestore/BackupFileTransfer';

function expect(actual: boolean | number | string | undefined): Assert {
  console.info(`assert actual=${actual}`);
  return hypiumExpect(actual);
}

function payloadBuffer(payload: string): ArrayBuffer {
  const buffer: ArrayBuffer = new ArrayBuffer(payload.length);
  const bytes: Uint8Array = new Uint8Array(buffer);
  for (let index: number = 0; index < payload.length; index++) {
    bytes[index] = payload.charCodeAt(index);
  }
  return buffer;
}

function readBytes(path: string): string {
  const opened: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
  try {
    const size: number = fileIo.statSync(path).size;
    const buffer: ArrayBuffer = new ArrayBuffer(size);
    const read: number = fileIo.readSync(opened.fd, buffer);
    expect(read).assertEqual(size);
    const bytes: Uint8Array = new Uint8Array(buffer);
    return bytes.join(',');
  } finally {
    fileIo.closeSync(opened.fd);
  }
}

function writePayload(path: string, payload: string): void {
  const opened: fileIo.File = fileIo.openSync(path,
    fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
  try {
    const buffer: ArrayBuffer = payloadBuffer(payload);
    const written: number = fileIo.writeSync(opened.fd, buffer);
    expect(written).assertEqual(buffer.byteLength);
  } finally {
    fileIo.closeSync(opened.fd);
  }
}

/** Must run before another open can reuse the descriptor number. */
function isDescriptorClosed(fd: number): boolean {
  try {
    fileIo.statSync(fd);
    return false;
  } catch (error) {
    const failure: BusinessError = error as BusinessError;
    if (failure.code === 13900008) {
      return true;
    }
    throw error as Error;
  }
}

function releaseOwnedDescriptor(fd: number): void {
  if (!isDescriptorClosed(fd)) {
    fileIo.closeSync(fd);
  }
}

/** Registers descriptor transfer tests requiring the real FileIo SDK. */
export default function backupFileTransferSdkTest(): void {
  describe('BackupFileTransferRealFileIo', (): void => {
    let root: string = '';
    let ownsRoot: boolean = false;

    beforeAll((): void => {
      const filesDir: string = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir;
      const suffix: string = `${Date.now()}-${Math.floor(Math.random() * 1000000)}`;
      const candidate: string = `${filesDir}/app-file-backup-transfer-sdk-${suffix}`;
      if (fileIo.accessSync(candidate)) {
        throw new Error('SDK test directory already exists');
      }
      fileIo.mkdirSync(candidate);
      root = candidate;
      ownsRoot = true;
    });

    afterAll((): void => {
      if (ownsRoot && root !== '' && fileIo.accessSync(root)) {
        fileIo.rmdirSync(root);
        ownsRoot = false;
        root = '';
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_TRANSFER_SDK_0100
     * @tc.name testAppFileBackupTransferSdk0001
     * @tc.desc Copy real descriptor bytes into the backup archive without damaging the source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupTransferSdk0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupTransferSdk0001';
      console.info(`${TAG} start`);
      let opened: fileIo.File | undefined = undefined;
      let released: boolean = false;
      try {
        expect(ownsRoot).assertEqual(true);
        const source: string = `${root}/source.txt`;
        const payload: string = 'backup payload';
        opened = fileIo.openSync(source,
          fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = payloadBuffer(payload);
        const written: number = fileIo.writeSync(opened.fd, buffer);
        expect(written).assertEqual(buffer.byteLength);
        const originalBytes: string = readBytes(source);
        expect(originalBytes).assertEqual(new Uint8Array(buffer).join(','));
        const file: BackupTransferFile = { fd: opened.fd, bundleName: 'com.samples.target', uri: 'manage.json' };
        storeBackupFile(root, file);
        const descriptorClosed: boolean = isDescriptorClosed(opened.fd);
        expect(descriptorClosed).assertEqual(true);
        released = true;
        const archive: string = `${root}/com.samples.target/manage.json`;
        expect(readBytes(archive)).assertEqual(originalBytes);
        expect(readBytes(source)).assertEqual(originalBytes);
        expect(fileIo.readTextSync(archive)).assertEqual(payload);
        expect(fileIo.readTextSync(source)).assertEqual(payload);
      } finally {
        try {
          if (opened !== undefined && !released) {
            releaseOwnedDescriptor(opened.fd);
          }
        } finally {
          console.info(`${TAG} end`);
        }
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_TRANSFER_SDK_0200
     * @tc.name testAppFileBackupTransferSdk0002
     * @tc.desc Restore real archive bytes into the destination descriptor without damaging the archive.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupTransferSdk0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupTransferSdk0002';
      console.info(`${TAG} start`);
      let target: fileIo.File | undefined = undefined;
      let released: boolean = false;
      try {
        expect(ownsRoot).assertEqual(true);
        const bundlePath: string = `${root}/com.samples.restore`;
        fileIo.mkdirSync(bundlePath);
        const archive: string = `${bundlePath}/part.0.tar`;
        const payload: string = 'restored payload';
        writePayload(archive, payload);
        const originalBytes: string = readBytes(archive);
        expect(originalBytes).assertEqual(new Uint8Array(payloadBuffer(payload)).join(','));
        const destination: string = `${root}/restored.txt`;
        target = fileIo.openSync(destination,
          fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const file: BackupTransferFile = { fd: target.fd, bundleName: 'com.samples.restore', uri: 'part.0.tar' };
        restoreBackupFile(root, file);
        const descriptorClosed: boolean = isDescriptorClosed(target.fd);
        expect(descriptorClosed).assertEqual(true);
        released = true;
        expect(readBytes(destination)).assertEqual(originalBytes);
        expect(readBytes(archive)).assertEqual(originalBytes);
        expect(fileIo.readTextSync(destination)).assertEqual(payload);
        expect(fileIo.readTextSync(archive)).assertEqual(payload);
      } finally {
        try {
          if (target !== undefined && !released) {
            releaseOwnedDescriptor(target.fd);
          }
        } finally {
          console.info(`${TAG} end`);
        }
      }
    });
  });
}
