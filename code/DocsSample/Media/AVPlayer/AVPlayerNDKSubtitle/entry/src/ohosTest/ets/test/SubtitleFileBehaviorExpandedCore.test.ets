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
import { describe, it, expect } from '@ohos/hypium';
import { fileIo } from '@kit.CoreFileKit';
import { util } from '@kit.ArkTS';
import { abilityDelegatorRegistry } from '@kit.TestKit';

const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();


export default function SubtitleFileBehaviorExpandedCoreTest() {
  describe('SubtitleFileBehaviorExpandedCoreTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0001
     * @tc.name      testBehaviorSubtitleFile0001
     * @tc.desc      Temporary SRT file 1 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0001', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_1.srt`;
      const content: string = '1\n00:00:00,000 --> 00:00:05,000\nBehavior line 1\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0002
     * @tc.name      testBehaviorSubtitleFile0002
     * @tc.desc      Temporary SRT file 2 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0002', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_2.srt`;
      const content: string = '2\nBAD TIMESTAMP\nBroken line 2\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0003
     * @tc.name      testBehaviorSubtitleFile0003
     * @tc.desc      Temporary SRT file 3 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0003', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_3.srt`;
      const content: string = '3\n00:00:00,000 --> 00:00:05,000\nBehavior line 3\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0004
     * @tc.name      testBehaviorSubtitleFile0004
     * @tc.desc      Temporary SRT file 4 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0004', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_4.srt`;
      const content: string = '4\nBAD TIMESTAMP\nBroken line 4\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0005
     * @tc.name      testBehaviorSubtitleFile0005
     * @tc.desc      Temporary SRT file 5 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0005', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_5.srt`;
      const content: string = '5\n00:00:00,000 --> 00:00:05,000\nBehavior line 5\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0006
     * @tc.name      testBehaviorSubtitleFile0006
     * @tc.desc      Temporary SRT file 6 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0006', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_6.srt`;
      const content: string = '6\nBAD TIMESTAMP\nBroken line 6\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0007
     * @tc.name      testBehaviorSubtitleFile0007
     * @tc.desc      Temporary SRT file 7 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0007', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_7.srt`;
      const content: string = '7\n00:00:00,000 --> 00:00:05,000\nBehavior line 7\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0008
     * @tc.name      testBehaviorSubtitleFile0008
     * @tc.desc      Temporary SRT file 8 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0008', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_8.srt`;
      const content: string = '8\nBAD TIMESTAMP\nBroken line 8\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0009
     * @tc.name      testBehaviorSubtitleFile0009
     * @tc.desc      Temporary SRT file 9 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0009', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_9.srt`;
      const content: string = '9\n00:00:00,000 --> 00:00:05,000\nBehavior line 9\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0010
     * @tc.name      testBehaviorSubtitleFile0010
     * @tc.desc      Temporary SRT file 10 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0010', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_10.srt`;
      const content: string = '10\nBAD TIMESTAMP\nBroken line 10\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0011
     * @tc.name      testBehaviorSubtitleFile0011
     * @tc.desc      Temporary SRT file 11 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0011', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_11.srt`;
      const content: string = '11\n00:00:00,000 --> 00:00:05,000\nBehavior line 11\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0012
     * @tc.name      testBehaviorSubtitleFile0012
     * @tc.desc      Temporary SRT file 12 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0012', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_12.srt`;
      const content: string = '12\nBAD TIMESTAMP\nBroken line 12\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0013
     * @tc.name      testBehaviorSubtitleFile0013
     * @tc.desc      Temporary SRT file 13 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0013', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_13.srt`;
      const content: string = '13\n00:00:00,000 --> 00:00:05,000\nBehavior line 13\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0014
     * @tc.name      testBehaviorSubtitleFile0014
     * @tc.desc      Temporary SRT file 14 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0014', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_14.srt`;
      const content: string = '14\nBAD TIMESTAMP\nBroken line 14\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0015
     * @tc.name      testBehaviorSubtitleFile0015
     * @tc.desc      Temporary SRT file 15 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0015', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_15.srt`;
      const content: string = '15\n00:00:00,000 --> 00:00:05,000\nBehavior line 15\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0016
     * @tc.name      testBehaviorSubtitleFile0016
     * @tc.desc      Temporary SRT file 16 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0016', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_16.srt`;
      const content: string = '16\nBAD TIMESTAMP\nBroken line 16\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0017
     * @tc.name      testBehaviorSubtitleFile0017
     * @tc.desc      Temporary SRT file 17 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0017', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_17.srt`;
      const content: string = '17\n00:00:00,000 --> 00:00:05,000\nBehavior line 17\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0018
     * @tc.name      testBehaviorSubtitleFile0018
     * @tc.desc      Temporary SRT file 18 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0018', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_18.srt`;
      const content: string = '18\nBAD TIMESTAMP\nBroken line 18\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0019
     * @tc.name      testBehaviorSubtitleFile0019
     * @tc.desc      Temporary SRT file 19 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0019', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_19.srt`;
      const content: string = '19\n00:00:00,000 --> 00:00:05,000\nBehavior line 19\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0020
     * @tc.name      testBehaviorSubtitleFile0020
     * @tc.desc      Temporary SRT file 20 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0020', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_20.srt`;
      const content: string = '20\nBAD TIMESTAMP\nBroken line 20\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0021
     * @tc.name      testBehaviorSubtitleFile0021
     * @tc.desc      Temporary SRT file 21 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0021', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_21.srt`;
      const content: string = '21\n00:00:00,000 --> 00:00:05,000\nBehavior line 21\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0022
     * @tc.name      testBehaviorSubtitleFile0022
     * @tc.desc      Temporary SRT file 22 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0022', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_22.srt`;
      const content: string = '22\nBAD TIMESTAMP\nBroken line 22\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0023
     * @tc.name      testBehaviorSubtitleFile0023
     * @tc.desc      Temporary SRT file 23 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0023', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_23.srt`;
      const content: string = '23\n00:00:00,000 --> 00:00:05,000\nBehavior line 23\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0024
     * @tc.name      testBehaviorSubtitleFile0024
     * @tc.desc      Temporary SRT file 24 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0024', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_24.srt`;
      const content: string = '24\nBAD TIMESTAMP\nBroken line 24\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0025
     * @tc.name      testBehaviorSubtitleFile0025
     * @tc.desc      Temporary SRT file 25 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0025', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_25.srt`;
      const content: string = '25\n00:00:00,000 --> 00:00:05,000\nBehavior line 25\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0026
     * @tc.name      testBehaviorSubtitleFile0026
     * @tc.desc      Temporary SRT file 26 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0026', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_26.srt`;
      const content: string = '26\nBAD TIMESTAMP\nBroken line 26\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0027
     * @tc.name      testBehaviorSubtitleFile0027
     * @tc.desc      Temporary SRT file 27 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0027', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_27.srt`;
      const content: string = '27\n00:00:00,000 --> 00:00:05,000\nBehavior line 27\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0028
     * @tc.name      testBehaviorSubtitleFile0028
     * @tc.desc      Temporary SRT file 28 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0028', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_28.srt`;
      const content: string = '28\nBAD TIMESTAMP\nBroken line 28\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0029
     * @tc.name      testBehaviorSubtitleFile0029
     * @tc.desc      Temporary SRT file 29 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0029', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_29.srt`;
      const content: string = '29\n00:00:00,000 --> 00:00:05,000\nBehavior line 29\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0030
     * @tc.name      testBehaviorSubtitleFile0030
     * @tc.desc      Temporary SRT file 30 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0030', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_30.srt`;
      const content: string = '30\nBAD TIMESTAMP\nBroken line 30\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0031
     * @tc.name      testBehaviorSubtitleFile0031
     * @tc.desc      Temporary SRT file 31 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0031', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_31.srt`;
      const content: string = '31\n00:00:00,000 --> 00:00:05,000\nBehavior line 31\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0032
     * @tc.name      testBehaviorSubtitleFile0032
     * @tc.desc      Temporary SRT file 32 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0032', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_32.srt`;
      const content: string = '32\nBAD TIMESTAMP\nBroken line 32\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0033
     * @tc.name      testBehaviorSubtitleFile0033
     * @tc.desc      Temporary SRT file 33 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0033', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_33.srt`;
      const content: string = '33\n00:00:00,000 --> 00:00:05,000\nBehavior line 33\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0034
     * @tc.name      testBehaviorSubtitleFile0034
     * @tc.desc      Temporary SRT file 34 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0034', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_34.srt`;
      const content: string = '34\nBAD TIMESTAMP\nBroken line 34\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0035
     * @tc.name      testBehaviorSubtitleFile0035
     * @tc.desc      Temporary SRT file 35 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0035', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_35.srt`;
      const content: string = '35\n00:00:00,000 --> 00:00:05,000\nBehavior line 35\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0036
     * @tc.name      testBehaviorSubtitleFile0036
     * @tc.desc      Temporary SRT file 36 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0036', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_36.srt`;
      const content: string = '36\nBAD TIMESTAMP\nBroken line 36\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0037
     * @tc.name      testBehaviorSubtitleFile0037
     * @tc.desc      Temporary SRT file 37 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0037', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_37.srt`;
      const content: string = '37\n00:00:00,000 --> 00:00:05,000\nBehavior line 37\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0038
     * @tc.name      testBehaviorSubtitleFile0038
     * @tc.desc      Temporary SRT file 38 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0038', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_38.srt`;
      const content: string = '38\nBAD TIMESTAMP\nBroken line 38\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0039
     * @tc.name      testBehaviorSubtitleFile0039
     * @tc.desc      Temporary SRT file 39 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0039', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_39.srt`;
      const content: string = '39\n00:00:00,000 --> 00:00:05,000\nBehavior line 39\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0040
     * @tc.name      testBehaviorSubtitleFile0040
     * @tc.desc      Temporary SRT file 40 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0040', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_40.srt`;
      const content: string = '40\nBAD TIMESTAMP\nBroken line 40\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0041
     * @tc.name      testBehaviorSubtitleFile0041
     * @tc.desc      Temporary SRT file 41 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0041', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_41.srt`;
      const content: string = '41\n00:00:00,000 --> 00:00:05,000\nBehavior line 41\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0042
     * @tc.name      testBehaviorSubtitleFile0042
     * @tc.desc      Temporary SRT file 42 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0042', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_42.srt`;
      const content: string = '42\nBAD TIMESTAMP\nBroken line 42\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0043
     * @tc.name      testBehaviorSubtitleFile0043
     * @tc.desc      Temporary SRT file 43 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0043', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_43.srt`;
      const content: string = '43\n00:00:00,000 --> 00:00:05,000\nBehavior line 43\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0044
     * @tc.name      testBehaviorSubtitleFile0044
     * @tc.desc      Temporary SRT file 44 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0044', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_44.srt`;
      const content: string = '44\nBAD TIMESTAMP\nBroken line 44\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0045
     * @tc.name      testBehaviorSubtitleFile0045
     * @tc.desc      Temporary SRT file 45 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0045', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_45.srt`;
      const content: string = '45\n00:00:00,000 --> 00:00:05,000\nBehavior line 45\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0046
     * @tc.name      testBehaviorSubtitleFile0046
     * @tc.desc      Temporary SRT file 46 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0046', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_46.srt`;
      const content: string = '46\nBAD TIMESTAMP\nBroken line 46\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0047
     * @tc.name      testBehaviorSubtitleFile0047
     * @tc.desc      Temporary SRT file 47 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0047', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_47.srt`;
      const content: string = '47\n00:00:00,000 --> 00:00:05,000\nBehavior line 47\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0048
     * @tc.name      testBehaviorSubtitleFile0048
     * @tc.desc      Temporary SRT file 48 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0048', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_48.srt`;
      const content: string = '48\nBAD TIMESTAMP\nBroken line 48\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0049
     * @tc.name      testBehaviorSubtitleFile0049
     * @tc.desc      Temporary SRT file 49 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0049', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_49.srt`;
      const content: string = '49\n00:00:00,000 --> 00:00:05,000\nBehavior line 49\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_FILE_0050
     * @tc.name      testBehaviorSubtitleFile0050
     * @tc.desc      Temporary SRT file 50 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0050', 0, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_50.srt`;
      const content: string = '50\nBAD TIMESTAMP\nBroken line 50\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(bytes.length);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        expect(size).assertLarger(0);
        const readBuffer: ArrayBuffer = new ArrayBuffer(size);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const readLength: number = fileIo.readSync(readFile.fd, readBuffer);
        fileIo.closeSync(readFile);
        expect(readLength).assertEqual(size);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(readBuffer))).assertEqual(content);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
  })
}
