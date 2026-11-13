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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import Constants from '../../../main/ets/common/Constants';

const TAG: string = '[Sample_constantsDomainCore]';
const DOMAIN: number = 0xF811;

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

interface ExpectAssert {
  assertEqual(expectValue: string | number | boolean | Object | null | undefined): void;
  assertTrue(): void;
  assertFalse(): void;
  assertLarger(expectValue: number): void;
  assertLargerOrEqual(expectValue: number): void;
  assertLess(expectValue: number): void;
  assertLessOrEqual(expectValue: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}


export default function constantsDomainCoreTest(): void {
  describe('constantsDomainCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_0100
     * @tc.name      testConstantsDomain0001
     * @tc.desc      Verify constantsDomainCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_0200
     * @tc.name      testConstantsDomain0002
     * @tc.desc      Verify constantsDomainCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_0300
     * @tc.name      testConstantsDomain0003
     * @tc.desc      Verify constantsDomainCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_0400
     * @tc.name      testConstantsDomain0004
     * @tc.desc      Verify constantsDomainCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_0500
     * @tc.name      testConstantsDomain0005
     * @tc.desc      Verify constantsDomainCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_0600
     * @tc.name      testConstantsDomain0006
     * @tc.desc      Verify constantsDomainCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_0700
     * @tc.name      testConstantsDomain0007
     * @tc.desc      Verify constantsDomainCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_0800
     * @tc.name      testConstantsDomain0008
     * @tc.desc      Verify constantsDomainCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_0900
     * @tc.name      testConstantsDomain0009
     * @tc.desc      Verify constantsDomainCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_1000
     * @tc.name      testConstantsDomain0010
     * @tc.desc      Verify constantsDomainCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_1100
     * @tc.name      testConstantsDomain0011
     * @tc.desc      Verify constantsDomainCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_1200
     * @tc.name      testConstantsDomain0012
     * @tc.desc      Verify constantsDomainCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_1300
     * @tc.name      testConstantsDomain0013
     * @tc.desc      Verify constantsDomainCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_1400
     * @tc.name      testConstantsDomain0014
     * @tc.desc      Verify constantsDomainCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_1500
     * @tc.name      testConstantsDomain0015
     * @tc.desc      Verify constantsDomainCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_1600
     * @tc.name      testConstantsDomain0016
     * @tc.desc      Verify constantsDomainCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_1700
     * @tc.name      testConstantsDomain0017
     * @tc.desc      Verify constantsDomainCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_1800
     * @tc.name      testConstantsDomain0018
     * @tc.desc      Verify constantsDomainCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_1900
     * @tc.name      testConstantsDomain0019
     * @tc.desc      Verify constantsDomainCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_2000
     * @tc.name      testConstantsDomain0020
     * @tc.desc      Verify constantsDomainCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_2100
     * @tc.name      testConstantsDomain0021
     * @tc.desc      Verify constantsDomainCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_2200
     * @tc.name      testConstantsDomain0022
     * @tc.desc      Verify constantsDomainCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_2300
     * @tc.name      testConstantsDomain0023
     * @tc.desc      Verify constantsDomainCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_2400
     * @tc.name      testConstantsDomain0024
     * @tc.desc      Verify constantsDomainCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_2500
     * @tc.name      testConstantsDomain0025
     * @tc.desc      Verify constantsDomainCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_2600
     * @tc.name      testConstantsDomain0026
     * @tc.desc      Verify constantsDomainCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_2700
     * @tc.name      testConstantsDomain0027
     * @tc.desc      Verify constantsDomainCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_2800
     * @tc.name      testConstantsDomain0028
     * @tc.desc      Verify constantsDomainCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_2900
     * @tc.name      testConstantsDomain0029
     * @tc.desc      Verify constantsDomainCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_3000
     * @tc.name      testConstantsDomain0030
     * @tc.desc      Verify constantsDomainCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_3100
     * @tc.name      testConstantsDomain0031
     * @tc.desc      Verify constantsDomainCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_3200
     * @tc.name      testConstantsDomain0032
     * @tc.desc      Verify constantsDomainCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_3300
     * @tc.name      testConstantsDomain0033
     * @tc.desc      Verify constantsDomainCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_3400
     * @tc.name      testConstantsDomain0034
     * @tc.desc      Verify constantsDomainCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_3500
     * @tc.name      testConstantsDomain0035
     * @tc.desc      Verify constantsDomainCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_3600
     * @tc.name      testConstantsDomain0036
     * @tc.desc      Verify constantsDomainCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_3700
     * @tc.name      testConstantsDomain0037
     * @tc.desc      Verify constantsDomainCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_3800
     * @tc.name      testConstantsDomain0038
     * @tc.desc      Verify constantsDomainCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_3900
     * @tc.name      testConstantsDomain0039
     * @tc.desc      Verify constantsDomainCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_4000
     * @tc.name      testConstantsDomain0040
     * @tc.desc      Verify constantsDomainCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_4100
     * @tc.name      testConstantsDomain0041
     * @tc.desc      Verify constantsDomainCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_4200
     * @tc.name      testConstantsDomain0042
     * @tc.desc      Verify constantsDomainCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_4300
     * @tc.name      testConstantsDomain0043
     * @tc.desc      Verify constantsDomainCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_4400
     * @tc.name      testConstantsDomain0044
     * @tc.desc      Verify constantsDomainCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_4500
     * @tc.name      testConstantsDomain0045
     * @tc.desc      Verify constantsDomainCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_4600
     * @tc.name      testConstantsDomain0046
     * @tc.desc      Verify constantsDomainCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_4700
     * @tc.name      testConstantsDomain0047
     * @tc.desc      Verify constantsDomainCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_4800
     * @tc.name      testConstantsDomain0048
     * @tc.desc      Verify constantsDomainCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_4900
     * @tc.name      testConstantsDomain0049
     * @tc.desc      Verify constantsDomainCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_5000
     * @tc.name      testConstantsDomain0050
     * @tc.desc      Verify constantsDomainCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_5100
     * @tc.name      testConstantsDomain0051
     * @tc.desc      Verify constantsDomainCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_5200
     * @tc.name      testConstantsDomain0052
     * @tc.desc      Verify constantsDomainCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_5300
     * @tc.name      testConstantsDomain0053
     * @tc.desc      Verify constantsDomainCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_5400
     * @tc.name      testConstantsDomain0054
     * @tc.desc      Verify constantsDomainCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_5500
     * @tc.name      testConstantsDomain0055
     * @tc.desc      Verify constantsDomainCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_5600
     * @tc.name      testConstantsDomain0056
     * @tc.desc      Verify constantsDomainCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_5700
     * @tc.name      testConstantsDomain0057
     * @tc.desc      Verify constantsDomainCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_5800
     * @tc.name      testConstantsDomain0058
     * @tc.desc      Verify constantsDomainCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_5900
     * @tc.name      testConstantsDomain0059
     * @tc.desc      Verify constantsDomainCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_6000
     * @tc.name      testConstantsDomain0060
     * @tc.desc      Verify constantsDomainCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_6100
     * @tc.name      testConstantsDomain0061
     * @tc.desc      Verify constantsDomainCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_6200
     * @tc.name      testConstantsDomain0062
     * @tc.desc      Verify constantsDomainCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_6300
     * @tc.name      testConstantsDomain0063
     * @tc.desc      Verify constantsDomainCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_6400
     * @tc.name      testConstantsDomain0064
     * @tc.desc      Verify constantsDomainCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_6500
     * @tc.name      testConstantsDomain0065
     * @tc.desc      Verify constantsDomainCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_6600
     * @tc.name      testConstantsDomain0066
     * @tc.desc      Verify constantsDomainCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_6700
     * @tc.name      testConstantsDomain0067
     * @tc.desc      Verify constantsDomainCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_6800
     * @tc.name      testConstantsDomain0068
     * @tc.desc      Verify constantsDomainCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_6900
     * @tc.name      testConstantsDomain0069
     * @tc.desc      Verify constantsDomainCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_7000
     * @tc.name      testConstantsDomain0070
     * @tc.desc      Verify constantsDomainCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_7100
     * @tc.name      testConstantsDomain0071
     * @tc.desc      Verify constantsDomainCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_7200
     * @tc.name      testConstantsDomain0072
     * @tc.desc      Verify constantsDomainCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_7300
     * @tc.name      testConstantsDomain0073
     * @tc.desc      Verify constantsDomainCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_7400
     * @tc.name      testConstantsDomain0074
     * @tc.desc      Verify constantsDomainCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_7500
     * @tc.name      testConstantsDomain0075
     * @tc.desc      Verify constantsDomainCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_7600
     * @tc.name      testConstantsDomain0076
     * @tc.desc      Verify constantsDomainCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_7700
     * @tc.name      testConstantsDomain0077
     * @tc.desc      Verify constantsDomainCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_7800
     * @tc.name      testConstantsDomain0078
     * @tc.desc      Verify constantsDomainCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_7900
     * @tc.name      testConstantsDomain0079
     * @tc.desc      Verify constantsDomainCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_8000
     * @tc.name      testConstantsDomain0080
     * @tc.desc      Verify constantsDomainCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_DOMAIN_8100
     * @tc.name      testConstantsDomain0081
     * @tc.desc      Verify constantsDomainCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsDomain0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      expect(Constants.DOMAIN).assertLarger(0);
      expect(typeof Constants.DOMAIN).assertEqual('number');
    });

  });
}
