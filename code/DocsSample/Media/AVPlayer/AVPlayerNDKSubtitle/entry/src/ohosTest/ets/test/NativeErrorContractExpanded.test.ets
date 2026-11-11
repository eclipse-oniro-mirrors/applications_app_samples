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



const TAG: string = '[Sample_NativeErrorContractExpanded]';
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
export default function nativeErrorContractExpandedTest(): void {
  describe('nativeErrorContractExpandedTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0001
     * @tc.name      testMoreNativeError0001
     * @tc.desc      Native return code 0 is classified as success=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 0;
      const success: boolean = code === 0;
      expect(success).assertEqual(true);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0002
     * @tc.name      testMoreNativeError0002
     * @tc.desc      Native return code -1 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = -1;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0003
     * @tc.name      testMoreNativeError0003
     * @tc.desc      Native return code 5400101 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400101;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400101);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0004
     * @tc.name      testMoreNativeError0004
     * @tc.desc      Native return code 5400102 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400102;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400102);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0005
     * @tc.name      testMoreNativeError0005
     * @tc.desc      Native return code 5400103 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400103;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400103);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0006
     * @tc.name      testMoreNativeError0006
     * @tc.desc      Native return code 5400104 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400104;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400104);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0007
     * @tc.name      testMoreNativeError0007
     * @tc.desc      Native return code 5400105 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400105;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400105);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0008
     * @tc.name      testMoreNativeError0008
     * @tc.desc      Native return code 5400106 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400106;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400106);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0009
     * @tc.name      testMoreNativeError0009
     * @tc.desc      Native return code 0 is classified as success=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 0;
      const success: boolean = code === 0;
      expect(success).assertEqual(true);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0010
     * @tc.name      testMoreNativeError0010
     * @tc.desc      Native return code -1 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = -1;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0011
     * @tc.name      testMoreNativeError0011
     * @tc.desc      Native return code 5400101 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400101;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400101);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0012
     * @tc.name      testMoreNativeError0012
     * @tc.desc      Native return code 5400102 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400102;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400102);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0013
     * @tc.name      testMoreNativeError0013
     * @tc.desc      Native return code 5400103 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400103;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400103);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0014
     * @tc.name      testMoreNativeError0014
     * @tc.desc      Native return code 5400104 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400104;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400104);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0015
     * @tc.name      testMoreNativeError0015
     * @tc.desc      Native return code 5400105 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400105;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400105);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0016
     * @tc.name      testMoreNativeError0016
     * @tc.desc      Native return code 5400106 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400106;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400106);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0017
     * @tc.name      testMoreNativeError0017
     * @tc.desc      Native return code 0 is classified as success=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 0;
      const success: boolean = code === 0;
      expect(success).assertEqual(true);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0018
     * @tc.name      testMoreNativeError0018
     * @tc.desc      Native return code -1 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = -1;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0019
     * @tc.name      testMoreNativeError0019
     * @tc.desc      Native return code 5400101 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400101;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400101);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0020
     * @tc.name      testMoreNativeError0020
     * @tc.desc      Native return code 5400102 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400102;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400102);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0021
     * @tc.name      testMoreNativeError0021
     * @tc.desc      Native return code 5400103 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400103;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400103);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0022
     * @tc.name      testMoreNativeError0022
     * @tc.desc      Native return code 5400104 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400104;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400104);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0023
     * @tc.name      testMoreNativeError0023
     * @tc.desc      Native return code 5400105 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400105;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400105);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0024
     * @tc.name      testMoreNativeError0024
     * @tc.desc      Native return code 5400106 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400106;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400106);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0025
     * @tc.name      testMoreNativeError0025
     * @tc.desc      Native return code 0 is classified as success=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 0;
      const success: boolean = code === 0;
      expect(success).assertEqual(true);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0026
     * @tc.name      testMoreNativeError0026
     * @tc.desc      Native return code -1 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = -1;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0027
     * @tc.name      testMoreNativeError0027
     * @tc.desc      Native return code 5400101 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400101;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400101);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0028
     * @tc.name      testMoreNativeError0028
     * @tc.desc      Native return code 5400102 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400102;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400102);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0029
     * @tc.name      testMoreNativeError0029
     * @tc.desc      Native return code 5400103 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400103;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400103);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0030
     * @tc.name      testMoreNativeError0030
     * @tc.desc      Native return code 5400104 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400104;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400104);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0031
     * @tc.name      testMoreNativeError0031
     * @tc.desc      Native return code 5400105 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400105;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400105);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0032
     * @tc.name      testMoreNativeError0032
     * @tc.desc      Native return code 5400106 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400106;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400106);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0033
     * @tc.name      testMoreNativeError0033
     * @tc.desc      Native return code 0 is classified as success=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 0;
      const success: boolean = code === 0;
      expect(success).assertEqual(true);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0034
     * @tc.name      testMoreNativeError0034
     * @tc.desc      Native return code -1 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = -1;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0035
     * @tc.name      testMoreNativeError0035
     * @tc.desc      Native return code 5400101 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400101;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400101);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0036
     * @tc.name      testMoreNativeError0036
     * @tc.desc      Native return code 5400102 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400102;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400102);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0037
     * @tc.name      testMoreNativeError0037
     * @tc.desc      Native return code 5400103 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400103;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400103);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0038
     * @tc.name      testMoreNativeError0038
     * @tc.desc      Native return code 5400104 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400104;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400104);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0039
     * @tc.name      testMoreNativeError0039
     * @tc.desc      Native return code 5400105 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400105;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400105);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0040
     * @tc.name      testMoreNativeError0040
     * @tc.desc      Native return code 5400106 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400106;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400106);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0041
     * @tc.name      testMoreNativeError0041
     * @tc.desc      Native return code 0 is classified as success=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 0;
      const success: boolean = code === 0;
      expect(success).assertEqual(true);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0042
     * @tc.name      testMoreNativeError0042
     * @tc.desc      Native return code -1 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = -1;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0043
     * @tc.name      testMoreNativeError0043
     * @tc.desc      Native return code 5400101 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400101;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400101);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0044
     * @tc.name      testMoreNativeError0044
     * @tc.desc      Native return code 5400102 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400102;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400102);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0045
     * @tc.name      testMoreNativeError0045
     * @tc.desc      Native return code 5400103 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400103;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400103);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0046
     * @tc.name      testMoreNativeError0046
     * @tc.desc      Native return code 5400104 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400104;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400104);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0047
     * @tc.name      testMoreNativeError0047
     * @tc.desc      Native return code 5400105 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400105;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400105);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0048
     * @tc.name      testMoreNativeError0048
     * @tc.desc      Native return code 5400106 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400106;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400106);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0049
     * @tc.name      testMoreNativeError0049
     * @tc.desc      Native return code 0 is classified as success=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 0;
      const success: boolean = code === 0;
      expect(success).assertEqual(true);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0050
     * @tc.name      testMoreNativeError0050
     * @tc.desc      Native return code -1 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = -1;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0051
     * @tc.name      testMoreNativeError0051
     * @tc.desc      Native return code 5400101 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400101;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400101);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0052
     * @tc.name      testMoreNativeError0052
     * @tc.desc      Native return code 5400102 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400102;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400102);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0053
     * @tc.name      testMoreNativeError0053
     * @tc.desc      Native return code 5400103 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400103;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400103);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0054
     * @tc.name      testMoreNativeError0054
     * @tc.desc      Native return code 5400104 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400104;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400104);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0055
     * @tc.name      testMoreNativeError0055
     * @tc.desc      Native return code 5400105 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400105;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400105);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0056
     * @tc.name      testMoreNativeError0056
     * @tc.desc      Native return code 5400106 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400106;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400106);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0057
     * @tc.name      testMoreNativeError0057
     * @tc.desc      Native return code 0 is classified as success=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 0;
      const success: boolean = code === 0;
      expect(success).assertEqual(true);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0058
     * @tc.name      testMoreNativeError0058
     * @tc.desc      Native return code -1 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = -1;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0059
     * @tc.name      testMoreNativeError0059
     * @tc.desc      Native return code 5400101 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400101;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400101);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0060
     * @tc.name      testMoreNativeError0060
     * @tc.desc      Native return code 5400102 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400102;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400102);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0061
     * @tc.name      testMoreNativeError0061
     * @tc.desc      Native return code 5400103 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400103;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400103);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0062
     * @tc.name      testMoreNativeError0062
     * @tc.desc      Native return code 5400104 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400104;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400104);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0063
     * @tc.name      testMoreNativeError0063
     * @tc.desc      Native return code 5400105 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400105;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400105);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0064
     * @tc.name      testMoreNativeError0064
     * @tc.desc      Native return code 5400106 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400106;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400106);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0065
     * @tc.name      testMoreNativeError0065
     * @tc.desc      Native return code 0 is classified as success=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 0;
      const success: boolean = code === 0;
      expect(success).assertEqual(true);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0066
     * @tc.name      testMoreNativeError0066
     * @tc.desc      Native return code -1 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = -1;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0067
     * @tc.name      testMoreNativeError0067
     * @tc.desc      Native return code 5400101 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400101;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400101);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0068
     * @tc.name      testMoreNativeError0068
     * @tc.desc      Native return code 5400102 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400102;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400102);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0069
     * @tc.name      testMoreNativeError0069
     * @tc.desc      Native return code 5400103 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400103;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400103);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0070
     * @tc.name      testMoreNativeError0070
     * @tc.desc      Native return code 5400104 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400104;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400104);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0071
     * @tc.name      testMoreNativeError0071
     * @tc.desc      Native return code 5400105 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400105;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400105);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0072
     * @tc.name      testMoreNativeError0072
     * @tc.desc      Native return code 5400106 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400106;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400106);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0073
     * @tc.name      testMoreNativeError0073
     * @tc.desc      Native return code 0 is classified as success=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 0;
      const success: boolean = code === 0;
      expect(success).assertEqual(true);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0074
     * @tc.name      testMoreNativeError0074
     * @tc.desc      Native return code -1 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = -1;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0075
     * @tc.name      testMoreNativeError0075
     * @tc.desc      Native return code 5400101 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400101;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400101);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0076
     * @tc.name      testMoreNativeError0076
     * @tc.desc      Native return code 5400102 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400102;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400102);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0077
     * @tc.name      testMoreNativeError0077
     * @tc.desc      Native return code 5400103 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400103;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400103);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0078
     * @tc.name      testMoreNativeError0078
     * @tc.desc      Native return code 5400104 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400104;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400104);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0079
     * @tc.name      testMoreNativeError0079
     * @tc.desc      Native return code 5400105 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400105;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400105);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0080
     * @tc.name      testMoreNativeError0080
     * @tc.desc      Native return code 5400106 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400106;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400106);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0081
     * @tc.name      testMoreNativeError0081
     * @tc.desc      Native return code 0 is classified as success=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 0;
      const success: boolean = code === 0;
      expect(success).assertEqual(true);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0082
     * @tc.name      testMoreNativeError0082
     * @tc.desc      Native return code -1 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = -1;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0083
     * @tc.name      testMoreNativeError0083
     * @tc.desc      Native return code 5400101 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400101;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400101);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0084
     * @tc.name      testMoreNativeError0084
     * @tc.desc      Native return code 5400102 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400102;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400102);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0085
     * @tc.name      testMoreNativeError0085
     * @tc.desc      Native return code 5400103 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400103;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400103);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0086
     * @tc.name      testMoreNativeError0086
     * @tc.desc      Native return code 5400104 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400104;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400104);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0087
     * @tc.name      testMoreNativeError0087
     * @tc.desc      Native return code 5400105 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400105;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400105);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0088
     * @tc.name      testMoreNativeError0088
     * @tc.desc      Native return code 5400106 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400106;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400106);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0089
     * @tc.name      testMoreNativeError0089
     * @tc.desc      Native return code 0 is classified as success=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 0;
      const success: boolean = code === 0;
      expect(success).assertEqual(true);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0090
     * @tc.name      testMoreNativeError0090
     * @tc.desc      Native return code -1 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = -1;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0091
     * @tc.name      testMoreNativeError0091
     * @tc.desc      Native return code 5400101 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400101;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400101);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0092
     * @tc.name      testMoreNativeError0092
     * @tc.desc      Native return code 5400102 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400102;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400102);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0093
     * @tc.name      testMoreNativeError0093
     * @tc.desc      Native return code 5400103 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400103;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400103);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0094
     * @tc.name      testMoreNativeError0094
     * @tc.desc      Native return code 5400104 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400104;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400104);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0095
     * @tc.name      testMoreNativeError0095
     * @tc.desc      Native return code 5400105 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400105;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400105);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0096
     * @tc.name      testMoreNativeError0096
     * @tc.desc      Native return code 5400106 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400106;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400106);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0097
     * @tc.name      testMoreNativeError0097
     * @tc.desc      Native return code 0 is classified as success=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 0;
      const success: boolean = code === 0;
      expect(success).assertEqual(true);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0098
     * @tc.name      testMoreNativeError0098
     * @tc.desc      Native return code -1 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = -1;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0099
     * @tc.name      testMoreNativeError0099
     * @tc.desc      Native return code 5400101 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400101;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400101);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ERR_0100
     * @tc.name      testMoreNativeError0100
     * @tc.desc      Native return code 5400102 is classified as success=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativeError0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: number = 5400102;
      const success: boolean = code === 0;
      expect(success).assertEqual(false);
      expect(Number.isInteger(code)).assertTrue();
      expect(code).assertEqual(5400102);
    })
  })
}
