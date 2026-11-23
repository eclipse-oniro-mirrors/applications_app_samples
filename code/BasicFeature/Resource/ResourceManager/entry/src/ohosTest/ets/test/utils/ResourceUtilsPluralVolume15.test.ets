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

export default function resourceUtilsPluralB15Test() {
  describe('ResourceUtilsPluralB15Test', () => {

    /**
     * @tc.name   testResourceUtilsPluralB150001
     * @tc.number SUB_RESMGR_UTILS_15_0001
     * @tc.desc   pluralBranchOf(1000) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150001 begin');
      const result: string = ResourceUtils.pluralBranchOf(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1000)));
      expect(ResourceUtils.isValidPluralNum(1000)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150001 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150002
     * @tc.number SUB_RESMGR_UTILS_15_0002
     * @tc.desc   pluralBranchOf(1001) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150002 begin');
      const result: string = ResourceUtils.pluralBranchOf(1001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1001)));
      expect(ResourceUtils.isValidPluralNum(1001)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150002 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150003
     * @tc.number SUB_RESMGR_UTILS_15_0003
     * @tc.desc   pluralBranchOf(1002) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150003 begin');
      const result: string = ResourceUtils.pluralBranchOf(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1002)));
      expect(ResourceUtils.isValidPluralNum(1002)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150003 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150004
     * @tc.number SUB_RESMGR_UTILS_15_0004
     * @tc.desc   pluralBranchOf(1003) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150004 begin');
      const result: string = ResourceUtils.pluralBranchOf(1003);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1003)));
      expect(ResourceUtils.isValidPluralNum(1003)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150004 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150005
     * @tc.number SUB_RESMGR_UTILS_15_0005
     * @tc.desc   pluralBranchOf(1004) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150005 begin');
      const result: string = ResourceUtils.pluralBranchOf(1004);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1004)));
      expect(ResourceUtils.isValidPluralNum(1004)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150005 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150006
     * @tc.number SUB_RESMGR_UTILS_15_0006
     * @tc.desc   pluralBranchOf(1005) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150006 begin');
      const result: string = ResourceUtils.pluralBranchOf(1005);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1005)));
      expect(ResourceUtils.isValidPluralNum(1005)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150006 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150007
     * @tc.number SUB_RESMGR_UTILS_15_0007
     * @tc.desc   pluralBranchOf(1006) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150007 begin');
      const result: string = ResourceUtils.pluralBranchOf(1006);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1006)));
      expect(ResourceUtils.isValidPluralNum(1006)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150007 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150008
     * @tc.number SUB_RESMGR_UTILS_15_0008
     * @tc.desc   pluralBranchOf(1007) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150008 begin');
      const result: string = ResourceUtils.pluralBranchOf(1007);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1007)));
      expect(ResourceUtils.isValidPluralNum(1007)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150008 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150009
     * @tc.number SUB_RESMGR_UTILS_15_0009
     * @tc.desc   pluralBranchOf(1008) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150009 begin');
      const result: string = ResourceUtils.pluralBranchOf(1008);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1008)));
      expect(ResourceUtils.isValidPluralNum(1008)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150009 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150010
     * @tc.number SUB_RESMGR_UTILS_15_0010
     * @tc.desc   pluralBranchOf(1009) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150010 begin');
      const result: string = ResourceUtils.pluralBranchOf(1009);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1009)));
      expect(ResourceUtils.isValidPluralNum(1009)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150010 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150011
     * @tc.number SUB_RESMGR_UTILS_15_0011
     * @tc.desc   pluralBranchOf(1010) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150011 begin');
      const result: string = ResourceUtils.pluralBranchOf(1010);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1010)));
      expect(ResourceUtils.isValidPluralNum(1010)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150011 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150012
     * @tc.number SUB_RESMGR_UTILS_15_0012
     * @tc.desc   pluralBranchOf(1011) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150012 begin');
      const result: string = ResourceUtils.pluralBranchOf(1011);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1011)));
      expect(ResourceUtils.isValidPluralNum(1011)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150012 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150013
     * @tc.number SUB_RESMGR_UTILS_15_0013
     * @tc.desc   pluralBranchOf(1012) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150013 begin');
      const result: string = ResourceUtils.pluralBranchOf(1012);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1012)));
      expect(ResourceUtils.isValidPluralNum(1012)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150013 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150014
     * @tc.number SUB_RESMGR_UTILS_15_0014
     * @tc.desc   pluralBranchOf(1013) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150014 begin');
      const result: string = ResourceUtils.pluralBranchOf(1013);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1013)));
      expect(ResourceUtils.isValidPluralNum(1013)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150014 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150015
     * @tc.number SUB_RESMGR_UTILS_15_0015
     * @tc.desc   pluralBranchOf(1014) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150015 begin');
      const result: string = ResourceUtils.pluralBranchOf(1014);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1014)));
      expect(ResourceUtils.isValidPluralNum(1014)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150015 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150016
     * @tc.number SUB_RESMGR_UTILS_15_0016
     * @tc.desc   pluralBranchOf(1015) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150016 begin');
      const result: string = ResourceUtils.pluralBranchOf(1015);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1015)));
      expect(ResourceUtils.isValidPluralNum(1015)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150016 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150017
     * @tc.number SUB_RESMGR_UTILS_15_0017
     * @tc.desc   pluralBranchOf(1016) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150017 begin');
      const result: string = ResourceUtils.pluralBranchOf(1016);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1016)));
      expect(ResourceUtils.isValidPluralNum(1016)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150017 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150018
     * @tc.number SUB_RESMGR_UTILS_15_0018
     * @tc.desc   pluralBranchOf(1017) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150018 begin');
      const result: string = ResourceUtils.pluralBranchOf(1017);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1017)));
      expect(ResourceUtils.isValidPluralNum(1017)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150018 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150019
     * @tc.number SUB_RESMGR_UTILS_15_0019
     * @tc.desc   pluralBranchOf(1018) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150019 begin');
      const result: string = ResourceUtils.pluralBranchOf(1018);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1018)));
      expect(ResourceUtils.isValidPluralNum(1018)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150019 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150020
     * @tc.number SUB_RESMGR_UTILS_15_0020
     * @tc.desc   pluralBranchOf(1019) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150020 begin');
      const result: string = ResourceUtils.pluralBranchOf(1019);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1019)));
      expect(ResourceUtils.isValidPluralNum(1019)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150020 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150021
     * @tc.number SUB_RESMGR_UTILS_15_0021
     * @tc.desc   pluralBranchOf(1020) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150021 begin');
      const result: string = ResourceUtils.pluralBranchOf(1020);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1020)));
      expect(ResourceUtils.isValidPluralNum(1020)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150021 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150022
     * @tc.number SUB_RESMGR_UTILS_15_0022
     * @tc.desc   pluralBranchOf(1021) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150022 begin');
      const result: string = ResourceUtils.pluralBranchOf(1021);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1021)));
      expect(ResourceUtils.isValidPluralNum(1021)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150022 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150023
     * @tc.number SUB_RESMGR_UTILS_15_0023
     * @tc.desc   pluralBranchOf(1022) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150023 begin');
      const result: string = ResourceUtils.pluralBranchOf(1022);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1022)));
      expect(ResourceUtils.isValidPluralNum(1022)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150023 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150024
     * @tc.number SUB_RESMGR_UTILS_15_0024
     * @tc.desc   pluralBranchOf(1023) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150024 begin');
      const result: string = ResourceUtils.pluralBranchOf(1023);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1023)));
      expect(ResourceUtils.isValidPluralNum(1023)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150024 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150025
     * @tc.number SUB_RESMGR_UTILS_15_0025
     * @tc.desc   pluralBranchOf(1024) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150025 begin');
      const result: string = ResourceUtils.pluralBranchOf(1024);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1024)));
      expect(ResourceUtils.isValidPluralNum(1024)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150025 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150026
     * @tc.number SUB_RESMGR_UTILS_15_0026
     * @tc.desc   pluralBranchOf(1025) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150026 begin');
      const result: string = ResourceUtils.pluralBranchOf(1025);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1025)));
      expect(ResourceUtils.isValidPluralNum(1025)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150026 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150027
     * @tc.number SUB_RESMGR_UTILS_15_0027
     * @tc.desc   pluralBranchOf(1026) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150027 begin');
      const result: string = ResourceUtils.pluralBranchOf(1026);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1026)));
      expect(ResourceUtils.isValidPluralNum(1026)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150027 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150028
     * @tc.number SUB_RESMGR_UTILS_15_0028
     * @tc.desc   pluralBranchOf(1027) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150028 begin');
      const result: string = ResourceUtils.pluralBranchOf(1027);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1027)));
      expect(ResourceUtils.isValidPluralNum(1027)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150028 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150029
     * @tc.number SUB_RESMGR_UTILS_15_0029
     * @tc.desc   pluralBranchOf(1028) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150029 begin');
      const result: string = ResourceUtils.pluralBranchOf(1028);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1028)));
      expect(ResourceUtils.isValidPluralNum(1028)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150029 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150030
     * @tc.number SUB_RESMGR_UTILS_15_0030
     * @tc.desc   pluralBranchOf(1029) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150030 begin');
      const result: string = ResourceUtils.pluralBranchOf(1029);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1029)));
      expect(ResourceUtils.isValidPluralNum(1029)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150030 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150031
     * @tc.number SUB_RESMGR_UTILS_15_0031
     * @tc.desc   pluralBranchOf(1030) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150031 begin');
      const result: string = ResourceUtils.pluralBranchOf(1030);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1030)));
      expect(ResourceUtils.isValidPluralNum(1030)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150031 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150032
     * @tc.number SUB_RESMGR_UTILS_15_0032
     * @tc.desc   pluralBranchOf(1031) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150032 begin');
      const result: string = ResourceUtils.pluralBranchOf(1031);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1031)));
      expect(ResourceUtils.isValidPluralNum(1031)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150032 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150033
     * @tc.number SUB_RESMGR_UTILS_15_0033
     * @tc.desc   pluralBranchOf(1032) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150033 begin');
      const result: string = ResourceUtils.pluralBranchOf(1032);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1032)));
      expect(ResourceUtils.isValidPluralNum(1032)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150033 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150034
     * @tc.number SUB_RESMGR_UTILS_15_0034
     * @tc.desc   pluralBranchOf(1033) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150034 begin');
      const result: string = ResourceUtils.pluralBranchOf(1033);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1033)));
      expect(ResourceUtils.isValidPluralNum(1033)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150034 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150035
     * @tc.number SUB_RESMGR_UTILS_15_0035
     * @tc.desc   pluralBranchOf(1034) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150035 begin');
      const result: string = ResourceUtils.pluralBranchOf(1034);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1034)));
      expect(ResourceUtils.isValidPluralNum(1034)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150035 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150036
     * @tc.number SUB_RESMGR_UTILS_15_0036
     * @tc.desc   pluralBranchOf(1035) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150036 begin');
      const result: string = ResourceUtils.pluralBranchOf(1035);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1035)));
      expect(ResourceUtils.isValidPluralNum(1035)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150036 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150037
     * @tc.number SUB_RESMGR_UTILS_15_0037
     * @tc.desc   pluralBranchOf(1036) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150037 begin');
      const result: string = ResourceUtils.pluralBranchOf(1036);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1036)));
      expect(ResourceUtils.isValidPluralNum(1036)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150037 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150038
     * @tc.number SUB_RESMGR_UTILS_15_0038
     * @tc.desc   pluralBranchOf(1037) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150038 begin');
      const result: string = ResourceUtils.pluralBranchOf(1037);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1037)));
      expect(ResourceUtils.isValidPluralNum(1037)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150038 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150039
     * @tc.number SUB_RESMGR_UTILS_15_0039
     * @tc.desc   pluralBranchOf(1038) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150039 begin');
      const result: string = ResourceUtils.pluralBranchOf(1038);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1038)));
      expect(ResourceUtils.isValidPluralNum(1038)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150039 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150040
     * @tc.number SUB_RESMGR_UTILS_15_0040
     * @tc.desc   pluralBranchOf(1039) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150040 begin');
      const result: string = ResourceUtils.pluralBranchOf(1039);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1039)));
      expect(ResourceUtils.isValidPluralNum(1039)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150040 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150041
     * @tc.number SUB_RESMGR_UTILS_15_0041
     * @tc.desc   pluralBranchOf(1040) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150041 begin');
      const result: string = ResourceUtils.pluralBranchOf(1040);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1040)));
      expect(ResourceUtils.isValidPluralNum(1040)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150041 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150042
     * @tc.number SUB_RESMGR_UTILS_15_0042
     * @tc.desc   pluralBranchOf(1041) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150042 begin');
      const result: string = ResourceUtils.pluralBranchOf(1041);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1041)));
      expect(ResourceUtils.isValidPluralNum(1041)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150042 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150043
     * @tc.number SUB_RESMGR_UTILS_15_0043
     * @tc.desc   pluralBranchOf(1042) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150043 begin');
      const result: string = ResourceUtils.pluralBranchOf(1042);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1042)));
      expect(ResourceUtils.isValidPluralNum(1042)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150043 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150044
     * @tc.number SUB_RESMGR_UTILS_15_0044
     * @tc.desc   pluralBranchOf(1043) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150044 begin');
      const result: string = ResourceUtils.pluralBranchOf(1043);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1043)));
      expect(ResourceUtils.isValidPluralNum(1043)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150044 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150045
     * @tc.number SUB_RESMGR_UTILS_15_0045
     * @tc.desc   pluralBranchOf(1044) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150045 begin');
      const result: string = ResourceUtils.pluralBranchOf(1044);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1044)));
      expect(ResourceUtils.isValidPluralNum(1044)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150045 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150046
     * @tc.number SUB_RESMGR_UTILS_15_0046
     * @tc.desc   pluralBranchOf(1045) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150046 begin');
      const result: string = ResourceUtils.pluralBranchOf(1045);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1045)));
      expect(ResourceUtils.isValidPluralNum(1045)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150046 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150047
     * @tc.number SUB_RESMGR_UTILS_15_0047
     * @tc.desc   pluralBranchOf(1046) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150047 begin');
      const result: string = ResourceUtils.pluralBranchOf(1046);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1046)));
      expect(ResourceUtils.isValidPluralNum(1046)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150047 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150048
     * @tc.number SUB_RESMGR_UTILS_15_0048
     * @tc.desc   pluralBranchOf(1047) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150048 begin');
      const result: string = ResourceUtils.pluralBranchOf(1047);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1047)));
      expect(ResourceUtils.isValidPluralNum(1047)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150048 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150049
     * @tc.number SUB_RESMGR_UTILS_15_0049
     * @tc.desc   pluralBranchOf(1048) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150049 begin');
      const result: string = ResourceUtils.pluralBranchOf(1048);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1048)));
      expect(ResourceUtils.isValidPluralNum(1048)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150049 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150050
     * @tc.number SUB_RESMGR_UTILS_15_0050
     * @tc.desc   pluralBranchOf(1049) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150050 begin');
      const result: string = ResourceUtils.pluralBranchOf(1049);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1049)));
      expect(ResourceUtils.isValidPluralNum(1049)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150050 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150051
     * @tc.number SUB_RESMGR_UTILS_15_0051
     * @tc.desc   pluralBranchOf(1050) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150051 begin');
      const result: string = ResourceUtils.pluralBranchOf(1050);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1050)));
      expect(ResourceUtils.isValidPluralNum(1050)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150051 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150052
     * @tc.number SUB_RESMGR_UTILS_15_0052
     * @tc.desc   pluralBranchOf(1051) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150052 begin');
      const result: string = ResourceUtils.pluralBranchOf(1051);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1051)));
      expect(ResourceUtils.isValidPluralNum(1051)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150052 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150053
     * @tc.number SUB_RESMGR_UTILS_15_0053
     * @tc.desc   pluralBranchOf(1052) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150053 begin');
      const result: string = ResourceUtils.pluralBranchOf(1052);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1052)));
      expect(ResourceUtils.isValidPluralNum(1052)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150053 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150054
     * @tc.number SUB_RESMGR_UTILS_15_0054
     * @tc.desc   pluralBranchOf(1053) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150054 begin');
      const result: string = ResourceUtils.pluralBranchOf(1053);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1053)));
      expect(ResourceUtils.isValidPluralNum(1053)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150054 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150055
     * @tc.number SUB_RESMGR_UTILS_15_0055
     * @tc.desc   pluralBranchOf(1054) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150055 begin');
      const result: string = ResourceUtils.pluralBranchOf(1054);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1054)));
      expect(ResourceUtils.isValidPluralNum(1054)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150055 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150056
     * @tc.number SUB_RESMGR_UTILS_15_0056
     * @tc.desc   pluralBranchOf(1055) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150056 begin');
      const result: string = ResourceUtils.pluralBranchOf(1055);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1055)));
      expect(ResourceUtils.isValidPluralNum(1055)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150056 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150057
     * @tc.number SUB_RESMGR_UTILS_15_0057
     * @tc.desc   pluralBranchOf(1056) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150057 begin');
      const result: string = ResourceUtils.pluralBranchOf(1056);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1056)));
      expect(ResourceUtils.isValidPluralNum(1056)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150057 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150058
     * @tc.number SUB_RESMGR_UTILS_15_0058
     * @tc.desc   pluralBranchOf(1057) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150058 begin');
      const result: string = ResourceUtils.pluralBranchOf(1057);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1057)));
      expect(ResourceUtils.isValidPluralNum(1057)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150058 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150059
     * @tc.number SUB_RESMGR_UTILS_15_0059
     * @tc.desc   pluralBranchOf(1058) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150059 begin');
      const result: string = ResourceUtils.pluralBranchOf(1058);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1058)));
      expect(ResourceUtils.isValidPluralNum(1058)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150059 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150060
     * @tc.number SUB_RESMGR_UTILS_15_0060
     * @tc.desc   pluralBranchOf(1059) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150060 begin');
      const result: string = ResourceUtils.pluralBranchOf(1059);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1059)));
      expect(ResourceUtils.isValidPluralNum(1059)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150060 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150061
     * @tc.number SUB_RESMGR_UTILS_15_0061
     * @tc.desc   pluralBranchOf(1060) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150061 begin');
      const result: string = ResourceUtils.pluralBranchOf(1060);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1060)));
      expect(ResourceUtils.isValidPluralNum(1060)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150061 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150062
     * @tc.number SUB_RESMGR_UTILS_15_0062
     * @tc.desc   pluralBranchOf(1061) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150062 begin');
      const result: string = ResourceUtils.pluralBranchOf(1061);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1061)));
      expect(ResourceUtils.isValidPluralNum(1061)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150062 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150063
     * @tc.number SUB_RESMGR_UTILS_15_0063
     * @tc.desc   pluralBranchOf(1062) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150063 begin');
      const result: string = ResourceUtils.pluralBranchOf(1062);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1062)));
      expect(ResourceUtils.isValidPluralNum(1062)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150063 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150064
     * @tc.number SUB_RESMGR_UTILS_15_0064
     * @tc.desc   pluralBranchOf(1063) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150064 begin');
      const result: string = ResourceUtils.pluralBranchOf(1063);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1063)));
      expect(ResourceUtils.isValidPluralNum(1063)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150064 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150065
     * @tc.number SUB_RESMGR_UTILS_15_0065
     * @tc.desc   pluralBranchOf(1064) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150065 begin');
      const result: string = ResourceUtils.pluralBranchOf(1064);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1064)));
      expect(ResourceUtils.isValidPluralNum(1064)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150065 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150066
     * @tc.number SUB_RESMGR_UTILS_15_0066
     * @tc.desc   pluralBranchOf(1065) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150066 begin');
      const result: string = ResourceUtils.pluralBranchOf(1065);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1065)));
      expect(ResourceUtils.isValidPluralNum(1065)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150066 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150067
     * @tc.number SUB_RESMGR_UTILS_15_0067
     * @tc.desc   pluralBranchOf(1066) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150067 begin');
      const result: string = ResourceUtils.pluralBranchOf(1066);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1066)));
      expect(ResourceUtils.isValidPluralNum(1066)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150067 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150068
     * @tc.number SUB_RESMGR_UTILS_15_0068
     * @tc.desc   pluralBranchOf(1067) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150068 begin');
      const result: string = ResourceUtils.pluralBranchOf(1067);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1067)));
      expect(ResourceUtils.isValidPluralNum(1067)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150068 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150069
     * @tc.number SUB_RESMGR_UTILS_15_0069
     * @tc.desc   pluralBranchOf(1068) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150069 begin');
      const result: string = ResourceUtils.pluralBranchOf(1068);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1068)));
      expect(ResourceUtils.isValidPluralNum(1068)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150069 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150070
     * @tc.number SUB_RESMGR_UTILS_15_0070
     * @tc.desc   pluralBranchOf(1069) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150070 begin');
      const result: string = ResourceUtils.pluralBranchOf(1069);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1069)));
      expect(ResourceUtils.isValidPluralNum(1069)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150070 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150071
     * @tc.number SUB_RESMGR_UTILS_15_0071
     * @tc.desc   pluralBranchOf(1070) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150071 begin');
      const result: string = ResourceUtils.pluralBranchOf(1070);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1070)));
      expect(ResourceUtils.isValidPluralNum(1070)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150071 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150072
     * @tc.number SUB_RESMGR_UTILS_15_0072
     * @tc.desc   pluralBranchOf(1071) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150072 begin');
      const result: string = ResourceUtils.pluralBranchOf(1071);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1071)));
      expect(ResourceUtils.isValidPluralNum(1071)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150072 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150073
     * @tc.number SUB_RESMGR_UTILS_15_0073
     * @tc.desc   pluralBranchOf(1072) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150073 begin');
      const result: string = ResourceUtils.pluralBranchOf(1072);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1072)));
      expect(ResourceUtils.isValidPluralNum(1072)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150073 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150074
     * @tc.number SUB_RESMGR_UTILS_15_0074
     * @tc.desc   pluralBranchOf(1073) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150074 begin');
      const result: string = ResourceUtils.pluralBranchOf(1073);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1073)));
      expect(ResourceUtils.isValidPluralNum(1073)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150074 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150075
     * @tc.number SUB_RESMGR_UTILS_15_0075
     * @tc.desc   pluralBranchOf(1074) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150075 begin');
      const result: string = ResourceUtils.pluralBranchOf(1074);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1074)));
      expect(ResourceUtils.isValidPluralNum(1074)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150075 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150076
     * @tc.number SUB_RESMGR_UTILS_15_0076
     * @tc.desc   pluralBranchOf(1075) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150076 begin');
      const result: string = ResourceUtils.pluralBranchOf(1075);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1075)));
      expect(ResourceUtils.isValidPluralNum(1075)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150076 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150077
     * @tc.number SUB_RESMGR_UTILS_15_0077
     * @tc.desc   pluralBranchOf(1076) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150077 begin');
      const result: string = ResourceUtils.pluralBranchOf(1076);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1076)));
      expect(ResourceUtils.isValidPluralNum(1076)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150077 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150078
     * @tc.number SUB_RESMGR_UTILS_15_0078
     * @tc.desc   pluralBranchOf(1077) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150078 begin');
      const result: string = ResourceUtils.pluralBranchOf(1077);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1077)));
      expect(ResourceUtils.isValidPluralNum(1077)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150078 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150079
     * @tc.number SUB_RESMGR_UTILS_15_0079
     * @tc.desc   pluralBranchOf(1078) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150079 begin');
      const result: string = ResourceUtils.pluralBranchOf(1078);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1078)));
      expect(ResourceUtils.isValidPluralNum(1078)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150079 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150080
     * @tc.number SUB_RESMGR_UTILS_15_0080
     * @tc.desc   pluralBranchOf(1079) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150080 begin');
      const result: string = ResourceUtils.pluralBranchOf(1079);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1079)));
      expect(ResourceUtils.isValidPluralNum(1079)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150080 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150081
     * @tc.number SUB_RESMGR_UTILS_15_0081
     * @tc.desc   pluralBranchOf(1080) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150081 begin');
      const result: string = ResourceUtils.pluralBranchOf(1080);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1080)));
      expect(ResourceUtils.isValidPluralNum(1080)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150081 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150082
     * @tc.number SUB_RESMGR_UTILS_15_0082
     * @tc.desc   pluralBranchOf(1081) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150082 begin');
      const result: string = ResourceUtils.pluralBranchOf(1081);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1081)));
      expect(ResourceUtils.isValidPluralNum(1081)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150082 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150083
     * @tc.number SUB_RESMGR_UTILS_15_0083
     * @tc.desc   pluralBranchOf(1082) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150083 begin');
      const result: string = ResourceUtils.pluralBranchOf(1082);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1082)));
      expect(ResourceUtils.isValidPluralNum(1082)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150083 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150084
     * @tc.number SUB_RESMGR_UTILS_15_0084
     * @tc.desc   pluralBranchOf(1083) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150084 begin');
      const result: string = ResourceUtils.pluralBranchOf(1083);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1083)));
      expect(ResourceUtils.isValidPluralNum(1083)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150084 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150085
     * @tc.number SUB_RESMGR_UTILS_15_0085
     * @tc.desc   pluralBranchOf(1084) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150085 begin');
      const result: string = ResourceUtils.pluralBranchOf(1084);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1084)));
      expect(ResourceUtils.isValidPluralNum(1084)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150085 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150086
     * @tc.number SUB_RESMGR_UTILS_15_0086
     * @tc.desc   pluralBranchOf(1085) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150086 begin');
      const result: string = ResourceUtils.pluralBranchOf(1085);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1085)));
      expect(ResourceUtils.isValidPluralNum(1085)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150086 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150087
     * @tc.number SUB_RESMGR_UTILS_15_0087
     * @tc.desc   pluralBranchOf(1086) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150087 begin');
      const result: string = ResourceUtils.pluralBranchOf(1086);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1086)));
      expect(ResourceUtils.isValidPluralNum(1086)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150087 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150088
     * @tc.number SUB_RESMGR_UTILS_15_0088
     * @tc.desc   pluralBranchOf(1087) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150088 begin');
      const result: string = ResourceUtils.pluralBranchOf(1087);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1087)));
      expect(ResourceUtils.isValidPluralNum(1087)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150088 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150089
     * @tc.number SUB_RESMGR_UTILS_15_0089
     * @tc.desc   pluralBranchOf(1088) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150089 begin');
      const result: string = ResourceUtils.pluralBranchOf(1088);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1088)));
      expect(ResourceUtils.isValidPluralNum(1088)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150089 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150090
     * @tc.number SUB_RESMGR_UTILS_15_0090
     * @tc.desc   pluralBranchOf(1089) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150090 begin');
      const result: string = ResourceUtils.pluralBranchOf(1089);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1089)));
      expect(ResourceUtils.isValidPluralNum(1089)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150090 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150091
     * @tc.number SUB_RESMGR_UTILS_15_0091
     * @tc.desc   pluralBranchOf(1090) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150091 begin');
      const result: string = ResourceUtils.pluralBranchOf(1090);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1090)));
      expect(ResourceUtils.isValidPluralNum(1090)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150091 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150092
     * @tc.number SUB_RESMGR_UTILS_15_0092
     * @tc.desc   pluralBranchOf(1091) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150092 begin');
      const result: string = ResourceUtils.pluralBranchOf(1091);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1091)));
      expect(ResourceUtils.isValidPluralNum(1091)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150092 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150093
     * @tc.number SUB_RESMGR_UTILS_15_0093
     * @tc.desc   pluralBranchOf(1092) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150093 begin');
      const result: string = ResourceUtils.pluralBranchOf(1092);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1092)));
      expect(ResourceUtils.isValidPluralNum(1092)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150093 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150094
     * @tc.number SUB_RESMGR_UTILS_15_0094
     * @tc.desc   pluralBranchOf(1093) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150094 begin');
      const result: string = ResourceUtils.pluralBranchOf(1093);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1093)));
      expect(ResourceUtils.isValidPluralNum(1093)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150094 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB150095
     * @tc.number SUB_RESMGR_UTILS_15_0095
     * @tc.desc   pluralBranchOf(1094) selects other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB150095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150095 begin');
      const result: string = ResourceUtils.pluralBranchOf(1094);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('other'));
      expect(result).assertEqual('other');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isValidPluralNum(1094)));
      expect(ResourceUtils.isValidPluralNum(1094)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'zero' || result === 'one' || result === 'other'));
      expect(result === 'zero' || result === 'one' || result === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB150095 end');
    })

    /**
     * @tc.name   testResourceUtilsPluralB1596
     * @tc.number SUB_RESMGR_UTILS_15_0096
     * @tc.desc   千级数量与负数拒绝
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsPluralB1596', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB1596 begin');
      expect(ResourceUtils.pluralBranchOf(1000)).assertEqual('other');
      expect(ResourceUtils.pluralBranchOf(0)).assertEqual('zero');
      expect(ResourceUtils.pluralBranchOf(-1)).assertEqual('invalid');
      expect(ResourceUtils.isValidPluralNum(-1)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsPluralB1596 end');
    })
  })
}
