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

export default function resourceUtilsBytesB09Test() {
  describe('ResourceUtilsBytesB09Test', () => {

    /**
     * @tc.name   testResourceUtilsBytesB090001
     * @tc.number SUB_RESMGR_UTILS_09_0001
     * @tc.desc   formatByteSize(50000) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090001 begin');
      const result: string = ResourceUtils.formatByteSize(50000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090001 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090002
     * @tc.number SUB_RESMGR_UTILS_09_0002
     * @tc.desc   formatByteSize(50001) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090002 begin');
      const result: string = ResourceUtils.formatByteSize(50001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090002 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090003
     * @tc.number SUB_RESMGR_UTILS_09_0003
     * @tc.desc   formatByteSize(50002) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090003 begin');
      const result: string = ResourceUtils.formatByteSize(50002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090003 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090004
     * @tc.number SUB_RESMGR_UTILS_09_0004
     * @tc.desc   formatByteSize(50003) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090004 begin');
      const result: string = ResourceUtils.formatByteSize(50003);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090004 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090005
     * @tc.number SUB_RESMGR_UTILS_09_0005
     * @tc.desc   formatByteSize(50004) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090005 begin');
      const result: string = ResourceUtils.formatByteSize(50004);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090005 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090006
     * @tc.number SUB_RESMGR_UTILS_09_0006
     * @tc.desc   formatByteSize(50005) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090006 begin');
      const result: string = ResourceUtils.formatByteSize(50005);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090006 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090007
     * @tc.number SUB_RESMGR_UTILS_09_0007
     * @tc.desc   formatByteSize(50006) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090007 begin');
      const result: string = ResourceUtils.formatByteSize(50006);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090007 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090008
     * @tc.number SUB_RESMGR_UTILS_09_0008
     * @tc.desc   formatByteSize(50007) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090008 begin');
      const result: string = ResourceUtils.formatByteSize(50007);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090008 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090009
     * @tc.number SUB_RESMGR_UTILS_09_0009
     * @tc.desc   formatByteSize(50008) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090009 begin');
      const result: string = ResourceUtils.formatByteSize(50008);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090009 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090010
     * @tc.number SUB_RESMGR_UTILS_09_0010
     * @tc.desc   formatByteSize(50009) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090010 begin');
      const result: string = ResourceUtils.formatByteSize(50009);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090010 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090011
     * @tc.number SUB_RESMGR_UTILS_09_0011
     * @tc.desc   formatByteSize(50010) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090011 begin');
      const result: string = ResourceUtils.formatByteSize(50010);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090011 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090012
     * @tc.number SUB_RESMGR_UTILS_09_0012
     * @tc.desc   formatByteSize(50011) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090012 begin');
      const result: string = ResourceUtils.formatByteSize(50011);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090012 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090013
     * @tc.number SUB_RESMGR_UTILS_09_0013
     * @tc.desc   formatByteSize(50012) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090013 begin');
      const result: string = ResourceUtils.formatByteSize(50012);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090013 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090014
     * @tc.number SUB_RESMGR_UTILS_09_0014
     * @tc.desc   formatByteSize(50013) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090014 begin');
      const result: string = ResourceUtils.formatByteSize(50013);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090014 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090015
     * @tc.number SUB_RESMGR_UTILS_09_0015
     * @tc.desc   formatByteSize(50014) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090015 begin');
      const result: string = ResourceUtils.formatByteSize(50014);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090015 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090016
     * @tc.number SUB_RESMGR_UTILS_09_0016
     * @tc.desc   formatByteSize(50015) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090016 begin');
      const result: string = ResourceUtils.formatByteSize(50015);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090016 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090017
     * @tc.number SUB_RESMGR_UTILS_09_0017
     * @tc.desc   formatByteSize(50016) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090017 begin');
      const result: string = ResourceUtils.formatByteSize(50016);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090017 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090018
     * @tc.number SUB_RESMGR_UTILS_09_0018
     * @tc.desc   formatByteSize(50017) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090018 begin');
      const result: string = ResourceUtils.formatByteSize(50017);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090018 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090019
     * @tc.number SUB_RESMGR_UTILS_09_0019
     * @tc.desc   formatByteSize(50018) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090019 begin');
      const result: string = ResourceUtils.formatByteSize(50018);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090019 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090020
     * @tc.number SUB_RESMGR_UTILS_09_0020
     * @tc.desc   formatByteSize(50019) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090020 begin');
      const result: string = ResourceUtils.formatByteSize(50019);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090020 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090021
     * @tc.number SUB_RESMGR_UTILS_09_0021
     * @tc.desc   formatByteSize(50020) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090021 begin');
      const result: string = ResourceUtils.formatByteSize(50020);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090021 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090022
     * @tc.number SUB_RESMGR_UTILS_09_0022
     * @tc.desc   formatByteSize(50021) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090022 begin');
      const result: string = ResourceUtils.formatByteSize(50021);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090022 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090023
     * @tc.number SUB_RESMGR_UTILS_09_0023
     * @tc.desc   formatByteSize(50022) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090023 begin');
      const result: string = ResourceUtils.formatByteSize(50022);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090023 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090024
     * @tc.number SUB_RESMGR_UTILS_09_0024
     * @tc.desc   formatByteSize(50023) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090024 begin');
      const result: string = ResourceUtils.formatByteSize(50023);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090024 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090025
     * @tc.number SUB_RESMGR_UTILS_09_0025
     * @tc.desc   formatByteSize(50024) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090025 begin');
      const result: string = ResourceUtils.formatByteSize(50024);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090025 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090026
     * @tc.number SUB_RESMGR_UTILS_09_0026
     * @tc.desc   formatByteSize(50025) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090026 begin');
      const result: string = ResourceUtils.formatByteSize(50025);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090026 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090027
     * @tc.number SUB_RESMGR_UTILS_09_0027
     * @tc.desc   formatByteSize(50026) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090027 begin');
      const result: string = ResourceUtils.formatByteSize(50026);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090027 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090028
     * @tc.number SUB_RESMGR_UTILS_09_0028
     * @tc.desc   formatByteSize(50027) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090028 begin');
      const result: string = ResourceUtils.formatByteSize(50027);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090028 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090029
     * @tc.number SUB_RESMGR_UTILS_09_0029
     * @tc.desc   formatByteSize(50028) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090029 begin');
      const result: string = ResourceUtils.formatByteSize(50028);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090029 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090030
     * @tc.number SUB_RESMGR_UTILS_09_0030
     * @tc.desc   formatByteSize(50029) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090030 begin');
      const result: string = ResourceUtils.formatByteSize(50029);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090030 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090031
     * @tc.number SUB_RESMGR_UTILS_09_0031
     * @tc.desc   formatByteSize(50030) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090031 begin');
      const result: string = ResourceUtils.formatByteSize(50030);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090031 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090032
     * @tc.number SUB_RESMGR_UTILS_09_0032
     * @tc.desc   formatByteSize(50031) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090032 begin');
      const result: string = ResourceUtils.formatByteSize(50031);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090032 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090033
     * @tc.number SUB_RESMGR_UTILS_09_0033
     * @tc.desc   formatByteSize(50032) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090033 begin');
      const result: string = ResourceUtils.formatByteSize(50032);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090033 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090034
     * @tc.number SUB_RESMGR_UTILS_09_0034
     * @tc.desc   formatByteSize(50033) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090034 begin');
      const result: string = ResourceUtils.formatByteSize(50033);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090034 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090035
     * @tc.number SUB_RESMGR_UTILS_09_0035
     * @tc.desc   formatByteSize(50034) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090035 begin');
      const result: string = ResourceUtils.formatByteSize(50034);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090035 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090036
     * @tc.number SUB_RESMGR_UTILS_09_0036
     * @tc.desc   formatByteSize(50035) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090036 begin');
      const result: string = ResourceUtils.formatByteSize(50035);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090036 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090037
     * @tc.number SUB_RESMGR_UTILS_09_0037
     * @tc.desc   formatByteSize(50036) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090037 begin');
      const result: string = ResourceUtils.formatByteSize(50036);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090037 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090038
     * @tc.number SUB_RESMGR_UTILS_09_0038
     * @tc.desc   formatByteSize(50037) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090038 begin');
      const result: string = ResourceUtils.formatByteSize(50037);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090038 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090039
     * @tc.number SUB_RESMGR_UTILS_09_0039
     * @tc.desc   formatByteSize(50038) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090039 begin');
      const result: string = ResourceUtils.formatByteSize(50038);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090039 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090040
     * @tc.number SUB_RESMGR_UTILS_09_0040
     * @tc.desc   formatByteSize(50039) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090040 begin');
      const result: string = ResourceUtils.formatByteSize(50039);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090040 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090041
     * @tc.number SUB_RESMGR_UTILS_09_0041
     * @tc.desc   formatByteSize(50040) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090041 begin');
      const result: string = ResourceUtils.formatByteSize(50040);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090041 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090042
     * @tc.number SUB_RESMGR_UTILS_09_0042
     * @tc.desc   formatByteSize(50041) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090042 begin');
      const result: string = ResourceUtils.formatByteSize(50041);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090042 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090043
     * @tc.number SUB_RESMGR_UTILS_09_0043
     * @tc.desc   formatByteSize(50042) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090043 begin');
      const result: string = ResourceUtils.formatByteSize(50042);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090043 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090044
     * @tc.number SUB_RESMGR_UTILS_09_0044
     * @tc.desc   formatByteSize(50043) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090044 begin');
      const result: string = ResourceUtils.formatByteSize(50043);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090044 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090045
     * @tc.number SUB_RESMGR_UTILS_09_0045
     * @tc.desc   formatByteSize(50044) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090045 begin');
      const result: string = ResourceUtils.formatByteSize(50044);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090045 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090046
     * @tc.number SUB_RESMGR_UTILS_09_0046
     * @tc.desc   formatByteSize(50045) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090046 begin');
      const result: string = ResourceUtils.formatByteSize(50045);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090046 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090047
     * @tc.number SUB_RESMGR_UTILS_09_0047
     * @tc.desc   formatByteSize(50046) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090047 begin');
      const result: string = ResourceUtils.formatByteSize(50046);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090047 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090048
     * @tc.number SUB_RESMGR_UTILS_09_0048
     * @tc.desc   formatByteSize(50047) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090048 begin');
      const result: string = ResourceUtils.formatByteSize(50047);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090048 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090049
     * @tc.number SUB_RESMGR_UTILS_09_0049
     * @tc.desc   formatByteSize(50048) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090049 begin');
      const result: string = ResourceUtils.formatByteSize(50048);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090049 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090050
     * @tc.number SUB_RESMGR_UTILS_09_0050
     * @tc.desc   formatByteSize(50049) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090050 begin');
      const result: string = ResourceUtils.formatByteSize(50049);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090050 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090051
     * @tc.number SUB_RESMGR_UTILS_09_0051
     * @tc.desc   formatByteSize(50050) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090051 begin');
      const result: string = ResourceUtils.formatByteSize(50050);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090051 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090052
     * @tc.number SUB_RESMGR_UTILS_09_0052
     * @tc.desc   formatByteSize(50051) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090052 begin');
      const result: string = ResourceUtils.formatByteSize(50051);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090052 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090053
     * @tc.number SUB_RESMGR_UTILS_09_0053
     * @tc.desc   formatByteSize(50052) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090053 begin');
      const result: string = ResourceUtils.formatByteSize(50052);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090053 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090054
     * @tc.number SUB_RESMGR_UTILS_09_0054
     * @tc.desc   formatByteSize(50053) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090054 begin');
      const result: string = ResourceUtils.formatByteSize(50053);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090054 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090055
     * @tc.number SUB_RESMGR_UTILS_09_0055
     * @tc.desc   formatByteSize(50054) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090055 begin');
      const result: string = ResourceUtils.formatByteSize(50054);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090055 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090056
     * @tc.number SUB_RESMGR_UTILS_09_0056
     * @tc.desc   formatByteSize(50055) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090056 begin');
      const result: string = ResourceUtils.formatByteSize(50055);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090056 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090057
     * @tc.number SUB_RESMGR_UTILS_09_0057
     * @tc.desc   formatByteSize(50056) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090057 begin');
      const result: string = ResourceUtils.formatByteSize(50056);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090057 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090058
     * @tc.number SUB_RESMGR_UTILS_09_0058
     * @tc.desc   formatByteSize(50057) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090058 begin');
      const result: string = ResourceUtils.formatByteSize(50057);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090058 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090059
     * @tc.number SUB_RESMGR_UTILS_09_0059
     * @tc.desc   formatByteSize(50058) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090059 begin');
      const result: string = ResourceUtils.formatByteSize(50058);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090059 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090060
     * @tc.number SUB_RESMGR_UTILS_09_0060
     * @tc.desc   formatByteSize(50059) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090060 begin');
      const result: string = ResourceUtils.formatByteSize(50059);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090060 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090061
     * @tc.number SUB_RESMGR_UTILS_09_0061
     * @tc.desc   formatByteSize(50060) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090061 begin');
      const result: string = ResourceUtils.formatByteSize(50060);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090061 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090062
     * @tc.number SUB_RESMGR_UTILS_09_0062
     * @tc.desc   formatByteSize(50061) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090062 begin');
      const result: string = ResourceUtils.formatByteSize(50061);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090062 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090063
     * @tc.number SUB_RESMGR_UTILS_09_0063
     * @tc.desc   formatByteSize(50062) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090063 begin');
      const result: string = ResourceUtils.formatByteSize(50062);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090063 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090064
     * @tc.number SUB_RESMGR_UTILS_09_0064
     * @tc.desc   formatByteSize(50063) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090064 begin');
      const result: string = ResourceUtils.formatByteSize(50063);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090064 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090065
     * @tc.number SUB_RESMGR_UTILS_09_0065
     * @tc.desc   formatByteSize(50064) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090065 begin');
      const result: string = ResourceUtils.formatByteSize(50064);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090065 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090066
     * @tc.number SUB_RESMGR_UTILS_09_0066
     * @tc.desc   formatByteSize(50065) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090066 begin');
      const result: string = ResourceUtils.formatByteSize(50065);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090066 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090067
     * @tc.number SUB_RESMGR_UTILS_09_0067
     * @tc.desc   formatByteSize(50066) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090067 begin');
      const result: string = ResourceUtils.formatByteSize(50066);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090067 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090068
     * @tc.number SUB_RESMGR_UTILS_09_0068
     * @tc.desc   formatByteSize(50067) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090068 begin');
      const result: string = ResourceUtils.formatByteSize(50067);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090068 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090069
     * @tc.number SUB_RESMGR_UTILS_09_0069
     * @tc.desc   formatByteSize(50068) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090069 begin');
      const result: string = ResourceUtils.formatByteSize(50068);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090069 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090070
     * @tc.number SUB_RESMGR_UTILS_09_0070
     * @tc.desc   formatByteSize(50069) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090070 begin');
      const result: string = ResourceUtils.formatByteSize(50069);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090070 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090071
     * @tc.number SUB_RESMGR_UTILS_09_0071
     * @tc.desc   formatByteSize(50070) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090071 begin');
      const result: string = ResourceUtils.formatByteSize(50070);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090071 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090072
     * @tc.number SUB_RESMGR_UTILS_09_0072
     * @tc.desc   formatByteSize(50071) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090072 begin');
      const result: string = ResourceUtils.formatByteSize(50071);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090072 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090073
     * @tc.number SUB_RESMGR_UTILS_09_0073
     * @tc.desc   formatByteSize(50072) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090073 begin');
      const result: string = ResourceUtils.formatByteSize(50072);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090073 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090074
     * @tc.number SUB_RESMGR_UTILS_09_0074
     * @tc.desc   formatByteSize(50073) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090074 begin');
      const result: string = ResourceUtils.formatByteSize(50073);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090074 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090075
     * @tc.number SUB_RESMGR_UTILS_09_0075
     * @tc.desc   formatByteSize(50074) renders 48.9 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090075 begin');
      const result: string = ResourceUtils.formatByteSize(50074);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.9 KB'));
      expect(result).assertEqual('48.9 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090075 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090076
     * @tc.number SUB_RESMGR_UTILS_09_0076
     * @tc.desc   formatByteSize(50075) renders 48.9 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090076 begin');
      const result: string = ResourceUtils.formatByteSize(50075);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.9 KB'));
      expect(result).assertEqual('48.9 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090076 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090077
     * @tc.number SUB_RESMGR_UTILS_09_0077
     * @tc.desc   formatByteSize(50076) renders 48.9 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090077 begin');
      const result: string = ResourceUtils.formatByteSize(50076);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.9 KB'));
      expect(result).assertEqual('48.9 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090077 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090078
     * @tc.number SUB_RESMGR_UTILS_09_0078
     * @tc.desc   formatByteSize(50077) renders 48.9 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090078 begin');
      const result: string = ResourceUtils.formatByteSize(50077);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.9 KB'));
      expect(result).assertEqual('48.9 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090078 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090079
     * @tc.number SUB_RESMGR_UTILS_09_0079
     * @tc.desc   formatByteSize(50078) renders 48.9 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090079 begin');
      const result: string = ResourceUtils.formatByteSize(50078);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.9 KB'));
      expect(result).assertEqual('48.9 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090079 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090080
     * @tc.number SUB_RESMGR_UTILS_09_0080
     * @tc.desc   formatByteSize(50079) renders 48.9 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090080 begin');
      const result: string = ResourceUtils.formatByteSize(50079);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.9 KB'));
      expect(result).assertEqual('48.9 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090080 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090081
     * @tc.number SUB_RESMGR_UTILS_09_0081
     * @tc.desc   formatByteSize(50080) renders 48.9 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090081 begin');
      const result: string = ResourceUtils.formatByteSize(50080);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.9 KB'));
      expect(result).assertEqual('48.9 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090081 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090082
     * @tc.number SUB_RESMGR_UTILS_09_0082
     * @tc.desc   formatByteSize(50081) renders 48.9 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090082 begin');
      const result: string = ResourceUtils.formatByteSize(50081);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.9 KB'));
      expect(result).assertEqual('48.9 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090082 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090083
     * @tc.number SUB_RESMGR_UTILS_09_0083
     * @tc.desc   formatByteSize(50082) renders 48.9 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090083 begin');
      const result: string = ResourceUtils.formatByteSize(50082);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.9 KB'));
      expect(result).assertEqual('48.9 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090083 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090084
     * @tc.number SUB_RESMGR_UTILS_09_0084
     * @tc.desc   formatByteSize(50083) renders 48.9 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090084 begin');
      const result: string = ResourceUtils.formatByteSize(50083);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.9 KB'));
      expect(result).assertEqual('48.9 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090084 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090085
     * @tc.number SUB_RESMGR_UTILS_09_0085
     * @tc.desc   formatByteSize(50084) renders 48.9 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090085 begin');
      const result: string = ResourceUtils.formatByteSize(50084);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.9 KB'));
      expect(result).assertEqual('48.9 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090085 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090086
     * @tc.number SUB_RESMGR_UTILS_09_0086
     * @tc.desc   formatByteSize(50085) renders 48.9 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090086 begin');
      const result: string = ResourceUtils.formatByteSize(50085);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.9 KB'));
      expect(result).assertEqual('48.9 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090086 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090087
     * @tc.number SUB_RESMGR_UTILS_09_0087
     * @tc.desc   formatByteSize(50086) renders 48.9 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090087 begin');
      const result: string = ResourceUtils.formatByteSize(50086);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.9 KB'));
      expect(result).assertEqual('48.9 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090087 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090088
     * @tc.number SUB_RESMGR_UTILS_09_0088
     * @tc.desc   formatByteSize(50087) renders 48.9 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090088 begin');
      const result: string = ResourceUtils.formatByteSize(50087);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.9 KB'));
      expect(result).assertEqual('48.9 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090088 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090089
     * @tc.number SUB_RESMGR_UTILS_09_0089
     * @tc.desc   formatByteSize(50088) renders 48.9 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090089 begin');
      const result: string = ResourceUtils.formatByteSize(50088);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.9 KB'));
      expect(result).assertEqual('48.9 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090089 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090090
     * @tc.number SUB_RESMGR_UTILS_09_0090
     * @tc.desc   formatByteSize(50089) renders 48.9 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090090 begin');
      const result: string = ResourceUtils.formatByteSize(50089);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.9 KB'));
      expect(result).assertEqual('48.9 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090090 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090091
     * @tc.number SUB_RESMGR_UTILS_09_0091
     * @tc.desc   formatByteSize(50090) renders 48.9 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090091 begin');
      const result: string = ResourceUtils.formatByteSize(50090);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.9 KB'));
      expect(result).assertEqual('48.9 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090091 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090092
     * @tc.number SUB_RESMGR_UTILS_09_0092
     * @tc.desc   formatByteSize(50091) renders 48.9 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090092 begin');
      const result: string = ResourceUtils.formatByteSize(50091);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.9 KB'));
      expect(result).assertEqual('48.9 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090092 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090093
     * @tc.number SUB_RESMGR_UTILS_09_0093
     * @tc.desc   formatByteSize(50092) renders 48.9 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090093 begin');
      const result: string = ResourceUtils.formatByteSize(50092);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.9 KB'));
      expect(result).assertEqual('48.9 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090093 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090094
     * @tc.number SUB_RESMGR_UTILS_09_0094
     * @tc.desc   formatByteSize(50093) renders 48.9 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090094 begin');
      const result: string = ResourceUtils.formatByteSize(50093);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.9 KB'));
      expect(result).assertEqual('48.9 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090094 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB090095
     * @tc.number SUB_RESMGR_UTILS_09_0095
     * @tc.desc   formatByteSize(50094) renders 48.9 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB090095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090095 begin');
      const result: string = ResourceUtils.formatByteSize(50094);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.9 KB'));
      expect(result).assertEqual('48.9 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB090095 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB0996
     * @tc.number SUB_RESMGR_UTILS_09_0096
     * @tc.desc   十进制进位前的向下舍入
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB0996', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB0996 begin');
      expect(ResourceUtils.formatByteSize(50000)).assertEqual('48.8 KB');
      expect(ResourceUtils.formatByteSize(65535)).assertEqual('63.9 KB');
      expect(ResourceUtils.formatByteSize(65536)).assertEqual('64.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB0996 end');
    })
  })
}
