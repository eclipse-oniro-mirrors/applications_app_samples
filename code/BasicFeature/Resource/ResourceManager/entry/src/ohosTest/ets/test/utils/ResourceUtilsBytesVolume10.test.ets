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

export default function resourceUtilsBytesB10Test() {
  describe('ResourceUtilsBytesB10Test', () => {

    /**
     * @tc.name   testResourceUtilsBytesB100001
     * @tc.number SUB_RESMGR_UTILS_10_0001
     * @tc.desc   formatByteSize(1048000) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100001 begin');
      const result: string = ResourceUtils.formatByteSize(1048000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100001 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100002
     * @tc.number SUB_RESMGR_UTILS_10_0002
     * @tc.desc   formatByteSize(1048001) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100002 begin');
      const result: string = ResourceUtils.formatByteSize(1048001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100002 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100003
     * @tc.number SUB_RESMGR_UTILS_10_0003
     * @tc.desc   formatByteSize(1048002) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100003 begin');
      const result: string = ResourceUtils.formatByteSize(1048002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100003 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100004
     * @tc.number SUB_RESMGR_UTILS_10_0004
     * @tc.desc   formatByteSize(1048003) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100004 begin');
      const result: string = ResourceUtils.formatByteSize(1048003);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100004 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100005
     * @tc.number SUB_RESMGR_UTILS_10_0005
     * @tc.desc   formatByteSize(1048004) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100005 begin');
      const result: string = ResourceUtils.formatByteSize(1048004);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100005 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100006
     * @tc.number SUB_RESMGR_UTILS_10_0006
     * @tc.desc   formatByteSize(1048005) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100006 begin');
      const result: string = ResourceUtils.formatByteSize(1048005);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100006 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100007
     * @tc.number SUB_RESMGR_UTILS_10_0007
     * @tc.desc   formatByteSize(1048006) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100007 begin');
      const result: string = ResourceUtils.formatByteSize(1048006);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100007 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100008
     * @tc.number SUB_RESMGR_UTILS_10_0008
     * @tc.desc   formatByteSize(1048007) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100008 begin');
      const result: string = ResourceUtils.formatByteSize(1048007);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100008 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100009
     * @tc.number SUB_RESMGR_UTILS_10_0009
     * @tc.desc   formatByteSize(1048008) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100009 begin');
      const result: string = ResourceUtils.formatByteSize(1048008);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100009 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100010
     * @tc.number SUB_RESMGR_UTILS_10_0010
     * @tc.desc   formatByteSize(1048009) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100010 begin');
      const result: string = ResourceUtils.formatByteSize(1048009);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100010 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100011
     * @tc.number SUB_RESMGR_UTILS_10_0011
     * @tc.desc   formatByteSize(1048010) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100011 begin');
      const result: string = ResourceUtils.formatByteSize(1048010);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100011 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100012
     * @tc.number SUB_RESMGR_UTILS_10_0012
     * @tc.desc   formatByteSize(1048011) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100012 begin');
      const result: string = ResourceUtils.formatByteSize(1048011);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100012 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100013
     * @tc.number SUB_RESMGR_UTILS_10_0013
     * @tc.desc   formatByteSize(1048012) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100013 begin');
      const result: string = ResourceUtils.formatByteSize(1048012);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100013 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100014
     * @tc.number SUB_RESMGR_UTILS_10_0014
     * @tc.desc   formatByteSize(1048013) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100014 begin');
      const result: string = ResourceUtils.formatByteSize(1048013);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100014 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100015
     * @tc.number SUB_RESMGR_UTILS_10_0015
     * @tc.desc   formatByteSize(1048014) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100015 begin');
      const result: string = ResourceUtils.formatByteSize(1048014);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100015 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100016
     * @tc.number SUB_RESMGR_UTILS_10_0016
     * @tc.desc   formatByteSize(1048015) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100016 begin');
      const result: string = ResourceUtils.formatByteSize(1048015);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100016 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100017
     * @tc.number SUB_RESMGR_UTILS_10_0017
     * @tc.desc   formatByteSize(1048016) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100017 begin');
      const result: string = ResourceUtils.formatByteSize(1048016);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100017 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100018
     * @tc.number SUB_RESMGR_UTILS_10_0018
     * @tc.desc   formatByteSize(1048017) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100018 begin');
      const result: string = ResourceUtils.formatByteSize(1048017);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100018 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100019
     * @tc.number SUB_RESMGR_UTILS_10_0019
     * @tc.desc   formatByteSize(1048018) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100019 begin');
      const result: string = ResourceUtils.formatByteSize(1048018);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100019 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100020
     * @tc.number SUB_RESMGR_UTILS_10_0020
     * @tc.desc   formatByteSize(1048019) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100020 begin');
      const result: string = ResourceUtils.formatByteSize(1048019);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100020 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100021
     * @tc.number SUB_RESMGR_UTILS_10_0021
     * @tc.desc   formatByteSize(1048020) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100021 begin');
      const result: string = ResourceUtils.formatByteSize(1048020);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100021 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100022
     * @tc.number SUB_RESMGR_UTILS_10_0022
     * @tc.desc   formatByteSize(1048021) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100022 begin');
      const result: string = ResourceUtils.formatByteSize(1048021);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100022 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100023
     * @tc.number SUB_RESMGR_UTILS_10_0023
     * @tc.desc   formatByteSize(1048022) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100023 begin');
      const result: string = ResourceUtils.formatByteSize(1048022);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100023 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100024
     * @tc.number SUB_RESMGR_UTILS_10_0024
     * @tc.desc   formatByteSize(1048023) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100024 begin');
      const result: string = ResourceUtils.formatByteSize(1048023);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100024 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100025
     * @tc.number SUB_RESMGR_UTILS_10_0025
     * @tc.desc   formatByteSize(1048024) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100025 begin');
      const result: string = ResourceUtils.formatByteSize(1048024);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100025 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100026
     * @tc.number SUB_RESMGR_UTILS_10_0026
     * @tc.desc   formatByteSize(1048025) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100026 begin');
      const result: string = ResourceUtils.formatByteSize(1048025);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100026 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100027
     * @tc.number SUB_RESMGR_UTILS_10_0027
     * @tc.desc   formatByteSize(1048026) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100027 begin');
      const result: string = ResourceUtils.formatByteSize(1048026);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100027 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100028
     * @tc.number SUB_RESMGR_UTILS_10_0028
     * @tc.desc   formatByteSize(1048027) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100028 begin');
      const result: string = ResourceUtils.formatByteSize(1048027);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100028 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100029
     * @tc.number SUB_RESMGR_UTILS_10_0029
     * @tc.desc   formatByteSize(1048028) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100029 begin');
      const result: string = ResourceUtils.formatByteSize(1048028);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100029 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100030
     * @tc.number SUB_RESMGR_UTILS_10_0030
     * @tc.desc   formatByteSize(1048029) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100030 begin');
      const result: string = ResourceUtils.formatByteSize(1048029);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100030 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100031
     * @tc.number SUB_RESMGR_UTILS_10_0031
     * @tc.desc   formatByteSize(1048030) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100031 begin');
      const result: string = ResourceUtils.formatByteSize(1048030);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100031 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100032
     * @tc.number SUB_RESMGR_UTILS_10_0032
     * @tc.desc   formatByteSize(1048031) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100032 begin');
      const result: string = ResourceUtils.formatByteSize(1048031);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100032 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100033
     * @tc.number SUB_RESMGR_UTILS_10_0033
     * @tc.desc   formatByteSize(1048032) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100033 begin');
      const result: string = ResourceUtils.formatByteSize(1048032);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100033 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100034
     * @tc.number SUB_RESMGR_UTILS_10_0034
     * @tc.desc   formatByteSize(1048033) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100034 begin');
      const result: string = ResourceUtils.formatByteSize(1048033);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100034 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100035
     * @tc.number SUB_RESMGR_UTILS_10_0035
     * @tc.desc   formatByteSize(1048034) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100035 begin');
      const result: string = ResourceUtils.formatByteSize(1048034);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100035 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100036
     * @tc.number SUB_RESMGR_UTILS_10_0036
     * @tc.desc   formatByteSize(1048035) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100036 begin');
      const result: string = ResourceUtils.formatByteSize(1048035);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100036 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100037
     * @tc.number SUB_RESMGR_UTILS_10_0037
     * @tc.desc   formatByteSize(1048036) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100037 begin');
      const result: string = ResourceUtils.formatByteSize(1048036);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100037 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100038
     * @tc.number SUB_RESMGR_UTILS_10_0038
     * @tc.desc   formatByteSize(1048037) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100038 begin');
      const result: string = ResourceUtils.formatByteSize(1048037);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100038 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100039
     * @tc.number SUB_RESMGR_UTILS_10_0039
     * @tc.desc   formatByteSize(1048038) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100039 begin');
      const result: string = ResourceUtils.formatByteSize(1048038);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100039 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100040
     * @tc.number SUB_RESMGR_UTILS_10_0040
     * @tc.desc   formatByteSize(1048039) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100040 begin');
      const result: string = ResourceUtils.formatByteSize(1048039);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100040 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100041
     * @tc.number SUB_RESMGR_UTILS_10_0041
     * @tc.desc   formatByteSize(1048040) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100041 begin');
      const result: string = ResourceUtils.formatByteSize(1048040);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100041 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100042
     * @tc.number SUB_RESMGR_UTILS_10_0042
     * @tc.desc   formatByteSize(1048041) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100042 begin');
      const result: string = ResourceUtils.formatByteSize(1048041);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100042 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100043
     * @tc.number SUB_RESMGR_UTILS_10_0043
     * @tc.desc   formatByteSize(1048042) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100043 begin');
      const result: string = ResourceUtils.formatByteSize(1048042);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100043 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100044
     * @tc.number SUB_RESMGR_UTILS_10_0044
     * @tc.desc   formatByteSize(1048043) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100044 begin');
      const result: string = ResourceUtils.formatByteSize(1048043);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100044 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100045
     * @tc.number SUB_RESMGR_UTILS_10_0045
     * @tc.desc   formatByteSize(1048044) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100045 begin');
      const result: string = ResourceUtils.formatByteSize(1048044);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100045 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100046
     * @tc.number SUB_RESMGR_UTILS_10_0046
     * @tc.desc   formatByteSize(1048045) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100046 begin');
      const result: string = ResourceUtils.formatByteSize(1048045);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100046 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100047
     * @tc.number SUB_RESMGR_UTILS_10_0047
     * @tc.desc   formatByteSize(1048046) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100047 begin');
      const result: string = ResourceUtils.formatByteSize(1048046);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100047 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100048
     * @tc.number SUB_RESMGR_UTILS_10_0048
     * @tc.desc   formatByteSize(1048047) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100048 begin');
      const result: string = ResourceUtils.formatByteSize(1048047);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100048 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100049
     * @tc.number SUB_RESMGR_UTILS_10_0049
     * @tc.desc   formatByteSize(1048048) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100049 begin');
      const result: string = ResourceUtils.formatByteSize(1048048);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100049 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100050
     * @tc.number SUB_RESMGR_UTILS_10_0050
     * @tc.desc   formatByteSize(1048049) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100050 begin');
      const result: string = ResourceUtils.formatByteSize(1048049);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100050 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100051
     * @tc.number SUB_RESMGR_UTILS_10_0051
     * @tc.desc   formatByteSize(1048050) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100051 begin');
      const result: string = ResourceUtils.formatByteSize(1048050);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100051 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100052
     * @tc.number SUB_RESMGR_UTILS_10_0052
     * @tc.desc   formatByteSize(1048051) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100052 begin');
      const result: string = ResourceUtils.formatByteSize(1048051);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100052 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100053
     * @tc.number SUB_RESMGR_UTILS_10_0053
     * @tc.desc   formatByteSize(1048052) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100053 begin');
      const result: string = ResourceUtils.formatByteSize(1048052);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100053 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100054
     * @tc.number SUB_RESMGR_UTILS_10_0054
     * @tc.desc   formatByteSize(1048053) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100054 begin');
      const result: string = ResourceUtils.formatByteSize(1048053);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100054 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100055
     * @tc.number SUB_RESMGR_UTILS_10_0055
     * @tc.desc   formatByteSize(1048054) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100055 begin');
      const result: string = ResourceUtils.formatByteSize(1048054);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100055 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100056
     * @tc.number SUB_RESMGR_UTILS_10_0056
     * @tc.desc   formatByteSize(1048055) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100056 begin');
      const result: string = ResourceUtils.formatByteSize(1048055);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100056 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100057
     * @tc.number SUB_RESMGR_UTILS_10_0057
     * @tc.desc   formatByteSize(1048056) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100057 begin');
      const result: string = ResourceUtils.formatByteSize(1048056);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100057 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100058
     * @tc.number SUB_RESMGR_UTILS_10_0058
     * @tc.desc   formatByteSize(1048057) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100058 begin');
      const result: string = ResourceUtils.formatByteSize(1048057);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100058 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100059
     * @tc.number SUB_RESMGR_UTILS_10_0059
     * @tc.desc   formatByteSize(1048058) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100059 begin');
      const result: string = ResourceUtils.formatByteSize(1048058);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100059 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100060
     * @tc.number SUB_RESMGR_UTILS_10_0060
     * @tc.desc   formatByteSize(1048059) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100060 begin');
      const result: string = ResourceUtils.formatByteSize(1048059);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100060 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100061
     * @tc.number SUB_RESMGR_UTILS_10_0061
     * @tc.desc   formatByteSize(1048060) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100061 begin');
      const result: string = ResourceUtils.formatByteSize(1048060);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100061 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100062
     * @tc.number SUB_RESMGR_UTILS_10_0062
     * @tc.desc   formatByteSize(1048061) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100062 begin');
      const result: string = ResourceUtils.formatByteSize(1048061);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100062 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100063
     * @tc.number SUB_RESMGR_UTILS_10_0063
     * @tc.desc   formatByteSize(1048062) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100063 begin');
      const result: string = ResourceUtils.formatByteSize(1048062);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100063 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100064
     * @tc.number SUB_RESMGR_UTILS_10_0064
     * @tc.desc   formatByteSize(1048063) renders 1023.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100064 begin');
      const result: string = ResourceUtils.formatByteSize(1048063);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.4 KB'));
      expect(result).assertEqual('1023.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100064 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100065
     * @tc.number SUB_RESMGR_UTILS_10_0065
     * @tc.desc   formatByteSize(1048064) renders 1023.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100065 begin');
      const result: string = ResourceUtils.formatByteSize(1048064);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.5 KB'));
      expect(result).assertEqual('1023.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100065 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100066
     * @tc.number SUB_RESMGR_UTILS_10_0066
     * @tc.desc   formatByteSize(1048065) renders 1023.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100066 begin');
      const result: string = ResourceUtils.formatByteSize(1048065);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.5 KB'));
      expect(result).assertEqual('1023.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100066 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100067
     * @tc.number SUB_RESMGR_UTILS_10_0067
     * @tc.desc   formatByteSize(1048066) renders 1023.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100067 begin');
      const result: string = ResourceUtils.formatByteSize(1048066);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.5 KB'));
      expect(result).assertEqual('1023.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100067 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100068
     * @tc.number SUB_RESMGR_UTILS_10_0068
     * @tc.desc   formatByteSize(1048067) renders 1023.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100068 begin');
      const result: string = ResourceUtils.formatByteSize(1048067);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.5 KB'));
      expect(result).assertEqual('1023.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100068 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100069
     * @tc.number SUB_RESMGR_UTILS_10_0069
     * @tc.desc   formatByteSize(1048068) renders 1023.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100069 begin');
      const result: string = ResourceUtils.formatByteSize(1048068);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.5 KB'));
      expect(result).assertEqual('1023.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100069 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100070
     * @tc.number SUB_RESMGR_UTILS_10_0070
     * @tc.desc   formatByteSize(1048069) renders 1023.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100070 begin');
      const result: string = ResourceUtils.formatByteSize(1048069);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.5 KB'));
      expect(result).assertEqual('1023.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100070 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100071
     * @tc.number SUB_RESMGR_UTILS_10_0071
     * @tc.desc   formatByteSize(1048070) renders 1023.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100071 begin');
      const result: string = ResourceUtils.formatByteSize(1048070);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.5 KB'));
      expect(result).assertEqual('1023.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100071 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100072
     * @tc.number SUB_RESMGR_UTILS_10_0072
     * @tc.desc   formatByteSize(1048071) renders 1023.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100072 begin');
      const result: string = ResourceUtils.formatByteSize(1048071);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.5 KB'));
      expect(result).assertEqual('1023.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100072 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100073
     * @tc.number SUB_RESMGR_UTILS_10_0073
     * @tc.desc   formatByteSize(1048072) renders 1023.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100073 begin');
      const result: string = ResourceUtils.formatByteSize(1048072);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.5 KB'));
      expect(result).assertEqual('1023.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100073 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100074
     * @tc.number SUB_RESMGR_UTILS_10_0074
     * @tc.desc   formatByteSize(1048073) renders 1023.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100074 begin');
      const result: string = ResourceUtils.formatByteSize(1048073);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.5 KB'));
      expect(result).assertEqual('1023.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100074 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100075
     * @tc.number SUB_RESMGR_UTILS_10_0075
     * @tc.desc   formatByteSize(1048074) renders 1023.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100075 begin');
      const result: string = ResourceUtils.formatByteSize(1048074);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.5 KB'));
      expect(result).assertEqual('1023.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100075 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100076
     * @tc.number SUB_RESMGR_UTILS_10_0076
     * @tc.desc   formatByteSize(1048075) renders 1023.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100076 begin');
      const result: string = ResourceUtils.formatByteSize(1048075);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.5 KB'));
      expect(result).assertEqual('1023.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100076 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100077
     * @tc.number SUB_RESMGR_UTILS_10_0077
     * @tc.desc   formatByteSize(1048076) renders 1023.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100077 begin');
      const result: string = ResourceUtils.formatByteSize(1048076);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.5 KB'));
      expect(result).assertEqual('1023.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100077 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100078
     * @tc.number SUB_RESMGR_UTILS_10_0078
     * @tc.desc   formatByteSize(1048077) renders 1023.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100078 begin');
      const result: string = ResourceUtils.formatByteSize(1048077);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.5 KB'));
      expect(result).assertEqual('1023.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100078 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100079
     * @tc.number SUB_RESMGR_UTILS_10_0079
     * @tc.desc   formatByteSize(1048078) renders 1023.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100079 begin');
      const result: string = ResourceUtils.formatByteSize(1048078);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.5 KB'));
      expect(result).assertEqual('1023.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100079 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100080
     * @tc.number SUB_RESMGR_UTILS_10_0080
     * @tc.desc   formatByteSize(1048079) renders 1023.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100080 begin');
      const result: string = ResourceUtils.formatByteSize(1048079);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.5 KB'));
      expect(result).assertEqual('1023.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100080 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100081
     * @tc.number SUB_RESMGR_UTILS_10_0081
     * @tc.desc   formatByteSize(1048080) renders 1023.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100081 begin');
      const result: string = ResourceUtils.formatByteSize(1048080);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.5 KB'));
      expect(result).assertEqual('1023.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100081 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100082
     * @tc.number SUB_RESMGR_UTILS_10_0082
     * @tc.desc   formatByteSize(1048081) renders 1023.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100082 begin');
      const result: string = ResourceUtils.formatByteSize(1048081);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.5 KB'));
      expect(result).assertEqual('1023.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100082 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100083
     * @tc.number SUB_RESMGR_UTILS_10_0083
     * @tc.desc   formatByteSize(1048082) renders 1023.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100083 begin');
      const result: string = ResourceUtils.formatByteSize(1048082);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.5 KB'));
      expect(result).assertEqual('1023.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100083 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100084
     * @tc.number SUB_RESMGR_UTILS_10_0084
     * @tc.desc   formatByteSize(1048083) renders 1023.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100084 begin');
      const result: string = ResourceUtils.formatByteSize(1048083);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.5 KB'));
      expect(result).assertEqual('1023.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100084 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100085
     * @tc.number SUB_RESMGR_UTILS_10_0085
     * @tc.desc   formatByteSize(1048084) renders 1023.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100085 begin');
      const result: string = ResourceUtils.formatByteSize(1048084);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.5 KB'));
      expect(result).assertEqual('1023.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100085 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100086
     * @tc.number SUB_RESMGR_UTILS_10_0086
     * @tc.desc   formatByteSize(1048085) renders 1023.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100086 begin');
      const result: string = ResourceUtils.formatByteSize(1048085);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.5 KB'));
      expect(result).assertEqual('1023.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100086 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100087
     * @tc.number SUB_RESMGR_UTILS_10_0087
     * @tc.desc   formatByteSize(1048086) renders 1023.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100087 begin');
      const result: string = ResourceUtils.formatByteSize(1048086);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.5 KB'));
      expect(result).assertEqual('1023.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100087 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100088
     * @tc.number SUB_RESMGR_UTILS_10_0088
     * @tc.desc   formatByteSize(1048087) renders 1023.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100088 begin');
      const result: string = ResourceUtils.formatByteSize(1048087);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.5 KB'));
      expect(result).assertEqual('1023.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100088 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100089
     * @tc.number SUB_RESMGR_UTILS_10_0089
     * @tc.desc   formatByteSize(1048088) renders 1023.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100089 begin');
      const result: string = ResourceUtils.formatByteSize(1048088);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.5 KB'));
      expect(result).assertEqual('1023.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100089 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100090
     * @tc.number SUB_RESMGR_UTILS_10_0090
     * @tc.desc   formatByteSize(1048089) renders 1023.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100090 begin');
      const result: string = ResourceUtils.formatByteSize(1048089);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.5 KB'));
      expect(result).assertEqual('1023.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100090 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100091
     * @tc.number SUB_RESMGR_UTILS_10_0091
     * @tc.desc   formatByteSize(1048090) renders 1023.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100091 begin');
      const result: string = ResourceUtils.formatByteSize(1048090);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.5 KB'));
      expect(result).assertEqual('1023.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100091 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100092
     * @tc.number SUB_RESMGR_UTILS_10_0092
     * @tc.desc   formatByteSize(1048091) renders 1023.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100092 begin');
      const result: string = ResourceUtils.formatByteSize(1048091);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.5 KB'));
      expect(result).assertEqual('1023.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100092 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100093
     * @tc.number SUB_RESMGR_UTILS_10_0093
     * @tc.desc   formatByteSize(1048092) renders 1023.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100093 begin');
      const result: string = ResourceUtils.formatByteSize(1048092);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.5 KB'));
      expect(result).assertEqual('1023.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100093 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100094
     * @tc.number SUB_RESMGR_UTILS_10_0094
     * @tc.desc   formatByteSize(1048093) renders 1023.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100094 begin');
      const result: string = ResourceUtils.formatByteSize(1048093);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.5 KB'));
      expect(result).assertEqual('1023.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100094 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB100095
     * @tc.number SUB_RESMGR_UTILS_10_0095
     * @tc.desc   formatByteSize(1048094) renders 1023.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB100095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100095 begin');
      const result: string = ResourceUtils.formatByteSize(1048094);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.5 KB'));
      expect(result).assertEqual('1023.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB100095 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesB1096
     * @tc.number SUB_RESMGR_UTILS_10_0096
     * @tc.desc   1 MB 进位点必须换单位
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesB1096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB1096 begin');
      expect(ResourceUtils.formatByteSize(1048575)).assertEqual('1023.9 KB');
      expect(ResourceUtils.formatByteSize(1048576)).assertEqual('1.0 MB');
      expect(ResourceUtils.formatByteSize(1572864)).assertEqual('1.5 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesB1096 end');
    })
  })
}
