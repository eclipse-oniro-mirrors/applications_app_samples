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
import { TestLog } from '../harness/TestLog';
import { SemverUtils } from '../harness/SemverUtils';
export default function SemverUtilsValidationTest(): void {
  describe('SemverUtilsValidationTest', () => {
    // Yield a macrotask to keep large suites responsive to the main-thread watchdog.
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3800
     * @tc.name      testSemverValidSample
     * @tc.desc      Checks that the sample version is valid.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverValidSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverValidSample', 'case begin', 'validsample semver check');
      TestLog.step('testSemverValidSample', 'validsample semver check');
      const actual: boolean = SemverUtils.isValid('1.0.0');
      TestLog.text('testSemverValidSample', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSemverValidSample', 'case end', 'validsample semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3801
     * @tc.name      testSemverValidZero
     * @tc.desc      Checks that a zero version is valid.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverValidZero',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverValidZero', 'case begin', 'validzero semver check');
      TestLog.step('testSemverValidZero', 'validzero semver check');
      const actual: boolean = SemverUtils.isValid('0.0.0');
      TestLog.text('testSemverValidZero', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSemverValidZero', 'case end', 'validzero semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3802
     * @tc.name      testSemverValidLarge
     * @tc.desc      Checks that a large patch version is valid.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverValidLarge',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverValidLarge', 'case begin', 'validlarge semver check');
      TestLog.step('testSemverValidLarge', 'validlarge semver check');
      const actual: boolean = SemverUtils.isValid('12.34.5678');
      TestLog.text('testSemverValidLarge', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSemverValidLarge', 'case end', 'validlarge semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3803
     * @tc.name      testSemverInvalidEmpty
     * @tc.desc      Checks that an empty version is invalid.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverInvalidEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverInvalidEmpty', 'case begin', 'invalidempty semver check');
      TestLog.step('testSemverInvalidEmpty', 'invalidempty semver check');
      const actual: boolean = SemverUtils.isValid('');
      TestLog.text('testSemverInvalidEmpty', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testSemverInvalidEmpty', 'case end', 'invalidempty semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3804
     * @tc.name      testSemverInvalidTwoSegments
     * @tc.desc      Checks that a two segment version is invalid.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverInvalidTwoSegments',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverInvalidTwoSegments', 'case begin', 'invalidtwosegments semver check');
      TestLog.step('testSemverInvalidTwoSegments', 'invalidtwosegments semver check');
      const actual: boolean = SemverUtils.isValid('1.0');
      TestLog.text('testSemverInvalidTwoSegments', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testSemverInvalidTwoSegments', 'case end', 'invalidtwosegments semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3805
     * @tc.name      testSemverInvalidOneSegment
     * @tc.desc      Checks that a one segment version is invalid.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverInvalidOneSegment',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverInvalidOneSegment', 'case begin', 'invalidonesegment semver check');
      TestLog.step('testSemverInvalidOneSegment', 'invalidonesegment semver check');
      const actual: boolean = SemverUtils.isValid('1');
      TestLog.text('testSemverInvalidOneSegment', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testSemverInvalidOneSegment', 'case end', 'invalidonesegment semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3806
     * @tc.name      testSemverInvalidFourSegments
     * @tc.desc      Checks that a four segment version is invalid.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverInvalidFourSegments',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverInvalidFourSegments', 'case begin', 'invalidfoursegments semver check');
      TestLog.step('testSemverInvalidFourSegments', 'invalidfoursegments semver check');
      const actual: boolean = SemverUtils.isValid('1.0.0.0');
      TestLog.text('testSemverInvalidFourSegments', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testSemverInvalidFourSegments', 'case end', 'invalidfoursegments semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3807
     * @tc.name      testSemverInvalidLeadingZero
     * @tc.desc      Checks that a version with a leading zero is invalid.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverInvalidLeadingZero',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverInvalidLeadingZero', 'case begin', 'invalidleadingzero semver check');
      TestLog.step('testSemverInvalidLeadingZero', 'invalidleadingzero semver check');
      const actual: boolean = SemverUtils.isValid('01.0.0');
      TestLog.text('testSemverInvalidLeadingZero', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testSemverInvalidLeadingZero', 'case end', 'invalidleadingzero semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3808
     * @tc.name      testSemverInvalidPrerelease
     * @tc.desc      Checks that a version with a prerelease suffix is invalid.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverInvalidPrerelease',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverInvalidPrerelease', 'case begin', 'invalidprerelease semver check');
      TestLog.step('testSemverInvalidPrerelease', 'invalidprerelease semver check');
      const actual: boolean = SemverUtils.isValid('1.0.0-beta');
      TestLog.text('testSemverInvalidPrerelease', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testSemverInvalidPrerelease', 'case end', 'invalidprerelease semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3809
     * @tc.name      testSemverInvalidPrefix
     * @tc.desc      Checks that a version with a prefix is invalid.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverInvalidPrefix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverInvalidPrefix', 'case begin', 'invalidprefix semver check');
      TestLog.step('testSemverInvalidPrefix', 'invalidprefix semver check');
      const actual: boolean = SemverUtils.isValid('v1.0.0');
      TestLog.text('testSemverInvalidPrefix', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testSemverInvalidPrefix', 'case end', 'invalidprefix semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3810
     * @tc.name      testSemverInvalidNegative
     * @tc.desc      Checks that a negative segment is invalid.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverInvalidNegative',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverInvalidNegative', 'case begin', 'invalidnegative semver check');
      TestLog.step('testSemverInvalidNegative', 'invalidnegative semver check');
      const actual: boolean = SemverUtils.isValid('1.-1.0');
      TestLog.text('testSemverInvalidNegative', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testSemverInvalidNegative', 'case end', 'invalidnegative semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3811
     * @tc.name      testSemverInvalidSpace
     * @tc.desc      Checks that a version with a space is invalid.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverInvalidSpace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverInvalidSpace', 'case begin', 'invalidspace semver check');
      TestLog.step('testSemverInvalidSpace', 'invalidspace semver check');
      const actual: boolean = SemverUtils.isValid('1.0. 0');
      TestLog.text('testSemverInvalidSpace', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testSemverInvalidSpace', 'case end', 'invalidspace semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3812
     * @tc.name      testSemverCompareGreaterMajor
     * @tc.desc      Checks that a higher major version compares greater.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverCompareGreaterMajor',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverCompareGreaterMajor', 'case begin', 'comparegreatermajor semver check');
      TestLog.step('testSemverCompareGreaterMajor', 'comparegreatermajor semver check');
      const actual: number = SemverUtils.compare('2.0.0', '1.9.9');
      TestLog.text('testSemverCompareGreaterMajor', 'actual value', String(actual));
      expect(actual).assertEqual(1);
      TestLog.text('testSemverCompareGreaterMajor', 'case end', 'comparegreatermajor semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3813
     * @tc.name      testSemverCompareLessMinor
     * @tc.desc      Checks that a lower minor version compares smaller.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverCompareLessMinor',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverCompareLessMinor', 'case begin', 'comparelessminor semver check');
      TestLog.step('testSemverCompareLessMinor', 'comparelessminor semver check');
      const actual: number = SemverUtils.compare('1.1.9', '1.2.0');
      TestLog.text('testSemverCompareLessMinor', 'actual value', String(actual));
      expect(actual).assertEqual(-1);
      TestLog.text('testSemverCompareLessMinor', 'case end', 'comparelessminor semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3814
     * @tc.name      testSemverCompareGreaterPatch
     * @tc.desc      Checks that a higher patch version compares greater.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverCompareGreaterPatch',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverCompareGreaterPatch', 'case begin', 'comparegreaterpatch semver check');
      TestLog.step('testSemverCompareGreaterPatch', 'comparegreaterpatch semver check');
      const actual: number = SemverUtils.compare('1.0.2', '1.0.1');
      TestLog.text('testSemverCompareGreaterPatch', 'actual value', String(actual));
      expect(actual).assertEqual(1);
      TestLog.text('testSemverCompareGreaterPatch', 'case end', 'comparegreaterpatch semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3815
     * @tc.name      testSemverCompareEqual
     * @tc.desc      Checks that identical versions compare equal.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverCompareEqual',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverCompareEqual', 'case begin', 'compareequal semver check');
      TestLog.step('testSemverCompareEqual', 'compareequal semver check');
      const actual: number = SemverUtils.compare('1.0.0', '1.0.0');
      TestLog.text('testSemverCompareEqual', 'actual value', String(actual));
      expect(actual).assertEqual(0);
      TestLog.text('testSemverCompareEqual', 'case end', 'compareequal semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3816
     * @tc.name      testSemverCompareInvalidLeft
     * @tc.desc      Checks that an invalid left version compares equal.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverCompareInvalidLeft',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverCompareInvalidLeft', 'case begin', 'compareinvalidleft semver check');
      TestLog.step('testSemverCompareInvalidLeft', 'compareinvalidleft semver check');
      const actual: number = SemverUtils.compare('bad', '1.0.0');
      TestLog.text('testSemverCompareInvalidLeft', 'actual value', String(actual));
      expect(actual).assertEqual(0);
      TestLog.text('testSemverCompareInvalidLeft', 'case end', 'compareinvalidleft semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3817
     * @tc.name      testSemverCompareInvalidRight
     * @tc.desc      Checks that an invalid right version compares equal.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverCompareInvalidRight',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverCompareInvalidRight', 'case begin', 'compareinvalidright semver check');
      TestLog.step('testSemverCompareInvalidRight', 'compareinvalidright semver check');
      const actual: number = SemverUtils.compare('1.0.0', 'bad');
      TestLog.text('testSemverCompareInvalidRight', 'actual value', String(actual));
      expect(actual).assertEqual(0);
      TestLog.text('testSemverCompareInvalidRight', 'case end', 'compareinvalidright semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3818
     * @tc.name      testSemverGreaterThanYes
     * @tc.desc      Checks that a higher version is greater.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverGreaterThanYes',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverGreaterThanYes', 'case begin', 'greaterthanyes semver check');
      TestLog.step('testSemverGreaterThanYes', 'greaterthanyes semver check');
      const actual: boolean = SemverUtils.greaterThan('1.1.0', '1.0.9');
      TestLog.text('testSemverGreaterThanYes', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSemverGreaterThanYes', 'case end', 'greaterthanyes semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3819
     * @tc.name      testSemverGreaterThanNo
     * @tc.desc      Checks that a lower version is not greater.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverGreaterThanNo',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverGreaterThanNo', 'case begin', 'greaterthanno semver check');
      TestLog.step('testSemverGreaterThanNo', 'greaterthanno semver check');
      const actual: boolean = SemverUtils.greaterThan('1.0.9', '1.1.0');
      TestLog.text('testSemverGreaterThanNo', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testSemverGreaterThanNo', 'case end', 'greaterthanno semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3820
     * @tc.name      testSemverLessThanYes
     * @tc.desc      Checks that a lower version is smaller.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverLessThanYes',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverLessThanYes', 'case begin', 'lessthanyes semver check');
      TestLog.step('testSemverLessThanYes', 'lessthanyes semver check');
      const actual: boolean = SemverUtils.lessThan('1.0.9', '1.1.0');
      TestLog.text('testSemverLessThanYes', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSemverLessThanYes', 'case end', 'lessthanyes semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3821
     * @tc.name      testSemverLessThanNo
     * @tc.desc      Checks that an equal version is not smaller.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverLessThanNo',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverLessThanNo', 'case begin', 'lessthanno semver check');
      TestLog.step('testSemverLessThanNo', 'lessthanno semver check');
      const actual: boolean = SemverUtils.lessThan('1.1.0', '1.1.0');
      TestLog.text('testSemverLessThanNo', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testSemverLessThanNo', 'case end', 'lessthanno semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3822
     * @tc.name      testSemverEqualYes
     * @tc.desc      Checks that identical versions are equal.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverEqualYes',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverEqualYes', 'case begin', 'equalyes semver check');
      TestLog.step('testSemverEqualYes', 'equalyes semver check');
      const actual: boolean = SemverUtils.equal('1.0.0', '1.0.0');
      TestLog.text('testSemverEqualYes', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSemverEqualYes', 'case end', 'equalyes semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3823
     * @tc.name      testSemverCompatibleYes
     * @tc.desc      Checks that major one is compatible with target one.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverCompatibleYes',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverCompatibleYes', 'case begin', 'compatibleyes semver check');
      TestLog.step('testSemverCompatibleYes', 'compatibleyes semver check');
      const actual: boolean = SemverUtils.isCompatible('1.0.0', 1);
      TestLog.text('testSemverCompatibleYes', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSemverCompatibleYes', 'case end', 'compatibleyes semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3824
     * @tc.name      testSemverCompatibleHigher
     * @tc.desc      Checks that major two is compatible with target one.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverCompatibleHigher',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverCompatibleHigher', 'case begin', 'compatiblehigher semver check');
      TestLog.step('testSemverCompatibleHigher', 'compatiblehigher semver check');
      const actual: boolean = SemverUtils.isCompatible('2.0.0', 1);
      TestLog.text('testSemverCompatibleHigher', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSemverCompatibleHigher', 'case end', 'compatiblehigher semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3825
     * @tc.name      testSemverCompatibleNo
     * @tc.desc      Checks that major zero is not compatible with target one.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverCompatibleNo',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverCompatibleNo', 'case begin', 'compatibleno semver check');
      TestLog.step('testSemverCompatibleNo', 'compatibleno semver check');
      const actual: boolean = SemverUtils.isCompatible('0.9.0', 1);
      TestLog.text('testSemverCompatibleNo', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testSemverCompatibleNo', 'case end', 'compatibleno semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3826
     * @tc.name      testSemverCompatibleInvalid
     * @tc.desc      Checks that an invalid version is not compatible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverCompatibleInvalid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverCompatibleInvalid', 'case begin', 'compatibleinvalid semver check');
      TestLog.step('testSemverCompatibleInvalid', 'compatibleinvalid semver check');
      const actual: boolean = SemverUtils.isCompatible('bad', 1);
      TestLog.text('testSemverCompatibleInvalid', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testSemverCompatibleInvalid', 'case end', 'compatibleinvalid semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3827
     * @tc.name      testSemverMajorZeroYes
     * @tc.desc      Checks that a zero major version is detected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverMajorZeroYes',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverMajorZeroYes', 'case begin', 'majorzeroyes semver check');
      TestLog.step('testSemverMajorZeroYes', 'majorzeroyes semver check');
      const actual: boolean = SemverUtils.isMajorZero('0.1.0');
      TestLog.text('testSemverMajorZeroYes', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSemverMajorZeroYes', 'case end', 'majorzeroyes semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3828
     * @tc.name      testSemverMajorZeroNo
     * @tc.desc      Checks that a one major version is not zero.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverMajorZeroNo',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverMajorZeroNo', 'case begin', 'majorzerono semver check');
      TestLog.step('testSemverMajorZeroNo', 'majorzerono semver check');
      const actual: boolean = SemverUtils.isMajorZero('1.0.0');
      TestLog.text('testSemverMajorZeroNo', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testSemverMajorZeroNo', 'case end', 'majorzerono semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3829
     * @tc.name      testSemverIncreaseMajor
     * @tc.desc      Checks that the major version is increased.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverIncreaseMajor',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverIncreaseMajor', 'case begin', 'increasemajor semver check');
      TestLog.step('testSemverIncreaseMajor', 'increasemajor semver check');
      const actual: string = SemverUtils.increaseMajor('1.2.3');
      TestLog.text('testSemverIncreaseMajor', 'actual value', String(actual));
      expect(actual).assertEqual('2.0.0');
      TestLog.text('testSemverIncreaseMajor', 'case end', 'increasemajor semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3830
     * @tc.name      testSemverIncreaseMajorInvalid
     * @tc.desc      Checks that an invalid version cannot increase its major.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverIncreaseMajorInvalid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverIncreaseMajorInvalid', 'case begin', 'increasemajorinvalid semver check');
      TestLog.step('testSemverIncreaseMajorInvalid', 'increasemajorinvalid semver check');
      const actual: string = SemverUtils.increaseMajor('bad');
      TestLog.text('testSemverIncreaseMajorInvalid', 'actual value', String(actual));
      expect(actual).assertEqual('');
      TestLog.text('testSemverIncreaseMajorInvalid', 'case end', 'increasemajorinvalid semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3831
     * @tc.name      testSemverIncreaseMinor
     * @tc.desc      Checks that the minor version is increased.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverIncreaseMinor',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverIncreaseMinor', 'case begin', 'increaseminor semver check');
      TestLog.step('testSemverIncreaseMinor', 'increaseminor semver check');
      const actual: string = SemverUtils.increaseMinor('1.2.3');
      TestLog.text('testSemverIncreaseMinor', 'actual value', String(actual));
      expect(actual).assertEqual('1.3.0');
      TestLog.text('testSemverIncreaseMinor', 'case end', 'increaseminor semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3832
     * @tc.name      testSemverIncreaseMinorInvalid
     * @tc.desc      Checks that an invalid version cannot increase its minor.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverIncreaseMinorInvalid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverIncreaseMinorInvalid', 'case begin', 'increaseminorinvalid semver check');
      TestLog.step('testSemverIncreaseMinorInvalid', 'increaseminorinvalid semver check');
      const actual: string = SemverUtils.increaseMinor('bad');
      TestLog.text('testSemverIncreaseMinorInvalid', 'actual value', String(actual));
      expect(actual).assertEqual('');
      TestLog.text('testSemverIncreaseMinorInvalid', 'case end', 'increaseminorinvalid semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3833
     * @tc.name      testSemverIncreasePatch
     * @tc.desc      Checks that the patch version is increased.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverIncreasePatch',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverIncreasePatch', 'case begin', 'increasepatch semver check');
      TestLog.step('testSemverIncreasePatch', 'increasepatch semver check');
      const actual: string = SemverUtils.increasePatch('1.2.3');
      TestLog.text('testSemverIncreasePatch', 'actual value', String(actual));
      expect(actual).assertEqual('1.2.4');
      TestLog.text('testSemverIncreasePatch', 'case end', 'increasepatch semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3834
     * @tc.name      testSemverIncreasePatchInvalid
     * @tc.desc      Checks that an invalid version cannot increase its patch.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverIncreasePatchInvalid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverIncreasePatchInvalid', 'case begin', 'increasepatchinvalid semver check');
      TestLog.step('testSemverIncreasePatchInvalid', 'increasepatchinvalid semver check');
      const actual: string = SemverUtils.increasePatch('bad');
      TestLog.text('testSemverIncreasePatchInvalid', 'actual value', String(actual));
      expect(actual).assertEqual('');
      TestLog.text('testSemverIncreasePatchInvalid', 'case end', 'increasepatchinvalid semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3835
     * @tc.name      testSemverFormat
     * @tc.desc      Checks that a parsed version is formatted.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverFormat',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverFormat', 'case begin', 'format semver check');
      TestLog.step('testSemverFormat', 'format semver check');
      const actual: string = SemverUtils.format({ major: 1, minor: 2, patch: 3 });
      TestLog.text('testSemverFormat', 'actual value', String(actual));
      expect(actual).assertEqual('1.2.3');
      TestLog.text('testSemverFormat', 'case end', 'format semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3836
     * @tc.name      testSemverLeadingZeroYes
     * @tc.desc      Checks that a leading zero segment is detected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverLeadingZeroYes',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverLeadingZeroYes', 'case begin', 'leadingzeroyes semver check');
      TestLog.step('testSemverLeadingZeroYes', 'leadingzeroyes semver check');
      const actual: boolean = SemverUtils.hasLeadingZero('01.0.0');
      TestLog.text('testSemverLeadingZeroYes', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSemverLeadingZeroYes', 'case end', 'leadingzeroyes semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3837
     * @tc.name      testSemverLeadingZeroMiddle
     * @tc.desc      Checks that a middle leading zero segment is detected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverLeadingZeroMiddle',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverLeadingZeroMiddle', 'case begin', 'leadingzeromiddle semver check');
      TestLog.step('testSemverLeadingZeroMiddle', 'leadingzeromiddle semver check');
      const actual: boolean = SemverUtils.hasLeadingZero('1.01.0');
      TestLog.text('testSemverLeadingZeroMiddle', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSemverLeadingZeroMiddle', 'case end', 'leadingzeromiddle semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3838
     * @tc.name      testSemverLeadingZeroNo
     * @tc.desc      Checks that a plain version has no leading zero.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverLeadingZeroNo',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverLeadingZeroNo', 'case begin', 'leadingzerono semver check');
      TestLog.step('testSemverLeadingZeroNo', 'leadingzerono semver check');
      const actual: boolean = SemverUtils.hasLeadingZero('1.0.0');
      TestLog.text('testSemverLeadingZeroNo', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testSemverLeadingZeroNo', 'case end', 'leadingzerono semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3839
     * @tc.name      testSemverSegmentValueMajor
     * @tc.desc      Checks that the major segment value is returned.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverSegmentValueMajor',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverSegmentValueMajor', 'case begin', 'segmentvaluemajor semver check');
      TestLog.step('testSemverSegmentValueMajor', 'segmentvaluemajor semver check');
      const actual: number = SemverUtils.segmentValue('1.2.3', 0);
      TestLog.text('testSemverSegmentValueMajor', 'actual value', String(actual));
      expect(actual).assertEqual(1);
      TestLog.text('testSemverSegmentValueMajor', 'case end', 'segmentvaluemajor semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3840
     * @tc.name      testSemverSegmentValueMinor
     * @tc.desc      Checks that the minor segment value is returned.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverSegmentValueMinor',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverSegmentValueMinor', 'case begin', 'segmentvalueminor semver check');
      TestLog.step('testSemverSegmentValueMinor', 'segmentvalueminor semver check');
      const actual: number = SemverUtils.segmentValue('1.2.3', 1);
      TestLog.text('testSemverSegmentValueMinor', 'actual value', String(actual));
      expect(actual).assertEqual(2);
      TestLog.text('testSemverSegmentValueMinor', 'case end', 'segmentvalueminor semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3841
     * @tc.name      testSemverSegmentValuePatch
     * @tc.desc      Checks that the patch segment value is returned.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverSegmentValuePatch',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverSegmentValuePatch', 'case begin', 'segmentvaluepatch semver check');
      TestLog.step('testSemverSegmentValuePatch', 'segmentvaluepatch semver check');
      const actual: number = SemverUtils.segmentValue('1.2.3', 2);
      TestLog.text('testSemverSegmentValuePatch', 'actual value', String(actual));
      expect(actual).assertEqual(3);
      TestLog.text('testSemverSegmentValuePatch', 'case end', 'segmentvaluepatch semver check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3842
     * @tc.name      testSemverSegmentValueInvalid
     * @tc.desc      Checks that an invalid version has no segment value.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSemverSegmentValueInvalid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSemverSegmentValueInvalid', 'case begin', 'segmentvalueinvalid semver check');
      TestLog.step('testSemverSegmentValueInvalid', 'segmentvalueinvalid semver check');
      const actual: number = SemverUtils.segmentValue('bad', 0);
      TestLog.text('testSemverSegmentValueInvalid', 'actual value', String(actual));
      expect(actual).assertEqual(-1);
      TestLog.text('testSemverSegmentValueInvalid', 'case end', 'segmentvalueinvalid semver check');
    })

  })
}
