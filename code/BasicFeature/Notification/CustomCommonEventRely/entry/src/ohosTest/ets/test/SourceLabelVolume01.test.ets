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
import { EventSource, SourceLabel } from '../../../main/ets/util/Constants';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function sourceLabelTest() {
  describe('SourceLabelVolume01Test', () => {

    /**
     * @tc.name   testSourceLabel0001
     * @tc.number SUB_CCER_SRCKEY_01_0001
     * @tc.desc   来源码 1001 映射到 source_form
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSourceLabel0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0001 begin');
      const result: string = SourceLabel.of(1001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String(SourceLabel.FORM_KEY));
      expect(result).assertEqual(SourceLabel.FORM_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('source_'));
      expect(result).assertContain('source_');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0001 end');
    })

    /**
     * @tc.name   testSourceLabel0002
     * @tc.number SUB_CCER_SRCKEY_01_0002
     * @tc.desc   来源码 1002 映射到 source_page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSourceLabel0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0002 begin');
      const result: string = SourceLabel.of(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String(SourceLabel.PAGE_KEY));
      expect(result).assertEqual(SourceLabel.PAGE_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('source_'));
      expect(result).assertContain('source_');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0002 end');
    })

    /**
     * @tc.name   testSourceLabel0003
     * @tc.number SUB_CCER_SRCKEY_01_0003
     * @tc.desc   来源码 0 映射到 source_external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSourceLabel0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0003 begin');
      const result: string = SourceLabel.of(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String(SourceLabel.EXTERNAL_KEY));
      expect(result).assertEqual(SourceLabel.EXTERNAL_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('source_'));
      expect(result).assertContain('source_');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0003 end');
    })

    /**
     * @tc.name   testSourceLabel0004
     * @tc.number SUB_CCER_SRCKEY_01_0004
     * @tc.desc   来源码 -1 映射到 source_external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSourceLabel0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0004 begin');
      const result: string = SourceLabel.of(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String(SourceLabel.EXTERNAL_KEY));
      expect(result).assertEqual(SourceLabel.EXTERNAL_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('source_'));
      expect(result).assertContain('source_');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0004 end');
    })

    /**
     * @tc.name   testSourceLabel0005
     * @tc.number SUB_CCER_SRCKEY_01_0005
     * @tc.desc   来源码 1 映射到 source_external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSourceLabel0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0005 begin');
      const result: string = SourceLabel.of(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String(SourceLabel.EXTERNAL_KEY));
      expect(result).assertEqual(SourceLabel.EXTERNAL_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('source_'));
      expect(result).assertContain('source_');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0005 end');
    })

    /**
     * @tc.name   testSourceLabel0006
     * @tc.number SUB_CCER_SRCKEY_01_0006
     * @tc.desc   来源码 7 映射到 source_external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSourceLabel0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0006 begin');
      const result: string = SourceLabel.of(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String(SourceLabel.EXTERNAL_KEY));
      expect(result).assertEqual(SourceLabel.EXTERNAL_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('source_'));
      expect(result).assertContain('source_');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0006 end');
    })

    /**
     * @tc.name   testSourceLabel0007
     * @tc.number SUB_CCER_SRCKEY_01_0007
     * @tc.desc   来源码 999 映射到 source_external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSourceLabel0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0007 begin');
      const result: string = SourceLabel.of(999);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String(SourceLabel.EXTERNAL_KEY));
      expect(result).assertEqual(SourceLabel.EXTERNAL_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('source_'));
      expect(result).assertContain('source_');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0007 end');
    })

    /**
     * @tc.name   testSourceLabel0008
     * @tc.number SUB_CCER_SRCKEY_01_0008
     * @tc.desc   来源码 1000 映射到 source_external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSourceLabel0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0008 begin');
      const result: string = SourceLabel.of(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String(SourceLabel.EXTERNAL_KEY));
      expect(result).assertEqual(SourceLabel.EXTERNAL_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('source_'));
      expect(result).assertContain('source_');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0008 end');
    })

    /**
     * @tc.name   testSourceLabel0009
     * @tc.number SUB_CCER_SRCKEY_01_0009
     * @tc.desc   来源码 1003 映射到 source_external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSourceLabel0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0009 begin');
      const result: string = SourceLabel.of(1003);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String(SourceLabel.EXTERNAL_KEY));
      expect(result).assertEqual(SourceLabel.EXTERNAL_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('source_'));
      expect(result).assertContain('source_');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0009 end');
    })

    /**
     * @tc.name   testSourceLabel0010
     * @tc.number SUB_CCER_SRCKEY_01_0010
     * @tc.desc   来源码 2000 映射到 source_external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSourceLabel0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0010 begin');
      const result: string = SourceLabel.of(2000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String(SourceLabel.EXTERNAL_KEY));
      expect(result).assertEqual(SourceLabel.EXTERNAL_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('source_'));
      expect(result).assertContain('source_');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0010 end');
    })

    /**
     * @tc.name   testSourceLabel0011
     * @tc.number SUB_CCER_SRCKEY_01_0011
     * @tc.desc   来源码 2001 映射到 source_external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSourceLabel0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0011 begin');
      const result: string = SourceLabel.of(2001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String(SourceLabel.EXTERNAL_KEY));
      expect(result).assertEqual(SourceLabel.EXTERNAL_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('source_'));
      expect(result).assertContain('source_');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0011 end');
    })

    /**
     * @tc.name   testSourceLabel0012
     * @tc.number SUB_CCER_SRCKEY_01_0012
     * @tc.desc   来源码 1004 映射到 source_external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSourceLabel0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0012 begin');
      const result: string = SourceLabel.of(1004);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String(SourceLabel.EXTERNAL_KEY));
      expect(result).assertEqual(SourceLabel.EXTERNAL_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('source_'));
      expect(result).assertContain('source_');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0012 end');
    })

    /**
     * @tc.name   testSourceLabel0013
     * @tc.number SUB_CCER_SRCKEY_01_0013
     * @tc.desc   来源码 -1001 映射到 source_external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSourceLabel0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0013 begin');
      const result: string = SourceLabel.of(-1001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String(SourceLabel.EXTERNAL_KEY));
      expect(result).assertEqual(SourceLabel.EXTERNAL_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('source_'));
      expect(result).assertContain('source_');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0013 end');
    })

    /**
     * @tc.name   testSourceLabel0014
     * @tc.number SUB_CCER_SRCKEY_01_0014
     * @tc.desc   来源码 65535 映射到 source_external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSourceLabel0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0014 begin');
      const result: string = SourceLabel.of(65535);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String(SourceLabel.EXTERNAL_KEY));
      expect(result).assertEqual(SourceLabel.EXTERNAL_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('source_'));
      expect(result).assertContain('source_');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0014 end');
    })

    /**
     * @tc.name   testSourceLabel0015
     * @tc.number SUB_CCER_SRCKEY_01_0015
     * @tc.desc   来源码 65536 映射到 source_external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSourceLabel0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0015 begin');
      const result: string = SourceLabel.of(65536);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String(SourceLabel.EXTERNAL_KEY));
      expect(result).assertEqual(SourceLabel.EXTERNAL_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('source_'));
      expect(result).assertContain('source_');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0015 end');
    })

    /**
     * @tc.name   testSourceLabel0016
     * @tc.number SUB_CCER_SRCKEY_01_0016
     * @tc.desc   来源码 2147483647 映射到 source_external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSourceLabel0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0016 begin');
      const result: string = SourceLabel.of(2147483647);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String(SourceLabel.EXTERNAL_KEY));
      expect(result).assertEqual(SourceLabel.EXTERNAL_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('source_'));
      expect(result).assertContain('source_');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0016 end');
    })

    /**
     * @tc.name   testSourceLabel0017
     * @tc.number SUB_CCER_SRCKEY_01_0017
     * @tc.desc   来源码 -2147483648 映射到 source_external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSourceLabel0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0017 begin');
      const result: string = SourceLabel.of(-2147483648);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String(SourceLabel.EXTERNAL_KEY));
      expect(result).assertEqual(SourceLabel.EXTERNAL_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('source_'));
      expect(result).assertContain('source_');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0017 end');
    })

    /**
     * @tc.name   testSourceLabel0018
     * @tc.number SUB_CCER_SRCKEY_01_0018
     * @tc.desc   来源码 500 映射到 source_external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSourceLabel0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0018 begin');
      const result: string = SourceLabel.of(500);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String(SourceLabel.EXTERNAL_KEY));
      expect(result).assertEqual(SourceLabel.EXTERNAL_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('source_'));
      expect(result).assertContain('source_');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0018 end');
    })

    /**
     * @tc.name   testSourceLabel0019
     * @tc.number SUB_CCER_SRCKEY_01_0019
     * @tc.desc   来源码 501 映射到 source_external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSourceLabel0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0019 begin');
      const result: string = SourceLabel.of(501);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String(SourceLabel.EXTERNAL_KEY));
      expect(result).assertEqual(SourceLabel.EXTERNAL_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('source_'));
      expect(result).assertContain('source_');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0019 end');
    })

    /**
     * @tc.name   testSourceLabel0020
     * @tc.number SUB_CCER_SRCKEY_01_0020
     * @tc.desc   来源码 502 映射到 source_external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSourceLabel0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0020 begin');
      const result: string = SourceLabel.of(502);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String(SourceLabel.EXTERNAL_KEY));
      expect(result).assertEqual(SourceLabel.EXTERNAL_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('source_'));
      expect(result).assertContain('source_');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0020 end');
    })

    /**
     * @tc.name   testSourceLabel0021
     * @tc.number SUB_CCER_SRCKEY_01_0021
     * @tc.desc   来源码 503 映射到 source_external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSourceLabel0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0021 begin');
      const result: string = SourceLabel.of(503);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String(SourceLabel.EXTERNAL_KEY));
      expect(result).assertEqual(SourceLabel.EXTERNAL_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('source_'));
      expect(result).assertContain('source_');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0021 end');
    })

    /**
     * @tc.name   testSourceLabel0022
     * @tc.number SUB_CCER_SRCKEY_01_0022
     * @tc.desc   来源码 504 映射到 source_external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSourceLabel0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0022 begin');
      const result: string = SourceLabel.of(504);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String(SourceLabel.EXTERNAL_KEY));
      expect(result).assertEqual(SourceLabel.EXTERNAL_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('source_'));
      expect(result).assertContain('source_');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0022 end');
    })

    /**
     * @tc.name   testSourceLabel0023
     * @tc.number SUB_CCER_SRCKEY_01_0023
     * @tc.desc   来源码 505 映射到 source_external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSourceLabel0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0023 begin');
      const result: string = SourceLabel.of(505);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String(SourceLabel.EXTERNAL_KEY));
      expect(result).assertEqual(SourceLabel.EXTERNAL_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('source_'));
      expect(result).assertContain('source_');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0023 end');
    })

    /**
     * @tc.name   testSourceLabel0024
     * @tc.number SUB_CCER_SRCKEY_01_0024
     * @tc.desc   来源码 506 映射到 source_external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSourceLabel0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0024 begin');
      const result: string = SourceLabel.of(506);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String(SourceLabel.EXTERNAL_KEY));
      expect(result).assertEqual(SourceLabel.EXTERNAL_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('source_'));
      expect(result).assertContain('source_');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0024 end');
    })

    /**
     * @tc.name   testSourceLabel0025
     * @tc.number SUB_CCER_SRCKEY_01_0025
     * @tc.desc   来源码 507 映射到 source_external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSourceLabel0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0025 begin');
      const result: string = SourceLabel.of(507);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String(SourceLabel.EXTERNAL_KEY));
      expect(result).assertEqual(SourceLabel.EXTERNAL_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('source_'));
      expect(result).assertContain('source_');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0025 end');
    })

    /**
     * @tc.name   testSourceLabel0026
     * @tc.number SUB_CCER_SRCKEY_01_0026
     * @tc.desc   来源码 508 映射到 source_external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSourceLabel0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0026 begin');
      const result: string = SourceLabel.of(508);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String(SourceLabel.EXTERNAL_KEY));
      expect(result).assertEqual(SourceLabel.EXTERNAL_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('source_'));
      expect(result).assertContain('source_');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0026 end');
    })

    /**
     * @tc.name   testSourceLabel0027
     * @tc.number SUB_CCER_SRCKEY_01_0027
     * @tc.desc   来源码 509 映射到 source_external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSourceLabel0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0027 begin');
      const result: string = SourceLabel.of(509);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String(SourceLabel.EXTERNAL_KEY));
      expect(result).assertEqual(SourceLabel.EXTERNAL_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('source_'));
      expect(result).assertContain('source_');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0027 end');
    })

    /**
     * @tc.name   testSourceLabel0028
     * @tc.number SUB_CCER_SRCKEY_01_0028
     * @tc.desc   来源码 510 映射到 source_external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSourceLabel0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0028 begin');
      const result: string = SourceLabel.of(510);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String(SourceLabel.EXTERNAL_KEY));
      expect(result).assertEqual(SourceLabel.EXTERNAL_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('source_'));
      expect(result).assertContain('source_');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0028 end');
    })

    /**
     * @tc.name   testSourceLabel0029
     * @tc.number SUB_CCER_SRCKEY_01_0029
     * @tc.desc   来源码 511 映射到 source_external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSourceLabel0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0029 begin');
      const result: string = SourceLabel.of(511);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String(SourceLabel.EXTERNAL_KEY));
      expect(result).assertEqual(SourceLabel.EXTERNAL_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('source_'));
      expect(result).assertContain('source_');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0029 end');
    })

    /**
     * @tc.name   testSourceLabel0030
     * @tc.number SUB_CCER_SRCKEY_01_0030
     * @tc.desc   来源码 512 映射到 source_external
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSourceLabel0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0030 begin');
      const result: string = SourceLabel.of(512);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String(SourceLabel.EXTERNAL_KEY));
      expect(result).assertEqual(SourceLabel.EXTERNAL_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('source_'));
      expect(result).assertContain('source_');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0030 end');
    })

    /**
     * @tc.name   testSourceLabel0031
     * @tc.number SUB_CCER_SRCKEY_01_0031
     * @tc.desc   表单来源键与常量一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSourceLabel0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0031 begin');
      const result: string = SourceLabel.of(EventSource.FORM);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String(SourceLabel.FORM_KEY));
      expect(result).assertEqual(SourceLabel.FORM_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('source_form'));
      expect(result).assertEqual('source_form');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(SourceLabel.NONE_KEY),
        String('value_none'));
      expect(SourceLabel.NONE_KEY).assertEqual('value_none');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSourceLabel0031 end');
    })

  })
}
