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
  dynamicConfigRatio,
} from '../model/ResolutionLogic';

/** DynamicConfigRatioTest logic checks (46 cases). */
export default function dynamicConfigRatioTest(): void {
  describe('DynamicConfigRatioTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0001
     * @tc.name      Resolution_DynamicRatio_0001
     * @tc.desc      dynamicConfigRatio(720, 1280) gives 1.777778.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DynamicRatio_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DynamicRatio_0001 begin`);
      logInfo("dynamicConfigRatio(720, 1280)");
      const actual: number = dynamicConfigRatio(720, 1280);
      logInfo('actual=' + String(actual) + ', expected=' + "1.777778");
      expect(actual).assertEqual(1.777778);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}DynamicRatio_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0002
     * @tc.name      Resolution_DynamicRatio_0002
     * @tc.desc      dynamicConfigRatio(721, 1279) gives 1.773925.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0002 begin`);
      logInfo("dynamicConfigRatio(721, 1279)");
      const actual: number = dynamicConfigRatio(721, 1279);
      logInfo('actual=' + String(actual) + ', expected=' + "1.773925");
      expect(actual).assertEqual(1.773925);
      logInfo(`${BUNDLE}DynamicRatio_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0003
     * @tc.name      Resolution_DynamicRatio_0003
     * @tc.desc      dynamicConfigRatio(722, 1278) gives 1.770083.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0003 begin`);
      logInfo("dynamicConfigRatio(722, 1278)");
      const actual: number = dynamicConfigRatio(722, 1278);
      logInfo('actual=' + String(actual) + ', expected=' + "1.770083");
      expect(actual).assertEqual(1.770083);
      logInfo(`${BUNDLE}DynamicRatio_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0004
     * @tc.name      Resolution_DynamicRatio_0004
     * @tc.desc      dynamicConfigRatio(723, 1277) gives 1.766252.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0004 begin`);
      logInfo("dynamicConfigRatio(723, 1277)");
      const actual: number = dynamicConfigRatio(723, 1277);
      logInfo('actual=' + String(actual) + ', expected=' + "1.766252");
      expect(actual).assertEqual(1.766252);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}DynamicRatio_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0005
     * @tc.name      Resolution_DynamicRatio_0005
     * @tc.desc      dynamicConfigRatio(724, 1276) gives 1.762431.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0005 begin`);
      logInfo("dynamicConfigRatio(724, 1276)");
      const actual: number = dynamicConfigRatio(724, 1276);
      logInfo('actual=' + String(actual) + ', expected=' + "1.762431");
      expect(actual).assertEqual(1.762431);
      logInfo(`${BUNDLE}DynamicRatio_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0006
     * @tc.name      Resolution_DynamicRatio_0006
     * @tc.desc      dynamicConfigRatio(725, 1275) gives 1.758621.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0006 begin`);
      logInfo("dynamicConfigRatio(725, 1275)");
      const actual: number = dynamicConfigRatio(725, 1275);
      logInfo('actual=' + String(actual) + ', expected=' + "1.758621");
      expect(actual).assertEqual(1.758621);
      logInfo(`${BUNDLE}DynamicRatio_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0007
     * @tc.name      Resolution_DynamicRatio_0007
     * @tc.desc      dynamicConfigRatio(726, 1274) gives 1.754821.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0007 begin`);
      logInfo("dynamicConfigRatio(726, 1274)");
      const actual: number = dynamicConfigRatio(726, 1274);
      logInfo('actual=' + String(actual) + ', expected=' + "1.754821");
      expect(actual).assertEqual(1.754821);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}DynamicRatio_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0008
     * @tc.name      Resolution_DynamicRatio_0008
     * @tc.desc      dynamicConfigRatio(727, 1273) gives 1.751032.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0008 begin`);
      logInfo("dynamicConfigRatio(727, 1273)");
      const actual: number = dynamicConfigRatio(727, 1273);
      logInfo('actual=' + String(actual) + ', expected=' + "1.751032");
      expect(actual).assertEqual(1.751032);
      logInfo(`${BUNDLE}DynamicRatio_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0009
     * @tc.name      Resolution_DynamicRatio_0009
     * @tc.desc      dynamicConfigRatio(728, 1272) gives 1.747253.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0009 begin`);
      logInfo("dynamicConfigRatio(728, 1272)");
      const actual: number = dynamicConfigRatio(728, 1272);
      logInfo('actual=' + String(actual) + ', expected=' + "1.747253");
      expect(actual).assertEqual(1.747253);
      logInfo(`${BUNDLE}DynamicRatio_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0010
     * @tc.name      Resolution_DynamicRatio_0010
     * @tc.desc      dynamicConfigRatio(729, 1271) gives 1.743484.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0010 begin`);
      logInfo("dynamicConfigRatio(729, 1271)");
      const actual: number = dynamicConfigRatio(729, 1271);
      logInfo('actual=' + String(actual) + ', expected=' + "1.743484");
      expect(actual).assertEqual(1.743484);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}DynamicRatio_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0011
     * @tc.name      Resolution_DynamicRatio_0011
     * @tc.desc      dynamicConfigRatio(730, 1270) gives 1.739726.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0011 begin`);
      logInfo("dynamicConfigRatio(730, 1270)");
      const actual: number = dynamicConfigRatio(730, 1270);
      logInfo('actual=' + String(actual) + ', expected=' + "1.739726");
      expect(actual).assertEqual(1.739726);
      logInfo(`${BUNDLE}DynamicRatio_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0012
     * @tc.name      Resolution_DynamicRatio_0012
     * @tc.desc      dynamicConfigRatio(731, 1269) gives 1.735978.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DynamicRatio_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DynamicRatio_0012 begin`);
      logInfo("dynamicConfigRatio(731, 1269)");
      const actual: number = dynamicConfigRatio(731, 1269);
      logInfo('actual=' + String(actual) + ', expected=' + "1.735978");
      expect(actual).assertEqual(1.735978);
      logInfo(`${BUNDLE}DynamicRatio_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0013
     * @tc.name      Resolution_DynamicRatio_0013
     * @tc.desc      dynamicConfigRatio(732, 1268) gives 1.73224.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0013 begin`);
      logInfo("dynamicConfigRatio(732, 1268)");
      const actual: number = dynamicConfigRatio(732, 1268);
      logInfo('actual=' + String(actual) + ', expected=' + "1.73224");
      expect(actual).assertEqual(1.73224);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}DynamicRatio_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0014
     * @tc.name      Resolution_DynamicRatio_0014
     * @tc.desc      dynamicConfigRatio(733, 1267) gives 1.728513.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0014 begin`);
      logInfo("dynamicConfigRatio(733, 1267)");
      const actual: number = dynamicConfigRatio(733, 1267);
      logInfo('actual=' + String(actual) + ', expected=' + "1.728513");
      expect(actual).assertEqual(1.728513);
      logInfo(`${BUNDLE}DynamicRatio_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0015
     * @tc.name      Resolution_DynamicRatio_0015
     * @tc.desc      dynamicConfigRatio(734, 1266) gives 1.724796.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0015 begin`);
      logInfo("dynamicConfigRatio(734, 1266)");
      const actual: number = dynamicConfigRatio(734, 1266);
      logInfo('actual=' + String(actual) + ', expected=' + "1.724796");
      expect(actual).assertEqual(1.724796);
      logInfo(`${BUNDLE}DynamicRatio_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0016
     * @tc.name      Resolution_DynamicRatio_0016
     * @tc.desc      dynamicConfigRatio(735, 1265) gives 1.721088.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0016 begin`);
      logInfo("dynamicConfigRatio(735, 1265)");
      const actual: number = dynamicConfigRatio(735, 1265);
      logInfo('actual=' + String(actual) + ', expected=' + "1.721088");
      expect(actual).assertEqual(1.721088);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}DynamicRatio_0016 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0017
     * @tc.name      Resolution_DynamicRatio_0017
     * @tc.desc      dynamicConfigRatio(736, 1264) gives 1.717391.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0017 begin`);
      logInfo("dynamicConfigRatio(736, 1264)");
      const actual: number = dynamicConfigRatio(736, 1264);
      logInfo('actual=' + String(actual) + ', expected=' + "1.717391");
      expect(actual).assertEqual(1.717391);
      logInfo(`${BUNDLE}DynamicRatio_0017 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0018
     * @tc.name      Resolution_DynamicRatio_0018
     * @tc.desc      dynamicConfigRatio(737, 1263) gives 1.713704.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_DynamicRatio_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DynamicRatio_0018 begin`);
      logInfo("dynamicConfigRatio(737, 1263)");
      const actual: number = dynamicConfigRatio(737, 1263);
      logInfo('actual=' + String(actual) + ', expected=' + "1.713704");
      expect(actual).assertEqual(1.713704);
      logInfo(`${BUNDLE}DynamicRatio_0018 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0019
     * @tc.name      Resolution_DynamicRatio_0019
     * @tc.desc      dynamicConfigRatio(738, 1262) gives 1.710027.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0019 begin`);
      logInfo("dynamicConfigRatio(738, 1262)");
      const actual: number = dynamicConfigRatio(738, 1262);
      logInfo('actual=' + String(actual) + ', expected=' + "1.710027");
      expect(actual).assertEqual(1.710027);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}DynamicRatio_0019 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0020
     * @tc.name      Resolution_DynamicRatio_0020
     * @tc.desc      dynamicConfigRatio(739, 1261) gives 1.70636.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0020 begin`);
      logInfo("dynamicConfigRatio(739, 1261)");
      const actual: number = dynamicConfigRatio(739, 1261);
      logInfo('actual=' + String(actual) + ', expected=' + "1.70636");
      expect(actual).assertEqual(1.70636);
      logInfo(`${BUNDLE}DynamicRatio_0020 end`);
    });

