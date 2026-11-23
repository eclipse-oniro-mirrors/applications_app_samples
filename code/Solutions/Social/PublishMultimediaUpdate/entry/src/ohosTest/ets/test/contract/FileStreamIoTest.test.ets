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
import { ensureDir, writeTextFile } from '../common/FileTestHelper';
/**
 * Sequential access to a media file through a stream.
 * A file larger than one read buffer is copied in windows, so the stream
 * contract matters: how many bytes one write returns, whether append keeps the
 * old payload and how an offset window is read. Every case owns its file.
 */
const BASE_DIR: string = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir +
  '/publish_stream_cases';
export default function fileStreamIoTest() {
  describe('FileStreamIoTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
      ensureDir(BASE_DIR);
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_STREAM_0100
     * @tc.name WriteStreamRoundTrip001
     * @tc.desc Verify text written through a stream is returned by a full read
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'WriteStreamRoundTrip_001', 0, (): void => {
      Logger.info(TAG, 'WriteStreamRoundTrip_001 begin');
      const path: string = ensureDir(BASE_DIR) + '/stream_round_trip.txt';
      const stream: fs.Stream = fs.createStreamSync(path, 'w+');
      stream.writeSync('stream body');
      stream.closeSync();
      expect(fs.readTextSync(path)).assertEqual('stream body');
      fs.unlinkSync(path);
      Logger.info(TAG, 'WriteStreamRoundTrip_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_STREAM_0200
     * @tc.name ReadStreamDecodesBytes002
     * @tc.desc Verify bytes read through a stream decode back to the stored text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ReadStreamDecodesBytes_002', 0, (): void => {
      Logger.info(TAG, 'ReadStreamDecodesBytes_002 begin');
      const path: string = ensureDir(BASE_DIR) + '/stream_read.txt';
      writeTextFile(path, 'read me');
      const stream: fs.Stream = fs.createStreamSync(path, 'r');
      const buffer: ArrayBuffer = new ArrayBuffer(64);
      const count: number = stream.readSync(buffer);
      const bytes: Uint8Array = new Uint8Array(buffer, 0, count);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual('read me');
      stream.closeSync();
      fs.unlinkSync(path);
      Logger.info(TAG, 'ReadStreamDecodesBytes_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_STREAM_0300
     * @tc.name WriteReturnsByteCount003
     * @tc.desc Verify a stream write reports the number of bytes stored
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'WriteReturnsByteCount_003', 0, (): void => {
      Logger.info(TAG, 'WriteReturnsByteCount_003 begin');
      const path: string = ensureDir(BASE_DIR) + '/stream_count.txt';
      const stream: fs.Stream = fs.createStreamSync(path, 'w+');
      const written: number = stream.writeSync('publish');
      stream.closeSync();
      expect(written).assertEqual(7);
      fs.unlinkSync(path);
      Logger.info(TAG, 'WriteReturnsByteCount_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_STREAM_0400
     * @tc.name AppendModeKeepsExisting004
     * @tc.desc Verify opening for append adds text after the stored payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AppendModeKeepsExisting_004', 0, (): void => {
      Logger.info(TAG, 'AppendModeKeepsExisting_004 begin');
      const path: string = ensureDir(BASE_DIR) + '/stream_append.txt';
      writeTextFile(path, 'first');
      const stream: fs.Stream = fs.createStreamSync(path, 'a');
      stream.writeSync('second');
      stream.closeSync();
      expect(fs.readTextSync(path)).assertEqual('firstsecond');
      fs.unlinkSync(path);
      Logger.info(TAG, 'AppendModeKeepsExisting_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_STREAM_0500
     * @tc.name OffsetWriteOverwrites005
     * @tc.desc Verify a write at a file offset replaces only those bytes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'OffsetWriteOverwrites_005', 0, (): void => {
      Logger.info(TAG, 'OffsetWriteOverwrites_005 begin');
      const path: string = ensureDir(BASE_DIR) + '/stream_offset.txt';
      writeTextFile(path, 'abc');
      const stream: fs.Stream = fs.createStreamSync(path, 'r+');
      stream.writeSync('X', { offset: 0 });
      stream.closeSync();
      expect(fs.readTextSync(path)).assertEqual('Xbc');
      fs.unlinkSync(path);
      Logger.info(TAG, 'OffsetWriteOverwrites_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_STREAM_0600
     * @tc.name ReadOffsetWindow006
     * @tc.desc Verify a read window returns only the requested middle bytes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ReadOffsetWindow_006', 0, (): void => {
      Logger.info(TAG, 'ReadOffsetWindow_006 begin');
      const path: string = ensureDir(BASE_DIR) + '/stream_window.txt';
      writeTextFile(path, 'abcdef');
      const stream: fs.Stream = fs.createStreamSync(path, 'r');
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      const count: number = stream.readSync(buffer, { offset: 2, length: 3 });
      const bytes: Uint8Array = new Uint8Array(buffer, 0, count);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual('cde');
      stream.closeSync();
      fs.unlinkSync(path);
      Logger.info(TAG, 'ReadOffsetWindow_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_STREAM_0700
     * @tc.name TempDirectoryCreated007
     * @tc.desc Verify the temporary directory helper creates a real directory
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TempDirectoryCreated_007', 0, (): void => {
      Logger.info(TAG, 'TempDirectoryCreated_007 begin');
      const created: string = fs.mkdtempSync(ensureDir(BASE_DIR) + '/session_XXXXXX');
      expect(fs.statSync(created).isDirectory()).assertTrue();
      fs.rmdirSync(created);
      Logger.info(TAG, 'TempDirectoryCreated_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_STREAM_0800
     * @tc.name SuccessiveWritesAppend008
     * @tc.desc Verify a second write continues after the first without seeking
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SuccessiveWritesAppend_008', 0, (): void => {
      Logger.info(TAG, 'SuccessiveWritesAppend_008 begin');
      const path: string = ensureDir(BASE_DIR) + '/stream_successive.txt';
      const stream: fs.Stream = fs.createStreamSync(path, 'w+');
      stream.writeSync('ab');
      stream.writeSync('cd');
      stream.closeSync();
      expect(fs.readTextSync(path)).assertEqual('abcd');
      fs.unlinkSync(path);
      Logger.info(TAG, 'SuccessiveWritesAppend_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_STREAM_0900
     * @tc.name ReadModeRejectsWrite009
     * @tc.desc Verify a read only stream refuses a write
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ReadModeRejectsWrite_009', 0, (): void => {
      Logger.info(TAG, 'ReadModeRejectsWrite_009 begin');
      const path: string = ensureDir(BASE_DIR) + '/stream_read_only.txt';
      writeTextFile(path, 'guard');
      const stream: fs.Stream = fs.createStreamSync(path, 'r');
      let rejected: boolean = false;
      try {
        stream.writeSync('forbidden');
      }
      catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
      stream.closeSync();
      fs.unlinkSync(path);
      Logger.info(TAG, 'ReadModeRejectsWrite_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_STREAM_1000
     * @tc.name TwoStreamsStayIndependent010
     * @tc.desc Verify writing one file does not change another open file
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TwoStreamsStayIndependent_010', 0, (): void => {
      Logger.info(TAG, 'TwoStreamsStayIndependent_010 begin');
      const firstPath: string = ensureDir(BASE_DIR) + '/stream_first.txt';
      const secondPath: string = ensureDir(BASE_DIR) + '/stream_second.txt';
      const first: fs.Stream = fs.createStreamSync(firstPath, 'w+');
      const second: fs.Stream = fs.createStreamSync(secondPath, 'w+');
      first.writeSync('alpha');
      second.writeSync('beta');
      first.closeSync();
      second.closeSync();
      expect(fs.readTextSync(firstPath)).assertEqual('alpha');
      expect(fs.readTextSync(secondPath)).assertEqual('beta');
      fs.unlinkSync(firstPath);
      fs.unlinkSync(secondPath);
      Logger.info(TAG, 'TwoStreamsStayIndependent_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_STREAM_1100
     * @tc.name LargePayloadRoundTrip011
     * @tc.desc Verify a payload larger than one buffer survives the stream round trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LargePayloadRoundTrip_011', 0, (): void => {
      Logger.info(TAG, 'LargePayloadRoundTrip_011 begin');
      const path: string = ensureDir(BASE_DIR) + '/stream_large.txt';
      const chunk: string = '0123456789abcdef';
      let payload: string = '';
      for (let round: number = 0; round < 128; round++) {
        payload += chunk;
      }
      const stream: fs.Stream = fs.createStreamSync(path, 'w+');
      stream.writeSync(payload);
      stream.closeSync();
      expect(fs.readTextSync(path).length).assertEqual(payload.length);
      fs.unlinkSync(path);
      Logger.info(TAG, 'LargePayloadRoundTrip_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_STREAM_1200
     * @tc.name CjkWriteReportsByteCount012
     * @tc.desc Verify a CJK payload reports its UTF-8 byte count, not its character count
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'CjkWriteReportsByteCount_012', 0, (): void => {
      Logger.info(TAG, 'CjkWriteReportsByteCount_012 begin');
      const path: string = ensureDir(BASE_DIR) + '/stream_cjk.txt';
      const payload: string = '来杯香槟';
      const stream: fs.Stream = fs.createStreamSync(path, 'w+');
      const written: number = stream.writeSync(payload);
      stream.closeSync();
      const expected: number = new util.TextEncoder('utf-8').encodeInto(payload).length;
      expect(written).assertEqual(expected);
      expect(written > 4).assertTrue();
      fs.unlinkSync(path);
      Logger.info(TAG, 'CjkWriteReportsByteCount_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_STREAM_1300
     * @tc.name BufferReadStopsAtEnd013
     * @tc.desc Verify a read into an oversized buffer reports only the stored bytes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'BufferReadStopsAtEnd_013', 0, (): void => {
      Logger.info(TAG, 'BufferReadStopsAtEnd_013 begin');
      const path: string = ensureDir(BASE_DIR) + '/stream_tail.txt';
      writeTextFile(path, 'abc');
      const stream: fs.Stream = fs.createStreamSync(path, 'r');
      const buffer: ArrayBuffer = new ArrayBuffer(32);
      const count: number = stream.readSync(buffer);
      stream.closeSync();
      expect(count).assertEqual(3);
      fs.unlinkSync(path);
      Logger.info(TAG, 'BufferReadStopsAtEnd_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_STREAM_1400
     * @tc.name FlushKeepsStreamUsable014
     * @tc.desc Verify a flushed stream still accepts the next write
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FlushKeepsStreamUsable_014', 0, (): void => {
      Logger.info(TAG, 'FlushKeepsStreamUsable_014 begin');
      const path: string = ensureDir(BASE_DIR) + '/stream_flush.txt';
      const stream: fs.Stream = fs.createStreamSync(path, 'w+');
      stream.writeSync('first-');
      stream.flushSync();
      stream.writeSync('second');
      stream.closeSync();
      expect(fs.readTextSync(path)).assertEqual('first-second');
      fs.unlinkSync(path);
      Logger.info(TAG, 'FlushKeepsStreamUsable_014 end');
    });
  });
}
