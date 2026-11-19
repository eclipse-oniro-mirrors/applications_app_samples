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

import { describe, beforeEach, it, expect } from '@ohos/hypium';
import { add, multiply } from '../../../main/ets/common/Math';
import { APP_NAME, version, APP_LABEL } from '../../../main/ets/common/Config';
import { getFeatureLabel } from '../../../main/ets/common/Feature';
import { getProfileLabel } from '../../../main/ets/common/ProfileFeature';
import { getSettingsLabel } from '../../../main/ets/common/SettingsFeature';
import ReportBuilder, { ReportOptions } from '../../../main/ets/common/Report';
import Logger from '../../../main/ets/common/Logger';
import { logBegin, logEnd } from './ArkTSGuideUiSupport';

function addAll(values: number[]): number {
  let total: number = 0;
  for (let i = 0; i < values.length; i++) {
    total = add(total, values[i]);
  }
  return total;
}

function multiplyAll(values: number[]): number {
  let product: number = 1;
  for (let i = 0; i < values.length; i++) {
    product = multiply(product, values[i]);
  }
  return product;
}

function isIntegerLike(value: number): boolean {
  return Number.isInteger(value);
}

/**
 * common/Math.ets, common/Config.ets, common/Feature*.ets, common/Report.ets, common/Logger.ets 契约。
 */
export default function ArkTSCommonModulesTest(): void {
  describe('ArkTSCommonModulesTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_MODULES_testMathAddPositive0001
     * @tc.name      testMathAddPositive0001
     * @tc.desc      Verify add returns the arithmetic sum for positive operands
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMathAddPositive0001', 0, () => {
      logBegin('testMathAddPositive0001');
      expect(add(1, 2)).assertEqual(3);
      expect(add(10, 15)).assertEqual(25);
      expect(add(0, 7)).assertEqual(7);
      logEnd('testMathAddPositive0001');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_MODULES_testMathAddNegativeAndZero0002
     * @tc.name      testMathAddNegativeAndZero0002
     * @tc.desc      Verify add handles negative operands and zero identity
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMathAddNegativeAndZero0002', 0, () => {
      logBegin('testMathAddNegativeAndZero0002');
      expect(add(-1, -2)).assertEqual(-3);
      expect(add(-5, 5)).assertEqual(0);
      expect(add(0, 0)).assertEqual(0);
      expect(add(-7, 3)).assertEqual(-4);
      logEnd('testMathAddNegativeAndZero0002');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_MODULES_testMathAddFloatingPoint0003
     * @tc.name      testMathAddFloatingPoint0003
     * @tc.desc      Verify add works with fractional operands
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMathAddFloatingPoint0003', 0, () => {
      logBegin('testMathAddFloatingPoint0003');
      expect(add(0.5, 0.25)).assertEqual(0.75);
      expect(add(1.5, 2.5)).assertEqual(4);
      expect(add(-0.5, 0.5)).assertEqual(0);
      logEnd('testMathAddFloatingPoint0003');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_MODULES_testMathAddNaNPropagation0004
     * @tc.name      testMathAddNaNPropagation0004
     * @tc.desc      Verify NaN propagates through add instead of being swallowed
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMathAddNaNPropagation0004', 0, () => {
      logBegin('testMathAddNaNPropagation0004');
      const result: number = add(NaN, 1);
      expect(Number.isNaN(result)).assertTrue();
      expect(isIntegerLike(result)).assertFalse();
      expect(add(1, NaN) !== add(1, NaN)).assertTrue();
      logEnd('testMathAddNaNPropagation0004');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_MODULES_testMathAddInfinity0005
     * @tc.name      testMathAddInfinity0005
     * @tc.desc      Verify infinities flow through add as expected
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMathAddInfinity0005', 0, () => {
      logBegin('testMathAddInfinity0005');
      expect(add(Infinity, 1)).assertEqual(Infinity);
      expect(add(-Infinity, 1)).assertEqual(-Infinity);
      expect(Number.isNaN(add(Infinity, -Infinity))).assertTrue();
      logEnd('testMathAddInfinity0005');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_MODULES_testMathAddLargeIntegers0006
     * @tc.name      testMathAddLargeIntegers0006
     * @tc.desc      Verify add stays exact within the safe integer range
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMathAddLargeIntegers0006', 0, () => {
      logBegin('testMathAddLargeIntegers0006');
      expect(add(1000000, 2000000)).assertEqual(3000000);
      expect(add(Number.MAX_SAFE_INTEGER - 1, 1)).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(add(Number.MIN_SAFE_INTEGER + 1, -1)).assertEqual(Number.MIN_SAFE_INTEGER);
      logEnd('testMathAddLargeIntegers0006');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_MODULES_testMathAddCommutative0007
     * @tc.name      testMathAddCommutative0007
     * @tc.desc      Verify add is commutative over a sample matrix
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMathAddCommutative0007', 0, () => {
      logBegin('testMathAddCommutative0007');
      const left: number[] = [3, -8, 0, 12, 99];
      const right: number[] = [-4, 8, 50, -12, 1];
      let matched: number = 0;
      for (let i = 0; i < left.length; i++) {
        if (add(left[i], right[i]) === add(right[i], left[i])) {
          matched++;
        }
      }
      expect(matched).assertEqual(left.length);
      expect(addAll(left)).assertEqual(106);
      logEnd('testMathAddCommutative0007');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_MODULES_testMathMultiplyPositive0008
     * @tc.name      testMathMultiplyPositive0008
     * @tc.desc      Verify multiply returns the arithmetic product
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMathMultiplyPositive0008', 0, () => {
      logBegin('testMathMultiplyPositive0008');
      expect(multiply(5, 3)).assertEqual(15);
      expect(multiply(1, 1)).assertEqual(1);
      expect(multiply(7, 1)).assertEqual(7);
      logEnd('testMathMultiplyPositive0008');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_MODULES_testMathMultiplyByZero0009
     * @tc.name      testMathMultiplyByZero0009
     * @tc.desc      Verify multiply yields zero whenever one operand is zero
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMathMultiplyByZero0009', 0, () => {
      logBegin('testMathMultiplyByZero0009');
      expect(multiply(0, 999)).assertEqual(0);
      expect(multiply(999, 0)).assertEqual(0);
      expect(multiply(0, 0)).assertEqual(0);
      expect(Math.sign(multiply(-5, 0))).assertEqual(0);
      logEnd('testMathMultiplyByZero0009');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_MODULES_testMathMultiplyNegative0010
     * @tc.name      testMathMultiplyNegative0010
     * @tc.desc      Verify sign rules for negative multiplication
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMathMultiplyNegative0010', 0, () => {
      logBegin('testMathMultiplyNegative0010');
      expect(multiply(-2, 3)).assertEqual(-6);
      expect(multiply(-2, -3)).assertEqual(6);
      expect(multiply(2, -3)).assertEqual(-6);
      expect(multiply(-2, -3) > 0).assertTrue();
      logEnd('testMathMultiplyNegative0010');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_MODULES_testMathMultiplyFraction0011
     * @tc.name      testMathMultiplyFraction0011
     * @tc.desc      Verify multiply supports fractional operands
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMathMultiplyFraction0011', 0, () => {
      logBegin('testMathMultiplyFraction0011');
      expect(multiply(0.5, 4)).assertEqual(2);
      expect(multiply(2.5, 2)).assertEqual(5);
      expect(multiply(0.1, 10)).assertClose(1, 1e-9);
      logEnd('testMathMultiplyFraction0011');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_MODULES_testMathMultiplyNegativeNaN0012
     * @tc.name      testMathMultiplyNegativeNaN0012
     * @tc.desc      Verify multiply propagates NaN
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMathMultiplyNegativeNaN0012', 0, () => {
      logBegin('testMathMultiplyNegativeNaN0012');
      expect(Number.isNaN(multiply(NaN, 5))).assertTrue();
      expect(Number.isNaN(multiply(5, NaN))).assertTrue();
      expect(Number.isNaN(multiply(NaN, 0))).assertTrue();
      logEnd('testMathMultiplyNegativeNaN0012');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_MODULES_testMathReduceChains0013
     * @tc.name      testMathReduceChains0013
     * @tc.desc      Verify chained add and multiply agree with closed-form results
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMathReduceChains0013', 0, () => {
      logBegin('testMathReduceChains0013');
      expect(addAll([1, 2, 3, 4, 5])).assertEqual(15);
      expect(multiplyAll([1, 2, 3, 4, 5])).assertEqual(120);
      expect(multiplyAll([2, 2, 2, 2])).assertEqual(16);
      logEnd('testMathReduceChains0013');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_MODULES_testConfigConstants0014
     * @tc.name      testConfigConstants0014
     * @tc.desc      Verify the exported configuration constants keep their documented values
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testConfigConstants0014', 0, () => {
      logBegin('testConfigConstants0014');
      expect(APP_NAME).assertEqual('DemoApp');
      expect(version).assertEqual('1.0');
      expect(APP_LABEL).assertEqual('DemoApp');
      logEnd('testConfigConstants0014');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_MODULES_testConfigNamesAreIndependent0015
     * @tc.name      testConfigNamesAreIndependent0015
     * @tc.desc      Verify APP_NAME and APP_LABEL are separate bindings with equal content
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testConfigNamesAreIndependent0015', 0, () => {
      logBegin('testConfigNamesAreIndependent0015');
      expect(APP_NAME).assertEqual(APP_LABEL);
      expect(APP_NAME.length).assertEqual(7);
      expect(version.length).assertEqual(3);
      expect(version.indexOf('.')).assertEqual(1);
      logEnd('testConfigNamesAreIndependent0015');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_MODULES_testFeatureLabels0016
     * @tc.name      testFeatureLabels0016
     * @tc.desc      Verify each feature module returns its own stable label
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testFeatureLabels0016', 0, () => {
      logBegin('testFeatureLabels0016');
      expect(getFeatureLabel()).assertEqual('feature');
      expect(getProfileLabel()).assertEqual('profile');
      expect(getSettingsLabel()).assertEqual('settings');
      logEnd('testFeatureLabels0016');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_MODULES_testFeatureLabelsAreDistinct0017
     * @tc.name      testFeatureLabelsAreDistinct0017
     * @tc.desc      Verify the three feature labels are pairwise different and stable across calls
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testFeatureLabelsAreDistinct0017', 0, () => {
      logBegin('testFeatureLabelsAreDistinct0017');
      const labels: string[] = [getFeatureLabel(), getProfileLabel(), getSettingsLabel()];
      expect(labels[0] === labels[1]).assertFalse();
      expect(labels[1] === labels[2]).assertFalse();
      expect(labels[0] === labels[2]).assertFalse();
      expect(getFeatureLabel()).assertEqual(getFeatureLabel());
      expect(labels.join(',')).assertEqual('feature,profile,settings');
      logEnd('testFeatureLabelsAreDistinct0017');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_MODULES_testReportBuilderReturnsTitle0018
     * @tc.name      testReportBuilderReturnsTitle0018
     * @tc.desc      Verify the default-exported ReportBuilder returns the option title
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testReportBuilderReturnsTitle0018', 0, () => {
      logBegin('testReportBuilderReturnsTitle0018');
      const builder: ReportBuilder = new ReportBuilder();
      const options: ReportOptions = { title: 'Quarterly' };
      expect(builder.build(options)).assertEqual('Quarterly');
      expect(builder.build(options).length).assertEqual(9);
      logEnd('testReportBuilderReturnsTitle0018');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_MODULES_testReportBuilderEmptyTitle0019
     * @tc.name      testReportBuilderEmptyTitle0019
     * @tc.desc      Verify ReportBuilder passes an empty title through unchanged
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testReportBuilderEmptyTitle0019', 0, () => {
      logBegin('testReportBuilderEmptyTitle0019');
      const builder: ReportBuilder = new ReportBuilder();
      expect(builder.build({ title: '' })).assertEqual('');
      expect(builder.build({ title: '' }).length).assertEqual(0);
      logEnd('testReportBuilderEmptyTitle0019');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_MODULES_testLoggerDoesNotThrow0020
     * @tc.name      testLoggerDoesNotThrow0020
     * @tc.desc      Verify the default-exported Logger accepts messages of any length without throwing
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testLoggerDoesNotThrow0020', 0, () => {
      logBegin('testLoggerDoesNotThrow0020');
      const logger: Logger = new Logger();
      let thrown: boolean = false;
      try {
        logger.info('hello');
        logger.info('');
        logger.info('a'.repeat(1024));
      } catch (err) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      expect(logger instanceof Logger).assertTrue();
      logEnd('testLoggerDoesNotThrow0020');
    });

  });
}
