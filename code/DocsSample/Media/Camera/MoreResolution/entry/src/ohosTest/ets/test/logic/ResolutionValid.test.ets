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
