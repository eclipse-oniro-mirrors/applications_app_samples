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

const TAG: string = '[Sample_HardKeyReservedPunctuationShiftAdvancedTest]';
const DOMAIN: number = 0xF814;

export default function HardKeyReservedPunctuationShiftAdvancedTest(): void {
  describe('HardKeyReservedPunctuationShiftAdvancedTest', () => {
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3507
     * @tc.name      testSimpleKeyboardHardKey3507
     * @tc.desc      Checks hard key mapping for code 3753, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3507', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3507 begin');
      const actual: string = getHardKeyValue(3753, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3507 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3508
     * @tc.name      testSimpleKeyboardHardKey3508
     * @tc.desc      Checks hard key mapping for code 3753, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3508', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3508 begin');
      const actual: string = getHardKeyValue(3753, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3508 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3509
     * @tc.name      testSimpleKeyboardHardKey3509
     * @tc.desc      Checks hard key mapping for code 3754, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3509', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3509 begin');
      const actual: string = getHardKeyValue(3754, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3509 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3510
     * @tc.name      testSimpleKeyboardHardKey3510
     * @tc.desc      Checks hard key mapping for code 3754, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3510 begin');
      const actual: string = getHardKeyValue(3754, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3510 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3511
     * @tc.name      testSimpleKeyboardHardKey3511
     * @tc.desc      Checks hard key mapping for code 3755, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3511', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3511 begin');
      const actual: string = getHardKeyValue(3755, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3511 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3512
     * @tc.name      testSimpleKeyboardHardKey3512
     * @tc.desc      Checks hard key mapping for code 3755, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3512', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3512 begin');
      const actual: string = getHardKeyValue(3755, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3512 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3513
     * @tc.name      testSimpleKeyboardHardKey3513
     * @tc.desc      Checks hard key mapping for code 3756, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3513', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3513 begin');
      const actual: string = getHardKeyValue(3756, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3513 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3514
     * @tc.name      testSimpleKeyboardHardKey3514
     * @tc.desc      Checks hard key mapping for code 3756, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3514', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3514 begin');
      const actual: string = getHardKeyValue(3756, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3514 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3515
     * @tc.name      testSimpleKeyboardHardKey3515
     * @tc.desc      Checks hard key mapping for code 3757, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3515', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3515 begin');
      const actual: string = getHardKeyValue(3757, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3515 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3516
     * @tc.name      testSimpleKeyboardHardKey3516
     * @tc.desc      Checks hard key mapping for code 3757, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3516', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3516 begin');
      const actual: string = getHardKeyValue(3757, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3516 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3517
     * @tc.name      testSimpleKeyboardHardKey3517
     * @tc.desc      Checks hard key mapping for code 3758, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3517', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3517 begin');
      const actual: string = getHardKeyValue(3758, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3517 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3518
     * @tc.name      testSimpleKeyboardHardKey3518
     * @tc.desc      Checks hard key mapping for code 3758, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3518', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3518 begin');
      const actual: string = getHardKeyValue(3758, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3518 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3519
     * @tc.name      testSimpleKeyboardHardKey3519
     * @tc.desc      Checks hard key mapping for code 3759, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3519', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3519 begin');
      const actual: string = getHardKeyValue(3759, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3519 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3520
     * @tc.name      testSimpleKeyboardHardKey3520
     * @tc.desc      Checks hard key mapping for code 3759, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3520', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3520 begin');
      const actual: string = getHardKeyValue(3759, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3520 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3521
     * @tc.name      testSimpleKeyboardHardKey3521
     * @tc.desc      Checks hard key mapping for code 3760, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3521', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3521 begin');
      const actual: string = getHardKeyValue(3760, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3521 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3522
     * @tc.name      testSimpleKeyboardHardKey3522
     * @tc.desc      Checks hard key mapping for code 3760, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3522', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3522 begin');
      const actual: string = getHardKeyValue(3760, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3522 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3523
     * @tc.name      testSimpleKeyboardHardKey3523
     * @tc.desc      Checks hard key mapping for code 3761, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3523', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3523 begin');
      const actual: string = getHardKeyValue(3761, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3523 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3524
     * @tc.name      testSimpleKeyboardHardKey3524
     * @tc.desc      Checks hard key mapping for code 3761, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3524', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3524 begin');
      const actual: string = getHardKeyValue(3761, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3524 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3525
     * @tc.name      testSimpleKeyboardHardKey3525
     * @tc.desc      Checks hard key mapping for code 3762, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3525', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3525 begin');
      const actual: string = getHardKeyValue(3762, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3525 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3526
     * @tc.name      testSimpleKeyboardHardKey3526
     * @tc.desc      Checks hard key mapping for code 3762, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3526', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3526 begin');
      const actual: string = getHardKeyValue(3762, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3526 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3527
     * @tc.name      testSimpleKeyboardHardKey3527
     * @tc.desc      Checks hard key mapping for code 3763, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3527', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3527 begin');
      const actual: string = getHardKeyValue(3763, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3527 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3528
     * @tc.name      testSimpleKeyboardHardKey3528
     * @tc.desc      Checks hard key mapping for code 3763, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3528', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3528 begin');
      const actual: string = getHardKeyValue(3763, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3528 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3529
     * @tc.name      testSimpleKeyboardHardKey3529
     * @tc.desc      Checks hard key mapping for code 3764, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3529', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3529 begin');
      const actual: string = getHardKeyValue(3764, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3529 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3530
     * @tc.name      testSimpleKeyboardHardKey3530
     * @tc.desc      Checks hard key mapping for code 3764, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3530', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3530 begin');
      const actual: string = getHardKeyValue(3764, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3530 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3531
     * @tc.name      testSimpleKeyboardHardKey3531
     * @tc.desc      Checks hard key mapping for code 3765, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3531', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3531 begin');
      const actual: string = getHardKeyValue(3765, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3531 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3532
     * @tc.name      testSimpleKeyboardHardKey3532
     * @tc.desc      Checks hard key mapping for code 3765, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3532', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3532 begin');
      const actual: string = getHardKeyValue(3765, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3532 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3533
     * @tc.name      testSimpleKeyboardHardKey3533
     * @tc.desc      Checks hard key mapping for code 3766, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3533', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3533 begin');
      const actual: string = getHardKeyValue(3766, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3533 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3534
     * @tc.name      testSimpleKeyboardHardKey3534
     * @tc.desc      Checks hard key mapping for code 3766, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3534', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3534 begin');
      const actual: string = getHardKeyValue(3766, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3534 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3535
     * @tc.name      testSimpleKeyboardHardKey3535
     * @tc.desc      Checks hard key mapping for code 3767, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3535', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3535 begin');
      const actual: string = getHardKeyValue(3767, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3535 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3536
     * @tc.name      testSimpleKeyboardHardKey3536
     * @tc.desc      Checks hard key mapping for code 3767, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3536', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3536 begin');
      const actual: string = getHardKeyValue(3767, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3536 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3537
     * @tc.name      testSimpleKeyboardHardKey3537
     * @tc.desc      Checks hard key mapping for code 3768, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3537', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3537 begin');
      const actual: string = getHardKeyValue(3768, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3537 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3538
     * @tc.name      testSimpleKeyboardHardKey3538
     * @tc.desc      Checks hard key mapping for code 3768, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3538', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3538 begin');
      const actual: string = getHardKeyValue(3768, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3538 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3539
     * @tc.name      testSimpleKeyboardHardKey3539
     * @tc.desc      Checks hard key mapping for code 3769, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3539', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3539 begin');
      const actual: string = getHardKeyValue(3769, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3539 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3540
     * @tc.name      testSimpleKeyboardHardKey3540
     * @tc.desc      Checks hard key mapping for code 3769, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3540', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3540 begin');
      const actual: string = getHardKeyValue(3769, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3540 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3541
     * @tc.name      testSimpleKeyboardHardKey3541
     * @tc.desc      Checks hard key mapping for code 3770, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3541', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3541 begin');
      const actual: string = getHardKeyValue(3770, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3541 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3542
     * @tc.name      testSimpleKeyboardHardKey3542
     * @tc.desc      Checks hard key mapping for code 3770, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3542', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3542 begin');
      const actual: string = getHardKeyValue(3770, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3542 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3543
     * @tc.name      testSimpleKeyboardHardKey3543
     * @tc.desc      Checks hard key mapping for code 3771, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3543', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3543 begin');
      const actual: string = getHardKeyValue(3771, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3543 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3544
     * @tc.name      testSimpleKeyboardHardKey3544
     * @tc.desc      Checks hard key mapping for code 3771, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3544', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3544 begin');
      const actual: string = getHardKeyValue(3771, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3544 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3545
     * @tc.name      testSimpleKeyboardHardKey3545
     * @tc.desc      Checks hard key mapping for code 3772, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3545', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3545 begin');
      const actual: string = getHardKeyValue(3772, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3545 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3546
     * @tc.name      testSimpleKeyboardHardKey3546
     * @tc.desc      Checks hard key mapping for code 3772, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3546', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3546 begin');
      const actual: string = getHardKeyValue(3772, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3546 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3547
     * @tc.name      testSimpleKeyboardHardKey3547
     * @tc.desc      Checks hard key mapping for code 3773, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3547', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3547 begin');
      const actual: string = getHardKeyValue(3773, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3547 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3548
     * @tc.name      testSimpleKeyboardHardKey3548
     * @tc.desc      Checks hard key mapping for code 3773, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3548', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3548 begin');
      const actual: string = getHardKeyValue(3773, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3548 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3549
     * @tc.name      testSimpleKeyboardHardKey3549
     * @tc.desc      Checks hard key mapping for code 3774, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3549', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3549 begin');
      const actual: string = getHardKeyValue(3774, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3549 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3550
     * @tc.name      testSimpleKeyboardHardKey3550
     * @tc.desc      Checks hard key mapping for code 3774, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3550', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3550 begin');
      const actual: string = getHardKeyValue(3774, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3550 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3551
     * @tc.name      testSimpleKeyboardHardKey3551
     * @tc.desc      Checks hard key mapping for code 3775, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3551', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3551 begin');
      const actual: string = getHardKeyValue(3775, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3551 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3552
     * @tc.name      testSimpleKeyboardHardKey3552
     * @tc.desc      Checks hard key mapping for code 3775, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3552', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3552 begin');
      const actual: string = getHardKeyValue(3775, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3552 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3553
     * @tc.name      testSimpleKeyboardHardKey3553
     * @tc.desc      Checks hard key mapping for code 3776, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3553', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3553 begin');
      const actual: string = getHardKeyValue(3776, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3553 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3554
     * @tc.name      testSimpleKeyboardHardKey3554
     * @tc.desc      Checks hard key mapping for code 3776, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3554', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3554 begin');
      const actual: string = getHardKeyValue(3776, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3554 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3555
     * @tc.name      testSimpleKeyboardHardKey3555
     * @tc.desc      Checks hard key mapping for code 3777, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3555', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3555 begin');
      const actual: string = getHardKeyValue(3777, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3555 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3556
     * @tc.name      testSimpleKeyboardHardKey3556
     * @tc.desc      Checks hard key mapping for code 3777, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3556', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3556 begin');
      const actual: string = getHardKeyValue(3777, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3556 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3557
     * @tc.name      testSimpleKeyboardHardKey3557
     * @tc.desc      Checks hard key mapping for code 3778, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3557', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3557 begin');
      const actual: string = getHardKeyValue(3778, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3557 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3558
     * @tc.name      testSimpleKeyboardHardKey3558
     * @tc.desc      Checks hard key mapping for code 3778, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3558', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3558 begin');
      const actual: string = getHardKeyValue(3778, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3558 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3559
     * @tc.name      testSimpleKeyboardHardKey3559
     * @tc.desc      Checks hard key mapping for code 3779, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3559', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3559 begin');
      const actual: string = getHardKeyValue(3779, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3559 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3560
     * @tc.name      testSimpleKeyboardHardKey3560
     * @tc.desc      Checks hard key mapping for code 3779, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3560', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3560 begin');
      const actual: string = getHardKeyValue(3779, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3560 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3561
     * @tc.name      testSimpleKeyboardHardKey3561
     * @tc.desc      Checks hard key mapping for code 3780, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3561', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3561 begin');
      const actual: string = getHardKeyValue(3780, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3561 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3562
     * @tc.name      testSimpleKeyboardHardKey3562
     * @tc.desc      Checks hard key mapping for code 3780, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3562', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3562 begin');
      const actual: string = getHardKeyValue(3780, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3562 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3563
     * @tc.name      testSimpleKeyboardHardKey3563
     * @tc.desc      Checks hard key mapping for code 3781, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3563', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3563 begin');
      const actual: string = getHardKeyValue(3781, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3563 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3564
     * @tc.name      testSimpleKeyboardHardKey3564
     * @tc.desc      Checks hard key mapping for code 3781, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3564', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3564 begin');
      const actual: string = getHardKeyValue(3781, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3564 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3565
     * @tc.name      testSimpleKeyboardHardKey3565
     * @tc.desc      Checks hard key mapping for code 3782, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3565', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3565 begin');
      const actual: string = getHardKeyValue(3782, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3565 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3566
     * @tc.name      testSimpleKeyboardHardKey3566
     * @tc.desc      Checks hard key mapping for code 3782, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3566', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3566 begin');
      const actual: string = getHardKeyValue(3782, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3566 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3567
     * @tc.name      testSimpleKeyboardHardKey3567
     * @tc.desc      Checks hard key mapping for code 3783, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3567', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3567 begin');
      const actual: string = getHardKeyValue(3783, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3567 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3568
     * @tc.name      testSimpleKeyboardHardKey3568
     * @tc.desc      Checks hard key mapping for code 3783, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3568', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3568 begin');
      const actual: string = getHardKeyValue(3783, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3568 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3569
     * @tc.name      testSimpleKeyboardHardKey3569
     * @tc.desc      Checks hard key mapping for code 3784, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3569', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3569 begin');
      const actual: string = getHardKeyValue(3784, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3569 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3570
     * @tc.name      testSimpleKeyboardHardKey3570
     * @tc.desc      Checks hard key mapping for code 3784, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3570', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3570 begin');
      const actual: string = getHardKeyValue(3784, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3570 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3571
     * @tc.name      testSimpleKeyboardHardKey3571
     * @tc.desc      Checks hard key mapping for code 3785, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3571', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3571 begin');
      const actual: string = getHardKeyValue(3785, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3571 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3572
     * @tc.name      testSimpleKeyboardHardKey3572
     * @tc.desc      Checks hard key mapping for code 3785, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3572', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3572 begin');
      const actual: string = getHardKeyValue(3785, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3572 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3573
     * @tc.name      testSimpleKeyboardHardKey3573
     * @tc.desc      Checks hard key mapping for code 3786, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3573', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3573 begin');
      const actual: string = getHardKeyValue(3786, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3573 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3574
     * @tc.name      testSimpleKeyboardHardKey3574
     * @tc.desc      Checks hard key mapping for code 3786, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3574', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3574 begin');
      const actual: string = getHardKeyValue(3786, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3574 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3575
     * @tc.name      testSimpleKeyboardHardKey3575
     * @tc.desc      Checks hard key mapping for code 3787, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3575', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3575 begin');
      const actual: string = getHardKeyValue(3787, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3575 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3576
     * @tc.name      testSimpleKeyboardHardKey3576
     * @tc.desc      Checks hard key mapping for code 3787, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3576', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3576 begin');
      const actual: string = getHardKeyValue(3787, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3576 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3577
     * @tc.name      testSimpleKeyboardHardKey3577
     * @tc.desc      Checks hard key mapping for code 3788, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3577', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3577 begin');
      const actual: string = getHardKeyValue(3788, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3577 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3578
     * @tc.name      testSimpleKeyboardHardKey3578
     * @tc.desc      Checks hard key mapping for code 3788, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3578', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3578 begin');
      const actual: string = getHardKeyValue(3788, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3578 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3579
     * @tc.name      testSimpleKeyboardHardKey3579
     * @tc.desc      Checks hard key mapping for code 3789, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3579', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3579 begin');
      const actual: string = getHardKeyValue(3789, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3579 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3580
     * @tc.name      testSimpleKeyboardHardKey3580
     * @tc.desc      Checks hard key mapping for code 3789, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3580', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3580 begin');
      const actual: string = getHardKeyValue(3789, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3580 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3581
     * @tc.name      testSimpleKeyboardHardKey3581
     * @tc.desc      Checks hard key mapping for code 3790, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3581', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3581 begin');
      const actual: string = getHardKeyValue(3790, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3581 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3582
     * @tc.name      testSimpleKeyboardHardKey3582
     * @tc.desc      Checks hard key mapping for code 3790, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3582', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3582 begin');
      const actual: string = getHardKeyValue(3790, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3582 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3583
     * @tc.name      testSimpleKeyboardHardKey3583
     * @tc.desc      Checks hard key mapping for code 3791, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3583', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3583 begin');
      const actual: string = getHardKeyValue(3791, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3583 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3584
     * @tc.name      testSimpleKeyboardHardKey3584
     * @tc.desc      Checks hard key mapping for code 3791, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3584', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3584 begin');
      const actual: string = getHardKeyValue(3791, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3584 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3585
     * @tc.name      testSimpleKeyboardHardKey3585
     * @tc.desc      Checks hard key mapping for code 3792, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3585', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3585 begin');
      const actual: string = getHardKeyValue(3792, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3585 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3586
     * @tc.name      testSimpleKeyboardHardKey3586
     * @tc.desc      Checks hard key mapping for code 3792, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3586', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3586 begin');
      const actual: string = getHardKeyValue(3792, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3586 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3587
     * @tc.name      testSimpleKeyboardHardKey3587
     * @tc.desc      Checks hard key mapping for code 3793, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3587', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3587 begin');
      const actual: string = getHardKeyValue(3793, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3587 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3588
     * @tc.name      testSimpleKeyboardHardKey3588
     * @tc.desc      Checks hard key mapping for code 3793, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3588', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3588 begin');
      const actual: string = getHardKeyValue(3793, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3588 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3589
     * @tc.name      testSimpleKeyboardHardKey3589
     * @tc.desc      Checks hard key mapping for code 3794, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3589', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3589 begin');
      const actual: string = getHardKeyValue(3794, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3589 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3590
     * @tc.name      testSimpleKeyboardHardKey3590
     * @tc.desc      Checks hard key mapping for code 3794, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3590', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3590 begin');
      const actual: string = getHardKeyValue(3794, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3590 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3591
     * @tc.name      testSimpleKeyboardHardKey3591
     * @tc.desc      Checks hard key mapping for code 3795, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3591', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3591 begin');
      const actual: string = getHardKeyValue(3795, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3591 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3592
     * @tc.name      testSimpleKeyboardHardKey3592
     * @tc.desc      Checks hard key mapping for code 3795, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3592', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3592 begin');
      const actual: string = getHardKeyValue(3795, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3592 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3593
     * @tc.name      testSimpleKeyboardHardKey3593
     * @tc.desc      Checks hard key mapping for code 3796, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3593', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3593 begin');
      const actual: string = getHardKeyValue(3796, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3593 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3594
     * @tc.name      testSimpleKeyboardHardKey3594
     * @tc.desc      Checks hard key mapping for code 3796, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3594', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3594 begin');
      const actual: string = getHardKeyValue(3796, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3594 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3595
     * @tc.name      testSimpleKeyboardHardKey3595
     * @tc.desc      Checks hard key mapping for code 3797, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3595', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3595 begin');
      const actual: string = getHardKeyValue(3797, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3595 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3596
     * @tc.name      testSimpleKeyboardHardKey3596
     * @tc.desc      Checks hard key mapping for code 3797, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3596', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3596 begin');
      const actual: string = getHardKeyValue(3797, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3596 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3597
     * @tc.name      testSimpleKeyboardHardKey3597
     * @tc.desc      Checks hard key mapping for code 3798, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3597', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3597 begin');
      const actual: string = getHardKeyValue(3798, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3597 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3598
     * @tc.name      testSimpleKeyboardHardKey3598
     * @tc.desc      Checks hard key mapping for code 3798, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3598', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3598 begin');
      const actual: string = getHardKeyValue(3798, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3598 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3599
     * @tc.name      testSimpleKeyboardHardKey3599
     * @tc.desc      Checks hard key mapping for code 3799, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3599', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3599 begin');
      const actual: string = getHardKeyValue(3799, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3599 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3600
     * @tc.name      testSimpleKeyboardHardKey3600
     * @tc.desc      Checks hard key mapping for code 3799, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3600 begin');
      const actual: string = getHardKeyValue(3799, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3600 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3601
     * @tc.name      testSimpleKeyboardHardKey3601
     * @tc.desc      Checks hard key mapping for code 3800, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3601', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3601 begin');
      const actual: string = getHardKeyValue(3800, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3601 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3602
     * @tc.name      testSimpleKeyboardHardKey3602
     * @tc.desc      Checks hard key mapping for code 3800, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3602', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3602 begin');
      const actual: string = getHardKeyValue(3800, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3602 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3603
     * @tc.name      testSimpleKeyboardHardKey3603
     * @tc.desc      Checks hard key mapping for code 3801, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3603', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3603 begin');
      const actual: string = getHardKeyValue(3801, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3603 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3604
     * @tc.name      testSimpleKeyboardHardKey3604
     * @tc.desc      Checks hard key mapping for code 3801, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3604', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3604 begin');
      const actual: string = getHardKeyValue(3801, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3604 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3605
     * @tc.name      testSimpleKeyboardHardKey3605
     * @tc.desc      Checks hard key mapping for code 3802, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3605', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3605 begin');
      const actual: string = getHardKeyValue(3802, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3605 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3606
     * @tc.name      testSimpleKeyboardHardKey3606
     * @tc.desc      Checks hard key mapping for code 3802, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3606', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3606 begin');
      const actual: string = getHardKeyValue(3802, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3606 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3607
     * @tc.name      testSimpleKeyboardHardKey3607
     * @tc.desc      Checks hard key mapping for code 3803, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3607', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3607 begin');
      const actual: string = getHardKeyValue(3803, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3607 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3608
     * @tc.name      testSimpleKeyboardHardKey3608
     * @tc.desc      Checks hard key mapping for code 3803, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3608', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3608 begin');
      const actual: string = getHardKeyValue(3803, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3608 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3609
     * @tc.name      testSimpleKeyboardHardKey3609
     * @tc.desc      Checks hard key mapping for code 3804, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3609', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3609 begin');
      const actual: string = getHardKeyValue(3804, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3609 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3610
     * @tc.name      testSimpleKeyboardHardKey3610
     * @tc.desc      Checks hard key mapping for code 3804, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3610', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3610 begin');
      const actual: string = getHardKeyValue(3804, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3610 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3611
     * @tc.name      testSimpleKeyboardHardKey3611
     * @tc.desc      Checks hard key mapping for code 3805, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3611', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3611 begin');
      const actual: string = getHardKeyValue(3805, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3611 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3612
     * @tc.name      testSimpleKeyboardHardKey3612
     * @tc.desc      Checks hard key mapping for code 3805, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3612', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3612 begin');
      const actual: string = getHardKeyValue(3805, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3612 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3613
     * @tc.name      testSimpleKeyboardHardKey3613
     * @tc.desc      Checks hard key mapping for code 3806, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3613', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3613 begin');
      const actual: string = getHardKeyValue(3806, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3613 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3614
     * @tc.name      testSimpleKeyboardHardKey3614
     * @tc.desc      Checks hard key mapping for code 3806, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3614', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3614 begin');
      const actual: string = getHardKeyValue(3806, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3614 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3615
     * @tc.name      testSimpleKeyboardHardKey3615
     * @tc.desc      Checks hard key mapping for code 3807, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3615', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3615 begin');
      const actual: string = getHardKeyValue(3807, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3615 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3616
     * @tc.name      testSimpleKeyboardHardKey3616
     * @tc.desc      Checks hard key mapping for code 3807, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3616', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3616 begin');
      const actual: string = getHardKeyValue(3807, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3616 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3617
     * @tc.name      testSimpleKeyboardHardKey3617
     * @tc.desc      Checks hard key mapping for code 3808, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3617', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3617 begin');
      const actual: string = getHardKeyValue(3808, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3617 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3618
     * @tc.name      testSimpleKeyboardHardKey3618
     * @tc.desc      Checks hard key mapping for code 3808, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3618', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3618 begin');
      const actual: string = getHardKeyValue(3808, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3618 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3619
     * @tc.name      testSimpleKeyboardHardKey3619
     * @tc.desc      Checks hard key mapping for code 3809, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3619', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3619 begin');
      const actual: string = getHardKeyValue(3809, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3619 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3620
     * @tc.name      testSimpleKeyboardHardKey3620
     * @tc.desc      Checks hard key mapping for code 3809, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3620', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3620 begin');
      const actual: string = getHardKeyValue(3809, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3620 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3621
     * @tc.name      testSimpleKeyboardHardKey3621
     * @tc.desc      Checks hard key mapping for code 3810, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3621', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3621 begin');
      const actual: string = getHardKeyValue(3810, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3621 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3622
     * @tc.name      testSimpleKeyboardHardKey3622
     * @tc.desc      Checks hard key mapping for code 3810, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3622', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3622 begin');
      const actual: string = getHardKeyValue(3810, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3622 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3623
     * @tc.name      testSimpleKeyboardHardKey3623
     * @tc.desc      Checks hard key mapping for code 3811, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3623', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3623 begin');
      const actual: string = getHardKeyValue(3811, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3623 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3624
     * @tc.name      testSimpleKeyboardHardKey3624
     * @tc.desc      Checks hard key mapping for code 3811, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3624', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3624 begin');
      const actual: string = getHardKeyValue(3811, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3624 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3625
     * @tc.name      testSimpleKeyboardHardKey3625
     * @tc.desc      Checks hard key mapping for code 3812, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3625', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3625 begin');
      const actual: string = getHardKeyValue(3812, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3625 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3626
     * @tc.name      testSimpleKeyboardHardKey3626
     * @tc.desc      Checks hard key mapping for code 3812, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3626', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3626 begin');
      const actual: string = getHardKeyValue(3812, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3626 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3627
     * @tc.name      testSimpleKeyboardHardKey3627
     * @tc.desc      Checks hard key mapping for code 3813, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3627', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3627 begin');
      const actual: string = getHardKeyValue(3813, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3627 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3628
     * @tc.name      testSimpleKeyboardHardKey3628
     * @tc.desc      Checks hard key mapping for code 3813, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3628', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3628 begin');
      const actual: string = getHardKeyValue(3813, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3628 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3629
     * @tc.name      testSimpleKeyboardHardKey3629
     * @tc.desc      Checks hard key mapping for code 3814, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3629', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3629 begin');
      const actual: string = getHardKeyValue(3814, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3629 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3630
     * @tc.name      testSimpleKeyboardHardKey3630
     * @tc.desc      Checks hard key mapping for code 3814, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3630', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3630 begin');
      const actual: string = getHardKeyValue(3814, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3630 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3631
     * @tc.name      testSimpleKeyboardHardKey3631
     * @tc.desc      Checks hard key mapping for code 3815, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3631', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3631 begin');
      const actual: string = getHardKeyValue(3815, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3631 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3632
     * @tc.name      testSimpleKeyboardHardKey3632
     * @tc.desc      Checks hard key mapping for code 3815, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3632', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3632 begin');
      const actual: string = getHardKeyValue(3815, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3632 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3633
     * @tc.name      testSimpleKeyboardHardKey3633
     * @tc.desc      Checks hard key mapping for code 3816, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3633', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3633 begin');
      const actual: string = getHardKeyValue(3816, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3633 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_3634
     * @tc.name      testSimpleKeyboardHardKey3634
     * @tc.desc      Checks hard key mapping for code 3816, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey3634', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3634 begin');
      const actual: string = getHardKeyValue(3816, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey3634 end');
    })
  })
}
