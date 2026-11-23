/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { logInfo, BUNDLE } from '../common/ResolutionTestSupport';
import {
  validResolutionIndex,
} from '../model/ResolutionLogic';

/** ResolutionValidTest logic checks (43 cases). */
export default function resolutionValidTest(): void {
  describe('ResolutionValidTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0001
     * @tc.name      Resolution_ResValid_0001
     * @tc.desc      validResolutionIndex(0) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ResValid_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResValid_0001 begin`);
      logInfo("validResolutionIndex(0)");
      const actual: boolean = validResolutionIndex(0);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ResValid_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0002
     * @tc.name      Resolution_ResValid_0002
     * @tc.desc      validResolutionIndex(1) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0002 begin`);
      logInfo("validResolutionIndex(1)");
      const actual: boolean = validResolutionIndex(1);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ResValid_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0003
     * @tc.name      Resolution_ResValid_0003
     * @tc.desc      validResolutionIndex(2) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0003 begin`);
      logInfo("validResolutionIndex(2)");
      const actual: boolean = validResolutionIndex(2);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ResValid_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0004
     * @tc.name      Resolution_ResValid_0004
     * @tc.desc      validResolutionIndex(3) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0004 begin`);
      logInfo("validResolutionIndex(3)");
      const actual: boolean = validResolutionIndex(3);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ResValid_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0005
     * @tc.name      Resolution_ResValid_0005
     * @tc.desc      validResolutionIndex(4) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0005 begin`);
      logInfo("validResolutionIndex(4)");
      const actual: boolean = validResolutionIndex(4);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ResValid_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0006
     * @tc.name      Resolution_ResValid_0006
     * @tc.desc      validResolutionIndex(5) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0006 begin`);
      logInfo("validResolutionIndex(5)");
      const actual: boolean = validResolutionIndex(5);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ResValid_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0007
     * @tc.name      Resolution_ResValid_0007
     * @tc.desc      validResolutionIndex(6) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0007 begin`);
      logInfo("validResolutionIndex(6)");
      const actual: boolean = validResolutionIndex(6);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ResValid_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0008
     * @tc.name      Resolution_ResValid_0008
     * @tc.desc      validResolutionIndex(7) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0008 begin`);
      logInfo("validResolutionIndex(7)");
      const actual: boolean = validResolutionIndex(7);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ResValid_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0009
     * @tc.name      Resolution_ResValid_0009
     * @tc.desc      validResolutionIndex(8) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0009 begin`);
      logInfo("validResolutionIndex(8)");
      const actual: boolean = validResolutionIndex(8);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ResValid_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0010
     * @tc.name      Resolution_ResValid_0010
     * @tc.desc      validResolutionIndex(9) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0010 begin`);
      logInfo("validResolutionIndex(9)");
      const actual: boolean = validResolutionIndex(9);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ResValid_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0011
     * @tc.name      Resolution_ResValid_0011
     * @tc.desc      validResolutionIndex(10) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0011 begin`);
      logInfo("validResolutionIndex(10)");
      const actual: boolean = validResolutionIndex(10);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ResValid_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0012
     * @tc.name      Resolution_ResValid_0012
     * @tc.desc      validResolutionIndex(11) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ResValid_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResValid_0012 begin`);
      logInfo("validResolutionIndex(11)");
      const actual: boolean = validResolutionIndex(11);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ResValid_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0013
     * @tc.name      Resolution_ResValid_0013
     * @tc.desc      validResolutionIndex(12) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0013 begin`);
      logInfo("validResolutionIndex(12)");
      const actual: boolean = validResolutionIndex(12);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ResValid_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0014
     * @tc.name      Resolution_ResValid_0014
     * @tc.desc      validResolutionIndex(13) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0014 begin`);
      logInfo("validResolutionIndex(13)");
      const actual: boolean = validResolutionIndex(13);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ResValid_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0015
     * @tc.name      Resolution_ResValid_0015
     * @tc.desc      validResolutionIndex(14) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0015 begin`);
      logInfo("validResolutionIndex(14)");
      const actual: boolean = validResolutionIndex(14);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ResValid_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0016
     * @tc.name      Resolution_ResValid_0016
     * @tc.desc      validResolutionIndex(15) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0016 begin`);
      logInfo("validResolutionIndex(15)");
      const actual: boolean = validResolutionIndex(15);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ResValid_0016 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0017
     * @tc.name      Resolution_ResValid_0017
     * @tc.desc      validResolutionIndex(16) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0017 begin`);
      logInfo("validResolutionIndex(16)");
      const actual: boolean = validResolutionIndex(16);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ResValid_0017 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0018
     * @tc.name      Resolution_ResValid_0018
     * @tc.desc      validResolutionIndex(17) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_ResValid_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResValid_0018 begin`);
      logInfo("validResolutionIndex(17)");
      const actual: boolean = validResolutionIndex(17);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ResValid_0018 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0019
     * @tc.name      Resolution_ResValid_0019
     * @tc.desc      validResolutionIndex(-1) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0019 begin`);
      logInfo("validResolutionIndex(-1)");
      const actual: boolean = validResolutionIndex(-1);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ResValid_0019 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0020
     * @tc.name      Resolution_ResValid_0020
     * @tc.desc      validResolutionIndex(-2) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0020 begin`);
      logInfo("validResolutionIndex(-2)");
      const actual: boolean = validResolutionIndex(-2);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ResValid_0020 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0021
     * @tc.name      Resolution_ResValid_0021
     * @tc.desc      validResolutionIndex(20) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0021 begin`);
      logInfo("validResolutionIndex(20)");
      const actual: boolean = validResolutionIndex(20);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ResValid_0021 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0022
     * @tc.name      Resolution_ResValid_0022
     * @tc.desc      validResolutionIndex(30) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0022 begin`);
      logInfo("validResolutionIndex(30)");
      const actual: boolean = validResolutionIndex(30);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ResValid_0022 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0023
     * @tc.name      Resolution_ResValid_0023
     * @tc.desc      validResolutionIndex(40) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ResValid_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResValid_0023 begin`);
      logInfo("validResolutionIndex(40)");
      const actual: boolean = validResolutionIndex(40);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ResValid_0023 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0024
     * @tc.name      Resolution_ResValid_0024
     * @tc.desc      validResolutionIndex(50) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0024 begin`);
      logInfo("validResolutionIndex(50)");
      const actual: boolean = validResolutionIndex(50);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ResValid_0024 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0025
     * @tc.name      Resolution_ResValid_0025
     * @tc.desc      validResolutionIndex(60) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0025 begin`);
      logInfo("validResolutionIndex(60)");
      const actual: boolean = validResolutionIndex(60);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ResValid_0025 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0026
     * @tc.name      Resolution_ResValid_0026
     * @tc.desc      validResolutionIndex(70) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0026 begin`);
      logInfo("validResolutionIndex(70)");
      const actual: boolean = validResolutionIndex(70);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ResValid_0026 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0027
     * @tc.name      Resolution_ResValid_0027
     * @tc.desc      validResolutionIndex(80) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0027 begin`);
      logInfo("validResolutionIndex(80)");
      const actual: boolean = validResolutionIndex(80);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ResValid_0027 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0028
     * @tc.name      Resolution_ResValid_0028
     * @tc.desc      validResolutionIndex(90) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0028 begin`);
      logInfo("validResolutionIndex(90)");
      const actual: boolean = validResolutionIndex(90);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ResValid_0028 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0029
     * @tc.name      Resolution_ResValid_0029
     * @tc.desc      validResolutionIndex(100) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0029 begin`);
      logInfo("validResolutionIndex(100)");
      const actual: boolean = validResolutionIndex(100);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ResValid_0029 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0030
     * @tc.name      Resolution_ResValid_0030
     * @tc.desc      validResolutionIndex(200) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0030 begin`);
      logInfo("validResolutionIndex(200)");
      const actual: boolean = validResolutionIndex(200);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ResValid_0030 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0031
     * @tc.name      Resolution_ResValid_0031
     * @tc.desc      validResolutionIndex(255) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0031 begin`);
      logInfo("validResolutionIndex(255)");
      const actual: boolean = validResolutionIndex(255);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ResValid_0031 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0032
     * @tc.name      Resolution_ResValid_0032
     * @tc.desc      validResolutionIndex(360) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0032 begin`);
      logInfo("validResolutionIndex(360)");
      const actual: boolean = validResolutionIndex(360);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ResValid_0032 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0033
     * @tc.name      Resolution_ResValid_0033
     * @tc.desc      validResolutionIndex(720) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0033 begin`);
      logInfo("validResolutionIndex(720)");
      const actual: boolean = validResolutionIndex(720);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ResValid_0033 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0034
     * @tc.name      Resolution_ResValid_0034
     * @tc.desc      validResolutionIndex(1080) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ResValid_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResValid_0034 begin`);
      logInfo("validResolutionIndex(1080)");
      const actual: boolean = validResolutionIndex(1080);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ResValid_0034 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0035
     * @tc.name      Resolution_ResValid_0035
     * @tc.desc      validResolutionIndex(1280) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_ResValid_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResValid_0035 begin`);
      logInfo("validResolutionIndex(1280)");
      const actual: boolean = validResolutionIndex(1280);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ResValid_0035 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0036
     * @tc.name      Resolution_ResValid_0036
     * @tc.desc      validResolutionIndex(1920) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0036 begin`);
      logInfo("validResolutionIndex(1920)");
      const actual: boolean = validResolutionIndex(1920);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ResValid_0036 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0037
     * @tc.name      Resolution_ResValid_0037
     * @tc.desc      validResolutionIndex(3840) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0037 begin`);
      logInfo("validResolutionIndex(3840)");
      const actual: boolean = validResolutionIndex(3840);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ResValid_0037 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0038
     * @tc.name      Resolution_ResValid_0038
     * @tc.desc      validResolutionIndex(4096) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0038 begin`);
      logInfo("validResolutionIndex(4096)");
      const actual: boolean = validResolutionIndex(4096);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ResValid_0038 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0039
     * @tc.name      Resolution_ResValid_0039
     * @tc.desc      validResolutionIndex(999) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0039 begin`);
      logInfo("validResolutionIndex(999)");
      const actual: boolean = validResolutionIndex(999);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ResValid_0039 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0040
     * @tc.name      Resolution_ResValid_0040
     * @tc.desc      validResolutionIndex(1000) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0040 begin`);
      logInfo("validResolutionIndex(1000)");
      const actual: boolean = validResolutionIndex(1000);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ResValid_0040 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0041
     * @tc.name      Resolution_ResValid_0041
     * @tc.desc      validResolutionIndex(24) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0041 begin`);
      logInfo("validResolutionIndex(24)");
      const actual: boolean = validResolutionIndex(24);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ResValid_0041 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0042
     * @tc.name      Resolution_ResValid_0042
     * @tc.desc      validResolutionIndex(25) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0042 begin`);
      logInfo("validResolutionIndex(25)");
      const actual: boolean = validResolutionIndex(25);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ResValid_0042 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_VALID_0043
     * @tc.name      Resolution_ResValid_0043
     * @tc.desc      validResolutionIndex(28) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResValid_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResValid_0043 begin`);
      logInfo("validResolutionIndex(28)");
      const actual: boolean = validResolutionIndex(28);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ResValid_0043 end`);
    });
  });
}
