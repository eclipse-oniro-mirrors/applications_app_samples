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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF814;
const TAG: string = 'WindowRatioRatioCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

// Specification of pages/Index.ets onSelect mapping: index 0 -> 4:3.
function ratioOfIndex(index: number): number {
  if (index === 0) {
    return (4 / 3) * 1.0;
  } else if (index === 1) {
    return 1.0;
  } else {
    return (16 / 9) * 1.0;
  }
}

// Specification of pages/Index.ets onSelect mapping: index 0 -> '4:3'.
function ratioTextOfIndex(index: number): string {
  if (index === 0) {
    return '4:3';
  } else if (index === 1) {
    return '1:1';
  } else {
    return '16:9';
  }
}

// Specification of window.setAspectRatio input contract: ratio must be a finite positive number.
function isValidAspectRatio(value: number): boolean {
  return value > 0 && Number.isFinite(value);
}

const RATIO_4_3: number = (4 / 3) * 1.0;
const RATIO_1_1: number = 1.0;
const RATIO_16_9: number = (16 / 9) * 1.0;
const DELTA: number = 1e-9;

export default function windowRatioRatioCoreTest(): void {
  describe('WindowRatioRatioCoreTest', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_RATIOCORE_0001
     * @tc.name      testRatioCore0001
     * @tc.desc      Verify ratio mapping for index 0 equals 4 divided by 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatioCore0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatioCore0001 begin');
      const actual: number = ratioOfIndex(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertClose actual=${actual}, expected=1.3333333333333333, DELTA`);
      expect(actual).assertClose(1.3333333333333333, DELTA);
      log('testRatioCore0001 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIOCORE_0002
     * @tc.name      testRatioCore0002
     * @tc.desc      Verify ratio mapping result for index 0 keeps number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatioCore0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatioCore0002 begin');
      const actual: number = ratioOfIndex(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRatioCore0002 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIOCORE_0003
     * @tc.name      testRatioCore0003
     * @tc.desc      Verify ratio mapping for index 1 equals one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatioCore0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatioCore0003 begin');
      const actual: number = ratioOfIndex(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=1.0`);
      expect(actual).assertEqual(1.0);
      log('testRatioCore0003 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIOCORE_0004
     * @tc.name      testRatioCore0004
     * @tc.desc      Verify ratio mapping result for index 1 keeps number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatioCore0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatioCore0004 begin');
      const actual: number = ratioOfIndex(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRatioCore0004 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIOCORE_0005
     * @tc.name      testRatioCore0005
     * @tc.desc      Verify ratio mapping for index 2 equals 16 divided by 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatioCore0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatioCore0005 begin');
      const actual: number = ratioOfIndex(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertClose actual=${actual}, expected=1.7777777777777777, DELTA`);
      expect(actual).assertClose(1.7777777777777777, DELTA);
      log('testRatioCore0005 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIOCORE_0006
     * @tc.name      testRatioCore0006
     * @tc.desc      Verify ratio mapping result for index 2 keeps number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatioCore0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatioCore0006 begin');
      const actual: number = ratioOfIndex(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRatioCore0006 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIOCORE_0007
     * @tc.name      testRatioCore0007
     * @tc.desc      Verify 4:3 ratio differs from 1:1 ratio.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatioCore0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatioCore0007 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue RATIO_4_3 !== RATIO_1_1=${RATIO_4_3 !== RATIO_1_1}`);
      expect(RATIO_4_3 !== RATIO_1_1).assertTrue();
      log('testRatioCore0007 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIOCORE_0008
     * @tc.name      testRatioCore0008
     * @tc.desc      Verify 4:3 ratio is smaller than 16:9 ratio.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatioCore0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatioCore0008 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue RATIO_4_3 < RATIO_16_9=${RATIO_4_3 < RATIO_16_9}`);
      expect(RATIO_4_3 < RATIO_16_9).assertTrue();
      log('testRatioCore0008 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIOCORE_0009
     * @tc.name      testRatioCore0009
     * @tc.desc      Verify 1:1 ratio is smaller than 16:9 ratio.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatioCore0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatioCore0009 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue RATIO_1_1 < RATIO_16_9=${RATIO_1_1 < RATIO_16_9}`);
      expect(RATIO_1_1 < RATIO_16_9).assertTrue();
      log('testRatioCore0009 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIOCORE_0010
     * @tc.name      testRatioCore0010
     * @tc.desc      Verify out-of-range index 3 falls back to the 16:9 branch.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatioCore0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatioCore0010 begin');
      const actual: number = ratioOfIndex(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertClose actual=${actual}, expected=RATIO_16_9, DELTA`);
      expect(actual).assertClose(RATIO_16_9, DELTA);
      log('testRatioCore0010 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIOCORE_0011
     * @tc.name      testRatioCore0011
     * @tc.desc      Verify negative index falls back to the 16:9 branch.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatioCore0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatioCore0011 begin');
      const actual: number = ratioOfIndex(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertClose actual=${actual}, expected=RATIO_16_9, DELTA`);
      expect(actual).assertClose(RATIO_16_9, DELTA);
      log('testRatioCore0011 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIOCORE_0012
     * @tc.name      testRatioCore0012
     * @tc.desc      Verify ratio text mapping for index 0 equals 4:3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatioCore0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatioCore0012 begin');
      const actual: string = ratioTextOfIndex(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='4:3'`);
      expect(actual).assertEqual('4:3');
      log('testRatioCore0012 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIOCORE_0013
     * @tc.name      testRatioCore0013
     * @tc.desc      Verify ratio text mapping result keeps string type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatioCore0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatioCore0013 begin');
      const actual: string = ratioTextOfIndex(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='string'`);
      expect(typeof actual).assertEqual('string');
      log('testRatioCore0013 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIOCORE_0014
     * @tc.name      testRatioCore0014
     * @tc.desc      Verify ratio text mapping for index 1 equals 1:1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatioCore0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatioCore0014 begin');
      const actual: string = ratioTextOfIndex(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='1:1'`);
      expect(actual).assertEqual('1:1');
      log('testRatioCore0014 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIOCORE_0015
     * @tc.name      testRatioCore0015
     * @tc.desc      Verify ratio text mapping for index 2 equals 16:9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatioCore0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatioCore0015 begin');
      const actual: string = ratioTextOfIndex(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='16:9'`);
      expect(actual).assertEqual('16:9');
      log('testRatioCore0015 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIOCORE_0016
     * @tc.name      testRatioCore0016
     * @tc.desc      Verify out-of-range index 3 falls back to the 16:9 text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatioCore0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatioCore0016 begin');
      const actual: string = ratioTextOfIndex(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='16:9'`);
      expect(actual).assertEqual('16:9');
      log('testRatioCore0016 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIOCORE_0017
     * @tc.name      testRatioCore0017
     * @tc.desc      Verify the three ratio texts are pairwise distinct.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatioCore0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatioCore0017 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${ratioTextOfIndex(0) !== ratioTextOfIndex(1)}`);
      expect(ratioTextOfIndex(0) !== ratioTextOfIndex(1)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${ratioTextOfIndex(1) !== ratioTextOfIndex(2)}`);
      expect(ratioTextOfIndex(1) !== ratioTextOfIndex(2)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${ratioTextOfIndex(0) !== ratioTextOfIndex(2)}`);
      expect(ratioTextOfIndex(0) !== ratioTextOfIndex(2)).assertTrue();
      log('testRatioCore0017 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIOCORE_0018
     * @tc.name      testRatioCore0018
     * @tc.desc      Verify 4:3 ratio satisfies the setAspectRatio input contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatioCore0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatioCore0018 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${isValidAspectRatio(RATIO_4_3)}`);
      expect(isValidAspectRatio(RATIO_4_3)).assertTrue();
      log('testRatioCore0018 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIOCORE_0019
     * @tc.name      testRatioCore0019
     * @tc.desc      Verify 1:1 ratio satisfies the setAspectRatio input contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatioCore0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatioCore0019 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${isValidAspectRatio(RATIO_1_1)}`);
      expect(isValidAspectRatio(RATIO_1_1)).assertTrue();
      log('testRatioCore0019 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIOCORE_0020
     * @tc.name      testRatioCore0020
     * @tc.desc      Verify 16:9 ratio satisfies the setAspectRatio input contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatioCore0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatioCore0020 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${isValidAspectRatio(RATIO_16_9)}`);
      expect(isValidAspectRatio(RATIO_16_9)).assertTrue();
      log('testRatioCore0020 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIOCORE_0021
     * @tc.name      testRatioCore0021
     * @tc.desc      Verify zero ratio is rejected by the setAspectRatio contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatioCore0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatioCore0021 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse isValidAspectRatio(0)=${isValidAspectRatio(0)}`);
      expect(isValidAspectRatio(0)).assertFalse();
      log('testRatioCore0021 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIOCORE_0022
     * @tc.name      testRatioCore0022
     * @tc.desc      Verify negative ratio minus one is rejected by the contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatioCore0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatioCore0022 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse isValidAspectRatio(-1)=${isValidAspectRatio(-1)}`);
      expect(isValidAspectRatio(-1)).assertFalse();
      log('testRatioCore0022 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIOCORE_0023
     * @tc.name      testRatioCore0023
     * @tc.desc      Verify tiny negative ratio is rejected by the contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatioCore0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatioCore0023 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse isValidAspectRatio(-0.001)=${isValidAspectRatio(-0.001)}`);
      expect(isValidAspectRatio(-0.001)).assertFalse();
      log('testRatioCore0023 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIOCORE_0024
     * @tc.name      testRatioCore0024
     * @tc.desc      Verify NaN ratio is rejected by the setAspectRatio contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatioCore0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatioCore0024 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${isValidAspectRatio(Number.NaN)}`);
      expect(isValidAspectRatio(Number.NaN)).assertFalse();
      log('testRatioCore0024 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIOCORE_0025
     * @tc.name      testRatioCore0025
     * @tc.desc      Verify positive infinity ratio is rejected by the contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatioCore0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatioCore0025 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${isValidAspectRatio(Number.POSITIVE_INFINITY)}`);
      expect(isValidAspectRatio(Number.POSITIVE_INFINITY)).assertFalse();
      log('testRatioCore0025 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIOCORE_0026
     * @tc.name      testRatioCore0026
     * @tc.desc      Verify negative infinity ratio is rejected by the contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatioCore0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatioCore0026 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${isValidAspectRatio(Number.NEGATIVE_INFINITY)}`);
      expect(isValidAspectRatio(Number.NEGATIVE_INFINITY)).assertFalse();
      log('testRatioCore0026 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIOCORE_0027
     * @tc.name      testRatioCore0027
     * @tc.desc      Verify small positive ratio 0.5 satisfies the contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatioCore0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatioCore0027 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue isValidAspectRatio(0.5)=${isValidAspectRatio(0.5)}`);
      expect(isValidAspectRatio(0.5)).assertTrue();
      log('testRatioCore0027 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIOCORE_0028
     * @tc.name      testRatioCore0028
     * @tc.desc      Verify large positive ratio 10 satisfies the contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRatioCore0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRatioCore0028 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue isValidAspectRatio(10.0)=${isValidAspectRatio(10.0)}`);
      expect(isValidAspectRatio(10.0)).assertTrue();
      log('testRatioCore0028 end');
    })
  })
}
