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

export default function resourceUtilsPluralB14Test() {
  describe('ResourceUtilsPluralB14Test', () => {

    /**
     * @tc.name   testResourceUtilsPluralB140001
     * @tc.number SUB_RESMGR_UTILS_14_0001
     * @tc.desc   pluralBranchOf(200) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140001 begin');
      const result: string = ResourceUtils.pluralBranchOf(200);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(200)));
      expect(ResourceUtils.isValidPluralNum(200)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140001 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140002
     * @tc.number SUB_RESMGR_UTILS_14_0002
     * @tc.desc   pluralBranchOf(201) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140002 begin');
      const result: string = ResourceUtils.pluralBranchOf(201);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(201)));
      expect(ResourceUtils.isValidPluralNum(201)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140002 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140003
     * @tc.number SUB_RESMGR_UTILS_14_0003
     * @tc.desc   pluralBranchOf(202) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140003 begin');
      const result: string = ResourceUtils.pluralBranchOf(202);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(202)));
      expect(ResourceUtils.isValidPluralNum(202)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140003 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140004
     * @tc.number SUB_RESMGR_UTILS_14_0004
     * @tc.desc   pluralBranchOf(203) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140004 begin');
      const result: string = ResourceUtils.pluralBranchOf(203);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(203)));
      expect(ResourceUtils.isValidPluralNum(203)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140004 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140005
     * @tc.number SUB_RESMGR_UTILS_14_0005
     * @tc.desc   pluralBranchOf(204) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140005 begin');
      const result: string = ResourceUtils.pluralBranchOf(204);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(204)));
      expect(ResourceUtils.isValidPluralNum(204)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140005 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140006
     * @tc.number SUB_RESMGR_UTILS_14_0006
     * @tc.desc   pluralBranchOf(205) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140006 begin');
      const result: string = ResourceUtils.pluralBranchOf(205);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(205)));
      expect(ResourceUtils.isValidPluralNum(205)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140006 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140007
     * @tc.number SUB_RESMGR_UTILS_14_0007
     * @tc.desc   pluralBranchOf(206) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140007 begin');
      const result: string = ResourceUtils.pluralBranchOf(206);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(206)));
      expect(ResourceUtils.isValidPluralNum(206)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140007 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140008
     * @tc.number SUB_RESMGR_UTILS_14_0008
     * @tc.desc   pluralBranchOf(207) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140008 begin');
      const result: string = ResourceUtils.pluralBranchOf(207);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(207)));
      expect(ResourceUtils.isValidPluralNum(207)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140008 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140009
     * @tc.number SUB_RESMGR_UTILS_14_0009
     * @tc.desc   pluralBranchOf(208) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140009 begin');
      const result: string = ResourceUtils.pluralBranchOf(208);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(208)));
      expect(ResourceUtils.isValidPluralNum(208)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140009 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140010
     * @tc.number SUB_RESMGR_UTILS_14_0010
     * @tc.desc   pluralBranchOf(209) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140010 begin');
      const result: string = ResourceUtils.pluralBranchOf(209);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(209)));
      expect(ResourceUtils.isValidPluralNum(209)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140010 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140011
     * @tc.number SUB_RESMGR_UTILS_14_0011
     * @tc.desc   pluralBranchOf(210) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140011 begin');
      const result: string = ResourceUtils.pluralBranchOf(210);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(210)));
      expect(ResourceUtils.isValidPluralNum(210)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140011 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140012
     * @tc.number SUB_RESMGR_UTILS_14_0012
     * @tc.desc   pluralBranchOf(211) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140012 begin');
      const result: string = ResourceUtils.pluralBranchOf(211);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(211)));
      expect(ResourceUtils.isValidPluralNum(211)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140012 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140013
     * @tc.number SUB_RESMGR_UTILS_14_0013
     * @tc.desc   pluralBranchOf(212) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140013 begin');
      const result: string = ResourceUtils.pluralBranchOf(212);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(212)));
      expect(ResourceUtils.isValidPluralNum(212)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140013 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140014
     * @tc.number SUB_RESMGR_UTILS_14_0014
     * @tc.desc   pluralBranchOf(213) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140014 begin');
      const result: string = ResourceUtils.pluralBranchOf(213);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(213)));
      expect(ResourceUtils.isValidPluralNum(213)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140014 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140015
     * @tc.number SUB_RESMGR_UTILS_14_0015
     * @tc.desc   pluralBranchOf(214) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140015 begin');
      const result: string = ResourceUtils.pluralBranchOf(214);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(214)));
      expect(ResourceUtils.isValidPluralNum(214)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140015 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140016
     * @tc.number SUB_RESMGR_UTILS_14_0016
     * @tc.desc   pluralBranchOf(215) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140016 begin');
      const result: string = ResourceUtils.pluralBranchOf(215);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(215)));
      expect(ResourceUtils.isValidPluralNum(215)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140016 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140017
     * @tc.number SUB_RESMGR_UTILS_14_0017
     * @tc.desc   pluralBranchOf(216) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140017 begin');
      const result: string = ResourceUtils.pluralBranchOf(216);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(216)));
      expect(ResourceUtils.isValidPluralNum(216)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140017 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140018
     * @tc.number SUB_RESMGR_UTILS_14_0018
     * @tc.desc   pluralBranchOf(217) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140018 begin');
      const result: string = ResourceUtils.pluralBranchOf(217);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(217)));
      expect(ResourceUtils.isValidPluralNum(217)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140018 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140019
     * @tc.number SUB_RESMGR_UTILS_14_0019
     * @tc.desc   pluralBranchOf(218) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140019 begin');
      const result: string = ResourceUtils.pluralBranchOf(218);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(218)));
      expect(ResourceUtils.isValidPluralNum(218)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140019 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140020
     * @tc.number SUB_RESMGR_UTILS_14_0020
     * @tc.desc   pluralBranchOf(219) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140020 begin');
      const result: string = ResourceUtils.pluralBranchOf(219);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(219)));
      expect(ResourceUtils.isValidPluralNum(219)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140020 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140021
     * @tc.number SUB_RESMGR_UTILS_14_0021
     * @tc.desc   pluralBranchOf(220) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140021 begin');
      const result: string = ResourceUtils.pluralBranchOf(220);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(220)));
      expect(ResourceUtils.isValidPluralNum(220)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140021 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140022
     * @tc.number SUB_RESMGR_UTILS_14_0022
     * @tc.desc   pluralBranchOf(221) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140022 begin');
      const result: string = ResourceUtils.pluralBranchOf(221);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(221)));
      expect(ResourceUtils.isValidPluralNum(221)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140022 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140023
     * @tc.number SUB_RESMGR_UTILS_14_0023
     * @tc.desc   pluralBranchOf(222) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140023 begin');
      const result: string = ResourceUtils.pluralBranchOf(222);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(222)));
      expect(ResourceUtils.isValidPluralNum(222)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140023 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140024
     * @tc.number SUB_RESMGR_UTILS_14_0024
     * @tc.desc   pluralBranchOf(223) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140024 begin');
      const result: string = ResourceUtils.pluralBranchOf(223);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(223)));
      expect(ResourceUtils.isValidPluralNum(223)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140024 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140025
     * @tc.number SUB_RESMGR_UTILS_14_0025
     * @tc.desc   pluralBranchOf(224) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140025 begin');
      const result: string = ResourceUtils.pluralBranchOf(224);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(224)));
      expect(ResourceUtils.isValidPluralNum(224)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140025 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140026
     * @tc.number SUB_RESMGR_UTILS_14_0026
     * @tc.desc   pluralBranchOf(225) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140026 begin');
      const result: string = ResourceUtils.pluralBranchOf(225);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(225)));
      expect(ResourceUtils.isValidPluralNum(225)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140026 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140027
     * @tc.number SUB_RESMGR_UTILS_14_0027
     * @tc.desc   pluralBranchOf(226) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140027 begin');
      const result: string = ResourceUtils.pluralBranchOf(226);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(226)));
      expect(ResourceUtils.isValidPluralNum(226)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140027 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140028
     * @tc.number SUB_RESMGR_UTILS_14_0028
     * @tc.desc   pluralBranchOf(227) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140028 begin');
      const result: string = ResourceUtils.pluralBranchOf(227);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(227)));
      expect(ResourceUtils.isValidPluralNum(227)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140028 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140029
     * @tc.number SUB_RESMGR_UTILS_14_0029
     * @tc.desc   pluralBranchOf(228) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140029 begin');
      const result: string = ResourceUtils.pluralBranchOf(228);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(228)));
      expect(ResourceUtils.isValidPluralNum(228)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140029 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140030
     * @tc.number SUB_RESMGR_UTILS_14_0030
     * @tc.desc   pluralBranchOf(229) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140030 begin');
      const result: string = ResourceUtils.pluralBranchOf(229);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(229)));
      expect(ResourceUtils.isValidPluralNum(229)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140030 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140031
     * @tc.number SUB_RESMGR_UTILS_14_0031
     * @tc.desc   pluralBranchOf(230) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140031 begin');
      const result: string = ResourceUtils.pluralBranchOf(230);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(230)));
      expect(ResourceUtils.isValidPluralNum(230)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140031 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140032
     * @tc.number SUB_RESMGR_UTILS_14_0032
     * @tc.desc   pluralBranchOf(231) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140032 begin');
      const result: string = ResourceUtils.pluralBranchOf(231);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(231)));
      expect(ResourceUtils.isValidPluralNum(231)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140032 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140033
     * @tc.number SUB_RESMGR_UTILS_14_0033
     * @tc.desc   pluralBranchOf(232) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140033 begin');
      const result: string = ResourceUtils.pluralBranchOf(232);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(232)));
      expect(ResourceUtils.isValidPluralNum(232)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140033 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140034
     * @tc.number SUB_RESMGR_UTILS_14_0034
     * @tc.desc   pluralBranchOf(233) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140034 begin');
      const result: string = ResourceUtils.pluralBranchOf(233);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(233)));
      expect(ResourceUtils.isValidPluralNum(233)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140034 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140035
     * @tc.number SUB_RESMGR_UTILS_14_0035
     * @tc.desc   pluralBranchOf(234) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140035 begin');
      const result: string = ResourceUtils.pluralBranchOf(234);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(234)));
      expect(ResourceUtils.isValidPluralNum(234)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140035 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140036
     * @tc.number SUB_RESMGR_UTILS_14_0036
     * @tc.desc   pluralBranchOf(235) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140036 begin');
      const result: string = ResourceUtils.pluralBranchOf(235);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(235)));
      expect(ResourceUtils.isValidPluralNum(235)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140036 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140037
     * @tc.number SUB_RESMGR_UTILS_14_0037
     * @tc.desc   pluralBranchOf(236) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140037 begin');
      const result: string = ResourceUtils.pluralBranchOf(236);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(236)));
      expect(ResourceUtils.isValidPluralNum(236)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140037 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140038
     * @tc.number SUB_RESMGR_UTILS_14_0038
     * @tc.desc   pluralBranchOf(237) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140038 begin');
      const result: string = ResourceUtils.pluralBranchOf(237);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(237)));
      expect(ResourceUtils.isValidPluralNum(237)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140038 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140039
     * @tc.number SUB_RESMGR_UTILS_14_0039
     * @tc.desc   pluralBranchOf(238) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140039 begin');
      const result: string = ResourceUtils.pluralBranchOf(238);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(238)));
      expect(ResourceUtils.isValidPluralNum(238)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140039 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140040
     * @tc.number SUB_RESMGR_UTILS_14_0040
     * @tc.desc   pluralBranchOf(239) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140040 begin');
      const result: string = ResourceUtils.pluralBranchOf(239);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(239)));
      expect(ResourceUtils.isValidPluralNum(239)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140040 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140041
     * @tc.number SUB_RESMGR_UTILS_14_0041
     * @tc.desc   pluralBranchOf(240) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140041 begin');
      const result: string = ResourceUtils.pluralBranchOf(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(240)));
      expect(ResourceUtils.isValidPluralNum(240)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140041 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140042
     * @tc.number SUB_RESMGR_UTILS_14_0042
     * @tc.desc   pluralBranchOf(241) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140042 begin');
      const result: string = ResourceUtils.pluralBranchOf(241);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(241)));
      expect(ResourceUtils.isValidPluralNum(241)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140042 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140043
     * @tc.number SUB_RESMGR_UTILS_14_0043
     * @tc.desc   pluralBranchOf(242) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140043 begin');
      const result: string = ResourceUtils.pluralBranchOf(242);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(242)));
      expect(ResourceUtils.isValidPluralNum(242)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140043 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140044
     * @tc.number SUB_RESMGR_UTILS_14_0044
     * @tc.desc   pluralBranchOf(243) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140044 begin');
      const result: string = ResourceUtils.pluralBranchOf(243);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(243)));
      expect(ResourceUtils.isValidPluralNum(243)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140044 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140045
     * @tc.number SUB_RESMGR_UTILS_14_0045
     * @tc.desc   pluralBranchOf(244) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140045 begin');
      const result: string = ResourceUtils.pluralBranchOf(244);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(244)));
      expect(ResourceUtils.isValidPluralNum(244)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140045 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140046
     * @tc.number SUB_RESMGR_UTILS_14_0046
     * @tc.desc   pluralBranchOf(245) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140046 begin');
      const result: string = ResourceUtils.pluralBranchOf(245);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(245)));
      expect(ResourceUtils.isValidPluralNum(245)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140046 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140047
     * @tc.number SUB_RESMGR_UTILS_14_0047
     * @tc.desc   pluralBranchOf(246) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140047 begin');
      const result: string = ResourceUtils.pluralBranchOf(246);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(246)));
      expect(ResourceUtils.isValidPluralNum(246)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140047 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140048
     * @tc.number SUB_RESMGR_UTILS_14_0048
     * @tc.desc   pluralBranchOf(247) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140048 begin');
      const result: string = ResourceUtils.pluralBranchOf(247);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(247)));
      expect(ResourceUtils.isValidPluralNum(247)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140048 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140049
     * @tc.number SUB_RESMGR_UTILS_14_0049
     * @tc.desc   pluralBranchOf(248) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140049 begin');
      const result: string = ResourceUtils.pluralBranchOf(248);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(248)));
      expect(ResourceUtils.isValidPluralNum(248)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140049 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140050
     * @tc.number SUB_RESMGR_UTILS_14_0050
     * @tc.desc   pluralBranchOf(249) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140050 begin');
      const result: string = ResourceUtils.pluralBranchOf(249);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(249)));
      expect(ResourceUtils.isValidPluralNum(249)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140050 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140051
     * @tc.number SUB_RESMGR_UTILS_14_0051
     * @tc.desc   pluralBranchOf(250) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140051 begin');
      const result: string = ResourceUtils.pluralBranchOf(250);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(250)));
      expect(ResourceUtils.isValidPluralNum(250)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140051 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140052
     * @tc.number SUB_RESMGR_UTILS_14_0052
     * @tc.desc   pluralBranchOf(251) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140052 begin');
      const result: string = ResourceUtils.pluralBranchOf(251);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(251)));
      expect(ResourceUtils.isValidPluralNum(251)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140052 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140053
     * @tc.number SUB_RESMGR_UTILS_14_0053
     * @tc.desc   pluralBranchOf(252) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140053 begin');
      const result: string = ResourceUtils.pluralBranchOf(252);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(252)));
      expect(ResourceUtils.isValidPluralNum(252)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140053 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140054
     * @tc.number SUB_RESMGR_UTILS_14_0054
     * @tc.desc   pluralBranchOf(253) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140054 begin');
      const result: string = ResourceUtils.pluralBranchOf(253);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(253)));
      expect(ResourceUtils.isValidPluralNum(253)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140054 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140055
     * @tc.number SUB_RESMGR_UTILS_14_0055
     * @tc.desc   pluralBranchOf(254) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140055 begin');
      const result: string = ResourceUtils.pluralBranchOf(254);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(254)));
      expect(ResourceUtils.isValidPluralNum(254)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140055 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140056
     * @tc.number SUB_RESMGR_UTILS_14_0056
     * @tc.desc   pluralBranchOf(255) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140056 begin');
      const result: string = ResourceUtils.pluralBranchOf(255);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(255)));
      expect(ResourceUtils.isValidPluralNum(255)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140056 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140057
     * @tc.number SUB_RESMGR_UTILS_14_0057
     * @tc.desc   pluralBranchOf(256) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140057 begin');
      const result: string = ResourceUtils.pluralBranchOf(256);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(256)));
      expect(ResourceUtils.isValidPluralNum(256)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140057 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140058
     * @tc.number SUB_RESMGR_UTILS_14_0058
     * @tc.desc   pluralBranchOf(257) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140058 begin');
      const result: string = ResourceUtils.pluralBranchOf(257);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(257)));
      expect(ResourceUtils.isValidPluralNum(257)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140058 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140059
     * @tc.number SUB_RESMGR_UTILS_14_0059
     * @tc.desc   pluralBranchOf(258) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140059 begin');
      const result: string = ResourceUtils.pluralBranchOf(258);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(258)));
      expect(ResourceUtils.isValidPluralNum(258)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140059 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140060
     * @tc.number SUB_RESMGR_UTILS_14_0060
     * @tc.desc   pluralBranchOf(259) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140060 begin');
      const result: string = ResourceUtils.pluralBranchOf(259);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(259)));
      expect(ResourceUtils.isValidPluralNum(259)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140060 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140061
     * @tc.number SUB_RESMGR_UTILS_14_0061
     * @tc.desc   pluralBranchOf(260) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140061 begin');
      const result: string = ResourceUtils.pluralBranchOf(260);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(260)));
      expect(ResourceUtils.isValidPluralNum(260)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140061 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140062
     * @tc.number SUB_RESMGR_UTILS_14_0062
     * @tc.desc   pluralBranchOf(261) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140062 begin');
      const result: string = ResourceUtils.pluralBranchOf(261);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(261)));
      expect(ResourceUtils.isValidPluralNum(261)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140062 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140063
     * @tc.number SUB_RESMGR_UTILS_14_0063
     * @tc.desc   pluralBranchOf(262) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140063 begin');
      const result: string = ResourceUtils.pluralBranchOf(262);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(262)));
      expect(ResourceUtils.isValidPluralNum(262)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140063 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140064
     * @tc.number SUB_RESMGR_UTILS_14_0064
     * @tc.desc   pluralBranchOf(263) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140064 begin');
      const result: string = ResourceUtils.pluralBranchOf(263);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(263)));
      expect(ResourceUtils.isValidPluralNum(263)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140064 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140065
     * @tc.number SUB_RESMGR_UTILS_14_0065
     * @tc.desc   pluralBranchOf(264) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140065 begin');
      const result: string = ResourceUtils.pluralBranchOf(264);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(264)));
      expect(ResourceUtils.isValidPluralNum(264)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140065 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140066
     * @tc.number SUB_RESMGR_UTILS_14_0066
     * @tc.desc   pluralBranchOf(265) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140066 begin');
      const result: string = ResourceUtils.pluralBranchOf(265);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(265)));
      expect(ResourceUtils.isValidPluralNum(265)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140066 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140067
     * @tc.number SUB_RESMGR_UTILS_14_0067
     * @tc.desc   pluralBranchOf(266) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140067 begin');
      const result: string = ResourceUtils.pluralBranchOf(266);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(266)));
      expect(ResourceUtils.isValidPluralNum(266)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140067 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140068
     * @tc.number SUB_RESMGR_UTILS_14_0068
     * @tc.desc   pluralBranchOf(267) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140068 begin');
      const result: string = ResourceUtils.pluralBranchOf(267);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(267)));
      expect(ResourceUtils.isValidPluralNum(267)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140068 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140069
     * @tc.number SUB_RESMGR_UTILS_14_0069
     * @tc.desc   pluralBranchOf(268) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140069 begin');
      const result: string = ResourceUtils.pluralBranchOf(268);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(268)));
      expect(ResourceUtils.isValidPluralNum(268)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140069 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140070
     * @tc.number SUB_RESMGR_UTILS_14_0070
     * @tc.desc   pluralBranchOf(269) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140070 begin');
      const result: string = ResourceUtils.pluralBranchOf(269);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(269)));
      expect(ResourceUtils.isValidPluralNum(269)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140070 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140071
     * @tc.number SUB_RESMGR_UTILS_14_0071
     * @tc.desc   pluralBranchOf(270) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140071 begin');
      const result: string = ResourceUtils.pluralBranchOf(270);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(270)));
      expect(ResourceUtils.isValidPluralNum(270)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140071 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140072
     * @tc.number SUB_RESMGR_UTILS_14_0072
     * @tc.desc   pluralBranchOf(271) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140072 begin');
      const result: string = ResourceUtils.pluralBranchOf(271);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(271)));
      expect(ResourceUtils.isValidPluralNum(271)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140072 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140073
     * @tc.number SUB_RESMGR_UTILS_14_0073
     * @tc.desc   pluralBranchOf(272) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140073 begin');
      const result: string = ResourceUtils.pluralBranchOf(272);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(272)));
      expect(ResourceUtils.isValidPluralNum(272)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140073 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140074
     * @tc.number SUB_RESMGR_UTILS_14_0074
     * @tc.desc   pluralBranchOf(273) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140074 begin');
      const result: string = ResourceUtils.pluralBranchOf(273);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(273)));
      expect(ResourceUtils.isValidPluralNum(273)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140074 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140075
     * @tc.number SUB_RESMGR_UTILS_14_0075
     * @tc.desc   pluralBranchOf(274) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140075 begin');
      const result: string = ResourceUtils.pluralBranchOf(274);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(274)));
      expect(ResourceUtils.isValidPluralNum(274)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140075 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140076
     * @tc.number SUB_RESMGR_UTILS_14_0076
     * @tc.desc   pluralBranchOf(275) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140076 begin');
      const result: string = ResourceUtils.pluralBranchOf(275);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(275)));
      expect(ResourceUtils.isValidPluralNum(275)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140076 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140077
     * @tc.number SUB_RESMGR_UTILS_14_0077
     * @tc.desc   pluralBranchOf(276) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140077 begin');
      const result: string = ResourceUtils.pluralBranchOf(276);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(276)));
      expect(ResourceUtils.isValidPluralNum(276)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140077 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140078
     * @tc.number SUB_RESMGR_UTILS_14_0078
     * @tc.desc   pluralBranchOf(277) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140078 begin');
      const result: string = ResourceUtils.pluralBranchOf(277);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(277)));
      expect(ResourceUtils.isValidPluralNum(277)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140078 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140079
     * @tc.number SUB_RESMGR_UTILS_14_0079
     * @tc.desc   pluralBranchOf(278) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140079 begin');
      const result: string = ResourceUtils.pluralBranchOf(278);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(278)));
      expect(ResourceUtils.isValidPluralNum(278)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140079 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140080
     * @tc.number SUB_RESMGR_UTILS_14_0080
     * @tc.desc   pluralBranchOf(279) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140080 begin');
      const result: string = ResourceUtils.pluralBranchOf(279);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(279)));
      expect(ResourceUtils.isValidPluralNum(279)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140080 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140081
     * @tc.number SUB_RESMGR_UTILS_14_0081
     * @tc.desc   pluralBranchOf(280) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140081 begin');
      const result: string = ResourceUtils.pluralBranchOf(280);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(280)));
      expect(ResourceUtils.isValidPluralNum(280)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140081 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140082
     * @tc.number SUB_RESMGR_UTILS_14_0082
     * @tc.desc   pluralBranchOf(281) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140082 begin');
      const result: string = ResourceUtils.pluralBranchOf(281);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(281)));
      expect(ResourceUtils.isValidPluralNum(281)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140082 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140083
     * @tc.number SUB_RESMGR_UTILS_14_0083
     * @tc.desc   pluralBranchOf(282) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140083 begin');
      const result: string = ResourceUtils.pluralBranchOf(282);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(282)));
      expect(ResourceUtils.isValidPluralNum(282)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140083 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140084
     * @tc.number SUB_RESMGR_UTILS_14_0084
     * @tc.desc   pluralBranchOf(283) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140084 begin');
      const result: string = ResourceUtils.pluralBranchOf(283);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(283)));
      expect(ResourceUtils.isValidPluralNum(283)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140084 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140085
     * @tc.number SUB_RESMGR_UTILS_14_0085
     * @tc.desc   pluralBranchOf(284) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140085 begin');
      const result: string = ResourceUtils.pluralBranchOf(284);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(284)));
      expect(ResourceUtils.isValidPluralNum(284)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140085 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140086
     * @tc.number SUB_RESMGR_UTILS_14_0086
     * @tc.desc   pluralBranchOf(285) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140086 begin');
      const result: string = ResourceUtils.pluralBranchOf(285);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(285)));
      expect(ResourceUtils.isValidPluralNum(285)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140086 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140087
     * @tc.number SUB_RESMGR_UTILS_14_0087
     * @tc.desc   pluralBranchOf(286) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140087 begin');
      const result: string = ResourceUtils.pluralBranchOf(286);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(286)));
      expect(ResourceUtils.isValidPluralNum(286)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140087 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140088
     * @tc.number SUB_RESMGR_UTILS_14_0088
     * @tc.desc   pluralBranchOf(287) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140088 begin');
      const result: string = ResourceUtils.pluralBranchOf(287);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(287)));
      expect(ResourceUtils.isValidPluralNum(287)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140088 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140089
     * @tc.number SUB_RESMGR_UTILS_14_0089
     * @tc.desc   pluralBranchOf(288) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140089 begin');
      const result: string = ResourceUtils.pluralBranchOf(288);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(288)));
      expect(ResourceUtils.isValidPluralNum(288)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140089 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140090
     * @tc.number SUB_RESMGR_UTILS_14_0090
     * @tc.desc   pluralBranchOf(289) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140090 begin');
      const result: string = ResourceUtils.pluralBranchOf(289);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(289)));
      expect(ResourceUtils.isValidPluralNum(289)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140090 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140091
     * @tc.number SUB_RESMGR_UTILS_14_0091
     * @tc.desc   pluralBranchOf(290) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140091 begin');
      const result: string = ResourceUtils.pluralBranchOf(290);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(290)));
      expect(ResourceUtils.isValidPluralNum(290)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140091 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140092
     * @tc.number SUB_RESMGR_UTILS_14_0092
     * @tc.desc   pluralBranchOf(291) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140092 begin');
      const result: string = ResourceUtils.pluralBranchOf(291);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(291)));
      expect(ResourceUtils.isValidPluralNum(291)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140092 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140093
     * @tc.number SUB_RESMGR_UTILS_14_0093
     * @tc.desc   pluralBranchOf(292) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140093 begin');
      const result: string = ResourceUtils.pluralBranchOf(292);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(292)));
      expect(ResourceUtils.isValidPluralNum(292)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140093 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140094
     * @tc.number SUB_RESMGR_UTILS_14_0094
     * @tc.desc   pluralBranchOf(293) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140094 begin');
      const result: string = ResourceUtils.pluralBranchOf(293);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(293)));
      expect(ResourceUtils.isValidPluralNum(293)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140094 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB140095
     * @tc.number SUB_RESMGR_UTILS_14_0095
     * @tc.desc   pluralBranchOf(294) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB140095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140095 begin');
      const result: string = ResourceUtils.pluralBranchOf(294);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(294)));
      expect(ResourceUtils.isValidPluralNum(294)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB140095 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB1496
     * @tc.number SUB_RESMGR_UTILS_14_0096
     * @tc.desc   大数量词仍落 other 且保持合法
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB1496', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB1496 begin');
      expect(ResourceUtils.pluralBranchOf(200)).assertEqual('other');
      expect(ResourceUtils.pluralBranchOf(999999)).assertEqual('other');
      expect(ResourceUtils.isValidPluralNum(2147483647)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB1496 end');
    })
  })
}
