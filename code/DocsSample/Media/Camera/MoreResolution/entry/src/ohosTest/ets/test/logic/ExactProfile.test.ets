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
  selectExactProfileIndex,
  Profile,
} from '../model/ResolutionLogic';

/** ExactProfileTest logic checks (46 cases). */
export default function exactProfileTest(): void {
  describe('ExactProfileTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0001
     * @tc.name      Resolution_ExactProfile_0001
     * @tc.desc      exact profile lookup for 0x0 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ExactProfile_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExactProfile_0001 begin`);
      logInfo("selectExactProfileIndex([new Profile(1280, 720, 1003, 30, 60)], 0, 0)");
      const actual: number = selectExactProfileIndex([new Profile(1280, 720, 1003, 30, 60)], 0, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ExactProfile_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0002
     * @tc.name      Resolution_ExactProfile_0002
     * @tc.desc      exact profile lookup for 37x53 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0002 begin`);
      logInfo("selectExactProfileIndex([new Profile(1920, 1080, 2000, 0, 0)], 37, 53)");
      const actual: number = selectExactProfileIndex([new Profile(1920, 1080, 2000, 0, 0)], 37, 53);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ExactProfile_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0003
     * @tc.name      Resolution_ExactProfile_0003
     * @tc.desc      exact profile lookup for 74x106 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0003 begin`);
      logInfo("selectExactProfileIndex([new Profile(1088, 1088, 1003, 30, 60)], 74, 106)");
      const actual: number = selectExactProfileIndex([new Profile(1088, 1088, 1003, 30, 60)], 74, 106);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ExactProfile_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0004
     * @tc.name      Resolution_ExactProfile_0004
     * @tc.desc      exact profile lookup for 111x159 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0004 begin`);
      logInfo("selectExactProfileIndex([new Profile(640, 480, 1003, 30, 60)], 111, 159)");
      const actual: number = selectExactProfileIndex([new Profile(640, 480, 1003, 30, 60)], 111, 159);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ExactProfile_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0005
     * @tc.name      Resolution_ExactProfile_0005
     * @tc.desc      exact profile lookup for 148x212 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0005 begin`);
      logInfo("selectExactProfileIndex([new Profile(1280, 720, 1003, 30, 60)], 148, 212)");
      const actual: number = selectExactProfileIndex([new Profile(1280, 720, 1003, 30, 60)], 148, 212);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ExactProfile_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0006
     * @tc.name      Resolution_ExactProfile_0006
     * @tc.desc      exact profile lookup for 185x265 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0006 begin`);
      logInfo("selectExactProfileIndex([new Profile(1920, 1080, 2000, 0, 0)], 185, 265)");
      const actual: number = selectExactProfileIndex([new Profile(1920, 1080, 2000, 0, 0)], 185, 265);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ExactProfile_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0007
     * @tc.name      Resolution_ExactProfile_0007
     * @tc.desc      exact profile lookup for 222x318 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0007 begin`);
      logInfo("selectExactProfileIndex([new Profile(1088, 1088, 1003, 30, 60)], 222, 318)");
      const actual: number = selectExactProfileIndex([new Profile(1088, 1088, 1003, 30, 60)], 222, 318);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ExactProfile_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0008
     * @tc.name      Resolution_ExactProfile_0008
     * @tc.desc      exact profile lookup for 259x371 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0008 begin`);
      logInfo("selectExactProfileIndex([new Profile(640, 480, 1003, 30, 60)], 259, 371)");
      const actual: number = selectExactProfileIndex([new Profile(640, 480, 1003, 30, 60)], 259, 371);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ExactProfile_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0009
     * @tc.name      Resolution_ExactProfile_0009
     * @tc.desc      exact profile lookup for 296x424 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0009 begin`);
      logInfo("selectExactProfileIndex([new Profile(1280, 720, 1003, 30, 60)], 296, 424)");
      const actual: number = selectExactProfileIndex([new Profile(1280, 720, 1003, 30, 60)], 296, 424);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ExactProfile_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0010
     * @tc.name      Resolution_ExactProfile_0010
     * @tc.desc      exact profile lookup for 333x477 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0010 begin`);
      logInfo("selectExactProfileIndex([new Profile(1920, 1080, 2000, 0, 0)], 333, 477)");
      const actual: number = selectExactProfileIndex([new Profile(1920, 1080, 2000, 0, 0)], 333, 477);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ExactProfile_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0011
     * @tc.name      Resolution_ExactProfile_0011
     * @tc.desc      exact profile lookup for 370x530 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0011 begin`);
      logInfo("selectExactProfileIndex([new Profile(1088, 1088, 1003, 30, 60)], 370, 530)");
      const actual: number = selectExactProfileIndex([new Profile(1088, 1088, 1003, 30, 60)], 370, 530);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ExactProfile_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0012
     * @tc.name      Resolution_ExactProfile_0012
     * @tc.desc      exact profile lookup for 407x583 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ExactProfile_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExactProfile_0012 begin`);
      logInfo("selectExactProfileIndex([new Profile(640, 480, 1003, 30, 60)], 407, 583)");
      const actual: number = selectExactProfileIndex([new Profile(640, 480, 1003, 30, 60)], 407, 583);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ExactProfile_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0013
     * @tc.name      Resolution_ExactProfile_0013
     * @tc.desc      exact profile lookup for 444x636 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0013 begin`);
      logInfo("selectExactProfileIndex([new Profile(1280, 720, 1003, 30, 60)], 444, 636)");
      const actual: number = selectExactProfileIndex([new Profile(1280, 720, 1003, 30, 60)], 444, 636);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ExactProfile_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0014
     * @tc.name      Resolution_ExactProfile_0014
     * @tc.desc      exact profile lookup for 481x689 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0014 begin`);
      logInfo("selectExactProfileIndex([new Profile(1920, 1080, 2000, 0, 0)], 481, 689)");
      const actual: number = selectExactProfileIndex([new Profile(1920, 1080, 2000, 0, 0)], 481, 689);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ExactProfile_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0015
     * @tc.name      Resolution_ExactProfile_0015
     * @tc.desc      exact profile lookup for 518x742 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0015 begin`);
      logInfo("selectExactProfileIndex([new Profile(1088, 1088, 1003, 30, 60)], 518, 742)");
      const actual: number = selectExactProfileIndex([new Profile(1088, 1088, 1003, 30, 60)], 518, 742);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ExactProfile_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0016
     * @tc.name      Resolution_ExactProfile_0016
     * @tc.desc      exact profile lookup for 555x795 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0016 begin`);
      logInfo("selectExactProfileIndex([new Profile(640, 480, 1003, 30, 60)], 555, 795)");
      const actual: number = selectExactProfileIndex([new Profile(640, 480, 1003, 30, 60)], 555, 795);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ExactProfile_0016 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0017
     * @tc.name      Resolution_ExactProfile_0017
     * @tc.desc      exact profile lookup for 592x848 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0017 begin`);
      logInfo("selectExactProfileIndex([new Profile(1280, 720, 1003, 30, 60)], 592, 848)");
      const actual: number = selectExactProfileIndex([new Profile(1280, 720, 1003, 30, 60)], 592, 848);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ExactProfile_0017 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0018
     * @tc.name      Resolution_ExactProfile_0018
     * @tc.desc      exact profile lookup for 629x901 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_ExactProfile_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExactProfile_0018 begin`);
      logInfo("selectExactProfileIndex([new Profile(1920, 1080, 2000, 0, 0)], 629, 901)");
      const actual: number = selectExactProfileIndex([new Profile(1920, 1080, 2000, 0, 0)], 629, 901);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ExactProfile_0018 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0019
     * @tc.name      Resolution_ExactProfile_0019
     * @tc.desc      exact profile lookup for 666x954 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0019 begin`);
      logInfo("selectExactProfileIndex([new Profile(1088, 1088, 1003, 30, 60)], 666, 954)");
      const actual: number = selectExactProfileIndex([new Profile(1088, 1088, 1003, 30, 60)], 666, 954);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ExactProfile_0019 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0020
     * @tc.name      Resolution_ExactProfile_0020
     * @tc.desc      exact profile lookup for 703x1007 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0020 begin`);
      logInfo("selectExactProfileIndex([new Profile(640, 480, 1003, 30, 60)], 703, 1007)");
      const actual: number = selectExactProfileIndex([new Profile(640, 480, 1003, 30, 60)], 703, 1007);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ExactProfile_0020 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0021
     * @tc.name      Resolution_ExactProfile_0021
     * @tc.desc      exact profile lookup for 740x1060 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0021 begin`);
      logInfo("selectExactProfileIndex([new Profile(1280, 720, 1003, 30, 60)], 740, 1060)");
      const actual: number = selectExactProfileIndex([new Profile(1280, 720, 1003, 30, 60)], 740, 1060);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ExactProfile_0021 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0022
     * @tc.name      Resolution_ExactProfile_0022
     * @tc.desc      exact profile lookup for 777x1113 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0022 begin`);
      logInfo("selectExactProfileIndex([new Profile(1920, 1080, 2000, 0, 0)], 777, 1113)");
      const actual: number = selectExactProfileIndex([new Profile(1920, 1080, 2000, 0, 0)], 777, 1113);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ExactProfile_0022 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0023
     * @tc.name      Resolution_ExactProfile_0023
     * @tc.desc      exact profile lookup for 814x1166 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ExactProfile_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExactProfile_0023 begin`);
      logInfo("selectExactProfileIndex([new Profile(1088, 1088, 1003, 30, 60)], 814, 1166)");
      const actual: number = selectExactProfileIndex([new Profile(1088, 1088, 1003, 30, 60)], 814, 1166);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ExactProfile_0023 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0024
     * @tc.name      Resolution_ExactProfile_0024
     * @tc.desc      exact profile lookup for 851x1219 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0024 begin`);
      logInfo("selectExactProfileIndex([new Profile(640, 480, 1003, 30, 60)], 851, 1219)");
      const actual: number = selectExactProfileIndex([new Profile(640, 480, 1003, 30, 60)], 851, 1219);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ExactProfile_0024 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0025
     * @tc.name      Resolution_ExactProfile_0025
     * @tc.desc      exact profile lookup for 888x1272 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0025 begin`);
      logInfo("selectExactProfileIndex([new Profile(1280, 720, 1003, 30, 60)], 888, 1272)");
      const actual: number = selectExactProfileIndex([new Profile(1280, 720, 1003, 30, 60)], 888, 1272);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ExactProfile_0025 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0026
     * @tc.name      Resolution_ExactProfile_0026
     * @tc.desc      exact profile lookup for 925x1325 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0026 begin`);
      logInfo("selectExactProfileIndex([new Profile(1920, 1080, 2000, 0, 0)], 925, 1325)");
      const actual: number = selectExactProfileIndex([new Profile(1920, 1080, 2000, 0, 0)], 925, 1325);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ExactProfile_0026 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0027
     * @tc.name      Resolution_ExactProfile_0027
     * @tc.desc      exact profile lookup for 962x1378 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0027 begin`);
      logInfo("selectExactProfileIndex([new Profile(1088, 1088, 1003, 30, 60)], 962, 1378)");
      const actual: number = selectExactProfileIndex([new Profile(1088, 1088, 1003, 30, 60)], 962, 1378);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ExactProfile_0027 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0028
     * @tc.name      Resolution_ExactProfile_0028
     * @tc.desc      exact profile lookup for 999x1431 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0028 begin`);
      logInfo("selectExactProfileIndex([new Profile(640, 480, 1003, 30, 60)], 999, 1431)");
      const actual: number = selectExactProfileIndex([new Profile(640, 480, 1003, 30, 60)], 999, 1431);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ExactProfile_0028 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0029
     * @tc.name      Resolution_ExactProfile_0029
     * @tc.desc      exact profile lookup for 1036x1484 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0029 begin`);
      logInfo("selectExactProfileIndex([new Profile(1280, 720, 1003, 30, 60)], 1036, 1484)");
      const actual: number = selectExactProfileIndex([new Profile(1280, 720, 1003, 30, 60)], 1036, 1484);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ExactProfile_0029 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0030
     * @tc.name      Resolution_ExactProfile_0030
     * @tc.desc      exact profile lookup for 1073x1537 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0030 begin`);
      logInfo("selectExactProfileIndex([new Profile(1920, 1080, 2000, 0, 0)], 1073, 1537)");
      const actual: number = selectExactProfileIndex([new Profile(1920, 1080, 2000, 0, 0)], 1073, 1537);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ExactProfile_0030 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0031
     * @tc.name      Resolution_ExactProfile_0031
     * @tc.desc      exact profile lookup for 1110x1590 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0031 begin`);
      logInfo("selectExactProfileIndex([new Profile(1088, 1088, 1003, 30, 60)], 1110, 1590)");
      const actual: number = selectExactProfileIndex([new Profile(1088, 1088, 1003, 30, 60)], 1110, 1590);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ExactProfile_0031 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0032
     * @tc.name      Resolution_ExactProfile_0032
     * @tc.desc      exact profile lookup for 1147x1643 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0032 begin`);
      logInfo("selectExactProfileIndex([new Profile(640, 480, 1003, 30, 60)], 1147, 1643)");
      const actual: number = selectExactProfileIndex([new Profile(640, 480, 1003, 30, 60)], 1147, 1643);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ExactProfile_0032 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0033
     * @tc.name      Resolution_ExactProfile_0033
     * @tc.desc      exact profile lookup for 1184x1696 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0033 begin`);
      logInfo("selectExactProfileIndex([new Profile(1280, 720, 1003, 30, 60)], 1184, 1696)");
      const actual: number = selectExactProfileIndex([new Profile(1280, 720, 1003, 30, 60)], 1184, 1696);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ExactProfile_0033 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0034
     * @tc.name      Resolution_ExactProfile_0034
     * @tc.desc      exact profile lookup for 1221x1749 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ExactProfile_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExactProfile_0034 begin`);
      logInfo("selectExactProfileIndex([new Profile(1920, 1080, 2000, 0, 0)], 1221, 1749)");
      const actual: number = selectExactProfileIndex([new Profile(1920, 1080, 2000, 0, 0)], 1221, 1749);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ExactProfile_0034 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0035
     * @tc.name      Resolution_ExactProfile_0035
     * @tc.desc      exact profile lookup for 1258x1802 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_ExactProfile_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExactProfile_0035 begin`);
      logInfo("selectExactProfileIndex([new Profile(1088, 1088, 1003, 30, 60)], 1258, 1802)");
      const actual: number = selectExactProfileIndex([new Profile(1088, 1088, 1003, 30, 60)], 1258, 1802);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ExactProfile_0035 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0036
     * @tc.name      Resolution_ExactProfile_0036
     * @tc.desc      exact profile lookup for 1295x1855 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0036 begin`);
      logInfo("selectExactProfileIndex([new Profile(640, 480, 1003, 30, 60)], 1295, 1855)");
      const actual: number = selectExactProfileIndex([new Profile(640, 480, 1003, 30, 60)], 1295, 1855);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ExactProfile_0036 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0037
     * @tc.name      Resolution_ExactProfile_0037
     * @tc.desc      exact profile lookup for 1332x1908 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0037 begin`);
      logInfo("selectExactProfileIndex([new Profile(1280, 720, 1003, 30, 60)], 1332, 1908)");
      const actual: number = selectExactProfileIndex([new Profile(1280, 720, 1003, 30, 60)], 1332, 1908);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ExactProfile_0037 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0038
     * @tc.name      Resolution_ExactProfile_0038
     * @tc.desc      exact profile lookup for 1369x1961 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0038 begin`);
      logInfo("selectExactProfileIndex([new Profile(1920, 1080, 2000, 0, 0)], 1369, 1961)");
      const actual: number = selectExactProfileIndex([new Profile(1920, 1080, 2000, 0, 0)], 1369, 1961);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ExactProfile_0038 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0039
     * @tc.name      Resolution_ExactProfile_0039
     * @tc.desc      exact profile lookup for 1406x2014 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0039 begin`);
      logInfo("selectExactProfileIndex([new Profile(1088, 1088, 1003, 30, 60)], 1406, 2014)");
      const actual: number = selectExactProfileIndex([new Profile(1088, 1088, 1003, 30, 60)], 1406, 2014);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ExactProfile_0039 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0040
     * @tc.name      Resolution_ExactProfile_0040
     * @tc.desc      exact profile lookup for 1443x2067 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0040 begin`);
      logInfo("selectExactProfileIndex([new Profile(640, 480, 1003, 30, 60)], 1443, 2067)");
      const actual: number = selectExactProfileIndex([new Profile(640, 480, 1003, 30, 60)], 1443, 2067);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ExactProfile_0040 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0041
     * @tc.name      Resolution_ExactProfile_0041
     * @tc.desc      exact profile lookup for 1480x2120 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0041 begin`);
      logInfo("selectExactProfileIndex([new Profile(1280, 720, 1003, 30, 60)], 1480, 2120)");
      const actual: number = selectExactProfileIndex([new Profile(1280, 720, 1003, 30, 60)], 1480, 2120);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ExactProfile_0041 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0042
     * @tc.name      Resolution_ExactProfile_0042
     * @tc.desc      exact profile lookup for 1517x2173 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0042 begin`);
      logInfo("selectExactProfileIndex([new Profile(1920, 1080, 2000, 0, 0)], 1517, 2173)");
      const actual: number = selectExactProfileIndex([new Profile(1920, 1080, 2000, 0, 0)], 1517, 2173);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ExactProfile_0042 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0043
     * @tc.name      Resolution_ExactProfile_0043
     * @tc.desc      exact profile lookup for 1554x2226 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0043 begin`);
      logInfo("selectExactProfileIndex([new Profile(1088, 1088, 1003, 30, 60)], 1554, 2226)");
      const actual: number = selectExactProfileIndex([new Profile(1088, 1088, 1003, 30, 60)], 1554, 2226);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ExactProfile_0043 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0044
     * @tc.name      Resolution_ExactProfile_0044
     * @tc.desc      exact profile lookup for 1591x2279 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0044 begin`);
      logInfo("selectExactProfileIndex([new Profile(640, 480, 1003, 30, 60)], 1591, 2279)");
      const actual: number = selectExactProfileIndex([new Profile(640, 480, 1003, 30, 60)], 1591, 2279);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ExactProfile_0044 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0045
     * @tc.name      Resolution_ExactProfile_0045
     * @tc.desc      exact profile lookup for 1628x2332 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ExactProfile_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExactProfile_0045 begin`);
      logInfo("selectExactProfileIndex([new Profile(1280, 720, 1003, 30, 60)], 1628, 2332)");
      const actual: number = selectExactProfileIndex([new Profile(1280, 720, 1003, 30, 60)], 1628, 2332);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ExactProfile_0045 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EXACT_PROFILE_0046
     * @tc.name      Resolution_ExactProfile_0046
     * @tc.desc      exact profile lookup for 1665x2385 returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ExactProfile_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExactProfile_0046 begin`);
      logInfo("selectExactProfileIndex([new Profile(1920, 1080, 2000, 0, 0)], 1665, 2385)");
      const actual: number = selectExactProfileIndex([new Profile(1920, 1080, 2000, 0, 0)], 1665, 2385);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ExactProfile_0046 end`);
    });
  });
}
