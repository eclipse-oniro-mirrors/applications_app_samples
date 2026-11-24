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
export default function backupSequence06Test(): void {
  describe('AppFileBackupSequence06', (): void => {
    /**
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE06_0100
     * @tc.name testAppFileBackupSequence060001
     * @tc.desc Verify storeExisting then accessFailure then restore with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence060001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence060001';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(false);
        expect(step1Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:13->/sandbox/com.samples.target/manage.json|close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
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
          'copy:13->/sandbox/com.samples.target/manage.json|' +
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE06_0200
     * @tc.name testAppFileBackupSequence060002
     * @tc.desc Verify storeExisting then accessFailure then accessFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence060002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence060002';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(false);
        expect(step1Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:13->/sandbox/com.samples.target/manage.json|close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
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
          'copy:13->/sandbox/com.samples.target/manage.json|' +
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE06_0300
     * @tc.name testAppFileBackupSequence060003
     * @tc.desc Verify storeExisting then accessFailure then mkdirFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence060003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence060003';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(false);
        expect(step1Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:13->/sandbox/com.samples.target/manage.json|close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
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
          'copy:13->/sandbox/com.samples.target/manage.json|' +
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE06_0400
     * @tc.name testAppFileBackupSequence060004
     * @tc.desc Verify storeExisting then accessFailure then storeCopyFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence060004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence060004';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(false);
        expect(step1Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:13->/sandbox/com.samples.target/manage.json|close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
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
          'copy:13->/sandbox/com.samples.target/manage.json|' +
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE06_0500
     * @tc.name testAppFileBackupSequence060005
     * @tc.desc Verify storeExisting then accessFailure then restoreCopyFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence060005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence060005';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(false);
        expect(step1Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:13->/sandbox/com.samples.target/manage.json|close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
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
          'copy:13->/sandbox/com.samples.target/manage.json|' +
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE06_0600
     * @tc.name testAppFileBackupSequence060006
     * @tc.desc Verify storeExisting then accessFailure then missingCopyFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence060006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence060006';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(false);
        expect(step1Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:13->/sandbox/com.samples.target/manage.json|close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
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
          'copy:13->/sandbox/com.samples.target/manage.json|' +
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE06_0700
     * @tc.name testAppFileBackupSequence060007
     * @tc.desc Verify storeExisting then mkdirFailure then storeMissing with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence060007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence060007';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(false);
        expect(step1Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:13->/sandbox/com.samples.target/manage.json|close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
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
          'copy:13->/sandbox/com.samples.target/manage.json|' +
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE06_0800
     * @tc.name testAppFileBackupSequence060008
     * @tc.desc Verify storeExisting then mkdirFailure then storeExisting with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence060008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence060008';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(false);
        expect(step1Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:13->/sandbox/com.samples.target/manage.json|close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
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
          'copy:13->/sandbox/com.samples.target/manage.json|' +
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE06_0900
     * @tc.name testAppFileBackupSequence060009
     * @tc.desc Verify storeExisting then mkdirFailure then restore with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence060009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence060009';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(false);
        expect(step1Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:13->/sandbox/com.samples.target/manage.json|close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
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
          'copy:13->/sandbox/com.samples.target/manage.json|' +
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE06_1000
     * @tc.name testAppFileBackupSequence060010
     * @tc.desc Verify storeExisting then mkdirFailure then accessFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence060010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence060010';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(false);
        expect(step1Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:13->/sandbox/com.samples.target/manage.json|close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
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
          'copy:13->/sandbox/com.samples.target/manage.json|' +
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE06_1100
     * @tc.name testAppFileBackupSequence060011
     * @tc.desc Verify storeExisting then mkdirFailure then mkdirFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence060011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence060011';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(false);
        expect(step1Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:13->/sandbox/com.samples.target/manage.json|close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
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
          'copy:13->/sandbox/com.samples.target/manage.json|' +
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE06_1200
     * @tc.name testAppFileBackupSequence060012
     * @tc.desc Verify storeExisting then mkdirFailure then storeCopyFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence060012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence060012';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(false);
        expect(step1Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:13->/sandbox/com.samples.target/manage.json|close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
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
          'copy:13->/sandbox/com.samples.target/manage.json|' +
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE06_1300
     * @tc.name testAppFileBackupSequence060013
     * @tc.desc Verify storeExisting then mkdirFailure then restoreCopyFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence060013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence060013';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(false);
        expect(step1Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:13->/sandbox/com.samples.target/manage.json|close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
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
          'copy:13->/sandbox/com.samples.target/manage.json|' +
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE06_1400
     * @tc.name testAppFileBackupSequence060014
     * @tc.desc Verify storeExisting then mkdirFailure then missingCopyFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence060014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence060014';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(false);
        expect(step1Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:13->/sandbox/com.samples.target/manage.json|close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
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
          'copy:13->/sandbox/com.samples.target/manage.json|' +
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE06_1500
     * @tc.name testAppFileBackupSequence060015
     * @tc.desc Verify storeExisting then storeCopyFailure then storeMissing with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence060015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence060015';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(false);
        expect(step1Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:13->/sandbox/com.samples.target/manage.json|close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE06_1600
     * @tc.name testAppFileBackupSequence060016
     * @tc.desc Verify storeExisting then storeCopyFailure then storeExisting with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence060016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence060016';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(false);
        expect(step1Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:13->/sandbox/com.samples.target/manage.json|close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE06_1700
     * @tc.name testAppFileBackupSequence060017
     * @tc.desc Verify storeExisting then storeCopyFailure then restore with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence060017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence060017';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(false);
        expect(step1Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:13->/sandbox/com.samples.target/manage.json|close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
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
     * @tc.number SUB_APP_FILE_BACKUP_SEQUENCE06_1800
     * @tc.name testAppFileBackupSequence060018
     * @tc.desc Verify storeExisting then storeCopyFailure then accessFailure with isolated cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupSequence060018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupSequence060018';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = undefined;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(false);
        expect(step1Result.error === undefined).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:13->/sandbox/com.samples.target/manage.json|close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
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

  });
}
