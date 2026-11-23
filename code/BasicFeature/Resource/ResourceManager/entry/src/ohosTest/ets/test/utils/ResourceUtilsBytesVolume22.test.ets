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

export default function resourceUtilsBytesV22Test() {
  describe('ResourceUtilsBytesV22Test', () => {

    /**
     * @tc.name   testResourceUtilsBytesV220001
     * @tc.number SUB_RESMGR_UTILS22_0001
     * @tc.desc   字节数 1024 格式化为 1.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220001 begin');
      const result: string = ResourceUtils.formatByteSize(1024);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1.0 KB'));
      expect(result).assertEqual('1.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(1024)), String(1368));
      expect(ResourceUtils.expectedBase64Length(1024)).assertEqual(1368);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220001 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220002
     * @tc.number SUB_RESMGR_UTILS22_0002
     * @tc.desc   字节数 2048 格式化为 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220002 begin');
      const result: string = ResourceUtils.formatByteSize(2048);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(2048)), String(2732));
      expect(ResourceUtils.expectedBase64Length(2048)).assertEqual(2732);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220002 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220003
     * @tc.number SUB_RESMGR_UTILS22_0003
     * @tc.desc   字节数 3072 格式化为 3.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220003 begin');
      const result: string = ResourceUtils.formatByteSize(3072);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('3.0 KB'));
      expect(result).assertEqual('3.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(3072)), String(4096));
      expect(ResourceUtils.expectedBase64Length(3072)).assertEqual(4096);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220003 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220004
     * @tc.number SUB_RESMGR_UTILS22_0004
     * @tc.desc   字节数 4096 格式化为 4.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220004 begin');
      const result: string = ResourceUtils.formatByteSize(4096);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('4.0 KB'));
      expect(result).assertEqual('4.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(4096)), String(5464));
      expect(ResourceUtils.expectedBase64Length(4096)).assertEqual(5464);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220004 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220005
     * @tc.number SUB_RESMGR_UTILS22_0005
     * @tc.desc   字节数 5120 格式化为 5.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220005 begin');
      const result: string = ResourceUtils.formatByteSize(5120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('5.0 KB'));
      expect(result).assertEqual('5.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(5120)), String(6828));
      expect(ResourceUtils.expectedBase64Length(5120)).assertEqual(6828);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220005 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220006
     * @tc.number SUB_RESMGR_UTILS22_0006
     * @tc.desc   字节数 6144 格式化为 6.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220006 begin');
      const result: string = ResourceUtils.formatByteSize(6144);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('6.0 KB'));
      expect(result).assertEqual('6.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(6144)), String(8192));
      expect(ResourceUtils.expectedBase64Length(6144)).assertEqual(8192);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220006 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220007
     * @tc.number SUB_RESMGR_UTILS22_0007
     * @tc.desc   字节数 7168 格式化为 7.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220007 begin');
      const result: string = ResourceUtils.formatByteSize(7168);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('7.0 KB'));
      expect(result).assertEqual('7.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(7168)), String(9560));
      expect(ResourceUtils.expectedBase64Length(7168)).assertEqual(9560);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220007 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220008
     * @tc.number SUB_RESMGR_UTILS22_0008
     * @tc.desc   字节数 8192 格式化为 8.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220008 begin');
      const result: string = ResourceUtils.formatByteSize(8192);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('8.0 KB'));
      expect(result).assertEqual('8.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(8192)), String(10924));
      expect(ResourceUtils.expectedBase64Length(8192)).assertEqual(10924);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220008 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220009
     * @tc.number SUB_RESMGR_UTILS22_0009
     * @tc.desc   字节数 9216 格式化为 9.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220009 begin');
      const result: string = ResourceUtils.formatByteSize(9216);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('9.0 KB'));
      expect(result).assertEqual('9.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(9216)), String(12288));
      expect(ResourceUtils.expectedBase64Length(9216)).assertEqual(12288);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220009 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220010
     * @tc.number SUB_RESMGR_UTILS22_0010
     * @tc.desc   字节数 10240 格式化为 10.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220010 begin');
      const result: string = ResourceUtils.formatByteSize(10240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('10.0 KB'));
      expect(result).assertEqual('10.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(10240)), String(13656));
      expect(ResourceUtils.expectedBase64Length(10240)).assertEqual(13656);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220010 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220011
     * @tc.number SUB_RESMGR_UTILS22_0011
     * @tc.desc   字节数 11264 格式化为 11.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220011 begin');
      const result: string = ResourceUtils.formatByteSize(11264);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('11.0 KB'));
      expect(result).assertEqual('11.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(11264)), String(15020));
      expect(ResourceUtils.expectedBase64Length(11264)).assertEqual(15020);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220011 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220012
     * @tc.number SUB_RESMGR_UTILS22_0012
     * @tc.desc   字节数 12288 格式化为 12.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220012 begin');
      const result: string = ResourceUtils.formatByteSize(12288);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('12.0 KB'));
      expect(result).assertEqual('12.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(12288)), String(16384));
      expect(ResourceUtils.expectedBase64Length(12288)).assertEqual(16384);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220012 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220013
     * @tc.number SUB_RESMGR_UTILS22_0013
     * @tc.desc   字节数 13312 格式化为 13.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220013 begin');
      const result: string = ResourceUtils.formatByteSize(13312);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('13.0 KB'));
      expect(result).assertEqual('13.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(13312)), String(17752));
      expect(ResourceUtils.expectedBase64Length(13312)).assertEqual(17752);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220013 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220014
     * @tc.number SUB_RESMGR_UTILS22_0014
     * @tc.desc   字节数 14336 格式化为 14.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220014 begin');
      const result: string = ResourceUtils.formatByteSize(14336);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('14.0 KB'));
      expect(result).assertEqual('14.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(14336)), String(19116));
      expect(ResourceUtils.expectedBase64Length(14336)).assertEqual(19116);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220014 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220015
     * @tc.number SUB_RESMGR_UTILS22_0015
     * @tc.desc   字节数 15360 格式化为 15.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220015 begin');
      const result: string = ResourceUtils.formatByteSize(15360);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('15.0 KB'));
      expect(result).assertEqual('15.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(15360)), String(20480));
      expect(ResourceUtils.expectedBase64Length(15360)).assertEqual(20480);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220015 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220016
     * @tc.number SUB_RESMGR_UTILS22_0016
     * @tc.desc   字节数 16384 格式化为 16.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220016 begin');
      const result: string = ResourceUtils.formatByteSize(16384);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('16.0 KB'));
      expect(result).assertEqual('16.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(16384)), String(21848));
      expect(ResourceUtils.expectedBase64Length(16384)).assertEqual(21848);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220016 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220017
     * @tc.number SUB_RESMGR_UTILS22_0017
     * @tc.desc   字节数 17408 格式化为 17.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220017 begin');
      const result: string = ResourceUtils.formatByteSize(17408);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('17.0 KB'));
      expect(result).assertEqual('17.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(17408)), String(23212));
      expect(ResourceUtils.expectedBase64Length(17408)).assertEqual(23212);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220017 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220018
     * @tc.number SUB_RESMGR_UTILS22_0018
     * @tc.desc   字节数 18432 格式化为 18.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220018 begin');
      const result: string = ResourceUtils.formatByteSize(18432);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('18.0 KB'));
      expect(result).assertEqual('18.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(18432)), String(24576));
      expect(ResourceUtils.expectedBase64Length(18432)).assertEqual(24576);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220018 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220019
     * @tc.number SUB_RESMGR_UTILS22_0019
     * @tc.desc   字节数 19456 格式化为 19.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220019 begin');
      const result: string = ResourceUtils.formatByteSize(19456);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('19.0 KB'));
      expect(result).assertEqual('19.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(19456)), String(25944));
      expect(ResourceUtils.expectedBase64Length(19456)).assertEqual(25944);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220019 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220020
     * @tc.number SUB_RESMGR_UTILS22_0020
     * @tc.desc   字节数 20480 格式化为 20.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220020 begin');
      const result: string = ResourceUtils.formatByteSize(20480);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20.0 KB'));
      expect(result).assertEqual('20.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(20480)), String(27308));
      expect(ResourceUtils.expectedBase64Length(20480)).assertEqual(27308);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220020 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220021
     * @tc.number SUB_RESMGR_UTILS22_0021
     * @tc.desc   字节数 21504 格式化为 21.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220021 begin');
      const result: string = ResourceUtils.formatByteSize(21504);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('21.0 KB'));
      expect(result).assertEqual('21.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(21504)), String(28672));
      expect(ResourceUtils.expectedBase64Length(21504)).assertEqual(28672);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220021 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220022
     * @tc.number SUB_RESMGR_UTILS22_0022
     * @tc.desc   字节数 22528 格式化为 22.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220022 begin');
      const result: string = ResourceUtils.formatByteSize(22528);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('22.0 KB'));
      expect(result).assertEqual('22.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(22528)), String(30040));
      expect(ResourceUtils.expectedBase64Length(22528)).assertEqual(30040);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220022 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220023
     * @tc.number SUB_RESMGR_UTILS22_0023
     * @tc.desc   字节数 23552 格式化为 23.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220023 begin');
      const result: string = ResourceUtils.formatByteSize(23552);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('23.0 KB'));
      expect(result).assertEqual('23.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(23552)), String(31404));
      expect(ResourceUtils.expectedBase64Length(23552)).assertEqual(31404);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220023 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220024
     * @tc.number SUB_RESMGR_UTILS22_0024
     * @tc.desc   字节数 24576 格式化为 24.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220024 begin');
      const result: string = ResourceUtils.formatByteSize(24576);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('24.0 KB'));
      expect(result).assertEqual('24.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(24576)), String(32768));
      expect(ResourceUtils.expectedBase64Length(24576)).assertEqual(32768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220024 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220025
     * @tc.number SUB_RESMGR_UTILS22_0025
     * @tc.desc   字节数 25600 格式化为 25.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220025 begin');
      const result: string = ResourceUtils.formatByteSize(25600);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('25.0 KB'));
      expect(result).assertEqual('25.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(25600)), String(34136));
      expect(ResourceUtils.expectedBase64Length(25600)).assertEqual(34136);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220025 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220026
     * @tc.number SUB_RESMGR_UTILS22_0026
     * @tc.desc   字节数 26624 格式化为 26.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220026 begin');
      const result: string = ResourceUtils.formatByteSize(26624);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('26.0 KB'));
      expect(result).assertEqual('26.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(26624)), String(35500));
      expect(ResourceUtils.expectedBase64Length(26624)).assertEqual(35500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220026 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220027
     * @tc.number SUB_RESMGR_UTILS22_0027
     * @tc.desc   字节数 27648 格式化为 27.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220027 begin');
      const result: string = ResourceUtils.formatByteSize(27648);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('27.0 KB'));
      expect(result).assertEqual('27.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(27648)), String(36864));
      expect(ResourceUtils.expectedBase64Length(27648)).assertEqual(36864);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220027 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220028
     * @tc.number SUB_RESMGR_UTILS22_0028
     * @tc.desc   字节数 28672 格式化为 28.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220028 begin');
      const result: string = ResourceUtils.formatByteSize(28672);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('28.0 KB'));
      expect(result).assertEqual('28.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(28672)), String(38232));
      expect(ResourceUtils.expectedBase64Length(28672)).assertEqual(38232);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220028 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220029
     * @tc.number SUB_RESMGR_UTILS22_0029
     * @tc.desc   字节数 29696 格式化为 29.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220029 begin');
      const result: string = ResourceUtils.formatByteSize(29696);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('29.0 KB'));
      expect(result).assertEqual('29.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(29696)), String(39596));
      expect(ResourceUtils.expectedBase64Length(29696)).assertEqual(39596);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220029 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220030
     * @tc.number SUB_RESMGR_UTILS22_0030
     * @tc.desc   字节数 30720 格式化为 30.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220030 begin');
      const result: string = ResourceUtils.formatByteSize(30720);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('30.0 KB'));
      expect(result).assertEqual('30.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(30720)), String(40960));
      expect(ResourceUtils.expectedBase64Length(30720)).assertEqual(40960);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220030 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220031
     * @tc.number SUB_RESMGR_UTILS22_0031
     * @tc.desc   字节数 31744 格式化为 31.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220031 begin');
      const result: string = ResourceUtils.formatByteSize(31744);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('31.0 KB'));
      expect(result).assertEqual('31.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(31744)), String(42328));
      expect(ResourceUtils.expectedBase64Length(31744)).assertEqual(42328);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220031 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220032
     * @tc.number SUB_RESMGR_UTILS22_0032
     * @tc.desc   字节数 32768 格式化为 32.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220032 begin');
      const result: string = ResourceUtils.formatByteSize(32768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('32.0 KB'));
      expect(result).assertEqual('32.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(32768)), String(43692));
      expect(ResourceUtils.expectedBase64Length(32768)).assertEqual(43692);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220032 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220033
     * @tc.number SUB_RESMGR_UTILS22_0033
     * @tc.desc   字节数 33792 格式化为 33.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220033 begin');
      const result: string = ResourceUtils.formatByteSize(33792);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('33.0 KB'));
      expect(result).assertEqual('33.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(33792)), String(45056));
      expect(ResourceUtils.expectedBase64Length(33792)).assertEqual(45056);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220033 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220034
     * @tc.number SUB_RESMGR_UTILS22_0034
     * @tc.desc   字节数 34816 格式化为 34.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220034 begin');
      const result: string = ResourceUtils.formatByteSize(34816);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('34.0 KB'));
      expect(result).assertEqual('34.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(34816)), String(46424));
      expect(ResourceUtils.expectedBase64Length(34816)).assertEqual(46424);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220034 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220035
     * @tc.number SUB_RESMGR_UTILS22_0035
     * @tc.desc   字节数 35840 格式化为 35.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220035 begin');
      const result: string = ResourceUtils.formatByteSize(35840);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('35.0 KB'));
      expect(result).assertEqual('35.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(35840)), String(47788));
      expect(ResourceUtils.expectedBase64Length(35840)).assertEqual(47788);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220035 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220036
     * @tc.number SUB_RESMGR_UTILS22_0036
     * @tc.desc   字节数 36864 格式化为 36.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220036 begin');
      const result: string = ResourceUtils.formatByteSize(36864);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('36.0 KB'));
      expect(result).assertEqual('36.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(36864)), String(49152));
      expect(ResourceUtils.expectedBase64Length(36864)).assertEqual(49152);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220036 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220037
     * @tc.number SUB_RESMGR_UTILS22_0037
     * @tc.desc   字节数 37888 格式化为 37.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220037 begin');
      const result: string = ResourceUtils.formatByteSize(37888);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('37.0 KB'));
      expect(result).assertEqual('37.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(37888)), String(50520));
      expect(ResourceUtils.expectedBase64Length(37888)).assertEqual(50520);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220037 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220038
     * @tc.number SUB_RESMGR_UTILS22_0038
     * @tc.desc   字节数 38912 格式化为 38.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220038 begin');
      const result: string = ResourceUtils.formatByteSize(38912);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('38.0 KB'));
      expect(result).assertEqual('38.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(38912)), String(51884));
      expect(ResourceUtils.expectedBase64Length(38912)).assertEqual(51884);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220038 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220039
     * @tc.number SUB_RESMGR_UTILS22_0039
     * @tc.desc   字节数 39936 格式化为 39.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220039 begin');
      const result: string = ResourceUtils.formatByteSize(39936);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('39.0 KB'));
      expect(result).assertEqual('39.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(39936)), String(53248));
      expect(ResourceUtils.expectedBase64Length(39936)).assertEqual(53248);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220039 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220040
     * @tc.number SUB_RESMGR_UTILS22_0040
     * @tc.desc   字节数 40960 格式化为 40.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220040 begin');
      const result: string = ResourceUtils.formatByteSize(40960);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('40.0 KB'));
      expect(result).assertEqual('40.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(40960)), String(54616));
      expect(ResourceUtils.expectedBase64Length(40960)).assertEqual(54616);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220040 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220041
     * @tc.number SUB_RESMGR_UTILS22_0041
     * @tc.desc   字节数 41984 格式化为 41.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220041 begin');
      const result: string = ResourceUtils.formatByteSize(41984);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('41.0 KB'));
      expect(result).assertEqual('41.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(41984)), String(55980));
      expect(ResourceUtils.expectedBase64Length(41984)).assertEqual(55980);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220041 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220042
     * @tc.number SUB_RESMGR_UTILS22_0042
     * @tc.desc   字节数 43008 格式化为 42.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220042 begin');
      const result: string = ResourceUtils.formatByteSize(43008);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('42.0 KB'));
      expect(result).assertEqual('42.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(43008)), String(57344));
      expect(ResourceUtils.expectedBase64Length(43008)).assertEqual(57344);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220042 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220043
     * @tc.number SUB_RESMGR_UTILS22_0043
     * @tc.desc   字节数 44032 格式化为 43.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220043 begin');
      const result: string = ResourceUtils.formatByteSize(44032);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('43.0 KB'));
      expect(result).assertEqual('43.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(44032)), String(58712));
      expect(ResourceUtils.expectedBase64Length(44032)).assertEqual(58712);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220043 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220044
     * @tc.number SUB_RESMGR_UTILS22_0044
     * @tc.desc   字节数 45056 格式化为 44.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220044 begin');
      const result: string = ResourceUtils.formatByteSize(45056);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('44.0 KB'));
      expect(result).assertEqual('44.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(45056)), String(60076));
      expect(ResourceUtils.expectedBase64Length(45056)).assertEqual(60076);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220044 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220045
     * @tc.number SUB_RESMGR_UTILS22_0045
     * @tc.desc   字节数 46080 格式化为 45.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220045 begin');
      const result: string = ResourceUtils.formatByteSize(46080);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('45.0 KB'));
      expect(result).assertEqual('45.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(46080)), String(61440));
      expect(ResourceUtils.expectedBase64Length(46080)).assertEqual(61440);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220045 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220046
     * @tc.number SUB_RESMGR_UTILS22_0046
     * @tc.desc   字节数 47104 格式化为 46.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220046 begin');
      const result: string = ResourceUtils.formatByteSize(47104);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('46.0 KB'));
      expect(result).assertEqual('46.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(47104)), String(62808));
      expect(ResourceUtils.expectedBase64Length(47104)).assertEqual(62808);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220046 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220047
     * @tc.number SUB_RESMGR_UTILS22_0047
     * @tc.desc   字节数 48128 格式化为 47.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220047 begin');
      const result: string = ResourceUtils.formatByteSize(48128);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('47.0 KB'));
      expect(result).assertEqual('47.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(48128)), String(64172));
      expect(ResourceUtils.expectedBase64Length(48128)).assertEqual(64172);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220047 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220048
     * @tc.number SUB_RESMGR_UTILS22_0048
     * @tc.desc   字节数 1048576 格式化为 1.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220048 begin');
      const result: string = ResourceUtils.formatByteSize(1048576);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1.0 MB'));
      expect(result).assertEqual('1.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(1048576)), String(1398104));
      expect(ResourceUtils.expectedBase64Length(1048576)).assertEqual(1398104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220048 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220049
     * @tc.number SUB_RESMGR_UTILS22_0049
     * @tc.desc   字节数 2097152 格式化为 2.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220049 begin');
      const result: string = ResourceUtils.formatByteSize(2097152);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 MB'));
      expect(result).assertEqual('2.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(2097152)), String(2796204));
      expect(ResourceUtils.expectedBase64Length(2097152)).assertEqual(2796204);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220049 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220050
     * @tc.number SUB_RESMGR_UTILS22_0050
     * @tc.desc   字节数 3145728 格式化为 3.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220050 begin');
      const result: string = ResourceUtils.formatByteSize(3145728);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('3.0 MB'));
      expect(result).assertEqual('3.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(3145728)), String(4194304));
      expect(ResourceUtils.expectedBase64Length(3145728)).assertEqual(4194304);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220050 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220051
     * @tc.number SUB_RESMGR_UTILS22_0051
     * @tc.desc   字节数 4194304 格式化为 4.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220051 begin');
      const result: string = ResourceUtils.formatByteSize(4194304);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('4.0 MB'));
      expect(result).assertEqual('4.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(4194304)), String(5592408));
      expect(ResourceUtils.expectedBase64Length(4194304)).assertEqual(5592408);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220051 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220052
     * @tc.number SUB_RESMGR_UTILS22_0052
     * @tc.desc   字节数 5242880 格式化为 5.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220052 begin');
      const result: string = ResourceUtils.formatByteSize(5242880);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('5.0 MB'));
      expect(result).assertEqual('5.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(5242880)), String(6990508));
      expect(ResourceUtils.expectedBase64Length(5242880)).assertEqual(6990508);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220052 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220053
     * @tc.number SUB_RESMGR_UTILS22_0053
     * @tc.desc   字节数 6291456 格式化为 6.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220053 begin');
      const result: string = ResourceUtils.formatByteSize(6291456);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('6.0 MB'));
      expect(result).assertEqual('6.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(6291456)), String(8388608));
      expect(ResourceUtils.expectedBase64Length(6291456)).assertEqual(8388608);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220053 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220054
     * @tc.number SUB_RESMGR_UTILS22_0054
     * @tc.desc   字节数 7340032 格式化为 7.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220054 begin');
      const result: string = ResourceUtils.formatByteSize(7340032);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('7.0 MB'));
      expect(result).assertEqual('7.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(7340032)), String(9786712));
      expect(ResourceUtils.expectedBase64Length(7340032)).assertEqual(9786712);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220054 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220055
     * @tc.number SUB_RESMGR_UTILS22_0055
     * @tc.desc   字节数 8388608 格式化为 8.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220055 begin');
      const result: string = ResourceUtils.formatByteSize(8388608);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('8.0 MB'));
      expect(result).assertEqual('8.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(8388608)), String(11184812));
      expect(ResourceUtils.expectedBase64Length(8388608)).assertEqual(11184812);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220055 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220056
     * @tc.number SUB_RESMGR_UTILS22_0056
     * @tc.desc   字节数 9437184 格式化为 9.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220056 begin');
      const result: string = ResourceUtils.formatByteSize(9437184);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('9.0 MB'));
      expect(result).assertEqual('9.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(9437184)), String(12582912));
      expect(ResourceUtils.expectedBase64Length(9437184)).assertEqual(12582912);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220056 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220057
     * @tc.number SUB_RESMGR_UTILS22_0057
     * @tc.desc   字节数 10485760 格式化为 10.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220057 begin');
      const result: string = ResourceUtils.formatByteSize(10485760);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('10.0 MB'));
      expect(result).assertEqual('10.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(10485760)), String(13981016));
      expect(ResourceUtils.expectedBase64Length(10485760)).assertEqual(13981016);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220057 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220058
     * @tc.number SUB_RESMGR_UTILS22_0058
     * @tc.desc   字节数 11534336 格式化为 11.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220058 begin');
      const result: string = ResourceUtils.formatByteSize(11534336);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('11.0 MB'));
      expect(result).assertEqual('11.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(11534336)), String(15379116));
      expect(ResourceUtils.expectedBase64Length(11534336)).assertEqual(15379116);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220058 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220059
     * @tc.number SUB_RESMGR_UTILS22_0059
     * @tc.desc   字节数 12582912 格式化为 12.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220059 begin');
      const result: string = ResourceUtils.formatByteSize(12582912);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('12.0 MB'));
      expect(result).assertEqual('12.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(12582912)), String(16777216));
      expect(ResourceUtils.expectedBase64Length(12582912)).assertEqual(16777216);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220059 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220060
     * @tc.number SUB_RESMGR_UTILS22_0060
     * @tc.desc   字节数 13631488 格式化为 13.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220060 begin');
      const result: string = ResourceUtils.formatByteSize(13631488);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('13.0 MB'));
      expect(result).assertEqual('13.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(13631488)), String(18175320));
      expect(ResourceUtils.expectedBase64Length(13631488)).assertEqual(18175320);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220060 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220061
     * @tc.number SUB_RESMGR_UTILS22_0061
     * @tc.desc   字节数 14680064 格式化为 14.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220061 begin');
      const result: string = ResourceUtils.formatByteSize(14680064);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('14.0 MB'));
      expect(result).assertEqual('14.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(14680064)), String(19573420));
      expect(ResourceUtils.expectedBase64Length(14680064)).assertEqual(19573420);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220061 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220062
     * @tc.number SUB_RESMGR_UTILS22_0062
     * @tc.desc   字节数 15728640 格式化为 15.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220062 begin');
      const result: string = ResourceUtils.formatByteSize(15728640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('15.0 MB'));
      expect(result).assertEqual('15.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(15728640)), String(20971520));
      expect(ResourceUtils.expectedBase64Length(15728640)).assertEqual(20971520);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220062 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220063
     * @tc.number SUB_RESMGR_UTILS22_0063
     * @tc.desc   字节数 16777216 格式化为 16.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220063 begin');
      const result: string = ResourceUtils.formatByteSize(16777216);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('16.0 MB'));
      expect(result).assertEqual('16.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(16777216)), String(22369624));
      expect(ResourceUtils.expectedBase64Length(16777216)).assertEqual(22369624);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220063 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220064
     * @tc.number SUB_RESMGR_UTILS22_0064
     * @tc.desc   字节数 17825792 格式化为 17.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220064 begin');
      const result: string = ResourceUtils.formatByteSize(17825792);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('17.0 MB'));
      expect(result).assertEqual('17.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(17825792)), String(23767724));
      expect(ResourceUtils.expectedBase64Length(17825792)).assertEqual(23767724);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220064 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220065
     * @tc.number SUB_RESMGR_UTILS22_0065
     * @tc.desc   字节数 18874368 格式化为 18.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220065 begin');
      const result: string = ResourceUtils.formatByteSize(18874368);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('18.0 MB'));
      expect(result).assertEqual('18.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(18874368)), String(25165824));
      expect(ResourceUtils.expectedBase64Length(18874368)).assertEqual(25165824);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220065 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220066
     * @tc.number SUB_RESMGR_UTILS22_0066
     * @tc.desc   字节数 19922944 格式化为 19.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220066 begin');
      const result: string = ResourceUtils.formatByteSize(19922944);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('19.0 MB'));
      expect(result).assertEqual('19.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(19922944)), String(26563928));
      expect(ResourceUtils.expectedBase64Length(19922944)).assertEqual(26563928);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220066 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220067
     * @tc.number SUB_RESMGR_UTILS22_0067
     * @tc.desc   字节数 20971520 格式化为 20.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220067 begin');
      const result: string = ResourceUtils.formatByteSize(20971520);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20.0 MB'));
      expect(result).assertEqual('20.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(20971520)), String(27962028));
      expect(ResourceUtils.expectedBase64Length(20971520)).assertEqual(27962028);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220067 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220068
     * @tc.number SUB_RESMGR_UTILS22_0068
     * @tc.desc   字节数 22020096 格式化为 21.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220068 begin');
      const result: string = ResourceUtils.formatByteSize(22020096);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('21.0 MB'));
      expect(result).assertEqual('21.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(22020096)), String(29360128));
      expect(ResourceUtils.expectedBase64Length(22020096)).assertEqual(29360128);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220068 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220069
     * @tc.number SUB_RESMGR_UTILS22_0069
     * @tc.desc   字节数 23068672 格式化为 22.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220069 begin');
      const result: string = ResourceUtils.formatByteSize(23068672);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('22.0 MB'));
      expect(result).assertEqual('22.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(23068672)), String(30758232));
      expect(ResourceUtils.expectedBase64Length(23068672)).assertEqual(30758232);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220069 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220070
     * @tc.number SUB_RESMGR_UTILS22_0070
     * @tc.desc   字节数 24117248 格式化为 23.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220070 begin');
      const result: string = ResourceUtils.formatByteSize(24117248);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('23.0 MB'));
      expect(result).assertEqual('23.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(24117248)), String(32156332));
      expect(ResourceUtils.expectedBase64Length(24117248)).assertEqual(32156332);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220070 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220071
     * @tc.number SUB_RESMGR_UTILS22_0071
     * @tc.desc   字节数 25165824 格式化为 24.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220071 begin');
      const result: string = ResourceUtils.formatByteSize(25165824);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('24.0 MB'));
      expect(result).assertEqual('24.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(25165824)), String(33554432));
      expect(ResourceUtils.expectedBase64Length(25165824)).assertEqual(33554432);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220071 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220072
     * @tc.number SUB_RESMGR_UTILS22_0072
     * @tc.desc   字节数 26214400 格式化为 25.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220072 begin');
      const result: string = ResourceUtils.formatByteSize(26214400);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('25.0 MB'));
      expect(result).assertEqual('25.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(26214400)), String(34952536));
      expect(ResourceUtils.expectedBase64Length(26214400)).assertEqual(34952536);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220072 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220073
     * @tc.number SUB_RESMGR_UTILS22_0073
     * @tc.desc   字节数 27262976 格式化为 26.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220073 begin');
      const result: string = ResourceUtils.formatByteSize(27262976);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('26.0 MB'));
      expect(result).assertEqual('26.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(27262976)), String(36350636));
      expect(ResourceUtils.expectedBase64Length(27262976)).assertEqual(36350636);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220073 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220074
     * @tc.number SUB_RESMGR_UTILS22_0074
     * @tc.desc   字节数 28311552 格式化为 27.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220074 begin');
      const result: string = ResourceUtils.formatByteSize(28311552);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('27.0 MB'));
      expect(result).assertEqual('27.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(28311552)), String(37748736));
      expect(ResourceUtils.expectedBase64Length(28311552)).assertEqual(37748736);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220074 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220075
     * @tc.number SUB_RESMGR_UTILS22_0075
     * @tc.desc   字节数 29360128 格式化为 28.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220075 begin');
      const result: string = ResourceUtils.formatByteSize(29360128);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('28.0 MB'));
      expect(result).assertEqual('28.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(29360128)), String(39146840));
      expect(ResourceUtils.expectedBase64Length(29360128)).assertEqual(39146840);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220075 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220076
     * @tc.number SUB_RESMGR_UTILS22_0076
     * @tc.desc   字节数 30408704 格式化为 29.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220076 begin');
      const result: string = ResourceUtils.formatByteSize(30408704);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('29.0 MB'));
      expect(result).assertEqual('29.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(30408704)), String(40544940));
      expect(ResourceUtils.expectedBase64Length(30408704)).assertEqual(40544940);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220076 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220077
     * @tc.number SUB_RESMGR_UTILS22_0077
     * @tc.desc   字节数 31457280 格式化为 30.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220077 begin');
      const result: string = ResourceUtils.formatByteSize(31457280);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('30.0 MB'));
      expect(result).assertEqual('30.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(31457280)), String(41943040));
      expect(ResourceUtils.expectedBase64Length(31457280)).assertEqual(41943040);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220077 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220078
     * @tc.number SUB_RESMGR_UTILS22_0078
     * @tc.desc   字节数 32505856 格式化为 31.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220078 begin');
      const result: string = ResourceUtils.formatByteSize(32505856);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('31.0 MB'));
      expect(result).assertEqual('31.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(32505856)), String(43341144));
      expect(ResourceUtils.expectedBase64Length(32505856)).assertEqual(43341144);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220078 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220079
     * @tc.number SUB_RESMGR_UTILS22_0079
     * @tc.desc   字节数 33554432 格式化为 32.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220079 begin');
      const result: string = ResourceUtils.formatByteSize(33554432);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('32.0 MB'));
      expect(result).assertEqual('32.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(33554432)), String(44739244));
      expect(ResourceUtils.expectedBase64Length(33554432)).assertEqual(44739244);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220079 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220080
     * @tc.number SUB_RESMGR_UTILS22_0080
     * @tc.desc   字节数 34603008 格式化为 33.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220080 begin');
      const result: string = ResourceUtils.formatByteSize(34603008);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('33.0 MB'));
      expect(result).assertEqual('33.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(34603008)), String(46137344));
      expect(ResourceUtils.expectedBase64Length(34603008)).assertEqual(46137344);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220080 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220081
     * @tc.number SUB_RESMGR_UTILS22_0081
     * @tc.desc   字节数 35651584 格式化为 34.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220081 begin');
      const result: string = ResourceUtils.formatByteSize(35651584);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('34.0 MB'));
      expect(result).assertEqual('34.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(35651584)), String(47535448));
      expect(ResourceUtils.expectedBase64Length(35651584)).assertEqual(47535448);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220081 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220082
     * @tc.number SUB_RESMGR_UTILS22_0082
     * @tc.desc   字节数 36700160 格式化为 35.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220082 begin');
      const result: string = ResourceUtils.formatByteSize(36700160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('35.0 MB'));
      expect(result).assertEqual('35.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(36700160)), String(48933548));
      expect(ResourceUtils.expectedBase64Length(36700160)).assertEqual(48933548);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220082 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220083
     * @tc.number SUB_RESMGR_UTILS22_0083
     * @tc.desc   字节数 37748736 格式化为 36.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220083 begin');
      const result: string = ResourceUtils.formatByteSize(37748736);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('36.0 MB'));
      expect(result).assertEqual('36.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(37748736)), String(50331648));
      expect(ResourceUtils.expectedBase64Length(37748736)).assertEqual(50331648);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220083 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220084
     * @tc.number SUB_RESMGR_UTILS22_0084
     * @tc.desc   字节数 38797312 格式化为 37.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220084 begin');
      const result: string = ResourceUtils.formatByteSize(38797312);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('37.0 MB'));
      expect(result).assertEqual('37.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(38797312)), String(51729752));
      expect(ResourceUtils.expectedBase64Length(38797312)).assertEqual(51729752);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220084 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220085
     * @tc.number SUB_RESMGR_UTILS22_0085
     * @tc.desc   字节数 39845888 格式化为 38.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220085 begin');
      const result: string = ResourceUtils.formatByteSize(39845888);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('38.0 MB'));
      expect(result).assertEqual('38.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(39845888)), String(53127852));
      expect(ResourceUtils.expectedBase64Length(39845888)).assertEqual(53127852);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220085 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220086
     * @tc.number SUB_RESMGR_UTILS22_0086
     * @tc.desc   字节数 1 格式化为 1 B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220086 begin');
      const result: string = ResourceUtils.formatByteSize(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1 B'));
      expect(result).assertEqual('1 B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('B')));
      expect(result.endsWith('B')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(1)), String(4));
      expect(ResourceUtils.expectedBase64Length(1)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220086 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220087
     * @tc.number SUB_RESMGR_UTILS22_0087
     * @tc.desc   字节数 1023 格式化为 1023 B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220087 begin');
      const result: string = ResourceUtils.formatByteSize(1023);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023 B'));
      expect(result).assertEqual('1023 B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('B')));
      expect(result.endsWith('B')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(1023)), String(1364));
      expect(ResourceUtils.expectedBase64Length(1023)).assertEqual(1364);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220087 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220088
     * @tc.number SUB_RESMGR_UTILS22_0088
     * @tc.desc   字节数 1024 格式化为 1.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220088 begin');
      const result: string = ResourceUtils.formatByteSize(1024);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1.0 KB'));
      expect(result).assertEqual('1.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(1024)), String(1368));
      expect(ResourceUtils.expectedBase64Length(1024)).assertEqual(1368);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220088 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220089
     * @tc.number SUB_RESMGR_UTILS22_0089
     * @tc.desc   字节数 1536 格式化为 1.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220089 begin');
      const result: string = ResourceUtils.formatByteSize(1536);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1.5 KB'));
      expect(result).assertEqual('1.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(1536)), String(2048));
      expect(ResourceUtils.expectedBase64Length(1536)).assertEqual(2048);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220089 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220090
     * @tc.number SUB_RESMGR_UTILS22_0090
     * @tc.desc   字节数 1048575 格式化为 1023.9 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220090 begin');
      const result: string = ResourceUtils.formatByteSize(1048575);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023.9 KB'));
      expect(result).assertEqual('1023.9 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(1048575)), String(1398100));
      expect(ResourceUtils.expectedBase64Length(1048575)).assertEqual(1398100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220090 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220091
     * @tc.number SUB_RESMGR_UTILS22_0091
     * @tc.desc   字节数 1048576 格式化为 1.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220091 begin');
      const result: string = ResourceUtils.formatByteSize(1048576);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1.0 MB'));
      expect(result).assertEqual('1.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(1048576)), String(1398104));
      expect(ResourceUtils.expectedBase64Length(1048576)).assertEqual(1398104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220091 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220092
     * @tc.number SUB_RESMGR_UTILS22_0092
     * @tc.desc   字节数 1048577 格式化为 1.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220092 begin');
      const result: string = ResourceUtils.formatByteSize(1048577);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1.0 MB'));
      expect(result).assertEqual('1.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(1048577)), String(1398104));
      expect(ResourceUtils.expectedBase64Length(1048577)).assertEqual(1398104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220092 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220093
     * @tc.number SUB_RESMGR_UTILS22_0093
     * @tc.desc   字节数 10240 格式化为 10.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220093 begin');
      const result: string = ResourceUtils.formatByteSize(10240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('10.0 KB'));
      expect(result).assertEqual('10.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(10240)), String(13656));
      expect(ResourceUtils.expectedBase64Length(10240)).assertEqual(13656);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220093 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220094
     * @tc.number SUB_RESMGR_UTILS22_0094
     * @tc.desc   字节数 10485760 格式化为 10.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220094 begin');
      const result: string = ResourceUtils.formatByteSize(10485760);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('10.0 MB'));
      expect(result).assertEqual('10.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(10485760)), String(13981016));
      expect(ResourceUtils.expectedBase64Length(10485760)).assertEqual(13981016);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220094 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220095
     * @tc.number SUB_RESMGR_UTILS22_0095
     * @tc.desc   字节数 1073741824 格式化为 1024.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220095 begin');
      const result: string = ResourceUtils.formatByteSize(1073741824);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1024.0 MB'));
      expect(result).assertEqual('1024.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(1073741824)), String(1431655768));
      expect(ResourceUtils.expectedBase64Length(1073741824)).assertEqual(1431655768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220095 end');
    })

    /**
     * @tc.name   testResourceUtilsBytesV220096
     * @tc.number SUB_RESMGR_UTILS22_0096
     * @tc.desc   零、负数与非整数一律回落 0 B，不进入 KB/MB 分档
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytesV220096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220096 begin');
      const zero: string = ResourceUtils.formatByteSize(0);
      const negative: string = ResourceUtils.formatByteSize(-8);
      const fractional: string = ResourceUtils.formatByteSize(1.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=[%{public}s][%{public}s][%{public}s] expected=[0 B]',
        zero, negative, fractional);
      expect(zero).assertEqual('0 B');
      expect(negative).assertEqual('0 B');
      expect(fractional).assertEqual('0 B');
      expect(zero === negative && negative === fractional).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytesV220096 end');
    })
  })
}
