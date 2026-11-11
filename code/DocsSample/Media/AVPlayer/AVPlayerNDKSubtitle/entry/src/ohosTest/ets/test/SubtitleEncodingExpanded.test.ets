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
import { describe, it as hypiumIt, expect as hypiumExpect, TestType, Size, Level, Assert } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { util } from '@kit.ArkTS';



const TAG: string = '[Sample_SubtitleEncodingExpanded]';
const DOMAIN: number = 0xF811;

function it(name: string, filter: number, func: () => void): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}


function expect(actual: string | number | boolean | Object | null | undefined): Assert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}
export default function subtitleEncodingExpandedTest(): void {
  describe('subtitleEncodingExpandedTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0001
     * @tc.name      testExpSubtitleEncoding0001
     * @tc.desc      Subtitle with 0 ASCII and 0 CJK chars encodes to 0 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = '';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(0);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(0);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0002
     * @tc.name      testExpSubtitleEncoding0002
     * @tc.desc      Subtitle with 1 ASCII and 1 CJK chars encodes to 4 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'a字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(4);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(2);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0003
     * @tc.name      testExpSubtitleEncoding0003
     * @tc.desc      Subtitle with 2 ASCII and 2 CJK chars encodes to 8 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aa字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(8);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(4);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0004
     * @tc.name      testExpSubtitleEncoding0004
     * @tc.desc      Subtitle with 3 ASCII and 3 CJK chars encodes to 12 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaa字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(12);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(6);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0005
     * @tc.name      testExpSubtitleEncoding0005
     * @tc.desc      Subtitle with 4 ASCII and 4 CJK chars encodes to 16 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaa字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(16);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(8);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0006
     * @tc.name      testExpSubtitleEncoding0006
     * @tc.desc      Subtitle with 5 ASCII and 5 CJK chars encodes to 20 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaa字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(20);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(10);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0007
     * @tc.name      testExpSubtitleEncoding0007
     * @tc.desc      Subtitle with 6 ASCII and 6 CJK chars encodes to 24 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaa字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(24);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(12);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0008
     * @tc.name      testExpSubtitleEncoding0008
     * @tc.desc      Subtitle with 7 ASCII and 7 CJK chars encodes to 28 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaa字字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(28);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(14);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0009
     * @tc.name      testExpSubtitleEncoding0009
     * @tc.desc      Subtitle with 8 ASCII and 8 CJK chars encodes to 32 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaa字字字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(32);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(16);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0010
     * @tc.name      testExpSubtitleEncoding0010
     * @tc.desc      Subtitle with 9 ASCII and 9 CJK chars encodes to 36 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaa字字字字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(36);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(18);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0011
     * @tc.name      testExpSubtitleEncoding0011
     * @tc.desc      Subtitle with 10 ASCII and 0 CJK chars encodes to 10 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaa';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(10);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(10);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0012
     * @tc.name      testExpSubtitleEncoding0012
     * @tc.desc      Subtitle with 11 ASCII and 1 CJK chars encodes to 14 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaa字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(14);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(12);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0013
     * @tc.name      testExpSubtitleEncoding0013
     * @tc.desc      Subtitle with 12 ASCII and 2 CJK chars encodes to 18 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaa字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(18);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(14);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0014
     * @tc.name      testExpSubtitleEncoding0014
     * @tc.desc      Subtitle with 13 ASCII and 3 CJK chars encodes to 22 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaa字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(22);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(16);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0015
     * @tc.name      testExpSubtitleEncoding0015
     * @tc.desc      Subtitle with 14 ASCII and 4 CJK chars encodes to 26 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaaa字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(26);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(18);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0016
     * @tc.name      testExpSubtitleEncoding0016
     * @tc.desc      Subtitle with 15 ASCII and 5 CJK chars encodes to 30 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaaaa字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(30);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(20);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0017
     * @tc.name      testExpSubtitleEncoding0017
     * @tc.desc      Subtitle with 16 ASCII and 6 CJK chars encodes to 34 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaaaaa字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(34);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(22);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0018
     * @tc.name      testExpSubtitleEncoding0018
     * @tc.desc      Subtitle with 17 ASCII and 7 CJK chars encodes to 38 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaaaaaa字字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(38);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(24);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0019
     * @tc.name      testExpSubtitleEncoding0019
     * @tc.desc      Subtitle with 18 ASCII and 8 CJK chars encodes to 42 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaaaaaaa字字字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(42);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(26);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0020
     * @tc.name      testExpSubtitleEncoding0020
     * @tc.desc      Subtitle with 19 ASCII and 9 CJK chars encodes to 46 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaaaaaaaa字字字字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(46);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(28);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0021
     * @tc.name      testExpSubtitleEncoding0021
     * @tc.desc      Subtitle with 0 ASCII and 0 CJK chars encodes to 0 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = '';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(0);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(0);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0022
     * @tc.name      testExpSubtitleEncoding0022
     * @tc.desc      Subtitle with 1 ASCII and 1 CJK chars encodes to 4 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'a字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(4);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(2);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0023
     * @tc.name      testExpSubtitleEncoding0023
     * @tc.desc      Subtitle with 2 ASCII and 2 CJK chars encodes to 8 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aa字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(8);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(4);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0024
     * @tc.name      testExpSubtitleEncoding0024
     * @tc.desc      Subtitle with 3 ASCII and 3 CJK chars encodes to 12 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaa字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(12);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(6);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0025
     * @tc.name      testExpSubtitleEncoding0025
     * @tc.desc      Subtitle with 4 ASCII and 4 CJK chars encodes to 16 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaa字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(16);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(8);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0026
     * @tc.name      testExpSubtitleEncoding0026
     * @tc.desc      Subtitle with 5 ASCII and 5 CJK chars encodes to 20 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaa字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(20);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(10);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0027
     * @tc.name      testExpSubtitleEncoding0027
     * @tc.desc      Subtitle with 6 ASCII and 6 CJK chars encodes to 24 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaa字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(24);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(12);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0028
     * @tc.name      testExpSubtitleEncoding0028
     * @tc.desc      Subtitle with 7 ASCII and 7 CJK chars encodes to 28 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaa字字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(28);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(14);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0029
     * @tc.name      testExpSubtitleEncoding0029
     * @tc.desc      Subtitle with 8 ASCII and 8 CJK chars encodes to 32 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaa字字字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(32);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(16);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0030
     * @tc.name      testExpSubtitleEncoding0030
     * @tc.desc      Subtitle with 9 ASCII and 9 CJK chars encodes to 36 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaa字字字字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(36);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(18);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0031
     * @tc.name      testExpSubtitleEncoding0031
     * @tc.desc      Subtitle with 10 ASCII and 0 CJK chars encodes to 10 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaa';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(10);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(10);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0032
     * @tc.name      testExpSubtitleEncoding0032
     * @tc.desc      Subtitle with 11 ASCII and 1 CJK chars encodes to 14 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaa字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(14);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(12);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0033
     * @tc.name      testExpSubtitleEncoding0033
     * @tc.desc      Subtitle with 12 ASCII and 2 CJK chars encodes to 18 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaa字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(18);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(14);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0034
     * @tc.name      testExpSubtitleEncoding0034
     * @tc.desc      Subtitle with 13 ASCII and 3 CJK chars encodes to 22 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaa字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(22);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(16);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0035
     * @tc.name      testExpSubtitleEncoding0035
     * @tc.desc      Subtitle with 14 ASCII and 4 CJK chars encodes to 26 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaaa字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(26);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(18);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0036
     * @tc.name      testExpSubtitleEncoding0036
     * @tc.desc      Subtitle with 15 ASCII and 5 CJK chars encodes to 30 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaaaa字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(30);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(20);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0037
     * @tc.name      testExpSubtitleEncoding0037
     * @tc.desc      Subtitle with 16 ASCII and 6 CJK chars encodes to 34 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaaaaa字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(34);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(22);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0038
     * @tc.name      testExpSubtitleEncoding0038
     * @tc.desc      Subtitle with 17 ASCII and 7 CJK chars encodes to 38 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaaaaaa字字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(38);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(24);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0039
     * @tc.name      testExpSubtitleEncoding0039
     * @tc.desc      Subtitle with 18 ASCII and 8 CJK chars encodes to 42 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaaaaaaa字字字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(42);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(26);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0040
     * @tc.name      testExpSubtitleEncoding0040
     * @tc.desc      Subtitle with 19 ASCII and 9 CJK chars encodes to 46 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaaaaaaaa字字字字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(46);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(28);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0041
     * @tc.name      testExpSubtitleEncoding0041
     * @tc.desc      Subtitle with 0 ASCII and 0 CJK chars encodes to 0 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = '';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(0);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(0);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0042
     * @tc.name      testExpSubtitleEncoding0042
     * @tc.desc      Subtitle with 1 ASCII and 1 CJK chars encodes to 4 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'a字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(4);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(2);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0043
     * @tc.name      testExpSubtitleEncoding0043
     * @tc.desc      Subtitle with 2 ASCII and 2 CJK chars encodes to 8 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aa字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(8);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(4);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0044
     * @tc.name      testExpSubtitleEncoding0044
     * @tc.desc      Subtitle with 3 ASCII and 3 CJK chars encodes to 12 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaa字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(12);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(6);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0045
     * @tc.name      testExpSubtitleEncoding0045
     * @tc.desc      Subtitle with 4 ASCII and 4 CJK chars encodes to 16 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaa字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(16);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(8);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0046
     * @tc.name      testExpSubtitleEncoding0046
     * @tc.desc      Subtitle with 5 ASCII and 5 CJK chars encodes to 20 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaa字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(20);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(10);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0047
     * @tc.name      testExpSubtitleEncoding0047
     * @tc.desc      Subtitle with 6 ASCII and 6 CJK chars encodes to 24 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaa字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(24);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(12);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0048
     * @tc.name      testExpSubtitleEncoding0048
     * @tc.desc      Subtitle with 7 ASCII and 7 CJK chars encodes to 28 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaa字字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(28);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(14);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0049
     * @tc.name      testExpSubtitleEncoding0049
     * @tc.desc      Subtitle with 8 ASCII and 8 CJK chars encodes to 32 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaa字字字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(32);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(16);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0050
     * @tc.name      testExpSubtitleEncoding0050
     * @tc.desc      Subtitle with 9 ASCII and 9 CJK chars encodes to 36 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaa字字字字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(36);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(18);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0051
     * @tc.name      testExpSubtitleEncoding0051
     * @tc.desc      Subtitle with 10 ASCII and 0 CJK chars encodes to 10 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaa';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(10);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(10);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0052
     * @tc.name      testExpSubtitleEncoding0052
     * @tc.desc      Subtitle with 11 ASCII and 1 CJK chars encodes to 14 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaa字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(14);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(12);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0053
     * @tc.name      testExpSubtitleEncoding0053
     * @tc.desc      Subtitle with 12 ASCII and 2 CJK chars encodes to 18 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaa字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(18);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(14);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0054
     * @tc.name      testExpSubtitleEncoding0054
     * @tc.desc      Subtitle with 13 ASCII and 3 CJK chars encodes to 22 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaa字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(22);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(16);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0055
     * @tc.name      testExpSubtitleEncoding0055
     * @tc.desc      Subtitle with 14 ASCII and 4 CJK chars encodes to 26 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaaa字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(26);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(18);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0056
     * @tc.name      testExpSubtitleEncoding0056
     * @tc.desc      Subtitle with 15 ASCII and 5 CJK chars encodes to 30 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaaaa字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(30);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(20);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0057
     * @tc.name      testExpSubtitleEncoding0057
     * @tc.desc      Subtitle with 16 ASCII and 6 CJK chars encodes to 34 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaaaaa字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(34);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(22);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0058
     * @tc.name      testExpSubtitleEncoding0058
     * @tc.desc      Subtitle with 17 ASCII and 7 CJK chars encodes to 38 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaaaaaa字字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(38);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(24);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0059
     * @tc.name      testExpSubtitleEncoding0059
     * @tc.desc      Subtitle with 18 ASCII and 8 CJK chars encodes to 42 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaaaaaaa字字字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(42);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(26);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0060
     * @tc.name      testExpSubtitleEncoding0060
     * @tc.desc      Subtitle with 19 ASCII and 9 CJK chars encodes to 46 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaaaaaaaa字字字字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(46);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(28);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0061
     * @tc.name      testExpSubtitleEncoding0061
     * @tc.desc      Subtitle with 0 ASCII and 0 CJK chars encodes to 0 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = '';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(0);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(0);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0062
     * @tc.name      testExpSubtitleEncoding0062
     * @tc.desc      Subtitle with 1 ASCII and 1 CJK chars encodes to 4 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'a字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(4);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(2);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0063
     * @tc.name      testExpSubtitleEncoding0063
     * @tc.desc      Subtitle with 2 ASCII and 2 CJK chars encodes to 8 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aa字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(8);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(4);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0064
     * @tc.name      testExpSubtitleEncoding0064
     * @tc.desc      Subtitle with 3 ASCII and 3 CJK chars encodes to 12 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaa字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(12);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(6);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0065
     * @tc.name      testExpSubtitleEncoding0065
     * @tc.desc      Subtitle with 4 ASCII and 4 CJK chars encodes to 16 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaa字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(16);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(8);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0066
     * @tc.name      testExpSubtitleEncoding0066
     * @tc.desc      Subtitle with 5 ASCII and 5 CJK chars encodes to 20 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaa字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(20);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(10);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0067
     * @tc.name      testExpSubtitleEncoding0067
     * @tc.desc      Subtitle with 6 ASCII and 6 CJK chars encodes to 24 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaa字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(24);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(12);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0068
     * @tc.name      testExpSubtitleEncoding0068
     * @tc.desc      Subtitle with 7 ASCII and 7 CJK chars encodes to 28 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaa字字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(28);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(14);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0069
     * @tc.name      testExpSubtitleEncoding0069
     * @tc.desc      Subtitle with 8 ASCII and 8 CJK chars encodes to 32 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaa字字字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(32);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(16);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0070
     * @tc.name      testExpSubtitleEncoding0070
     * @tc.desc      Subtitle with 9 ASCII and 9 CJK chars encodes to 36 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaa字字字字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(36);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(18);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0071
     * @tc.name      testExpSubtitleEncoding0071
     * @tc.desc      Subtitle with 10 ASCII and 0 CJK chars encodes to 10 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaa';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(10);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(10);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0072
     * @tc.name      testExpSubtitleEncoding0072
     * @tc.desc      Subtitle with 11 ASCII and 1 CJK chars encodes to 14 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaa字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(14);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(12);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0073
     * @tc.name      testExpSubtitleEncoding0073
     * @tc.desc      Subtitle with 12 ASCII and 2 CJK chars encodes to 18 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaa字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(18);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(14);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0074
     * @tc.name      testExpSubtitleEncoding0074
     * @tc.desc      Subtitle with 13 ASCII and 3 CJK chars encodes to 22 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaa字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(22);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(16);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0075
     * @tc.name      testExpSubtitleEncoding0075
     * @tc.desc      Subtitle with 14 ASCII and 4 CJK chars encodes to 26 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaaa字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(26);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(18);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0076
     * @tc.name      testExpSubtitleEncoding0076
     * @tc.desc      Subtitle with 15 ASCII and 5 CJK chars encodes to 30 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaaaa字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(30);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(20);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0077
     * @tc.name      testExpSubtitleEncoding0077
     * @tc.desc      Subtitle with 16 ASCII and 6 CJK chars encodes to 34 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaaaaa字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(34);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(22);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0078
     * @tc.name      testExpSubtitleEncoding0078
     * @tc.desc      Subtitle with 17 ASCII and 7 CJK chars encodes to 38 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaaaaaa字字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(38);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(24);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0079
     * @tc.name      testExpSubtitleEncoding0079
     * @tc.desc      Subtitle with 18 ASCII and 8 CJK chars encodes to 42 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaaaaaaa字字字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(42);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(26);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0080
     * @tc.name      testExpSubtitleEncoding0080
     * @tc.desc      Subtitle with 19 ASCII and 9 CJK chars encodes to 46 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaaaaaaaa字字字字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(46);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(28);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0081
     * @tc.name      testExpSubtitleEncoding0081
     * @tc.desc      Subtitle with 0 ASCII and 0 CJK chars encodes to 0 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = '';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(0);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(0);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0082
     * @tc.name      testExpSubtitleEncoding0082
     * @tc.desc      Subtitle with 1 ASCII and 1 CJK chars encodes to 4 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'a字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(4);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(2);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0083
     * @tc.name      testExpSubtitleEncoding0083
     * @tc.desc      Subtitle with 2 ASCII and 2 CJK chars encodes to 8 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aa字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(8);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(4);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0084
     * @tc.name      testExpSubtitleEncoding0084
     * @tc.desc      Subtitle with 3 ASCII and 3 CJK chars encodes to 12 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaa字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(12);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(6);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0085
     * @tc.name      testExpSubtitleEncoding0085
     * @tc.desc      Subtitle with 4 ASCII and 4 CJK chars encodes to 16 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaa字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(16);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(8);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0086
     * @tc.name      testExpSubtitleEncoding0086
     * @tc.desc      Subtitle with 5 ASCII and 5 CJK chars encodes to 20 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaa字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(20);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(10);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0087
     * @tc.name      testExpSubtitleEncoding0087
     * @tc.desc      Subtitle with 6 ASCII and 6 CJK chars encodes to 24 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaa字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(24);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(12);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0088
     * @tc.name      testExpSubtitleEncoding0088
     * @tc.desc      Subtitle with 7 ASCII and 7 CJK chars encodes to 28 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaa字字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(28);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(14);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0089
     * @tc.name      testExpSubtitleEncoding0089
     * @tc.desc      Subtitle with 8 ASCII and 8 CJK chars encodes to 32 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaa字字字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(32);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(16);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0090
     * @tc.name      testExpSubtitleEncoding0090
     * @tc.desc      Subtitle with 9 ASCII and 9 CJK chars encodes to 36 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaa字字字字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(36);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(18);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0091
     * @tc.name      testExpSubtitleEncoding0091
     * @tc.desc      Subtitle with 10 ASCII and 0 CJK chars encodes to 10 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaa';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(10);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(10);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0092
     * @tc.name      testExpSubtitleEncoding0092
     * @tc.desc      Subtitle with 11 ASCII and 1 CJK chars encodes to 14 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaa字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(14);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(12);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0093
     * @tc.name      testExpSubtitleEncoding0093
     * @tc.desc      Subtitle with 12 ASCII and 2 CJK chars encodes to 18 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaa字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(18);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(14);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0094
     * @tc.name      testExpSubtitleEncoding0094
     * @tc.desc      Subtitle with 13 ASCII and 3 CJK chars encodes to 22 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaa字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(22);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(16);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0095
     * @tc.name      testExpSubtitleEncoding0095
     * @tc.desc      Subtitle with 14 ASCII and 4 CJK chars encodes to 26 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaaa字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(26);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(18);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0096
     * @tc.name      testExpSubtitleEncoding0096
     * @tc.desc      Subtitle with 15 ASCII and 5 CJK chars encodes to 30 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaaaa字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(30);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(20);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0097
     * @tc.name      testExpSubtitleEncoding0097
     * @tc.desc      Subtitle with 16 ASCII and 6 CJK chars encodes to 34 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaaaaa字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(34);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(22);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0098
     * @tc.name      testExpSubtitleEncoding0098
     * @tc.desc      Subtitle with 17 ASCII and 7 CJK chars encodes to 38 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaaaaaa字字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(38);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(24);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0099
     * @tc.name      testExpSubtitleEncoding0099
     * @tc.desc      Subtitle with 18 ASCII and 8 CJK chars encodes to 42 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaaaaaaa字字字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(42);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(26);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_ENC_0100
     * @tc.name      testExpSubtitleEncoding0100
     * @tc.desc      Subtitle with 19 ASCII and 9 CJK chars encodes to 46 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleEncoding0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const text: string = 'aaaaaaaaaaaaaaaaaaa字字字字字字字字字';
      const encoded: Uint8Array = text.length === 0 ? new Uint8Array(0) : util.TextEncoder.create('utf-8').encode(text);
      expect(encoded.length).assertEqual(46);
      expect(util.TextDecoder.create('utf-8').decodeToString(encoded)).assertEqual(text);
      expect(text.length).assertEqual(28);
      expect(encoded.length).assertLargerOrEqual(text.length);
    })
  })
}
