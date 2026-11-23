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

export default function resourceUtilsBytesB08Test() {
  describe('ResourceUtilsBytesB08Test', () => {

    /**
     * @tc.name   testResourceUtilsBytesB080001
     * @tc.number SUB_RESMGR_UTILS_08_0001
     * @tc.desc   formatByteSize(2100) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080001 begin');
      const result: string = ResourceUtils.formatByteSize(2100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080001 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080002
     * @tc.number SUB_RESMGR_UTILS_08_0002
     * @tc.desc   formatByteSize(2101) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080002 begin');
      const result: string = ResourceUtils.formatByteSize(2101);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080002 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080003
     * @tc.number SUB_RESMGR_UTILS_08_0003
     * @tc.desc   formatByteSize(2102) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080003 begin');
      const result: string = ResourceUtils.formatByteSize(2102);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080003 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080004
     * @tc.number SUB_RESMGR_UTILS_08_0004
     * @tc.desc   formatByteSize(2103) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080004 begin');
      const result: string = ResourceUtils.formatByteSize(2103);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080004 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080005
     * @tc.number SUB_RESMGR_UTILS_08_0005
     * @tc.desc   formatByteSize(2104) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080005 begin');
      const result: string = ResourceUtils.formatByteSize(2104);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080005 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080006
     * @tc.number SUB_RESMGR_UTILS_08_0006
     * @tc.desc   formatByteSize(2105) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080006 begin');
      const result: string = ResourceUtils.formatByteSize(2105);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080006 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080007
     * @tc.number SUB_RESMGR_UTILS_08_0007
     * @tc.desc   formatByteSize(2106) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080007 begin');
      const result: string = ResourceUtils.formatByteSize(2106);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080007 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080008
     * @tc.number SUB_RESMGR_UTILS_08_0008
     * @tc.desc   formatByteSize(2107) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080008 begin');
      const result: string = ResourceUtils.formatByteSize(2107);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080008 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080009
     * @tc.number SUB_RESMGR_UTILS_08_0009
     * @tc.desc   formatByteSize(2108) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080009 begin');
      const result: string = ResourceUtils.formatByteSize(2108);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080009 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080010
     * @tc.number SUB_RESMGR_UTILS_08_0010
     * @tc.desc   formatByteSize(2109) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080010 begin');
      const result: string = ResourceUtils.formatByteSize(2109);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080010 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080011
     * @tc.number SUB_RESMGR_UTILS_08_0011
     * @tc.desc   formatByteSize(2110) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080011 begin');
      const result: string = ResourceUtils.formatByteSize(2110);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080011 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080012
     * @tc.number SUB_RESMGR_UTILS_08_0012
     * @tc.desc   formatByteSize(2111) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080012 begin');
      const result: string = ResourceUtils.formatByteSize(2111);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080012 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080013
     * @tc.number SUB_RESMGR_UTILS_08_0013
     * @tc.desc   formatByteSize(2112) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080013 begin');
      const result: string = ResourceUtils.formatByteSize(2112);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080013 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080014
     * @tc.number SUB_RESMGR_UTILS_08_0014
     * @tc.desc   formatByteSize(2113) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080014 begin');
      const result: string = ResourceUtils.formatByteSize(2113);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080014 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080015
     * @tc.number SUB_RESMGR_UTILS_08_0015
     * @tc.desc   formatByteSize(2114) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080015 begin');
      const result: string = ResourceUtils.formatByteSize(2114);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080015 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080016
     * @tc.number SUB_RESMGR_UTILS_08_0016
     * @tc.desc   formatByteSize(2115) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080016 begin');
      const result: string = ResourceUtils.formatByteSize(2115);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080016 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080017
     * @tc.number SUB_RESMGR_UTILS_08_0017
     * @tc.desc   formatByteSize(2116) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080017 begin');
      const result: string = ResourceUtils.formatByteSize(2116);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080017 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080018
     * @tc.number SUB_RESMGR_UTILS_08_0018
     * @tc.desc   formatByteSize(2117) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080018 begin');
      const result: string = ResourceUtils.formatByteSize(2117);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080018 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080019
     * @tc.number SUB_RESMGR_UTILS_08_0019
     * @tc.desc   formatByteSize(2118) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080019 begin');
      const result: string = ResourceUtils.formatByteSize(2118);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080019 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080020
     * @tc.number SUB_RESMGR_UTILS_08_0020
     * @tc.desc   formatByteSize(2119) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080020 begin');
      const result: string = ResourceUtils.formatByteSize(2119);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080020 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080021
     * @tc.number SUB_RESMGR_UTILS_08_0021
     * @tc.desc   formatByteSize(2120) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080021 begin');
      const result: string = ResourceUtils.formatByteSize(2120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080021 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080022
     * @tc.number SUB_RESMGR_UTILS_08_0022
     * @tc.desc   formatByteSize(2121) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080022 begin');
      const result: string = ResourceUtils.formatByteSize(2121);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080022 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080023
     * @tc.number SUB_RESMGR_UTILS_08_0023
     * @tc.desc   formatByteSize(2122) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080023 begin');
      const result: string = ResourceUtils.formatByteSize(2122);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080023 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080024
     * @tc.number SUB_RESMGR_UTILS_08_0024
     * @tc.desc   formatByteSize(2123) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080024 begin');
      const result: string = ResourceUtils.formatByteSize(2123);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080024 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080025
     * @tc.number SUB_RESMGR_UTILS_08_0025
     * @tc.desc   formatByteSize(2124) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080025 begin');
      const result: string = ResourceUtils.formatByteSize(2124);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080025 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080026
     * @tc.number SUB_RESMGR_UTILS_08_0026
     * @tc.desc   formatByteSize(2125) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080026 begin');
      const result: string = ResourceUtils.formatByteSize(2125);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080026 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080027
     * @tc.number SUB_RESMGR_UTILS_08_0027
     * @tc.desc   formatByteSize(2126) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080027 begin');
      const result: string = ResourceUtils.formatByteSize(2126);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080027 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080028
     * @tc.number SUB_RESMGR_UTILS_08_0028
     * @tc.desc   formatByteSize(2127) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080028 begin');
      const result: string = ResourceUtils.formatByteSize(2127);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080028 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080029
     * @tc.number SUB_RESMGR_UTILS_08_0029
     * @tc.desc   formatByteSize(2128) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080029 begin');
      const result: string = ResourceUtils.formatByteSize(2128);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080029 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080030
     * @tc.number SUB_RESMGR_UTILS_08_0030
     * @tc.desc   formatByteSize(2129) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080030 begin');
      const result: string = ResourceUtils.formatByteSize(2129);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080030 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080031
     * @tc.number SUB_RESMGR_UTILS_08_0031
     * @tc.desc   formatByteSize(2130) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080031 begin');
      const result: string = ResourceUtils.formatByteSize(2130);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080031 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080032
     * @tc.number SUB_RESMGR_UTILS_08_0032
     * @tc.desc   formatByteSize(2131) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080032 begin');
      const result: string = ResourceUtils.formatByteSize(2131);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080032 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080033
     * @tc.number SUB_RESMGR_UTILS_08_0033
     * @tc.desc   formatByteSize(2132) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080033 begin');
      const result: string = ResourceUtils.formatByteSize(2132);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080033 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080034
     * @tc.number SUB_RESMGR_UTILS_08_0034
     * @tc.desc   formatByteSize(2133) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080034 begin');
      const result: string = ResourceUtils.formatByteSize(2133);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080034 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080035
     * @tc.number SUB_RESMGR_UTILS_08_0035
     * @tc.desc   formatByteSize(2134) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080035 begin');
      const result: string = ResourceUtils.formatByteSize(2134);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080035 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080036
     * @tc.number SUB_RESMGR_UTILS_08_0036
     * @tc.desc   formatByteSize(2135) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080036 begin');
      const result: string = ResourceUtils.formatByteSize(2135);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080036 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080037
     * @tc.number SUB_RESMGR_UTILS_08_0037
     * @tc.desc   formatByteSize(2136) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080037 begin');
      const result: string = ResourceUtils.formatByteSize(2136);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080037 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080038
     * @tc.number SUB_RESMGR_UTILS_08_0038
     * @tc.desc   formatByteSize(2137) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080038 begin');
      const result: string = ResourceUtils.formatByteSize(2137);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080038 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080039
     * @tc.number SUB_RESMGR_UTILS_08_0039
     * @tc.desc   formatByteSize(2138) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080039 begin');
      const result: string = ResourceUtils.formatByteSize(2138);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080039 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080040
     * @tc.number SUB_RESMGR_UTILS_08_0040
     * @tc.desc   formatByteSize(2139) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080040 begin');
      const result: string = ResourceUtils.formatByteSize(2139);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080040 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080041
     * @tc.number SUB_RESMGR_UTILS_08_0041
     * @tc.desc   formatByteSize(2140) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080041 begin');
      const result: string = ResourceUtils.formatByteSize(2140);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080041 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080042
     * @tc.number SUB_RESMGR_UTILS_08_0042
     * @tc.desc   formatByteSize(2141) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080042 begin');
      const result: string = ResourceUtils.formatByteSize(2141);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080042 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080043
     * @tc.number SUB_RESMGR_UTILS_08_0043
     * @tc.desc   formatByteSize(2142) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080043 begin');
      const result: string = ResourceUtils.formatByteSize(2142);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080043 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080044
     * @tc.number SUB_RESMGR_UTILS_08_0044
     * @tc.desc   formatByteSize(2143) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080044 begin');
      const result: string = ResourceUtils.formatByteSize(2143);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080044 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080045
     * @tc.number SUB_RESMGR_UTILS_08_0045
     * @tc.desc   formatByteSize(2144) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080045 begin');
      const result: string = ResourceUtils.formatByteSize(2144);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080045 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080046
     * @tc.number SUB_RESMGR_UTILS_08_0046
     * @tc.desc   formatByteSize(2145) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080046 begin');
      const result: string = ResourceUtils.formatByteSize(2145);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080046 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080047
     * @tc.number SUB_RESMGR_UTILS_08_0047
     * @tc.desc   formatByteSize(2146) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080047 begin');
      const result: string = ResourceUtils.formatByteSize(2146);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080047 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080048
     * @tc.number SUB_RESMGR_UTILS_08_0048
     * @tc.desc   formatByteSize(2147) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080048 begin');
      const result: string = ResourceUtils.formatByteSize(2147);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080048 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080049
     * @tc.number SUB_RESMGR_UTILS_08_0049
     * @tc.desc   formatByteSize(2148) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080049 begin');
      const result: string = ResourceUtils.formatByteSize(2148);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080049 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080050
     * @tc.number SUB_RESMGR_UTILS_08_0050
     * @tc.desc   formatByteSize(2149) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080050 begin');
      const result: string = ResourceUtils.formatByteSize(2149);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080050 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080051
     * @tc.number SUB_RESMGR_UTILS_08_0051
     * @tc.desc   formatByteSize(2150) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080051 begin');
      const result: string = ResourceUtils.formatByteSize(2150);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080051 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080052
     * @tc.number SUB_RESMGR_UTILS_08_0052
     * @tc.desc   formatByteSize(2151) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080052 begin');
      const result: string = ResourceUtils.formatByteSize(2151);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080052 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080053
     * @tc.number SUB_RESMGR_UTILS_08_0053
     * @tc.desc   formatByteSize(2152) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080053 begin');
      const result: string = ResourceUtils.formatByteSize(2152);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080053 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080054
     * @tc.number SUB_RESMGR_UTILS_08_0054
     * @tc.desc   formatByteSize(2153) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080054 begin');
      const result: string = ResourceUtils.formatByteSize(2153);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080054 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080055
     * @tc.number SUB_RESMGR_UTILS_08_0055
     * @tc.desc   formatByteSize(2154) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080055 begin');
      const result: string = ResourceUtils.formatByteSize(2154);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080055 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080056
     * @tc.number SUB_RESMGR_UTILS_08_0056
     * @tc.desc   formatByteSize(2155) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080056 begin');
      const result: string = ResourceUtils.formatByteSize(2155);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080056 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080057
     * @tc.number SUB_RESMGR_UTILS_08_0057
     * @tc.desc   formatByteSize(2156) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080057 begin');
      const result: string = ResourceUtils.formatByteSize(2156);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080057 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080058
     * @tc.number SUB_RESMGR_UTILS_08_0058
     * @tc.desc   formatByteSize(2157) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080058 begin');
      const result: string = ResourceUtils.formatByteSize(2157);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080058 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080059
     * @tc.number SUB_RESMGR_UTILS_08_0059
     * @tc.desc   formatByteSize(2158) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080059 begin');
      const result: string = ResourceUtils.formatByteSize(2158);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080059 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080060
     * @tc.number SUB_RESMGR_UTILS_08_0060
     * @tc.desc   formatByteSize(2159) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080060 begin');
      const result: string = ResourceUtils.formatByteSize(2159);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080060 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080061
     * @tc.number SUB_RESMGR_UTILS_08_0061
     * @tc.desc   formatByteSize(2160) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080061 begin');
      const result: string = ResourceUtils.formatByteSize(2160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080061 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080062
     * @tc.number SUB_RESMGR_UTILS_08_0062
     * @tc.desc   formatByteSize(2161) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080062 begin');
      const result: string = ResourceUtils.formatByteSize(2161);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080062 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080063
     * @tc.number SUB_RESMGR_UTILS_08_0063
     * @tc.desc   formatByteSize(2162) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080063 begin');
      const result: string = ResourceUtils.formatByteSize(2162);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080063 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080064
     * @tc.number SUB_RESMGR_UTILS_08_0064
     * @tc.desc   formatByteSize(2163) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080064 begin');
      const result: string = ResourceUtils.formatByteSize(2163);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080064 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080065
     * @tc.number SUB_RESMGR_UTILS_08_0065
     * @tc.desc   formatByteSize(2164) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080065 begin');
      const result: string = ResourceUtils.formatByteSize(2164);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080065 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080066
     * @tc.number SUB_RESMGR_UTILS_08_0066
     * @tc.desc   formatByteSize(2165) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080066 begin');
      const result: string = ResourceUtils.formatByteSize(2165);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080066 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080067
     * @tc.number SUB_RESMGR_UTILS_08_0067
     * @tc.desc   formatByteSize(2166) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080067 begin');
      const result: string = ResourceUtils.formatByteSize(2166);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080067 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080068
     * @tc.number SUB_RESMGR_UTILS_08_0068
     * @tc.desc   formatByteSize(2167) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080068 begin');
      const result: string = ResourceUtils.formatByteSize(2167);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080068 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080069
     * @tc.number SUB_RESMGR_UTILS_08_0069
     * @tc.desc   formatByteSize(2168) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080069 begin');
      const result: string = ResourceUtils.formatByteSize(2168);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080069 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080070
     * @tc.number SUB_RESMGR_UTILS_08_0070
     * @tc.desc   formatByteSize(2169) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080070 begin');
      const result: string = ResourceUtils.formatByteSize(2169);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080070 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080071
     * @tc.number SUB_RESMGR_UTILS_08_0071
     * @tc.desc   formatByteSize(2170) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080071 begin');
      const result: string = ResourceUtils.formatByteSize(2170);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080071 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080072
     * @tc.number SUB_RESMGR_UTILS_08_0072
     * @tc.desc   formatByteSize(2171) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080072 begin');
      const result: string = ResourceUtils.formatByteSize(2171);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080072 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080073
     * @tc.number SUB_RESMGR_UTILS_08_0073
     * @tc.desc   formatByteSize(2172) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080073 begin');
      const result: string = ResourceUtils.formatByteSize(2172);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080073 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080074
     * @tc.number SUB_RESMGR_UTILS_08_0074
     * @tc.desc   formatByteSize(2173) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080074 begin');
      const result: string = ResourceUtils.formatByteSize(2173);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080074 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080075
     * @tc.number SUB_RESMGR_UTILS_08_0075
     * @tc.desc   formatByteSize(2174) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080075 begin');
      const result: string = ResourceUtils.formatByteSize(2174);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080075 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080076
     * @tc.number SUB_RESMGR_UTILS_08_0076
     * @tc.desc   formatByteSize(2175) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080076 begin');
      const result: string = ResourceUtils.formatByteSize(2175);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080076 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080077
     * @tc.number SUB_RESMGR_UTILS_08_0077
     * @tc.desc   formatByteSize(2176) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080077 begin');
      const result: string = ResourceUtils.formatByteSize(2176);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080077 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080078
     * @tc.number SUB_RESMGR_UTILS_08_0078
     * @tc.desc   formatByteSize(2177) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080078 begin');
      const result: string = ResourceUtils.formatByteSize(2177);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080078 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080079
     * @tc.number SUB_RESMGR_UTILS_08_0079
     * @tc.desc   formatByteSize(2178) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080079 begin');
      const result: string = ResourceUtils.formatByteSize(2178);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080079 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080080
     * @tc.number SUB_RESMGR_UTILS_08_0080
     * @tc.desc   formatByteSize(2179) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080080 begin');
      const result: string = ResourceUtils.formatByteSize(2179);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080080 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080081
     * @tc.number SUB_RESMGR_UTILS_08_0081
     * @tc.desc   formatByteSize(2180) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080081 begin');
      const result: string = ResourceUtils.formatByteSize(2180);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080081 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080082
     * @tc.number SUB_RESMGR_UTILS_08_0082
     * @tc.desc   formatByteSize(2181) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080082 begin');
      const result: string = ResourceUtils.formatByteSize(2181);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080082 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080083
     * @tc.number SUB_RESMGR_UTILS_08_0083
     * @tc.desc   formatByteSize(2182) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080083 begin');
      const result: string = ResourceUtils.formatByteSize(2182);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080083 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080084
     * @tc.number SUB_RESMGR_UTILS_08_0084
     * @tc.desc   formatByteSize(2183) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080084 begin');
      const result: string = ResourceUtils.formatByteSize(2183);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080084 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080085
     * @tc.number SUB_RESMGR_UTILS_08_0085
     * @tc.desc   formatByteSize(2184) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080085 begin');
      const result: string = ResourceUtils.formatByteSize(2184);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080085 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080086
     * @tc.number SUB_RESMGR_UTILS_08_0086
     * @tc.desc   formatByteSize(2185) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080086 begin');
      const result: string = ResourceUtils.formatByteSize(2185);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080086 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080087
     * @tc.number SUB_RESMGR_UTILS_08_0087
     * @tc.desc   formatByteSize(2186) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080087 begin');
      const result: string = ResourceUtils.formatByteSize(2186);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080087 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080088
     * @tc.number SUB_RESMGR_UTILS_08_0088
     * @tc.desc   formatByteSize(2187) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080088 begin');
      const result: string = ResourceUtils.formatByteSize(2187);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080088 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080089
     * @tc.number SUB_RESMGR_UTILS_08_0089
     * @tc.desc   formatByteSize(2188) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080089 begin');
      const result: string = ResourceUtils.formatByteSize(2188);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080089 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080090
     * @tc.number SUB_RESMGR_UTILS_08_0090
     * @tc.desc   formatByteSize(2189) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080090 begin');
      const result: string = ResourceUtils.formatByteSize(2189);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080090 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080091
     * @tc.number SUB_RESMGR_UTILS_08_0091
     * @tc.desc   formatByteSize(2190) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080091 begin');
      const result: string = ResourceUtils.formatByteSize(2190);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080091 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080092
     * @tc.number SUB_RESMGR_UTILS_08_0092
     * @tc.desc   formatByteSize(2191) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080092 begin');
      const result: string = ResourceUtils.formatByteSize(2191);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080092 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080093
     * @tc.number SUB_RESMGR_UTILS_08_0093
     * @tc.desc   formatByteSize(2192) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080093 begin');
      const result: string = ResourceUtils.formatByteSize(2192);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080093 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080094
     * @tc.number SUB_RESMGR_UTILS_08_0094
     * @tc.desc   formatByteSize(2193) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080094 begin');
      const result: string = ResourceUtils.formatByteSize(2193);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080094 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB080095
     * @tc.number SUB_RESMGR_UTILS_08_0095
     * @tc.desc   formatByteSize(2194) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB080095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080095 begin');
      const result: string = ResourceUtils.formatByteSize(2194);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB080095 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB0896
     * @tc.number SUB_RESMGR_UTILS_08_0096
     * @tc.desc   KB 区间内的舍入与单位切换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB0896', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB0896 begin');
      expect(ResourceUtils.formatByteSize(1023)).assertEqual('1023 B');
      expect(ResourceUtils.formatByteSize(2100)).assertEqual('2.0 KB');
      expect(ResourceUtils.formatByteSize(2559)).assertEqual('2.4 KB');
      expect(ResourceUtils.formatByteSize(2560)).assertEqual('2.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB0896 end');
    })
  })
}
