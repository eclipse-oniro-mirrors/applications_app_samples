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
export default function backupSequence17Test(): void {
  describe('AppFileBackupSequence17', (): void => {
    /**
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE17_0100
     * @tc.name testAppFileBackupSequence170001
     * @tc.desc Verify mkdirFailure then mkdirFailure then storeMissing with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence170001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence170001';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'mkdir';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|mkdir:/sandbox/com.samples.target|close:13');
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
          'mkdir:/sandbox/com.samples.target|' +
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE17_0200
     * @tc.name testAppFileBackupSequence170002
     * @tc.desc Verify mkdirFailure then mkdirFailure then storeExisting with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence170002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence170002';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'mkdir';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|mkdir:/sandbox/com.samples.target|close:13');
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
          'mkdir:/sandbox/com.samples.target|' +
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE17_0300
     * @tc.name testAppFileBackupSequence170003
     * @tc.desc Verify mkdirFailure then mkdirFailure then restore with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence170003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence170003';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'mkdir';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|mkdir:/sandbox/com.samples.target|close:13');
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
          'mkdir:/sandbox/com.samples.target|' +
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE17_0400
     * @tc.name testAppFileBackupSequence170004
     * @tc.desc Verify mkdirFailure then mkdirFailure then accessFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence170004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence170004';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'mkdir';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|mkdir:/sandbox/com.samples.target|close:13');
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
          'mkdir:/sandbox/com.samples.target|' +
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE17_0500
     * @tc.name testAppFileBackupSequence170005
     * @tc.desc Verify mkdirFailure then mkdirFailure then mkdirFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence170005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence170005';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'mkdir';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|mkdir:/sandbox/com.samples.target|close:13');
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
          'mkdir:/sandbox/com.samples.target|' +
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE17_0600
     * @tc.name testAppFileBackupSequence170006
     * @tc.desc Verify mkdirFailure then mkdirFailure then storeCopyFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence170006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence170006';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'mkdir';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|mkdir:/sandbox/com.samples.target|close:13');
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
          'mkdir:/sandbox/com.samples.target|' +
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE17_0700
     * @tc.name testAppFileBackupSequence170007
     * @tc.desc Verify mkdirFailure then mkdirFailure then restoreCopyFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence170007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence170007';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'mkdir';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|mkdir:/sandbox/com.samples.target|close:13');
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
          'mkdir:/sandbox/com.samples.target|' +
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE17_0800
     * @tc.name testAppFileBackupSequence170008
     * @tc.desc Verify mkdirFailure then mkdirFailure then missingCopyFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence170008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence170008';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'mkdir';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|mkdir:/sandbox/com.samples.target|close:13');
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
          'mkdir:/sandbox/com.samples.target|' +
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE17_0900
     * @tc.name testAppFileBackupSequence170009
     * @tc.desc Verify mkdirFailure then storeCopyFailure then storeMissing with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence170009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence170009';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'mkdir';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|mkdir:/sandbox/com.samples.target|close:13');
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
          'mkdir:/sandbox/com.samples.target|' +
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE17_1000
     * @tc.name testAppFileBackupSequence170010
     * @tc.desc Verify mkdirFailure then storeCopyFailure then storeExisting with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence170010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence170010';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'mkdir';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|mkdir:/sandbox/com.samples.target|close:13');
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
          'mkdir:/sandbox/com.samples.target|' +
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE17_1100
     * @tc.name testAppFileBackupSequence170011
     * @tc.desc Verify mkdirFailure then storeCopyFailure then restore with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence170011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence170011';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'mkdir';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|mkdir:/sandbox/com.samples.target|close:13');
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE17_1200
     * @tc.name testAppFileBackupSequence170012
     * @tc.desc Verify mkdirFailure then storeCopyFailure then accessFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence170012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence170012';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'mkdir';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|mkdir:/sandbox/com.samples.target|close:13');
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE17_1300
     * @tc.name testAppFileBackupSequence170013
     * @tc.desc Verify mkdirFailure then storeCopyFailure then mkdirFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence170013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence170013';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'mkdir';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|mkdir:/sandbox/com.samples.target|close:13');
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE17_1400
     * @tc.name testAppFileBackupSequence170014
     * @tc.desc Verify mkdirFailure then storeCopyFailure then storeCopyFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence170014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence170014';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'mkdir';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|mkdir:/sandbox/com.samples.target|close:13');
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE17_1500
     * @tc.name testAppFileBackupSequence170015
     * @tc.desc Verify mkdirFailure then storeCopyFailure then restoreCopyFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence170015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence170015';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'mkdir';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|mkdir:/sandbox/com.samples.target|close:13');
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE17_1600
     * @tc.name testAppFileBackupSequence170016
     * @tc.desc Verify mkdirFailure then storeCopyFailure then missingCopyFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence170016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence170016';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'mkdir';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|mkdir:/sandbox/com.samples.target|close:13');
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE17_1700
     * @tc.name testAppFileBackupSequence170017
     * @tc.desc Verify mkdirFailure then restoreCopyFailure then storeMissing with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence170017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence170017';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'mkdir';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|mkdir:/sandbox/com.samples.target|close:13');
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
          restoreBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(true);
        expect(step2Result.error === io.operationError).assertEqual(true);
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE17_1800
     * @tc.name testAppFileBackupSequence170018
     * @tc.desc Verify mkdirFailure then restoreCopyFailure then storeExisting with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence170018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence170018';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'mkdir';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === io.operationError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|mkdir:/sandbox/com.samples.target|close:13');
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
          restoreBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(true);
        expect(step2Result.error === io.operationError).assertEqual(true);
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

  });
}
