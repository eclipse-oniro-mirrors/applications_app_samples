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
export default function backupValidation06Test(): void {
  describe('AppFileBackupValidation06', (): void => {
    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION06_0100
     * @tc.name testAppFileBackupValidation060001
     * @tc.desc Reject invalid uri during restore with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation060001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation060001';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'folder//manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = cleanupError;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(true);
        expect(result.error?.message).assertEqual('cleanup precedence');
        expect(result.error === cleanupError).assertEqual(true);
        expect(io.events.join('|')).assertEqual('close:0');
        expect(io.copies.length).assertEqual(0);
        expect(io.exists).assertEqual(false);
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('folder//manage.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION06_0200
     * @tc.name testAppFileBackupValidation060002
     * @tc.desc Reject invalid uri during restore with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation060002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation060002';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'manage.json/' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = cleanupError;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(true);
        expect(result.error?.message).assertEqual('cleanup precedence');
        expect(result.error === cleanupError).assertEqual(true);
        expect(io.events.join('|')).assertEqual('close:0');
        expect(io.copies.length).assertEqual(0);
        expect(io.exists).assertEqual(false);
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('manage.json/');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION06_0300
     * @tc.name testAppFileBackupValidation060003
     * @tc.desc Reject invalid uri during restore with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation060003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation060003';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'folder/' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = cleanupError;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(true);
        expect(result.error?.message).assertEqual('cleanup precedence');
        expect(result.error === cleanupError).assertEqual(true);
        expect(io.events.join('|')).assertEqual('close:0');
        expect(io.copies.length).assertEqual(0);
        expect(io.exists).assertEqual(false);
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('folder/');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION06_0400
     * @tc.name testAppFileBackupValidation060004
     * @tc.desc Reject invalid uri during restore with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation060004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation060004';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'folder\\manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = cleanupError;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(true);
        expect(result.error?.message).assertEqual('cleanup precedence');
        expect(result.error === cleanupError).assertEqual(true);
        expect(io.events.join('|')).assertEqual('close:0');
        expect(io.copies.length).assertEqual(0);
        expect(io.exists).assertEqual(false);
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('folder\\manage.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION06_0500
     * @tc.name testAppFileBackupValidation060005
     * @tc.desc Reject invalid uri during restore with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation060005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation060005';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'manage\u0000.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = cleanupError;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(true);
        expect(result.error?.message).assertEqual('cleanup precedence');
        expect(result.error === cleanupError).assertEqual(true);
        expect(io.events.join('|')).assertEqual('close:0');
        expect(io.copies.length).assertEqual(0);
        expect(io.exists).assertEqual(false);
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('manage\u0000.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION06_0600
     * @tc.name testAppFileBackupValidation060006
     * @tc.desc Reject invalid uri during restore with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation060006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation060006';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: '//manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = cleanupError;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(true);
        expect(result.error?.message).assertEqual('cleanup precedence');
        expect(result.error === cleanupError).assertEqual(true);
        expect(io.events.join('|')).assertEqual('close:0');
        expect(io.copies.length).assertEqual(0);
        expect(io.exists).assertEqual(false);
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('//manage.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });

  });
}
