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
export default function backupSequence26Test(): void {
  describe('AppFileBackupSequence26', (): void => {
    /**
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE26_0100
     * @tc.name testAppFileBackupSequence260001
     * @tc.desc Verify missingCopyFailure then storeMissing then restore with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence260001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence260001';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'copy';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
          'close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = '';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(false);
        expect(step2Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step2Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:26->/sandbox/com.samples.target/manage.json|' +
          'close:26');
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
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:26->/sandbox/com.samples.target/manage.json|' +
          'close:26|' +
          'copy:/sandbox/com.samples.target/manage.json->39|' +
          'close:39');
        expect(io.events.filter((event: string): boolean => event.startsWith('close:')).length).assertEqual(3);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE26_0200
     * @tc.name testAppFileBackupSequence260002
     * @tc.desc Verify missingCopyFailure then storeMissing then accessFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence260002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence260002';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'copy';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
          'close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = '';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(false);
        expect(step2Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step2Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:26->/sandbox/com.samples.target/manage.json|' +
          'close:26');
        expect(io.copies.length - step2Copies).assertEqual(1);
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
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:26->/sandbox/com.samples.target/manage.json|' +
          'close:26|' +
          'access:/sandbox/com.samples.target|' +
          'close:39');
        expect(io.events.filter((event: string): boolean => event.startsWith('close:')).length).assertEqual(3);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE26_0300
     * @tc.name testAppFileBackupSequence260003
     * @tc.desc Verify missingCopyFailure then storeMissing then mkdirFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence260003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence260003';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'copy';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
          'close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = '';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(false);
        expect(step2Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step2Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:26->/sandbox/com.samples.target/manage.json|' +
          'close:26');
        expect(io.copies.length - step2Copies).assertEqual(1);
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
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:26->/sandbox/com.samples.target/manage.json|' +
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE26_0400
     * @tc.name testAppFileBackupSequence260004
     * @tc.desc Verify missingCopyFailure then storeMissing then storeCopyFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence260004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence260004';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'copy';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
          'close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = '';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(false);
        expect(step2Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step2Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:26->/sandbox/com.samples.target/manage.json|' +
          'close:26');
        expect(io.copies.length - step2Copies).assertEqual(1);
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
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
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

    /**
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE26_0500
     * @tc.name testAppFileBackupSequence260005
     * @tc.desc Verify missingCopyFailure then storeMissing then restoreCopyFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence260005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence260005';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'copy';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
          'close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = '';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(false);
        expect(step2Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step2Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:26->/sandbox/com.samples.target/manage.json|' +
          'close:26');
        expect(io.copies.length - step2Copies).assertEqual(1);
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
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:26->/sandbox/com.samples.target/manage.json|' +
          'close:26|' +
          'copy:/sandbox/com.samples.target/manage.json->39|' +
          'close:39');
        expect(io.events.filter((event: string): boolean => event.startsWith('close:')).length).assertEqual(3);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE26_0600
     * @tc.name testAppFileBackupSequence260006
     * @tc.desc Verify missingCopyFailure then storeMissing then missingCopyFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence260006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence260006';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'copy';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
          'close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = '';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(false);
        expect(step2Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step2Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:26->/sandbox/com.samples.target/manage.json|' +
          'close:26');
        expect(io.copies.length - step2Copies).assertEqual(1);
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
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE26_0700
     * @tc.name testAppFileBackupSequence260007
     * @tc.desc Verify missingCopyFailure then storeExisting then storeMissing with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence260007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence260007';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'copy';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
          'close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(false);
        expect(step2Result.error === undefined).assertEqual(true);
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
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE26_0800
     * @tc.name testAppFileBackupSequence260008
     * @tc.desc Verify missingCopyFailure then storeExisting then storeExisting with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence260008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence260008';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'copy';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
          'close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(false);
        expect(step2Result.error === undefined).assertEqual(true);
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
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
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

    /**
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE26_0900
     * @tc.name testAppFileBackupSequence260009
     * @tc.desc Verify missingCopyFailure then storeExisting then restore with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence260009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence260009';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'copy';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
          'close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(false);
        expect(step2Result.error === undefined).assertEqual(true);
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
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'copy:26->/sandbox/com.samples.target/manage.json|' +
          'close:26|' +
          'copy:/sandbox/com.samples.target/manage.json->39|' +
          'close:39');
        expect(io.events.filter((event: string): boolean => event.startsWith('close:')).length).assertEqual(3);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE26_1000
     * @tc.name testAppFileBackupSequence260010
     * @tc.desc Verify missingCopyFailure then storeExisting then accessFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence260010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence260010';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'copy';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
          'close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(false);
        expect(step2Result.error === undefined).assertEqual(true);
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
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'copy:26->/sandbox/com.samples.target/manage.json|' +
          'close:26|' +
          'access:/sandbox/com.samples.target|' +
          'close:39');
        expect(io.events.filter((event: string): boolean => event.startsWith('close:')).length).assertEqual(3);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE26_1100
     * @tc.name testAppFileBackupSequence260011
     * @tc.desc Verify missingCopyFailure then storeExisting then mkdirFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence260011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence260011';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'copy';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
          'close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(false);
        expect(step2Result.error === undefined).assertEqual(true);
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
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'copy:26->/sandbox/com.samples.target/manage.json|' +
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE26_1200
     * @tc.name testAppFileBackupSequence260012
     * @tc.desc Verify missingCopyFailure then storeExisting then storeCopyFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence260012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence260012';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'copy';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
          'close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(false);
        expect(step2Result.error === undefined).assertEqual(true);
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
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
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

    /**
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE26_1300
     * @tc.name testAppFileBackupSequence260013
     * @tc.desc Verify missingCopyFailure then storeExisting then restoreCopyFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence260013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence260013';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'copy';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
          'close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(false);
        expect(step2Result.error === undefined).assertEqual(true);
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
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'copy:26->/sandbox/com.samples.target/manage.json|' +
          'close:26|' +
          'copy:/sandbox/com.samples.target/manage.json->39|' +
          'close:39');
        expect(io.events.filter((event: string): boolean => event.startsWith('close:')).length).assertEqual(3);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE26_1400
     * @tc.name testAppFileBackupSequence260014
     * @tc.desc Verify missingCopyFailure then storeExisting then missingCopyFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence260014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence260014';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'copy';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
          'close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(false);
        expect(step2Result.error === undefined).assertEqual(true);
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
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE26_1500
     * @tc.name testAppFileBackupSequence260015
     * @tc.desc Verify missingCopyFailure then restore then storeMissing with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence260015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence260015';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'copy';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
          'close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(false);
        expect(step2Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step2Offset).join('|')).assertEqual(
          'copy:/sandbox/com.samples.target/manage.json->26|close:26');
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
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
          'close:13|' +
          'copy:/sandbox/com.samples.target/manage.json->26|' +
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE26_1600
     * @tc.name testAppFileBackupSequence260016
     * @tc.desc Verify missingCopyFailure then restore then storeExisting with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence260016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence260016';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'copy';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
          'close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(false);
        expect(step2Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step2Offset).join('|')).assertEqual(
          'copy:/sandbox/com.samples.target/manage.json->26|close:26');
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
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
          'close:13|' +
          'copy:/sandbox/com.samples.target/manage.json->26|' +
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE26_1700
     * @tc.name testAppFileBackupSequence260017
     * @tc.desc Verify missingCopyFailure then restore then restore with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence260017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence260017';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'copy';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
          'close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(false);
        expect(step2Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step2Offset).join('|')).assertEqual(
          'copy:/sandbox/com.samples.target/manage.json->26|close:26');
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
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
          'close:13|' +
          'copy:/sandbox/com.samples.target/manage.json->26|' +
          'close:26|' +
          'copy:/sandbox/com.samples.target/manage.json->39|' +
          'close:39');
        expect(io.events.filter((event: string): boolean => event.startsWith('close:')).length).assertEqual(3);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE26_1800
     * @tc.name testAppFileBackupSequence260018
     * @tc.desc Verify missingCopyFailure then restore then accessFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence260018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence260018';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'copy';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
          'close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(false);
        expect(step2Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step2Offset).join('|')).assertEqual(
          'copy:/sandbox/com.samples.target/manage.json->26|close:26');
        expect(io.copies.length - step2Copies).assertEqual(1);
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
          'mkdir:/sandbox/com.samples.target|' +
          'copy:13->/sandbox/com.samples.target/manage.json|' +
          'close:13|' +
          'copy:/sandbox/com.samples.target/manage.json->26|' +
          'close:26|' +
          'access:/sandbox/com.samples.target|' +
          'close:39');
        expect(io.events.filter((event: string): boolean => event.startsWith('close:')).length).assertEqual(3);
      } finally {
        console.info(`${TAG} end`);
      }
    });

  });
}
