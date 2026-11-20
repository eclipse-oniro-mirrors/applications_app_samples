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

export default function formCounterVolume02Test() {
  describe('FormCounterVolume02Test', () => {

    /**
     * @tc.name   testCounterMatrix0001
     * @tc.number SUB_CCER_FCOUNTER_02_0001
     * @tc.desc   卡片 card_11 与 card_12 按各一次发布后计数互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0001 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_11'); counter.increment('card_12');
      const result: number = counter.get('card_11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_12')), String(1));
      expect(counter.get('card_12')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0001 end');
    })

    /**
     * @tc.name   testCounterMatrix0002
     * @tc.number SUB_CCER_FCOUNTER_02_0002
     * @tc.desc   卡片 card_11 与 card_12 按先两后一发布后计数互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0002 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_11'); counter.increment('card_11'); counter.increment('card_12');
      const result: number = counter.get('card_11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_12')), String(1));
      expect(counter.get('card_12')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0002 end');
    })

    /**
     * @tc.name   testCounterMatrix0003
     * @tc.number SUB_CCER_FCOUNTER_02_0003
     * @tc.desc   卡片 card_11 与 card_12 按交替两次发布后计数互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0003 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_11'); counter.increment('card_12'); counter.increment('card_11');
        counter.increment('card_12');
      const result: number = counter.get('card_11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_12')), String(2));
      expect(counter.get('card_12')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0003 end');
    })

    /**
     * @tc.name   testCounterMatrix0004
     * @tc.number SUB_CCER_FCOUNTER_02_0004
     * @tc.desc   卡片 card_11 与 card_12 按三比二发布后计数互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0004 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_11'); counter.increment('card_11'); counter.increment('card_11');
        counter.increment('card_12'); counter.increment('card_12');
      const result: number = counter.get('card_11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_12')), String(2));
      expect(counter.get('card_12')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0004 end');
    })

    /**
     * @tc.name   testCounterMatrix0005
     * @tc.number SUB_CCER_FCOUNTER_02_0005
     * @tc.desc   卡片 card_13 与 card_14 按各一次发布后计数互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0005 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_13'); counter.increment('card_14');
      const result: number = counter.get('card_13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_14')), String(1));
      expect(counter.get('card_14')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0005 end');
    })

    /**
     * @tc.name   testCounterMatrix0006
     * @tc.number SUB_CCER_FCOUNTER_02_0006
     * @tc.desc   卡片 card_13 与 card_14 按先两后一发布后计数互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0006 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_13'); counter.increment('card_13'); counter.increment('card_14');
      const result: number = counter.get('card_13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_14')), String(1));
      expect(counter.get('card_14')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0006 end');
    })

    /**
     * @tc.name   testCounterMatrix0007
     * @tc.number SUB_CCER_FCOUNTER_02_0007
     * @tc.desc   卡片 card_13 与 card_14 按交替两次发布后计数互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0007 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_13'); counter.increment('card_14'); counter.increment('card_13');
        counter.increment('card_14');
      const result: number = counter.get('card_13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_14')), String(2));
      expect(counter.get('card_14')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0007 end');
    })

    /**
     * @tc.name   testCounterMatrix0008
     * @tc.number SUB_CCER_FCOUNTER_02_0008
     * @tc.desc   卡片 card_13 与 card_14 按三比二发布后计数互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0008 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_13'); counter.increment('card_13'); counter.increment('card_13');
        counter.increment('card_14'); counter.increment('card_14');
      const result: number = counter.get('card_13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_14')), String(2));
      expect(counter.get('card_14')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0008 end');
    })

    /**
     * @tc.name   testCounterMatrix0009
     * @tc.number SUB_CCER_FCOUNTER_02_0009
     * @tc.desc   卡片 card_15 与 card_16 按各一次发布后计数互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0009 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_15'); counter.increment('card_16');
      const result: number = counter.get('card_15');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_16')), String(1));
      expect(counter.get('card_16')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0009 end');
    })

    /**
     * @tc.name   testCounterMatrix0010
     * @tc.number SUB_CCER_FCOUNTER_02_0010
     * @tc.desc   卡片 card_15 与 card_16 按先两后一发布后计数互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0010 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_15'); counter.increment('card_15'); counter.increment('card_16');
      const result: number = counter.get('card_15');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_16')), String(1));
      expect(counter.get('card_16')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0010 end');
    })

    /**
     * @tc.name   testCounterMatrix0011
     * @tc.number SUB_CCER_FCOUNTER_02_0011
     * @tc.desc   卡片 card_15 与 card_16 按交替两次发布后计数互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0011 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_15'); counter.increment('card_16'); counter.increment('card_15');
        counter.increment('card_16');
      const result: number = counter.get('card_15');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_16')), String(2));
      expect(counter.get('card_16')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0011 end');
    })

    /**
     * @tc.name   testCounterMatrix0012
     * @tc.number SUB_CCER_FCOUNTER_02_0012
     * @tc.desc   卡片 card_15 与 card_16 按三比二发布后计数互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0012 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_15'); counter.increment('card_15'); counter.increment('card_15');
        counter.increment('card_16'); counter.increment('card_16');
      const result: number = counter.get('card_15');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_16')), String(2));
      expect(counter.get('card_16')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0012 end');
    })

    /**
     * @tc.name   testCounterMatrix0013
     * @tc.number SUB_CCER_FCOUNTER_02_0013
     * @tc.desc   卡片 card_17 与 card_18 按各一次发布后计数互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0013 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_17'); counter.increment('card_18');
      const result: number = counter.get('card_17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_18')), String(1));
      expect(counter.get('card_18')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0013 end');
    })

    /**
     * @tc.name   testCounterMatrix0014
     * @tc.number SUB_CCER_FCOUNTER_02_0014
     * @tc.desc   卡片 card_17 与 card_18 按先两后一发布后计数互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0014 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_17'); counter.increment('card_17'); counter.increment('card_18');
      const result: number = counter.get('card_17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_18')), String(1));
      expect(counter.get('card_18')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0014 end');
    })

    /**
     * @tc.name   testCounterMatrix0015
     * @tc.number SUB_CCER_FCOUNTER_02_0015
     * @tc.desc   卡片 card_17 与 card_18 按交替两次发布后计数互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0015 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_17'); counter.increment('card_18'); counter.increment('card_17');
        counter.increment('card_18');
      const result: number = counter.get('card_17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_18')), String(2));
      expect(counter.get('card_18')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0015 end');
    })

    /**
     * @tc.name   testCounterMatrix0016
     * @tc.number SUB_CCER_FCOUNTER_02_0016
     * @tc.desc   卡片 card_17 与 card_18 按三比二发布后计数互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0016 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_17'); counter.increment('card_17'); counter.increment('card_17');
        counter.increment('card_18'); counter.increment('card_18');
      const result: number = counter.get('card_17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_18')), String(2));
      expect(counter.get('card_18')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0016 end');
    })

    /**
     * @tc.name   testCounterMatrix0017
     * @tc.number SUB_CCER_FCOUNTER_02_0017
     * @tc.desc   卡片 card_11 与 card_15 按各一次发布后计数互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0017 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_11'); counter.increment('card_15');
      const result: number = counter.get('card_11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_15')), String(1));
      expect(counter.get('card_15')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0017 end');
    })

    /**
     * @tc.name   testCounterMatrix0018
     * @tc.number SUB_CCER_FCOUNTER_02_0018
     * @tc.desc   卡片 card_11 与 card_15 按先两后一发布后计数互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0018 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_11'); counter.increment('card_11'); counter.increment('card_15');
      const result: number = counter.get('card_11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_15')), String(1));
      expect(counter.get('card_15')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0018 end');
    })

    /**
     * @tc.name   testCounterMatrix0019
     * @tc.number SUB_CCER_FCOUNTER_02_0019
     * @tc.desc   卡片 card_11 与 card_15 按交替两次发布后计数互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0019 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_11'); counter.increment('card_15'); counter.increment('card_11');
        counter.increment('card_15');
      const result: number = counter.get('card_11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_15')), String(2));
      expect(counter.get('card_15')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0019 end');
    })

    /**
     * @tc.name   testCounterMatrix0020
     * @tc.number SUB_CCER_FCOUNTER_02_0020
     * @tc.desc   卡片 card_11 与 card_15 按三比二发布后计数互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0020 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_11'); counter.increment('card_11'); counter.increment('card_11');
        counter.increment('card_15'); counter.increment('card_15');
      const result: number = counter.get('card_11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_15')), String(2));
      expect(counter.get('card_15')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0020 end');
    })

    /**
     * @tc.name   testCounterMatrix0021
     * @tc.number SUB_CCER_FCOUNTER_02_0021
     * @tc.desc   卡片 card_12 与 card_16 按各一次发布后计数互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0021 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_12'); counter.increment('card_16');
      const result: number = counter.get('card_12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_16')), String(1));
      expect(counter.get('card_16')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0021 end');
    })

    /**
     * @tc.name   testCounterMatrix0022
     * @tc.number SUB_CCER_FCOUNTER_02_0022
     * @tc.desc   卡片 card_12 与 card_16 按先两后一发布后计数互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0022 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_12'); counter.increment('card_12'); counter.increment('card_16');
      const result: number = counter.get('card_12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_16')), String(1));
      expect(counter.get('card_16')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0022 end');
    })

    /**
     * @tc.name   testCounterMatrix0023
     * @tc.number SUB_CCER_FCOUNTER_02_0023
     * @tc.desc   卡片 card_12 与 card_16 按交替两次发布后计数互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0023 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_12'); counter.increment('card_16'); counter.increment('card_12');
        counter.increment('card_16');
      const result: number = counter.get('card_12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_16')), String(2));
      expect(counter.get('card_16')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0023 end');
    })

    /**
     * @tc.name   testCounterMatrix0024
     * @tc.number SUB_CCER_FCOUNTER_02_0024
     * @tc.desc   卡片 card_12 与 card_16 按三比二发布后计数互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0024 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_12'); counter.increment('card_12'); counter.increment('card_12');
        counter.increment('card_16'); counter.increment('card_16');
      const result: number = counter.get('card_12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_16')), String(2));
      expect(counter.get('card_16')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0024 end');
    })

    /**
     * @tc.name   testCounterMatrix0025
     * @tc.number SUB_CCER_FCOUNTER_02_0025
     * @tc.desc   卡片 card_13 与 card_17 按各一次发布后计数互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0025 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_13'); counter.increment('card_17');
      const result: number = counter.get('card_13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_17')), String(1));
      expect(counter.get('card_17')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0025 end');
    })

    /**
     * @tc.name   testCounterMatrix0026
     * @tc.number SUB_CCER_FCOUNTER_02_0026
     * @tc.desc   卡片 card_13 与 card_17 按先两后一发布后计数互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0026 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_13'); counter.increment('card_13'); counter.increment('card_17');
      const result: number = counter.get('card_13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_17')), String(1));
      expect(counter.get('card_17')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0026 end');
    })

    /**
     * @tc.name   testCounterMatrix0027
     * @tc.number SUB_CCER_FCOUNTER_02_0027
     * @tc.desc   卡片 card_13 与 card_17 按交替两次发布后计数互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0027 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_13'); counter.increment('card_17'); counter.increment('card_13');
        counter.increment('card_17');
      const result: number = counter.get('card_13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_17')), String(2));
      expect(counter.get('card_17')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0027 end');
    })

    /**
     * @tc.name   testCounterMatrix0028
     * @tc.number SUB_CCER_FCOUNTER_02_0028
     * @tc.desc   卡片 card_13 与 card_17 按三比二发布后计数互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0028 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_13'); counter.increment('card_13'); counter.increment('card_13');
        counter.increment('card_17'); counter.increment('card_17');
      const result: number = counter.get('card_13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_17')), String(2));
      expect(counter.get('card_17')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0028 end');
    })

    /**
     * @tc.name   testCounterMatrix0029
     * @tc.number SUB_CCER_FCOUNTER_02_0029
     * @tc.desc   卡片 card_14 与 card_18 按各一次发布后计数互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0029 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_14'); counter.increment('card_18');
      const result: number = counter.get('card_14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_18')), String(1));
      expect(counter.get('card_18')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0029 end');
    })

    /**
     * @tc.name   testCounterMatrix0030
     * @tc.number SUB_CCER_FCOUNTER_02_0030
     * @tc.desc   卡片 card_14 与 card_18 按先两后一发布后计数互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0030 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_14'); counter.increment('card_14'); counter.increment('card_18');
      const result: number = counter.get('card_14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_18')), String(1));
      expect(counter.get('card_18')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0030 end');
    })

    /**
     * @tc.name   testCounterMatrix0031
     * @tc.number SUB_CCER_FCOUNTER_02_0031
     * @tc.desc   卡片 card_14 与 card_18 按交替两次发布后计数互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0031 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_14'); counter.increment('card_18'); counter.increment('card_14');
        counter.increment('card_18');
      const result: number = counter.get('card_14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_18')), String(2));
      expect(counter.get('card_18')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0031 end');
    })

    /**
     * @tc.name   testCounterMatrix0032
     * @tc.number SUB_CCER_FCOUNTER_02_0032
     * @tc.desc   卡片 card_14 与 card_18 按三比二发布后计数互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0032 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_14'); counter.increment('card_14'); counter.increment('card_14');
        counter.increment('card_18'); counter.increment('card_18');
      const result: number = counter.get('card_14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_18')), String(2));
      expect(counter.get('card_18')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0032 end');
    })

    /**
     * @tc.name   testCounterMatrix0033
     * @tc.number SUB_CCER_FCOUNTER_02_0033
     * @tc.desc   上限 4 的卡片发布 7 次后计数封顶
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0033 begin');
      const counter: FormPublishCounter = new FormPublishCounter(4);
      for (let i: number = 0; i < 7; i++) { counter.increment('card_L4'); }
      const result: number = counter.get('card_L4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4));
      expect(result).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(counter.get('card_O4') === 0));
      expect(counter.get('card_O4') === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0033 end');
    })

    /**
     * @tc.name   testCounterMatrix0034
     * @tc.number SUB_CCER_FCOUNTER_02_0034
     * @tc.desc   上限 6 的卡片发布 9 次后计数封顶
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0034 begin');
      const counter: FormPublishCounter = new FormPublishCounter(6);
      for (let i: number = 0; i < 9; i++) { counter.increment('card_L6'); }
      const result: number = counter.get('card_L6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6));
      expect(result).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(counter.get('card_O6') === 0));
      expect(counter.get('card_O6') === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0034 end');
    })

    /**
     * @tc.name   testCounterMatrix0035
     * @tc.number SUB_CCER_FCOUNTER_02_0035
     * @tc.desc   上限 7 的卡片发布 10 次后计数封顶
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0035 begin');
      const counter: FormPublishCounter = new FormPublishCounter(7);
      for (let i: number = 0; i < 10; i++) { counter.increment('card_L7'); }
      const result: number = counter.get('card_L7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(7));
      expect(result).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(counter.get('card_O7') === 0));
      expect(counter.get('card_O7') === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0035 end');
    })

    /**
     * @tc.name   testCounterMatrix0036
     * @tc.number SUB_CCER_FCOUNTER_02_0036
     * @tc.desc   上限 8 的卡片发布 11 次后计数封顶
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0036 begin');
      const counter: FormPublishCounter = new FormPublishCounter(8);
      for (let i: number = 0; i < 11; i++) { counter.increment('card_L8'); }
      const result: number = counter.get('card_L8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(8));
      expect(result).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(counter.get('card_O8') === 0));
      expect(counter.get('card_O8') === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0036 end');
    })

    /**
     * @tc.name   testCounterMatrix0037
     * @tc.number SUB_CCER_FCOUNTER_02_0037
     * @tc.desc   上限 9 的卡片发布 12 次后计数封顶
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0037 begin');
      const counter: FormPublishCounter = new FormPublishCounter(9);
      for (let i: number = 0; i < 12; i++) { counter.increment('card_L9'); }
      const result: number = counter.get('card_L9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(9));
      expect(result).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(counter.get('card_O9') === 0));
      expect(counter.get('card_O9') === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0037 end');
    })

    /**
     * @tc.name   testCounterMatrix0038
     * @tc.number SUB_CCER_FCOUNTER_02_0038
     * @tc.desc   上限 10 的卡片发布 13 次后计数封顶
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0038 begin');
      const counter: FormPublishCounter = new FormPublishCounter(10);
      for (let i: number = 0; i < 13; i++) { counter.increment('card_L10'); }
      const result: number = counter.get('card_L10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(10));
      expect(result).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(counter.get('card_O10') === 0));
      expect(counter.get('card_O10') === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0038 end');
    })

    /**
     * @tc.name   testCounterMatrix0039
     * @tc.number SUB_CCER_FCOUNTER_02_0039
     * @tc.desc   移除未知卡片不影响任何计数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0039 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.remove('ghost_card');
      const result: number = counter.get('ghost_card');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(counter.remove('ghost_card') === false));
      expect(counter.remove('ghost_card') === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(counter.size() === 0));
      expect(counter.size() === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0039 end');
    })

    /**
     * @tc.name   testCounterMatrix0040
     * @tc.number SUB_CCER_FCOUNTER_02_0040
     * @tc.desc   清空计数器后同一卡片重新从 1 计数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0040 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_11'); counter.clear(); counter.increment('card_11');
      const result: number = counter.get('card_11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(counter.get('card_12') === 0));
      expect(counter.get('card_12') === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0040 end');
    })

    /**
     * @tc.name   testCounterMatrix0041
     * @tc.number SUB_CCER_FCOUNTER_02_0041
     * @tc.desc   三张卡片按一比二比三发布后计数各归其主
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0041 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_11'); counter.increment('card_12'); counter.increment('card_12');
        counter.increment('card_13'); counter.increment('card_13'); counter.increment('card_13');
      const result: number = counter.size();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_13')), String(3));
      expect(counter.get('card_13')).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_11')), String(1));
      expect(counter.get('card_11')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0041 end');
    })

    /**
     * @tc.name   testCounterMatrix0042
     * @tc.number SUB_CCER_FCOUNTER_02_0042
     * @tc.desc   移除中间卡片后其计数归零且另一张卡片不受影响
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0042 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_14'); counter.increment('card_14'); counter.increment('card_15');
        counter.increment('card_15'); counter.increment('card_16'); counter.increment('card_16');
        counter.remove('card_15');
      const result: number = counter.get('card_15');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(2));
      expect(counter.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_16')), String(2));
      expect(counter.get('card_16')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0042 end');
    })

    /**
     * @tc.name   testCounterMatrix0043
     * @tc.number SUB_CCER_FCOUNTER_02_0043
     * @tc.desc   移除后重新发布的卡片从 1 重新计数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0043 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_17'); counter.increment('card_17'); counter.increment('card_17');
        counter.remove('card_17'); counter.increment('card_17');
      const result: number = counter.get('card_17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.size()), String(1));
      expect(counter.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(counter.get('card_18') === 0));
      expect(counter.get('card_18') === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0043 end');
    })

    /**
     * @tc.name   testCounterMatrix0044
     * @tc.number SUB_CCER_FCOUNTER_02_0044
     * @tc.desc   交错增删后存留卡片计数与数量保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0044 begin');
      const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
      counter.increment('card_11'); counter.increment('card_12'); counter.remove('card_11');
        counter.increment('card_12'); counter.increment('card_13'); counter.increment('card_14');
      const result: number = counter.size();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_12')), String(2));
      expect(counter.get('card_12')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_14')), String(1));
      expect(counter.get('card_14')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0044 end');
    })

    /**
     * @tc.name   testCounterMatrix0045
     * @tc.number SUB_CCER_FCOUNTER_02_0045
     * @tc.desc   多卡片在上限 5 下各自计数互不影响
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCounterMatrix0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0045 begin');
      const counter: FormPublishCounter = new FormPublishCounter(5);
      counter.increment('card_21'); counter.increment('card_21'); counter.increment('card_21');
        counter.increment('card_21'); counter.increment('card_21'); counter.increment('card_21');
        counter.increment('card_21'); counter.increment('card_22'); counter.increment('card_22');
        counter.increment('card_22'); counter.increment('card_23'); counter.increment('card_23');
        counter.increment('card_23'); counter.increment('card_23'); counter.increment('card_23');
        counter.increment('card_23');
      const result: number = counter.size();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_21')), String(5));
      expect(counter.get('card_21')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(counter.get('card_22')), String(3));
      expect(counter.get('card_22')).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCounterMatrix0045 end');
    })

  })
}
