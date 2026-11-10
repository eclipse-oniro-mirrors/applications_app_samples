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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const context = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();


export default function subtitleCorruptionBehaviorTest() {
  describe('subtitleCorruptionBehaviorTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0001
     * @tc.name      testBehaviorCorruptSubtitle0001
     * @tc.desc      Corrupted subtitle case 1 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0001', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_1.srt`;
      const content: string = '';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(false);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0002
     * @tc.name      testBehaviorCorruptSubtitle0002
     * @tc.desc      Corrupted subtitle case 2 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0002', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_2.srt`;
      const content: string = '1\nBAD\nbroken\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(false);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0003
     * @tc.name      testBehaviorCorruptSubtitle0003
     * @tc.desc      Corrupted subtitle case 3 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0003', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_3.srt`;
      const content: string = '1\n00:00:10,000 --> 00:00:05,000\nreversed\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(false);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0004
     * @tc.name      testBehaviorCorruptSubtitle0004
     * @tc.desc      Corrupted subtitle case 4 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0004', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_4.srt`;
      const content: string = '1\n00:00:00,000 --> 00:00:05,000\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(true);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0005
     * @tc.name      testBehaviorCorruptSubtitle0005
     * @tc.desc      Corrupted subtitle case 5 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0005', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_5.srt`;
      const content: string = '';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(false);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0006
     * @tc.name      testBehaviorCorruptSubtitle0006
     * @tc.desc      Corrupted subtitle case 6 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0006', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_6.srt`;
      const content: string = '1\nBAD\nbroken\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(false);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0007
     * @tc.name      testBehaviorCorruptSubtitle0007
     * @tc.desc      Corrupted subtitle case 7 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0007', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_7.srt`;
      const content: string = '1\n00:00:10,000 --> 00:00:05,000\nreversed\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(false);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0008
     * @tc.name      testBehaviorCorruptSubtitle0008
     * @tc.desc      Corrupted subtitle case 8 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0008', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_8.srt`;
      const content: string = '1\n00:00:00,000 --> 00:00:05,000\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(true);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0009
     * @tc.name      testBehaviorCorruptSubtitle0009
     * @tc.desc      Corrupted subtitle case 9 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0009', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_9.srt`;
      const content: string = '';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(false);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0010
     * @tc.name      testBehaviorCorruptSubtitle0010
     * @tc.desc      Corrupted subtitle case 10 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0010', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_10.srt`;
      const content: string = '1\nBAD\nbroken\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(false);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0011
     * @tc.name      testBehaviorCorruptSubtitle0011
     * @tc.desc      Corrupted subtitle case 11 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0011', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_11.srt`;
      const content: string = '1\n00:00:10,000 --> 00:00:05,000\nreversed\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(false);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0012
     * @tc.name      testBehaviorCorruptSubtitle0012
     * @tc.desc      Corrupted subtitle case 12 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0012', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_12.srt`;
      const content: string = '1\n00:00:00,000 --> 00:00:05,000\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(true);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0013
     * @tc.name      testBehaviorCorruptSubtitle0013
     * @tc.desc      Corrupted subtitle case 13 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0013', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_13.srt`;
      const content: string = '';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(false);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0014
     * @tc.name      testBehaviorCorruptSubtitle0014
     * @tc.desc      Corrupted subtitle case 14 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0014', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_14.srt`;
      const content: string = '1\nBAD\nbroken\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(false);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0015
     * @tc.name      testBehaviorCorruptSubtitle0015
     * @tc.desc      Corrupted subtitle case 15 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0015', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_15.srt`;
      const content: string = '1\n00:00:10,000 --> 00:00:05,000\nreversed\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(false);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0016
     * @tc.name      testBehaviorCorruptSubtitle0016
     * @tc.desc      Corrupted subtitle case 16 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0016', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_16.srt`;
      const content: string = '1\n00:00:00,000 --> 00:00:05,000\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(true);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0017
     * @tc.name      testBehaviorCorruptSubtitle0017
     * @tc.desc      Corrupted subtitle case 17 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0017', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_17.srt`;
      const content: string = '';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(false);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0018
     * @tc.name      testBehaviorCorruptSubtitle0018
     * @tc.desc      Corrupted subtitle case 18 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0018', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_18.srt`;
      const content: string = '1\nBAD\nbroken\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(false);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0019
     * @tc.name      testBehaviorCorruptSubtitle0019
     * @tc.desc      Corrupted subtitle case 19 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0019', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_19.srt`;
      const content: string = '1\n00:00:10,000 --> 00:00:05,000\nreversed\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(false);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0020
     * @tc.name      testBehaviorCorruptSubtitle0020
     * @tc.desc      Corrupted subtitle case 20 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0020', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_20.srt`;
      const content: string = '1\n00:00:00,000 --> 00:00:05,000\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(true);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0021
     * @tc.name      testBehaviorCorruptSubtitle0021
     * @tc.desc      Corrupted subtitle case 21 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0021', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_21.srt`;
      const content: string = '';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(false);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0022
     * @tc.name      testBehaviorCorruptSubtitle0022
     * @tc.desc      Corrupted subtitle case 22 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0022', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_22.srt`;
      const content: string = '1\nBAD\nbroken\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(false);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0023
     * @tc.name      testBehaviorCorruptSubtitle0023
     * @tc.desc      Corrupted subtitle case 23 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0023', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_23.srt`;
      const content: string = '1\n00:00:10,000 --> 00:00:05,000\nreversed\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(false);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0024
     * @tc.name      testBehaviorCorruptSubtitle0024
     * @tc.desc      Corrupted subtitle case 24 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0024', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_24.srt`;
      const content: string = '1\n00:00:00,000 --> 00:00:05,000\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(true);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0025
     * @tc.name      testBehaviorCorruptSubtitle0025
     * @tc.desc      Corrupted subtitle case 25 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0025', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_25.srt`;
      const content: string = '';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(false);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0026
     * @tc.name      testBehaviorCorruptSubtitle0026
     * @tc.desc      Corrupted subtitle case 26 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0026', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_26.srt`;
      const content: string = '1\nBAD\nbroken\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(false);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0027
     * @tc.name      testBehaviorCorruptSubtitle0027
     * @tc.desc      Corrupted subtitle case 27 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0027', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_27.srt`;
      const content: string = '1\n00:00:10,000 --> 00:00:05,000\nreversed\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(false);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0028
     * @tc.name      testBehaviorCorruptSubtitle0028
     * @tc.desc      Corrupted subtitle case 28 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0028', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_28.srt`;
      const content: string = '1\n00:00:00,000 --> 00:00:05,000\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(true);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0029
     * @tc.name      testBehaviorCorruptSubtitle0029
     * @tc.desc      Corrupted subtitle case 29 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0029', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_29.srt`;
      const content: string = '';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(false);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0030
     * @tc.name      testBehaviorCorruptSubtitle0030
     * @tc.desc      Corrupted subtitle case 30 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0030', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_30.srt`;
      const content: string = '1\nBAD\nbroken\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(false);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0031
     * @tc.name      testBehaviorCorruptSubtitle0031
     * @tc.desc      Corrupted subtitle case 31 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0031', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_31.srt`;
      const content: string = '1\n00:00:10,000 --> 00:00:05,000\nreversed\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(false);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0032
     * @tc.name      testBehaviorCorruptSubtitle0032
     * @tc.desc      Corrupted subtitle case 32 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0032', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_32.srt`;
      const content: string = '1\n00:00:00,000 --> 00:00:05,000\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(true);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0033
     * @tc.name      testBehaviorCorruptSubtitle0033
     * @tc.desc      Corrupted subtitle case 33 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0033', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_33.srt`;
      const content: string = '';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(false);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0034
     * @tc.name      testBehaviorCorruptSubtitle0034
     * @tc.desc      Corrupted subtitle case 34 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0034', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_34.srt`;
      const content: string = '1\nBAD\nbroken\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(false);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0035
     * @tc.name      testBehaviorCorruptSubtitle0035
     * @tc.desc      Corrupted subtitle case 35 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0035', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_35.srt`;
      const content: string = '1\n00:00:10,000 --> 00:00:05,000\nreversed\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(false);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0036
     * @tc.name      testBehaviorCorruptSubtitle0036
     * @tc.desc      Corrupted subtitle case 36 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0036', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_36.srt`;
      const content: string = '1\n00:00:00,000 --> 00:00:05,000\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(true);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0037
     * @tc.name      testBehaviorCorruptSubtitle0037
     * @tc.desc      Corrupted subtitle case 37 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0037', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_37.srt`;
      const content: string = '';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(false);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0038
     * @tc.name      testBehaviorCorruptSubtitle0038
     * @tc.desc      Corrupted subtitle case 38 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0038', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_38.srt`;
      const content: string = '1\nBAD\nbroken\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(false);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0039
     * @tc.name      testBehaviorCorruptSubtitle0039
     * @tc.desc      Corrupted subtitle case 39 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0039', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_39.srt`;
      const content: string = '1\n00:00:10,000 --> 00:00:05,000\nreversed\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(false);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_FILE_0040
     * @tc.name      testBehaviorCorruptSubtitle0040
     * @tc.desc      Corrupted subtitle case 40 is persisted and classified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCorruptSubtitle0040', 0, () => {
      const path: string = `${context.filesDir}/behavior_corrupt_40.srt`;
      const content: string = '1\n00:00:00,000 --> 00:00:05,000\n';
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(content);
        const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength);
        fileIo.writeSync(file.fd, buffer);
        fileIo.closeSync(file);
        const size: number = fileIo.statSync(path).size;
        expect(size).assertEqual(bytes.length);
        const contentValid: boolean = content.indexOf('-->') >= 0 && content.indexOf('BAD') < 0;
        expect(contentValid).assertEqual(true);
        expect(size >= 0).assertTrue();
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
  })
}
