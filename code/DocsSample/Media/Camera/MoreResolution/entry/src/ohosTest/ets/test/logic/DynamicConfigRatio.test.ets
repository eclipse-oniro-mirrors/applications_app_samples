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

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0021
     * @tc.name      Resolution_DynamicRatio_0021
     * @tc.desc      dynamicConfigRatio(740, 1260) gives 1.702703.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0021 begin`);
      logInfo("dynamicConfigRatio(740, 1260)");
      const actual: number = dynamicConfigRatio(740, 1260);
      logInfo('actual=' + String(actual) + ', expected=' + "1.702703");
      expect(actual).assertEqual(1.702703);
      logInfo(`${BUNDLE}DynamicRatio_0021 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0022
     * @tc.name      Resolution_DynamicRatio_0022
     * @tc.desc      dynamicConfigRatio(741, 1259) gives 1.699055.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0022 begin`);
      logInfo("dynamicConfigRatio(741, 1259)");
      const actual: number = dynamicConfigRatio(741, 1259);
      logInfo('actual=' + String(actual) + ', expected=' + "1.699055");
      expect(actual).assertEqual(1.699055);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}DynamicRatio_0022 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0023
     * @tc.name      Resolution_DynamicRatio_0023
     * @tc.desc      dynamicConfigRatio(742, 1258) gives 1.695418.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DynamicRatio_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DynamicRatio_0023 begin`);
      logInfo("dynamicConfigRatio(742, 1258)");
      const actual: number = dynamicConfigRatio(742, 1258);
      logInfo('actual=' + String(actual) + ', expected=' + "1.695418");
      expect(actual).assertEqual(1.695418);
      logInfo(`${BUNDLE}DynamicRatio_0023 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0024
     * @tc.name      Resolution_DynamicRatio_0024
     * @tc.desc      dynamicConfigRatio(743, 1257) gives 1.69179.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0024 begin`);
      logInfo("dynamicConfigRatio(743, 1257)");
      const actual: number = dynamicConfigRatio(743, 1257);
      logInfo('actual=' + String(actual) + ', expected=' + "1.69179");
      expect(actual).assertEqual(1.69179);
      logInfo(`${BUNDLE}DynamicRatio_0024 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0025
     * @tc.name      Resolution_DynamicRatio_0025
     * @tc.desc      dynamicConfigRatio(744, 1256) gives 1.688172.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0025 begin`);
      logInfo("dynamicConfigRatio(744, 1256)");
      const actual: number = dynamicConfigRatio(744, 1256);
      logInfo('actual=' + String(actual) + ', expected=' + "1.688172");
      expect(actual).assertEqual(1.688172);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}DynamicRatio_0025 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0026
     * @tc.name      Resolution_DynamicRatio_0026
     * @tc.desc      dynamicConfigRatio(745, 1255) gives 1.684564.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0026 begin`);
      logInfo("dynamicConfigRatio(745, 1255)");
      const actual: number = dynamicConfigRatio(745, 1255);
      logInfo('actual=' + String(actual) + ', expected=' + "1.684564");
      expect(actual).assertEqual(1.684564);
      logInfo(`${BUNDLE}DynamicRatio_0026 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0027
     * @tc.name      Resolution_DynamicRatio_0027
     * @tc.desc      dynamicConfigRatio(746, 1254) gives 1.680965.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0027 begin`);
      logInfo("dynamicConfigRatio(746, 1254)");
      const actual: number = dynamicConfigRatio(746, 1254);
      logInfo('actual=' + String(actual) + ', expected=' + "1.680965");
      expect(actual).assertEqual(1.680965);
      logInfo(`${BUNDLE}DynamicRatio_0027 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0028
     * @tc.name      Resolution_DynamicRatio_0028
     * @tc.desc      dynamicConfigRatio(747, 1253) gives 1.677376.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0028 begin`);
      logInfo("dynamicConfigRatio(747, 1253)");
      const actual: number = dynamicConfigRatio(747, 1253);
      logInfo('actual=' + String(actual) + ', expected=' + "1.677376");
      expect(actual).assertEqual(1.677376);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}DynamicRatio_0028 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0029
     * @tc.name      Resolution_DynamicRatio_0029
     * @tc.desc      dynamicConfigRatio(748, 1252) gives 1.673797.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0029 begin`);
      logInfo("dynamicConfigRatio(748, 1252)");
      const actual: number = dynamicConfigRatio(748, 1252);
      logInfo('actual=' + String(actual) + ', expected=' + "1.673797");
      expect(actual).assertEqual(1.673797);
      logInfo(`${BUNDLE}DynamicRatio_0029 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0030
     * @tc.name      Resolution_DynamicRatio_0030
     * @tc.desc      dynamicConfigRatio(749, 1251) gives 1.670227.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0030 begin`);
      logInfo("dynamicConfigRatio(749, 1251)");
      const actual: number = dynamicConfigRatio(749, 1251);
      logInfo('actual=' + String(actual) + ', expected=' + "1.670227");
      expect(actual).assertEqual(1.670227);
      logInfo(`${BUNDLE}DynamicRatio_0030 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0031
     * @tc.name      Resolution_DynamicRatio_0031
     * @tc.desc      dynamicConfigRatio(750, 1250) gives 1.666667.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0031 begin`);
      logInfo("dynamicConfigRatio(750, 1250)");
      const actual: number = dynamicConfigRatio(750, 1250);
      logInfo('actual=' + String(actual) + ', expected=' + "1.666667");
      expect(actual).assertEqual(1.666667);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}DynamicRatio_0031 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0032
     * @tc.name      Resolution_DynamicRatio_0032
     * @tc.desc      dynamicConfigRatio(751, 1249) gives 1.663116.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0032 begin`);
      logInfo("dynamicConfigRatio(751, 1249)");
      const actual: number = dynamicConfigRatio(751, 1249);
      logInfo('actual=' + String(actual) + ', expected=' + "1.663116");
      expect(actual).assertEqual(1.663116);
      logInfo(`${BUNDLE}DynamicRatio_0032 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0033
     * @tc.name      Resolution_DynamicRatio_0033
     * @tc.desc      dynamicConfigRatio(752, 1248) gives 1.659574.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0033 begin`);
      logInfo("dynamicConfigRatio(752, 1248)");
      const actual: number = dynamicConfigRatio(752, 1248);
      logInfo('actual=' + String(actual) + ', expected=' + "1.659574");
      expect(actual).assertEqual(1.659574);
      logInfo(`${BUNDLE}DynamicRatio_0033 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0034
     * @tc.name      Resolution_DynamicRatio_0034
     * @tc.desc      dynamicConfigRatio(753, 1247) gives 1.656042.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DynamicRatio_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DynamicRatio_0034 begin`);
      logInfo("dynamicConfigRatio(753, 1247)");
      const actual: number = dynamicConfigRatio(753, 1247);
      logInfo('actual=' + String(actual) + ', expected=' + "1.656042");
      expect(actual).assertEqual(1.656042);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}DynamicRatio_0034 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0035
     * @tc.name      Resolution_DynamicRatio_0035
     * @tc.desc      dynamicConfigRatio(754, 1246) gives 1.65252.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_DynamicRatio_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DynamicRatio_0035 begin`);
      logInfo("dynamicConfigRatio(754, 1246)");
      const actual: number = dynamicConfigRatio(754, 1246);
      logInfo('actual=' + String(actual) + ', expected=' + "1.65252");
      expect(actual).assertEqual(1.65252);
      logInfo(`${BUNDLE}DynamicRatio_0035 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0036
     * @tc.name      Resolution_DynamicRatio_0036
     * @tc.desc      dynamicConfigRatio(755, 1245) gives 1.649007.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0036 begin`);
      logInfo("dynamicConfigRatio(755, 1245)");
      const actual: number = dynamicConfigRatio(755, 1245);
      logInfo('actual=' + String(actual) + ', expected=' + "1.649007");
      expect(actual).assertEqual(1.649007);
      logInfo(`${BUNDLE}DynamicRatio_0036 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0037
     * @tc.name      Resolution_DynamicRatio_0037
     * @tc.desc      dynamicConfigRatio(756, 1244) gives 1.645503.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0037 begin`);
      logInfo("dynamicConfigRatio(756, 1244)");
      const actual: number = dynamicConfigRatio(756, 1244);
      logInfo('actual=' + String(actual) + ', expected=' + "1.645503");
      expect(actual).assertEqual(1.645503);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}DynamicRatio_0037 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0038
     * @tc.name      Resolution_DynamicRatio_0038
     * @tc.desc      dynamicConfigRatio(757, 1243) gives 1.642008.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0038 begin`);
      logInfo("dynamicConfigRatio(757, 1243)");
      const actual: number = dynamicConfigRatio(757, 1243);
      logInfo('actual=' + String(actual) + ', expected=' + "1.642008");
      expect(actual).assertEqual(1.642008);
      logInfo(`${BUNDLE}DynamicRatio_0038 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0039
     * @tc.name      Resolution_DynamicRatio_0039
     * @tc.desc      dynamicConfigRatio(758, 1242) gives 1.638522.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0039 begin`);
      logInfo("dynamicConfigRatio(758, 1242)");
      const actual: number = dynamicConfigRatio(758, 1242);
      logInfo('actual=' + String(actual) + ', expected=' + "1.638522");
      expect(actual).assertEqual(1.638522);
      logInfo(`${BUNDLE}DynamicRatio_0039 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0040
     * @tc.name      Resolution_DynamicRatio_0040
     * @tc.desc      dynamicConfigRatio(759, 1241) gives 1.635046.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0040 begin`);
      logInfo("dynamicConfigRatio(759, 1241)");
      const actual: number = dynamicConfigRatio(759, 1241);
      logInfo('actual=' + String(actual) + ', expected=' + "1.635046");
      expect(actual).assertEqual(1.635046);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}DynamicRatio_0040 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0041
     * @tc.name      Resolution_DynamicRatio_0041
     * @tc.desc      dynamicConfigRatio(760, 1240) gives 1.631579.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0041 begin`);
      logInfo("dynamicConfigRatio(760, 1240)");
      const actual: number = dynamicConfigRatio(760, 1240);
      logInfo('actual=' + String(actual) + ', expected=' + "1.631579");
      expect(actual).assertEqual(1.631579);
      logInfo(`${BUNDLE}DynamicRatio_0041 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0042
     * @tc.name      Resolution_DynamicRatio_0042
     * @tc.desc      dynamicConfigRatio(761, 1239) gives 1.628121.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0042 begin`);
      logInfo("dynamicConfigRatio(761, 1239)");
      const actual: number = dynamicConfigRatio(761, 1239);
      logInfo('actual=' + String(actual) + ', expected=' + "1.628121");
      expect(actual).assertEqual(1.628121);
      logInfo(`${BUNDLE}DynamicRatio_0042 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0043
     * @tc.name      Resolution_DynamicRatio_0043
     * @tc.desc      dynamicConfigRatio(762, 1238) gives 1.624672.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0043 begin`);
      logInfo("dynamicConfigRatio(762, 1238)");
      const actual: number = dynamicConfigRatio(762, 1238);
      logInfo('actual=' + String(actual) + ', expected=' + "1.624672");
      expect(actual).assertEqual(1.624672);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}DynamicRatio_0043 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0044
     * @tc.name      Resolution_DynamicRatio_0044
     * @tc.desc      dynamicConfigRatio(763, 1237) gives 1.621232.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0044 begin`);
      logInfo("dynamicConfigRatio(763, 1237)");
      const actual: number = dynamicConfigRatio(763, 1237);
      logInfo('actual=' + String(actual) + ', expected=' + "1.621232");
      expect(actual).assertEqual(1.621232);
      logInfo(`${BUNDLE}DynamicRatio_0044 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0045
     * @tc.name      Resolution_DynamicRatio_0045
     * @tc.desc      dynamicConfigRatio(764, 1236) gives 1.617801.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DynamicRatio_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DynamicRatio_0045 begin`);
      logInfo("dynamicConfigRatio(764, 1236)");
      const actual: number = dynamicConfigRatio(764, 1236);
      logInfo('actual=' + String(actual) + ', expected=' + "1.617801");
      expect(actual).assertEqual(1.617801);
      logInfo(`${BUNDLE}DynamicRatio_0045 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DYNAMIC_RATIO_0046
     * @tc.name      Resolution_DynamicRatio_0046
     * @tc.desc      dynamicConfigRatio(765, 1235) gives 1.614379.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DynamicRatio_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicRatio_0046 begin`);
      logInfo("dynamicConfigRatio(765, 1235)");
      const actual: number = dynamicConfigRatio(765, 1235);
      logInfo('actual=' + String(actual) + ', expected=' + "1.614379");
      expect(actual).assertEqual(1.614379);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}DynamicRatio_0046 end`);
    });
  });
}
