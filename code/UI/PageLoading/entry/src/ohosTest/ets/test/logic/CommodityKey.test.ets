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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../../utils/YieldHook';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { commodityKey } from '../model/PageLoadingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PageLoading]';
const BUNDLE: string = 'PageLoading_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for commodityKey (96 cases). */
export default function commodityKeyTest(): void {
  describe('CommodityKeyTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0001
     * @tc.name      PageLoading_CommodityKey_0001
     * @tc.desc      commodityKey(id=0) returns "0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_CommodityKey_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CommodityKey_0001 begin`);
      const actual: string = commodityKey(0);
      logInfo(`commodityKey(id=0): actual=${actual}`);
      expect(actual).assertEqual('0');
      logInfo(`${BUNDLE}CommodityKey_0001 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0002
     * @tc.name      PageLoading_CommodityKey_0002
     * @tc.desc      commodityKey(id=1) returns "1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_CommodityKey_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CommodityKey_0002 begin`);
      const actual: string = commodityKey(1);
      logInfo(`commodityKey(id=1): actual=${actual}`);
      expect(actual).assertEqual('1');
      logInfo(`${BUNDLE}CommodityKey_0002 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0003
     * @tc.name      PageLoading_CommodityKey_0003
     * @tc.desc      commodityKey(id=100) returns "100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0003 begin`);
      const actual: string = commodityKey(100);
      logInfo(`commodityKey(id=100): actual=${actual}`);
      expect(actual).assertEqual('100');
      logInfo(`${BUNDLE}CommodityKey_0003 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0004
     * @tc.name      PageLoading_CommodityKey_0004
     * @tc.desc      commodityKey(id=-1) returns "-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityKey_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityKey_0004 begin`);
      const actual: string = commodityKey(-1);
      logInfo(`commodityKey(id=-1): actual=${actual}`);
      expect(actual).assertEqual('-1');
      logInfo(`${BUNDLE}CommodityKey_0004 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0005
     * @tc.name      PageLoading_CommodityKey_0005
     * @tc.desc      commodityKey(id=2) returns "2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0005 begin`);
      const actual: string = commodityKey(2);
      logInfo(`commodityKey(id=2): actual=${actual}`);
      expect(actual).assertEqual('2');
      logInfo(`${BUNDLE}CommodityKey_0005 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0006
     * @tc.name      PageLoading_CommodityKey_0006
     * @tc.desc      commodityKey(id=3) returns "3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0006 begin`);
      const actual: string = commodityKey(3);
      logInfo(`commodityKey(id=3): actual=${actual}`);
      expect(actual).assertEqual('3');
      logInfo(`${BUNDLE}CommodityKey_0006 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0007
     * @tc.name      PageLoading_CommodityKey_0007
     * @tc.desc      commodityKey(id=10) returns "10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0007 begin`);
      const actual: string = commodityKey(10);
      logInfo(`commodityKey(id=10): actual=${actual}`);
      expect(actual).assertEqual('10');
      logInfo(`${BUNDLE}CommodityKey_0007 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0008
     * @tc.name      PageLoading_CommodityKey_0008
     * @tc.desc      commodityKey(id=5) returns "5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0008 begin`);
      const actual: string = commodityKey(5);
      logInfo(`commodityKey(id=5): actual=${actual}`);
      expect(actual).assertEqual('5');
      logInfo(`${BUNDLE}CommodityKey_0008 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0009
     * @tc.name      PageLoading_CommodityKey_0009
     * @tc.desc      commodityKey(id=15) returns "15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0009 begin`);
      const actual: string = commodityKey(15);
      logInfo(`commodityKey(id=15): actual=${actual}`);
      expect(actual).assertEqual('15');
      logInfo(`${BUNDLE}CommodityKey_0009 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0010
     * @tc.name      PageLoading_CommodityKey_0010
     * @tc.desc      commodityKey(id=20) returns "20"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0010 begin`);
      const actual: string = commodityKey(20);
      logInfo(`commodityKey(id=20): actual=${actual}`);
      expect(actual).assertEqual('20');
      logInfo(`${BUNDLE}CommodityKey_0010 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0011
     * @tc.name      PageLoading_CommodityKey_0011
     * @tc.desc      commodityKey(id=25) returns "25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0011 begin`);
      const actual: string = commodityKey(25);
      logInfo(`commodityKey(id=25): actual=${actual}`);
      expect(actual).assertEqual('25');
      logInfo(`${BUNDLE}CommodityKey_0011 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0012
     * @tc.name      PageLoading_CommodityKey_0012
     * @tc.desc      commodityKey(id=30) returns "30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0012 begin`);
      const actual: string = commodityKey(30);
      logInfo(`commodityKey(id=30): actual=${actual}`);
      expect(actual).assertEqual('30');
      logInfo(`${BUNDLE}CommodityKey_0012 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0013
     * @tc.name      PageLoading_CommodityKey_0013
     * @tc.desc      commodityKey(id=35) returns "35"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0013 begin`);
      const actual: string = commodityKey(35);
      logInfo(`commodityKey(id=35): actual=${actual}`);
      expect(actual).assertEqual('35');
      logInfo(`${BUNDLE}CommodityKey_0013 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0014
     * @tc.name      PageLoading_CommodityKey_0014
     * @tc.desc      commodityKey(id=40) returns "40"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0014 begin`);
      const actual: string = commodityKey(40);
      logInfo(`commodityKey(id=40): actual=${actual}`);
      expect(actual).assertEqual('40');
      logInfo(`${BUNDLE}CommodityKey_0014 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0015
     * @tc.name      PageLoading_CommodityKey_0015
     * @tc.desc      commodityKey(id=45) returns "45"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0015 begin`);
      const actual: string = commodityKey(45);
      logInfo(`commodityKey(id=45): actual=${actual}`);
      expect(actual).assertEqual('45');
      logInfo(`${BUNDLE}CommodityKey_0015 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0016
     * @tc.name      PageLoading_CommodityKey_0016
     * @tc.desc      commodityKey(id=50) returns "50"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0016 begin`);
      const actual: string = commodityKey(50);
      logInfo(`commodityKey(id=50): actual=${actual}`);
      expect(actual).assertEqual('50');
      logInfo(`${BUNDLE}CommodityKey_0016 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0017
     * @tc.name      PageLoading_CommodityKey_0017
     * @tc.desc      commodityKey(id=55) returns "55"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0017 begin`);
      const actual: string = commodityKey(55);
      logInfo(`commodityKey(id=55): actual=${actual}`);
      expect(actual).assertEqual('55');
      logInfo(`${BUNDLE}CommodityKey_0017 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0018
     * @tc.name      PageLoading_CommodityKey_0018
     * @tc.desc      commodityKey(id=60) returns "60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0018 begin`);
      const actual: string = commodityKey(60);
      logInfo(`commodityKey(id=60): actual=${actual}`);
      expect(actual).assertEqual('60');
      logInfo(`${BUNDLE}CommodityKey_0018 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0019
     * @tc.name      PageLoading_CommodityKey_0019
     * @tc.desc      commodityKey(id=65) returns "65"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0019 begin`);
      const actual: string = commodityKey(65);
      logInfo(`commodityKey(id=65): actual=${actual}`);
      expect(actual).assertEqual('65');
      logInfo(`${BUNDLE}CommodityKey_0019 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0020
     * @tc.name      PageLoading_CommodityKey_0020
     * @tc.desc      commodityKey(id=70) returns "70"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0020 begin`);
      const actual: string = commodityKey(70);
      logInfo(`commodityKey(id=70): actual=${actual}`);
      expect(actual).assertEqual('70');
      logInfo(`${BUNDLE}CommodityKey_0020 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0021
     * @tc.name      PageLoading_CommodityKey_0021
     * @tc.desc      commodityKey(id=75) returns "75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0021 begin`);
      const actual: string = commodityKey(75);
      logInfo(`commodityKey(id=75): actual=${actual}`);
      expect(actual).assertEqual('75');
      logInfo(`${BUNDLE}CommodityKey_0021 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0022
     * @tc.name      PageLoading_CommodityKey_0022
     * @tc.desc      commodityKey(id=80) returns "80"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0022 begin`);
      const actual: string = commodityKey(80);
      logInfo(`commodityKey(id=80): actual=${actual}`);
      expect(actual).assertEqual('80');
      logInfo(`${BUNDLE}CommodityKey_0022 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0023
     * @tc.name      PageLoading_CommodityKey_0023
     * @tc.desc      commodityKey(id=85) returns "85"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0023 begin`);
      const actual: string = commodityKey(85);
      logInfo(`commodityKey(id=85): actual=${actual}`);
      expect(actual).assertEqual('85');
      logInfo(`${BUNDLE}CommodityKey_0023 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0024
     * @tc.name      PageLoading_CommodityKey_0024
     * @tc.desc      commodityKey(id=90) returns "90"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0024 begin`);
      const actual: string = commodityKey(90);
      logInfo(`commodityKey(id=90): actual=${actual}`);
      expect(actual).assertEqual('90');
      logInfo(`${BUNDLE}CommodityKey_0024 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0025
     * @tc.name      PageLoading_CommodityKey_0025
     * @tc.desc      commodityKey(id=95) returns "95"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0025 begin`);
      const actual: string = commodityKey(95);
      logInfo(`commodityKey(id=95): actual=${actual}`);
      expect(actual).assertEqual('95');
      logInfo(`${BUNDLE}CommodityKey_0025 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0026
     * @tc.name      PageLoading_CommodityKey_0026
     * @tc.desc      commodityKey(id=105) returns "105"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0026 begin`);
      const actual: string = commodityKey(105);
      logInfo(`commodityKey(id=105): actual=${actual}`);
      expect(actual).assertEqual('105');
      logInfo(`${BUNDLE}CommodityKey_0026 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0027
     * @tc.name      PageLoading_CommodityKey_0027
     * @tc.desc      commodityKey(id=110) returns "110"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0027 begin`);
      const actual: string = commodityKey(110);
      logInfo(`commodityKey(id=110): actual=${actual}`);
      expect(actual).assertEqual('110');
      logInfo(`${BUNDLE}CommodityKey_0027 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0028
     * @tc.name      PageLoading_CommodityKey_0028
     * @tc.desc      commodityKey(id=115) returns "115"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0028 begin`);
      const actual: string = commodityKey(115);
      logInfo(`commodityKey(id=115): actual=${actual}`);
      expect(actual).assertEqual('115');
      logInfo(`${BUNDLE}CommodityKey_0028 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0029
     * @tc.name      PageLoading_CommodityKey_0029
     * @tc.desc      commodityKey(id=120) returns "120"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0029 begin`);
      const actual: string = commodityKey(120);
      logInfo(`commodityKey(id=120): actual=${actual}`);
      expect(actual).assertEqual('120');
      logInfo(`${BUNDLE}CommodityKey_0029 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0030
     * @tc.name      PageLoading_CommodityKey_0030
     * @tc.desc      commodityKey(id=125) returns "125"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0030 begin`);
      const actual: string = commodityKey(125);
      logInfo(`commodityKey(id=125): actual=${actual}`);
      expect(actual).assertEqual('125');
      logInfo(`${BUNDLE}CommodityKey_0030 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0031
     * @tc.name      PageLoading_CommodityKey_0031
     * @tc.desc      commodityKey(id=130) returns "130"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0031 begin`);
      const actual: string = commodityKey(130);
      logInfo(`commodityKey(id=130): actual=${actual}`);
      expect(actual).assertEqual('130');
      logInfo(`${BUNDLE}CommodityKey_0031 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0032
     * @tc.name      PageLoading_CommodityKey_0032
     * @tc.desc      commodityKey(id=135) returns "135"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0032 begin`);
      const actual: string = commodityKey(135);
      logInfo(`commodityKey(id=135): actual=${actual}`);
      expect(actual).assertEqual('135');
      logInfo(`${BUNDLE}CommodityKey_0032 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0033
     * @tc.name      PageLoading_CommodityKey_0033
     * @tc.desc      commodityKey(id=140) returns "140"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0033 begin`);
      const actual: string = commodityKey(140);
      logInfo(`commodityKey(id=140): actual=${actual}`);
      expect(actual).assertEqual('140');
      logInfo(`${BUNDLE}CommodityKey_0033 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0034
     * @tc.name      PageLoading_CommodityKey_0034
     * @tc.desc      commodityKey(id=145) returns "145"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0034 begin`);
      const actual: string = commodityKey(145);
      logInfo(`commodityKey(id=145): actual=${actual}`);
      expect(actual).assertEqual('145');
      logInfo(`${BUNDLE}CommodityKey_0034 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0035
     * @tc.name      PageLoading_CommodityKey_0035
     * @tc.desc      commodityKey(id=150) returns "150"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0035 begin`);
      const actual: string = commodityKey(150);
      logInfo(`commodityKey(id=150): actual=${actual}`);
      expect(actual).assertEqual('150');
      logInfo(`${BUNDLE}CommodityKey_0035 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0036
     * @tc.name      PageLoading_CommodityKey_0036
     * @tc.desc      commodityKey(id=155) returns "155"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0036 begin`);
      const actual: string = commodityKey(155);
      logInfo(`commodityKey(id=155): actual=${actual}`);
      expect(actual).assertEqual('155');
      logInfo(`${BUNDLE}CommodityKey_0036 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0037
     * @tc.name      PageLoading_CommodityKey_0037
     * @tc.desc      commodityKey(id=160) returns "160"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0037 begin`);
      const actual: string = commodityKey(160);
      logInfo(`commodityKey(id=160): actual=${actual}`);
      expect(actual).assertEqual('160');
      logInfo(`${BUNDLE}CommodityKey_0037 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0038
     * @tc.name      PageLoading_CommodityKey_0038
     * @tc.desc      commodityKey(id=165) returns "165"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0038 begin`);
      const actual: string = commodityKey(165);
      logInfo(`commodityKey(id=165): actual=${actual}`);
      expect(actual).assertEqual('165');
      logInfo(`${BUNDLE}CommodityKey_0038 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0039
     * @tc.name      PageLoading_CommodityKey_0039
     * @tc.desc      commodityKey(id=170) returns "170"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0039 begin`);
      const actual: string = commodityKey(170);
      logInfo(`commodityKey(id=170): actual=${actual}`);
      expect(actual).assertEqual('170');
      logInfo(`${BUNDLE}CommodityKey_0039 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0040
     * @tc.name      PageLoading_CommodityKey_0040
     * @tc.desc      commodityKey(id=175) returns "175"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0040 begin`);
      const actual: string = commodityKey(175);
      logInfo(`commodityKey(id=175): actual=${actual}`);
      expect(actual).assertEqual('175');
      logInfo(`${BUNDLE}CommodityKey_0040 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0041
     * @tc.name      PageLoading_CommodityKey_0041
     * @tc.desc      commodityKey(id=180) returns "180"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0041 begin`);
      const actual: string = commodityKey(180);
      logInfo(`commodityKey(id=180): actual=${actual}`);
      expect(actual).assertEqual('180');
      logInfo(`${BUNDLE}CommodityKey_0041 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0042
     * @tc.name      PageLoading_CommodityKey_0042
     * @tc.desc      commodityKey(id=185) returns "185"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0042 begin`);
      const actual: string = commodityKey(185);
      logInfo(`commodityKey(id=185): actual=${actual}`);
      expect(actual).assertEqual('185');
      logInfo(`${BUNDLE}CommodityKey_0042 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0043
     * @tc.name      PageLoading_CommodityKey_0043
     * @tc.desc      commodityKey(id=190) returns "190"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0043 begin`);
      const actual: string = commodityKey(190);
      logInfo(`commodityKey(id=190): actual=${actual}`);
      expect(actual).assertEqual('190');
      logInfo(`${BUNDLE}CommodityKey_0043 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0044
     * @tc.name      PageLoading_CommodityKey_0044
     * @tc.desc      commodityKey(id=195) returns "195"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0044 begin`);
      const actual: string = commodityKey(195);
      logInfo(`commodityKey(id=195): actual=${actual}`);
      expect(actual).assertEqual('195');
      logInfo(`${BUNDLE}CommodityKey_0044 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0045
     * @tc.name      PageLoading_CommodityKey_0045
     * @tc.desc      commodityKey(id=200) returns "200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0045 begin`);
      const actual: string = commodityKey(200);
      logInfo(`commodityKey(id=200): actual=${actual}`);
      expect(actual).assertEqual('200');
      logInfo(`${BUNDLE}CommodityKey_0045 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0046
     * @tc.name      PageLoading_CommodityKey_0046
     * @tc.desc      commodityKey(id=65.29) returns "65.29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0046 begin`);
      const actual: string = commodityKey(65.29);
      logInfo(`commodityKey(id=65.29): actual=${actual}`);
      expect(actual).assertEqual('65.29');
      logInfo(`${BUNDLE}CommodityKey_0046 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0047
     * @tc.name      PageLoading_CommodityKey_0047
     * @tc.desc      commodityKey(id=116) returns "116"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0047 begin`);
      const actual: string = commodityKey(116);
      logInfo(`commodityKey(id=116): actual=${actual}`);
      expect(actual).assertEqual('116');
      logInfo(`${BUNDLE}CommodityKey_0047 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0048
     * @tc.name      PageLoading_CommodityKey_0048
     * @tc.desc      commodityKey(id=13.99) returns "13.99"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0048 begin`);
      const actual: string = commodityKey(13.99);
      logInfo(`commodityKey(id=13.99): actual=${actual}`);
      expect(actual).assertEqual('13.99');
      logInfo(`${BUNDLE}CommodityKey_0048 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0049
     * @tc.name      PageLoading_CommodityKey_0049
     * @tc.desc      commodityKey(id=28.9) returns "28.9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0049 begin`);
      const actual: string = commodityKey(28.9);
      logInfo(`commodityKey(id=28.9): actual=${actual}`);
      expect(actual).assertEqual('28.9');
      logInfo(`${BUNDLE}CommodityKey_0049 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0050
     * @tc.name      PageLoading_CommodityKey_0050
     * @tc.desc      commodityKey(id=68) returns "68"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0050 begin`);
      const actual: string = commodityKey(68);
      logInfo(`commodityKey(id=68): actual=${actual}`);
      expect(actual).assertEqual('68');
      logInfo(`${BUNDLE}CommodityKey_0050 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0051
     * @tc.name      PageLoading_CommodityKey_0051
     * @tc.desc      commodityKey(id=-17) returns "-17"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityKey_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityKey_0051 begin`);
      const actual: string = commodityKey(-17);
      logInfo(`commodityKey(id=-17): actual=${actual}`);
      expect(actual).assertEqual('-17');
      logInfo(`${BUNDLE}CommodityKey_0051 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0052
     * @tc.name      PageLoading_CommodityKey_0052
     * @tc.desc      commodityKey(id=83) returns "83"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0052 begin`);
      const actual: string = commodityKey(83);
      logInfo(`commodityKey(id=83): actual=${actual}`);
      expect(actual).assertEqual('83');
      logInfo(`${BUNDLE}CommodityKey_0052 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0053
     * @tc.name      PageLoading_CommodityKey_0053
     * @tc.desc      commodityKey(id=-98) returns "-98"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityKey_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityKey_0053 begin`);
      const actual: string = commodityKey(-98);
      logInfo(`commodityKey(id=-98): actual=${actual}`);
      expect(actual).assertEqual('-98');
      logInfo(`${BUNDLE}CommodityKey_0053 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0054
     * @tc.name      PageLoading_CommodityKey_0054
     * @tc.desc      commodityKey(id=-68) returns "-68"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityKey_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityKey_0054 begin`);
      const actual: string = commodityKey(-68);
      logInfo(`commodityKey(id=-68): actual=${actual}`);
      expect(actual).assertEqual('-68');
      logInfo(`${BUNDLE}CommodityKey_0054 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0055
     * @tc.name      PageLoading_CommodityKey_0055
     * @tc.desc      commodityKey(id=52.09) returns "52.09"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0055 begin`);
      const actual: string = commodityKey(52.09);
      logInfo(`commodityKey(id=52.09): actual=${actual}`);
      expect(actual).assertEqual('52.09');
      logInfo(`${BUNDLE}CommodityKey_0055 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0056
     * @tc.name      PageLoading_CommodityKey_0056
     * @tc.desc      commodityKey(id=149) returns "149"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0056 begin`);
      const actual: string = commodityKey(149);
      logInfo(`commodityKey(id=149): actual=${actual}`);
      expect(actual).assertEqual('149');
      logInfo(`${BUNDLE}CommodityKey_0056 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0057
     * @tc.name      PageLoading_CommodityKey_0057
     * @tc.desc      commodityKey(id=5.45) returns "5.45"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0057 begin`);
      const actual: string = commodityKey(5.45);
      logInfo(`commodityKey(id=5.45): actual=${actual}`);
      expect(actual).assertEqual('5.45');
      logInfo(`${BUNDLE}CommodityKey_0057 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0058
     * @tc.name      PageLoading_CommodityKey_0058
     * @tc.desc      commodityKey(id=-30) returns "-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityKey_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityKey_0058 begin`);
      const actual: string = commodityKey(-30);
      logInfo(`commodityKey(id=-30): actual=${actual}`);
      expect(actual).assertEqual('-30');
      logInfo(`${BUNDLE}CommodityKey_0058 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0059
     * @tc.name      PageLoading_CommodityKey_0059
     * @tc.desc      commodityKey(id=199) returns "199"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0059 begin`);
      const actual: string = commodityKey(199);
      logInfo(`commodityKey(id=199): actual=${actual}`);
      expect(actual).assertEqual('199');
      logInfo(`${BUNDLE}CommodityKey_0059 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0060
     * @tc.name      PageLoading_CommodityKey_0060
     * @tc.desc      commodityKey(id=-6) returns "-6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityKey_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityKey_0060 begin`);
      const actual: string = commodityKey(-6);
      logInfo(`commodityKey(id=-6): actual=${actual}`);
      expect(actual).assertEqual('-6');
      logInfo(`${BUNDLE}CommodityKey_0060 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0061
     * @tc.name      PageLoading_CommodityKey_0061
     * @tc.desc      commodityKey(id=72.85) returns "72.85"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0061 begin`);
      const actual: string = commodityKey(72.85);
      logInfo(`commodityKey(id=72.85): actual=${actual}`);
      expect(actual).assertEqual('72.85');
      logInfo(`${BUNDLE}CommodityKey_0061 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0062
     * @tc.name      PageLoading_CommodityKey_0062
     * @tc.desc      commodityKey(id=142) returns "142"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0062 begin`);
      const actual: string = commodityKey(142);
      logInfo(`commodityKey(id=142): actual=${actual}`);
      expect(actual).assertEqual('142');
      logInfo(`${BUNDLE}CommodityKey_0062 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0063
     * @tc.name      PageLoading_CommodityKey_0063
     * @tc.desc      commodityKey(id=82.13) returns "82.13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0063 begin`);
      const actual: string = commodityKey(82.13);
      logInfo(`commodityKey(id=82.13): actual=${actual}`);
      expect(actual).assertEqual('82.13');
      logInfo(`${BUNDLE}CommodityKey_0063 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0064
     * @tc.name      PageLoading_CommodityKey_0064
     * @tc.desc      commodityKey(id=-37) returns "-37"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityKey_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityKey_0064 begin`);
      const actual: string = commodityKey(-37);
      logInfo(`commodityKey(id=-37): actual=${actual}`);
      expect(actual).assertEqual('-37');
      logInfo(`${BUNDLE}CommodityKey_0064 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0065
     * @tc.name      PageLoading_CommodityKey_0065
     * @tc.desc      commodityKey(id=92.21) returns "92.21"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0065 begin`);
      const actual: string = commodityKey(92.21);
      logInfo(`commodityKey(id=92.21): actual=${actual}`);
      expect(actual).assertEqual('92.21');
      logInfo(`${BUNDLE}CommodityKey_0065 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0066
     * @tc.name      PageLoading_CommodityKey_0066
     * @tc.desc      commodityKey(id=119) returns "119"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0066 begin`);
      const actual: string = commodityKey(119);
      logInfo(`commodityKey(id=119): actual=${actual}`);
      expect(actual).assertEqual('119');
      logInfo(`${BUNDLE}CommodityKey_0066 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0067
     * @tc.name      PageLoading_CommodityKey_0067
     * @tc.desc      commodityKey(id=91.63) returns "91.63"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0067 begin`);
      const actual: string = commodityKey(91.63);
      logInfo(`commodityKey(id=91.63): actual=${actual}`);
      expect(actual).assertEqual('91.63');
      logInfo(`${BUNDLE}CommodityKey_0067 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0068
     * @tc.name      PageLoading_CommodityKey_0068
     * @tc.desc      commodityKey(id=46) returns "46"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0068 begin`);
      const actual: string = commodityKey(46);
      logInfo(`commodityKey(id=46): actual=${actual}`);
      expect(actual).assertEqual('46');
      logInfo(`${BUNDLE}CommodityKey_0068 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0069
     * @tc.name      PageLoading_CommodityKey_0069
     * @tc.desc      commodityKey(id=198) returns "198"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0069 begin`);
      const actual: string = commodityKey(198);
      logInfo(`commodityKey(id=198): actual=${actual}`);
      expect(actual).assertEqual('198');
      logInfo(`${BUNDLE}CommodityKey_0069 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0070
     * @tc.name      PageLoading_CommodityKey_0070
     * @tc.desc      commodityKey(id=63.36) returns "63.36"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0070 begin`);
      const actual: string = commodityKey(63.36);
      logInfo(`commodityKey(id=63.36): actual=${actual}`);
      expect(actual).assertEqual('63.36');
      logInfo(`${BUNDLE}CommodityKey_0070 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0071
     * @tc.name      PageLoading_CommodityKey_0071
     * @tc.desc      commodityKey(id=84.07) returns "84.07"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0071 begin`);
      const actual: string = commodityKey(84.07);
      logInfo(`commodityKey(id=84.07): actual=${actual}`);
      expect(actual).assertEqual('84.07');
      logInfo(`${BUNDLE}CommodityKey_0071 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0072
     * @tc.name      PageLoading_CommodityKey_0072
     * @tc.desc      commodityKey(id=73.63) returns "73.63"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0072 begin`);
      const actual: string = commodityKey(73.63);
      logInfo(`commodityKey(id=73.63): actual=${actual}`);
      expect(actual).assertEqual('73.63');
      logInfo(`${BUNDLE}CommodityKey_0072 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0073
     * @tc.name      PageLoading_CommodityKey_0073
     * @tc.desc      commodityKey(id=24.96) returns "24.96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0073 begin`);
      const actual: string = commodityKey(24.96);
      logInfo(`commodityKey(id=24.96): actual=${actual}`);
      expect(actual).assertEqual('24.96');
      logInfo(`${BUNDLE}CommodityKey_0073 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0074
     * @tc.name      PageLoading_CommodityKey_0074
     * @tc.desc      commodityKey(id=157) returns "157"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0074 begin`);
      const actual: string = commodityKey(157);
      logInfo(`commodityKey(id=157): actual=${actual}`);
      expect(actual).assertEqual('157');
      logInfo(`${BUNDLE}CommodityKey_0074 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0075
     * @tc.name      PageLoading_CommodityKey_0075
     * @tc.desc      commodityKey(id=-10) returns "-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityKey_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityKey_0075 begin`);
      const actual: string = commodityKey(-10);
      logInfo(`commodityKey(id=-10): actual=${actual}`);
      expect(actual).assertEqual('-10');
      logInfo(`${BUNDLE}CommodityKey_0075 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0076
     * @tc.name      PageLoading_CommodityKey_0076
     * @tc.desc      commodityKey(id=162) returns "162"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0076 begin`);
      const actual: string = commodityKey(162);
      logInfo(`commodityKey(id=162): actual=${actual}`);
      expect(actual).assertEqual('162');
      logInfo(`${BUNDLE}CommodityKey_0076 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0077
     * @tc.name      PageLoading_CommodityKey_0077
     * @tc.desc      commodityKey(id=75.16) returns "75.16"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0077 begin`);
      const actual: string = commodityKey(75.16);
      logInfo(`commodityKey(id=75.16): actual=${actual}`);
      expect(actual).assertEqual('75.16');
      logInfo(`${BUNDLE}CommodityKey_0077 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0078
     * @tc.name      PageLoading_CommodityKey_0078
     * @tc.desc      commodityKey(id=67.73) returns "67.73"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0078 begin`);
      const actual: string = commodityKey(67.73);
      logInfo(`commodityKey(id=67.73): actual=${actual}`);
      expect(actual).assertEqual('67.73');
      logInfo(`${BUNDLE}CommodityKey_0078 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0079
     * @tc.name      PageLoading_CommodityKey_0079
     * @tc.desc      commodityKey(id=-5) returns "-5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityKey_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityKey_0079 begin`);
      const actual: string = commodityKey(-5);
      logInfo(`commodityKey(id=-5): actual=${actual}`);
      expect(actual).assertEqual('-5');
      logInfo(`${BUNDLE}CommodityKey_0079 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0080
     * @tc.name      PageLoading_CommodityKey_0080
     * @tc.desc      commodityKey(id=-42) returns "-42"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityKey_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityKey_0080 begin`);
      const actual: string = commodityKey(-42);
      logInfo(`commodityKey(id=-42): actual=${actual}`);
      expect(actual).assertEqual('-42');
      logInfo(`${BUNDLE}CommodityKey_0080 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0081
     * @tc.name      PageLoading_CommodityKey_0081
     * @tc.desc      commodityKey(id=47) returns "47"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0081 begin`);
      const actual: string = commodityKey(47);
      logInfo(`commodityKey(id=47): actual=${actual}`);
      expect(actual).assertEqual('47');
      logInfo(`${BUNDLE}CommodityKey_0081 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0082
     * @tc.name      PageLoading_CommodityKey_0082
     * @tc.desc      commodityKey(id=129) returns "129"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0082 begin`);
      const actual: string = commodityKey(129);
      logInfo(`commodityKey(id=129): actual=${actual}`);
      expect(actual).assertEqual('129');
      logInfo(`${BUNDLE}CommodityKey_0082 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0083
     * @tc.name      PageLoading_CommodityKey_0083
     * @tc.desc      commodityKey(id=-69) returns "-69"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityKey_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityKey_0083 begin`);
      const actual: string = commodityKey(-69);
      logInfo(`commodityKey(id=-69): actual=${actual}`);
      expect(actual).assertEqual('-69');
      logInfo(`${BUNDLE}CommodityKey_0083 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0084
     * @tc.name      PageLoading_CommodityKey_0084
     * @tc.desc      commodityKey(id=52) returns "52"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0084 begin`);
      const actual: string = commodityKey(52);
      logInfo(`commodityKey(id=52): actual=${actual}`);
      expect(actual).assertEqual('52');
      logInfo(`${BUNDLE}CommodityKey_0084 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0085
     * @tc.name      PageLoading_CommodityKey_0085
     * @tc.desc      commodityKey(id=36) returns "36"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0085 begin`);
      const actual: string = commodityKey(36);
      logInfo(`commodityKey(id=36): actual=${actual}`);
      expect(actual).assertEqual('36');
      logInfo(`${BUNDLE}CommodityKey_0085 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0086
     * @tc.name      PageLoading_CommodityKey_0086
     * @tc.desc      commodityKey(id=-66) returns "-66"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityKey_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityKey_0086 begin`);
      const actual: string = commodityKey(-66);
      logInfo(`commodityKey(id=-66): actual=${actual}`);
      expect(actual).assertEqual('-66');
      logInfo(`${BUNDLE}CommodityKey_0086 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0087
     * @tc.name      PageLoading_CommodityKey_0087
     * @tc.desc      commodityKey(id=68.56) returns "68.56"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0087 begin`);
      const actual: string = commodityKey(68.56);
      logInfo(`commodityKey(id=68.56): actual=${actual}`);
      expect(actual).assertEqual('68.56');
      logInfo(`${BUNDLE}CommodityKey_0087 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0088
     * @tc.name      PageLoading_CommodityKey_0088
     * @tc.desc      commodityKey(id=121) returns "121"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0088 begin`);
      const actual: string = commodityKey(121);
      logInfo(`commodityKey(id=121): actual=${actual}`);
      expect(actual).assertEqual('121');
      logInfo(`${BUNDLE}CommodityKey_0088 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0089
     * @tc.name      PageLoading_CommodityKey_0089
     * @tc.desc      commodityKey(id=63.64) returns "63.64"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0089 begin`);
      const actual: string = commodityKey(63.64);
      logInfo(`commodityKey(id=63.64): actual=${actual}`);
      expect(actual).assertEqual('63.64');
      logInfo(`${BUNDLE}CommodityKey_0089 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0090
     * @tc.name      PageLoading_CommodityKey_0090
     * @tc.desc      commodityKey(id=12.73) returns "12.73"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0090 begin`);
      const actual: string = commodityKey(12.73);
      logInfo(`commodityKey(id=12.73): actual=${actual}`);
      expect(actual).assertEqual('12.73');
      logInfo(`${BUNDLE}CommodityKey_0090 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0091
     * @tc.name      PageLoading_CommodityKey_0091
     * @tc.desc      commodityKey(id=-63) returns "-63"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityKey_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityKey_0091 begin`);
      const actual: string = commodityKey(-63);
      logInfo(`commodityKey(id=-63): actual=${actual}`);
      expect(actual).assertEqual('-63');
      logInfo(`${BUNDLE}CommodityKey_0091 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0092
     * @tc.name      PageLoading_CommodityKey_0092
     * @tc.desc      commodityKey(id=84) returns "84"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0092 begin`);
      const actual: string = commodityKey(84);
      logInfo(`commodityKey(id=84): actual=${actual}`);
      expect(actual).assertEqual('84');
      logInfo(`${BUNDLE}CommodityKey_0092 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0093
     * @tc.name      PageLoading_CommodityKey_0093
     * @tc.desc      commodityKey(id=67.21) returns "67.21"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0093 begin`);
      const actual: string = commodityKey(67.21);
      logInfo(`commodityKey(id=67.21): actual=${actual}`);
      expect(actual).assertEqual('67.21');
      logInfo(`${BUNDLE}CommodityKey_0093 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0094
     * @tc.name      PageLoading_CommodityKey_0094
     * @tc.desc      commodityKey(id=139) returns "139"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0094 begin`);
      const actual: string = commodityKey(139);
      logInfo(`commodityKey(id=139): actual=${actual}`);
      expect(actual).assertEqual('139');
      logInfo(`${BUNDLE}CommodityKey_0094 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0095
     * @tc.name      PageLoading_CommodityKey_0095
     * @tc.desc      commodityKey(id=16.16) returns "16.16"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0095 begin`);
      const actual: string = commodityKey(16.16);
      logInfo(`commodityKey(id=16.16): actual=${actual}`);
      expect(actual).assertEqual('16.16');
      logInfo(`${BUNDLE}CommodityKey_0095 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0096
     * @tc.name      PageLoading_CommodityKey_0096
     * @tc.desc      commodityKey(id=12) returns "12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0096 begin`);
      const actual: string = commodityKey(12);
      logInfo(`commodityKey(id=12): actual=${actual}`);
      expect(actual).assertEqual('12');
      logInfo(`${BUNDLE}CommodityKey_0096 end`);
    });
  });
}
