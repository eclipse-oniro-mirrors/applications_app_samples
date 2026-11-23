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
export default function backupPath02Test(): void {
  describe('AppFileBackupPath02', (): void => {
    /**
     * @tc.number SUB_APP_FILE_BACKUP_PATH02_0100
     * @tc.name testAppFileBackupPath020001
     * @tc.desc Preserve valid literal archive paths for store with existing directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath020001';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = true;
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'archive..tar' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:0->/sandbox/com.samples.target/archive..tar|close:0');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual(0);
        expect(io.copies[0].destination).assertEqual('/sandbox/com.samples.target/archive..tar');
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('archive..tar');
        expect(io.events.filter((event: string): boolean => event === 'close:0').length).assertEqual(1);
        expect(io.exists).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_PATH02_0200
     * @tc.name testAppFileBackupPath020002
     * @tc.desc Preserve valid literal archive paths for store with existing directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath020002';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = true;
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'space name.tar' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:0->/sandbox/com.samples.target/space name.tar|close:0');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual(0);
        expect(io.copies[0].destination).assertEqual('/sandbox/com.samples.target/space name.tar');
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('space name.tar');
        expect(io.events.filter((event: string): boolean => event === 'close:0').length).assertEqual(1);
        expect(io.exists).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_PATH02_0300
     * @tc.name testAppFileBackupPath020003
     * @tc.desc Preserve valid literal archive paths for store with existing directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath020003';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = true;
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: '%2e%2e/archive.tar' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:0->/sandbox/com.samples.target/%2e%2e/archive.tar|close:0');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual(0);
        expect(io.copies[0].destination).assertEqual('/sandbox/com.samples.target/%2e%2e/archive.tar');
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('%2e%2e/archive.tar');
        expect(io.events.filter((event: string): boolean => event === 'close:0').length).assertEqual(1);
        expect(io.exists).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_PATH02_0400
     * @tc.name testAppFileBackupPath020004
     * @tc.desc Preserve valid literal archive paths for store with existing directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath020004';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = true;
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'archive%2Fname.tar' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:0->/sandbox/com.samples.target/archive%2Fname.tar|close:0');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual(0);
        expect(io.copies[0].destination).assertEqual('/sandbox/com.samples.target/archive%2Fname.tar');
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('archive%2Fname.tar');
        expect(io.events.filter((event: string): boolean => event === 'close:0').length).assertEqual(1);
        expect(io.exists).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_PATH02_0500
     * @tc.name testAppFileBackupPath020005
     * @tc.desc Preserve valid literal archive paths for store with existing directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath020005';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = true;
        const file: BackupTransferFile = { fd: 0, bundleName: 'target', uri: 'manage.json' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual('access:/sandbox/target|copy:0->/sandbox/target/manage.json|close:0');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual(0);
        expect(io.copies[0].destination).assertEqual('/sandbox/target/manage.json');
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('target');
        expect(file.uri).assertEqual('manage.json');
        expect(io.events.filter((event: string): boolean => event === 'close:0').length).assertEqual(1);
        expect(io.exists).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_PATH02_0600
     * @tc.name testAppFileBackupPath020006
     * @tc.desc Preserve valid literal archive paths for store with existing directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath020006';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = true;
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target-v2', uri: 'manage.json' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target-v2|copy:0->/sandbox/com.samples.target-v2/manage.json|close:0');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual(0);
        expect(io.copies[0].destination).assertEqual('/sandbox/com.samples.target-v2/manage.json');
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target-v2');
        expect(file.uri).assertEqual('manage.json');
        expect(io.events.filter((event: string): boolean => event === 'close:0').length).assertEqual(1);
        expect(io.exists).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_PATH02_0700
     * @tc.name testAppFileBackupPath020007
     * @tc.desc Preserve valid literal archive paths for restore with absent directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath020007';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = false;
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'manage.json' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual('copy:/sandbox/com.samples.target/manage.json->0|close:0');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual('/sandbox/com.samples.target/manage.json');
        expect(io.copies[0].destination).assertEqual(0);
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('manage.json');
        expect(io.events.filter((event: string): boolean => event === 'close:0').length).assertEqual(1);
        expect(io.exists).assertEqual(false);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_PATH02_0800
     * @tc.name testAppFileBackupPath020008
     * @tc.desc Preserve valid literal archive paths for restore with absent directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath020008';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = false;
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'part.0.tar' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual('copy:/sandbox/com.samples.target/part.0.tar->0|close:0');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual('/sandbox/com.samples.target/part.0.tar');
        expect(io.copies[0].destination).assertEqual(0);
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('part.0.tar');
        expect(io.events.filter((event: string): boolean => event === 'close:0').length).assertEqual(1);
        expect(io.exists).assertEqual(false);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_PATH02_0900
     * @tc.name testAppFileBackupPath020009
     * @tc.desc Preserve valid literal archive paths for restore with absent directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath020009';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = false;
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'nested/manage.json' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual('copy:/sandbox/com.samples.target/nested/manage.json->0|close:0');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual('/sandbox/com.samples.target/nested/manage.json');
        expect(io.copies[0].destination).assertEqual(0);
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('nested/manage.json');
        expect(io.events.filter((event: string): boolean => event === 'close:0').length).assertEqual(1);
        expect(io.exists).assertEqual(false);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_PATH02_1000
     * @tc.name testAppFileBackupPath020010
     * @tc.desc Preserve valid literal archive paths for restore with absent directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath020010';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = false;
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'nested/archive/part.0.tar' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual(
          'copy:/sandbox/com.samples.target/nested/archive/part.0.tar->0|close:0');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual('/sandbox/com.samples.target/nested/archive/part.0.tar');
        expect(io.copies[0].destination).assertEqual(0);
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('nested/archive/part.0.tar');
        expect(io.events.filter((event: string): boolean => event === 'close:0').length).assertEqual(1);
        expect(io.exists).assertEqual(false);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_PATH02_1100
     * @tc.name testAppFileBackupPath020011
     * @tc.desc Preserve valid literal archive paths for restore with absent directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath020011';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = false;
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: '.hidden' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual('copy:/sandbox/com.samples.target/.hidden->0|close:0');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual('/sandbox/com.samples.target/.hidden');
        expect(io.copies[0].destination).assertEqual(0);
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('.hidden');
        expect(io.events.filter((event: string): boolean => event === 'close:0').length).assertEqual(1);
        expect(io.exists).assertEqual(false);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_PATH02_1200
     * @tc.name testAppFileBackupPath020012
     * @tc.desc Preserve valid literal archive paths for restore with absent directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath020012';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = false;
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: '..archive' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual('copy:/sandbox/com.samples.target/..archive->0|close:0');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual('/sandbox/com.samples.target/..archive');
        expect(io.copies[0].destination).assertEqual(0);
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('..archive');
        expect(io.events.filter((event: string): boolean => event === 'close:0').length).assertEqual(1);
        expect(io.exists).assertEqual(false);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_PATH02_1300
     * @tc.name testAppFileBackupPath020013
     * @tc.desc Preserve valid literal archive paths for restore with absent directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath020013';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = false;
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'archive..tar' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual('copy:/sandbox/com.samples.target/archive..tar->0|close:0');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual('/sandbox/com.samples.target/archive..tar');
        expect(io.copies[0].destination).assertEqual(0);
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('archive..tar');
        expect(io.events.filter((event: string): boolean => event === 'close:0').length).assertEqual(1);
        expect(io.exists).assertEqual(false);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_PATH02_1400
     * @tc.name testAppFileBackupPath020014
     * @tc.desc Preserve valid literal archive paths for restore with absent directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath020014';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = false;
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'space name.tar' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual('copy:/sandbox/com.samples.target/space name.tar->0|close:0');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual('/sandbox/com.samples.target/space name.tar');
        expect(io.copies[0].destination).assertEqual(0);
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('space name.tar');
        expect(io.events.filter((event: string): boolean => event === 'close:0').length).assertEqual(1);
        expect(io.exists).assertEqual(false);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_PATH02_1500
     * @tc.name testAppFileBackupPath020015
     * @tc.desc Preserve valid literal archive paths for restore with absent directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath020015';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = false;
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: '%2e%2e/archive.tar' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual('copy:/sandbox/com.samples.target/%2e%2e/archive.tar->0|close:0');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual('/sandbox/com.samples.target/%2e%2e/archive.tar');
        expect(io.copies[0].destination).assertEqual(0);
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('%2e%2e/archive.tar');
        expect(io.events.filter((event: string): boolean => event === 'close:0').length).assertEqual(1);
        expect(io.exists).assertEqual(false);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_PATH02_1600
     * @tc.name testAppFileBackupPath020016
     * @tc.desc Preserve valid literal archive paths for restore with absent directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath020016';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = false;
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'archive%2Fname.tar' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual('copy:/sandbox/com.samples.target/archive%2Fname.tar->0|close:0');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual('/sandbox/com.samples.target/archive%2Fname.tar');
        expect(io.copies[0].destination).assertEqual(0);
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('archive%2Fname.tar');
        expect(io.events.filter((event: string): boolean => event === 'close:0').length).assertEqual(1);
        expect(io.exists).assertEqual(false);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_PATH02_1700
     * @tc.name testAppFileBackupPath020017
     * @tc.desc Preserve valid literal archive paths for restore with absent directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath020017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath020017';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = false;
        const file: BackupTransferFile = { fd: 0, bundleName: 'target', uri: 'manage.json' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual('copy:/sandbox/target/manage.json->0|close:0');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual('/sandbox/target/manage.json');
        expect(io.copies[0].destination).assertEqual(0);
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('target');
        expect(file.uri).assertEqual('manage.json');
        expect(io.events.filter((event: string): boolean => event === 'close:0').length).assertEqual(1);
        expect(io.exists).assertEqual(false);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_PATH02_1800
     * @tc.name testAppFileBackupPath020018
     * @tc.desc Preserve valid literal archive paths for restore with absent directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath020018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath020018';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = false;
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target-v2', uri: 'manage.json' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          restoreBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual('copy:/sandbox/com.samples.target-v2/manage.json->0|close:0');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual('/sandbox/com.samples.target-v2/manage.json');
        expect(io.copies[0].destination).assertEqual(0);
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target-v2');
        expect(file.uri).assertEqual('manage.json');
        expect(io.events.filter((event: string): boolean => event === 'close:0').length).assertEqual(1);
        expect(io.exists).assertEqual(false);
      } finally {
        console.info(`${TAG} end`);
      }
    });

  });
}
