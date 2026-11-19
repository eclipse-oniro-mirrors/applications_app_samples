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
import { EventSource } from '../../../main/ets/util/Constants';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function resolveNameTest() {
  describe('ResolveNameVolume01Test', () => {

    /**
     * @tc.name   testResolveName0001
     * @tc.number SUB_CCER_RESOLVE_0001
     * @tc.desc   来源码 1001 解析为 form
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0001 begin');
      const result: string = EventSource.resolveName(1001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_FORM));
      expect(result).assertEqual(EventSource.NAME_FORM);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_PAGE));
      expect(result === EventSource.NAME_PAGE).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('f'));
      expect(result.charAt(0)).assertEqual('f');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0001 end');
    })

    /**
     * @tc.name   testResolveName0002
     * @tc.number SUB_CCER_RESOLVE_0002
     * @tc.desc   来源码 1002 解析为 page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0002 begin');
      const result: string = EventSource.resolveName(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_PAGE));
      expect(result).assertEqual(EventSource.NAME_PAGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_EXTERNAL));
      expect(result === EventSource.NAME_EXTERNAL).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('p'));
      expect(result.charAt(0)).assertEqual('p');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0002 end');
    })

    /**
     * @tc.name   testResolveName0003
     * @tc.number SUB_CCER_RESOLVE_0003
     * @tc.desc   来源码 0 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0003 begin');
      const result: string = EventSource.resolveName(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0003 end');
    })

    /**
     * @tc.name   testResolveName0004
     * @tc.number SUB_CCER_RESOLVE_0004
     * @tc.desc   来源码 -1 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0004 begin');
      const result: string = EventSource.resolveName(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0004 end');
    })

    /**
     * @tc.name   testResolveName0005
     * @tc.number SUB_CCER_RESOLVE_0005
     * @tc.desc   来源码 1 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0005 begin');
      const result: string = EventSource.resolveName(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0005 end');
    })

    /**
     * @tc.name   testResolveName0006
     * @tc.number SUB_CCER_RESOLVE_0006
     * @tc.desc   来源码 2 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0006 begin');
      const result: string = EventSource.resolveName(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0006 end');
    })

    /**
     * @tc.name   testResolveName0007
     * @tc.number SUB_CCER_RESOLVE_0007
     * @tc.desc   来源码 3 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0007 begin');
      const result: string = EventSource.resolveName(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0007 end');
    })

    /**
     * @tc.name   testResolveName0008
     * @tc.number SUB_CCER_RESOLVE_0008
     * @tc.desc   来源码 99 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0008 begin');
      const result: string = EventSource.resolveName(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0008 end');
    })

    /**
     * @tc.name   testResolveName0009
     * @tc.number SUB_CCER_RESOLVE_0009
     * @tc.desc   来源码 100 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0009 begin');
      const result: string = EventSource.resolveName(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0009 end');
    })

    /**
     * @tc.name   testResolveName0010
     * @tc.number SUB_CCER_RESOLVE_0010
     * @tc.desc   来源码 255 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0010 begin');
      const result: string = EventSource.resolveName(255);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0010 end');
    })

    /**
     * @tc.name   testResolveName0011
     * @tc.number SUB_CCER_RESOLVE_0011
     * @tc.desc   来源码 999 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0011 begin');
      const result: string = EventSource.resolveName(999);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0011 end');
    })

    /**
     * @tc.name   testResolveName0012
     * @tc.number SUB_CCER_RESOLVE_0012
     * @tc.desc   来源码 1000 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0012 begin');
      const result: string = EventSource.resolveName(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0012 end');
    })

    /**
     * @tc.name   testResolveName0013
     * @tc.number SUB_CCER_RESOLVE_0013
     * @tc.desc   来源码 1003 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0013 begin');
      const result: string = EventSource.resolveName(1003);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0013 end');
    })

    /**
     * @tc.name   testResolveName0014
     * @tc.number SUB_CCER_RESOLVE_0014
     * @tc.desc   来源码 1004 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0014 begin');
      const result: string = EventSource.resolveName(1004);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0014 end');
    })

    /**
     * @tc.name   testResolveName0015
     * @tc.number SUB_CCER_RESOLVE_0015
     * @tc.desc   来源码 1200 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0015 begin');
      const result: string = EventSource.resolveName(1200);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0015 end');
    })

    /**
     * @tc.name   testResolveName0016
     * @tc.number SUB_CCER_RESOLVE_0016
     * @tc.desc   来源码 2000 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0016 begin');
      const result: string = EventSource.resolveName(2000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0016 end');
    })

    /**
     * @tc.name   testResolveName0017
     * @tc.number SUB_CCER_RESOLVE_0017
     * @tc.desc   来源码 10020 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0017 begin');
      const result: string = EventSource.resolveName(10020);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0017 end');
    })

    /**
     * @tc.name   testResolveName0018
     * @tc.number SUB_CCER_RESOLVE_0018
     * @tc.desc   来源码 100200 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0018 begin');
      const result: string = EventSource.resolveName(100200);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0018 end');
    })

    /**
     * @tc.name   testResolveName0019
     * @tc.number SUB_CCER_RESOLVE_0019
     * @tc.desc   来源码 1023 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0019 begin');
      const result: string = EventSource.resolveName(1023);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0019 end');
    })

    /**
     * @tc.name   testResolveName0020
     * @tc.number SUB_CCER_RESOLVE_0020
     * @tc.desc   来源码 1024 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0020 begin');
      const result: string = EventSource.resolveName(1024);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0020 end');
    })

    /**
     * @tc.name   testResolveName0021
     * @tc.number SUB_CCER_RESOLVE_0021
     * @tc.desc   来源码 2048 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0021 begin');
      const result: string = EventSource.resolveName(2048);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0021 end');
    })

    /**
     * @tc.name   testResolveName0022
     * @tc.number SUB_CCER_RESOLVE_0022
     * @tc.desc   来源码 4096 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0022 begin');
      const result: string = EventSource.resolveName(4096);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0022 end');
    })

    /**
     * @tc.name   testResolveName0023
     * @tc.number SUB_CCER_RESOLVE_0023
     * @tc.desc   来源码 8192 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0023 begin');
      const result: string = EventSource.resolveName(8192);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0023 end');
    })

    /**
     * @tc.name   testResolveName0024
     * @tc.number SUB_CCER_RESOLVE_0024
     * @tc.desc   来源码 9999 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0024 begin');
      const result: string = EventSource.resolveName(9999);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0024 end');
    })

    /**
     * @tc.name   testResolveName0025
     * @tc.number SUB_CCER_RESOLVE_0025
     * @tc.desc   来源码 10000 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0025 begin');
      const result: string = EventSource.resolveName(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0025 end');
    })

    /**
     * @tc.name   testResolveName0026
     * @tc.number SUB_CCER_RESOLVE_0026
     * @tc.desc   来源码 60000 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0026 begin');
      const result: string = EventSource.resolveName(60000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0026 end');
    })

    /**
     * @tc.name   testResolveName0027
     * @tc.number SUB_CCER_RESOLVE_0027
     * @tc.desc   来源码 65535 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0027 begin');
      const result: string = EventSource.resolveName(65535);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0027 end');
    })

    /**
     * @tc.name   testResolveName0028
     * @tc.number SUB_CCER_RESOLVE_0028
     * @tc.desc   来源码 65536 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0028 begin');
      const result: string = EventSource.resolveName(65536);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0028 end');
    })

    /**
     * @tc.name   testResolveName0029
     * @tc.number SUB_CCER_RESOLVE_0029
     * @tc.desc   来源码 65537 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0029 begin');
      const result: string = EventSource.resolveName(65537);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0029 end');
    })

    /**
     * @tc.name   testResolveName0030
     * @tc.number SUB_CCER_RESOLVE_0030
     * @tc.desc   来源码 999999 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0030 begin');
      const result: string = EventSource.resolveName(999999);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0030 end');
    })

    /**
     * @tc.name   testResolveName0031
     * @tc.number SUB_CCER_RESOLVE_0031
     * @tc.desc   来源码 1000000 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0031 begin');
      const result: string = EventSource.resolveName(1000000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0031 end');
    })

    /**
     * @tc.name   testResolveName0032
     * @tc.number SUB_CCER_RESOLVE_0032
     * @tc.desc   来源码 16777215 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0032 begin');
      const result: string = EventSource.resolveName(16777215);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0032 end');
    })

    /**
     * @tc.name   testResolveName0033
     * @tc.number SUB_CCER_RESOLVE_0033
     * @tc.desc   来源码 16777216 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0033 begin');
      const result: string = EventSource.resolveName(16777216);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0033 end');
    })

    /**
     * @tc.name   testResolveName0034
     * @tc.number SUB_CCER_RESOLVE_0034
     * @tc.desc   来源码 2147483647 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0034 begin');
      const result: string = EventSource.resolveName(2147483647);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0034 end');
    })

    /**
     * @tc.name   testResolveName0035
     * @tc.number SUB_CCER_RESOLVE_0035
     * @tc.desc   来源码 -2147483648 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0035 begin');
      const result: string = EventSource.resolveName(-2147483648);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0035 end');
    })

    /**
     * @tc.name   testResolveName0036
     * @tc.number SUB_CCER_RESOLVE_0036
     * @tc.desc   来源码 -1001 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0036 begin');
      const result: string = EventSource.resolveName(-1001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0036 end');
    })

    /**
     * @tc.name   testResolveName0037
     * @tc.number SUB_CCER_RESOLVE_0037
     * @tc.desc   来源码 -1002 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0037 begin');
      const result: string = EventSource.resolveName(-1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0037 end');
    })

    /**
     * @tc.name   testResolveName0038
     * @tc.number SUB_CCER_RESOLVE_0038
     * @tc.desc   来源码 -1003 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0038 begin');
      const result: string = EventSource.resolveName(-1003);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0038 end');
    })

    /**
     * @tc.name   testResolveName0039
     * @tc.number SUB_CCER_RESOLVE_0039
     * @tc.desc   来源码 2002 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0039 begin');
      const result: string = EventSource.resolveName(2002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0039 end');
    })

    /**
     * @tc.name   testResolveName0040
     * @tc.number SUB_CCER_RESOLVE_0040
     * @tc.desc   来源码 2004 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0040 begin');
      const result: string = EventSource.resolveName(2004);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0040 end');
    })

    /**
     * @tc.name   testResolveName0041
     * @tc.number SUB_CCER_RESOLVE_0041
     * @tc.desc   来源码 1100 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0041 begin');
      const result: string = EventSource.resolveName(1100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0041 end');
    })

    /**
     * @tc.name   testResolveName0042
     * @tc.number SUB_CCER_RESOLVE_0042
     * @tc.desc   来源码 1010 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0042 begin');
      const result: string = EventSource.resolveName(1010);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0042 end');
    })

    /**
     * @tc.name   testResolveName0043
     * @tc.number SUB_CCER_RESOLVE_0043
     * @tc.desc   来源码 1111 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0043 begin');
      const result: string = EventSource.resolveName(1111);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0043 end');
    })

    /**
     * @tc.name   testResolveName0044
     * @tc.number SUB_CCER_RESOLVE_0044
     * @tc.desc   来源码 22 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0044 begin');
      const result: string = EventSource.resolveName(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0044 end');
    })

    /**
     * @tc.name   testResolveName0045
     * @tc.number SUB_CCER_RESOLVE_0045
     * @tc.desc   来源码 333 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0045 begin');
      const result: string = EventSource.resolveName(333);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0045 end');
    })

    /**
     * @tc.name   testResolveName0046
     * @tc.number SUB_CCER_RESOLVE_0046
     * @tc.desc   来源码 4444 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0046 begin');
      const result: string = EventSource.resolveName(4444);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0046 end');
    })

    /**
     * @tc.name   testResolveName0047
     * @tc.number SUB_CCER_RESOLVE_0047
     * @tc.desc   来源码 55555 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0047 begin');
      const result: string = EventSource.resolveName(55555);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0047 end');
    })

    /**
     * @tc.name   testResolveName0048
     * @tc.number SUB_CCER_RESOLVE_0048
     * @tc.desc   来源码 666666 解析为 external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0048 begin');
      const result: string = EventSource.resolveName(666666);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(EventSource.NAME_EXTERNAL));
      expect(result).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === EventSource.NAME_FORM));
      expect(result === EventSource.NAME_FORM).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.charAt(0)), String('e'));
      expect(result.charAt(0)).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0048 end');
    })

    /**
     * @tc.name   testResolveName0049
     * @tc.number SUB_CCER_RESOLVE_0049
     * @tc.desc   契约码与安全整数极值同例校验，确认 form/page 分支互不串台
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResolveName0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0049 begin');
      const formName: string = EventSource.resolveName(EventSource.FORM);
      const pageName: string = EventSource.resolveName(EventSource.PAGE);
      const maxSafe: string = EventSource.resolveName(Number.MAX_SAFE_INTEGER);
      const minSafe: string = EventSource.resolveName(-Number.MAX_SAFE_INTEGER);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'formName=%{public}s pageName=%{public}s', formName, pageName);
      expect(formName).assertEqual(EventSource.NAME_FORM);
      expect(pageName).assertEqual(EventSource.NAME_PAGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'maxSafe=%{public}s minSafe=%{public}s', maxSafe, minSafe);
      expect(maxSafe).assertEqual(EventSource.NAME_EXTERNAL);
      expect(minSafe).assertEqual(EventSource.NAME_EXTERNAL);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResolveName0049 end');
    })
  })
}
