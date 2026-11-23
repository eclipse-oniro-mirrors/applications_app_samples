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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { logInfo, BUNDLE } from '../common/PerfTestSupport';
import {
  flingStartY,
  flingEndY,
  flingDistance,
} from '../model/PerfTestLogic';

/** FlingGeometryTest logic checks (32 cases). */
export default function flingGeometryTest(): void {
  describe('FlingGeometryTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_FLING_0001
     * @tc.name      Perf_Fling_0001
     * @tc.desc      fling geometry for center 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_Fling_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Fling_0001 begin`);
      logInfo("flingStartY(0) + ':' + flingEndY(0) + ':' + flingDistance(0)");
      const actual: string = flingStartY(0) + ':' + flingEndY(0) + ':' + flingDistance(0);
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:0");
      expect(actual).assertEqual("0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Fling_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_0002
     * @tc.name      Perf_Fling_0002
     * @tc.desc      fling geometry for center 37.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fling_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fling_0002 begin`);
      logInfo("flingStartY(37) + ':' + flingEndY(37) + ':' + flingDistance(37)");
      const actual: string = flingStartY(37) + ':' + flingEndY(37) + ':' + flingDistance(37);
      logInfo('actual=' + String(actual) + ', expected=' + "55:18:37");
      expect(actual).assertEqual("55:18:37");
      logInfo(`${BUNDLE}Fling_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_0003
     * @tc.name      Perf_Fling_0003
     * @tc.desc      fling geometry for center 74.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fling_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fling_0003 begin`);
      logInfo("flingStartY(74) + ':' + flingEndY(74) + ':' + flingDistance(74)");
      const actual: string = flingStartY(74) + ':' + flingEndY(74) + ':' + flingDistance(74);
      logInfo('actual=' + String(actual) + ', expected=' + "111:37:74");
      expect(actual).assertEqual("111:37:74");
      logInfo(`${BUNDLE}Fling_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_0004
     * @tc.name      Perf_Fling_0004
     * @tc.desc      fling geometry for center 111.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fling_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fling_0004 begin`);
      logInfo("flingStartY(111) + ':' + flingEndY(111) + ':' + flingDistance(111)");
      const actual: string = flingStartY(111) + ':' + flingEndY(111) + ':' + flingDistance(111);
      logInfo('actual=' + String(actual) + ', expected=' + "166:55:111");
      expect(actual).assertEqual("166:55:111");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Fling_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_0005
     * @tc.name      Perf_Fling_0005
     * @tc.desc      fling geometry for center 148.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fling_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fling_0005 begin`);
      logInfo("flingStartY(148) + ':' + flingEndY(148) + ':' + flingDistance(148)");
      const actual: string = flingStartY(148) + ':' + flingEndY(148) + ':' + flingDistance(148);
      logInfo('actual=' + String(actual) + ', expected=' + "222:74:148");
      expect(actual).assertEqual("222:74:148");
      logInfo(`${BUNDLE}Fling_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_0006
     * @tc.name      Perf_Fling_0006
     * @tc.desc      fling geometry for center 185.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fling_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fling_0006 begin`);
      logInfo("flingStartY(185) + ':' + flingEndY(185) + ':' + flingDistance(185)");
      const actual: string = flingStartY(185) + ':' + flingEndY(185) + ':' + flingDistance(185);
      logInfo('actual=' + String(actual) + ', expected=' + "277:92:185");
      expect(actual).assertEqual("277:92:185");
      logInfo(`${BUNDLE}Fling_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_0007
     * @tc.name      Perf_Fling_0007
     * @tc.desc      fling geometry for center 222.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fling_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fling_0007 begin`);
      logInfo("flingStartY(222) + ':' + flingEndY(222) + ':' + flingDistance(222)");
      const actual: string = flingStartY(222) + ':' + flingEndY(222) + ':' + flingDistance(222);
      logInfo('actual=' + String(actual) + ', expected=' + "333:111:222");
      expect(actual).assertEqual("333:111:222");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Fling_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_0008
     * @tc.name      Perf_Fling_0008
     * @tc.desc      fling geometry for center 259.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fling_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fling_0008 begin`);
      logInfo("flingStartY(259) + ':' + flingEndY(259) + ':' + flingDistance(259)");
      const actual: string = flingStartY(259) + ':' + flingEndY(259) + ':' + flingDistance(259);
      logInfo('actual=' + String(actual) + ', expected=' + "388:129:259");
      expect(actual).assertEqual("388:129:259");
      logInfo(`${BUNDLE}Fling_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_0009
     * @tc.name      Perf_Fling_0009
     * @tc.desc      fling geometry for center 296.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fling_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fling_0009 begin`);
      logInfo("flingStartY(296) + ':' + flingEndY(296) + ':' + flingDistance(296)");
      const actual: string = flingStartY(296) + ':' + flingEndY(296) + ':' + flingDistance(296);
      logInfo('actual=' + String(actual) + ', expected=' + "444:148:296");
      expect(actual).assertEqual("444:148:296");
      logInfo(`${BUNDLE}Fling_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_0010
     * @tc.name      Perf_Fling_0010
     * @tc.desc      fling geometry for center 333.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fling_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fling_0010 begin`);
      logInfo("flingStartY(333) + ':' + flingEndY(333) + ':' + flingDistance(333)");
      const actual: string = flingStartY(333) + ':' + flingEndY(333) + ':' + flingDistance(333);
      logInfo('actual=' + String(actual) + ', expected=' + "499:166:333");
      expect(actual).assertEqual("499:166:333");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Fling_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_0011
     * @tc.name      Perf_Fling_0011
     * @tc.desc      fling geometry for center 370.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fling_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fling_0011 begin`);
      logInfo("flingStartY(370) + ':' + flingEndY(370) + ':' + flingDistance(370)");
      const actual: string = flingStartY(370) + ':' + flingEndY(370) + ':' + flingDistance(370);
      logInfo('actual=' + String(actual) + ', expected=' + "555:185:370");
      expect(actual).assertEqual("555:185:370");
      logInfo(`${BUNDLE}Fling_0011 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_0012
     * @tc.name      Perf_Fling_0012
     * @tc.desc      fling geometry for center 407.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_Fling_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Fling_0012 begin`);
      logInfo("flingStartY(407) + ':' + flingEndY(407) + ':' + flingDistance(407)");
      const actual: string = flingStartY(407) + ':' + flingEndY(407) + ':' + flingDistance(407);
      logInfo('actual=' + String(actual) + ', expected=' + "610:203:407");
      expect(actual).assertEqual("610:203:407");
      logInfo(`${BUNDLE}Fling_0012 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_0013
     * @tc.name      Perf_Fling_0013
     * @tc.desc      fling geometry for center 444.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fling_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fling_0013 begin`);
      logInfo("flingStartY(444) + ':' + flingEndY(444) + ':' + flingDistance(444)");
      const actual: string = flingStartY(444) + ':' + flingEndY(444) + ':' + flingDistance(444);
      logInfo('actual=' + String(actual) + ', expected=' + "666:222:444");
      expect(actual).assertEqual("666:222:444");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Fling_0013 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_0014
     * @tc.name      Perf_Fling_0014
     * @tc.desc      fling geometry for center 481.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fling_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fling_0014 begin`);
      logInfo("flingStartY(481) + ':' + flingEndY(481) + ':' + flingDistance(481)");
      const actual: string = flingStartY(481) + ':' + flingEndY(481) + ':' + flingDistance(481);
      logInfo('actual=' + String(actual) + ', expected=' + "721:240:481");
      expect(actual).assertEqual("721:240:481");
      logInfo(`${BUNDLE}Fling_0014 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_0015
     * @tc.name      Perf_Fling_0015
     * @tc.desc      fling geometry for center 518.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fling_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fling_0015 begin`);
      logInfo("flingStartY(518) + ':' + flingEndY(518) + ':' + flingDistance(518)");
      const actual: string = flingStartY(518) + ':' + flingEndY(518) + ':' + flingDistance(518);
      logInfo('actual=' + String(actual) + ', expected=' + "777:259:518");
      expect(actual).assertEqual("777:259:518");
      logInfo(`${BUNDLE}Fling_0015 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_0016
     * @tc.name      Perf_Fling_0016
     * @tc.desc      fling geometry for center 555.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fling_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fling_0016 begin`);
      logInfo("flingStartY(555) + ':' + flingEndY(555) + ':' + flingDistance(555)");
      const actual: string = flingStartY(555) + ':' + flingEndY(555) + ':' + flingDistance(555);
      logInfo('actual=' + String(actual) + ', expected=' + "832:277:555");
      expect(actual).assertEqual("832:277:555");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Fling_0016 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_0017
     * @tc.name      Perf_Fling_0017
     * @tc.desc      fling geometry for center 592.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fling_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fling_0017 begin`);
      logInfo("flingStartY(592) + ':' + flingEndY(592) + ':' + flingDistance(592)");
      const actual: string = flingStartY(592) + ':' + flingEndY(592) + ':' + flingDistance(592);
      logInfo('actual=' + String(actual) + ', expected=' + "888:296:592");
      expect(actual).assertEqual("888:296:592");
      logInfo(`${BUNDLE}Fling_0017 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_0018
     * @tc.name      Perf_Fling_0018
     * @tc.desc      fling geometry for center 629.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_Fling_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Fling_0018 begin`);
      logInfo("flingStartY(629) + ':' + flingEndY(629) + ':' + flingDistance(629)");
      const actual: string = flingStartY(629) + ':' + flingEndY(629) + ':' + flingDistance(629);
      logInfo('actual=' + String(actual) + ', expected=' + "943:314:629");
      expect(actual).assertEqual("943:314:629");
      logInfo(`${BUNDLE}Fling_0018 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_0019
     * @tc.name      Perf_Fling_0019
     * @tc.desc      fling geometry for center 666.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fling_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fling_0019 begin`);
      logInfo("flingStartY(666) + ':' + flingEndY(666) + ':' + flingDistance(666)");
      const actual: string = flingStartY(666) + ':' + flingEndY(666) + ':' + flingDistance(666);
      logInfo('actual=' + String(actual) + ', expected=' + "999:333:666");
      expect(actual).assertEqual("999:333:666");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Fling_0019 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_0020
     * @tc.name      Perf_Fling_0020
     * @tc.desc      fling geometry for center 703.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fling_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fling_0020 begin`);
      logInfo("flingStartY(703) + ':' + flingEndY(703) + ':' + flingDistance(703)");
      const actual: string = flingStartY(703) + ':' + flingEndY(703) + ':' + flingDistance(703);
      logInfo('actual=' + String(actual) + ', expected=' + "1054:351:703");
      expect(actual).assertEqual("1054:351:703");
      logInfo(`${BUNDLE}Fling_0020 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_0021
     * @tc.name      Perf_Fling_0021
     * @tc.desc      fling geometry for center 740.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fling_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fling_0021 begin`);
      logInfo("flingStartY(740) + ':' + flingEndY(740) + ':' + flingDistance(740)");
      const actual: string = flingStartY(740) + ':' + flingEndY(740) + ':' + flingDistance(740);
      logInfo('actual=' + String(actual) + ', expected=' + "1110:370:740");
      expect(actual).assertEqual("1110:370:740");
      logInfo(`${BUNDLE}Fling_0021 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_0022
     * @tc.name      Perf_Fling_0022
     * @tc.desc      fling geometry for center 777.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fling_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fling_0022 begin`);
      logInfo("flingStartY(777) + ':' + flingEndY(777) + ':' + flingDistance(777)");
      const actual: string = flingStartY(777) + ':' + flingEndY(777) + ':' + flingDistance(777);
      logInfo('actual=' + String(actual) + ', expected=' + "1165:388:777");
      expect(actual).assertEqual("1165:388:777");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Fling_0022 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_0023
     * @tc.name      Perf_Fling_0023
     * @tc.desc      fling geometry for center 814.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_Fling_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Fling_0023 begin`);
      logInfo("flingStartY(814) + ':' + flingEndY(814) + ':' + flingDistance(814)");
      const actual: string = flingStartY(814) + ':' + flingEndY(814) + ':' + flingDistance(814);
      logInfo('actual=' + String(actual) + ', expected=' + "1221:407:814");
      expect(actual).assertEqual("1221:407:814");
      logInfo(`${BUNDLE}Fling_0023 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_0024
     * @tc.name      Perf_Fling_0024
     * @tc.desc      fling geometry for center 851.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fling_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fling_0024 begin`);
      logInfo("flingStartY(851) + ':' + flingEndY(851) + ':' + flingDistance(851)");
      const actual: string = flingStartY(851) + ':' + flingEndY(851) + ':' + flingDistance(851);
      logInfo('actual=' + String(actual) + ', expected=' + "1276:425:851");
      expect(actual).assertEqual("1276:425:851");
      logInfo(`${BUNDLE}Fling_0024 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_0025
     * @tc.name      Perf_Fling_0025
     * @tc.desc      fling geometry for center 888.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fling_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fling_0025 begin`);
      logInfo("flingStartY(888) + ':' + flingEndY(888) + ':' + flingDistance(888)");
      const actual: string = flingStartY(888) + ':' + flingEndY(888) + ':' + flingDistance(888);
      logInfo('actual=' + String(actual) + ', expected=' + "1332:444:888");
      expect(actual).assertEqual("1332:444:888");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Fling_0025 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_0026
     * @tc.name      Perf_Fling_0026
     * @tc.desc      fling geometry for center 925.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fling_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fling_0026 begin`);
      logInfo("flingStartY(925) + ':' + flingEndY(925) + ':' + flingDistance(925)");
      const actual: string = flingStartY(925) + ':' + flingEndY(925) + ':' + flingDistance(925);
      logInfo('actual=' + String(actual) + ', expected=' + "1387:462:925");
      expect(actual).assertEqual("1387:462:925");
      logInfo(`${BUNDLE}Fling_0026 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_0027
     * @tc.name      Perf_Fling_0027
     * @tc.desc      fling geometry for center 962.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fling_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fling_0027 begin`);
      logInfo("flingStartY(962) + ':' + flingEndY(962) + ':' + flingDistance(962)");
      const actual: string = flingStartY(962) + ':' + flingEndY(962) + ':' + flingDistance(962);
      logInfo('actual=' + String(actual) + ', expected=' + "1443:481:962");
      expect(actual).assertEqual("1443:481:962");
      logInfo(`${BUNDLE}Fling_0027 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_0028
     * @tc.name      Perf_Fling_0028
     * @tc.desc      fling geometry for center 999.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fling_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fling_0028 begin`);
      logInfo("flingStartY(999) + ':' + flingEndY(999) + ':' + flingDistance(999)");
      const actual: string = flingStartY(999) + ':' + flingEndY(999) + ':' + flingDistance(999);
      logInfo('actual=' + String(actual) + ', expected=' + "1498:499:999");
      expect(actual).assertEqual("1498:499:999");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Fling_0028 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_0029
     * @tc.name      Perf_Fling_0029
     * @tc.desc      fling geometry for center 1036.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fling_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fling_0029 begin`);
      logInfo("flingStartY(1036) + ':' + flingEndY(1036) + ':' + flingDistance(1036)");
      const actual: string = flingStartY(1036) + ':' + flingEndY(1036) + ':' + flingDistance(1036);
      logInfo('actual=' + String(actual) + ', expected=' + "1554:518:1036");
      expect(actual).assertEqual("1554:518:1036");
      logInfo(`${BUNDLE}Fling_0029 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_0030
     * @tc.name      Perf_Fling_0030
     * @tc.desc      fling geometry for center 1073.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fling_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fling_0030 begin`);
      logInfo("flingStartY(1073) + ':' + flingEndY(1073) + ':' + flingDistance(1073)");
      const actual: string = flingStartY(1073) + ':' + flingEndY(1073) + ':' + flingDistance(1073);
      logInfo('actual=' + String(actual) + ', expected=' + "1609:536:1073");
      expect(actual).assertEqual("1609:536:1073");
      logInfo(`${BUNDLE}Fling_0030 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_0031
     * @tc.name      Perf_Fling_0031
     * @tc.desc      fling geometry for center 1110.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fling_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fling_0031 begin`);
      logInfo("flingStartY(1110) + ':' + flingEndY(1110) + ':' + flingDistance(1110)");
      const actual: string = flingStartY(1110) + ':' + flingEndY(1110) + ':' + flingDistance(1110);
      logInfo('actual=' + String(actual) + ', expected=' + "1665:555:1110");
      expect(actual).assertEqual("1665:555:1110");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Fling_0031 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_0032
     * @tc.name      Perf_Fling_0032
     * @tc.desc      fling geometry for center 1147.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fling_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fling_0032 begin`);
      logInfo("flingStartY(1147) + ':' + flingEndY(1147) + ':' + flingDistance(1147)");
      const actual: string = flingStartY(1147) + ':' + flingEndY(1147) + ':' + flingDistance(1147);
      logInfo('actual=' + String(actual) + ', expected=' + "1720:573:1147");
      expect(actual).assertEqual("1720:573:1147");
      logInfo(`${BUNDLE}Fling_0032 end`);
    });
  });
}
