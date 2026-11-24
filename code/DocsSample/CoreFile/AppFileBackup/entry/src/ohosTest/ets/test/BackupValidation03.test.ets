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
export default function backupValidation03Test(): void {
  describe('AppFileBackupValidation03', (): void => {
    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION03_0100
     * @tc.name testAppFileBackupValidation030001
     * @tc.desc Reject invalid uri during store with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation030001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation030001';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: '..' };
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
        expect(file.uri).assertEqual('..');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION03_0200
     * @tc.name testAppFileBackupValidation030002
     * @tc.desc Reject invalid uri during store with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation030002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation030002';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: '../manage.json' };
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
        expect(file.uri).assertEqual('../manage.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION03_0300
     * @tc.name testAppFileBackupValidation030003
     * @tc.desc Reject invalid uri during store with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation030003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation030003';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'folder/../manage.json' };
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
        expect(file.uri).assertEqual('folder/../manage.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION03_0400
     * @tc.name testAppFileBackupValidation030004
     * @tc.desc Reject invalid uri during store with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation030004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation030004';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: './manage.json' };
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
        expect(file.uri).assertEqual('./manage.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION03_0500
     * @tc.name testAppFileBackupValidation030005
     * @tc.desc Reject invalid uri during store with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation030005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation030005';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'folder/./manage.json' };
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
        expect(file.uri).assertEqual('folder/./manage.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION03_0600
     * @tc.name testAppFileBackupValidation030006
     * @tc.desc Reject invalid uri during store with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation030006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation030006';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: '/manage.json' };
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
        expect(file.uri).assertEqual('/manage.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION03_0700
     * @tc.name testAppFileBackupValidation030007
     * @tc.desc Reject invalid uri during store with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation030007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation030007';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'folder//manage.json' };
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
        expect(file.uri).assertEqual('folder//manage.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION03_0800
     * @tc.name testAppFileBackupValidation030008
     * @tc.desc Reject invalid uri during store with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation030008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation030008';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'manage.json/' };
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
        expect(file.uri).assertEqual('manage.json/');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION03_0900
     * @tc.name testAppFileBackupValidation030009
     * @tc.desc Reject invalid uri during store with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation030009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation030009';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'folder/' };
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
        expect(file.uri).assertEqual('folder/');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION03_1000
     * @tc.name testAppFileBackupValidation030010
     * @tc.desc Reject invalid uri during store with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation030010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation030010';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'folder\\manage.json' };
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
        expect(file.uri).assertEqual('folder\\manage.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION03_1100
     * @tc.name testAppFileBackupValidation030011
     * @tc.desc Reject invalid uri during store with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation030011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation030011';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'manage\u0000.json' };
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
        expect(file.uri).assertEqual('manage\u0000.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION03_1200
     * @tc.name testAppFileBackupValidation030012
     * @tc.desc Reject invalid uri during store with failed cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation030012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation030012';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: '//manage.json' };
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
        expect(file.uri).assertEqual('//manage.json');
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION03_1300
     * @tc.name testAppFileBackupValidation030013
     * @tc.desc Reject invalid bundle during restore with successful cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation030013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation030013';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: '', uri: 'manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = undefined;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
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
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION03_1400
     * @tc.name testAppFileBackupValidation030014
     * @tc.desc Reject invalid bundle during restore with successful cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation030014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation030014';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: '.', uri: 'manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = undefined;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
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
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION03_1500
     * @tc.name testAppFileBackupValidation030015
     * @tc.desc Reject invalid bundle during restore with successful cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation030015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation030015';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: '..', uri: 'manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = undefined;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
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
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION03_1600
     * @tc.name testAppFileBackupValidation030016
     * @tc.desc Reject invalid bundle during restore with successful cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation030016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation030016';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: '../target', uri: 'manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = undefined;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
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
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION03_1700
     * @tc.name testAppFileBackupValidation030017
     * @tc.desc Reject invalid bundle during restore with successful cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation030017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation030017';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'target/child', uri: 'manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = undefined;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
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
     * @tc.number SUB_APP_FILE_BACKUP_VALIDATION03_1800
     * @tc.name testAppFileBackupValidation030018
     * @tc.desc Reject invalid bundle during restore with successful cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupValidation030018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupValidation030018';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        const file: BackupTransferFile = { fd: 0, bundleName: 'target\\child', uri: 'manage.json' };
        const cleanupError: Error = new Error('cleanup precedence');
        io.closeError = undefined;
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
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

  });
}
