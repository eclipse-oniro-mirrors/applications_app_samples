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
export default function backupMutation02Test(): void {
  describe('AppFileBackupMutation02', (): void => {
    /**
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION02_0100
     * @tc.name testAppFileBackupMutation020001
     * @tc.desc Keep original transfer ownership during store close mutation of descriptor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation020001';
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
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:31->/sandbox/com.samples.target/manage.json|' +
          'close:31');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual(31);
        expect(io.copies[0].destination).assertEqual('/sandbox/com.samples.target/manage.json');
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
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION02_0200
     * @tc.name testAppFileBackupMutation020002
     * @tc.desc Keep original transfer ownership during store close mutation of bundle.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation020002';
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
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:31->/sandbox/com.samples.target/manage.json|' +
          'close:31');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual(31);
        expect(io.copies[0].destination).assertEqual('/sandbox/com.samples.target/manage.json');
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
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION02_0300
     * @tc.name testAppFileBackupMutation020003
     * @tc.desc Keep original transfer ownership during store close mutation of uri.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation020003';
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
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:31->/sandbox/com.samples.target/manage.json|' +
          'close:31');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual(31);
        expect(io.copies[0].destination).assertEqual('/sandbox/com.samples.target/manage.json');
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
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION02_0400
     * @tc.name testAppFileBackupMutation020004
     * @tc.desc Keep original transfer ownership during store close mutation of allFields.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation020004';
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
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:31->/sandbox/com.samples.target/manage.json|' +
          'close:31');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual(31);
        expect(io.copies[0].destination).assertEqual('/sandbox/com.samples.target/manage.json');
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
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION02_0500
     * @tc.name testAppFileBackupMutation020005
     * @tc.desc Keep original transfer ownership during store close mutation of traversalBundle.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation020005';
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
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:31->/sandbox/com.samples.target/manage.json|' +
          'close:31');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual(31);
        expect(io.copies[0].destination).assertEqual('/sandbox/com.samples.target/manage.json');
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
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION02_0600
     * @tc.name testAppFileBackupMutation020006
     * @tc.desc Keep original transfer ownership during store close mutation of traversalUri.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation020006';
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
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:31->/sandbox/com.samples.target/manage.json|' +
          'close:31');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual(31);
        expect(io.copies[0].destination).assertEqual('/sandbox/com.samples.target/manage.json');
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
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION02_0700
     * @tc.name testAppFileBackupMutation020007
     * @tc.desc Keep original transfer ownership during restore access mutation of descriptor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation020007';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 31, bundleName: 'com.samples.target', uri: 'manage.json' };
        let mutationCalls: number = 0;
        io.onOperation = (phase: string): void => {
          if (phase === 'access') {
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
        expect(mutationCalls).assertEqual(0);
        expect(file.fd).assertEqual(31);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('manage.json');
        expect(io.events.filter((event: string): boolean => event === 'close:31').length).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:999').length).assertEqual(0);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION02_0800
     * @tc.name testAppFileBackupMutation020008
     * @tc.desc Keep original transfer ownership during restore access mutation of bundle.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation020008';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 31, bundleName: 'com.samples.target', uri: 'manage.json' };
        let mutationCalls: number = 0;
        io.onOperation = (phase: string): void => {
          if (phase === 'access') {
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
        expect(mutationCalls).assertEqual(0);
        expect(file.fd).assertEqual(31);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('manage.json');
        expect(io.events.filter((event: string): boolean => event === 'close:31').length).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:999').length).assertEqual(0);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION02_0900
     * @tc.name testAppFileBackupMutation020009
     * @tc.desc Keep original transfer ownership during restore access mutation of uri.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation020009';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 31, bundleName: 'com.samples.target', uri: 'manage.json' };
        let mutationCalls: number = 0;
        io.onOperation = (phase: string): void => {
          if (phase === 'access') {
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
        expect(mutationCalls).assertEqual(0);
        expect(file.fd).assertEqual(31);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('manage.json');
        expect(io.events.filter((event: string): boolean => event === 'close:31').length).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:999').length).assertEqual(0);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION02_1000
     * @tc.name testAppFileBackupMutation020010
     * @tc.desc Keep original transfer ownership during restore access mutation of allFields.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation020010';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 31, bundleName: 'com.samples.target', uri: 'manage.json' };
        let mutationCalls: number = 0;
        io.onOperation = (phase: string): void => {
          if (phase === 'access') {
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
        expect(mutationCalls).assertEqual(0);
        expect(file.fd).assertEqual(31);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('manage.json');
        expect(io.events.filter((event: string): boolean => event === 'close:31').length).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:999').length).assertEqual(0);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION02_1100
     * @tc.name testAppFileBackupMutation020011
     * @tc.desc Keep original transfer ownership during restore access mutation of traversalBundle.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation020011';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 31, bundleName: 'com.samples.target', uri: 'manage.json' };
        let mutationCalls: number = 0;
        io.onOperation = (phase: string): void => {
          if (phase === 'access') {
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
        expect(mutationCalls).assertEqual(0);
        expect(file.fd).assertEqual(31);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('manage.json');
        expect(io.events.filter((event: string): boolean => event === 'close:31').length).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:999').length).assertEqual(0);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION02_1200
     * @tc.name testAppFileBackupMutation020012
     * @tc.desc Keep original transfer ownership during restore access mutation of traversalUri.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation020012';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 31, bundleName: 'com.samples.target', uri: 'manage.json' };
        let mutationCalls: number = 0;
        io.onOperation = (phase: string): void => {
          if (phase === 'access') {
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
        expect(mutationCalls).assertEqual(0);
        expect(file.fd).assertEqual(31);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('manage.json');
        expect(io.events.filter((event: string): boolean => event === 'close:31').length).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:999').length).assertEqual(0);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION02_1300
     * @tc.name testAppFileBackupMutation020013
     * @tc.desc Keep original transfer ownership during restore mkdir mutation of descriptor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation020013';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 31, bundleName: 'com.samples.target', uri: 'manage.json' };
        let mutationCalls: number = 0;
        io.onOperation = (phase: string): void => {
          if (phase === 'mkdir') {
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
        expect(mutationCalls).assertEqual(0);
        expect(file.fd).assertEqual(31);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('manage.json');
        expect(io.events.filter((event: string): boolean => event === 'close:31').length).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:999').length).assertEqual(0);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION02_1400
     * @tc.name testAppFileBackupMutation020014
     * @tc.desc Keep original transfer ownership during restore mkdir mutation of bundle.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation020014';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 31, bundleName: 'com.samples.target', uri: 'manage.json' };
        let mutationCalls: number = 0;
        io.onOperation = (phase: string): void => {
          if (phase === 'mkdir') {
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
        expect(mutationCalls).assertEqual(0);
        expect(file.fd).assertEqual(31);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('manage.json');
        expect(io.events.filter((event: string): boolean => event === 'close:31').length).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:999').length).assertEqual(0);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION02_1500
     * @tc.name testAppFileBackupMutation020015
     * @tc.desc Keep original transfer ownership during restore mkdir mutation of uri.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation020015';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 31, bundleName: 'com.samples.target', uri: 'manage.json' };
        let mutationCalls: number = 0;
        io.onOperation = (phase: string): void => {
          if (phase === 'mkdir') {
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
        expect(mutationCalls).assertEqual(0);
        expect(file.fd).assertEqual(31);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('manage.json');
        expect(io.events.filter((event: string): boolean => event === 'close:31').length).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:999').length).assertEqual(0);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION02_1600
     * @tc.name testAppFileBackupMutation020016
     * @tc.desc Keep original transfer ownership during restore mkdir mutation of allFields.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation020016';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 31, bundleName: 'com.samples.target', uri: 'manage.json' };
        let mutationCalls: number = 0;
        io.onOperation = (phase: string): void => {
          if (phase === 'mkdir') {
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
        expect(mutationCalls).assertEqual(0);
        expect(file.fd).assertEqual(31);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('manage.json');
        expect(io.events.filter((event: string): boolean => event === 'close:31').length).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:999').length).assertEqual(0);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION02_1700
     * @tc.name testAppFileBackupMutation020017
     * @tc.desc Keep original transfer ownership during restore mkdir mutation of traversalBundle.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation020017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation020017';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 31, bundleName: 'com.samples.target', uri: 'manage.json' };
        let mutationCalls: number = 0;
        io.onOperation = (phase: string): void => {
          if (phase === 'mkdir') {
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
        expect(mutationCalls).assertEqual(0);
        expect(file.fd).assertEqual(31);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('manage.json');
        expect(io.events.filter((event: string): boolean => event === 'close:31').length).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:999').length).assertEqual(0);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION02_1800
     * @tc.name testAppFileBackupMutation020018
     * @tc.desc Keep original transfer ownership during restore mkdir mutation of traversalUri.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation020018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation020018';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 31, bundleName: 'com.samples.target', uri: 'manage.json' };
        let mutationCalls: number = 0;
        io.onOperation = (phase: string): void => {
          if (phase === 'mkdir') {
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
        expect(mutationCalls).assertEqual(0);
        expect(file.fd).assertEqual(31);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('manage.json');
        expect(io.events.filter((event: string): boolean => event === 'close:31').length).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:999').length).assertEqual(0);
      } finally {
        console.info(`${TAG} end`);
      }
    });

  });
}
