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

export default function resourceUtilsBytesTest() {
  describe('ResourceUtilsBytesTest', () => {

    /**
     * @tc.name   testResourceUtilsBytes0001
     * @tc.number SUB_RESMGR_UTILS_03_0001
     * @tc.desc   formatByteSize(0) renders 0 B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0001 begin');
      const result: string = ResourceUtils.formatByteSize(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0 B'));
      expect(result).assertEqual('0 B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('B')));
      expect(result.endsWith('B')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0001 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0002
     * @tc.number SUB_RESMGR_UTILS_03_0002
     * @tc.desc   formatByteSize(-1) renders 0 B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0002 begin');
      const result: string = ResourceUtils.formatByteSize(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0 B'));
      expect(result).assertEqual('0 B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('B')));
      expect(result.endsWith('B')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0002 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0003
     * @tc.number SUB_RESMGR_UTILS_03_0003
     * @tc.desc   formatByteSize(-1023) renders 0 B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0003 begin');
      const result: string = ResourceUtils.formatByteSize(-1023);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0 B'));
      expect(result).assertEqual('0 B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('B')));
      expect(result.endsWith('B')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0003 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0004
     * @tc.number SUB_RESMGR_UTILS_03_0004
     * @tc.desc   formatByteSize(0.5) renders 0 B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0004 begin');
      const result: string = ResourceUtils.formatByteSize(0.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0 B'));
      expect(result).assertEqual('0 B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('B')));
      expect(result.endsWith('B')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0004 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0005
     * @tc.number SUB_RESMGR_UTILS_03_0005
     * @tc.desc   formatByteSize(1.5) renders 0 B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0005 begin');
      const result: string = ResourceUtils.formatByteSize(1.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0 B'));
      expect(result).assertEqual('0 B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('B')));
      expect(result.endsWith('B')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0005 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0006
     * @tc.number SUB_RESMGR_UTILS_03_0006
     * @tc.desc   formatByteSize(-0.5) renders 0 B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0006 begin');
      const result: string = ResourceUtils.formatByteSize(-0.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0 B'));
      expect(result).assertEqual('0 B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('B')));
      expect(result.endsWith('B')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0006 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0007
     * @tc.number SUB_RESMGR_UTILS_03_0007
     * @tc.desc   formatByteSize(1) renders 1 B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0007 begin');
      const result: string = ResourceUtils.formatByteSize(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1 B'));
      expect(result).assertEqual('1 B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('B')));
      expect(result.endsWith('B')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0007 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0008
     * @tc.number SUB_RESMGR_UTILS_03_0008
     * @tc.desc   formatByteSize(2) renders 2 B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0008 begin');
      const result: string = ResourceUtils.formatByteSize(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2 B'));
      expect(result).assertEqual('2 B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('B')));
      expect(result.endsWith('B')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0008 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0009
     * @tc.number SUB_RESMGR_UTILS_03_0009
     * @tc.desc   formatByteSize(3) renders 3 B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0009 begin');
      const result: string = ResourceUtils.formatByteSize(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('3 B'));
      expect(result).assertEqual('3 B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('B')));
      expect(result.endsWith('B')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0009 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0010
     * @tc.number SUB_RESMGR_UTILS_03_0010
     * @tc.desc   formatByteSize(7) renders 7 B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0010 begin');
      const result: string = ResourceUtils.formatByteSize(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('7 B'));
      expect(result).assertEqual('7 B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('B')));
      expect(result.endsWith('B')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0010 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0011
     * @tc.number SUB_RESMGR_UTILS_03_0011
     * @tc.desc   formatByteSize(8) renders 8 B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0011 begin');
      const result: string = ResourceUtils.formatByteSize(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('8 B'));
      expect(result).assertEqual('8 B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('B')));
      expect(result.endsWith('B')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0011 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0012
     * @tc.number SUB_RESMGR_UTILS_03_0012
     * @tc.desc   formatByteSize(15) renders 15 B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0012 begin');
      const result: string = ResourceUtils.formatByteSize(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('15 B'));
      expect(result).assertEqual('15 B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('B')));
      expect(result.endsWith('B')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0012 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0013
     * @tc.number SUB_RESMGR_UTILS_03_0013
     * @tc.desc   formatByteSize(16) renders 16 B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0013 begin');
      const result: string = ResourceUtils.formatByteSize(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('16 B'));
      expect(result).assertEqual('16 B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('B')));
      expect(result.endsWith('B')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0013 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0014
     * @tc.number SUB_RESMGR_UTILS_03_0014
     * @tc.desc   formatByteSize(31) renders 31 B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0014 begin');
      const result: string = ResourceUtils.formatByteSize(31);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('31 B'));
      expect(result).assertEqual('31 B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('B')));
      expect(result.endsWith('B')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0014 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0015
     * @tc.number SUB_RESMGR_UTILS_03_0015
     * @tc.desc   formatByteSize(32) renders 32 B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0015 begin');
      const result: string = ResourceUtils.formatByteSize(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('32 B'));
      expect(result).assertEqual('32 B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('B')));
      expect(result.endsWith('B')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0015 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0016
     * @tc.number SUB_RESMGR_UTILS_03_0016
     * @tc.desc   formatByteSize(63) renders 63 B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0016 begin');
      const result: string = ResourceUtils.formatByteSize(63);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('63 B'));
      expect(result).assertEqual('63 B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('B')));
      expect(result.endsWith('B')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0016 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0017
     * @tc.number SUB_RESMGR_UTILS_03_0017
     * @tc.desc   formatByteSize(64) renders 64 B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0017 begin');
      const result: string = ResourceUtils.formatByteSize(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('64 B'));
      expect(result).assertEqual('64 B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('B')));
      expect(result.endsWith('B')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0017 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0018
     * @tc.number SUB_RESMGR_UTILS_03_0018
     * @tc.desc   formatByteSize(100) renders 100 B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0018 begin');
      const result: string = ResourceUtils.formatByteSize(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('100 B'));
      expect(result).assertEqual('100 B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('B')));
      expect(result.endsWith('B')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0018 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0019
     * @tc.number SUB_RESMGR_UTILS_03_0019
     * @tc.desc   formatByteSize(127) renders 127 B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0019 begin');
      const result: string = ResourceUtils.formatByteSize(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('127 B'));
      expect(result).assertEqual('127 B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('B')));
      expect(result.endsWith('B')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0019 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0020
     * @tc.number SUB_RESMGR_UTILS_03_0020
     * @tc.desc   formatByteSize(128) renders 128 B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0020 begin');
      const result: string = ResourceUtils.formatByteSize(128);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('128 B'));
      expect(result).assertEqual('128 B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('B')));
      expect(result.endsWith('B')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0020 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0021
     * @tc.number SUB_RESMGR_UTILS_03_0021
     * @tc.desc   formatByteSize(255) renders 255 B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0021 begin');
      const result: string = ResourceUtils.formatByteSize(255);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('255 B'));
      expect(result).assertEqual('255 B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('B')));
      expect(result.endsWith('B')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0021 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0022
     * @tc.number SUB_RESMGR_UTILS_03_0022
     * @tc.desc   formatByteSize(256) renders 256 B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0022 begin');
      const result: string = ResourceUtils.formatByteSize(256);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('256 B'));
      expect(result).assertEqual('256 B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('B')));
      expect(result.endsWith('B')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0022 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0023
     * @tc.number SUB_RESMGR_UTILS_03_0023
     * @tc.desc   formatByteSize(511) renders 511 B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0023 begin');
      const result: string = ResourceUtils.formatByteSize(511);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('511 B'));
      expect(result).assertEqual('511 B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('B')));
      expect(result.endsWith('B')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0023 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0024
     * @tc.number SUB_RESMGR_UTILS_03_0024
     * @tc.desc   formatByteSize(512) renders 512 B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0024 begin');
      const result: string = ResourceUtils.formatByteSize(512);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('512 B'));
      expect(result).assertEqual('512 B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('B')));
      expect(result.endsWith('B')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0024 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0025
     * @tc.number SUB_RESMGR_UTILS_03_0025
     * @tc.desc   formatByteSize(1000) renders 1000 B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0025 begin');
      const result: string = ResourceUtils.formatByteSize(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1000 B'));
      expect(result).assertEqual('1000 B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('B')));
      expect(result.endsWith('B')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0025 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0026
     * @tc.number SUB_RESMGR_UTILS_03_0026
     * @tc.desc   formatByteSize(1023) renders 1023 B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0026 begin');
      const result: string = ResourceUtils.formatByteSize(1023);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1023 B'));
      expect(result).assertEqual('1023 B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('B')));
      expect(result.endsWith('B')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0026 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0027
     * @tc.number SUB_RESMGR_UTILS_03_0027
     * @tc.desc   formatByteSize(1024) renders 1.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0027 begin');
      const result: string = ResourceUtils.formatByteSize(1024);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1.0 KB'));
      expect(result).assertEqual('1.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0027 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0028
     * @tc.number SUB_RESMGR_UTILS_03_0028
     * @tc.desc   formatByteSize(1025) renders 1.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0028 begin');
      const result: string = ResourceUtils.formatByteSize(1025);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1.0 KB'));
      expect(result).assertEqual('1.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0028 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0029
     * @tc.number SUB_RESMGR_UTILS_03_0029
     * @tc.desc   formatByteSize(1075) renders 1.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0029 begin');
      const result: string = ResourceUtils.formatByteSize(1075);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1.0 KB'));
      expect(result).assertEqual('1.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0029 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0030
     * @tc.number SUB_RESMGR_UTILS_03_0030
     * @tc.desc   formatByteSize(1076) renders 1.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0030 begin');
      const result: string = ResourceUtils.formatByteSize(1076);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1.0 KB'));
      expect(result).assertEqual('1.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0030 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0031
     * @tc.number SUB_RESMGR_UTILS_03_0031
     * @tc.desc   formatByteSize(1126) renders 1.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0031 begin');
      const result: string = ResourceUtils.formatByteSize(1126);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1.0 KB'));
      expect(result).assertEqual('1.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0031 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0032
     * @tc.number SUB_RESMGR_UTILS_03_0032
     * @tc.desc   formatByteSize(1127) renders 1.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0032 begin');
      const result: string = ResourceUtils.formatByteSize(1127);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1.1 KB'));
      expect(result).assertEqual('1.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0032 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0033
     * @tc.number SUB_RESMGR_UTILS_03_0033
     * @tc.desc   formatByteSize(1536) renders 1.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0033 begin');
      const result: string = ResourceUtils.formatByteSize(1536);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1.5 KB'));
      expect(result).assertEqual('1.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0033 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0034
     * @tc.number SUB_RESMGR_UTILS_03_0034
     * @tc.desc   formatByteSize(2048) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0034 begin');
      const result: string = ResourceUtils.formatByteSize(2048);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0034 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0035
     * @tc.number SUB_RESMGR_UTILS_03_0035
     * @tc.desc   formatByteSize(2560) renders 2.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0035 begin');
      const result: string = ResourceUtils.formatByteSize(2560);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.5 KB'));
      expect(result).assertEqual('2.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0035 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0036
     * @tc.number SUB_RESMGR_UTILS_03_0036
     * @tc.desc   formatByteSize(3072) renders 3.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0036 begin');
      const result: string = ResourceUtils.formatByteSize(3072);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('3.0 KB'));
      expect(result).assertEqual('3.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0036 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0037
     * @tc.number SUB_RESMGR_UTILS_03_0037
     * @tc.desc   formatByteSize(4096) renders 4.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0037 begin');
      const result: string = ResourceUtils.formatByteSize(4096);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('4.0 KB'));
      expect(result).assertEqual('4.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0037 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0038
     * @tc.number SUB_RESMGR_UTILS_03_0038
     * @tc.desc   formatByteSize(5000) renders 4.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0038 begin');
      const result: string = ResourceUtils.formatByteSize(5000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('4.8 KB'));
      expect(result).assertEqual('4.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0038 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0039
     * @tc.number SUB_RESMGR_UTILS_03_0039
     * @tc.desc   formatByteSize(6000) renders 5.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0039 begin');
      const result: string = ResourceUtils.formatByteSize(6000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('5.8 KB'));
      expect(result).assertEqual('5.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0039 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0040
     * @tc.number SUB_RESMGR_UTILS_03_0040
     * @tc.desc   formatByteSize(6790) renders 6.6 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0040 begin');
      const result: string = ResourceUtils.formatByteSize(6790);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('6.6 KB'));
      expect(result).assertEqual('6.6 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0040 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0041
     * @tc.number SUB_RESMGR_UTILS_03_0041
     * @tc.desc   formatByteSize(7000) renders 6.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0041 begin');
      const result: string = ResourceUtils.formatByteSize(7000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('6.8 KB'));
      expect(result).assertEqual('6.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0041 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0042
     * @tc.number SUB_RESMGR_UTILS_03_0042
     * @tc.desc   formatByteSize(8000) renders 7.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0042 begin');
      const result: string = ResourceUtils.formatByteSize(8000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('7.8 KB'));
      expect(result).assertEqual('7.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0042 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0043
     * @tc.number SUB_RESMGR_UTILS_03_0043
     * @tc.desc   formatByteSize(9078) renders 8.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0043 begin');
      const result: string = ResourceUtils.formatByteSize(9078);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('8.8 KB'));
      expect(result).assertEqual('8.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0043 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0044
     * @tc.number SUB_RESMGR_UTILS_03_0044
     * @tc.desc   formatByteSize(10000) renders 9.7 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0044 begin');
      const result: string = ResourceUtils.formatByteSize(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('9.7 KB'));
      expect(result).assertEqual('9.7 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0044 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0045
     * @tc.number SUB_RESMGR_UTILS_03_0045
     * @tc.desc   formatByteSize(16384) renders 16.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0045 begin');
      const result: string = ResourceUtils.formatByteSize(16384);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('16.0 KB'));
      expect(result).assertEqual('16.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0045 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0046
     * @tc.number SUB_RESMGR_UTILS_03_0046
     * @tc.desc   formatByteSize(32768) renders 32.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0046 begin');
      const result: string = ResourceUtils.formatByteSize(32768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('32.0 KB'));
      expect(result).assertEqual('32.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0046 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0047
     * @tc.number SUB_RESMGR_UTILS_03_0047
     * @tc.desc   formatByteSize(65536) renders 64.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0047 begin');
      const result: string = ResourceUtils.formatByteSize(65536);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('64.0 KB'));
      expect(result).assertEqual('64.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0047 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0048
     * @tc.number SUB_RESMGR_UTILS_03_0048
     * @tc.desc   formatByteSize(100000) renders 97.6 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0048 begin');
      const result: string = ResourceUtils.formatByteSize(100000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('97.6 KB'));
      expect(result).assertEqual('97.6 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0048 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0049
     * @tc.number SUB_RESMGR_UTILS_03_0049
     * @tc.desc   formatByteSize(262144) renders 256.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0049 begin');
      const result: string = ResourceUtils.formatByteSize(262144);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('256.0 KB'));
      expect(result).assertEqual('256.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0049 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0050
     * @tc.number SUB_RESMGR_UTILS_03_0050
     * @tc.desc   formatByteSize(524288) renders 512.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0050 begin');
      const result: string = ResourceUtils.formatByteSize(524288);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('512.0 KB'));
      expect(result).assertEqual('512.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0050 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0051
     * @tc.number SUB_RESMGR_UTILS_03_0051
     * @tc.desc   formatByteSize(1000000) renders 976.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0051 begin');
      const result: string = ResourceUtils.formatByteSize(1000000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('976.5 KB'));
      expect(result).assertEqual('976.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0051 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0052
     * @tc.number SUB_RESMGR_UTILS_03_0052
     * @tc.desc   formatByteSize(1023999) renders 999.9 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0052 begin');
      const result: string = ResourceUtils.formatByteSize(1023999);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('999.9 KB'));
      expect(result).assertEqual('999.9 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0052 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0053
     * @tc.number SUB_RESMGR_UTILS_03_0053
     * @tc.desc   formatByteSize(1024000) renders 1000.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0053 begin');
      const result: string = ResourceUtils.formatByteSize(1024000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1000.0 KB'));
      expect(result).assertEqual('1000.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0053 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0054
     * @tc.number SUB_RESMGR_UTILS_03_0054
     * @tc.desc   formatByteSize(1048576) renders 1.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0054 begin');
      const result: string = ResourceUtils.formatByteSize(1048576);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1.0 MB'));
      expect(result).assertEqual('1.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0054 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0055
     * @tc.number SUB_RESMGR_UTILS_03_0055
     * @tc.desc   formatByteSize(1048577) renders 1.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0055 begin');
      const result: string = ResourceUtils.formatByteSize(1048577);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1.0 MB'));
      expect(result).assertEqual('1.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0055 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0056
     * @tc.number SUB_RESMGR_UTILS_03_0056
     * @tc.desc   formatByteSize(1572864) renders 1.5 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0056 begin');
      const result: string = ResourceUtils.formatByteSize(1572864);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1.5 MB'));
      expect(result).assertEqual('1.5 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0056 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0057
     * @tc.number SUB_RESMGR_UTILS_03_0057
     * @tc.desc   formatByteSize(2097152) renders 2.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0057 begin');
      const result: string = ResourceUtils.formatByteSize(2097152);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 MB'));
      expect(result).assertEqual('2.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0057 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0058
     * @tc.number SUB_RESMGR_UTILS_03_0058
     * @tc.desc   formatByteSize(3145728) renders 3.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0058 begin');
      const result: string = ResourceUtils.formatByteSize(3145728);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('3.0 MB'));
      expect(result).assertEqual('3.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0058 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0059
     * @tc.number SUB_RESMGR_UTILS_03_0059
     * @tc.desc   formatByteSize(5242880) renders 5.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0059 begin');
      const result: string = ResourceUtils.formatByteSize(5242880);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('5.0 MB'));
      expect(result).assertEqual('5.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0059 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0060
     * @tc.number SUB_RESMGR_UTILS_03_0060
     * @tc.desc   formatByteSize(10485760) renders 10.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0060 begin');
      const result: string = ResourceUtils.formatByteSize(10485760);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('10.0 MB'));
      expect(result).assertEqual('10.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0060 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0061
     * @tc.number SUB_RESMGR_UTILS_03_0061
     * @tc.desc   formatByteSize(104857600) renders 100.0 MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0061 begin');
      const result: string = ResourceUtils.formatByteSize(104857600);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('100.0 MB'));
      expect(result).assertEqual('100.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('MB')));
      expect(result.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0061 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0062
     * @tc.number SUB_RESMGR_UTILS_03_0062
     * @tc.desc   formatByteSize(1300) renders 1.2 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0062 begin');
      const result: string = ResourceUtils.formatByteSize(1300);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1.2 KB'));
      expect(result).assertEqual('1.2 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0062 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0063
     * @tc.number SUB_RESMGR_UTILS_03_0063
     * @tc.desc   formatByteSize(1400) renders 1.3 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0063 begin');
      const result: string = ResourceUtils.formatByteSize(1400);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1.3 KB'));
      expect(result).assertEqual('1.3 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0063 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0064
     * @tc.number SUB_RESMGR_UTILS_03_0064
     * @tc.desc   formatByteSize(1500) renders 1.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0064 begin');
      const result: string = ResourceUtils.formatByteSize(1500);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1.4 KB'));
      expect(result).assertEqual('1.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0064 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0065
     * @tc.number SUB_RESMGR_UTILS_03_0065
     * @tc.desc   formatByteSize(1700) renders 1.6 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0065 begin');
      const result: string = ResourceUtils.formatByteSize(1700);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1.6 KB'));
      expect(result).assertEqual('1.6 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0065 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0066
     * @tc.number SUB_RESMGR_UTILS_03_0066
     * @tc.desc   formatByteSize(1800) renders 1.7 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0066 begin');
      const result: string = ResourceUtils.formatByteSize(1800);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1.7 KB'));
      expect(result).assertEqual('1.7 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0066 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0067
     * @tc.number SUB_RESMGR_UTILS_03_0067
     * @tc.desc   formatByteSize(1900) renders 1.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0067 begin');
      const result: string = ResourceUtils.formatByteSize(1900);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1.8 KB'));
      expect(result).assertEqual('1.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0067 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0068
     * @tc.number SUB_RESMGR_UTILS_03_0068
     * @tc.desc   formatByteSize(2000) renders 1.9 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0068 begin');
      const result: string = ResourceUtils.formatByteSize(2000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1.9 KB'));
      expect(result).assertEqual('1.9 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0068 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0069
     * @tc.number SUB_RESMGR_UTILS_03_0069
     * @tc.desc   formatByteSize(2100) renders 2.0 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0069 begin');
      const result: string = ResourceUtils.formatByteSize(2100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.0 KB'));
      expect(result).assertEqual('2.0 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0069 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0070
     * @tc.number SUB_RESMGR_UTILS_03_0070
     * @tc.desc   formatByteSize(2200) renders 2.1 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0070 begin');
      const result: string = ResourceUtils.formatByteSize(2200);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.1 KB'));
      expect(result).assertEqual('2.1 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0070 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0071
     * @tc.number SUB_RESMGR_UTILS_03_0071
     * @tc.desc   formatByteSize(2300) renders 2.2 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0071 begin');
      const result: string = ResourceUtils.formatByteSize(2300);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.2 KB'));
      expect(result).assertEqual('2.2 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0071 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0072
     * @tc.number SUB_RESMGR_UTILS_03_0072
     * @tc.desc   formatByteSize(2400) renders 2.3 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0072 begin');
      const result: string = ResourceUtils.formatByteSize(2400);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.3 KB'));
      expect(result).assertEqual('2.3 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0072 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0073
     * @tc.number SUB_RESMGR_UTILS_03_0073
     * @tc.desc   formatByteSize(2500) renders 2.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0073 begin');
      const result: string = ResourceUtils.formatByteSize(2500);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.4 KB'));
      expect(result).assertEqual('2.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0073 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0074
     * @tc.number SUB_RESMGR_UTILS_03_0074
     * @tc.desc   formatByteSize(3000) renders 2.9 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0074 begin');
      const result: string = ResourceUtils.formatByteSize(3000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2.9 KB'));
      expect(result).assertEqual('2.9 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0074 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0075
     * @tc.number SUB_RESMGR_UTILS_03_0075
     * @tc.desc   formatByteSize(3500) renders 3.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0075 begin');
      const result: string = ResourceUtils.formatByteSize(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('3.4 KB'));
      expect(result).assertEqual('3.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0075 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0076
     * @tc.number SUB_RESMGR_UTILS_03_0076
     * @tc.desc   formatByteSize(4000) renders 3.9 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0076 begin');
      const result: string = ResourceUtils.formatByteSize(4000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('3.9 KB'));
      expect(result).assertEqual('3.9 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0076 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0077
     * @tc.number SUB_RESMGR_UTILS_03_0077
     * @tc.desc   formatByteSize(4500) renders 4.3 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0077 begin');
      const result: string = ResourceUtils.formatByteSize(4500);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('4.3 KB'));
      expect(result).assertEqual('4.3 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0077 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0078
     * @tc.number SUB_RESMGR_UTILS_03_0078
     * @tc.desc   formatByteSize(5500) renders 5.3 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0078 begin');
      const result: string = ResourceUtils.formatByteSize(5500);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('5.3 KB'));
      expect(result).assertEqual('5.3 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0078 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0079
     * @tc.number SUB_RESMGR_UTILS_03_0079
     * @tc.desc   formatByteSize(6500) renders 6.3 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0079 begin');
      const result: string = ResourceUtils.formatByteSize(6500);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('6.3 KB'));
      expect(result).assertEqual('6.3 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0079 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0080
     * @tc.number SUB_RESMGR_UTILS_03_0080
     * @tc.desc   formatByteSize(7500) renders 7.3 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0080 begin');
      const result: string = ResourceUtils.formatByteSize(7500);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('7.3 KB'));
      expect(result).assertEqual('7.3 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0080 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0081
     * @tc.number SUB_RESMGR_UTILS_03_0081
     * @tc.desc   formatByteSize(8500) renders 8.3 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0081 begin');
      const result: string = ResourceUtils.formatByteSize(8500);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('8.3 KB'));
      expect(result).assertEqual('8.3 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0081 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0082
     * @tc.number SUB_RESMGR_UTILS_03_0082
     * @tc.desc   formatByteSize(9500) renders 9.2 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0082 begin');
      const result: string = ResourceUtils.formatByteSize(9500);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('9.2 KB'));
      expect(result).assertEqual('9.2 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0082 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0083
     * @tc.number SUB_RESMGR_UTILS_03_0083
     * @tc.desc   formatByteSize(11000) renders 10.7 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0083 begin');
      const result: string = ResourceUtils.formatByteSize(11000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('10.7 KB'));
      expect(result).assertEqual('10.7 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0083 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0084
     * @tc.number SUB_RESMGR_UTILS_03_0084
     * @tc.desc   formatByteSize(12000) renders 11.7 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0084 begin');
      const result: string = ResourceUtils.formatByteSize(12000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('11.7 KB'));
      expect(result).assertEqual('11.7 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0084 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0085
     * @tc.number SUB_RESMGR_UTILS_03_0085
     * @tc.desc   formatByteSize(20000) renders 19.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0085 begin');
      const result: string = ResourceUtils.formatByteSize(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('19.5 KB'));
      expect(result).assertEqual('19.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0085 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0086
     * @tc.number SUB_RESMGR_UTILS_03_0086
     * @tc.desc   formatByteSize(50000) renders 48.8 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0086 begin');
      const result: string = ResourceUtils.formatByteSize(50000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48.8 KB'));
      expect(result).assertEqual('48.8 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0086 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0087
     * @tc.number SUB_RESMGR_UTILS_03_0087
     * @tc.desc   formatByteSize(200000) renders 195.3 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0087 begin');
      const result: string = ResourceUtils.formatByteSize(200000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('195.3 KB'));
      expect(result).assertEqual('195.3 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0087 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0088
     * @tc.number SUB_RESMGR_UTILS_03_0088
     * @tc.desc   formatByteSize(500000) renders 488.2 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0088 begin');
      const result: string = ResourceUtils.formatByteSize(500000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('488.2 KB'));
      expect(result).assertEqual('488.2 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0088 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0089
     * @tc.number SUB_RESMGR_UTILS_03_0089
     * @tc.desc   formatByteSize(750000) renders 732.4 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0089 begin');
      const result: string = ResourceUtils.formatByteSize(750000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('732.4 KB'));
      expect(result).assertEqual('732.4 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0089 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0090
     * @tc.number SUB_RESMGR_UTILS_03_0090
     * @tc.desc   formatByteSize(999999) renders 976.5 KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0090 begin');
      const result: string = ResourceUtils.formatByteSize(999999);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('976.5 KB'));
      expect(result).assertEqual('976.5 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('KB')));
      expect(result.endsWith('KB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(' ') === result.lastIndexOf(' ')));
      expect(result.indexOf(' ') === result.lastIndexOf(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0090 end');
    })

    /**
     * @tc.name   testResourceUtilsBytes0091
     * @tc.number SUB_RESMGR_UTILS_03_0091
     * @tc.desc   1 KB 与 1 MB 的进位边界以及进位前的向下舍入
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsBytes0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0091 begin');
      // 1023 字节仍用 B，1024 字节必须换成 KB
      const lastByte: string = ResourceUtils.formatByteSize(1023);
      const firstKilo: string = ResourceUtils.formatByteSize(1024);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', lastByte, '1023 B');
      expect(lastByte).assertEqual('1023 B');
      expect(firstKilo).assertEqual('1.0 KB');
      // 1 MB 之前仍停在 KB，且小数位是向下舍入而不是四舍五入
      const lastKilo: string = ResourceUtils.formatByteSize(1048575);
      const firstMega: string = ResourceUtils.formatByteSize(1048576);
      expect(lastKilo).assertEqual('1023.9 KB');
      expect(firstMega).assertEqual('1.0 MB');
      // 1126 字节的十分位仍不足 11，1127 字节才进位到 1.1 KB
      const beforeCarry: string = ResourceUtils.formatByteSize(1126);
      const afterCarry: string = ResourceUtils.formatByteSize(1127);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', beforeCarry, '1.0 KB');
      expect(beforeCarry).assertEqual('1.0 KB');
      expect(afterCarry).assertEqual('1.1 KB');
      // 非法字节数不能渲染成负数或空串
      expect(ResourceUtils.formatByteSize(-1)).assertEqual('0 B');
      expect(ResourceUtils.formatByteSize(0.5)).assertEqual('0 B');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsBytes0091 end');
    })

  })
}
