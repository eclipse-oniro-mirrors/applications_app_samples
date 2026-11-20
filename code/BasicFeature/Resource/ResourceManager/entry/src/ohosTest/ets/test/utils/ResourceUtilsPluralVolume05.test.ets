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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ResourceUtils } from '../../../../main/ets/utils/ResourceUtils';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ResourceManager]';

export default function resourceUtilsPluralTest() {
  describe('ResourceUtilsPluralTest', () => {

    /**
     * @tc.name   testResourceUtilsPlural0001
     * @tc.number SUB_RESMGR_UTILS_05_0001
     * @tc.desc   pluralBranchOf(-100) selects invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0001 begin');
      const result: string = ResourceUtils.pluralBranchOf(-100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('invalid'));
      expect(result).assertEqual('invalid');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(-100) === false));
      expect(ResourceUtils.isValidPluralNum(-100) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0001 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0002
     * @tc.number SUB_RESMGR_UTILS_05_0002
     * @tc.desc   pluralBranchOf(-2) selects invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0002 begin');
      const result: string = ResourceUtils.pluralBranchOf(-2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('invalid'));
      expect(result).assertEqual('invalid');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(-2) === false));
      expect(ResourceUtils.isValidPluralNum(-2) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0002 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0003
     * @tc.number SUB_RESMGR_UTILS_05_0003
     * @tc.desc   pluralBranchOf(-1) selects invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0003 begin');
      const result: string = ResourceUtils.pluralBranchOf(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('invalid'));
      expect(result).assertEqual('invalid');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(-1) === false));
      expect(ResourceUtils.isValidPluralNum(-1) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0003 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0004
     * @tc.number SUB_RESMGR_UTILS_05_0004
     * @tc.desc   pluralBranchOf(0.5) selects invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0004 begin');
      const result: string = ResourceUtils.pluralBranchOf(0.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('invalid'));
      expect(result).assertEqual('invalid');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(0.5) === false));
      expect(ResourceUtils.isValidPluralNum(0.5) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0004 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0005
     * @tc.number SUB_RESMGR_UTILS_05_0005
     * @tc.desc   pluralBranchOf(1.5) selects invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0005 begin');
      const result: string = ResourceUtils.pluralBranchOf(1.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('invalid'));
      expect(result).assertEqual('invalid');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1.5) === false));
      expect(ResourceUtils.isValidPluralNum(1.5) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0005 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0006
     * @tc.number SUB_RESMGR_UTILS_05_0006
     * @tc.desc   pluralBranchOf(2.5) selects invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0006 begin');
      const result: string = ResourceUtils.pluralBranchOf(2.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('invalid'));
      expect(result).assertEqual('invalid');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(2.5) === false));
      expect(ResourceUtils.isValidPluralNum(2.5) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0006 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0007
     * @tc.number SUB_RESMGR_UTILS_05_0007
     * @tc.desc   pluralBranchOf(3.7) selects invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0007 begin');
      const result: string = ResourceUtils.pluralBranchOf(3.7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('invalid'));
      expect(result).assertEqual('invalid');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(3.7) === false));
      expect(ResourceUtils.isValidPluralNum(3.7) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0007 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0008
     * @tc.number SUB_RESMGR_UTILS_05_0008
     * @tc.desc   pluralBranchOf(100.25) selects invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0008 begin');
      const result: string = ResourceUtils.pluralBranchOf(100.25);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('invalid'));
      expect(result).assertEqual('invalid');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(100.25) === false));
      expect(ResourceUtils.isValidPluralNum(100.25) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0008 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0009
     * @tc.number SUB_RESMGR_UTILS_05_0009
     * @tc.desc   pluralBranchOf(0) selects zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0009 begin');
      const result: string = ResourceUtils.pluralBranchOf(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('zero'));
      expect(result).assertEqual('zero');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(0) === true));
      expect(ResourceUtils.isValidPluralNum(0) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0009 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0010
     * @tc.number SUB_RESMGR_UTILS_05_0010
     * @tc.desc   pluralBranchOf(1) selects one
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0010 begin');
      const result: string = ResourceUtils.pluralBranchOf(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('one'));
      expect(result).assertEqual('one');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1) === true));
      expect(ResourceUtils.isValidPluralNum(1) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0010 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0011
     * @tc.number SUB_RESMGR_UTILS_05_0011
     * @tc.desc   pluralBranchOf(2) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0011 begin');
      const result: string = ResourceUtils.pluralBranchOf(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(2) === true));
      expect(ResourceUtils.isValidPluralNum(2) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0011 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0012
     * @tc.number SUB_RESMGR_UTILS_05_0012
     * @tc.desc   pluralBranchOf(3) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0012 begin');
      const result: string = ResourceUtils.pluralBranchOf(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(3) === true));
      expect(ResourceUtils.isValidPluralNum(3) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0012 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0013
     * @tc.number SUB_RESMGR_UTILS_05_0013
     * @tc.desc   pluralBranchOf(4) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0013 begin');
      const result: string = ResourceUtils.pluralBranchOf(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(4) === true));
      expect(ResourceUtils.isValidPluralNum(4) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0013 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0014
     * @tc.number SUB_RESMGR_UTILS_05_0014
     * @tc.desc   pluralBranchOf(5) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0014 begin');
      const result: string = ResourceUtils.pluralBranchOf(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(5) === true));
      expect(ResourceUtils.isValidPluralNum(5) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0014 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0015
     * @tc.number SUB_RESMGR_UTILS_05_0015
     * @tc.desc   pluralBranchOf(6) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0015 begin');
      const result: string = ResourceUtils.pluralBranchOf(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(6) === true));
      expect(ResourceUtils.isValidPluralNum(6) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0015 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0016
     * @tc.number SUB_RESMGR_UTILS_05_0016
     * @tc.desc   pluralBranchOf(7) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0016 begin');
      const result: string = ResourceUtils.pluralBranchOf(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(7) === true));
      expect(ResourceUtils.isValidPluralNum(7) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0016 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0017
     * @tc.number SUB_RESMGR_UTILS_05_0017
     * @tc.desc   pluralBranchOf(8) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0017 begin');
      const result: string = ResourceUtils.pluralBranchOf(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(8) === true));
      expect(ResourceUtils.isValidPluralNum(8) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0017 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0018
     * @tc.number SUB_RESMGR_UTILS_05_0018
     * @tc.desc   pluralBranchOf(9) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0018 begin');
      const result: string = ResourceUtils.pluralBranchOf(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(9) === true));
      expect(ResourceUtils.isValidPluralNum(9) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0018 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0019
     * @tc.number SUB_RESMGR_UTILS_05_0019
     * @tc.desc   pluralBranchOf(10) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0019 begin');
      const result: string = ResourceUtils.pluralBranchOf(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(10) === true));
      expect(ResourceUtils.isValidPluralNum(10) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0019 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0020
     * @tc.number SUB_RESMGR_UTILS_05_0020
     * @tc.desc   pluralBranchOf(11) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0020 begin');
      const result: string = ResourceUtils.pluralBranchOf(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(11) === true));
      expect(ResourceUtils.isValidPluralNum(11) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0020 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0021
     * @tc.number SUB_RESMGR_UTILS_05_0021
     * @tc.desc   pluralBranchOf(12) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0021 begin');
      const result: string = ResourceUtils.pluralBranchOf(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(12) === true));
      expect(ResourceUtils.isValidPluralNum(12) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0021 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0022
     * @tc.number SUB_RESMGR_UTILS_05_0022
     * @tc.desc   pluralBranchOf(13) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0022 begin');
      const result: string = ResourceUtils.pluralBranchOf(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(13) === true));
      expect(ResourceUtils.isValidPluralNum(13) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0022 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0023
     * @tc.number SUB_RESMGR_UTILS_05_0023
     * @tc.desc   pluralBranchOf(14) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0023 begin');
      const result: string = ResourceUtils.pluralBranchOf(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(14) === true));
      expect(ResourceUtils.isValidPluralNum(14) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0023 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0024
     * @tc.number SUB_RESMGR_UTILS_05_0024
     * @tc.desc   pluralBranchOf(15) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0024 begin');
      const result: string = ResourceUtils.pluralBranchOf(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(15) === true));
      expect(ResourceUtils.isValidPluralNum(15) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0024 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0025
     * @tc.number SUB_RESMGR_UTILS_05_0025
     * @tc.desc   pluralBranchOf(16) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0025 begin');
      const result: string = ResourceUtils.pluralBranchOf(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(16) === true));
      expect(ResourceUtils.isValidPluralNum(16) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0025 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0026
     * @tc.number SUB_RESMGR_UTILS_05_0026
     * @tc.desc   pluralBranchOf(17) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0026 begin');
      const result: string = ResourceUtils.pluralBranchOf(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(17) === true));
      expect(ResourceUtils.isValidPluralNum(17) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0026 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0027
     * @tc.number SUB_RESMGR_UTILS_05_0027
     * @tc.desc   pluralBranchOf(18) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0027 begin');
      const result: string = ResourceUtils.pluralBranchOf(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(18) === true));
      expect(ResourceUtils.isValidPluralNum(18) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0027 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0028
     * @tc.number SUB_RESMGR_UTILS_05_0028
     * @tc.desc   pluralBranchOf(19) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0028 begin');
      const result: string = ResourceUtils.pluralBranchOf(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(19) === true));
      expect(ResourceUtils.isValidPluralNum(19) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0028 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0029
     * @tc.number SUB_RESMGR_UTILS_05_0029
     * @tc.desc   pluralBranchOf(20) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0029 begin');
      const result: string = ResourceUtils.pluralBranchOf(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(20) === true));
      expect(ResourceUtils.isValidPluralNum(20) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0029 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0030
     * @tc.number SUB_RESMGR_UTILS_05_0030
     * @tc.desc   pluralBranchOf(21) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0030 begin');
      const result: string = ResourceUtils.pluralBranchOf(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(21) === true));
      expect(ResourceUtils.isValidPluralNum(21) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0030 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0031
     * @tc.number SUB_RESMGR_UTILS_05_0031
     * @tc.desc   pluralBranchOf(22) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0031 begin');
      const result: string = ResourceUtils.pluralBranchOf(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(22) === true));
      expect(ResourceUtils.isValidPluralNum(22) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0031 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0032
     * @tc.number SUB_RESMGR_UTILS_05_0032
     * @tc.desc   pluralBranchOf(23) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0032 begin');
      const result: string = ResourceUtils.pluralBranchOf(23);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(23) === true));
      expect(ResourceUtils.isValidPluralNum(23) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0032 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0033
     * @tc.number SUB_RESMGR_UTILS_05_0033
     * @tc.desc   pluralBranchOf(24) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0033 begin');
      const result: string = ResourceUtils.pluralBranchOf(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(24) === true));
      expect(ResourceUtils.isValidPluralNum(24) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0033 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0034
     * @tc.number SUB_RESMGR_UTILS_05_0034
     * @tc.desc   pluralBranchOf(25) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0034 begin');
      const result: string = ResourceUtils.pluralBranchOf(25);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(25) === true));
      expect(ResourceUtils.isValidPluralNum(25) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0034 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0035
     * @tc.number SUB_RESMGR_UTILS_05_0035
     * @tc.desc   pluralBranchOf(26) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0035 begin');
      const result: string = ResourceUtils.pluralBranchOf(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(26) === true));
      expect(ResourceUtils.isValidPluralNum(26) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0035 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0036
     * @tc.number SUB_RESMGR_UTILS_05_0036
     * @tc.desc   pluralBranchOf(27) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0036 begin');
      const result: string = ResourceUtils.pluralBranchOf(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(27) === true));
      expect(ResourceUtils.isValidPluralNum(27) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0036 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0037
     * @tc.number SUB_RESMGR_UTILS_05_0037
     * @tc.desc   pluralBranchOf(28) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0037 begin');
      const result: string = ResourceUtils.pluralBranchOf(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(28) === true));
      expect(ResourceUtils.isValidPluralNum(28) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0037 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0038
     * @tc.number SUB_RESMGR_UTILS_05_0038
     * @tc.desc   pluralBranchOf(29) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0038 begin');
      const result: string = ResourceUtils.pluralBranchOf(29);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(29) === true));
      expect(ResourceUtils.isValidPluralNum(29) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0038 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0039
     * @tc.number SUB_RESMGR_UTILS_05_0039
     * @tc.desc   pluralBranchOf(30) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0039 begin');
      const result: string = ResourceUtils.pluralBranchOf(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(30) === true));
      expect(ResourceUtils.isValidPluralNum(30) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0039 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0040
     * @tc.number SUB_RESMGR_UTILS_05_0040
     * @tc.desc   pluralBranchOf(31) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0040 begin');
      const result: string = ResourceUtils.pluralBranchOf(31);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(31) === true));
      expect(ResourceUtils.isValidPluralNum(31) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0040 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0041
     * @tc.number SUB_RESMGR_UTILS_05_0041
     * @tc.desc   pluralBranchOf(32) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0041 begin');
      const result: string = ResourceUtils.pluralBranchOf(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(32) === true));
      expect(ResourceUtils.isValidPluralNum(32) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0041 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0042
     * @tc.number SUB_RESMGR_UTILS_05_0042
     * @tc.desc   pluralBranchOf(33) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0042 begin');
      const result: string = ResourceUtils.pluralBranchOf(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(33) === true));
      expect(ResourceUtils.isValidPluralNum(33) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0042 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0043
     * @tc.number SUB_RESMGR_UTILS_05_0043
     * @tc.desc   pluralBranchOf(34) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0043 begin');
      const result: string = ResourceUtils.pluralBranchOf(34);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(34) === true));
      expect(ResourceUtils.isValidPluralNum(34) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0043 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0044
     * @tc.number SUB_RESMGR_UTILS_05_0044
     * @tc.desc   pluralBranchOf(35) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0044 begin');
      const result: string = ResourceUtils.pluralBranchOf(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(35) === true));
      expect(ResourceUtils.isValidPluralNum(35) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0044 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0045
     * @tc.number SUB_RESMGR_UTILS_05_0045
     * @tc.desc   pluralBranchOf(36) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0045 begin');
      const result: string = ResourceUtils.pluralBranchOf(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(36) === true));
      expect(ResourceUtils.isValidPluralNum(36) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0045 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0046
     * @tc.number SUB_RESMGR_UTILS_05_0046
     * @tc.desc   pluralBranchOf(37) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0046 begin');
      const result: string = ResourceUtils.pluralBranchOf(37);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(37) === true));
      expect(ResourceUtils.isValidPluralNum(37) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0046 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0047
     * @tc.number SUB_RESMGR_UTILS_05_0047
     * @tc.desc   pluralBranchOf(38) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0047 begin');
      const result: string = ResourceUtils.pluralBranchOf(38);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(38) === true));
      expect(ResourceUtils.isValidPluralNum(38) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0047 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0048
     * @tc.number SUB_RESMGR_UTILS_05_0048
     * @tc.desc   pluralBranchOf(39) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0048 begin');
      const result: string = ResourceUtils.pluralBranchOf(39);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(39) === true));
      expect(ResourceUtils.isValidPluralNum(39) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0048 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0049
     * @tc.number SUB_RESMGR_UTILS_05_0049
     * @tc.desc   pluralBranchOf(40) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0049 begin');
      const result: string = ResourceUtils.pluralBranchOf(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(40) === true));
      expect(ResourceUtils.isValidPluralNum(40) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0049 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0050
     * @tc.number SUB_RESMGR_UTILS_05_0050
     * @tc.desc   pluralBranchOf(41) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0050 begin');
      const result: string = ResourceUtils.pluralBranchOf(41);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(41) === true));
      expect(ResourceUtils.isValidPluralNum(41) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0050 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0051
     * @tc.number SUB_RESMGR_UTILS_05_0051
     * @tc.desc   pluralBranchOf(42) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0051 begin');
      const result: string = ResourceUtils.pluralBranchOf(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(42) === true));
      expect(ResourceUtils.isValidPluralNum(42) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0051 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0052
     * @tc.number SUB_RESMGR_UTILS_05_0052
     * @tc.desc   pluralBranchOf(43) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0052 begin');
      const result: string = ResourceUtils.pluralBranchOf(43);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(43) === true));
      expect(ResourceUtils.isValidPluralNum(43) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0052 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0053
     * @tc.number SUB_RESMGR_UTILS_05_0053
     * @tc.desc   pluralBranchOf(44) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0053 begin');
      const result: string = ResourceUtils.pluralBranchOf(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(44) === true));
      expect(ResourceUtils.isValidPluralNum(44) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0053 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0054
     * @tc.number SUB_RESMGR_UTILS_05_0054
     * @tc.desc   pluralBranchOf(45) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0054 begin');
      const result: string = ResourceUtils.pluralBranchOf(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(45) === true));
      expect(ResourceUtils.isValidPluralNum(45) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0054 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0055
     * @tc.number SUB_RESMGR_UTILS_05_0055
     * @tc.desc   pluralBranchOf(46) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0055 begin');
      const result: string = ResourceUtils.pluralBranchOf(46);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(46) === true));
      expect(ResourceUtils.isValidPluralNum(46) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0055 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0056
     * @tc.number SUB_RESMGR_UTILS_05_0056
     * @tc.desc   pluralBranchOf(47) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0056 begin');
      const result: string = ResourceUtils.pluralBranchOf(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(47) === true));
      expect(ResourceUtils.isValidPluralNum(47) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0056 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0057
     * @tc.number SUB_RESMGR_UTILS_05_0057
     * @tc.desc   pluralBranchOf(48) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0057 begin');
      const result: string = ResourceUtils.pluralBranchOf(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(48) === true));
      expect(ResourceUtils.isValidPluralNum(48) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0057 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0058
     * @tc.number SUB_RESMGR_UTILS_05_0058
     * @tc.desc   pluralBranchOf(49) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0058 begin');
      const result: string = ResourceUtils.pluralBranchOf(49);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(49) === true));
      expect(ResourceUtils.isValidPluralNum(49) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0058 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0059
     * @tc.number SUB_RESMGR_UTILS_05_0059
     * @tc.desc   pluralBranchOf(50) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0059 begin');
      const result: string = ResourceUtils.pluralBranchOf(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(50) === true));
      expect(ResourceUtils.isValidPluralNum(50) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0059 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0060
     * @tc.number SUB_RESMGR_UTILS_05_0060
     * @tc.desc   pluralBranchOf(51) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0060 begin');
      const result: string = ResourceUtils.pluralBranchOf(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(51) === true));
      expect(ResourceUtils.isValidPluralNum(51) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0060 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0061
     * @tc.number SUB_RESMGR_UTILS_05_0061
     * @tc.desc   pluralBranchOf(52) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0061 begin');
      const result: string = ResourceUtils.pluralBranchOf(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(52) === true));
      expect(ResourceUtils.isValidPluralNum(52) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0061 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0062
     * @tc.number SUB_RESMGR_UTILS_05_0062
     * @tc.desc   pluralBranchOf(53) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0062 begin');
      const result: string = ResourceUtils.pluralBranchOf(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(53) === true));
      expect(ResourceUtils.isValidPluralNum(53) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0062 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0063
     * @tc.number SUB_RESMGR_UTILS_05_0063
     * @tc.desc   pluralBranchOf(54) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0063 begin');
      const result: string = ResourceUtils.pluralBranchOf(54);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(54) === true));
      expect(ResourceUtils.isValidPluralNum(54) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0063 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0064
     * @tc.number SUB_RESMGR_UTILS_05_0064
     * @tc.desc   pluralBranchOf(55) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0064 begin');
      const result: string = ResourceUtils.pluralBranchOf(55);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(55) === true));
      expect(ResourceUtils.isValidPluralNum(55) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0064 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0065
     * @tc.number SUB_RESMGR_UTILS_05_0065
     * @tc.desc   pluralBranchOf(56) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0065 begin');
      const result: string = ResourceUtils.pluralBranchOf(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(56) === true));
      expect(ResourceUtils.isValidPluralNum(56) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0065 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0066
     * @tc.number SUB_RESMGR_UTILS_05_0066
     * @tc.desc   pluralBranchOf(57) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0066 begin');
      const result: string = ResourceUtils.pluralBranchOf(57);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(57) === true));
      expect(ResourceUtils.isValidPluralNum(57) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0066 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0067
     * @tc.number SUB_RESMGR_UTILS_05_0067
     * @tc.desc   pluralBranchOf(58) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0067 begin');
      const result: string = ResourceUtils.pluralBranchOf(58);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(58) === true));
      expect(ResourceUtils.isValidPluralNum(58) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0067 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0068
     * @tc.number SUB_RESMGR_UTILS_05_0068
     * @tc.desc   pluralBranchOf(59) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0068 begin');
      const result: string = ResourceUtils.pluralBranchOf(59);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(59) === true));
      expect(ResourceUtils.isValidPluralNum(59) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0068 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0069
     * @tc.number SUB_RESMGR_UTILS_05_0069
     * @tc.desc   pluralBranchOf(60) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0069 begin');
      const result: string = ResourceUtils.pluralBranchOf(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(60) === true));
      expect(ResourceUtils.isValidPluralNum(60) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0069 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0070
     * @tc.number SUB_RESMGR_UTILS_05_0070
     * @tc.desc   pluralBranchOf(61) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0070 begin');
      const result: string = ResourceUtils.pluralBranchOf(61);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(61) === true));
      expect(ResourceUtils.isValidPluralNum(61) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0070 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0071
     * @tc.number SUB_RESMGR_UTILS_05_0071
     * @tc.desc   pluralBranchOf(62) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0071 begin');
      const result: string = ResourceUtils.pluralBranchOf(62);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(62) === true));
      expect(ResourceUtils.isValidPluralNum(62) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0071 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0072
     * @tc.number SUB_RESMGR_UTILS_05_0072
     * @tc.desc   pluralBranchOf(63) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0072 begin');
      const result: string = ResourceUtils.pluralBranchOf(63);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(63) === true));
      expect(ResourceUtils.isValidPluralNum(63) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0072 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0073
     * @tc.number SUB_RESMGR_UTILS_05_0073
     * @tc.desc   pluralBranchOf(64) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0073 begin');
      const result: string = ResourceUtils.pluralBranchOf(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(64) === true));
      expect(ResourceUtils.isValidPluralNum(64) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0073 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0074
     * @tc.number SUB_RESMGR_UTILS_05_0074
     * @tc.desc   pluralBranchOf(65) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0074 begin');
      const result: string = ResourceUtils.pluralBranchOf(65);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(65) === true));
      expect(ResourceUtils.isValidPluralNum(65) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0074 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0075
     * @tc.number SUB_RESMGR_UTILS_05_0075
     * @tc.desc   pluralBranchOf(66) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0075 begin');
      const result: string = ResourceUtils.pluralBranchOf(66);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(66) === true));
      expect(ResourceUtils.isValidPluralNum(66) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0075 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0076
     * @tc.number SUB_RESMGR_UTILS_05_0076
     * @tc.desc   pluralBranchOf(67) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0076 begin');
      const result: string = ResourceUtils.pluralBranchOf(67);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(67) === true));
      expect(ResourceUtils.isValidPluralNum(67) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0076 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0077
     * @tc.number SUB_RESMGR_UTILS_05_0077
     * @tc.desc   pluralBranchOf(68) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0077 begin');
      const result: string = ResourceUtils.pluralBranchOf(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(68) === true));
      expect(ResourceUtils.isValidPluralNum(68) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0077 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0078
     * @tc.number SUB_RESMGR_UTILS_05_0078
     * @tc.desc   pluralBranchOf(69) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0078 begin');
      const result: string = ResourceUtils.pluralBranchOf(69);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(69) === true));
      expect(ResourceUtils.isValidPluralNum(69) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0078 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0079
     * @tc.number SUB_RESMGR_UTILS_05_0079
     * @tc.desc   pluralBranchOf(70) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0079 begin');
      const result: string = ResourceUtils.pluralBranchOf(70);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(70) === true));
      expect(ResourceUtils.isValidPluralNum(70) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0079 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0080
     * @tc.number SUB_RESMGR_UTILS_05_0080
     * @tc.desc   pluralBranchOf(71) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0080 begin');
      const result: string = ResourceUtils.pluralBranchOf(71);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(71) === true));
      expect(ResourceUtils.isValidPluralNum(71) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0080 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0081
     * @tc.number SUB_RESMGR_UTILS_05_0081
     * @tc.desc   pluralBranchOf(72) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0081 begin');
      const result: string = ResourceUtils.pluralBranchOf(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(72) === true));
      expect(ResourceUtils.isValidPluralNum(72) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0081 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0082
     * @tc.number SUB_RESMGR_UTILS_05_0082
     * @tc.desc   pluralBranchOf(73) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0082 begin');
      const result: string = ResourceUtils.pluralBranchOf(73);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(73) === true));
      expect(ResourceUtils.isValidPluralNum(73) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0082 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0083
     * @tc.number SUB_RESMGR_UTILS_05_0083
     * @tc.desc   pluralBranchOf(74) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0083 begin');
      const result: string = ResourceUtils.pluralBranchOf(74);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(74) === true));
      expect(ResourceUtils.isValidPluralNum(74) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0083 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0084
     * @tc.number SUB_RESMGR_UTILS_05_0084
     * @tc.desc   pluralBranchOf(75) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0084 begin');
      const result: string = ResourceUtils.pluralBranchOf(75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(75) === true));
      expect(ResourceUtils.isValidPluralNum(75) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0084 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0085
     * @tc.number SUB_RESMGR_UTILS_05_0085
     * @tc.desc   pluralBranchOf(76) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0085 begin');
      const result: string = ResourceUtils.pluralBranchOf(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(76) === true));
      expect(ResourceUtils.isValidPluralNum(76) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0085 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0086
     * @tc.number SUB_RESMGR_UTILS_05_0086
     * @tc.desc   pluralBranchOf(77) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0086 begin');
      const result: string = ResourceUtils.pluralBranchOf(77);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(77) === true));
      expect(ResourceUtils.isValidPluralNum(77) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0086 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0087
     * @tc.number SUB_RESMGR_UTILS_05_0087
     * @tc.desc   pluralBranchOf(78) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0087 begin');
      const result: string = ResourceUtils.pluralBranchOf(78);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(78) === true));
      expect(ResourceUtils.isValidPluralNum(78) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0087 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0088
     * @tc.number SUB_RESMGR_UTILS_05_0088
     * @tc.desc   pluralBranchOf(79) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0088 begin');
      const result: string = ResourceUtils.pluralBranchOf(79);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(79) === true));
      expect(ResourceUtils.isValidPluralNum(79) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0088 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0089
     * @tc.number SUB_RESMGR_UTILS_05_0089
     * @tc.desc   pluralBranchOf(80) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0089 begin');
      const result: string = ResourceUtils.pluralBranchOf(80);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(80) === true));
      expect(ResourceUtils.isValidPluralNum(80) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0089 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0090
     * @tc.number SUB_RESMGR_UTILS_05_0090
     * @tc.desc   pluralBranchOf(81) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0090 begin');
      const result: string = ResourceUtils.pluralBranchOf(81);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(81) === true));
      expect(ResourceUtils.isValidPluralNum(81) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid'));
      expect(result === 'zero' || result === 'one' || result === 'other' || result === 'invalid').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0090 end');
    })

    /**
     * @tc.name   testResourceUtilsPlural0091
     * @tc.number SUB_RESMGR_UTILS_05_0091
     * @tc.desc   0/1/2 三个分支的切换点与非整数、负数的拒绝
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPlural0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0091 begin');
      // 0 必须走 zero 分支，不能落到 other
      const zeroBranch: string = ResourceUtils.pluralBranchOf(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', zeroBranch, 'zero');
      expect(zeroBranch).assertEqual('zero');
      // 1 与 2 在边界两侧分别是 one 和 other
      const oneBranch: string = ResourceUtils.pluralBranchOf(1);
      const twoBranch: string = ResourceUtils.pluralBranchOf(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', oneBranch, 'one');
      expect(oneBranch).assertEqual('one');
      expect(twoBranch).assertEqual('other');
      // 负数与非整数不能静默落到 other，必须显式标记 invalid
      const negativeBranch: string = ResourceUtils.pluralBranchOf(-1);
      const fractionalBranch: string = ResourceUtils.pluralBranchOf(1.5);
      expect(negativeBranch).assertEqual('invalid');
      expect(fractionalBranch).assertEqual('invalid');
      // 合法性判定与分支结果必须一致
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(0)));
      expect(ResourceUtils.isValidPluralNum(0)).assertTrue();
      expect(ResourceUtils.isValidPluralNum(-1)).assertFalse();
      expect(ResourceUtils.isValidPluralNum(1.5)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPlural0091 end');
    })

  })
}
