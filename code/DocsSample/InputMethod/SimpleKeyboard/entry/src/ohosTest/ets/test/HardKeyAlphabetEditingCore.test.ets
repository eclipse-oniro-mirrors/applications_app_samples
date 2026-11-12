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
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { getHardKeyValue } from '../../../main/ets/model/HardKeyUtils';

const TAG: string = '[Sample_HardKeyAlphabetEditingCoreTest]';
const DOMAIN: number = 0xF814;

export default function HardKeyAlphabetEditingCoreTest(): void {
  describe('HardKeyAlphabetEditingCoreTest', () => {
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0501
     * @tc.name      testSimpleKeyboardHardKey0501
     * @tc.desc      Checks hard key mapping for code 2250, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0501', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0501 begin');
      const actual: string = getHardKeyValue(2250, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0501 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0502
     * @tc.name      testSimpleKeyboardHardKey0502
     * @tc.desc      Checks hard key mapping for code 2250, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0502', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0502 begin');
      const actual: string = getHardKeyValue(2250, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0502 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0503
     * @tc.name      testSimpleKeyboardHardKey0503
     * @tc.desc      Checks hard key mapping for code 2251, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0503', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0503 begin');
      const actual: string = getHardKeyValue(2251, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0503 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0504
     * @tc.name      testSimpleKeyboardHardKey0504
     * @tc.desc      Checks hard key mapping for code 2251, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0504', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0504 begin');
      const actual: string = getHardKeyValue(2251, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0504 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0505
     * @tc.name      testSimpleKeyboardHardKey0505
     * @tc.desc      Checks hard key mapping for code 2252, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0505', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0505 begin');
      const actual: string = getHardKeyValue(2252, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0505 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0506
     * @tc.name      testSimpleKeyboardHardKey0506
     * @tc.desc      Checks hard key mapping for code 2252, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0506', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0506 begin');
      const actual: string = getHardKeyValue(2252, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0506 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0507
     * @tc.name      testSimpleKeyboardHardKey0507
     * @tc.desc      Checks hard key mapping for code 2253, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0507', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0507 begin');
      const actual: string = getHardKeyValue(2253, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0507 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0508
     * @tc.name      testSimpleKeyboardHardKey0508
     * @tc.desc      Checks hard key mapping for code 2253, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0508', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0508 begin');
      const actual: string = getHardKeyValue(2253, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0508 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0509
     * @tc.name      testSimpleKeyboardHardKey0509
     * @tc.desc      Checks hard key mapping for code 2254, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0509', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0509 begin');
      const actual: string = getHardKeyValue(2254, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0509 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0510
     * @tc.name      testSimpleKeyboardHardKey0510
     * @tc.desc      Checks hard key mapping for code 2254, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0510 begin');
      const actual: string = getHardKeyValue(2254, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0510 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0511
     * @tc.name      testSimpleKeyboardHardKey0511
     * @tc.desc      Checks hard key mapping for code 2255, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0511', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0511 begin');
      const actual: string = getHardKeyValue(2255, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0511 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0512
     * @tc.name      testSimpleKeyboardHardKey0512
     * @tc.desc      Checks hard key mapping for code 2255, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0512', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0512 begin');
      const actual: string = getHardKeyValue(2255, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0512 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0513
     * @tc.name      testSimpleKeyboardHardKey0513
     * @tc.desc      Checks hard key mapping for code 2256, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0513', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0513 begin');
      const actual: string = getHardKeyValue(2256, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0513 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0514
     * @tc.name      testSimpleKeyboardHardKey0514
     * @tc.desc      Checks hard key mapping for code 2256, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0514', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0514 begin');
      const actual: string = getHardKeyValue(2256, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0514 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0515
     * @tc.name      testSimpleKeyboardHardKey0515
     * @tc.desc      Checks hard key mapping for code 2257, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0515', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0515 begin');
      const actual: string = getHardKeyValue(2257, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0515 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0516
     * @tc.name      testSimpleKeyboardHardKey0516
     * @tc.desc      Checks hard key mapping for code 2257, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0516', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0516 begin');
      const actual: string = getHardKeyValue(2257, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0516 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0517
     * @tc.name      testSimpleKeyboardHardKey0517
     * @tc.desc      Checks hard key mapping for code 2258, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0517', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0517 begin');
      const actual: string = getHardKeyValue(2258, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0517 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0518
     * @tc.name      testSimpleKeyboardHardKey0518
     * @tc.desc      Checks hard key mapping for code 2258, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0518', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0518 begin');
      const actual: string = getHardKeyValue(2258, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0518 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0519
     * @tc.name      testSimpleKeyboardHardKey0519
     * @tc.desc      Checks hard key mapping for code 2259, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0519', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0519 begin');
      const actual: string = getHardKeyValue(2259, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0519 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0520
     * @tc.name      testSimpleKeyboardHardKey0520
     * @tc.desc      Checks hard key mapping for code 2259, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0520', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0520 begin');
      const actual: string = getHardKeyValue(2259, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0520 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0521
     * @tc.name      testSimpleKeyboardHardKey0521
     * @tc.desc      Checks hard key mapping for code 2260, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0521', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0521 begin');
      const actual: string = getHardKeyValue(2260, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0521 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0522
     * @tc.name      testSimpleKeyboardHardKey0522
     * @tc.desc      Checks hard key mapping for code 2260, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0522', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0522 begin');
      const actual: string = getHardKeyValue(2260, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0522 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0523
     * @tc.name      testSimpleKeyboardHardKey0523
     * @tc.desc      Checks hard key mapping for code 2261, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0523', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0523 begin');
      const actual: string = getHardKeyValue(2261, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0523 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0524
     * @tc.name      testSimpleKeyboardHardKey0524
     * @tc.desc      Checks hard key mapping for code 2261, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0524', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0524 begin');
      const actual: string = getHardKeyValue(2261, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0524 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0525
     * @tc.name      testSimpleKeyboardHardKey0525
     * @tc.desc      Checks hard key mapping for code 2262, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0525', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0525 begin');
      const actual: string = getHardKeyValue(2262, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0525 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0526
     * @tc.name      testSimpleKeyboardHardKey0526
     * @tc.desc      Checks hard key mapping for code 2262, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0526', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0526 begin');
      const actual: string = getHardKeyValue(2262, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0526 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0527
     * @tc.name      testSimpleKeyboardHardKey0527
     * @tc.desc      Checks hard key mapping for code 2263, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0527', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0527 begin');
      const actual: string = getHardKeyValue(2263, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0527 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0528
     * @tc.name      testSimpleKeyboardHardKey0528
     * @tc.desc      Checks hard key mapping for code 2263, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0528', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0528 begin');
      const actual: string = getHardKeyValue(2263, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0528 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0529
     * @tc.name      testSimpleKeyboardHardKey0529
     * @tc.desc      Checks hard key mapping for code 2264, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0529', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0529 begin');
      const actual: string = getHardKeyValue(2264, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0529 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0530
     * @tc.name      testSimpleKeyboardHardKey0530
     * @tc.desc      Checks hard key mapping for code 2264, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0530', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0530 begin');
      const actual: string = getHardKeyValue(2264, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0530 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0531
     * @tc.name      testSimpleKeyboardHardKey0531
     * @tc.desc      Checks hard key mapping for code 2265, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0531', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0531 begin');
      const actual: string = getHardKeyValue(2265, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0531 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0532
     * @tc.name      testSimpleKeyboardHardKey0532
     * @tc.desc      Checks hard key mapping for code 2265, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0532', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0532 begin');
      const actual: string = getHardKeyValue(2265, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0532 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0533
     * @tc.name      testSimpleKeyboardHardKey0533
     * @tc.desc      Checks hard key mapping for code 2266, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0533', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0533 begin');
      const actual: string = getHardKeyValue(2266, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0533 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0534
     * @tc.name      testSimpleKeyboardHardKey0534
     * @tc.desc      Checks hard key mapping for code 2266, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0534', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0534 begin');
      const actual: string = getHardKeyValue(2266, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0534 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0535
     * @tc.name      testSimpleKeyboardHardKey0535
     * @tc.desc      Checks hard key mapping for code 2267, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0535', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0535 begin');
      const actual: string = getHardKeyValue(2267, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0535 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0536
     * @tc.name      testSimpleKeyboardHardKey0536
     * @tc.desc      Checks hard key mapping for code 2267, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0536', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0536 begin');
      const actual: string = getHardKeyValue(2267, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0536 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0537
     * @tc.name      testSimpleKeyboardHardKey0537
     * @tc.desc      Checks hard key mapping for code 2268, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0537', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0537 begin');
      const actual: string = getHardKeyValue(2268, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0537 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0538
     * @tc.name      testSimpleKeyboardHardKey0538
     * @tc.desc      Checks hard key mapping for code 2268, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0538', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0538 begin');
      const actual: string = getHardKeyValue(2268, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0538 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0539
     * @tc.name      testSimpleKeyboardHardKey0539
     * @tc.desc      Checks hard key mapping for code 2269, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0539', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0539 begin');
      const actual: string = getHardKeyValue(2269, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0539 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0540
     * @tc.name      testSimpleKeyboardHardKey0540
     * @tc.desc      Checks hard key mapping for code 2269, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0540', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0540 begin');
      const actual: string = getHardKeyValue(2269, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0540 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0541
     * @tc.name      testSimpleKeyboardHardKey0541
     * @tc.desc      Checks hard key mapping for code 2270, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0541', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0541 begin');
      const actual: string = getHardKeyValue(2270, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0541 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0542
     * @tc.name      testSimpleKeyboardHardKey0542
     * @tc.desc      Checks hard key mapping for code 2270, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0542', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0542 begin');
      const actual: string = getHardKeyValue(2270, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0542 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0543
     * @tc.name      testSimpleKeyboardHardKey0543
     * @tc.desc      Checks hard key mapping for code 2271, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0543', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0543 begin');
      const actual: string = getHardKeyValue(2271, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0543 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0544
     * @tc.name      testSimpleKeyboardHardKey0544
     * @tc.desc      Checks hard key mapping for code 2271, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0544', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0544 begin');
      const actual: string = getHardKeyValue(2271, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0544 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0545
     * @tc.name      testSimpleKeyboardHardKey0545
     * @tc.desc      Checks hard key mapping for code 2272, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0545', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0545 begin');
      const actual: string = getHardKeyValue(2272, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0545 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0546
     * @tc.name      testSimpleKeyboardHardKey0546
     * @tc.desc      Checks hard key mapping for code 2272, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0546', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0546 begin');
      const actual: string = getHardKeyValue(2272, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0546 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0547
     * @tc.name      testSimpleKeyboardHardKey0547
     * @tc.desc      Checks hard key mapping for code 2273, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0547', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0547 begin');
      const actual: string = getHardKeyValue(2273, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0547 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0548
     * @tc.name      testSimpleKeyboardHardKey0548
     * @tc.desc      Checks hard key mapping for code 2273, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0548', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0548 begin');
      const actual: string = getHardKeyValue(2273, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0548 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0549
     * @tc.name      testSimpleKeyboardHardKey0549
     * @tc.desc      Checks hard key mapping for code 2274, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0549', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0549 begin');
      const actual: string = getHardKeyValue(2274, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0549 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0550
     * @tc.name      testSimpleKeyboardHardKey0550
     * @tc.desc      Checks hard key mapping for code 2274, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0550', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0550 begin');
      const actual: string = getHardKeyValue(2274, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0550 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0551
     * @tc.name      testSimpleKeyboardHardKey0551
     * @tc.desc      Checks hard key mapping for code 2275, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0551', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0551 begin');
      const actual: string = getHardKeyValue(2275, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0551 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0552
     * @tc.name      testSimpleKeyboardHardKey0552
     * @tc.desc      Checks hard key mapping for code 2275, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0552', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0552 begin');
      const actual: string = getHardKeyValue(2275, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0552 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0553
     * @tc.name      testSimpleKeyboardHardKey0553
     * @tc.desc      Checks hard key mapping for code 2276, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0553', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0553 begin');
      const actual: string = getHardKeyValue(2276, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0553 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0554
     * @tc.name      testSimpleKeyboardHardKey0554
     * @tc.desc      Checks hard key mapping for code 2276, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0554', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0554 begin');
      const actual: string = getHardKeyValue(2276, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0554 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0555
     * @tc.name      testSimpleKeyboardHardKey0555
     * @tc.desc      Checks hard key mapping for code 2277, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0555', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0555 begin');
      const actual: string = getHardKeyValue(2277, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0555 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0556
     * @tc.name      testSimpleKeyboardHardKey0556
     * @tc.desc      Checks hard key mapping for code 2277, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0556', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0556 begin');
      const actual: string = getHardKeyValue(2277, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0556 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0557
     * @tc.name      testSimpleKeyboardHardKey0557
     * @tc.desc      Checks hard key mapping for code 2278, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0557', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0557 begin');
      const actual: string = getHardKeyValue(2278, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0557 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0558
     * @tc.name      testSimpleKeyboardHardKey0558
     * @tc.desc      Checks hard key mapping for code 2278, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0558', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0558 begin');
      const actual: string = getHardKeyValue(2278, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0558 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0559
     * @tc.name      testSimpleKeyboardHardKey0559
     * @tc.desc      Checks hard key mapping for code 2279, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0559', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0559 begin');
      const actual: string = getHardKeyValue(2279, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0559 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0560
     * @tc.name      testSimpleKeyboardHardKey0560
     * @tc.desc      Checks hard key mapping for code 2279, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0560', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0560 begin');
      const actual: string = getHardKeyValue(2279, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0560 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0561
     * @tc.name      testSimpleKeyboardHardKey0561
     * @tc.desc      Checks hard key mapping for code 2280, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0561', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0561 begin');
      const actual: string = getHardKeyValue(2280, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0561 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0562
     * @tc.name      testSimpleKeyboardHardKey0562
     * @tc.desc      Checks hard key mapping for code 2280, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0562', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0562 begin');
      const actual: string = getHardKeyValue(2280, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0562 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0563
     * @tc.name      testSimpleKeyboardHardKey0563
     * @tc.desc      Checks hard key mapping for code 2281, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0563', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0563 begin');
      const actual: string = getHardKeyValue(2281, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0563 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0564
     * @tc.name      testSimpleKeyboardHardKey0564
     * @tc.desc      Checks hard key mapping for code 2281, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0564', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0564 begin');
      const actual: string = getHardKeyValue(2281, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0564 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0565
     * @tc.name      testSimpleKeyboardHardKey0565
     * @tc.desc      Checks hard key mapping for code 2282, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0565', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0565 begin');
      const actual: string = getHardKeyValue(2282, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0565 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0566
     * @tc.name      testSimpleKeyboardHardKey0566
     * @tc.desc      Checks hard key mapping for code 2282, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0566', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0566 begin');
      const actual: string = getHardKeyValue(2282, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0566 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0567
     * @tc.name      testSimpleKeyboardHardKey0567
     * @tc.desc      Checks hard key mapping for code 2283, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0567', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0567 begin');
      const actual: string = getHardKeyValue(2283, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0567 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0568
     * @tc.name      testSimpleKeyboardHardKey0568
     * @tc.desc      Checks hard key mapping for code 2283, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0568', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0568 begin');
      const actual: string = getHardKeyValue(2283, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0568 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0569
     * @tc.name      testSimpleKeyboardHardKey0569
     * @tc.desc      Checks hard key mapping for code 2284, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0569', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0569 begin');
      const actual: string = getHardKeyValue(2284, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0569 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0570
     * @tc.name      testSimpleKeyboardHardKey0570
     * @tc.desc      Checks hard key mapping for code 2284, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0570', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0570 begin');
      const actual: string = getHardKeyValue(2284, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0570 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0571
     * @tc.name      testSimpleKeyboardHardKey0571
     * @tc.desc      Checks hard key mapping for code 2285, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0571', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0571 begin');
      const actual: string = getHardKeyValue(2285, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0571 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0572
     * @tc.name      testSimpleKeyboardHardKey0572
     * @tc.desc      Checks hard key mapping for code 2285, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0572', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0572 begin');
      const actual: string = getHardKeyValue(2285, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0572 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0573
     * @tc.name      testSimpleKeyboardHardKey0573
     * @tc.desc      Checks hard key mapping for code 2286, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0573', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0573 begin');
      const actual: string = getHardKeyValue(2286, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0573 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0574
     * @tc.name      testSimpleKeyboardHardKey0574
     * @tc.desc      Checks hard key mapping for code 2286, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0574', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0574 begin');
      const actual: string = getHardKeyValue(2286, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0574 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0575
     * @tc.name      testSimpleKeyboardHardKey0575
     * @tc.desc      Checks hard key mapping for code 2287, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0575', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0575 begin');
      const actual: string = getHardKeyValue(2287, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0575 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0576
     * @tc.name      testSimpleKeyboardHardKey0576
     * @tc.desc      Checks hard key mapping for code 2287, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0576', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0576 begin');
      const actual: string = getHardKeyValue(2287, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0576 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0577
     * @tc.name      testSimpleKeyboardHardKey0577
     * @tc.desc      Checks hard key mapping for code 2288, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0577', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0577 begin');
      const actual: string = getHardKeyValue(2288, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0577 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0578
     * @tc.name      testSimpleKeyboardHardKey0578
     * @tc.desc      Checks hard key mapping for code 2288, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0578', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0578 begin');
      const actual: string = getHardKeyValue(2288, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0578 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0579
     * @tc.name      testSimpleKeyboardHardKey0579
     * @tc.desc      Checks hard key mapping for code 2289, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0579', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0579 begin');
      const actual: string = getHardKeyValue(2289, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0579 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0580
     * @tc.name      testSimpleKeyboardHardKey0580
     * @tc.desc      Checks hard key mapping for code 2289, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0580', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0580 begin');
      const actual: string = getHardKeyValue(2289, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0580 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0581
     * @tc.name      testSimpleKeyboardHardKey0581
     * @tc.desc      Checks hard key mapping for code 2290, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0581', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0581 begin');
      const actual: string = getHardKeyValue(2290, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0581 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0582
     * @tc.name      testSimpleKeyboardHardKey0582
     * @tc.desc      Checks hard key mapping for code 2290, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0582', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0582 begin');
      const actual: string = getHardKeyValue(2290, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0582 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0583
     * @tc.name      testSimpleKeyboardHardKey0583
     * @tc.desc      Checks hard key mapping for code 2291, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0583', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0583 begin');
      const actual: string = getHardKeyValue(2291, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0583 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0584
     * @tc.name      testSimpleKeyboardHardKey0584
     * @tc.desc      Checks hard key mapping for code 2291, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0584', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0584 begin');
      const actual: string = getHardKeyValue(2291, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0584 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0585
     * @tc.name      testSimpleKeyboardHardKey0585
     * @tc.desc      Checks hard key mapping for code 2292, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0585', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0585 begin');
      const actual: string = getHardKeyValue(2292, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0585 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0586
     * @tc.name      testSimpleKeyboardHardKey0586
     * @tc.desc      Checks hard key mapping for code 2292, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0586', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0586 begin');
      const actual: string = getHardKeyValue(2292, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0586 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0587
     * @tc.name      testSimpleKeyboardHardKey0587
     * @tc.desc      Checks hard key mapping for code 2293, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0587', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0587 begin');
      const actual: string = getHardKeyValue(2293, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0587 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0588
     * @tc.name      testSimpleKeyboardHardKey0588
     * @tc.desc      Checks hard key mapping for code 2293, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0588', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0588 begin');
      const actual: string = getHardKeyValue(2293, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0588 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0589
     * @tc.name      testSimpleKeyboardHardKey0589
     * @tc.desc      Checks hard key mapping for code 2294, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0589', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0589 begin');
      const actual: string = getHardKeyValue(2294, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0589 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0590
     * @tc.name      testSimpleKeyboardHardKey0590
     * @tc.desc      Checks hard key mapping for code 2294, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0590', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0590 begin');
      const actual: string = getHardKeyValue(2294, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0590 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0591
     * @tc.name      testSimpleKeyboardHardKey0591
     * @tc.desc      Checks hard key mapping for code 2295, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0591', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0591 begin');
      const actual: string = getHardKeyValue(2295, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0591 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0592
     * @tc.name      testSimpleKeyboardHardKey0592
     * @tc.desc      Checks hard key mapping for code 2295, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0592', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0592 begin');
      const actual: string = getHardKeyValue(2295, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0592 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0593
     * @tc.name      testSimpleKeyboardHardKey0593
     * @tc.desc      Checks hard key mapping for code 2296, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0593', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0593 begin');
      const actual: string = getHardKeyValue(2296, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0593 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0594
     * @tc.name      testSimpleKeyboardHardKey0594
     * @tc.desc      Checks hard key mapping for code 2296, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0594', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0594 begin');
      const actual: string = getHardKeyValue(2296, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0594 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0595
     * @tc.name      testSimpleKeyboardHardKey0595
     * @tc.desc      Checks hard key mapping for code 2297, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0595', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0595 begin');
      const actual: string = getHardKeyValue(2297, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0595 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0596
     * @tc.name      testSimpleKeyboardHardKey0596
     * @tc.desc      Checks hard key mapping for code 2297, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0596', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0596 begin');
      const actual: string = getHardKeyValue(2297, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0596 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0597
     * @tc.name      testSimpleKeyboardHardKey0597
     * @tc.desc      Checks hard key mapping for code 2298, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0597', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0597 begin');
      const actual: string = getHardKeyValue(2298, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0597 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0598
     * @tc.name      testSimpleKeyboardHardKey0598
     * @tc.desc      Checks hard key mapping for code 2298, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0598', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0598 begin');
      const actual: string = getHardKeyValue(2298, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0598 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0599
     * @tc.name      testSimpleKeyboardHardKey0599
     * @tc.desc      Checks hard key mapping for code 2299, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0599', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0599 begin');
      const actual: string = getHardKeyValue(2299, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0599 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0600
     * @tc.name      testSimpleKeyboardHardKey0600
     * @tc.desc      Checks hard key mapping for code 2299, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0600 begin');
      const actual: string = getHardKeyValue(2299, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0600 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0601
     * @tc.name      testSimpleKeyboardHardKey0601
     * @tc.desc      Checks hard key mapping for code 2300, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0601', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0601 begin');
      const actual: string = getHardKeyValue(2300, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0601 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0602
     * @tc.name      testSimpleKeyboardHardKey0602
     * @tc.desc      Checks hard key mapping for code 2300, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0602', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0602 begin');
      const actual: string = getHardKeyValue(2300, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0602 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0603
     * @tc.name      testSimpleKeyboardHardKey0603
     * @tc.desc      Checks hard key mapping for code 2301, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0603', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0603 begin');
      const actual: string = getHardKeyValue(2301, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0603 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0604
     * @tc.name      testSimpleKeyboardHardKey0604
     * @tc.desc      Checks hard key mapping for code 2301, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0604', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0604 begin');
      const actual: string = getHardKeyValue(2301, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0604 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0605
     * @tc.name      testSimpleKeyboardHardKey0605
     * @tc.desc      Checks hard key mapping for code 2302, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0605', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0605 begin');
      const actual: string = getHardKeyValue(2302, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0605 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0606
     * @tc.name      testSimpleKeyboardHardKey0606
     * @tc.desc      Checks hard key mapping for code 2302, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0606', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0606 begin');
      const actual: string = getHardKeyValue(2302, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0606 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0607
     * @tc.name      testSimpleKeyboardHardKey0607
     * @tc.desc      Checks hard key mapping for code 2303, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0607', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0607 begin');
      const actual: string = getHardKeyValue(2303, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0607 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0608
     * @tc.name      testSimpleKeyboardHardKey0608
     * @tc.desc      Checks hard key mapping for code 2303, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0608', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0608 begin');
      const actual: string = getHardKeyValue(2303, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0608 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0609
     * @tc.name      testSimpleKeyboardHardKey0609
     * @tc.desc      Checks hard key mapping for code 2304, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0609', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0609 begin');
      const actual: string = getHardKeyValue(2304, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0609 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0610
     * @tc.name      testSimpleKeyboardHardKey0610
     * @tc.desc      Checks hard key mapping for code 2304, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0610', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0610 begin');
      const actual: string = getHardKeyValue(2304, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0610 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0611
     * @tc.name      testSimpleKeyboardHardKey0611
     * @tc.desc      Checks hard key mapping for code 2305, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0611', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0611 begin');
      const actual: string = getHardKeyValue(2305, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0611 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0612
     * @tc.name      testSimpleKeyboardHardKey0612
     * @tc.desc      Checks hard key mapping for code 2305, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0612', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0612 begin');
      const actual: string = getHardKeyValue(2305, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0612 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0613
     * @tc.name      testSimpleKeyboardHardKey0613
     * @tc.desc      Checks hard key mapping for code 2306, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0613', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0613 begin');
      const actual: string = getHardKeyValue(2306, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0613 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0614
     * @tc.name      testSimpleKeyboardHardKey0614
     * @tc.desc      Checks hard key mapping for code 2306, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0614', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0614 begin');
      const actual: string = getHardKeyValue(2306, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0614 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0615
     * @tc.name      testSimpleKeyboardHardKey0615
     * @tc.desc      Checks hard key mapping for code 2307, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0615', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0615 begin');
      const actual: string = getHardKeyValue(2307, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0615 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0616
     * @tc.name      testSimpleKeyboardHardKey0616
     * @tc.desc      Checks hard key mapping for code 2307, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0616', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0616 begin');
      const actual: string = getHardKeyValue(2307, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0616 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0617
     * @tc.name      testSimpleKeyboardHardKey0617
     * @tc.desc      Checks hard key mapping for code 2308, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0617', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0617 begin');
      const actual: string = getHardKeyValue(2308, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0617 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0618
     * @tc.name      testSimpleKeyboardHardKey0618
     * @tc.desc      Checks hard key mapping for code 2308, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0618', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0618 begin');
      const actual: string = getHardKeyValue(2308, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0618 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0619
     * @tc.name      testSimpleKeyboardHardKey0619
     * @tc.desc      Checks hard key mapping for code 2309, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0619', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0619 begin');
      const actual: string = getHardKeyValue(2309, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0619 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0620
     * @tc.name      testSimpleKeyboardHardKey0620
     * @tc.desc      Checks hard key mapping for code 2309, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0620', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0620 begin');
      const actual: string = getHardKeyValue(2309, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0620 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0621
     * @tc.name      testSimpleKeyboardHardKey0621
     * @tc.desc      Checks hard key mapping for code 2310, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0621', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0621 begin');
      const actual: string = getHardKeyValue(2310, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0621 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0622
     * @tc.name      testSimpleKeyboardHardKey0622
     * @tc.desc      Checks hard key mapping for code 2310, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0622', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0622 begin');
      const actual: string = getHardKeyValue(2310, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0622 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0623
     * @tc.name      testSimpleKeyboardHardKey0623
     * @tc.desc      Checks hard key mapping for code 2311, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0623', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0623 begin');
      const actual: string = getHardKeyValue(2311, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0623 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0624
     * @tc.name      testSimpleKeyboardHardKey0624
     * @tc.desc      Checks hard key mapping for code 2311, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0624', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0624 begin');
      const actual: string = getHardKeyValue(2311, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0624 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0625
     * @tc.name      testSimpleKeyboardHardKey0625
     * @tc.desc      Checks hard key mapping for code 2312, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0625', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0625 begin');
      const actual: string = getHardKeyValue(2312, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0625 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0626
     * @tc.name      testSimpleKeyboardHardKey0626
     * @tc.desc      Checks hard key mapping for code 2312, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0626', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0626 begin');
      const actual: string = getHardKeyValue(2312, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0626 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0627
     * @tc.name      testSimpleKeyboardHardKey0627
     * @tc.desc      Checks hard key mapping for code 2313, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0627', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0627 begin');
      const actual: string = getHardKeyValue(2313, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0627 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0628
     * @tc.name      testSimpleKeyboardHardKey0628
     * @tc.desc      Checks hard key mapping for code 2313, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0628', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0628 begin');
      const actual: string = getHardKeyValue(2313, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0628 end');
    })
  })
}
