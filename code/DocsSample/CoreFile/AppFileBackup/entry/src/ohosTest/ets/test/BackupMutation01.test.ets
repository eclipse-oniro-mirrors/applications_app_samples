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
export default function backupMutation01Test(): void {
  describe('AppFileBackupMutation01', (): void => {
    /**
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION01_0100
     * @tc.name testAppFileBackupMutation010001
     * @tc.desc Keep original transfer ownership during store access mutation of descriptor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation010001';
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
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION01_0200
     * @tc.name testAppFileBackupMutation010002
     * @tc.desc Keep original transfer ownership during store access mutation of bundle.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation010002';
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
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION01_0300
     * @tc.name testAppFileBackupMutation010003
     * @tc.desc Keep original transfer ownership during store access mutation of uri.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation010003';
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
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION01_0400
     * @tc.name testAppFileBackupMutation010004
     * @tc.desc Keep original transfer ownership during store access mutation of allFields.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation010004';
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
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION01_0500
     * @tc.name testAppFileBackupMutation010005
     * @tc.desc Keep original transfer ownership during store access mutation of traversalBundle.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation010005';
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
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION01_0600
     * @tc.name testAppFileBackupMutation010006
     * @tc.desc Keep original transfer ownership during store access mutation of traversalUri.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation010006';
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
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION01_0700
     * @tc.name testAppFileBackupMutation010007
     * @tc.desc Keep original transfer ownership during store mkdir mutation of descriptor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation010007';
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
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION01_0800
     * @tc.name testAppFileBackupMutation010008
     * @tc.desc Keep original transfer ownership during store mkdir mutation of bundle.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation010008';
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
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION01_0900
     * @tc.name testAppFileBackupMutation010009
     * @tc.desc Keep original transfer ownership during store mkdir mutation of uri.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation010009';
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
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION01_1000
     * @tc.name testAppFileBackupMutation010010
     * @tc.desc Keep original transfer ownership during store mkdir mutation of allFields.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation010010';
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
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION01_1100
     * @tc.name testAppFileBackupMutation010011
     * @tc.desc Keep original transfer ownership during store mkdir mutation of traversalBundle.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation010011';
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
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION01_1200
     * @tc.name testAppFileBackupMutation010012
     * @tc.desc Keep original transfer ownership during store mkdir mutation of traversalUri.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation010012';
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
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION01_1300
     * @tc.name testAppFileBackupMutation010013
     * @tc.desc Keep original transfer ownership during store copy mutation of descriptor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation010013';
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
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION01_1400
     * @tc.name testAppFileBackupMutation010014
     * @tc.desc Keep original transfer ownership during store copy mutation of bundle.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation010014';
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
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION01_1500
     * @tc.name testAppFileBackupMutation010015
     * @tc.desc Keep original transfer ownership during store copy mutation of uri.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation010015';
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
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION01_1600
     * @tc.name testAppFileBackupMutation010016
     * @tc.desc Keep original transfer ownership during store copy mutation of allFields.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation010016';
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
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION01_1700
     * @tc.name testAppFileBackupMutation010017
     * @tc.desc Keep original transfer ownership during store copy mutation of traversalBundle.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation010017';
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
     * @tc.number SUB_APP_FILE_BACKUP_MUTATION01_1800
     * @tc.name testAppFileBackupMutation010018
     * @tc.desc Keep original transfer ownership during store copy mutation of traversalUri.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupMutation010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupMutation010018';
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

  });
}
