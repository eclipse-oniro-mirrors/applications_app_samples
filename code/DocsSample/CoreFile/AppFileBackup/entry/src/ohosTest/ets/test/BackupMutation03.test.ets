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

import { describe, it, TestType, Size, Level } from '@ohos/hypium';
import { storeBackupFile, restoreBackupFile } from '../../../main/ets/backuprestore/BackupFileTransfer';
import type { BackupTransferFile } from '../../../main/ets/backuprestore/BackupFileTransfer';
import { expect, captureTransfer, RecordingBackupIo } from './BackupTransferTestSupport';
import type { BackupTransferOutcome } from './BackupTransferTestSupport';

/** Registers the production transfer scenarios with Hypium. */
export default function backupMutation03Test(): void {
  describe('AppFileBackupMutation03', (): void => {
    /**
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION03_0100
     * @tc.name testAppFileBackupMutation030001
     * @tc.desc Keep original transfer ownership during restore copy mutation of descriptor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation030001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation030001';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 31, bundleName: 'com.samples.target', uri: 'manage.json' };
        let mutationCalls: number = 0;
        io.onOperation = (phase: string): void => {
          if (phase === 'copy') {
            mutationCalls++;
            file.fd = 999;
          }
        };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual('copy:/sandbox/com.samples.target/manage.json->31|close:31');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual('/sandbox/com.samples.target/manage.json');
        expect(io.copies[0].destination).assertEqual(31);
        expect(mutationCalls).assertEqual(1);
        expect(file.fd).assertEqual(999);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('manage.json');
        expect(io.events.filter((event: string): boolean => event === 'close:31').length).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:999').length).assertEqual(0);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION03_0200
     * @tc.name testAppFileBackupMutation030002
     * @tc.desc Keep original transfer ownership during restore copy mutation of bundle.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation030002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation030002';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 31, bundleName: 'com.samples.target', uri: 'manage.json' };
        let mutationCalls: number = 0;
        io.onOperation = (phase: string): void => {
          if (phase === 'copy') {
            mutationCalls++;
            file.bundleName = 'com.samples.changed';
          }
        };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual('copy:/sandbox/com.samples.target/manage.json->31|close:31');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual('/sandbox/com.samples.target/manage.json');
        expect(io.copies[0].destination).assertEqual(31);
        expect(mutationCalls).assertEqual(1);
        expect(file.fd).assertEqual(31);
        expect(file.bundleName).assertEqual('com.samples.changed');
        expect(file.uri).assertEqual('manage.json');
        expect(io.events.filter((event: string): boolean => event === 'close:31').length).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:999').length).assertEqual(0);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION03_0300
     * @tc.name testAppFileBackupMutation030003
     * @tc.desc Keep original transfer ownership during restore copy mutation of uri.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation030003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation030003';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 31, bundleName: 'com.samples.target', uri: 'manage.json' };
        let mutationCalls: number = 0;
        io.onOperation = (phase: string): void => {
          if (phase === 'copy') {
            mutationCalls++;
            file.uri = 'changed.tar';
          }
        };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual('copy:/sandbox/com.samples.target/manage.json->31|close:31');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual('/sandbox/com.samples.target/manage.json');
        expect(io.copies[0].destination).assertEqual(31);
        expect(mutationCalls).assertEqual(1);
        expect(file.fd).assertEqual(31);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('changed.tar');
        expect(io.events.filter((event: string): boolean => event === 'close:31').length).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:999').length).assertEqual(0);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION03_0400
     * @tc.name testAppFileBackupMutation030004
     * @tc.desc Keep original transfer ownership during restore copy mutation of allFields.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation030004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation030004';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 31, bundleName: 'com.samples.target', uri: 'manage.json' };
        let mutationCalls: number = 0;
        io.onOperation = (phase: string): void => {
          if (phase === 'copy') {
            mutationCalls++;
            file.fd = 999;
            file.bundleName = 'com.samples.changed';
            file.uri = 'changed.tar';
          }
        };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual('copy:/sandbox/com.samples.target/manage.json->31|close:31');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual('/sandbox/com.samples.target/manage.json');
        expect(io.copies[0].destination).assertEqual(31);
        expect(mutationCalls).assertEqual(1);
        expect(file.fd).assertEqual(999);
        expect(file.bundleName).assertEqual('com.samples.changed');
        expect(file.uri).assertEqual('changed.tar');
        expect(io.events.filter((event: string): boolean => event === 'close:31').length).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:999').length).assertEqual(0);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION03_0500
     * @tc.name testAppFileBackupMutation030005
     * @tc.desc Keep original transfer ownership during restore copy mutation of traversalBundle.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation030005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation030005';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 31, bundleName: 'com.samples.target', uri: 'manage.json' };
        let mutationCalls: number = 0;
        io.onOperation = (phase: string): void => {
          if (phase === 'copy') {
            mutationCalls++;
            file.bundleName = '../changed';
          }
        };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual('copy:/sandbox/com.samples.target/manage.json->31|close:31');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual('/sandbox/com.samples.target/manage.json');
        expect(io.copies[0].destination).assertEqual(31);
        expect(mutationCalls).assertEqual(1);
        expect(file.fd).assertEqual(31);
        expect(file.bundleName).assertEqual('../changed');
        expect(file.uri).assertEqual('manage.json');
        expect(io.events.filter((event: string): boolean => event === 'close:31').length).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:999').length).assertEqual(0);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION03_0600
     * @tc.name testAppFileBackupMutation030006
     * @tc.desc Keep original transfer ownership during restore copy mutation of traversalUri.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation030006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation030006';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 31, bundleName: 'com.samples.target', uri: 'manage.json' };
        let mutationCalls: number = 0;
        io.onOperation = (phase: string): void => {
          if (phase === 'copy') {
            mutationCalls++;
            file.uri = '../changed.tar';
          }
        };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual('copy:/sandbox/com.samples.target/manage.json->31|close:31');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual('/sandbox/com.samples.target/manage.json');
        expect(io.copies[0].destination).assertEqual(31);
        expect(mutationCalls).assertEqual(1);
        expect(file.fd).assertEqual(31);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('../changed.tar');
        expect(io.events.filter((event: string): boolean => event === 'close:31').length).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:999').length).assertEqual(0);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION03_0700
     * @tc.name testAppFileBackupMutation030007
     * @tc.desc Keep original transfer ownership during restore close mutation of descriptor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation030007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation030007';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 31, bundleName: 'com.samples.target', uri: 'manage.json' };
        let mutationCalls: number = 0;
        io.onOperation = (phase: string): void => {
          if (phase === 'close') {
            mutationCalls++;
            file.fd = 999;
          }
        };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual('copy:/sandbox/com.samples.target/manage.json->31|close:31');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual('/sandbox/com.samples.target/manage.json');
        expect(io.copies[0].destination).assertEqual(31);
        expect(mutationCalls).assertEqual(1);
        expect(file.fd).assertEqual(999);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('manage.json');
        expect(io.events.filter((event: string): boolean => event === 'close:31').length).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:999').length).assertEqual(0);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION03_0800
     * @tc.name testAppFileBackupMutation030008
     * @tc.desc Keep original transfer ownership during restore close mutation of bundle.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation030008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation030008';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 31, bundleName: 'com.samples.target', uri: 'manage.json' };
        let mutationCalls: number = 0;
        io.onOperation = (phase: string): void => {
          if (phase === 'close') {
            mutationCalls++;
            file.bundleName = 'com.samples.changed';
          }
        };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual('copy:/sandbox/com.samples.target/manage.json->31|close:31');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual('/sandbox/com.samples.target/manage.json');
        expect(io.copies[0].destination).assertEqual(31);
        expect(mutationCalls).assertEqual(1);
        expect(file.fd).assertEqual(31);
        expect(file.bundleName).assertEqual('com.samples.changed');
        expect(file.uri).assertEqual('manage.json');
        expect(io.events.filter((event: string): boolean => event === 'close:31').length).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:999').length).assertEqual(0);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION03_0900
     * @tc.name testAppFileBackupMutation030009
     * @tc.desc Keep original transfer ownership during restore close mutation of uri.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation030009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation030009';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 31, bundleName: 'com.samples.target', uri: 'manage.json' };
        let mutationCalls: number = 0;
        io.onOperation = (phase: string): void => {
          if (phase === 'close') {
            mutationCalls++;
            file.uri = 'changed.tar';
          }
        };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual('copy:/sandbox/com.samples.target/manage.json->31|close:31');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual('/sandbox/com.samples.target/manage.json');
        expect(io.copies[0].destination).assertEqual(31);
        expect(mutationCalls).assertEqual(1);
        expect(file.fd).assertEqual(31);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('changed.tar');
        expect(io.events.filter((event: string): boolean => event === 'close:31').length).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:999').length).assertEqual(0);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION03_1000
     * @tc.name testAppFileBackupMutation030010
     * @tc.desc Keep original transfer ownership during restore close mutation of allFields.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation030010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation030010';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 31, bundleName: 'com.samples.target', uri: 'manage.json' };
        let mutationCalls: number = 0;
        io.onOperation = (phase: string): void => {
          if (phase === 'close') {
            mutationCalls++;
            file.fd = 999;
            file.bundleName = 'com.samples.changed';
            file.uri = 'changed.tar';
          }
        };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual('copy:/sandbox/com.samples.target/manage.json->31|close:31');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual('/sandbox/com.samples.target/manage.json');
        expect(io.copies[0].destination).assertEqual(31);
        expect(mutationCalls).assertEqual(1);
        expect(file.fd).assertEqual(999);
        expect(file.bundleName).assertEqual('com.samples.changed');
        expect(file.uri).assertEqual('changed.tar');
        expect(io.events.filter((event: string): boolean => event === 'close:31').length).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:999').length).assertEqual(0);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION03_1100
     * @tc.name testAppFileBackupMutation030011
     * @tc.desc Keep original transfer ownership during restore close mutation of traversalBundle.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation030011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation030011';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 31, bundleName: 'com.samples.target', uri: 'manage.json' };
        let mutationCalls: number = 0;
        io.onOperation = (phase: string): void => {
          if (phase === 'close') {
            mutationCalls++;
            file.bundleName = '../changed';
          }
        };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual('copy:/sandbox/com.samples.target/manage.json->31|close:31');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual('/sandbox/com.samples.target/manage.json');
        expect(io.copies[0].destination).assertEqual(31);
        expect(mutationCalls).assertEqual(1);
        expect(file.fd).assertEqual(31);
        expect(file.bundleName).assertEqual('../changed');
        expect(file.uri).assertEqual('manage.json');
        expect(io.events.filter((event: string): boolean => event === 'close:31').length).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:999').length).assertEqual(0);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION03_1200
     * @tc.name testAppFileBackupMutation030012
     * @tc.desc Keep original transfer ownership during restore close mutation of traversalUri.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation030012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation030012';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 31, bundleName: 'com.samples.target', uri: 'manage.json' };
        let mutationCalls: number = 0;
        io.onOperation = (phase: string): void => {
          if (phase === 'close') {
            mutationCalls++;
            file.uri = '../changed.tar';
          }
        };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual('copy:/sandbox/com.samples.target/manage.json->31|close:31');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual('/sandbox/com.samples.target/manage.json');
        expect(io.copies[0].destination).assertEqual(31);
        expect(mutationCalls).assertEqual(1);
        expect(file.fd).assertEqual(31);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('../changed.tar');
        expect(io.events.filter((event: string): boolean => event === 'close:31').length).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:999').length).assertEqual(0);
      } finally {
        console.info(`${TAG} end`);
      }
    });

  });
}
