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
export default function backupValidation05Test(): void {
  describe('AppFileBackupValidation05', (): void => {
    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION05_0100
     * @tc.name testAppFileBackupValidation050001
     * @tc.desc Reject invalid bundle during restore with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation050001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation050001';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: '', uri: 'manage.json' };
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
        expect(file.bundleName).assertEqual('');
        expect(file.uri).assertEqual('manage.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION05_0200
     * @tc.name testAppFileBackupValidation050002
     * @tc.desc Reject invalid bundle during restore with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation050002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation050002';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: '.', uri: 'manage.json' };
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
        expect(file.bundleName).assertEqual('.');
        expect(file.uri).assertEqual('manage.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION05_0300
     * @tc.name testAppFileBackupValidation050003
     * @tc.desc Reject invalid bundle during restore with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation050003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation050003';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: '..', uri: 'manage.json' };
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
        expect(file.bundleName).assertEqual('..');
        expect(file.uri).assertEqual('manage.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION05_0400
     * @tc.name testAppFileBackupValidation050004
     * @tc.desc Reject invalid bundle during restore with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation050004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation050004';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: '../target', uri: 'manage.json' };
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
        expect(file.bundleName).assertEqual('../target');
        expect(file.uri).assertEqual('manage.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION05_0500
     * @tc.name testAppFileBackupValidation050005
     * @tc.desc Reject invalid bundle during restore with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation050005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation050005';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'target/child', uri: 'manage.json' };
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
        expect(file.bundleName).assertEqual('target/child');
        expect(file.uri).assertEqual('manage.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION05_0600
     * @tc.name testAppFileBackupValidation050006
     * @tc.desc Reject invalid bundle during restore with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation050006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation050006';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'target\\child', uri: 'manage.json' };
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
        expect(file.bundleName).assertEqual('target\\child');
        expect(file.uri).assertEqual('manage.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION05_0700
     * @tc.name testAppFileBackupValidation050007
     * @tc.desc Reject invalid bundle during restore with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation050007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation050007';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'target\u0000name', uri: 'manage.json' };
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
        expect(file.bundleName).assertEqual('target\u0000name');
        expect(file.uri).assertEqual('manage.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION05_0800
     * @tc.name testAppFileBackupValidation050008
     * @tc.desc Reject invalid bundle during restore with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation050008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation050008';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: '/absolute', uri: 'manage.json' };
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
        expect(file.bundleName).assertEqual('/absolute');
        expect(file.uri).assertEqual('manage.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION05_0900
     * @tc.name testAppFileBackupValidation050009
     * @tc.desc Reject invalid bundle during restore with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation050009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation050009';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples/target', uri: 'manage.json' };
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
        expect(file.bundleName).assertEqual('com.samples/target');
        expect(file.uri).assertEqual('manage.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION05_1000
     * @tc.name testAppFileBackupValidation050010
     * @tc.desc Reject invalid bundle during restore with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation050010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation050010';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples\\target', uri: 'manage.json' };
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
        expect(file.bundleName).assertEqual('com.samples\\target');
        expect(file.uri).assertEqual('manage.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION05_1100
     * @tc.name testAppFileBackupValidation050011
     * @tc.desc Reject invalid uri during restore with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation050011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation050011';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: '' };
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
        expect(file.uri).assertEqual('');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION05_1200
     * @tc.name testAppFileBackupValidation050012
     * @tc.desc Reject invalid uri during restore with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation050012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation050012';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: '.' };
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
        expect(file.uri).assertEqual('.');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION05_1300
     * @tc.name testAppFileBackupValidation050013
     * @tc.desc Reject invalid uri during restore with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation050013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation050013';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: '..' };
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
        expect(file.uri).assertEqual('..');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION05_1400
     * @tc.name testAppFileBackupValidation050014
     * @tc.desc Reject invalid uri during restore with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation050014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation050014';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: '../manage.json' };
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
        expect(file.uri).assertEqual('../manage.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION05_1500
     * @tc.name testAppFileBackupValidation050015
     * @tc.desc Reject invalid uri during restore with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation050015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation050015';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'folder/../manage.json' };
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
        expect(file.uri).assertEqual('folder/../manage.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION05_1600
     * @tc.name testAppFileBackupValidation050016
     * @tc.desc Reject invalid uri during restore with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation050016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation050016';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: './manage.json' };
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
        expect(file.uri).assertEqual('./manage.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION05_1700
     * @tc.name testAppFileBackupValidation050017
     * @tc.desc Reject invalid uri during restore with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation050017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation050017';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'folder/./manage.json' };
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
        expect(file.uri).assertEqual('folder/./manage.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION05_1800
     * @tc.name testAppFileBackupValidation050018
     * @tc.desc Reject invalid uri during restore with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation050018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation050018';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: '/manage.json' };
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
        expect(file.uri).assertEqual('/manage.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });

  });
}
