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
export default function backupCleanup02Test(): void {
  describe('AppFileBackupCleanup02', (): void => {
    /**
     * @tc.number SUB_APP_FILE_BACKUP_CLEANUP02_0100
     * @tc.name testAppFileBackupCleanup020001
     * @tc.desc Verify cleanup rejection after restore and recovery through restore.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupCleanup020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupCleanup020001';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const cleanupError: Error = new Error('descriptor cleanup failed');
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = cleanupError;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === cleanupError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'copy:/sandbox/com.samples.target/manage.json->13|close:13');
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
        expect(io.events.join('|')).assertEqual(
          'copy:/sandbox/com.samples.target/manage.json->13|' +
          'close:13|' +
          'copy:/sandbox/com.samples.target/manage.json->26|' +
          'close:26');
        expect(io.closeError === undefined).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_CLEANUP02_0200
     * @tc.name testAppFileBackupCleanup020002
     * @tc.desc Verify cleanup rejection after restore and recovery through accessFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupCleanup020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupCleanup020002';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const cleanupError: Error = new Error('descriptor cleanup failed');
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = cleanupError;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === cleanupError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'copy:/sandbox/com.samples.target/manage.json->13|close:13');
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
        expect(io.events.join('|')).assertEqual(
          'copy:/sandbox/com.samples.target/manage.json->13|close:13|access:/sandbox/com.samples.target|close:26');
        expect(io.closeError === undefined).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_CLEANUP02_0300
     * @tc.name testAppFileBackupCleanup020003
     * @tc.desc Verify cleanup rejection after restore and recovery through mkdirFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupCleanup020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupCleanup020003';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const cleanupError: Error = new Error('descriptor cleanup failed');
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = cleanupError;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === cleanupError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'copy:/sandbox/com.samples.target/manage.json->13|close:13');
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
        expect(io.events.join('|')).assertEqual(
          'copy:/sandbox/com.samples.target/manage.json->13|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'close:26');
        expect(io.closeError === undefined).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_CLEANUP02_0400
     * @tc.name testAppFileBackupCleanup020004
     * @tc.desc Verify cleanup rejection after restore and recovery through storeCopyFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupCleanup020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupCleanup020004';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const cleanupError: Error = new Error('descriptor cleanup failed');
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = cleanupError;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === cleanupError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'copy:/sandbox/com.samples.target/manage.json->13|close:13');
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
        expect(io.events.join('|')).assertEqual(
          'copy:/sandbox/com.samples.target/manage.json->13|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'copy:26->/sandbox/com.samples.target/manage.json|' +
          'close:26');
        expect(io.closeError === undefined).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_CLEANUP02_0500
     * @tc.name testAppFileBackupCleanup020005
     * @tc.desc Verify cleanup rejection after restore and recovery through restoreCopyFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupCleanup020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupCleanup020005';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const cleanupError: Error = new Error('descriptor cleanup failed');
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = cleanupError;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === cleanupError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'copy:/sandbox/com.samples.target/manage.json->13|close:13');
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
        expect(io.events.join('|')).assertEqual(
          'copy:/sandbox/com.samples.target/manage.json->13|' +
          'close:13|' +
          'copy:/sandbox/com.samples.target/manage.json->26|' +
          'close:26');
        expect(io.closeError === undefined).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_CLEANUP02_0600
     * @tc.name testAppFileBackupCleanup020006
     * @tc.desc Verify cleanup rejection after restore and recovery through missingCopyFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupCleanup020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupCleanup020006';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const cleanupError: Error = new Error('descriptor cleanup failed');
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = true;
        io.failAt = '';
        io.closeError = cleanupError;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === cleanupError).assertEqual(true);
        expect(io.events.slice(step1Offset).join('|')).assertEqual(
          'copy:/sandbox/com.samples.target/manage.json->13|close:13');
        expect(io.copies.length - step1Copies).assertEqual(1);
        expect(io.events.filter((event: string): boolean => event === 'close:13').length).assertEqual(1);
        expect(step1File.fd).assertEqual(13);
        expect(step1File.bundleName).assertEqual('com.samples.target');
        expect(step1File.uri).assertEqual('manage.json');
        const step2File: BackupTransferFile = { fd: 26, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step2Offset: number = io.events.length;
        const step2Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'copy';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(true);
        expect(step2Result.error === io.operationError).assertEqual(true);
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
        expect(io.events.join('|')).assertEqual(
          'copy:/sandbox/com.samples.target/manage.json->13|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:26->/sandbox/com.samples.target/manage.json|' +
          'close:26');
        expect(io.closeError === undefined).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_CLEANUP02_0700
     * @tc.name testAppFileBackupCleanup020007
     * @tc.desc Verify cleanup rejection after accessFailure and recovery through storeMissing.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupCleanup020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupCleanup020007';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const cleanupError: Error = new Error('descriptor cleanup failed');
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = cleanupError;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === cleanupError).assertEqual(true);
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
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:26->/sandbox/com.samples.target/manage.json|' +
          'close:26');
        expect(io.closeError === undefined).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_CLEANUP02_0800
     * @tc.name testAppFileBackupCleanup020008
     * @tc.desc Verify cleanup rejection after accessFailure and recovery through storeExisting.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupCleanup020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupCleanup020008';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const cleanupError: Error = new Error('descriptor cleanup failed');
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = cleanupError;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === cleanupError).assertEqual(true);
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
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'copy:26->/sandbox/com.samples.target/manage.json|' +
          'close:26');
        expect(io.closeError === undefined).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_CLEANUP02_0900
     * @tc.name testAppFileBackupCleanup020009
     * @tc.desc Verify cleanup rejection after accessFailure and recovery through restore.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupCleanup020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupCleanup020009';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const cleanupError: Error = new Error('descriptor cleanup failed');
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = cleanupError;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === cleanupError).assertEqual(true);
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
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|close:13|copy:/sandbox/com.samples.target/manage.json->26|close:26');
        expect(io.closeError === undefined).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_CLEANUP02_1000
     * @tc.name testAppFileBackupCleanup020010
     * @tc.desc Verify cleanup rejection after accessFailure and recovery through accessFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupCleanup020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupCleanup020010';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const cleanupError: Error = new Error('descriptor cleanup failed');
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = cleanupError;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === cleanupError).assertEqual(true);
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
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|close:13|access:/sandbox/com.samples.target|close:26');
        expect(io.closeError === undefined).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_CLEANUP02_1100
     * @tc.name testAppFileBackupCleanup020011
     * @tc.desc Verify cleanup rejection after accessFailure and recovery through mkdirFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupCleanup020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupCleanup020011';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const cleanupError: Error = new Error('descriptor cleanup failed');
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = cleanupError;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === cleanupError).assertEqual(true);
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
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'close:26');
        expect(io.closeError === undefined).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_CLEANUP02_1200
     * @tc.name testAppFileBackupCleanup020012
     * @tc.desc Verify cleanup rejection after accessFailure and recovery through storeCopyFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupCleanup020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupCleanup020012';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const cleanupError: Error = new Error('descriptor cleanup failed');
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = cleanupError;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === cleanupError).assertEqual(true);
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
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'copy:26->/sandbox/com.samples.target/manage.json|' +
          'close:26');
        expect(io.closeError === undefined).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_CLEANUP02_1300
     * @tc.name testAppFileBackupCleanup020013
     * @tc.desc Verify cleanup rejection after accessFailure and recovery through restoreCopyFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupCleanup020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupCleanup020013';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const cleanupError: Error = new Error('descriptor cleanup failed');
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = cleanupError;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === cleanupError).assertEqual(true);
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
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|close:13|copy:/sandbox/com.samples.target/manage.json->26|close:26');
        expect(io.closeError === undefined).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_CLEANUP02_1400
     * @tc.name testAppFileBackupCleanup020014
     * @tc.desc Verify cleanup rejection after accessFailure and recovery through missingCopyFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupCleanup020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupCleanup020014';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const cleanupError: Error = new Error('descriptor cleanup failed');
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'access';
        io.closeError = cleanupError;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === cleanupError).assertEqual(true);
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
        io.failAt = 'copy';
        io.closeError = undefined;
        const step2Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step2File, io));
        expect(step2Result.threw).assertEqual(true);
        expect(step2Result.error === io.operationError).assertEqual(true);
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
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:26->/sandbox/com.samples.target/manage.json|' +
          'close:26');
        expect(io.closeError === undefined).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_CLEANUP02_1500
     * @tc.name testAppFileBackupCleanup020015
     * @tc.desc Verify cleanup rejection after mkdirFailure and recovery through storeMissing.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupCleanup020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupCleanup020015';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const cleanupError: Error = new Error('descriptor cleanup failed');
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'mkdir';
        io.closeError = cleanupError;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === cleanupError).assertEqual(true);
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
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:26->/sandbox/com.samples.target/manage.json|' +
          'close:26');
        expect(io.closeError === undefined).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_CLEANUP02_1600
     * @tc.name testAppFileBackupCleanup020016
     * @tc.desc Verify cleanup rejection after mkdirFailure and recovery through storeExisting.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupCleanup020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupCleanup020016';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const cleanupError: Error = new Error('descriptor cleanup failed');
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'mkdir';
        io.closeError = cleanupError;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === cleanupError).assertEqual(true);
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
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'copy:26->/sandbox/com.samples.target/manage.json|' +
          'close:26');
        expect(io.closeError === undefined).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_CLEANUP02_1700
     * @tc.name testAppFileBackupCleanup020017
     * @tc.desc Verify cleanup rejection after mkdirFailure and recovery through restore.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupCleanup020017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupCleanup020017';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const cleanupError: Error = new Error('descriptor cleanup failed');
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'mkdir';
        io.closeError = cleanupError;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === cleanupError).assertEqual(true);
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
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'close:13|' +
          'copy:/sandbox/com.samples.target/manage.json->26|' +
          'close:26');
        expect(io.closeError === undefined).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_CLEANUP02_1800
     * @tc.name testAppFileBackupCleanup020018
     * @tc.desc Verify cleanup rejection after mkdirFailure and recovery through accessFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupCleanup020018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupCleanup020018';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const cleanupError: Error = new Error('descriptor cleanup failed');
        const step1File: BackupTransferFile = { fd: 13, bundleName: 'com.samples.target', uri: 'manage.json' };
        const step1Offset: number = io.events.length;
        const step1Copies: number = io.copies.length;
        io.exists = false;
        io.failAt = 'mkdir';
        io.closeError = cleanupError;
        const step1Result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', step1File, io));
        expect(step1Result.threw).assertEqual(true);
        expect(step1Result.error === cleanupError).assertEqual(true);
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
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'close:13|' +
          'access:/sandbox/com.samples.target|' +
          'close:26');
        expect(io.closeError === undefined).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

  });
}
