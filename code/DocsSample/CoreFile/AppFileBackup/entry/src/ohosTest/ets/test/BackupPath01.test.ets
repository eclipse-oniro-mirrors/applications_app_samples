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
export default function backupPath01Test(): void {
  describe('AppFileBackupPath01', (): void => {
    /**
     * @tc.number SUB_APP_FILE_BACKUP_PATH01_0100
     * @tc.name testAppFileBackupPath010001
     * @tc.desc Preserve valid literal archive paths for store with absent directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath010001';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = false;
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'manage.json' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:0->/sandbox/com.samples.target/manage.json|' +
          'close:0');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual(0);
        expect(io.copies[0].destination).assertEqual('/sandbox/com.samples.target/manage.json');
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('manage.json');
        expect(io.events.filter((event: string): boolean => event === 'close:0').length).assertEqual(1);
        expect(io.exists).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_PATH01_0200
     * @tc.name testAppFileBackupPath010002
     * @tc.desc Preserve valid literal archive paths for store with absent directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath010002';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = false;
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'part.0.tar' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:0->/sandbox/com.samples.target/part.0.tar|' +
          'close:0');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual(0);
        expect(io.copies[0].destination).assertEqual('/sandbox/com.samples.target/part.0.tar');
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('part.0.tar');
        expect(io.events.filter((event: string): boolean => event === 'close:0').length).assertEqual(1);
        expect(io.exists).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_PATH01_0300
     * @tc.name testAppFileBackupPath010003
     * @tc.desc Preserve valid literal archive paths for store with absent directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath010003';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = false;
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'nested/manage.json' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:0->/sandbox/com.samples.target/nested/manage.json|' +
          'close:0');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual(0);
        expect(io.copies[0].destination).assertEqual('/sandbox/com.samples.target/nested/manage.json');
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('nested/manage.json');
        expect(io.events.filter((event: string): boolean => event === 'close:0').length).assertEqual(1);
        expect(io.exists).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_PATH01_0400
     * @tc.name testAppFileBackupPath010004
     * @tc.desc Preserve valid literal archive paths for store with absent directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath010004';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = false;
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'nested/archive/part.0.tar' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:0->/sandbox/com.samples.target/nested/archive/part.0.tar|' +
          'close:0');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual(0);
        expect(io.copies[0].destination).assertEqual('/sandbox/com.samples.target/nested/archive/part.0.tar');
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('nested/archive/part.0.tar');
        expect(io.events.filter((event: string): boolean => event === 'close:0').length).assertEqual(1);
        expect(io.exists).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_PATH01_0500
     * @tc.name testAppFileBackupPath010005
     * @tc.desc Preserve valid literal archive paths for store with absent directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath010005';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = false;
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: '.hidden' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:0->/sandbox/com.samples.target/.hidden|' +
          'close:0');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual(0);
        expect(io.copies[0].destination).assertEqual('/sandbox/com.samples.target/.hidden');
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('.hidden');
        expect(io.events.filter((event: string): boolean => event === 'close:0').length).assertEqual(1);
        expect(io.exists).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_PATH01_0600
     * @tc.name testAppFileBackupPath010006
     * @tc.desc Preserve valid literal archive paths for store with absent directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath010006';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = false;
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: '..archive' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:0->/sandbox/com.samples.target/..archive|' +
          'close:0');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual(0);
        expect(io.copies[0].destination).assertEqual('/sandbox/com.samples.target/..archive');
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('..archive');
        expect(io.events.filter((event: string): boolean => event === 'close:0').length).assertEqual(1);
        expect(io.exists).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_PATH01_0700
     * @tc.name testAppFileBackupPath010007
     * @tc.desc Preserve valid literal archive paths for store with absent directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath010007';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = false;
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'archive..tar' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:0->/sandbox/com.samples.target/archive..tar|' +
          'close:0');
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
     * @tc.number SUB_APP_FILE_BACKUP_PATH01_0800
     * @tc.name testAppFileBackupPath010008
     * @tc.desc Preserve valid literal archive paths for store with absent directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath010008';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = false;
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'space name.tar' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:0->/sandbox/com.samples.target/space name.tar|' +
          'close:0');
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
     * @tc.number SUB_APP_FILE_BACKUP_PATH01_0900
     * @tc.name testAppFileBackupPath010009
     * @tc.desc Preserve valid literal archive paths for store with absent directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath010009';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = false;
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: '%2e%2e/archive.tar' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:0->/sandbox/com.samples.target/%2e%2e/archive.tar|' +
          'close:0');
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
     * @tc.number SUB_APP_FILE_BACKUP_PATH01_1000
     * @tc.name testAppFileBackupPath010010
     * @tc.desc Preserve valid literal archive paths for store with absent directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath010010';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = false;
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'archive%2Fname.tar' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|' +
          'mkdir:/sandbox/com.samples.target|' +
          'copy:0->/sandbox/com.samples.target/archive%2Fname.tar|' +
          'close:0');
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
     * @tc.number SUB_APP_FILE_BACKUP_PATH01_1100
     * @tc.name testAppFileBackupPath010011
     * @tc.desc Preserve valid literal archive paths for store with absent directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath010011';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = false;
        const file: BackupTransferFile = { fd: 0, bundleName: 'target', uri: 'manage.json' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/target|mkdir:/sandbox/target|copy:0->/sandbox/target/manage.json|close:0');
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
     * @tc.number SUB_APP_FILE_BACKUP_PATH01_1200
     * @tc.name testAppFileBackupPath010012
     * @tc.desc Preserve valid literal archive paths for store with absent directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath010012';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = false;
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target-v2', uri: 'manage.json' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target-v2|' +
          'mkdir:/sandbox/com.samples.target-v2|' +
          'copy:0->/sandbox/com.samples.target-v2/manage.json|' +
          'close:0');
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
     * @tc.number SUB_APP_FILE_BACKUP_PATH01_1300
     * @tc.name testAppFileBackupPath010013
     * @tc.desc Preserve valid literal archive paths for store with existing directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath010013';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = true;
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'manage.json' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:0->/sandbox/com.samples.target/manage.json|close:0');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual(0);
        expect(io.copies[0].destination).assertEqual('/sandbox/com.samples.target/manage.json');
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('manage.json');
        expect(io.events.filter((event: string): boolean => event === 'close:0').length).assertEqual(1);
        expect(io.exists).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_PATH01_1400
     * @tc.name testAppFileBackupPath010014
     * @tc.desc Preserve valid literal archive paths for store with existing directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath010014';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = true;
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'part.0.tar' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:0->/sandbox/com.samples.target/part.0.tar|close:0');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual(0);
        expect(io.copies[0].destination).assertEqual('/sandbox/com.samples.target/part.0.tar');
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('part.0.tar');
        expect(io.events.filter((event: string): boolean => event === 'close:0').length).assertEqual(1);
        expect(io.exists).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_PATH01_1500
     * @tc.name testAppFileBackupPath010015
     * @tc.desc Preserve valid literal archive paths for store with existing directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath010015';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = true;
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'nested/manage.json' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:0->/sandbox/com.samples.target/nested/manage.json|close:0');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual(0);
        expect(io.copies[0].destination).assertEqual('/sandbox/com.samples.target/nested/manage.json');
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('nested/manage.json');
        expect(io.events.filter((event: string): boolean => event === 'close:0').length).assertEqual(1);
        expect(io.exists).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_PATH01_1600
     * @tc.name testAppFileBackupPath010016
     * @tc.desc Preserve valid literal archive paths for store with existing directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath010016';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = true;
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: 'nested/archive/part.0.tar' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:0->/sandbox/com.samples.target/nested/archive/part.0.tar|close:0');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual(0);
        expect(io.copies[0].destination).assertEqual('/sandbox/com.samples.target/nested/archive/part.0.tar');
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('nested/archive/part.0.tar');
        expect(io.events.filter((event: string): boolean => event === 'close:0').length).assertEqual(1);
        expect(io.exists).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_PATH01_1700
     * @tc.name testAppFileBackupPath010017
     * @tc.desc Preserve valid literal archive paths for store with existing directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath010017';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = true;
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: '.hidden' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:0->/sandbox/com.samples.target/.hidden|close:0');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual(0);
        expect(io.copies[0].destination).assertEqual('/sandbox/com.samples.target/.hidden');
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('.hidden');
        expect(io.events.filter((event: string): boolean => event === 'close:0').length).assertEqual(1);
        expect(io.exists).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

    /**
     * @tc.number SUB_APP_FILE_BACKUP_PATH01_1800
     * @tc.name testAppFileBackupPath010018
     * @tc.desc Preserve valid literal archive paths for store with existing directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAppFileBackupPath010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testAppFileBackupPath010018';
      console.info(`${TAG} start`);
      try {
        const io: RecordingBackupIo = new RecordingBackupIo();
        io.exists = true;
        const file: BackupTransferFile = { fd: 0, bundleName: 'com.samples.target', uri: '..archive' };
        const result: BackupTransferOutcome = captureTransfer((): void =>
          storeBackupFile('/sandbox', file, io));
        expect(result.threw).assertEqual(false);
        expect(result.error === undefined).assertEqual(true);
        expect(io.events.join('|')).assertEqual(
          'access:/sandbox/com.samples.target|copy:0->/sandbox/com.samples.target/..archive|close:0');
        expect(io.copies.length).assertEqual(1);
        expect(io.copies[0].source).assertEqual(0);
        expect(io.copies[0].destination).assertEqual('/sandbox/com.samples.target/..archive');
        expect(file.fd).assertEqual(0);
        expect(file.bundleName).assertEqual('com.samples.target');
        expect(file.uri).assertEqual('..archive');
        expect(io.events.filter((event: string): boolean => event === 'close:0').length).assertEqual(1);
        expect(io.exists).assertEqual(true);
      } finally {
        console.info(`${TAG} end`);
      }
    });

  });
}
