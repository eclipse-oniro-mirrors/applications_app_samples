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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import fs from '@ohos.file.fs';
import util from '@ohos.util';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Logger from '../Logger';
import { BUNDLE, TAG } from '../common/TestConstant';
import { yieldToEventLoop } from '../common/TestYield';
import { ensureDir } from '../common/FileTestHelper';
/**
 * Positioned reads and writes on a single open file.
 * A media cache rewrites a small header without copying the payload, so the
 * file pointer rules matter: where a write lands, what the pointer reports and
 * how a read behaves at the end of the file.
 */
const BASE_DIR: string = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir +
  '/publish_random_cases';
function openFile(path: string): fs.RandomAccessFile {
  return fs.createRandomAccessFileSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
}
export default function randomAccessIoTest() {
  describe('RandomAccessIoTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
      ensureDir(BASE_DIR);
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_RANDOMIO_0100
     * @tc.name WriteThenCloseKeepsText001
     * @tc.desc Verify a positioned write is visible after the file is closed
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'WriteThenCloseKeepsText_001', 0, (): void => {
      Logger.info(TAG, 'WriteThenCloseKeepsText_001 begin');
      const path: string = ensureDir(BASE_DIR) + '/basic_write.txt';
      const file: fs.RandomAccessFile = openFile(path);
      file.writeSync('abcdef');
      file.close();
      expect(fs.readTextSync(path)).assertEqual('abcdef');
      fs.unlinkSync(path);
      Logger.info(TAG, 'WriteThenCloseKeepsText_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_RANDOMIO_0200
     * @tc.name WriteReportsByteCount002
     * @tc.desc Verify the write call reports the number of stored bytes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'WriteReportsByteCount_002', 0, (): void => {
      Logger.info(TAG, 'WriteReportsByteCount_002 begin');
      const path: string = ensureDir(BASE_DIR) + '/write_count.txt';
      const file: fs.RandomAccessFile = openFile(path);
      const written: number = file.writeSync('publish');
      file.close();
      expect(written).assertEqual(7);
      fs.unlinkSync(path);
      Logger.info(TAG, 'WriteReportsByteCount_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_RANDOMIO_0300
     * @tc.name PointerThenWriteOverwrites003
     * @tc.desc Verify a write after moving the pointer replaces only those bytes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PointerThenWriteOverwrites_003', 0, (): void => {
      Logger.info(TAG, 'PointerThenWriteOverwrites_003 begin');
      const path: string = ensureDir(BASE_DIR) + '/pointer_write.txt';
      const file: fs.RandomAccessFile = openFile(path);
      file.writeSync('abcdef');
      file.setFilePointer(2);
      file.writeSync('X');
      file.close();
      expect(fs.readTextSync(path)).assertEqual('abXdef');
      fs.unlinkSync(path);
      Logger.info(TAG, 'PointerThenWriteOverwrites_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_RANDOMIO_0400
     * @tc.name PointerThenReadWindow004
     * @tc.desc Verify a read starts at the position chosen by the setter
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PointerThenReadWindow_004', 0, (): void => {
      Logger.info(TAG, 'PointerThenReadWindow_004 begin');
      const path: string = ensureDir(BASE_DIR) + '/pointer_read.txt';
      const file: fs.RandomAccessFile = openFile(path);
      file.writeSync('abcdef');
      file.setFilePointer(2);
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      const count: number = file.readSync(buffer);
      const bytes: Uint8Array = new Uint8Array(buffer, 0, count);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual('cde');
      file.close();
      fs.unlinkSync(path);
      Logger.info(TAG, 'PointerThenReadWindow_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_RANDOMIO_0500
     * @tc.name PointerPastEndPadsZeros005
     * @tc.desc Verify bytes skipped by a forward pointer move are stored as zeros
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PointerPastEndPadsZeros_005', 0, (): void => {
      Logger.info(TAG, 'PointerPastEndPadsZeros_005 begin');
      const path: string = ensureDir(BASE_DIR) + '/pointer_pad.txt';
      const file: fs.RandomAccessFile = openFile(path);
      file.writeSync('ab');
      file.setFilePointer(5);
      file.writeSync('Z');
      file.setFilePointer(0);
      const buffer: ArrayBuffer = new ArrayBuffer(6);
      const count: number = file.readSync(buffer);
      const bytes: Uint8Array = new Uint8Array(buffer, 0, count);
      expect(count).assertEqual(6);
      expect(bytes[2]).assertEqual(0);
      expect(bytes[5]).assertEqual(90);
      file.close();
      fs.unlinkSync(path);
      Logger.info(TAG, 'PointerPastEndPadsZeros_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_RANDOMIO_0600
     * @tc.name ReadAtEndReturnsZero006
     * @tc.desc Verify a read at the end of the file reports no stored bytes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ReadAtEndReturnsZero_006', 0, (): void => {
      Logger.info(TAG, 'ReadAtEndReturnsZero_006 begin');
      const path: string = ensureDir(BASE_DIR) + '/read_end.txt';
      const file: fs.RandomAccessFile = openFile(path);
      file.writeSync('abc');
      file.setFilePointer(3);
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      expect(file.readSync(buffer)).assertEqual(0);
      file.close();
      fs.unlinkSync(path);
      Logger.info(TAG, 'ReadAtEndReturnsZero_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_RANDOMIO_0700
     * @tc.name SetFilePointerReportsPosition007
     * @tc.desc Verify the handle reports the position chosen by the setter
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SetFilePointerReportsPosition_007', 0, (): void => {
      Logger.info(TAG, 'SetFilePointerReportsPosition_007 begin');
      const path: string = ensureDir(BASE_DIR) + '/pointer_position.txt';
      const file: fs.RandomAccessFile = openFile(path);
      file.writeSync('abcdef');
      file.setFilePointer(2);
      expect(file.filePointer).assertEqual(2);
      file.close();
      fs.unlinkSync(path);
      Logger.info(TAG, 'SetFilePointerReportsPosition_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_RANDOMIO_0800
     * @tc.name TailOverwriteKeepsLength008
     * @tc.desc Verify overwriting the last two bytes keeps the file length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TailOverwriteKeepsLength_008', 0, (): void => {
      Logger.info(TAG, 'TailOverwriteKeepsLength_008 begin');
      const path: string = ensureDir(BASE_DIR) + '/tail_overwrite.txt';
      const file: fs.RandomAccessFile = openFile(path);
      file.writeSync('abcdef');
      file.setFilePointer(4);
      file.writeSync('XY');
      file.close();
      expect(fs.statSync(path).size).assertEqual(6);
      expect(fs.readTextSync(path).endsWith('XY')).assertTrue();
      fs.unlinkSync(path);
      Logger.info(TAG, 'TailOverwriteKeepsLength_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_RANDOMIO_0900
     * @tc.name SuccessiveWritesAdvancePointer009
     * @tc.desc Verify a second write continues after the first without moving the pointer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SuccessiveWritesAdvancePointer_009', 0, (): void => {
      Logger.info(TAG, 'SuccessiveWritesAdvancePointer_009 begin');
      const path: string = ensureDir(BASE_DIR) + '/pointer_advance.txt';
      const file: fs.RandomAccessFile = openFile(path);
      file.writeSync('ab');
      file.writeSync('cd');
      expect(file.filePointer).assertEqual(4);
      file.close();
      expect(fs.readTextSync(path)).assertEqual('abcd');
      fs.unlinkSync(path);
      Logger.info(TAG, 'SuccessiveWritesAdvancePointer_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_RANDOMIO_1000
     * @tc.name AsyncWriteThenSyncRead010
     * @tc.desc Verify an asynchronous write can be read back through the same handle
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AsyncWriteThenSyncRead_010', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'AsyncWriteThenSyncRead_010 begin');
      const path: string = ensureDir(BASE_DIR) + '/async_write.txt';
      const file: fs.RandomAccessFile = openFile(path);
      const written: number = await file.write('xy');
      file.setFilePointer(0);
      const buffer: ArrayBuffer = new ArrayBuffer(2);
      const count: number = file.readSync(buffer);
      const bytes: Uint8Array = new Uint8Array(buffer, 0, count);
      expect(written).assertEqual(2);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual('xy');
      file.close();
      fs.unlinkSync(path);
      Logger.info(TAG, 'AsyncWriteThenSyncRead_010 end');
      done();
    });
  });
}
