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
const TAG: string = '[Sample_AudioToVideoSync_Base64Expanded]';

function logBegin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

function logEnd(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
}

export default function base64ExpandedTest() {
  describe('base64ExpandedTest', () => {
    /**
     * @tc.number    SUB_AVS_EXP_B64_0001
     * @tc.name      testExpB640001
     * @tc.desc      Verify the encoder rejects a zero-length payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640001');
      const source: Uint8Array = new Uint8Array(0);
      const helper: util.Base64Helper = new util.Base64Helper();
      let rejected: boolean = false;
      try {
        helper.encodeToStringSync(source);
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
      expect(source.length).assertEqual(0);
    
      logEnd('testExpB640001');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0002
     * @tc.name      testExpB640002
     * @tc.desc      Base64 round-trip preserves a 1-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640002');
      const source: Uint8Array = new Uint8Array(1);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 1) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(1);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640002');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0003
     * @tc.name      testExpB640003
     * @tc.desc      Base64 round-trip preserves a 2-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640003');
      const source: Uint8Array = new Uint8Array(2);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 2) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(2);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640003');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0004
     * @tc.name      testExpB640004
     * @tc.desc      Base64 round-trip preserves a 3-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640004');
      const source: Uint8Array = new Uint8Array(3);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 3) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(3);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640004');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0005
     * @tc.name      testExpB640005
     * @tc.desc      Base64 round-trip preserves a 4-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640005');
      const source: Uint8Array = new Uint8Array(4);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 4) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(4);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640005');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0006
     * @tc.name      testExpB640006
     * @tc.desc      Base64 round-trip preserves a 5-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640006');
      const source: Uint8Array = new Uint8Array(5);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 5) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(5);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640006');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0007
     * @tc.name      testExpB640007
     * @tc.desc      Base64 round-trip preserves a 6-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640007');
      const source: Uint8Array = new Uint8Array(6);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 6) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(6);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640007');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0008
     * @tc.name      testExpB640008
     * @tc.desc      Base64 round-trip preserves a 7-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640008');
      const source: Uint8Array = new Uint8Array(7);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 7) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(7);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640008');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0009
     * @tc.name      testExpB640009
     * @tc.desc      Base64 round-trip preserves a 8-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640009');
      const source: Uint8Array = new Uint8Array(8);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 8) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(8);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640009');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0010
     * @tc.name      testExpB640010
     * @tc.desc      Base64 round-trip preserves a 9-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640010');
      const source: Uint8Array = new Uint8Array(9);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 9) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(9);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640010');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0011
     * @tc.name      testExpB640011
     * @tc.desc      Base64 round-trip preserves a 10-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640011');
      const source: Uint8Array = new Uint8Array(10);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 10) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(10);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640011');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0012
     * @tc.name      testExpB640012
     * @tc.desc      Base64 round-trip preserves a 11-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640012');
      const source: Uint8Array = new Uint8Array(11);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 11) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(11);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640012');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0013
     * @tc.name      testExpB640013
     * @tc.desc      Base64 round-trip preserves a 12-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640013');
      const source: Uint8Array = new Uint8Array(12);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 12) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(12);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640013');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0014
     * @tc.name      testExpB640014
     * @tc.desc      Base64 round-trip preserves a 13-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640014');
      const source: Uint8Array = new Uint8Array(13);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 13) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(13);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640014');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0015
     * @tc.name      testExpB640015
     * @tc.desc      Base64 round-trip preserves a 14-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640015');
      const source: Uint8Array = new Uint8Array(14);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 14) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(14);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640015');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0016
     * @tc.name      testExpB640016
     * @tc.desc      Base64 round-trip preserves a 15-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640016');
      const source: Uint8Array = new Uint8Array(15);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 15) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(15);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640016');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0017
     * @tc.name      testExpB640017
     * @tc.desc      Base64 round-trip preserves a 16-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640017');
      const source: Uint8Array = new Uint8Array(16);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 16) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(16);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640017');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0018
     * @tc.name      testExpB640018
     * @tc.desc      Base64 round-trip preserves a 17-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640018');
      const source: Uint8Array = new Uint8Array(17);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 17) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(17);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640018');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0019
     * @tc.name      testExpB640019
     * @tc.desc      Base64 round-trip preserves a 18-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640019');
      const source: Uint8Array = new Uint8Array(18);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 18) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(18);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640019');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0020
     * @tc.name      testExpB640020
     * @tc.desc      Base64 round-trip preserves a 19-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640020');
      const source: Uint8Array = new Uint8Array(19);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 19) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(19);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640020');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0021
     * @tc.name      testExpB640021
     * @tc.desc      Base64 round-trip preserves a 20-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640021');
      const source: Uint8Array = new Uint8Array(20);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 20) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(20);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640021');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0022
     * @tc.name      testExpB640022
     * @tc.desc      Base64 round-trip preserves a 21-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640022');
      const source: Uint8Array = new Uint8Array(21);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 21) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(21);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640022');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0023
     * @tc.name      testExpB640023
     * @tc.desc      Base64 round-trip preserves a 22-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640023');
      const source: Uint8Array = new Uint8Array(22);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 22) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(22);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640023');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0024
     * @tc.name      testExpB640024
     * @tc.desc      Base64 round-trip preserves a 23-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640024');
      const source: Uint8Array = new Uint8Array(23);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 23) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(23);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640024');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0025
     * @tc.name      testExpB640025
     * @tc.desc      Base64 round-trip preserves a 24-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640025');
      const source: Uint8Array = new Uint8Array(24);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 24) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(24);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640025');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0026
     * @tc.name      testExpB640026
     * @tc.desc      Base64 round-trip preserves a 25-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640026');
      const source: Uint8Array = new Uint8Array(25);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 25) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(25);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640026');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0027
     * @tc.name      testExpB640027
     * @tc.desc      Base64 round-trip preserves a 26-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640027');
      const source: Uint8Array = new Uint8Array(26);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 26) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(26);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640027');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0028
     * @tc.name      testExpB640028
     * @tc.desc      Base64 round-trip preserves a 27-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640028');
      const source: Uint8Array = new Uint8Array(27);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 27) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(27);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640028');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0029
     * @tc.name      testExpB640029
     * @tc.desc      Base64 round-trip preserves a 28-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640029');
      const source: Uint8Array = new Uint8Array(28);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 28) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(28);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640029');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0030
     * @tc.name      testExpB640030
     * @tc.desc      Base64 round-trip preserves a 29-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640030');
      const source: Uint8Array = new Uint8Array(29);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 29) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(29);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640030');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0031
     * @tc.name      testExpB640031
     * @tc.desc      Base64 round-trip preserves a 30-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640031');
      const source: Uint8Array = new Uint8Array(30);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 30) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(30);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640031');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0032
     * @tc.name      testExpB640032
     * @tc.desc      Base64 round-trip preserves a 31-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640032');
      const source: Uint8Array = new Uint8Array(31);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 31) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(31);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640032');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0033
     * @tc.name      testExpB640033
     * @tc.desc      Base64 round-trip preserves a 32-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640033');
      const source: Uint8Array = new Uint8Array(32);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 32) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(32);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640033');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0034
     * @tc.name      testExpB640034
     * @tc.desc      Base64 round-trip preserves a 33-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640034');
      const source: Uint8Array = new Uint8Array(33);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 33) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(33);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640034');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0035
     * @tc.name      testExpB640035
     * @tc.desc      Base64 round-trip preserves a 34-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640035');
      const source: Uint8Array = new Uint8Array(34);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 34) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(34);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640035');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0036
     * @tc.name      testExpB640036
     * @tc.desc      Base64 round-trip preserves a 35-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640036');
      const source: Uint8Array = new Uint8Array(35);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 35) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(35);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640036');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0037
     * @tc.name      testExpB640037
     * @tc.desc      Base64 round-trip preserves a 36-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640037');
      const source: Uint8Array = new Uint8Array(36);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 36) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(36);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640037');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0038
     * @tc.name      testExpB640038
     * @tc.desc      Base64 round-trip preserves a 37-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640038');
      const source: Uint8Array = new Uint8Array(37);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 37) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(37);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640038');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0039
     * @tc.name      testExpB640039
     * @tc.desc      Base64 round-trip preserves a 38-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640039');
      const source: Uint8Array = new Uint8Array(38);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 38) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(38);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640039');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0040
     * @tc.name      testExpB640040
     * @tc.desc      Base64 round-trip preserves a 39-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640040');
      const source: Uint8Array = new Uint8Array(39);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 39) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(39);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640040');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0041
     * @tc.name      testExpB640041
     * @tc.desc      Base64 round-trip preserves a 40-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640041');
      const source: Uint8Array = new Uint8Array(40);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 40) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(40);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640041');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0042
     * @tc.name      testExpB640042
     * @tc.desc      Base64 round-trip preserves a 41-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640042');
      const source: Uint8Array = new Uint8Array(41);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 41) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(41);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640042');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0043
     * @tc.name      testExpB640043
     * @tc.desc      Base64 round-trip preserves a 42-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640043');
      const source: Uint8Array = new Uint8Array(42);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 42) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(42);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640043');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0044
     * @tc.name      testExpB640044
     * @tc.desc      Base64 round-trip preserves a 43-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640044');
      const source: Uint8Array = new Uint8Array(43);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 43) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(43);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640044');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0045
     * @tc.name      testExpB640045
     * @tc.desc      Base64 round-trip preserves a 44-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640045');
      const source: Uint8Array = new Uint8Array(44);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 44) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(44);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640045');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0046
     * @tc.name      testExpB640046
     * @tc.desc      Base64 round-trip preserves a 45-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640046');
      const source: Uint8Array = new Uint8Array(45);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 45) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(45);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640046');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0047
     * @tc.name      testExpB640047
     * @tc.desc      Base64 round-trip preserves a 46-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640047');
      const source: Uint8Array = new Uint8Array(46);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 46) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(46);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640047');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0048
     * @tc.name      testExpB640048
     * @tc.desc      Base64 round-trip preserves a 47-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640048');
      const source: Uint8Array = new Uint8Array(47);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 47) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(47);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640048');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0049
     * @tc.name      testExpB640049
     * @tc.desc      Base64 round-trip preserves a 48-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640049');
      const source: Uint8Array = new Uint8Array(48);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 48) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(48);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640049');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0050
     * @tc.name      testExpB640050
     * @tc.desc      Base64 round-trip preserves a 49-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640050');
      const source: Uint8Array = new Uint8Array(49);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 49) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(49);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640050');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0051
     * @tc.name      testExpB640051
     * @tc.desc      Base64 round-trip preserves a 50-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640051');
      const source: Uint8Array = new Uint8Array(50);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 50) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(50);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640051');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0052
     * @tc.name      testExpB640052
     * @tc.desc      Base64 round-trip preserves a 51-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640052');
      const source: Uint8Array = new Uint8Array(51);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 51) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(51);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640052');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0053
     * @tc.name      testExpB640053
     * @tc.desc      Base64 round-trip preserves a 52-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640053');
      const source: Uint8Array = new Uint8Array(52);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 52) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(52);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640053');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0054
     * @tc.name      testExpB640054
     * @tc.desc      Base64 round-trip preserves a 53-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640054');
      const source: Uint8Array = new Uint8Array(53);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 53) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(53);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640054');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0055
     * @tc.name      testExpB640055
     * @tc.desc      Base64 round-trip preserves a 54-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640055');
      const source: Uint8Array = new Uint8Array(54);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 54) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(54);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640055');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0056
     * @tc.name      testExpB640056
     * @tc.desc      Base64 round-trip preserves a 55-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640056');
      const source: Uint8Array = new Uint8Array(55);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 55) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(55);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640056');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0057
     * @tc.name      testExpB640057
     * @tc.desc      Base64 round-trip preserves a 56-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640057');
      const source: Uint8Array = new Uint8Array(56);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 56) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(56);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640057');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0058
     * @tc.name      testExpB640058
     * @tc.desc      Base64 round-trip preserves a 57-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640058');
      const source: Uint8Array = new Uint8Array(57);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 57) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(57);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640058');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0059
     * @tc.name      testExpB640059
     * @tc.desc      Base64 round-trip preserves a 58-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640059');
      const source: Uint8Array = new Uint8Array(58);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 58) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(58);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640059');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0060
     * @tc.name      testExpB640060
     * @tc.desc      Base64 round-trip preserves a 59-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640060');
      const source: Uint8Array = new Uint8Array(59);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 59) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(59);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640060');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0061
     * @tc.name      testExpB640061
     * @tc.desc      Base64 round-trip preserves a 60-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640061');
      const source: Uint8Array = new Uint8Array(60);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 60) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(60);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640061');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0062
     * @tc.name      testExpB640062
     * @tc.desc      Base64 round-trip preserves a 61-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640062');
      const source: Uint8Array = new Uint8Array(61);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 61) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(61);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640062');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0063
     * @tc.name      testExpB640063
     * @tc.desc      Base64 round-trip preserves a 62-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640063');
      const source: Uint8Array = new Uint8Array(62);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 62) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(62);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640063');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0064
     * @tc.name      testExpB640064
     * @tc.desc      Base64 round-trip preserves a 63-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640064');
      const source: Uint8Array = new Uint8Array(63);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 63) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(63);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640064');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0065
     * @tc.name      testExpB640065
     * @tc.desc      Base64 round-trip preserves a 64-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640065');
      const source: Uint8Array = new Uint8Array(64);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 64) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(64);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640065');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0066
     * @tc.name      testExpB640066
     * @tc.desc      Base64 round-trip preserves a 65-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640066');
      const source: Uint8Array = new Uint8Array(65);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 65) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(65);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640066');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0067
     * @tc.name      testExpB640067
     * @tc.desc      Base64 round-trip preserves a 66-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640067');
      const source: Uint8Array = new Uint8Array(66);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 66) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(66);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640067');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0068
     * @tc.name      testExpB640068
     * @tc.desc      Base64 round-trip preserves a 67-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640068');
      const source: Uint8Array = new Uint8Array(67);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 67) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(67);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640068');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0069
     * @tc.name      testExpB640069
     * @tc.desc      Base64 round-trip preserves a 68-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640069');
      const source: Uint8Array = new Uint8Array(68);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 68) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(68);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640069');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0070
     * @tc.name      testExpB640070
     * @tc.desc      Base64 round-trip preserves a 69-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640070');
      const source: Uint8Array = new Uint8Array(69);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 69) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(69);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640070');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0071
     * @tc.name      testExpB640071
     * @tc.desc      Base64 round-trip preserves a 70-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640071');
      const source: Uint8Array = new Uint8Array(70);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 70) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(70);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640071');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0072
     * @tc.name      testExpB640072
     * @tc.desc      Base64 round-trip preserves a 71-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640072');
      const source: Uint8Array = new Uint8Array(71);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 71) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(71);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640072');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0073
     * @tc.name      testExpB640073
     * @tc.desc      Base64 round-trip preserves a 72-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640073');
      const source: Uint8Array = new Uint8Array(72);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 72) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(72);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640073');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0074
     * @tc.name      testExpB640074
     * @tc.desc      Base64 round-trip preserves a 73-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640074');
      const source: Uint8Array = new Uint8Array(73);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 73) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(73);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640074');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0075
     * @tc.name      testExpB640075
     * @tc.desc      Base64 round-trip preserves a 74-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640075');
      const source: Uint8Array = new Uint8Array(74);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 74) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(74);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640075');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0076
     * @tc.name      testExpB640076
     * @tc.desc      Base64 round-trip preserves a 75-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640076');
      const source: Uint8Array = new Uint8Array(75);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 75) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(75);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640076');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0077
     * @tc.name      testExpB640077
     * @tc.desc      Base64 round-trip preserves a 76-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640077');
      const source: Uint8Array = new Uint8Array(76);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 76) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(76);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640077');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0078
     * @tc.name      testExpB640078
     * @tc.desc      Base64 round-trip preserves a 77-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640078');
      const source: Uint8Array = new Uint8Array(77);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 77) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(77);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640078');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0079
     * @tc.name      testExpB640079
     * @tc.desc      Base64 round-trip preserves a 78-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640079');
      const source: Uint8Array = new Uint8Array(78);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 78) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(78);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640079');
    })
    /**
     * @tc.number    SUB_AVS_EXP_B64_0080
     * @tc.name      testExpB640080
     * @tc.desc      Base64 round-trip preserves a 79-byte payload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpB640080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testExpB640080');
      const source: Uint8Array = new Uint8Array(79);
      for (let j: number = 0; j < source.length; j++) {
        source[j] = (j + 79) % 256;
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoded: string = helper.encodeToStringSync(source);
      const decoded: Uint8Array = helper.decodeSync(encoded);
      expect(decoded.length).assertEqual(79);
      expect(encoded.length % 4).assertEqual(0);
      for (let j: number = 0; j < decoded.length; j++) {
        expect(decoded[j]).assertEqual(source[j]);
      }
    
      logEnd('testExpB640080');
    })
  })
}
