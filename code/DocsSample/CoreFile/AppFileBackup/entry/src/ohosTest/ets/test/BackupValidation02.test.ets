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
export default function backupValidation02Test(): void {
  describe('AppFileBackupValidation02', (): void => {
    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION02_0100
     * @tc.name testAppFileBackupValidation020001
     * @tc.desc Reject invalid uri during store with successful cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation020001';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'folder//manage.json' };
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
        expect(file.uri).assertEqual('folder//manage.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION02_0200
     * @tc.name testAppFileBackupValidation020002
     * @tc.desc Reject invalid uri during store with successful cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation020002';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'manage.json/' };
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
        expect(file.uri).assertEqual('manage.json/');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION02_0300
     * @tc.name testAppFileBackupValidation020003
     * @tc.desc Reject invalid uri during store with successful cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation020003';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'folder/' };
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
        expect(file.uri).assertEqual('folder/');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION02_0400
     * @tc.name testAppFileBackupValidation020004
     * @tc.desc Reject invalid uri during store with successful cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation020004';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'folder\\manage.json' };
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
        expect(file.uri).assertEqual('folder\\manage.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION02_0500
     * @tc.name testAppFileBackupValidation020005
     * @tc.desc Reject invalid uri during store with successful cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation020005';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'manage\u0000.json' };
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
        expect(file.uri).assertEqual('manage\u0000.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION02_0600
     * @tc.name testAppFileBackupValidation020006
     * @tc.desc Reject invalid uri during store with successful cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation020006';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: '//manage.json' };
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
        expect(file.uri).assertEqual('//manage.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION02_0700
     * @tc.name testAppFileBackupValidation020007
     * @tc.desc Reject invalid bundle during store with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation020007';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: '', uri: 'manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = cleanupError;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
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
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION02_0800
     * @tc.name testAppFileBackupValidation020008
     * @tc.desc Reject invalid bundle during store with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation020008';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: '.', uri: 'manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = cleanupError;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
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
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION02_0900
     * @tc.name testAppFileBackupValidation020009
     * @tc.desc Reject invalid bundle during store with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation020009';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: '..', uri: 'manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = cleanupError;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
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
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION02_1000
     * @tc.name testAppFileBackupValidation020010
     * @tc.desc Reject invalid bundle during store with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation020010';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: '../target', uri: 'manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = cleanupError;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
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
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION02_1100
     * @tc.name testAppFileBackupValidation020011
     * @tc.desc Reject invalid bundle during store with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation020011';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'target/child', uri: 'manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = cleanupError;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
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
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION02_1200
     * @tc.name testAppFileBackupValidation020012
     * @tc.desc Reject invalid bundle during store with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation020012';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'target\\child', uri: 'manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = cleanupError;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
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
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION02_1300
     * @tc.name testAppFileBackupValidation020013
     * @tc.desc Reject invalid bundle during store with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation020013';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'target\u0000name', uri: 'manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = cleanupError;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
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
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION02_1400
     * @tc.name testAppFileBackupValidation020014
     * @tc.desc Reject invalid bundle during store with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation020014';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: '/absolute', uri: 'manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = cleanupError;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
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
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION02_1500
     * @tc.name testAppFileBackupValidation020015
     * @tc.desc Reject invalid bundle during store with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation020015';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples/target', uri: 'manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = cleanupError;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
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
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION02_1600
     * @tc.name testAppFileBackupValidation020016
     * @tc.desc Reject invalid bundle during store with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation020016';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples\\target', uri: 'manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = cleanupError;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
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
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION02_1700
     * @tc.name testAppFileBackupValidation020017
     * @tc.desc Reject invalid uri during store with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation020017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation020017';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: '' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = cleanupError;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
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
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION02_1800
     * @tc.name testAppFileBackupValidation020018
     * @tc.desc Reject invalid uri during store with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation020018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation020018';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: '.' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = cleanupError;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
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

  });
}
