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
import { FormPublishCounter } from '../../../main/ets/feature/FormPublishCounter';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function formCounterTest() {
  describe('FormCounterVolume01Test', () => {

    /**
     * @tc.name   testFormCounter0001
     * @tc.number SUB_CCER_FCOUNTER_01_0001
     * @tc.desc   未知卡片 form_01 的计数为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0001 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);

      const result: number = counter.get("form_01");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(0));
      expect(counter.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0001 end');
    })

    /**
     * @tc.name   testFormCounter0002
     * @tc.number SUB_CCER_FCOUNTER_01_0002
     * @tc.desc   未知卡片 form_02 的计数为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0002 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);

      const result: number = counter.get("form_02");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(0));
      expect(counter.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0002 end');
    })

    /**
     * @tc.name   testFormCounter0003
     * @tc.number SUB_CCER_FCOUNTER_01_0003
     * @tc.desc   未知卡片 form_03 的计数为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0003 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);

      const result: number = counter.get("form_03");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(0));
      expect(counter.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0003 end');
    })

    /**
     * @tc.name   testFormCounter0004
     * @tc.number SUB_CCER_FCOUNTER_01_0004
     * @tc.desc   未知卡片 form_04 的计数为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0004 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);

      const result: number = counter.get("form_04");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(0));
      expect(counter.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0004 end');
    })

    /**
     * @tc.name   testFormCounter0005
     * @tc.number SUB_CCER_FCOUNTER_01_0005
     * @tc.desc   未知卡片 form_05 的计数为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0005 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);

      const result: number = counter.get("form_05");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(0));
      expect(counter.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0005 end');
    })

    /**
     * @tc.name   testFormCounter0006
     * @tc.number SUB_CCER_FCOUNTER_01_0006
     * @tc.desc   未知卡片 form_06 的计数为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0006 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);

      const result: number = counter.get("form_06");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(0));
      expect(counter.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0006 end');
    })

    /**
     * @tc.name   testFormCounter0007
     * @tc.number SUB_CCER_FCOUNTER_01_0007
     * @tc.desc   未知卡片 form_07 的计数为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0007 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);

      const result: number = counter.get("form_07");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(0));
      expect(counter.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0007 end');
    })

    /**
     * @tc.name   testFormCounter0008
     * @tc.number SUB_CCER_FCOUNTER_01_0008
     * @tc.desc   未知卡片 form_08 的计数为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0008 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);

      const result: number = counter.get("form_08");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(0));
      expect(counter.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0008 end');
    })

    /**
     * @tc.name   testFormCounter0009
     * @tc.number SUB_CCER_FCOUNTER_01_0009
     * @tc.desc   未知卡片 form_09 的计数为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0009 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);

      const result: number = counter.get("form_09");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(0));
      expect(counter.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0009 end');
    })

    /**
     * @tc.name   testFormCounter0010
     * @tc.number SUB_CCER_FCOUNTER_01_0010
     * @tc.desc   未知卡片 form_10 的计数为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0010 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);

      const result: number = counter.get("form_10");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(0));
      expect(counter.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0010 end');
    })

    /**
     * @tc.name   testFormCounter0011
     * @tc.number SUB_CCER_FCOUNTER_01_0011
     * @tc.desc   卡片 form_01 发布 1 次后计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0011 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_01");
      const result: number = counter.get("form_01");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0011 end');
    })

    /**
     * @tc.name   testFormCounter0012
     * @tc.number SUB_CCER_FCOUNTER_01_0012
     * @tc.desc   卡片 form_02 发布 1 次后计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0012 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_02");
      const result: number = counter.get("form_02");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0012 end');
    })

    /**
     * @tc.name   testFormCounter0013
     * @tc.number SUB_CCER_FCOUNTER_01_0013
     * @tc.desc   卡片 form_03 发布 1 次后计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0013 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_03");
      const result: number = counter.get("form_03");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0013 end');
    })

    /**
     * @tc.name   testFormCounter0014
     * @tc.number SUB_CCER_FCOUNTER_01_0014
     * @tc.desc   卡片 form_04 发布 1 次后计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0014 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_04");
      const result: number = counter.get("form_04");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0014 end');
    })

    /**
     * @tc.name   testFormCounter0015
     * @tc.number SUB_CCER_FCOUNTER_01_0015
     * @tc.desc   卡片 form_05 发布 1 次后计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0015 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_05");
      const result: number = counter.get("form_05");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0015 end');
    })

    /**
     * @tc.name   testFormCounter0016
     * @tc.number SUB_CCER_FCOUNTER_01_0016
     * @tc.desc   卡片 form_06 发布 1 次后计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0016 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_06");
      const result: number = counter.get("form_06");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0016 end');
    })

    /**
     * @tc.name   testFormCounter0017
     * @tc.number SUB_CCER_FCOUNTER_01_0017
     * @tc.desc   卡片 form_07 发布 1 次后计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0017 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_07");
      const result: number = counter.get("form_07");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0017 end');
    })

    /**
     * @tc.name   testFormCounter0018
     * @tc.number SUB_CCER_FCOUNTER_01_0018
     * @tc.desc   卡片 form_08 发布 1 次后计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0018 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_08");
      const result: number = counter.get("form_08");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0018 end');
    })

    /**
     * @tc.name   testFormCounter0019
     * @tc.number SUB_CCER_FCOUNTER_01_0019
     * @tc.desc   卡片 form_09 发布 1 次后计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0019 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_09");
      const result: number = counter.get("form_09");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0019 end');
    })

    /**
     * @tc.name   testFormCounter0020
     * @tc.number SUB_CCER_FCOUNTER_01_0020
     * @tc.desc   卡片 form_10 发布 1 次后计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0020 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_10");
      const result: number = counter.get("form_10");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0020 end');
    })

    /**
     * @tc.name   testFormCounter0021
     * @tc.number SUB_CCER_FCOUNTER_01_0021
     * @tc.desc   卡片 form_01 发布 2 次后计数为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0021 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_01"); counter.increment("form_01");
      const result: number = counter.get("form_01");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0021 end');
    })

    /**
     * @tc.name   testFormCounter0022
     * @tc.number SUB_CCER_FCOUNTER_01_0022
     * @tc.desc   卡片 form_02 发布 2 次后计数为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0022 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_02"); counter.increment("form_02");
      const result: number = counter.get("form_02");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0022 end');
    })

    /**
     * @tc.name   testFormCounter0023
     * @tc.number SUB_CCER_FCOUNTER_01_0023
     * @tc.desc   卡片 form_03 发布 2 次后计数为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0023 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_03"); counter.increment("form_03");
      const result: number = counter.get("form_03");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0023 end');
    })

    /**
     * @tc.name   testFormCounter0024
     * @tc.number SUB_CCER_FCOUNTER_01_0024
     * @tc.desc   卡片 form_04 发布 2 次后计数为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0024 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_04"); counter.increment("form_04");
      const result: number = counter.get("form_04");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0024 end');
    })

    /**
     * @tc.name   testFormCounter0025
     * @tc.number SUB_CCER_FCOUNTER_01_0025
     * @tc.desc   卡片 form_05 发布 2 次后计数为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0025 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_05"); counter.increment("form_05");
      const result: number = counter.get("form_05");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0025 end');
    })

    /**
     * @tc.name   testFormCounter0026
     * @tc.number SUB_CCER_FCOUNTER_01_0026
     * @tc.desc   卡片 form_06 发布 2 次后计数为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0026 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_06"); counter.increment("form_06");
      const result: number = counter.get("form_06");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0026 end');
    })

    /**
     * @tc.name   testFormCounter0027
     * @tc.number SUB_CCER_FCOUNTER_01_0027
     * @tc.desc   卡片 form_07 发布 2 次后计数为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0027 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_07"); counter.increment("form_07");
      const result: number = counter.get("form_07");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0027 end');
    })

    /**
     * @tc.name   testFormCounter0028
     * @tc.number SUB_CCER_FCOUNTER_01_0028
     * @tc.desc   卡片 form_08 发布 2 次后计数为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0028 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_08"); counter.increment("form_08");
      const result: number = counter.get("form_08");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0028 end');
    })

    /**
     * @tc.name   testFormCounter0029
     * @tc.number SUB_CCER_FCOUNTER_01_0029
     * @tc.desc   卡片 form_09 发布 2 次后计数为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0029 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_09"); counter.increment("form_09");
      const result: number = counter.get("form_09");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0029 end');
    })

    /**
     * @tc.name   testFormCounter0030
     * @tc.number SUB_CCER_FCOUNTER_01_0030
     * @tc.desc   卡片 form_10 发布 2 次后计数为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0030 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_10"); counter.increment("form_10");
      const result: number = counter.get("form_10");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0030 end');
    })

    /**
     * @tc.name   testFormCounter0031
     * @tc.number SUB_CCER_FCOUNTER_01_0031
     * @tc.desc   卡片 form_01 发布 3 次后计数为 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0031 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_01"); counter.increment("form_01"); counter.increment("form_01");
      const result: number = counter.get("form_01");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0031 end');
    })

    /**
     * @tc.name   testFormCounter0032
     * @tc.number SUB_CCER_FCOUNTER_01_0032
     * @tc.desc   卡片 form_02 发布 3 次后计数为 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0032 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_02"); counter.increment("form_02"); counter.increment("form_02");
      const result: number = counter.get("form_02");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0032 end');
    })

    /**
     * @tc.name   testFormCounter0033
     * @tc.number SUB_CCER_FCOUNTER_01_0033
     * @tc.desc   卡片 form_03 发布 3 次后计数为 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0033 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_03"); counter.increment("form_03"); counter.increment("form_03");
      const result: number = counter.get("form_03");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0033 end');
    })

    /**
     * @tc.name   testFormCounter0034
     * @tc.number SUB_CCER_FCOUNTER_01_0034
     * @tc.desc   卡片 form_04 发布 3 次后计数为 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0034 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_04"); counter.increment("form_04"); counter.increment("form_04");
      const result: number = counter.get("form_04");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0034 end');
    })

    /**
     * @tc.name   testFormCounter0035
     * @tc.number SUB_CCER_FCOUNTER_01_0035
     * @tc.desc   卡片 form_05 发布 3 次后计数为 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0035 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_05"); counter.increment("form_05"); counter.increment("form_05");
      const result: number = counter.get("form_05");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0035 end');
    })

    /**
     * @tc.name   testFormCounter0036
     * @tc.number SUB_CCER_FCOUNTER_01_0036
     * @tc.desc   卡片 form_06 发布 3 次后计数为 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0036 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_06"); counter.increment("form_06"); counter.increment("form_06");
      const result: number = counter.get("form_06");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0036 end');
    })

    /**
     * @tc.name   testFormCounter0037
     * @tc.number SUB_CCER_FCOUNTER_01_0037
     * @tc.desc   卡片 form_07 发布 3 次后计数为 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0037 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_07"); counter.increment("form_07"); counter.increment("form_07");
      const result: number = counter.get("form_07");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0037 end');
    })

    /**
     * @tc.name   testFormCounter0038
     * @tc.number SUB_CCER_FCOUNTER_01_0038
     * @tc.desc   卡片 form_08 发布 3 次后计数为 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0038 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_08"); counter.increment("form_08"); counter.increment("form_08");
      const result: number = counter.get("form_08");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0038 end');
    })

    /**
     * @tc.name   testFormCounter0039
     * @tc.number SUB_CCER_FCOUNTER_01_0039
     * @tc.desc   卡片 form_09 发布 3 次后计数为 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0039 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_09"); counter.increment("form_09"); counter.increment("form_09");
      const result: number = counter.get("form_09");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0039 end');
    })

    /**
     * @tc.name   testFormCounter0040
     * @tc.number SUB_CCER_FCOUNTER_01_0040
     * @tc.desc   卡片 form_10 发布 3 次后计数为 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0040 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_10"); counter.increment("form_10"); counter.increment("form_10");
      const result: number = counter.get("form_10");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0040 end');
    })

    /**
     * @tc.name   testFormCounter0041
     * @tc.number SUB_CCER_FCOUNTER_01_0041
     * @tc.desc   卡片 form_01 发布 5 次后计数为 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0041 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_01");
      counter.increment("form_01");
      counter.increment("form_01");
      counter.increment("form_01");
      counter.increment("form_01");
      const result: number = counter.get("form_01");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(5));
      expect(result).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0041 end');
    })

    /**
     * @tc.name   testFormCounter0042
     * @tc.number SUB_CCER_FCOUNTER_01_0042
     * @tc.desc   卡片 form_02 发布 5 次后计数为 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0042 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_02");
      counter.increment("form_02");
      counter.increment("form_02");
      counter.increment("form_02");
      counter.increment("form_02");
      const result: number = counter.get("form_02");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(5));
      expect(result).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0042 end');
    })

    /**
     * @tc.name   testFormCounter0043
     * @tc.number SUB_CCER_FCOUNTER_01_0043
     * @tc.desc   卡片 form_03 发布 5 次后计数为 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0043 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_03");
      counter.increment("form_03");
      counter.increment("form_03");
      counter.increment("form_03");
      counter.increment("form_03");
      const result: number = counter.get("form_03");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(5));
      expect(result).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0043 end');
    })

    /**
     * @tc.name   testFormCounter0044
     * @tc.number SUB_CCER_FCOUNTER_01_0044
     * @tc.desc   卡片 form_04 发布 5 次后计数为 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0044 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_04");
      counter.increment("form_04");
      counter.increment("form_04");
      counter.increment("form_04");
      counter.increment("form_04");
      const result: number = counter.get("form_04");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(5));
      expect(result).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0044 end');
    })

    /**
     * @tc.name   testFormCounter0045
     * @tc.number SUB_CCER_FCOUNTER_01_0045
     * @tc.desc   卡片 form_05 发布 5 次后计数为 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0045 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_05");
      counter.increment("form_05");
      counter.increment("form_05");
      counter.increment("form_05");
      counter.increment("form_05");
      const result: number = counter.get("form_05");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(5));
      expect(result).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0045 end');
    })

    /**
     * @tc.name   testFormCounter0046
     * @tc.number SUB_CCER_FCOUNTER_01_0046
     * @tc.desc   卡片 form_06 发布 5 次后计数为 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0046 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_06");
      counter.increment("form_06");
      counter.increment("form_06");
      counter.increment("form_06");
      counter.increment("form_06");
      const result: number = counter.get("form_06");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(5));
      expect(result).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0046 end');
    })

    /**
     * @tc.name   testFormCounter0047
     * @tc.number SUB_CCER_FCOUNTER_01_0047
     * @tc.desc   卡片 form_07 发布 5 次后计数为 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0047 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_07");
      counter.increment("form_07");
      counter.increment("form_07");
      counter.increment("form_07");
      counter.increment("form_07");
      const result: number = counter.get("form_07");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(5));
      expect(result).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0047 end');
    })

    /**
     * @tc.name   testFormCounter0048
     * @tc.number SUB_CCER_FCOUNTER_01_0048
     * @tc.desc   卡片 form_08 发布 5 次后计数为 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0048 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_08");
      counter.increment("form_08");
      counter.increment("form_08");
      counter.increment("form_08");
      counter.increment("form_08");
      const result: number = counter.get("form_08");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(5));
      expect(result).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0048 end');
    })

    /**
     * @tc.name   testFormCounter0049
     * @tc.number SUB_CCER_FCOUNTER_01_0049
     * @tc.desc   卡片 form_09 发布 5 次后计数为 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0049 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_09");
      counter.increment("form_09");
      counter.increment("form_09");
      counter.increment("form_09");
      counter.increment("form_09");
      const result: number = counter.get("form_09");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(5));
      expect(result).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0049 end');
    })

    /**
     * @tc.name   testFormCounter0050
     * @tc.number SUB_CCER_FCOUNTER_01_0050
     * @tc.desc   卡片 form_10 发布 5 次后计数为 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0050 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_10");
      counter.increment("form_10");
      counter.increment("form_10");
      counter.increment("form_10");
      counter.increment("form_10");
      const result: number = counter.get("form_10");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(5));
      expect(result).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0050 end');
    })

    /**
     * @tc.name   testFormCounter0051
     * @tc.number SUB_CCER_FCOUNTER_01_0051
     * @tc.desc   上限 3 时第 4 次发布保持 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0051 begin');
      const counter: FormPublishCounter = new FormPublishCounter(3);
      counter.increment("form_cap_a");
      counter.increment("form_cap_a");
      counter.increment("form_cap_a");
      counter.increment("form_cap_a");
      const result: number = counter.get("form_cap_a");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= 3));
      expect(result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0051 end');
    })

    /**
     * @tc.name   testFormCounter0052
     * @tc.number SUB_CCER_FCOUNTER_01_0052
     * @tc.desc   上限 1 时第 3 次发布保持 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0052 begin');
      const counter: FormPublishCounter = new FormPublishCounter(1);
      counter.increment("form_cap_b"); counter.increment("form_cap_b"); counter.increment("form_cap_b");
      const result: number = counter.get("form_cap_b");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= 1));
      expect(result <= 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0052 end');
    })

    /**
     * @tc.name   testFormCounter0053
     * @tc.number SUB_CCER_FCOUNTER_01_0053
     * @tc.desc   上限 2.5 向下取整后保持 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0053 begin');
      const counter: FormPublishCounter = new FormPublishCounter(2.5);
      counter.increment("form_cap_c");
      counter.increment("form_cap_c");
      counter.increment("form_cap_c");
      counter.increment("form_cap_c");
      const result: number = counter.get("form_cap_c");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= 2));
      expect(result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0053 end');
    })

    /**
     * @tc.name   testFormCounter0054
     * @tc.number SUB_CCER_FCOUNTER_01_0054
     * @tc.desc   上限 0 视为不封顶
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0054 begin');
      const counter: FormPublishCounter = new FormPublishCounter(0);
      counter.increment("form_cap_d"); counter.increment("form_cap_d"); counter.increment("form_cap_d");
      const result: number = counter.get("form_cap_d");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0054 end');
    })

    /**
     * @tc.name   testFormCounter0055
     * @tc.number SUB_CCER_FCOUNTER_01_0055
     * @tc.desc   上限负数视为不封顶
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0055 begin');
      const counter: FormPublishCounter = new FormPublishCounter(-1);
      counter.increment("form_cap_e"); counter.increment("form_cap_e"); counter.increment("form_cap_e");
      const result: number = counter.get("form_cap_e");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0055 end');
    })

    /**
     * @tc.name   testFormCounter0056
     * @tc.number SUB_CCER_FCOUNTER_01_0056
     * @tc.desc   移除卡片后计数归零
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0056 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_removed"); counter.increment("form_removed"); counter.remove("form_removed");
      const result: number = counter.get("form_removed");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(0));
      expect(counter.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0056 end');
    })

    /**
     * @tc.name   testFormCounter0057
     * @tc.number SUB_CCER_FCOUNTER_01_0057
     * @tc.desc   清空计数器后计数归零
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0057 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_cleared_a");
      counter.increment("form_cleared_a");
      counter.increment("form_cleared_a");
      counter.clear();
      const result: number = counter.get("form_cleared_a");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(0));
      expect(counter.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0057 end');
    })

    /**
     * @tc.name   testFormCounter0058
     * @tc.number SUB_CCER_FCOUNTER_01_0058
     * @tc.desc   清空多张卡片后计数与容量同时归零
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0058 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_cleared_b"); counter.increment("form_cleared_c"); counter.clear();
      const result: number = counter.get("form_cleared_b");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(0));
      expect(counter.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0058 end');
    })

    /**
     * @tc.name   testFormCounter0059
     * @tc.number SUB_CCER_FCOUNTER_01_0059
     * @tc.desc   移除另一张卡片不影响本卡片计数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0059 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_partial");
      counter.increment("form_partial");
      counter.increment("form_partial_other");
      counter.remove("form_partial_other");
      const result: number = counter.get("form_partial");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0059 end');
    })

    /**
     * @tc.name   testFormCounter0060
     * @tc.number SUB_CCER_FCOUNTER_01_0060
     * @tc.desc   移除后重新发布从 1 开始计数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0060 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_reuse");
      counter.increment("form_reuse");
      counter.remove("form_reuse");
      counter.increment("form_reuse");
      const result: number = counter.get("form_reuse");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0060 end');
    })

    /**
     * @tc.name   testFormCounter0061
     * @tc.number SUB_CCER_FCOUNTER_01_0061
     * @tc.desc   两张卡片各自计数互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCounter0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0061 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment("form_anchor");
      counter.increment("form_anchor");
      counter.increment("form_anchor");
      counter.increment("other_anchor");
      counter.increment("other_anchor");
      const result: number = counter.get("form_anchor");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.get('other_anchor')),
        String(2));
      expect(counter.get('other_anchor')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormCounter0061 end');
    })

  })
}
