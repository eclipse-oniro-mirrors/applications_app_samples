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
export default function backupSequence13Test(): void {
  describe('AppFileBackupSequence13', (): void => {
    /**
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE13_0100
     * @tc.name testAppFileBackupSequence130001
     * @tc.desc Verify accessFailure then accessFailure then storeMissing with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence130001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence130001';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual('access:/sandbox/com.samples.target|close:13');
        expect(io.copies.length - step1Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(true);
        expect(step2Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step2Offset).join('|')).assertEqual('access:/sandbox/com.samples.target|close:26');
        expect(io.copies.length - step2Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:26').length).assertEqual(1);
        expect(step2File.fd).assertEqual(26);
        expect(step2File.bundleName).assertEqual('com.samples.target');
        expect(step2File.uri).assertEqual('manage.json');
        const step3File: BackupTransferFile = { fd: 39, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step3Offset: number = io.events.length;
        const step3Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = '';
        io.closeError = undefined;
        const step3Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step3File, io));
        expect(step3Result.threw).assertEqual(false);
        expect(step3Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step3Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:39->/sandbox/com.samples.target/manage.json|' +
          'close:39');
        expect(io.copies.length - step3Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:39').length).assertEqual(1);
        expect(step3File.fd).assertEqual(39);
        expect(step3File.bundleName).assertEqual('com.samples.target');
        expect(step3File.uri).assertEqual('manage.json');
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'close:26|' +
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:39->/sandbox/com.samples.target/manage.json|' +
          'close:39');
        expect(io.events.filter((event: string): boolean => event.startsWith('close:')).length).assertEqual(3);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE13_0200
     * @tc.name testAppFileBackupSequence130002
     * @tc.desc Verify accessFailure then accessFailure then storeExisting with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence130002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence130002';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual('access:/sandbox/com.samples.target|close:13');
        expect(io.copies.length - step1Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(true);
        expect(step2Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step2Offset).join('|')).assertEqual('access:/sandbox/com.samples.target|close:26');
        expect(io.copies.length - step2Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:26').length).assertEqual(1);
        expect(step2File.fd).assertEqual(26);
        expect(step2File.bundleName).assertEqual('com.samples.target');
        expect(step2File.uri).assertEqual('manage.json');
        const step3File: BackupTransferFile = { fd: 39, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step3Offset: number = io.events.length;
        const step3Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step3Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step3File, io));
        expect(step3Result.threw).assertEqual(false);
        expect(step3Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step3Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:39->/sandbox/com.samples.target/manage.json|close:39');
        expect(io.copies.length - step3Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:39').length).assertEqual(1);
        expect(step3File.fd).assertEqual(39);
        expect(step3File.bundleName).assertEqual('com.samples.target');
        expect(step3File.uri).assertEqual('manage.json');
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'close:26|' +
          'access:/sandbox/com.samples.target|' +
          'copy:39->/sandbox/com.samples.target/manage.json|' +
          'close:39');
        expect(io.events.filter((event: string): boolean => event.startsWith('close:')).length).assertEqual(3);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE13_0300
     * @tc.name testAppFileBackupSequence130003
     * @tc.desc Verify accessFailure then accessFailure then restore with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence130003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence130003';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual('access:/sandbox/com.samples.target|close:13');
        expect(io.copies.length - step1Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(true);
        expect(step2Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step2Offset).join('|')).assertEqual('access:/sandbox/com.samples.target|close:26');
        expect(io.copies.length - step2Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:26').length).assertEqual(1);
        expect(step2File.fd).assertEqual(26);
        expect(step2File.bundleName).assertEqual('com.samples.target');
        expect(step2File.uri).assertEqual('manage.json');
        const step3File: BackupTransferFile = { fd: 39, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step3Offset: number = io.events.length;
        const step3Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step3Result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', step3File, io));
        expect(step3Result.threw).assertEqual(false);
        expect(step3Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step3Offset).join('|')).assertEqual(
          'copy:/sandbox/com.samples.target/manage.json->39|close:39');
        expect(io.copies.length - step3Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:39').length).assertEqual(1);
        expect(step3File.fd).assertEqual(39);
        expect(step3File.bundleName).assertEqual('com.samples.target');
        expect(step3File.uri).assertEqual('manage.json');
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'close:26|' +
          'copy:/sandbox/com.samples.target/manage.json->39|' +
          'close:39');
        expect(io.events.filter((event: string): boolean => event.startsWith('close:')).length).assertEqual(3);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE13_0400
     * @tc.name testAppFileBackupSequence130004
     * @tc.desc Verify accessFailure then accessFailure then accessFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence130004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence130004';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual('access:/sandbox/com.samples.target|close:13');
        expect(io.copies.length - step1Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(true);
        expect(step2Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step2Offset).join('|')).assertEqual('access:/sandbox/com.samples.target|close:26');
        expect(io.copies.length - step2Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:26').length).assertEqual(1);
        expect(step2File.fd).assertEqual(26);
        expect(step2File.bundleName).assertEqual('com.samples.target');
        expect(step2File.uri).assertEqual('manage.json');
        const step3File: BackupTransferFile = { fd: 39, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step3Offset: number = io.events.length;
        const step3Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = undefined;
        const step3Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step3File, io));
        expect(step3Result.threw).assertEqual(true);
        expect(step3Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step3Offset).join('|')).assertEqual('access:/sandbox/com.samples.target|close:39');
        expect(io.copies.length - step3Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:39').length).assertEqual(1);
        expect(step3File.fd).assertEqual(39);
        expect(step3File.bundleName).assertEqual('com.samples.target');
        expect(step3File.uri).assertEqual('manage.json');
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'close:26|' +
          'access:/sandbox/com.samples.target|' +
          'close:39');
        expect(io.events.filter((event: string): boolean => event.startsWith('close:')).length).assertEqual(3);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE13_0500
     * @tc.name testAppFileBackupSequence130005
     * @tc.desc Verify accessFailure then accessFailure then mkdirFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence130005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence130005';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual('access:/sandbox/com.samples.target|close:13');
        expect(io.copies.length - step1Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(true);
        expect(step2Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step2Offset).join('|')).assertEqual('access:/sandbox/com.samples.target|close:26');
        expect(io.copies.length - step2Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:26').length).assertEqual(1);
        expect(step2File.fd).assertEqual(26);
        expect(step2File.bundleName).assertEqual('com.samples.target');
        expect(step2File.uri).assertEqual('manage.json');
        const step3File: BackupTransferFile = { fd: 39, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step3Offset: number = io.events.length;
        const step3Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'mkdir';
        io.closeError = undefined;
        const step3Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step3File, io));
        expect(step3Result.threw).assertEqual(true);
        expect(step3Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step3Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|mkdir:/sandbox/com.samples.target|close:39');
        expect(io.copies.length - step3Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:39').length).assertEqual(1);
        expect(step3File.fd).assertEqual(39);
        expect(step3File.bundleName).assertEqual('com.samples.target');
        expect(step3File.uri).assertEqual('manage.json');
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'close:26|' +
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'close:39');
        expect(io.events.filter((event: string): boolean => event.startsWith('close:')).length).assertEqual(3);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE13_0600
     * @tc.name testAppFileBackupSequence130006
     * @tc.desc Verify accessFailure then accessFailure then storeCopyFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence130006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence130006';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual('access:/sandbox/com.samples.target|close:13');
        expect(io.copies.length - step1Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(true);
        expect(step2Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step2Offset).join('|')).assertEqual('access:/sandbox/com.samples.target|close:26');
        expect(io.copies.length - step2Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:26').length).assertEqual(1);
        expect(step2File.fd).assertEqual(26);
        expect(step2File.bundleName).assertEqual('com.samples.target');
        expect(step2File.uri).assertEqual('manage.json');
        const step3File: BackupTransferFile = { fd: 39, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step3Offset: number = io.events.length;
        const step3Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = 'copy';
        io.closeError = undefined;
        const step3Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step3File, io));
        expect(step3Result.threw).assertEqual(true);
        expect(step3Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step3Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:39->/sandbox/com.samples.target/manage.json|close:39');
        expect(io.copies.length - step3Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:39').length).assertEqual(1);
        expect(step3File.fd).assertEqual(39);
        expect(step3File.bundleName).assertEqual('com.samples.target');
        expect(step3File.uri).assertEqual('manage.json');
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'close:26|' +
          'access:/sandbox/com.samples.target|' +
          'copy:39->/sandbox/com.samples.target/manage.json|' +
          'close:39');
        expect(io.events.filter((event: string): boolean => event.startsWith('close:')).length).assertEqual(3);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE13_0700
     * @tc.name testAppFileBackupSequence130007
     * @tc.desc Verify accessFailure then accessFailure then restoreCopyFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence130007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence130007';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual('access:/sandbox/com.samples.target|close:13');
        expect(io.copies.length - step1Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(true);
        expect(step2Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step2Offset).join('|')).assertEqual('access:/sandbox/com.samples.target|close:26');
        expect(io.copies.length - step2Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:26').length).assertEqual(1);
        expect(step2File.fd).assertEqual(26);
        expect(step2File.bundleName).assertEqual('com.samples.target');
        expect(step2File.uri).assertEqual('manage.json');
        const step3File: BackupTransferFile = { fd: 39, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step3Offset: number = io.events.length;
        const step3Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = 'copy';
        io.closeError = undefined;
        const step3Result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', step3File, io));
        expect(step3Result.threw).assertEqual(true);
        expect(step3Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step3Offset).join('|')).assertEqual(
          'copy:/sandbox/com.samples.target/manage.json->39|close:39');
        expect(io.copies.length - step3Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:39').length).assertEqual(1);
        expect(step3File.fd).assertEqual(39);
        expect(step3File.bundleName).assertEqual('com.samples.target');
        expect(step3File.uri).assertEqual('manage.json');
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'close:26|' +
          'copy:/sandbox/com.samples.target/manage.json->39|' +
          'close:39');
        expect(io.events.filter((event: string): boolean => event.startsWith('close:')).length).assertEqual(3);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE13_0800
     * @tc.name testAppFileBackupSequence130008
     * @tc.desc Verify accessFailure then accessFailure then missingCopyFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence130008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence130008';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual('access:/sandbox/com.samples.target|close:13');
        expect(io.copies.length - step1Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(true);
        expect(step2Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step2Offset).join('|')).assertEqual('access:/sandbox/com.samples.target|close:26');
        expect(io.copies.length - step2Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:26').length).assertEqual(1);
        expect(step2File.fd).assertEqual(26);
        expect(step2File.bundleName).assertEqual('com.samples.target');
        expect(step2File.uri).assertEqual('manage.json');
        const step3File: BackupTransferFile = { fd: 39, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step3Offset: number = io.events.length;
        const step3Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'copy';
        io.closeError = undefined;
        const step3Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step3File, io));
        expect(step3Result.threw).assertEqual(true);
        expect(step3Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step3Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:39->/sandbox/com.samples.target/manage.json|' +
          'close:39');
        expect(io.copies.length - step3Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:39').length).assertEqual(1);
        expect(step3File.fd).assertEqual(39);
        expect(step3File.bundleName).assertEqual('com.samples.target');
        expect(step3File.uri).assertEqual('manage.json');
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'close:26|' +
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:39->/sandbox/com.samples.target/manage.json|' +
          'close:39');
        expect(io.events.filter((event: string): boolean => event.startsWith('close:')).length).assertEqual(3);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE13_0900
     * @tc.name testAppFileBackupSequence130009
     * @tc.desc Verify accessFailure then mkdirFailure then storeMissing with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence130009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence130009';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual('access:/sandbox/com.samples.target|close:13');
        expect(io.copies.length - step1Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'mkdir';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(true);
        expect(step2Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step2Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|mkdir:/sandbox/com.samples.target|close:26');
        expect(io.copies.length - step2Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:26').length).assertEqual(1);
        expect(step2File.fd).assertEqual(26);
        expect(step2File.bundleName).assertEqual('com.samples.target');
        expect(step2File.uri).assertEqual('manage.json');
        const step3File: BackupTransferFile = { fd: 39, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step3Offset: number = io.events.length;
        const step3Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = '';
        io.closeError = undefined;
        const step3Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step3File, io));
        expect(step3Result.threw).assertEqual(false);
        expect(step3Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step3Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:39->/sandbox/com.samples.target/manage.json|' +
          'close:39');
        expect(io.copies.length - step3Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:39').length).assertEqual(1);
        expect(step3File.fd).assertEqual(39);
        expect(step3File.bundleName).assertEqual('com.samples.target');
        expect(step3File.uri).assertEqual('manage.json');
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'close:26|' +
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:39->/sandbox/com.samples.target/manage.json|' +
          'close:39');
        expect(io.events.filter((event: string): boolean => event.startsWith('close:')).length).assertEqual(3);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE13_1000
     * @tc.name testAppFileBackupSequence130010
     * @tc.desc Verify accessFailure then mkdirFailure then storeExisting with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence130010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence130010';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual('access:/sandbox/com.samples.target|close:13');
        expect(io.copies.length - step1Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'mkdir';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(true);
        expect(step2Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step2Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|mkdir:/sandbox/com.samples.target|close:26');
        expect(io.copies.length - step2Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:26').length).assertEqual(1);
        expect(step2File.fd).assertEqual(26);
        expect(step2File.bundleName).assertEqual('com.samples.target');
        expect(step2File.uri).assertEqual('manage.json');
        const step3File: BackupTransferFile = { fd: 39, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step3Offset: number = io.events.length;
        const step3Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step3Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step3File, io));
        expect(step3Result.threw).assertEqual(false);
        expect(step3Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step3Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:39->/sandbox/com.samples.target/manage.json|close:39');
        expect(io.copies.length - step3Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:39').length).assertEqual(1);
        expect(step3File.fd).assertEqual(39);
        expect(step3File.bundleName).assertEqual('com.samples.target');
        expect(step3File.uri).assertEqual('manage.json');
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'close:26|' +
          'access:/sandbox/com.samples.target|' +
          'copy:39->/sandbox/com.samples.target/manage.json|' +
          'close:39');
        expect(io.events.filter((event: string): boolean => event.startsWith('close:')).length).assertEqual(3);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE13_1100
     * @tc.name testAppFileBackupSequence130011
     * @tc.desc Verify accessFailure then mkdirFailure then restore with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence130011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence130011';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual('access:/sandbox/com.samples.target|close:13');
        expect(io.copies.length - step1Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'mkdir';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(true);
        expect(step2Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step2Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|mkdir:/sandbox/com.samples.target|close:26');
        expect(io.copies.length - step2Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:26').length).assertEqual(1);
        expect(step2File.fd).assertEqual(26);
        expect(step2File.bundleName).assertEqual('com.samples.target');
        expect(step2File.uri).assertEqual('manage.json');
        const step3File: BackupTransferFile = { fd: 39, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step3Offset: number = io.events.length;
        const step3Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step3Result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', step3File, io));
        expect(step3Result.threw).assertEqual(false);
        expect(step3Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step3Offset).join('|')).assertEqual(
          'copy:/sandbox/com.samples.target/manage.json->39|close:39');
        expect(io.copies.length - step3Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:39').length).assertEqual(1);
        expect(step3File.fd).assertEqual(39);
        expect(step3File.bundleName).assertEqual('com.samples.target');
        expect(step3File.uri).assertEqual('manage.json');
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'close:26|' +
          'copy:/sandbox/com.samples.target/manage.json->39|' +
          'close:39');
        expect(io.events.filter((event: string): boolean => event.startsWith('close:')).length).assertEqual(3);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE13_1200
     * @tc.name testAppFileBackupSequence130012
     * @tc.desc Verify accessFailure then mkdirFailure then accessFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence130012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence130012';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual('access:/sandbox/com.samples.target|close:13');
        expect(io.copies.length - step1Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'mkdir';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(true);
        expect(step2Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step2Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|mkdir:/sandbox/com.samples.target|close:26');
        expect(io.copies.length - step2Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:26').length).assertEqual(1);
        expect(step2File.fd).assertEqual(26);
        expect(step2File.bundleName).assertEqual('com.samples.target');
        expect(step2File.uri).assertEqual('manage.json');
        const step3File: BackupTransferFile = { fd: 39, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step3Offset: number = io.events.length;
        const step3Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = undefined;
        const step3Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step3File, io));
        expect(step3Result.threw).assertEqual(true);
        expect(step3Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step3Offset).join('|')).assertEqual('access:/sandbox/com.samples.target|close:39');
        expect(io.copies.length - step3Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:39').length).assertEqual(1);
        expect(step3File.fd).assertEqual(39);
        expect(step3File.bundleName).assertEqual('com.samples.target');
        expect(step3File.uri).assertEqual('manage.json');
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'close:26|' +
          'access:/sandbox/com.samples.target|' +
          'close:39');
        expect(io.events.filter((event: string): boolean => event.startsWith('close:')).length).assertEqual(3);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE13_1300
     * @tc.name testAppFileBackupSequence130013
     * @tc.desc Verify accessFailure then mkdirFailure then mkdirFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence130013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence130013';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual('access:/sandbox/com.samples.target|close:13');
        expect(io.copies.length - step1Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'mkdir';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(true);
        expect(step2Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step2Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|mkdir:/sandbox/com.samples.target|close:26');
        expect(io.copies.length - step2Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:26').length).assertEqual(1);
        expect(step2File.fd).assertEqual(26);
        expect(step2File.bundleName).assertEqual('com.samples.target');
        expect(step2File.uri).assertEqual('manage.json');
        const step3File: BackupTransferFile = { fd: 39, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step3Offset: number = io.events.length;
        const step3Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'mkdir';
        io.closeError = undefined;
        const step3Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step3File, io));
        expect(step3Result.threw).assertEqual(true);
        expect(step3Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step3Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|mkdir:/sandbox/com.samples.target|close:39');
        expect(io.copies.length - step3Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:39').length).assertEqual(1);
        expect(step3File.fd).assertEqual(39);
        expect(step3File.bundleName).assertEqual('com.samples.target');
        expect(step3File.uri).assertEqual('manage.json');
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'close:26|' +
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'close:39');
        expect(io.events.filter((event: string): boolean => event.startsWith('close:')).length).assertEqual(3);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE13_1400
     * @tc.name testAppFileBackupSequence130014
     * @tc.desc Verify accessFailure then mkdirFailure then storeCopyFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence130014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence130014';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual('access:/sandbox/com.samples.target|close:13');
        expect(io.copies.length - step1Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'mkdir';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(true);
        expect(step2Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step2Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|mkdir:/sandbox/com.samples.target|close:26');
        expect(io.copies.length - step2Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:26').length).assertEqual(1);
        expect(step2File.fd).assertEqual(26);
        expect(step2File.bundleName).assertEqual('com.samples.target');
        expect(step2File.uri).assertEqual('manage.json');
        const step3File: BackupTransferFile = { fd: 39, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step3Offset: number = io.events.length;
        const step3Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = 'copy';
        io.closeError = undefined;
        const step3Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step3File, io));
        expect(step3Result.threw).assertEqual(true);
        expect(step3Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step3Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:39->/sandbox/com.samples.target/manage.json|close:39');
        expect(io.copies.length - step3Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:39').length).assertEqual(1);
        expect(step3File.fd).assertEqual(39);
        expect(step3File.bundleName).assertEqual('com.samples.target');
        expect(step3File.uri).assertEqual('manage.json');
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'close:26|' +
          'access:/sandbox/com.samples.target|' +
          'copy:39->/sandbox/com.samples.target/manage.json|' +
          'close:39');
        expect(io.events.filter((event: string): boolean => event.startsWith('close:')).length).assertEqual(3);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE13_1500
     * @tc.name testAppFileBackupSequence130015
     * @tc.desc Verify accessFailure then mkdirFailure then restoreCopyFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence130015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence130015';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual('access:/sandbox/com.samples.target|close:13');
        expect(io.copies.length - step1Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'mkdir';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(true);
        expect(step2Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step2Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|mkdir:/sandbox/com.samples.target|close:26');
        expect(io.copies.length - step2Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:26').length).assertEqual(1);
        expect(step2File.fd).assertEqual(26);
        expect(step2File.bundleName).assertEqual('com.samples.target');
        expect(step2File.uri).assertEqual('manage.json');
        const step3File: BackupTransferFile = { fd: 39, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step3Offset: number = io.events.length;
        const step3Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = 'copy';
        io.closeError = undefined;
        const step3Result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', step3File, io));
        expect(step3Result.threw).assertEqual(true);
        expect(step3Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step3Offset).join('|')).assertEqual(
          'copy:/sandbox/com.samples.target/manage.json->39|close:39');
        expect(io.copies.length - step3Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:39').length).assertEqual(1);
        expect(step3File.fd).assertEqual(39);
        expect(step3File.bundleName).assertEqual('com.samples.target');
        expect(step3File.uri).assertEqual('manage.json');
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'close:26|' +
          'copy:/sandbox/com.samples.target/manage.json->39|' +
          'close:39');
        expect(io.events.filter((event: string): boolean => event.startsWith('close:')).length).assertEqual(3);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE13_1600
     * @tc.name testAppFileBackupSequence130016
     * @tc.desc Verify accessFailure then mkdirFailure then missingCopyFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence130016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence130016';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual('access:/sandbox/com.samples.target|close:13');
        expect(io.copies.length - step1Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'mkdir';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(true);
        expect(step2Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step2Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|mkdir:/sandbox/com.samples.target|close:26');
        expect(io.copies.length - step2Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:26').length).assertEqual(1);
        expect(step2File.fd).assertEqual(26);
        expect(step2File.bundleName).assertEqual('com.samples.target');
        expect(step2File.uri).assertEqual('manage.json');
        const step3File: BackupTransferFile = { fd: 39, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step3Offset: number = io.events.length;
        const step3Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'copy';
        io.closeError = undefined;
        const step3Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step3File, io));
        expect(step3Result.threw).assertEqual(true);
        expect(step3Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step3Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:39->/sandbox/com.samples.target/manage.json|' +
          'close:39');
        expect(io.copies.length - step3Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:39').length).assertEqual(1);
        expect(step3File.fd).assertEqual(39);
        expect(step3File.bundleName).assertEqual('com.samples.target');
        expect(step3File.uri).assertEqual('manage.json');
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'close:26|' +
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:39->/sandbox/com.samples.target/manage.json|' +
          'close:39');
        expect(io.events.filter((event: string): boolean => event.startsWith('close:')).length).assertEqual(3);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE13_1700
     * @tc.name testAppFileBackupSequence130017
     * @tc.desc Verify accessFailure then storeCopyFailure then storeMissing with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence130017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence130017';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual('access:/sandbox/com.samples.target|close:13');
        expect(io.copies.length - step1Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = 'copy';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(true);
        expect(step2Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step2Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:26->/sandbox/com.samples.target/manage.json|close:26');
        expect(io.copies.length - step2Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:26').length).assertEqual(1);
        expect(step2File.fd).assertEqual(26);
        expect(step2File.bundleName).assertEqual('com.samples.target');
        expect(step2File.uri).assertEqual('manage.json');
        const step3File: BackupTransferFile = { fd: 39, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step3Offset: number = io.events.length;
        const step3Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = '';
        io.closeError = undefined;
        const step3Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step3File, io));
        expect(step3Result.threw).assertEqual(false);
        expect(step3Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step3Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:39->/sandbox/com.samples.target/manage.json|' +
          'close:39');
        expect(io.copies.length - step3Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:39').length).assertEqual(1);
        expect(step3File.fd).assertEqual(39);
        expect(step3File.bundleName).assertEqual('com.samples.target');
        expect(step3File.uri).assertEqual('manage.json');
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'copy:26->/sandbox/com.samples.target/manage.json|' +
          'close:26|' +
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:39->/sandbox/com.samples.target/manage.json|' +
          'close:39');
        expect(io.events.filter((event: string): boolean => event.startsWith('close:')).length).assertEqual(3);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE13_1800
     * @tc.name testAppFileBackupSequence130018
     * @tc.desc Verify accessFailure then storeCopyFailure then storeExisting with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence130018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence130018';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual('access:/sandbox/com.samples.target|close:13');
        expect(io.copies.length - step1Copies).assertEqual(0);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = 'copy';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(true);
        expect(step2Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step2Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:26->/sandbox/com.samples.target/manage.json|close:26');
        expect(io.copies.length - step2Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:26').length).assertEqual(1);
        expect(step2File.fd).assertEqual(26);
        expect(step2File.bundleName).assertEqual('com.samples.target');
        expect(step2File.uri).assertEqual('manage.json');
        const step3File: BackupTransferFile = { fd: 39, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step3Offset: number = io.events.length;
        const step3Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step3Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step3File, io));
        expect(step3Result.threw).assertEqual(false);
        expect(step3Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step3Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:39->/sandbox/com.samples.target/manage.json|close:39');
        expect(io.copies.length - step3Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:39').length).assertEqual(1);
        expect(step3File.fd).assertEqual(39);
        expect(step3File.bundleName).assertEqual('com.samples.target');
        expect(step3File.uri).assertEqual('manage.json');
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'copy:26->/sandbox/com.samples.target/manage.json|' +
          'close:26|' +
          'access:/sandbox/com.samples.target|' +
          'copy:39->/sandbox/com.samples.target/manage.json|' +
          'close:39');
        expect(io.events.filter((event: string): boolean => event.startsWith('close:')).length).assertEqual(3);
      } finally {
        console.info(`${TAG} end`);
      }
    });

  });
}
