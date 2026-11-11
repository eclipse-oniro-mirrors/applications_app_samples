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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { fileIo } from '@kit.CoreFileKit';
import { util } from '@kit.ArkTS';
import { abilityDelegatorRegistry } from '@kit.TestKit';

const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();


export default function SubtitleFileBehaviorExpandedTailTest() {
  describe('SubtitleFileBehaviorExpandedTailTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0051
     * @tc.name      testBehaviorSubtitleFile0051
     * @tc.desc      Temporary SRT file 51 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_51.srt`;
      const content: string = '51\n00:00:00,000 --> 00:00:05,000\nBehavior line 51\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0052
     * @tc.name      testBehaviorSubtitleFile0052
     * @tc.desc      Temporary SRT file 52 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_52.srt`;
      const content: string = '52\nBAD TIMESTAMP\nBroken line 52\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0053
     * @tc.name      testBehaviorSubtitleFile0053
     * @tc.desc      Temporary SRT file 53 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_53.srt`;
      const content: string = '53\n00:00:00,000 --> 00:00:05,000\nBehavior line 53\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0054
     * @tc.name      testBehaviorSubtitleFile0054
     * @tc.desc      Temporary SRT file 54 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_54.srt`;
      const content: string = '54\nBAD TIMESTAMP\nBroken line 54\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0055
     * @tc.name      testBehaviorSubtitleFile0055
     * @tc.desc      Temporary SRT file 55 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_55.srt`;
      const content: string = '55\n00:00:00,000 --> 00:00:05,000\nBehavior line 55\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0056
     * @tc.name      testBehaviorSubtitleFile0056
     * @tc.desc      Temporary SRT file 56 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_56.srt`;
      const content: string = '56\nBAD TIMESTAMP\nBroken line 56\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0057
     * @tc.name      testBehaviorSubtitleFile0057
     * @tc.desc      Temporary SRT file 57 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_57.srt`;
      const content: string = '57\n00:00:00,000 --> 00:00:05,000\nBehavior line 57\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0058
     * @tc.name      testBehaviorSubtitleFile0058
     * @tc.desc      Temporary SRT file 58 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_58.srt`;
      const content: string = '58\nBAD TIMESTAMP\nBroken line 58\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0059
     * @tc.name      testBehaviorSubtitleFile0059
     * @tc.desc      Temporary SRT file 59 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_59.srt`;
      const content: string = '59\n00:00:00,000 --> 00:00:05,000\nBehavior line 59\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0060
     * @tc.name      testBehaviorSubtitleFile0060
     * @tc.desc      Temporary SRT file 60 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_60.srt`;
      const content: string = '60\nBAD TIMESTAMP\nBroken line 60\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0061
     * @tc.name      testBehaviorSubtitleFile0061
     * @tc.desc      Temporary SRT file 61 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_61.srt`;
      const content: string = '61\n00:00:00,000 --> 00:00:05,000\nBehavior line 61\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0062
     * @tc.name      testBehaviorSubtitleFile0062
     * @tc.desc      Temporary SRT file 62 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_62.srt`;
      const content: string = '62\nBAD TIMESTAMP\nBroken line 62\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0063
     * @tc.name      testBehaviorSubtitleFile0063
     * @tc.desc      Temporary SRT file 63 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_63.srt`;
      const content: string = '63\n00:00:00,000 --> 00:00:05,000\nBehavior line 63\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0064
     * @tc.name      testBehaviorSubtitleFile0064
     * @tc.desc      Temporary SRT file 64 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_64.srt`;
      const content: string = '64\nBAD TIMESTAMP\nBroken line 64\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0065
     * @tc.name      testBehaviorSubtitleFile0065
     * @tc.desc      Temporary SRT file 65 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_65.srt`;
      const content: string = '65\n00:00:00,000 --> 00:00:05,000\nBehavior line 65\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0066
     * @tc.name      testBehaviorSubtitleFile0066
     * @tc.desc      Temporary SRT file 66 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_66.srt`;
      const content: string = '66\nBAD TIMESTAMP\nBroken line 66\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0067
     * @tc.name      testBehaviorSubtitleFile0067
     * @tc.desc      Temporary SRT file 67 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_67.srt`;
      const content: string = '67\n00:00:00,000 --> 00:00:05,000\nBehavior line 67\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0068
     * @tc.name      testBehaviorSubtitleFile0068
     * @tc.desc      Temporary SRT file 68 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_68.srt`;
      const content: string = '68\nBAD TIMESTAMP\nBroken line 68\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0069
     * @tc.name      testBehaviorSubtitleFile0069
     * @tc.desc      Temporary SRT file 69 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_69.srt`;
      const content: string = '69\n00:00:00,000 --> 00:00:05,000\nBehavior line 69\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0070
     * @tc.name      testBehaviorSubtitleFile0070
     * @tc.desc      Temporary SRT file 70 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_70.srt`;
      const content: string = '70\nBAD TIMESTAMP\nBroken line 70\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0071
     * @tc.name      testBehaviorSubtitleFile0071
     * @tc.desc      Temporary SRT file 71 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_71.srt`;
      const content: string = '71\n00:00:00,000 --> 00:00:05,000\nBehavior line 71\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0072
     * @tc.name      testBehaviorSubtitleFile0072
     * @tc.desc      Temporary SRT file 72 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_72.srt`;
      const content: string = '72\nBAD TIMESTAMP\nBroken line 72\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0073
     * @tc.name      testBehaviorSubtitleFile0073
     * @tc.desc      Temporary SRT file 73 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_73.srt`;
      const content: string = '73\n00:00:00,000 --> 00:00:05,000\nBehavior line 73\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0074
     * @tc.name      testBehaviorSubtitleFile0074
     * @tc.desc      Temporary SRT file 74 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_74.srt`;
      const content: string = '74\nBAD TIMESTAMP\nBroken line 74\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0075
     * @tc.name      testBehaviorSubtitleFile0075
     * @tc.desc      Temporary SRT file 75 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_75.srt`;
      const content: string = '75\n00:00:00,000 --> 00:00:05,000\nBehavior line 75\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0076
     * @tc.name      testBehaviorSubtitleFile0076
     * @tc.desc      Temporary SRT file 76 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_76.srt`;
      const content: string = '76\nBAD TIMESTAMP\nBroken line 76\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0077
     * @tc.name      testBehaviorSubtitleFile0077
     * @tc.desc      Temporary SRT file 77 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_77.srt`;
      const content: string = '77\n00:00:00,000 --> 00:00:05,000\nBehavior line 77\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0078
     * @tc.name      testBehaviorSubtitleFile0078
     * @tc.desc      Temporary SRT file 78 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_78.srt`;
      const content: string = '78\nBAD TIMESTAMP\nBroken line 78\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0079
     * @tc.name      testBehaviorSubtitleFile0079
     * @tc.desc      Temporary SRT file 79 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_79.srt`;
      const content: string = '79\n00:00:00,000 --> 00:00:05,000\nBehavior line 79\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0080
     * @tc.name      testBehaviorSubtitleFile0080
     * @tc.desc      Temporary SRT file 80 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_80.srt`;
      const content: string = '80\nBAD TIMESTAMP\nBroken line 80\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0081
     * @tc.name      testBehaviorSubtitleFile0081
     * @tc.desc      Temporary SRT file 81 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_81.srt`;
      const content: string = '81\n00:00:00,000 --> 00:00:05,000\nBehavior line 81\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0082
     * @tc.name      testBehaviorSubtitleFile0082
     * @tc.desc      Temporary SRT file 82 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_82.srt`;
      const content: string = '82\nBAD TIMESTAMP\nBroken line 82\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0083
     * @tc.name      testBehaviorSubtitleFile0083
     * @tc.desc      Temporary SRT file 83 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_83.srt`;
      const content: string = '83\n00:00:00,000 --> 00:00:05,000\nBehavior line 83\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0084
     * @tc.name      testBehaviorSubtitleFile0084
     * @tc.desc      Temporary SRT file 84 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_84.srt`;
      const content: string = '84\nBAD TIMESTAMP\nBroken line 84\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0085
     * @tc.name      testBehaviorSubtitleFile0085
     * @tc.desc      Temporary SRT file 85 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_85.srt`;
      const content: string = '85\n00:00:00,000 --> 00:00:05,000\nBehavior line 85\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0086
     * @tc.name      testBehaviorSubtitleFile0086
     * @tc.desc      Temporary SRT file 86 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_86.srt`;
      const content: string = '86\nBAD TIMESTAMP\nBroken line 86\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0087
     * @tc.name      testBehaviorSubtitleFile0087
     * @tc.desc      Temporary SRT file 87 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_87.srt`;
      const content: string = '87\n00:00:00,000 --> 00:00:05,000\nBehavior line 87\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0088
     * @tc.name      testBehaviorSubtitleFile0088
     * @tc.desc      Temporary SRT file 88 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_88.srt`;
      const content: string = '88\nBAD TIMESTAMP\nBroken line 88\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0089
     * @tc.name      testBehaviorSubtitleFile0089
     * @tc.desc      Temporary SRT file 89 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_89.srt`;
      const content: string = '89\n00:00:00,000 --> 00:00:05,000\nBehavior line 89\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0090
     * @tc.name      testBehaviorSubtitleFile0090
     * @tc.desc      Temporary SRT file 90 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_90.srt`;
      const content: string = '90\nBAD TIMESTAMP\nBroken line 90\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0091
     * @tc.name      testBehaviorSubtitleFile0091
     * @tc.desc      Temporary SRT file 91 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_91.srt`;
      const content: string = '91\n00:00:00,000 --> 00:00:05,000\nBehavior line 91\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0092
     * @tc.name      testBehaviorSubtitleFile0092
     * @tc.desc      Temporary SRT file 92 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_92.srt`;
      const content: string = '92\nBAD TIMESTAMP\nBroken line 92\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0093
     * @tc.name      testBehaviorSubtitleFile0093
     * @tc.desc      Temporary SRT file 93 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_93.srt`;
      const content: string = '93\n00:00:00,000 --> 00:00:05,000\nBehavior line 93\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0094
     * @tc.name      testBehaviorSubtitleFile0094
     * @tc.desc      Temporary SRT file 94 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_94.srt`;
      const content: string = '94\nBAD TIMESTAMP\nBroken line 94\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0095
     * @tc.name      testBehaviorSubtitleFile0095
     * @tc.desc      Temporary SRT file 95 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_95.srt`;
      const content: string = '95\n00:00:00,000 --> 00:00:05,000\nBehavior line 95\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0096
     * @tc.name      testBehaviorSubtitleFile0096
     * @tc.desc      Temporary SRT file 96 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_96.srt`;
      const content: string = '96\nBAD TIMESTAMP\nBroken line 96\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0097
     * @tc.name      testBehaviorSubtitleFile0097
     * @tc.desc      Temporary SRT file 97 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_97.srt`;
      const content: string = '97\n00:00:00,000 --> 00:00:05,000\nBehavior line 97\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0098
     * @tc.name      testBehaviorSubtitleFile0098
     * @tc.desc      Temporary SRT file 98 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_98.srt`;
      const content: string = '98\nBAD TIMESTAMP\nBroken line 98\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0099
     * @tc.name      testBehaviorSubtitleFile0099
     * @tc.desc      Temporary SRT file 99 round-trips as valid content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_99.srt`;
      const content: string = '99\n00:00:00,000 --> 00:00:05,000\nBehavior line 99\n';
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
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_FILE_0100
     * @tc.name      testBehaviorSubtitleFile0100
     * @tc.desc      Temporary SRT file 100 round-trips as malformed content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorSubtitleFile0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/behavior_subtitle_100.srt`;
      const content: string = '100\nBAD TIMESTAMP\nBroken line 100\n';
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
