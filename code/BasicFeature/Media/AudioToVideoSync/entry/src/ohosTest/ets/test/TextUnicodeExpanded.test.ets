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
import { TestType, Size, Level } from '@ohos/hypium';
import { describe, it, expect } from '@ohos/hypium';
import { util } from '@kit.ArkTS';
import { hilog } from '@kit.PerformanceAnalysisKit';


const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AudioToVideoSync_TextUnicodeExpanded]';

function logBegin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

function logEnd(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
}

export default function textUnicodeExpandedTest() {
  describe('textUnicodeExpandedTest', () => {
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0001
     * @tc.name      testExpTextU0001
     * @tc.desc      UTF-8 round-trip preserves code point 32.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0001');
      const source: string = String.fromCharCode(32);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(32);
    
      logEnd('testExpTextU0001');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0002
     * @tc.name      testExpTextU0002
     * @tc.desc      UTF-8 round-trip preserves code point 33.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0002');
      const source: string = String.fromCharCode(33);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(33);
    
      logEnd('testExpTextU0002');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0003
     * @tc.name      testExpTextU0003
     * @tc.desc      UTF-8 round-trip preserves code point 34.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0003');
      const source: string = String.fromCharCode(34);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(34);
    
      logEnd('testExpTextU0003');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0004
     * @tc.name      testExpTextU0004
     * @tc.desc      UTF-8 round-trip preserves code point 35.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0004');
      const source: string = String.fromCharCode(35);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(35);
    
      logEnd('testExpTextU0004');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0005
     * @tc.name      testExpTextU0005
     * @tc.desc      UTF-8 round-trip preserves code point 36.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0005');
      const source: string = String.fromCharCode(36);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(36);
    
      logEnd('testExpTextU0005');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0006
     * @tc.name      testExpTextU0006
     * @tc.desc      UTF-8 round-trip preserves code point 37.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0006');
      const source: string = String.fromCharCode(37);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(37);
    
      logEnd('testExpTextU0006');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0007
     * @tc.name      testExpTextU0007
     * @tc.desc      UTF-8 round-trip preserves code point 38.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0007');
      const source: string = String.fromCharCode(38);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(38);
    
      logEnd('testExpTextU0007');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0008
     * @tc.name      testExpTextU0008
     * @tc.desc      UTF-8 round-trip preserves code point 39.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0008');
      const source: string = String.fromCharCode(39);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(39);
    
      logEnd('testExpTextU0008');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0009
     * @tc.name      testExpTextU0009
     * @tc.desc      UTF-8 round-trip preserves code point 40.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0009');
      const source: string = String.fromCharCode(40);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(40);
    
      logEnd('testExpTextU0009');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0010
     * @tc.name      testExpTextU0010
     * @tc.desc      UTF-8 round-trip preserves code point 41.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0010');
      const source: string = String.fromCharCode(41);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(41);
    
      logEnd('testExpTextU0010');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0011
     * @tc.name      testExpTextU0011
     * @tc.desc      UTF-8 round-trip preserves code point 42.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0011');
      const source: string = String.fromCharCode(42);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(42);
    
      logEnd('testExpTextU0011');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0012
     * @tc.name      testExpTextU0012
     * @tc.desc      UTF-8 round-trip preserves code point 43.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0012');
      const source: string = String.fromCharCode(43);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(43);
    
      logEnd('testExpTextU0012');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0013
     * @tc.name      testExpTextU0013
     * @tc.desc      UTF-8 round-trip preserves code point 44.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0013');
      const source: string = String.fromCharCode(44);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(44);
    
      logEnd('testExpTextU0013');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0014
     * @tc.name      testExpTextU0014
     * @tc.desc      UTF-8 round-trip preserves code point 45.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0014');
      const source: string = String.fromCharCode(45);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(45);
    
      logEnd('testExpTextU0014');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0015
     * @tc.name      testExpTextU0015
     * @tc.desc      UTF-8 round-trip preserves code point 46.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0015');
      const source: string = String.fromCharCode(46);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(46);
    
      logEnd('testExpTextU0015');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0016
     * @tc.name      testExpTextU0016
     * @tc.desc      UTF-8 round-trip preserves code point 47.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0016');
      const source: string = String.fromCharCode(47);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(47);
    
      logEnd('testExpTextU0016');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0017
     * @tc.name      testExpTextU0017
     * @tc.desc      UTF-8 round-trip preserves code point 48.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0017');
      const source: string = String.fromCharCode(48);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(48);
    
      logEnd('testExpTextU0017');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0018
     * @tc.name      testExpTextU0018
     * @tc.desc      UTF-8 round-trip preserves code point 49.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0018');
      const source: string = String.fromCharCode(49);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(49);
    
      logEnd('testExpTextU0018');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0019
     * @tc.name      testExpTextU0019
     * @tc.desc      UTF-8 round-trip preserves code point 50.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0019');
      const source: string = String.fromCharCode(50);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(50);
    
      logEnd('testExpTextU0019');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0020
     * @tc.name      testExpTextU0020
     * @tc.desc      UTF-8 round-trip preserves code point 51.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0020');
      const source: string = String.fromCharCode(51);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(51);
    
      logEnd('testExpTextU0020');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0021
     * @tc.name      testExpTextU0021
     * @tc.desc      UTF-8 round-trip preserves code point 52.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0021');
      const source: string = String.fromCharCode(52);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(52);
    
      logEnd('testExpTextU0021');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0022
     * @tc.name      testExpTextU0022
     * @tc.desc      UTF-8 round-trip preserves code point 53.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0022');
      const source: string = String.fromCharCode(53);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(53);
    
      logEnd('testExpTextU0022');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0023
     * @tc.name      testExpTextU0023
     * @tc.desc      UTF-8 round-trip preserves code point 54.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0023');
      const source: string = String.fromCharCode(54);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(54);
    
      logEnd('testExpTextU0023');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0024
     * @tc.name      testExpTextU0024
     * @tc.desc      UTF-8 round-trip preserves code point 55.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0024');
      const source: string = String.fromCharCode(55);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(55);
    
      logEnd('testExpTextU0024');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0025
     * @tc.name      testExpTextU0025
     * @tc.desc      UTF-8 round-trip preserves code point 56.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0025');
      const source: string = String.fromCharCode(56);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(56);
    
      logEnd('testExpTextU0025');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0026
     * @tc.name      testExpTextU0026
     * @tc.desc      UTF-8 round-trip preserves code point 57.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0026');
      const source: string = String.fromCharCode(57);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(57);
    
      logEnd('testExpTextU0026');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0027
     * @tc.name      testExpTextU0027
     * @tc.desc      UTF-8 round-trip preserves code point 58.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0027');
      const source: string = String.fromCharCode(58);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(58);
    
      logEnd('testExpTextU0027');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0028
     * @tc.name      testExpTextU0028
     * @tc.desc      UTF-8 round-trip preserves code point 59.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0028');
      const source: string = String.fromCharCode(59);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(59);
    
      logEnd('testExpTextU0028');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0029
     * @tc.name      testExpTextU0029
     * @tc.desc      UTF-8 round-trip preserves code point 60.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0029');
      const source: string = String.fromCharCode(60);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(60);
    
      logEnd('testExpTextU0029');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0030
     * @tc.name      testExpTextU0030
     * @tc.desc      UTF-8 round-trip preserves code point 61.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0030');
      const source: string = String.fromCharCode(61);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(61);
    
      logEnd('testExpTextU0030');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0031
     * @tc.name      testExpTextU0031
     * @tc.desc      UTF-8 round-trip preserves code point 62.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0031');
      const source: string = String.fromCharCode(62);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(62);
    
      logEnd('testExpTextU0031');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0032
     * @tc.name      testExpTextU0032
     * @tc.desc      UTF-8 round-trip preserves code point 63.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0032');
      const source: string = String.fromCharCode(63);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(63);
    
      logEnd('testExpTextU0032');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0033
     * @tc.name      testExpTextU0033
     * @tc.desc      UTF-8 round-trip preserves code point 64.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0033');
      const source: string = String.fromCharCode(64);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(64);
    
      logEnd('testExpTextU0033');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0034
     * @tc.name      testExpTextU0034
     * @tc.desc      UTF-8 round-trip preserves code point 65.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0034');
      const source: string = String.fromCharCode(65);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(65);
    
      logEnd('testExpTextU0034');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0035
     * @tc.name      testExpTextU0035
     * @tc.desc      UTF-8 round-trip preserves code point 66.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0035');
      const source: string = String.fromCharCode(66);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(66);
    
      logEnd('testExpTextU0035');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0036
     * @tc.name      testExpTextU0036
     * @tc.desc      UTF-8 round-trip preserves code point 67.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0036');
      const source: string = String.fromCharCode(67);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(67);
    
      logEnd('testExpTextU0036');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0037
     * @tc.name      testExpTextU0037
     * @tc.desc      UTF-8 round-trip preserves code point 68.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0037');
      const source: string = String.fromCharCode(68);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(68);
    
      logEnd('testExpTextU0037');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0038
     * @tc.name      testExpTextU0038
     * @tc.desc      UTF-8 round-trip preserves code point 69.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0038');
      const source: string = String.fromCharCode(69);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(69);
    
      logEnd('testExpTextU0038');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0039
     * @tc.name      testExpTextU0039
     * @tc.desc      UTF-8 round-trip preserves code point 70.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0039');
      const source: string = String.fromCharCode(70);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(70);
    
      logEnd('testExpTextU0039');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0040
     * @tc.name      testExpTextU0040
     * @tc.desc      UTF-8 round-trip preserves code point 71.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0040');
      const source: string = String.fromCharCode(71);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(71);
    
      logEnd('testExpTextU0040');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0041
     * @tc.name      testExpTextU0041
     * @tc.desc      UTF-8 round-trip preserves code point 72.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0041');
      const source: string = String.fromCharCode(72);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(72);
    
      logEnd('testExpTextU0041');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0042
     * @tc.name      testExpTextU0042
     * @tc.desc      UTF-8 round-trip preserves code point 73.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0042');
      const source: string = String.fromCharCode(73);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(73);
    
      logEnd('testExpTextU0042');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0043
     * @tc.name      testExpTextU0043
     * @tc.desc      UTF-8 round-trip preserves code point 74.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0043');
      const source: string = String.fromCharCode(74);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(74);
    
      logEnd('testExpTextU0043');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0044
     * @tc.name      testExpTextU0044
     * @tc.desc      UTF-8 round-trip preserves code point 75.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0044');
      const source: string = String.fromCharCode(75);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(75);
    
      logEnd('testExpTextU0044');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0045
     * @tc.name      testExpTextU0045
     * @tc.desc      UTF-8 round-trip preserves code point 76.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0045');
      const source: string = String.fromCharCode(76);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(76);
    
      logEnd('testExpTextU0045');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0046
     * @tc.name      testExpTextU0046
     * @tc.desc      UTF-8 round-trip preserves code point 77.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0046');
      const source: string = String.fromCharCode(77);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(77);
    
      logEnd('testExpTextU0046');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0047
     * @tc.name      testExpTextU0047
     * @tc.desc      UTF-8 round-trip preserves code point 78.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0047');
      const source: string = String.fromCharCode(78);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(78);
    
      logEnd('testExpTextU0047');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0048
     * @tc.name      testExpTextU0048
     * @tc.desc      UTF-8 round-trip preserves code point 79.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0048');
      const source: string = String.fromCharCode(79);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(79);
    
      logEnd('testExpTextU0048');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0049
     * @tc.name      testExpTextU0049
     * @tc.desc      UTF-8 round-trip preserves code point 80.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0049');
      const source: string = String.fromCharCode(80);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(80);
    
      logEnd('testExpTextU0049');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0050
     * @tc.name      testExpTextU0050
     * @tc.desc      UTF-8 round-trip preserves code point 81.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0050');
      const source: string = String.fromCharCode(81);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(81);
    
      logEnd('testExpTextU0050');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0051
     * @tc.name      testExpTextU0051
     * @tc.desc      UTF-8 round-trip preserves code point 82.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0051');
      const source: string = String.fromCharCode(82);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(82);
    
      logEnd('testExpTextU0051');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0052
     * @tc.name      testExpTextU0052
     * @tc.desc      UTF-8 round-trip preserves code point 83.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0052');
      const source: string = String.fromCharCode(83);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(83);
    
      logEnd('testExpTextU0052');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0053
     * @tc.name      testExpTextU0053
     * @tc.desc      UTF-8 round-trip preserves code point 84.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0053');
      const source: string = String.fromCharCode(84);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(84);
    
      logEnd('testExpTextU0053');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0054
     * @tc.name      testExpTextU0054
     * @tc.desc      UTF-8 round-trip preserves code point 85.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0054');
      const source: string = String.fromCharCode(85);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(85);
    
      logEnd('testExpTextU0054');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0055
     * @tc.name      testExpTextU0055
     * @tc.desc      UTF-8 round-trip preserves code point 86.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0055');
      const source: string = String.fromCharCode(86);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(86);
    
      logEnd('testExpTextU0055');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0056
     * @tc.name      testExpTextU0056
     * @tc.desc      UTF-8 round-trip preserves code point 87.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0056');
      const source: string = String.fromCharCode(87);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(87);
    
      logEnd('testExpTextU0056');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0057
     * @tc.name      testExpTextU0057
     * @tc.desc      UTF-8 round-trip preserves code point 88.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0057');
      const source: string = String.fromCharCode(88);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(88);
    
      logEnd('testExpTextU0057');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0058
     * @tc.name      testExpTextU0058
     * @tc.desc      UTF-8 round-trip preserves code point 89.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0058');
      const source: string = String.fromCharCode(89);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(89);
    
      logEnd('testExpTextU0058');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0059
     * @tc.name      testExpTextU0059
     * @tc.desc      UTF-8 round-trip preserves code point 90.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0059');
      const source: string = String.fromCharCode(90);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(90);
    
      logEnd('testExpTextU0059');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0060
     * @tc.name      testExpTextU0060
     * @tc.desc      UTF-8 round-trip preserves code point 91.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0060');
      const source: string = String.fromCharCode(91);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(91);
    
      logEnd('testExpTextU0060');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0061
     * @tc.name      testExpTextU0061
     * @tc.desc      UTF-8 round-trip preserves code point 92.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0061');
      const source: string = String.fromCharCode(92);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(92);
    
      logEnd('testExpTextU0061');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0062
     * @tc.name      testExpTextU0062
     * @tc.desc      UTF-8 round-trip preserves code point 93.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0062');
      const source: string = String.fromCharCode(93);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(93);
    
      logEnd('testExpTextU0062');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0063
     * @tc.name      testExpTextU0063
     * @tc.desc      UTF-8 round-trip preserves code point 94.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0063');
      const source: string = String.fromCharCode(94);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(94);
    
      logEnd('testExpTextU0063');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0064
     * @tc.name      testExpTextU0064
     * @tc.desc      UTF-8 round-trip preserves code point 95.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0064');
      const source: string = String.fromCharCode(95);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(95);
    
      logEnd('testExpTextU0064');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0065
     * @tc.name      testExpTextU0065
     * @tc.desc      UTF-8 round-trip preserves code point 96.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0065');
      const source: string = String.fromCharCode(96);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(96);
    
      logEnd('testExpTextU0065');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0066
     * @tc.name      testExpTextU0066
     * @tc.desc      UTF-8 round-trip preserves code point 97.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0066');
      const source: string = String.fromCharCode(97);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(97);
    
      logEnd('testExpTextU0066');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0067
     * @tc.name      testExpTextU0067
     * @tc.desc      UTF-8 round-trip preserves code point 98.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0067');
      const source: string = String.fromCharCode(98);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(98);
    
      logEnd('testExpTextU0067');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0068
     * @tc.name      testExpTextU0068
     * @tc.desc      UTF-8 round-trip preserves code point 99.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0068');
      const source: string = String.fromCharCode(99);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(99);
    
      logEnd('testExpTextU0068');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0069
     * @tc.name      testExpTextU0069
     * @tc.desc      UTF-8 round-trip preserves code point 100.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0069');
      const source: string = String.fromCharCode(100);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(100);
    
      logEnd('testExpTextU0069');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0070
     * @tc.name      testExpTextU0070
     * @tc.desc      UTF-8 round-trip preserves code point 101.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0070');
      const source: string = String.fromCharCode(101);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(101);
    
      logEnd('testExpTextU0070');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0071
     * @tc.name      testExpTextU0071
     * @tc.desc      UTF-8 round-trip preserves code point 102.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0071');
      const source: string = String.fromCharCode(102);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(102);
    
      logEnd('testExpTextU0071');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0072
     * @tc.name      testExpTextU0072
     * @tc.desc      UTF-8 round-trip preserves code point 103.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0072');
      const source: string = String.fromCharCode(103);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(103);
    
      logEnd('testExpTextU0072');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0073
     * @tc.name      testExpTextU0073
     * @tc.desc      UTF-8 round-trip preserves code point 104.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0073');
      const source: string = String.fromCharCode(104);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(104);
    
      logEnd('testExpTextU0073');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0074
     * @tc.name      testExpTextU0074
     * @tc.desc      UTF-8 round-trip preserves code point 105.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0074');
      const source: string = String.fromCharCode(105);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(105);
    
      logEnd('testExpTextU0074');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0075
     * @tc.name      testExpTextU0075
     * @tc.desc      UTF-8 round-trip preserves code point 106.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0075');
      const source: string = String.fromCharCode(106);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(106);
    
      logEnd('testExpTextU0075');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0076
     * @tc.name      testExpTextU0076
     * @tc.desc      UTF-8 round-trip preserves code point 107.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0076');
      const source: string = String.fromCharCode(107);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(107);
    
      logEnd('testExpTextU0076');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0077
     * @tc.name      testExpTextU0077
     * @tc.desc      UTF-8 round-trip preserves code point 108.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0077');
      const source: string = String.fromCharCode(108);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(108);
    
      logEnd('testExpTextU0077');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0078
     * @tc.name      testExpTextU0078
     * @tc.desc      UTF-8 round-trip preserves code point 109.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0078');
      const source: string = String.fromCharCode(109);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(109);
    
      logEnd('testExpTextU0078');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0079
     * @tc.name      testExpTextU0079
     * @tc.desc      UTF-8 round-trip preserves code point 110.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0079');
      const source: string = String.fromCharCode(110);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(110);
    
      logEnd('testExpTextU0079');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0080
     * @tc.name      testExpTextU0080
     * @tc.desc      UTF-8 round-trip preserves code point 111.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0080');
      const source: string = String.fromCharCode(111);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(111);
    
      logEnd('testExpTextU0080');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0081
     * @tc.name      testExpTextU0081
     * @tc.desc      UTF-8 round-trip preserves code point 112.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0081');
      const source: string = String.fromCharCode(112);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(112);
    
      logEnd('testExpTextU0081');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0082
     * @tc.name      testExpTextU0082
     * @tc.desc      UTF-8 round-trip preserves code point 113.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0082');
      const source: string = String.fromCharCode(113);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(113);
    
      logEnd('testExpTextU0082');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0083
     * @tc.name      testExpTextU0083
     * @tc.desc      UTF-8 round-trip preserves code point 114.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0083');
      const source: string = String.fromCharCode(114);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(114);
    
      logEnd('testExpTextU0083');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0084
     * @tc.name      testExpTextU0084
     * @tc.desc      UTF-8 round-trip preserves code point 115.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0084');
      const source: string = String.fromCharCode(115);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(115);
    
      logEnd('testExpTextU0084');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0085
     * @tc.name      testExpTextU0085
     * @tc.desc      UTF-8 round-trip preserves code point 116.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0085');
      const source: string = String.fromCharCode(116);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(116);
    
      logEnd('testExpTextU0085');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0086
     * @tc.name      testExpTextU0086
     * @tc.desc      UTF-8 round-trip preserves code point 117.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0086');
      const source: string = String.fromCharCode(117);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(117);
    
      logEnd('testExpTextU0086');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0087
     * @tc.name      testExpTextU0087
     * @tc.desc      UTF-8 round-trip preserves code point 118.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0087');
      const source: string = String.fromCharCode(118);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(118);
    
      logEnd('testExpTextU0087');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0088
     * @tc.name      testExpTextU0088
     * @tc.desc      UTF-8 round-trip preserves code point 119.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0088');
      const source: string = String.fromCharCode(119);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(119);
    
      logEnd('testExpTextU0088');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0089
     * @tc.name      testExpTextU0089
     * @tc.desc      UTF-8 round-trip preserves code point 120.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0089');
      const source: string = String.fromCharCode(120);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(120);
    
      logEnd('testExpTextU0089');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0090
     * @tc.name      testExpTextU0090
     * @tc.desc      UTF-8 round-trip preserves code point 121.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0090');
      const source: string = String.fromCharCode(121);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(121);
    
      logEnd('testExpTextU0090');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0091
     * @tc.name      testExpTextU0091
     * @tc.desc      UTF-8 round-trip preserves code point 122.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0091');
      const source: string = String.fromCharCode(122);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(122);
    
      logEnd('testExpTextU0091');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0092
     * @tc.name      testExpTextU0092
     * @tc.desc      UTF-8 round-trip preserves code point 123.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0092');
      const source: string = String.fromCharCode(123);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(123);
    
      logEnd('testExpTextU0092');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0093
     * @tc.name      testExpTextU0093
     * @tc.desc      UTF-8 round-trip preserves code point 124.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0093');
      const source: string = String.fromCharCode(124);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(124);
    
      logEnd('testExpTextU0093');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0094
     * @tc.name      testExpTextU0094
     * @tc.desc      UTF-8 round-trip preserves code point 125.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0094');
      const source: string = String.fromCharCode(125);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(125);
    
      logEnd('testExpTextU0094');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0095
     * @tc.name      testExpTextU0095
     * @tc.desc      UTF-8 round-trip preserves code point 126.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0095');
      const source: string = String.fromCharCode(126);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(126);
    
      logEnd('testExpTextU0095');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0096
     * @tc.name      testExpTextU0096
     * @tc.desc      UTF-8 round-trip preserves code point 127.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0096');
      const source: string = String.fromCharCode(127);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(127);
    
      logEnd('testExpTextU0096');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0097
     * @tc.name      testExpTextU0097
     * @tc.desc      UTF-8 round-trip preserves code point 128.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0097');
      const source: string = String.fromCharCode(128);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(128);
    
      logEnd('testExpTextU0097');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0098
     * @tc.name      testExpTextU0098
     * @tc.desc      UTF-8 round-trip preserves code point 129.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0098');
      const source: string = String.fromCharCode(129);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(129);
    
      logEnd('testExpTextU0098');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0099
     * @tc.name      testExpTextU0099
     * @tc.desc      UTF-8 round-trip preserves code point 130.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0099');
      const source: string = String.fromCharCode(130);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(130);
    
      logEnd('testExpTextU0099');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTU_0100
     * @tc.name      testExpTextU0100
     * @tc.desc      UTF-8 round-trip preserves code point 131.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextU0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextU0100');
      const source: string = String.fromCharCode(131);
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      expect(decoded).assertEqual(source);
      expect(decoded.length).assertEqual(1);
      expect(source.charCodeAt(0)).assertEqual(131);
    
      logEnd('testExpTextU0100');
    })
  })
}
