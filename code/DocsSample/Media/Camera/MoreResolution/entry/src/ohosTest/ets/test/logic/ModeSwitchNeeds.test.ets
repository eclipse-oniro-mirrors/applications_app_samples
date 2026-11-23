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
  modeSwitchNeedsReinit,
} from '../model/ResolutionLogic';

/** ModeSwitchNeedsTest logic checks (36 cases). */
export default function modeSwitchNeedsTest(): void {
  describe('ModeSwitchNeedsTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0001
     * @tc.name      Resolution_ModeNeeds_0001
     * @tc.desc      modeSwitchNeedsReinit(-1, -1) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ModeNeeds_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModeNeeds_0001 begin`);
      logInfo("modeSwitchNeedsReinit(-1, -1)");
      const actual: boolean = modeSwitchNeedsReinit(-1, -1);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ModeNeeds_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0002
     * @tc.name      Resolution_ModeNeeds_0002
     * @tc.desc      modeSwitchNeedsReinit(-1, 0) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ModeNeeds_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModeNeeds_0002 begin`);
      logInfo("modeSwitchNeedsReinit(-1, 0)");
      const actual: boolean = modeSwitchNeedsReinit(-1, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ModeNeeds_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0003
     * @tc.name      Resolution_ModeNeeds_0003
     * @tc.desc      modeSwitchNeedsReinit(-1, 1) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ModeNeeds_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModeNeeds_0003 begin`);
      logInfo("modeSwitchNeedsReinit(-1, 1)");
      const actual: boolean = modeSwitchNeedsReinit(-1, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ModeNeeds_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0004
     * @tc.name      Resolution_ModeNeeds_0004
     * @tc.desc      modeSwitchNeedsReinit(-1, 2) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ModeNeeds_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModeNeeds_0004 begin`);
      logInfo("modeSwitchNeedsReinit(-1, 2)");
      const actual: boolean = modeSwitchNeedsReinit(-1, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ModeNeeds_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0005
     * @tc.name      Resolution_ModeNeeds_0005
     * @tc.desc      modeSwitchNeedsReinit(-1, 3) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ModeNeeds_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModeNeeds_0005 begin`);
      logInfo("modeSwitchNeedsReinit(-1, 3)");
      const actual: boolean = modeSwitchNeedsReinit(-1, 3);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ModeNeeds_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0006
     * @tc.name      Resolution_ModeNeeds_0006
     * @tc.desc      modeSwitchNeedsReinit(-1, 4) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ModeNeeds_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModeNeeds_0006 begin`);
      logInfo("modeSwitchNeedsReinit(-1, 4)");
      const actual: boolean = modeSwitchNeedsReinit(-1, 4);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ModeNeeds_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0007
     * @tc.name      Resolution_ModeNeeds_0007
     * @tc.desc      modeSwitchNeedsReinit(0, -1) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ModeNeeds_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModeNeeds_0007 begin`);
      logInfo("modeSwitchNeedsReinit(0, -1)");
      const actual: boolean = modeSwitchNeedsReinit(0, -1);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ModeNeeds_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0008
     * @tc.name      Resolution_ModeNeeds_0008
     * @tc.desc      modeSwitchNeedsReinit(0, 0) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ModeNeeds_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModeNeeds_0008 begin`);
      logInfo("modeSwitchNeedsReinit(0, 0)");
      const actual: boolean = modeSwitchNeedsReinit(0, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ModeNeeds_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0009
     * @tc.name      Resolution_ModeNeeds_0009
     * @tc.desc      modeSwitchNeedsReinit(0, 1) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ModeNeeds_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModeNeeds_0009 begin`);
      logInfo("modeSwitchNeedsReinit(0, 1)");
      const actual: boolean = modeSwitchNeedsReinit(0, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ModeNeeds_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0010
     * @tc.name      Resolution_ModeNeeds_0010
     * @tc.desc      modeSwitchNeedsReinit(0, 2) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ModeNeeds_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModeNeeds_0010 begin`);
      logInfo("modeSwitchNeedsReinit(0, 2)");
      const actual: boolean = modeSwitchNeedsReinit(0, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ModeNeeds_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0011
     * @tc.name      Resolution_ModeNeeds_0011
     * @tc.desc      modeSwitchNeedsReinit(0, 3) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ModeNeeds_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModeNeeds_0011 begin`);
      logInfo("modeSwitchNeedsReinit(0, 3)");
      const actual: boolean = modeSwitchNeedsReinit(0, 3);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ModeNeeds_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0012
     * @tc.name      Resolution_ModeNeeds_0012
     * @tc.desc      modeSwitchNeedsReinit(0, 4) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ModeNeeds_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModeNeeds_0012 begin`);
      logInfo("modeSwitchNeedsReinit(0, 4)");
      const actual: boolean = modeSwitchNeedsReinit(0, 4);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ModeNeeds_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0013
     * @tc.name      Resolution_ModeNeeds_0013
     * @tc.desc      modeSwitchNeedsReinit(1, -1) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ModeNeeds_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModeNeeds_0013 begin`);
      logInfo("modeSwitchNeedsReinit(1, -1)");
      const actual: boolean = modeSwitchNeedsReinit(1, -1);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ModeNeeds_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0014
     * @tc.name      Resolution_ModeNeeds_0014
     * @tc.desc      modeSwitchNeedsReinit(1, 0) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ModeNeeds_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModeNeeds_0014 begin`);
      logInfo("modeSwitchNeedsReinit(1, 0)");
      const actual: boolean = modeSwitchNeedsReinit(1, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ModeNeeds_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0015
     * @tc.name      Resolution_ModeNeeds_0015
     * @tc.desc      modeSwitchNeedsReinit(1, 1) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ModeNeeds_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModeNeeds_0015 begin`);
      logInfo("modeSwitchNeedsReinit(1, 1)");
      const actual: boolean = modeSwitchNeedsReinit(1, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ModeNeeds_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0016
     * @tc.name      Resolution_ModeNeeds_0016
     * @tc.desc      modeSwitchNeedsReinit(1, 2) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ModeNeeds_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModeNeeds_0016 begin`);
      logInfo("modeSwitchNeedsReinit(1, 2)");
      const actual: boolean = modeSwitchNeedsReinit(1, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ModeNeeds_0016 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0017
     * @tc.name      Resolution_ModeNeeds_0017
     * @tc.desc      modeSwitchNeedsReinit(1, 3) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ModeNeeds_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModeNeeds_0017 begin`);
      logInfo("modeSwitchNeedsReinit(1, 3)");
      const actual: boolean = modeSwitchNeedsReinit(1, 3);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ModeNeeds_0017 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0018
     * @tc.name      Resolution_ModeNeeds_0018
     * @tc.desc      modeSwitchNeedsReinit(1, 4) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_ModeNeeds_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModeNeeds_0018 begin`);
      logInfo("modeSwitchNeedsReinit(1, 4)");
      const actual: boolean = modeSwitchNeedsReinit(1, 4);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ModeNeeds_0018 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0019
     * @tc.name      Resolution_ModeNeeds_0019
     * @tc.desc      modeSwitchNeedsReinit(2, -1) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ModeNeeds_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModeNeeds_0019 begin`);
      logInfo("modeSwitchNeedsReinit(2, -1)");
      const actual: boolean = modeSwitchNeedsReinit(2, -1);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ModeNeeds_0019 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0020
     * @tc.name      Resolution_ModeNeeds_0020
     * @tc.desc      modeSwitchNeedsReinit(2, 0) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ModeNeeds_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModeNeeds_0020 begin`);
      logInfo("modeSwitchNeedsReinit(2, 0)");
      const actual: boolean = modeSwitchNeedsReinit(2, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ModeNeeds_0020 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0021
     * @tc.name      Resolution_ModeNeeds_0021
     * @tc.desc      modeSwitchNeedsReinit(2, 1) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ModeNeeds_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModeNeeds_0021 begin`);
      logInfo("modeSwitchNeedsReinit(2, 1)");
      const actual: boolean = modeSwitchNeedsReinit(2, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ModeNeeds_0021 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0022
     * @tc.name      Resolution_ModeNeeds_0022
     * @tc.desc      modeSwitchNeedsReinit(2, 2) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ModeNeeds_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModeNeeds_0022 begin`);
      logInfo("modeSwitchNeedsReinit(2, 2)");
      const actual: boolean = modeSwitchNeedsReinit(2, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ModeNeeds_0022 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0023
     * @tc.name      Resolution_ModeNeeds_0023
     * @tc.desc      modeSwitchNeedsReinit(2, 3) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ModeNeeds_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModeNeeds_0023 begin`);
      logInfo("modeSwitchNeedsReinit(2, 3)");
      const actual: boolean = modeSwitchNeedsReinit(2, 3);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ModeNeeds_0023 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0024
     * @tc.name      Resolution_ModeNeeds_0024
     * @tc.desc      modeSwitchNeedsReinit(2, 4) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ModeNeeds_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModeNeeds_0024 begin`);
      logInfo("modeSwitchNeedsReinit(2, 4)");
      const actual: boolean = modeSwitchNeedsReinit(2, 4);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ModeNeeds_0024 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0025
     * @tc.name      Resolution_ModeNeeds_0025
     * @tc.desc      modeSwitchNeedsReinit(3, -1) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ModeNeeds_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModeNeeds_0025 begin`);
      logInfo("modeSwitchNeedsReinit(3, -1)");
      const actual: boolean = modeSwitchNeedsReinit(3, -1);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ModeNeeds_0025 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0026
     * @tc.name      Resolution_ModeNeeds_0026
     * @tc.desc      modeSwitchNeedsReinit(3, 0) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ModeNeeds_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModeNeeds_0026 begin`);
      logInfo("modeSwitchNeedsReinit(3, 0)");
      const actual: boolean = modeSwitchNeedsReinit(3, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ModeNeeds_0026 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0027
     * @tc.name      Resolution_ModeNeeds_0027
     * @tc.desc      modeSwitchNeedsReinit(3, 1) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ModeNeeds_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModeNeeds_0027 begin`);
      logInfo("modeSwitchNeedsReinit(3, 1)");
      const actual: boolean = modeSwitchNeedsReinit(3, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ModeNeeds_0027 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0028
     * @tc.name      Resolution_ModeNeeds_0028
     * @tc.desc      modeSwitchNeedsReinit(3, 2) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ModeNeeds_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModeNeeds_0028 begin`);
      logInfo("modeSwitchNeedsReinit(3, 2)");
      const actual: boolean = modeSwitchNeedsReinit(3, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ModeNeeds_0028 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0029
     * @tc.name      Resolution_ModeNeeds_0029
     * @tc.desc      modeSwitchNeedsReinit(3, 3) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ModeNeeds_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModeNeeds_0029 begin`);
      logInfo("modeSwitchNeedsReinit(3, 3)");
      const actual: boolean = modeSwitchNeedsReinit(3, 3);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ModeNeeds_0029 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0030
     * @tc.name      Resolution_ModeNeeds_0030
     * @tc.desc      modeSwitchNeedsReinit(3, 4) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ModeNeeds_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModeNeeds_0030 begin`);
      logInfo("modeSwitchNeedsReinit(3, 4)");
      const actual: boolean = modeSwitchNeedsReinit(3, 4);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ModeNeeds_0030 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0031
     * @tc.name      Resolution_ModeNeeds_0031
     * @tc.desc      modeSwitchNeedsReinit(4, -1) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ModeNeeds_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModeNeeds_0031 begin`);
      logInfo("modeSwitchNeedsReinit(4, -1)");
      const actual: boolean = modeSwitchNeedsReinit(4, -1);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ModeNeeds_0031 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0032
     * @tc.name      Resolution_ModeNeeds_0032
     * @tc.desc      modeSwitchNeedsReinit(4, 0) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ModeNeeds_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModeNeeds_0032 begin`);
      logInfo("modeSwitchNeedsReinit(4, 0)");
      const actual: boolean = modeSwitchNeedsReinit(4, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ModeNeeds_0032 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0033
     * @tc.name      Resolution_ModeNeeds_0033
     * @tc.desc      modeSwitchNeedsReinit(4, 1) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ModeNeeds_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModeNeeds_0033 begin`);
      logInfo("modeSwitchNeedsReinit(4, 1)");
      const actual: boolean = modeSwitchNeedsReinit(4, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ModeNeeds_0033 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0034
     * @tc.name      Resolution_ModeNeeds_0034
     * @tc.desc      modeSwitchNeedsReinit(4, 2) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ModeNeeds_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModeNeeds_0034 begin`);
      logInfo("modeSwitchNeedsReinit(4, 2)");
      const actual: boolean = modeSwitchNeedsReinit(4, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ModeNeeds_0034 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0035
     * @tc.name      Resolution_ModeNeeds_0035
     * @tc.desc      modeSwitchNeedsReinit(4, 3) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_ModeNeeds_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModeNeeds_0035 begin`);
      logInfo("modeSwitchNeedsReinit(4, 3)");
      const actual: boolean = modeSwitchNeedsReinit(4, 3);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ModeNeeds_0035 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_MODE_NEEDS_0036
     * @tc.name      Resolution_ModeNeeds_0036
     * @tc.desc      modeSwitchNeedsReinit(4, 4) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ModeNeeds_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModeNeeds_0036 begin`);
      logInfo("modeSwitchNeedsReinit(4, 4)");
      const actual: boolean = modeSwitchNeedsReinit(4, 4);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ModeNeeds_0036 end`);
    });
  });
}
