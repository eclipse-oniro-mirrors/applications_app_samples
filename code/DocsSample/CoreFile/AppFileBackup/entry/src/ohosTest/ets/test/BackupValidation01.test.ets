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
export default function backupValidation01Test(): void {
  describe('AppFileBackupValidation01', (): void => {
    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION01_0100
     * @tc.name testAppFileBackupValidation010001
     * @tc.desc Reject invalid bundle during store with successful cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation010001';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: '', uri: 'manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = undefined;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(true);
        expect(result.error?.message).assertEqual('Invalid backup bundle name');
        expect(result.error === cleanupError).assertEqual(false);
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
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION01_0200
     * @tc.name testAppFileBackupValidation010002
     * @tc.desc Reject invalid bundle during store with successful cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation010002';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: '.', uri: 'manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = undefined;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(true);
        expect(result.error?.message).assertEqual('Invalid backup bundle name');
        expect(result.error === cleanupError).assertEqual(false);
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
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION01_0300
     * @tc.name testAppFileBackupValidation010003
     * @tc.desc Reject invalid bundle during store with successful cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation010003';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: '..', uri: 'manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = undefined;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(true);
        expect(result.error?.message).assertEqual('Invalid backup bundle name');
        expect(result.error === cleanupError).assertEqual(false);
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
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION01_0400
     * @tc.name testAppFileBackupValidation010004
     * @tc.desc Reject invalid bundle during store with successful cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation010004';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: '../target', uri: 'manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = undefined;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(true);
        expect(result.error?.message).assertEqual('Invalid backup bundle name');
        expect(result.error === cleanupError).assertEqual(false);
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
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION01_0500
     * @tc.name testAppFileBackupValidation010005
     * @tc.desc Reject invalid bundle during store with successful cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation010005';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'target/child', uri: 'manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = undefined;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(true);
        expect(result.error?.message).assertEqual('Invalid backup bundle name');
        expect(result.error === cleanupError).assertEqual(false);
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
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION01_0600
     * @tc.name testAppFileBackupValidation010006
     * @tc.desc Reject invalid bundle during store with successful cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation010006';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'target\\child', uri: 'manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = undefined;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(true);
        expect(result.error?.message).assertEqual('Invalid backup bundle name');
        expect(result.error === cleanupError).assertEqual(false);
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
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION01_0700
     * @tc.name testAppFileBackupValidation010007
     * @tc.desc Reject invalid bundle during store with successful cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation010007';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'target\u0000name', uri: 'manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = undefined;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(true);
        expect(result.error?.message).assertEqual('Invalid backup bundle name');
        expect(result.error === cleanupError).assertEqual(false);
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
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION01_0800
     * @tc.name testAppFileBackupValidation010008
     * @tc.desc Reject invalid bundle during store with successful cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation010008';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: '/absolute', uri: 'manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = undefined;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(true);
        expect(result.error?.message).assertEqual('Invalid backup bundle name');
        expect(result.error === cleanupError).assertEqual(false);
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
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION01_0900
     * @tc.name testAppFileBackupValidation010009
     * @tc.desc Reject invalid bundle during store with successful cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation010009';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples/target', uri: 'manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = undefined;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(true);
        expect(result.error?.message).assertEqual('Invalid backup bundle name');
        expect(result.error === cleanupError).assertEqual(false);
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
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION01_1000
     * @tc.name testAppFileBackupValidation010010
     * @tc.desc Reject invalid bundle during store with successful cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation010010';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples\\target', uri: 'manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = undefined;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(true);
        expect(result.error?.message).assertEqual('Invalid backup bundle name');
        expect(result.error === cleanupError).assertEqual(false);
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
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION01_1100
     * @tc.name testAppFileBackupValidation010011
     * @tc.desc Reject invalid uri during store with successful cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation010011';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: '' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = undefined;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(true);
        expect(result.error?.message).assertEqual('Invalid backup file URI');
        expect(result.error === cleanupError).assertEqual(false);
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
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION01_1200
     * @tc.name testAppFileBackupValidation010012
     * @tc.desc Reject invalid uri during store with successful cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation010012';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: '.' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = undefined;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(true);
        expect(result.error?.message).assertEqual('Invalid backup file URI');
        expect(result.error === cleanupError).assertEqual(false);
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
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION01_1300
     * @tc.name testAppFileBackupValidation010013
     * @tc.desc Reject invalid uri during store with successful cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation010013';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: '..' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = undefined;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(true);
        expect(result.error?.message).assertEqual('Invalid backup file URI');
        expect(result.error === cleanupError).assertEqual(false);
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
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION01_1400
     * @tc.name testAppFileBackupValidation010014
     * @tc.desc Reject invalid uri during store with successful cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation010014';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: '../manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = undefined;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(true);
        expect(result.error?.message).assertEqual('Invalid backup file URI');
        expect(result.error === cleanupError).assertEqual(false);
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
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION01_1500
     * @tc.name testAppFileBackupValidation010015
     * @tc.desc Reject invalid uri during store with successful cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation010015';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'folder/../manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = undefined;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(true);
        expect(result.error?.message).assertEqual('Invalid backup file URI');
        expect(result.error === cleanupError).assertEqual(false);
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
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION01_1600
     * @tc.name testAppFileBackupValidation010016
     * @tc.desc Reject invalid uri during store with successful cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation010016';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: './manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = undefined;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(true);
        expect(result.error?.message).assertEqual('Invalid backup file URI');
        expect(result.error === cleanupError).assertEqual(false);
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
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION01_1700
     * @tc.name testAppFileBackupValidation010017
     * @tc.desc Reject invalid uri during store with successful cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation010017';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'folder/./manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = undefined;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(true);
        expect(result.error?.message).assertEqual('Invalid backup file URI');
        expect(result.error === cleanupError).assertEqual(false);
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
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION01_1800
     * @tc.name testAppFileBackupValidation010018
     * @tc.desc Reject invalid uri during store with successful cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation010018';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: '/manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = undefined;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(true);
        expect(result.error?.message).assertEqual('Invalid backup file URI');
        expect(result.error === cleanupError).assertEqual(false);
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
