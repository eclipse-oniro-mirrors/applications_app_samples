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
