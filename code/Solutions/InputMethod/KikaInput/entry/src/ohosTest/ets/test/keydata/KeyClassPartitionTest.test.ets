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
import hilog from '@ohos.hilog';
import { yieldToEventLoop } from '../support/AsyncSupport';
import { KeyboardController } from '../../../../main/ets/model/KeyboardController';
import { createKeyboardController, isAlphabetKeyCode, isNumberKeyCode } from '../support/TestSupport';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputKeyClassPartition]';

export default function keyClassPartitionTest(): void {
  describe('KeyClassPartitionTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_CLASS_PARTITION_0100
     * @tc.name      testKeyClassPartition_001
     * @tc.desc      Verify that the alphabet classifier accepts exactly the 2017..2042 block.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyClassPartition_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyClassPartition_001 begin');
      const controller: KeyboardController = createKeyboardController();

      let count: number = 0;
      for (let code = 2017; code <= 2042; code++) {
        if (isAlphabetKeyCode(controller, code)) {
          count = count + 1;
        }
      }
      expect(count).assertEqual(26);
      expect(isAlphabetKeyCode(controller, 2016)).assertEqual(false);
      expect(isAlphabetKeyCode(controller, 2043)).assertEqual(false);

      expect(count === 2042 - 2017 + 1).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyClassPartition_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_CLASS_PARTITION_0200
     * @tc.name      testKeyClassPartition_002
     * @tc.desc      Verify that the decimal block contributes exactly ten number codes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyClassPartition_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyClassPartition_002 begin');
      const controller: KeyboardController = createKeyboardController();

      let count: number = 0;
      for (let code = 2000; code <= 2009; code++) {
        if (isNumberKeyCode(controller, code)) {
          count = count + 1;
        }
      }
      expect(isNumberKeyCode(controller, 1999)).assertFalse();
      expect(isNumberKeyCode(controller, 2010)).assertFalse();
      expect(count).assertEqual(10);

      expect(2009 - 2000 + 1).assertEqual(count);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyClassPartition_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_CLASS_PARTITION_0300
     * @tc.name      testKeyClassPartition_003
     * @tc.desc      Verify that the numpad block contributes exactly ten number codes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyClassPartition_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyClassPartition_003 begin');
      const controller: KeyboardController = createKeyboardController();

      let count: number = 0;
      for (let code = 2103; code <= 2112; code++) {
        if (isNumberKeyCode(controller, code)) {
          count = count + 1;
        }
      }
      expect(isNumberKeyCode(controller, 2113)).assertFalse();
      expect(count).assertEqual(10);
      expect(isNumberKeyCode(controller, 2102)).assertFalse();

      expect(isNumberKeyCode(controller, 2103)).assertTrue();
      expect(isNumberKeyCode(controller, 2112)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyClassPartition_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_CLASS_PARTITION_0400
     * @tc.name      testKeyClassPartition_004
     * @tc.desc      Verify that the three accepted ranges contain forty-six codes in total.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyClassPartition_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyClassPartition_004 begin');
      const controller: KeyboardController = createKeyboardController();

      let letters: number = 0;
      let decimals: number = 0;
      let numpads: number = 0;
      for (let code = 2000; code <= 2112; code++) {
        if (isAlphabetKeyCode(controller, code)) {
          letters = letters + 1;
        }
        if (isNumberKeyCode(controller, code)) {
          if (code < 2100) {
            decimals = decimals + 1;
          } else {
            numpads = numpads + 1;
          }
        }
      }
      expect(letters + decimals + numpads).assertEqual(46);
      expect(decimals).assertEqual(10);
      expect(numpads).assertEqual(10);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyClassPartition_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_CLASS_PARTITION_0500
     * @tc.name      testKeyClassPartition_005
     * @tc.desc      Verify that no alphabet code is also classified as a number code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyClassPartition_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyClassPartition_005 begin');
      const controller: KeyboardController = createKeyboardController();

      let overlaps: number = 0;
      for (let code = 2000; code <= 2112; code++) {
        if (isAlphabetKeyCode(controller, code) && isNumberKeyCode(controller, code)) {
          overlaps = overlaps + 1;
        }
      }
      expect(overlaps).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyClassPartition_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_CLASS_PARTITION_0600
     * @tc.name      testKeyClassPartition_006
     * @tc.desc      Verify that the six range neighbours belong to neither classifier.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyClassPartition_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyClassPartition_006 begin');
      const controller: KeyboardController = createKeyboardController();

      const neighbours: number[] = [2016, 2043, 1999, 2010, 2102, 2113];
      let rejected: number = 0;
      for (let i = 0; i < neighbours.length; i++) {
        if (!isAlphabetKeyCode(controller, neighbours[i]) &&
          !isNumberKeyCode(controller, neighbours[i])) {
          rejected = rejected + 1;
        }
      }
      expect(rejected).assertEqual(6);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyClassPartition_006 end');
      await yieldToEventLoop();
    });

  });

}
