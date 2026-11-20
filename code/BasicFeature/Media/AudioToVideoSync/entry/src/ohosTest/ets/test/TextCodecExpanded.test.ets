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
const TAG: string = '[Sample_AudioToVideoSync_TextCodecExpanded]';

function logBegin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

function logEnd(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
}

export default function textCodecExpandedTest() {
  describe('textCodecExpandedTest', () => {
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0001
     * @tc.name      testExpTextC0001
     * @tc.desc      An empty byte array decodes to an empty string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0001');
      const source: string = '';
      const bytes: Uint8Array = new Uint8Array(0);
      expect(bytes.length).assertEqual(0);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(0);
    
      logEnd('testExpTextC0001');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0002
     * @tc.name      testExpTextC0002
     * @tc.desc      ASCII payload of length 1 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0002');
      let source: string = '';
      for (let j: number = 0; j < 1; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(1);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(1);
    
      logEnd('testExpTextC0002');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0003
     * @tc.name      testExpTextC0003
     * @tc.desc      ASCII payload of length 2 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0003');
      let source: string = '';
      for (let j: number = 0; j < 2; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(2);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(2);
    
      logEnd('testExpTextC0003');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0004
     * @tc.name      testExpTextC0004
     * @tc.desc      ASCII payload of length 3 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0004');
      let source: string = '';
      for (let j: number = 0; j < 3; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(3);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(3);
    
      logEnd('testExpTextC0004');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0005
     * @tc.name      testExpTextC0005
     * @tc.desc      ASCII payload of length 4 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0005');
      let source: string = '';
      for (let j: number = 0; j < 4; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(4);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(4);
    
      logEnd('testExpTextC0005');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0006
     * @tc.name      testExpTextC0006
     * @tc.desc      ASCII payload of length 5 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0006');
      let source: string = '';
      for (let j: number = 0; j < 5; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(5);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(5);
    
      logEnd('testExpTextC0006');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0007
     * @tc.name      testExpTextC0007
     * @tc.desc      ASCII payload of length 6 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0007');
      let source: string = '';
      for (let j: number = 0; j < 6; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(6);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(6);
    
      logEnd('testExpTextC0007');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0008
     * @tc.name      testExpTextC0008
     * @tc.desc      ASCII payload of length 7 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0008');
      let source: string = '';
      for (let j: number = 0; j < 7; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(7);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(7);
    
      logEnd('testExpTextC0008');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0009
     * @tc.name      testExpTextC0009
     * @tc.desc      ASCII payload of length 8 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0009');
      let source: string = '';
      for (let j: number = 0; j < 8; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(8);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(8);
    
      logEnd('testExpTextC0009');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0010
     * @tc.name      testExpTextC0010
     * @tc.desc      ASCII payload of length 9 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0010');
      let source: string = '';
      for (let j: number = 0; j < 9; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(9);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(9);
    
      logEnd('testExpTextC0010');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0011
     * @tc.name      testExpTextC0011
     * @tc.desc      ASCII payload of length 10 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0011');
      let source: string = '';
      for (let j: number = 0; j < 10; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(10);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(10);
    
      logEnd('testExpTextC0011');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0012
     * @tc.name      testExpTextC0012
     * @tc.desc      ASCII payload of length 11 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0012');
      let source: string = '';
      for (let j: number = 0; j < 11; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(11);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(11);
    
      logEnd('testExpTextC0012');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0013
     * @tc.name      testExpTextC0013
     * @tc.desc      ASCII payload of length 12 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0013');
      let source: string = '';
      for (let j: number = 0; j < 12; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(12);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(12);
    
      logEnd('testExpTextC0013');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0014
     * @tc.name      testExpTextC0014
     * @tc.desc      ASCII payload of length 13 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0014');
      let source: string = '';
      for (let j: number = 0; j < 13; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(13);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(13);
    
      logEnd('testExpTextC0014');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0015
     * @tc.name      testExpTextC0015
     * @tc.desc      ASCII payload of length 14 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0015');
      let source: string = '';
      for (let j: number = 0; j < 14; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(14);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(14);
    
      logEnd('testExpTextC0015');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0016
     * @tc.name      testExpTextC0016
     * @tc.desc      ASCII payload of length 15 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0016');
      let source: string = '';
      for (let j: number = 0; j < 15; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(15);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(15);
    
      logEnd('testExpTextC0016');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0017
     * @tc.name      testExpTextC0017
     * @tc.desc      ASCII payload of length 16 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0017');
      let source: string = '';
      for (let j: number = 0; j < 16; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(16);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(16);
    
      logEnd('testExpTextC0017');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0018
     * @tc.name      testExpTextC0018
     * @tc.desc      ASCII payload of length 17 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0018');
      let source: string = '';
      for (let j: number = 0; j < 17; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(17);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(17);
    
      logEnd('testExpTextC0018');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0019
     * @tc.name      testExpTextC0019
     * @tc.desc      ASCII payload of length 18 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0019');
      let source: string = '';
      for (let j: number = 0; j < 18; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(18);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(18);
    
      logEnd('testExpTextC0019');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0020
     * @tc.name      testExpTextC0020
     * @tc.desc      ASCII payload of length 19 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0020');
      let source: string = '';
      for (let j: number = 0; j < 19; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(19);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(19);
    
      logEnd('testExpTextC0020');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0021
     * @tc.name      testExpTextC0021
     * @tc.desc      ASCII payload of length 20 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0021');
      let source: string = '';
      for (let j: number = 0; j < 20; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(20);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(20);
    
      logEnd('testExpTextC0021');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0022
     * @tc.name      testExpTextC0022
     * @tc.desc      ASCII payload of length 21 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0022');
      let source: string = '';
      for (let j: number = 0; j < 21; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(21);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(21);
    
      logEnd('testExpTextC0022');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0023
     * @tc.name      testExpTextC0023
     * @tc.desc      ASCII payload of length 22 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0023');
      let source: string = '';
      for (let j: number = 0; j < 22; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(22);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(22);
    
      logEnd('testExpTextC0023');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0024
     * @tc.name      testExpTextC0024
     * @tc.desc      ASCII payload of length 23 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0024');
      let source: string = '';
      for (let j: number = 0; j < 23; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(23);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(23);
    
      logEnd('testExpTextC0024');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0025
     * @tc.name      testExpTextC0025
     * @tc.desc      ASCII payload of length 24 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0025');
      let source: string = '';
      for (let j: number = 0; j < 24; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(24);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(24);
    
      logEnd('testExpTextC0025');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0026
     * @tc.name      testExpTextC0026
     * @tc.desc      ASCII payload of length 25 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0026');
      let source: string = '';
      for (let j: number = 0; j < 25; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(25);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(25);
    
      logEnd('testExpTextC0026');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0027
     * @tc.name      testExpTextC0027
     * @tc.desc      ASCII payload of length 26 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0027');
      let source: string = '';
      for (let j: number = 0; j < 26; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(26);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(26);
    
      logEnd('testExpTextC0027');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0028
     * @tc.name      testExpTextC0028
     * @tc.desc      ASCII payload of length 27 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0028');
      let source: string = '';
      for (let j: number = 0; j < 27; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(27);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(27);
    
      logEnd('testExpTextC0028');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0029
     * @tc.name      testExpTextC0029
     * @tc.desc      ASCII payload of length 28 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0029');
      let source: string = '';
      for (let j: number = 0; j < 28; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(28);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(28);
    
      logEnd('testExpTextC0029');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0030
     * @tc.name      testExpTextC0030
     * @tc.desc      ASCII payload of length 29 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0030');
      let source: string = '';
      for (let j: number = 0; j < 29; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(29);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(29);
    
      logEnd('testExpTextC0030');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0031
     * @tc.name      testExpTextC0031
     * @tc.desc      ASCII payload of length 30 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0031');
      let source: string = '';
      for (let j: number = 0; j < 30; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(30);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(30);
    
      logEnd('testExpTextC0031');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0032
     * @tc.name      testExpTextC0032
     * @tc.desc      ASCII payload of length 31 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0032');
      let source: string = '';
      for (let j: number = 0; j < 31; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(31);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(31);
    
      logEnd('testExpTextC0032');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0033
     * @tc.name      testExpTextC0033
     * @tc.desc      ASCII payload of length 32 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0033');
      let source: string = '';
      for (let j: number = 0; j < 32; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(32);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(32);
    
      logEnd('testExpTextC0033');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0034
     * @tc.name      testExpTextC0034
     * @tc.desc      ASCII payload of length 33 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0034');
      let source: string = '';
      for (let j: number = 0; j < 33; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(33);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(33);
    
      logEnd('testExpTextC0034');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0035
     * @tc.name      testExpTextC0035
     * @tc.desc      ASCII payload of length 34 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0035');
      let source: string = '';
      for (let j: number = 0; j < 34; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(34);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(34);
    
      logEnd('testExpTextC0035');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0036
     * @tc.name      testExpTextC0036
     * @tc.desc      ASCII payload of length 35 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0036');
      let source: string = '';
      for (let j: number = 0; j < 35; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(35);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(35);
    
      logEnd('testExpTextC0036');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0037
     * @tc.name      testExpTextC0037
     * @tc.desc      ASCII payload of length 36 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0037');
      let source: string = '';
      for (let j: number = 0; j < 36; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(36);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(36);
    
      logEnd('testExpTextC0037');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0038
     * @tc.name      testExpTextC0038
     * @tc.desc      ASCII payload of length 37 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0038');
      let source: string = '';
      for (let j: number = 0; j < 37; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(37);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(37);
    
      logEnd('testExpTextC0038');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0039
     * @tc.name      testExpTextC0039
     * @tc.desc      ASCII payload of length 38 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0039');
      let source: string = '';
      for (let j: number = 0; j < 38; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(38);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(38);
    
      logEnd('testExpTextC0039');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0040
     * @tc.name      testExpTextC0040
     * @tc.desc      ASCII payload of length 39 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0040');
      let source: string = '';
      for (let j: number = 0; j < 39; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(39);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(39);
    
      logEnd('testExpTextC0040');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0041
     * @tc.name      testExpTextC0041
     * @tc.desc      ASCII payload of length 40 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0041');
      let source: string = '';
      for (let j: number = 0; j < 40; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(40);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(40);
    
      logEnd('testExpTextC0041');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0042
     * @tc.name      testExpTextC0042
     * @tc.desc      ASCII payload of length 41 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0042');
      let source: string = '';
      for (let j: number = 0; j < 41; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(41);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(41);
    
      logEnd('testExpTextC0042');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0043
     * @tc.name      testExpTextC0043
     * @tc.desc      ASCII payload of length 42 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0043');
      let source: string = '';
      for (let j: number = 0; j < 42; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(42);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(42);
    
      logEnd('testExpTextC0043');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0044
     * @tc.name      testExpTextC0044
     * @tc.desc      ASCII payload of length 43 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0044');
      let source: string = '';
      for (let j: number = 0; j < 43; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(43);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(43);
    
      logEnd('testExpTextC0044');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0045
     * @tc.name      testExpTextC0045
     * @tc.desc      ASCII payload of length 44 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0045');
      let source: string = '';
      for (let j: number = 0; j < 44; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(44);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(44);
    
      logEnd('testExpTextC0045');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0046
     * @tc.name      testExpTextC0046
     * @tc.desc      ASCII payload of length 45 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0046');
      let source: string = '';
      for (let j: number = 0; j < 45; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(45);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(45);
    
      logEnd('testExpTextC0046');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0047
     * @tc.name      testExpTextC0047
     * @tc.desc      ASCII payload of length 46 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0047');
      let source: string = '';
      for (let j: number = 0; j < 46; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(46);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(46);
    
      logEnd('testExpTextC0047');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0048
     * @tc.name      testExpTextC0048
     * @tc.desc      ASCII payload of length 47 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0048');
      let source: string = '';
      for (let j: number = 0; j < 47; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(47);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(47);
    
      logEnd('testExpTextC0048');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0049
     * @tc.name      testExpTextC0049
     * @tc.desc      ASCII payload of length 48 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0049');
      let source: string = '';
      for (let j: number = 0; j < 48; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(48);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(48);
    
      logEnd('testExpTextC0049');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0050
     * @tc.name      testExpTextC0050
     * @tc.desc      ASCII payload of length 49 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0050');
      let source: string = '';
      for (let j: number = 0; j < 49; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(49);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(49);
    
      logEnd('testExpTextC0050');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0051
     * @tc.name      testExpTextC0051
     * @tc.desc      ASCII payload of length 50 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0051');
      let source: string = '';
      for (let j: number = 0; j < 50; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(50);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(50);
    
      logEnd('testExpTextC0051');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0052
     * @tc.name      testExpTextC0052
     * @tc.desc      ASCII payload of length 51 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0052');
      let source: string = '';
      for (let j: number = 0; j < 51; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(51);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(51);
    
      logEnd('testExpTextC0052');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0053
     * @tc.name      testExpTextC0053
     * @tc.desc      ASCII payload of length 52 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0053');
      let source: string = '';
      for (let j: number = 0; j < 52; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(52);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(52);
    
      logEnd('testExpTextC0053');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0054
     * @tc.name      testExpTextC0054
     * @tc.desc      ASCII payload of length 53 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0054');
      let source: string = '';
      for (let j: number = 0; j < 53; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(53);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(53);
    
      logEnd('testExpTextC0054');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0055
     * @tc.name      testExpTextC0055
     * @tc.desc      ASCII payload of length 54 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0055');
      let source: string = '';
      for (let j: number = 0; j < 54; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(54);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(54);
    
      logEnd('testExpTextC0055');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0056
     * @tc.name      testExpTextC0056
     * @tc.desc      ASCII payload of length 55 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0056');
      let source: string = '';
      for (let j: number = 0; j < 55; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(55);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(55);
    
      logEnd('testExpTextC0056');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0057
     * @tc.name      testExpTextC0057
     * @tc.desc      ASCII payload of length 56 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0057');
      let source: string = '';
      for (let j: number = 0; j < 56; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(56);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(56);
    
      logEnd('testExpTextC0057');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0058
     * @tc.name      testExpTextC0058
     * @tc.desc      ASCII payload of length 57 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0058');
      let source: string = '';
      for (let j: number = 0; j < 57; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(57);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(57);
    
      logEnd('testExpTextC0058');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0059
     * @tc.name      testExpTextC0059
     * @tc.desc      ASCII payload of length 58 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0059');
      let source: string = '';
      for (let j: number = 0; j < 58; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(58);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(58);
    
      logEnd('testExpTextC0059');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0060
     * @tc.name      testExpTextC0060
     * @tc.desc      ASCII payload of length 59 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0060');
      let source: string = '';
      for (let j: number = 0; j < 59; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(59);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(59);
    
      logEnd('testExpTextC0060');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0061
     * @tc.name      testExpTextC0061
     * @tc.desc      ASCII payload of length 60 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0061');
      let source: string = '';
      for (let j: number = 0; j < 60; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(60);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(60);
    
      logEnd('testExpTextC0061');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0062
     * @tc.name      testExpTextC0062
     * @tc.desc      ASCII payload of length 61 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0062');
      let source: string = '';
      for (let j: number = 0; j < 61; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(61);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(61);
    
      logEnd('testExpTextC0062');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0063
     * @tc.name      testExpTextC0063
     * @tc.desc      ASCII payload of length 62 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0063');
      let source: string = '';
      for (let j: number = 0; j < 62; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(62);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(62);
    
      logEnd('testExpTextC0063');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0064
     * @tc.name      testExpTextC0064
     * @tc.desc      ASCII payload of length 63 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0064');
      let source: string = '';
      for (let j: number = 0; j < 63; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(63);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(63);
    
      logEnd('testExpTextC0064');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0065
     * @tc.name      testExpTextC0065
     * @tc.desc      ASCII payload of length 64 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0065');
      let source: string = '';
      for (let j: number = 0; j < 64; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(64);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(64);
    
      logEnd('testExpTextC0065');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0066
     * @tc.name      testExpTextC0066
     * @tc.desc      ASCII payload of length 65 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0066');
      let source: string = '';
      for (let j: number = 0; j < 65; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(65);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(65);
    
      logEnd('testExpTextC0066');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0067
     * @tc.name      testExpTextC0067
     * @tc.desc      ASCII payload of length 66 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0067');
      let source: string = '';
      for (let j: number = 0; j < 66; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(66);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(66);
    
      logEnd('testExpTextC0067');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0068
     * @tc.name      testExpTextC0068
     * @tc.desc      ASCII payload of length 67 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0068');
      let source: string = '';
      for (let j: number = 0; j < 67; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(67);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(67);
    
      logEnd('testExpTextC0068');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0069
     * @tc.name      testExpTextC0069
     * @tc.desc      ASCII payload of length 68 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0069');
      let source: string = '';
      for (let j: number = 0; j < 68; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(68);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(68);
    
      logEnd('testExpTextC0069');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0070
     * @tc.name      testExpTextC0070
     * @tc.desc      ASCII payload of length 69 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0070');
      let source: string = '';
      for (let j: number = 0; j < 69; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(69);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(69);
    
      logEnd('testExpTextC0070');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0071
     * @tc.name      testExpTextC0071
     * @tc.desc      ASCII payload of length 70 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0071');
      let source: string = '';
      for (let j: number = 0; j < 70; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(70);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(70);
    
      logEnd('testExpTextC0071');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0072
     * @tc.name      testExpTextC0072
     * @tc.desc      ASCII payload of length 71 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0072');
      let source: string = '';
      for (let j: number = 0; j < 71; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(71);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(71);
    
      logEnd('testExpTextC0072');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0073
     * @tc.name      testExpTextC0073
     * @tc.desc      ASCII payload of length 72 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0073');
      let source: string = '';
      for (let j: number = 0; j < 72; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(72);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(72);
    
      logEnd('testExpTextC0073');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0074
     * @tc.name      testExpTextC0074
     * @tc.desc      ASCII payload of length 73 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0074');
      let source: string = '';
      for (let j: number = 0; j < 73; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(73);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(73);
    
      logEnd('testExpTextC0074');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0075
     * @tc.name      testExpTextC0075
     * @tc.desc      ASCII payload of length 74 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0075');
      let source: string = '';
      for (let j: number = 0; j < 74; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(74);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(74);
    
      logEnd('testExpTextC0075');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0076
     * @tc.name      testExpTextC0076
     * @tc.desc      ASCII payload of length 75 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0076');
      let source: string = '';
      for (let j: number = 0; j < 75; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(75);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(75);
    
      logEnd('testExpTextC0076');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0077
     * @tc.name      testExpTextC0077
     * @tc.desc      ASCII payload of length 76 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0077');
      let source: string = '';
      for (let j: number = 0; j < 76; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(76);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(76);
    
      logEnd('testExpTextC0077');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0078
     * @tc.name      testExpTextC0078
     * @tc.desc      ASCII payload of length 77 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0078');
      let source: string = '';
      for (let j: number = 0; j < 77; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(77);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(77);
    
      logEnd('testExpTextC0078');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0079
     * @tc.name      testExpTextC0079
     * @tc.desc      ASCII payload of length 78 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0079');
      let source: string = '';
      for (let j: number = 0; j < 78; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(78);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(78);
    
      logEnd('testExpTextC0079');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0080
     * @tc.name      testExpTextC0080
     * @tc.desc      ASCII payload of length 79 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0080');
      let source: string = '';
      for (let j: number = 0; j < 79; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(79);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(79);
    
      logEnd('testExpTextC0080');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0081
     * @tc.name      testExpTextC0081
     * @tc.desc      ASCII payload of length 80 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0081');
      let source: string = '';
      for (let j: number = 0; j < 80; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(80);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(80);
    
      logEnd('testExpTextC0081');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0082
     * @tc.name      testExpTextC0082
     * @tc.desc      ASCII payload of length 81 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0082');
      let source: string = '';
      for (let j: number = 0; j < 81; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(81);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(81);
    
      logEnd('testExpTextC0082');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0083
     * @tc.name      testExpTextC0083
     * @tc.desc      ASCII payload of length 82 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0083');
      let source: string = '';
      for (let j: number = 0; j < 82; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(82);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(82);
    
      logEnd('testExpTextC0083');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0084
     * @tc.name      testExpTextC0084
     * @tc.desc      ASCII payload of length 83 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0084');
      let source: string = '';
      for (let j: number = 0; j < 83; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(83);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(83);
    
      logEnd('testExpTextC0084');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0085
     * @tc.name      testExpTextC0085
     * @tc.desc      ASCII payload of length 84 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0085');
      let source: string = '';
      for (let j: number = 0; j < 84; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(84);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(84);
    
      logEnd('testExpTextC0085');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0086
     * @tc.name      testExpTextC0086
     * @tc.desc      ASCII payload of length 85 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0086');
      let source: string = '';
      for (let j: number = 0; j < 85; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(85);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(85);
    
      logEnd('testExpTextC0086');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0087
     * @tc.name      testExpTextC0087
     * @tc.desc      ASCII payload of length 86 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0087');
      let source: string = '';
      for (let j: number = 0; j < 86; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(86);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(86);
    
      logEnd('testExpTextC0087');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0088
     * @tc.name      testExpTextC0088
     * @tc.desc      ASCII payload of length 87 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0088');
      let source: string = '';
      for (let j: number = 0; j < 87; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(87);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(87);
    
      logEnd('testExpTextC0088');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0089
     * @tc.name      testExpTextC0089
     * @tc.desc      ASCII payload of length 88 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0089');
      let source: string = '';
      for (let j: number = 0; j < 88; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(88);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(88);
    
      logEnd('testExpTextC0089');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0090
     * @tc.name      testExpTextC0090
     * @tc.desc      ASCII payload of length 89 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0090');
      let source: string = '';
      for (let j: number = 0; j < 89; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(89);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(89);
    
      logEnd('testExpTextC0090');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0091
     * @tc.name      testExpTextC0091
     * @tc.desc      ASCII payload of length 90 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0091');
      let source: string = '';
      for (let j: number = 0; j < 90; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(90);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(90);
    
      logEnd('testExpTextC0091');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0092
     * @tc.name      testExpTextC0092
     * @tc.desc      ASCII payload of length 91 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0092');
      let source: string = '';
      for (let j: number = 0; j < 91; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(91);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(91);
    
      logEnd('testExpTextC0092');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0093
     * @tc.name      testExpTextC0093
     * @tc.desc      ASCII payload of length 92 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0093');
      let source: string = '';
      for (let j: number = 0; j < 92; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(92);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(92);
    
      logEnd('testExpTextC0093');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0094
     * @tc.name      testExpTextC0094
     * @tc.desc      ASCII payload of length 93 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0094');
      let source: string = '';
      for (let j: number = 0; j < 93; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(93);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(93);
    
      logEnd('testExpTextC0094');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0095
     * @tc.name      testExpTextC0095
     * @tc.desc      ASCII payload of length 94 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0095');
      let source: string = '';
      for (let j: number = 0; j < 94; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(94);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(94);
    
      logEnd('testExpTextC0095');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0096
     * @tc.name      testExpTextC0096
     * @tc.desc      ASCII payload of length 95 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0096');
      let source: string = '';
      for (let j: number = 0; j < 95; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(95);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(95);
    
      logEnd('testExpTextC0096');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0097
     * @tc.name      testExpTextC0097
     * @tc.desc      ASCII payload of length 96 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0097');
      let source: string = '';
      for (let j: number = 0; j < 96; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(96);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(96);
    
      logEnd('testExpTextC0097');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0098
     * @tc.name      testExpTextC0098
     * @tc.desc      ASCII payload of length 97 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0098');
      let source: string = '';
      for (let j: number = 0; j < 97; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(97);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(97);
    
      logEnd('testExpTextC0098');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0099
     * @tc.name      testExpTextC0099
     * @tc.desc      ASCII payload of length 98 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0099');
      let source: string = '';
      for (let j: number = 0; j < 98; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(98);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(98);
    
      logEnd('testExpTextC0099');
    })
    /**
     * @tc.number    SUB_AVS_EXP_TEXTC_0100
     * @tc.name      testExpTextC0100
     * @tc.desc      ASCII payload of length 99 encodes and decodes without loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpTextC0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpTextC0100');
      let source: string = '';
      for (let j: number = 0; j < 99; j++) {
        source += 'a';
      }
      const bytes: Uint8Array = util.TextEncoder.create('utf-8').encode(source);
      expect(bytes.length).assertEqual(99);
      expect(util.TextDecoder.create('utf-8').decodeToString(bytes)).assertEqual(source);
      expect(source.length).assertEqual(99);
    
      logEnd('testExpTextC0100');
    })
  })
}
