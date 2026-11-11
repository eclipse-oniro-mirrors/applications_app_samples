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
import { KeyCode } from '@kit.InputKit';
import { KeyboardController } from '../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KeyboardControllerSequences]';

export default function KeyboardControllerSequencesTailTest(): void {
  describe('KeyboardControllerSequencesTailTest', () => {
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0359
     * @tc.name      testKeyboardControllerSequence0359
     * @tc.desc      onKeyUp for unpaired unknown key code 11 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0359 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 11, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0359 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0360
     * @tc.name      testKeyboardControllerSequence0360
     * @tc.desc      onKeyUp for unpaired unknown key code 12 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0360 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 12, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0360 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0361
     * @tc.name      testKeyboardControllerSequence0361
     * @tc.desc      onKeyUp for unpaired unknown key code 13 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0361 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 13, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0361 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0362
     * @tc.name      testKeyboardControllerSequence0362
     * @tc.desc      onKeyUp for unpaired unknown key code 14 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0362 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 14, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0362 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0363
     * @tc.name      testKeyboardControllerSequence0363
     * @tc.desc      onKeyUp for unpaired unknown key code 15 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0363 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 15, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0363 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0364
     * @tc.name      testKeyboardControllerSequence0364
     * @tc.desc      onKeyUp for unpaired unknown key code 16 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0364 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 16, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0364 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0365
     * @tc.name      testKeyboardControllerSequence0365
     * @tc.desc      onKeyUp for unpaired unknown key code 17 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0365 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 17, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0365 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0366
     * @tc.name      testKeyboardControllerSequence0366
     * @tc.desc      onKeyUp for unpaired unknown key code 18 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0366 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 18, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0366 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0367
     * @tc.name      testKeyboardControllerSequence0367
     * @tc.desc      onKeyUp for unpaired unknown key code 19 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0367 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 19, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0367 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0368
     * @tc.name      testKeyboardControllerSequence0368
     * @tc.desc      onKeyUp for unpaired unknown key code 20 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0368 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 20, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0368 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0369
     * @tc.name      testKeyboardControllerSequence0369
     * @tc.desc      onKeyUp for unpaired unknown key code 21 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0369 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 21, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0369 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0370
     * @tc.name      testKeyboardControllerSequence0370
     * @tc.desc      onKeyUp for unpaired unknown key code 22 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0370 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 22, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0370 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0371
     * @tc.name      testKeyboardControllerSequence0371
     * @tc.desc      onKeyUp for unpaired unknown key code 23 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0371 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 23, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0371 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0372
     * @tc.name      testKeyboardControllerSequence0372
     * @tc.desc      onKeyUp for unpaired unknown key code 24 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0372 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 24, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0372 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0373
     * @tc.name      testKeyboardControllerSequence0373
     * @tc.desc      onKeyUp for unpaired unknown key code 25 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0373', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0373 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 25, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0373 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0374
     * @tc.name      testKeyboardControllerSequence0374
     * @tc.desc      onKeyUp for unpaired unknown key code 26 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0374 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 26, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0374 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0375
     * @tc.name      testKeyboardControllerSequence0375
     * @tc.desc      onKeyUp for unpaired unknown key code 27 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0375 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 27, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0375 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0376
     * @tc.name      testKeyboardControllerSequence0376
     * @tc.desc      onKeyUp for unpaired unknown key code 28 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0376 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 28, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0376 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0377
     * @tc.name      testKeyboardControllerSequence0377
     * @tc.desc      onKeyUp for unpaired unknown key code 29 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0377 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 29, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0377 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0378
     * @tc.name      testKeyboardControllerSequence0378
     * @tc.desc      onKeyUp for unpaired unknown key code 30 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0378 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 30, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0378 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0379
     * @tc.name      testKeyboardControllerSequence0379
     * @tc.desc      onKeyUp for unpaired unknown key code 31 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0379 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 31, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0379 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0380
     * @tc.name      testKeyboardControllerSequence0380
     * @tc.desc      onKeyUp for unpaired unknown key code 32 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0380 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 32, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0380 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0381
     * @tc.name      testKeyboardControllerSequence0381
     * @tc.desc      onKeyUp for unpaired unknown key code 33 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0381 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 33, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0381 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0382
     * @tc.name      testKeyboardControllerSequence0382
     * @tc.desc      onKeyUp for unpaired unknown key code 34 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0382 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 34, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0382 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0383
     * @tc.name      testKeyboardControllerSequence0383
     * @tc.desc      onKeyUp for unpaired unknown key code 35 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0383 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 35, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0383 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0384
     * @tc.name      testKeyboardControllerSequence0384
     * @tc.desc      onKeyUp for unpaired unknown key code 36 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0384 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 36, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0384 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0385
     * @tc.name      testKeyboardControllerSequence0385
     * @tc.desc      onKeyUp for unpaired unknown key code 37 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0385 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 37, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0385 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0386
     * @tc.name      testKeyboardControllerSequence0386
     * @tc.desc      onKeyUp for unpaired unknown key code 38 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0386 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 38, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0386 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0387
     * @tc.name      testKeyboardControllerSequence0387
     * @tc.desc      onKeyUp for unpaired unknown key code 39 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0387 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 39, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0387 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0388
     * @tc.name      testKeyboardControllerSequence0388
     * @tc.desc      onKeyUp for unpaired unknown key code 40 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0388 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 40, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0388 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0389
     * @tc.name      testKeyboardControllerSequence0389
     * @tc.desc      onKeyUp for unpaired unknown key code 41 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0389 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 41, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0389 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0390
     * @tc.name      testKeyboardControllerSequence0390
     * @tc.desc      onKeyUp for unpaired unknown key code 42 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0390 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 42, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0390 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0391
     * @tc.name      testKeyboardControllerSequence0391
     * @tc.desc      onKeyUp for unpaired unknown key code 43 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0391 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 43, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0391 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0392
     * @tc.name      testKeyboardControllerSequence0392
     * @tc.desc      onKeyUp for unpaired unknown key code 44 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0392 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 44, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0392 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0393
     * @tc.name      testKeyboardControllerSequence0393
     * @tc.desc      onKeyUp for unpaired unknown key code 45 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0393 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 45, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0393 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0394
     * @tc.name      testKeyboardControllerSequence0394
     * @tc.desc      onKeyUp for unpaired unknown key code 46 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0394 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 46, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0394 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0395
     * @tc.name      testKeyboardControllerSequence0395
     * @tc.desc      onKeyUp for unpaired unknown key code 47 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0395 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 47, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0395 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0396
     * @tc.name      testKeyboardControllerSequence0396
     * @tc.desc      onKeyUp for unpaired unknown key code 48 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0396 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 48, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0396 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0397
     * @tc.name      testKeyboardControllerSequence0397
     * @tc.desc      onKeyUp for unpaired unknown key code 49 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0397 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 49, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0397 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0398
     * @tc.name      testKeyboardControllerSequence0398
     * @tc.desc      onKeyUp for unpaired unknown key code 50 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0398 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 50, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0398 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0399
     * @tc.name      testKeyboardControllerSequence0399
     * @tc.desc      onKeyUp for unpaired unknown key code 51 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0399 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 51, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0399 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0400
     * @tc.name      testKeyboardControllerSequence0400
     * @tc.desc      onKeyUp for unpaired unknown key code 52 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0400 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 52, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0400 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0401
     * @tc.name      testKeyboardControllerSequence0401
     * @tc.desc      onKeyUp for unpaired unknown key code 53 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0401 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 53, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0401 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0402
     * @tc.name      testKeyboardControllerSequence0402
     * @tc.desc      onKeyUp for unpaired unknown key code 54 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0402 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 54, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0402 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0403
     * @tc.name      testKeyboardControllerSequence0403
     * @tc.desc      onKeyUp for unpaired unknown key code 55 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0403 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 55, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0403 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0404
     * @tc.name      testKeyboardControllerSequence0404
     * @tc.desc      onKeyUp for unpaired unknown key code 56 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0404 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 56, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0404 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0405
     * @tc.name      testKeyboardControllerSequence0405
     * @tc.desc      onKeyUp for unpaired unknown key code 57 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0405 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 57, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0405 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0406
     * @tc.name      testKeyboardControllerSequence0406
     * @tc.desc      onKeyUp for unpaired unknown key code 58 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0406 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 58, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0406 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0407
     * @tc.name      testKeyboardControllerSequence0407
     * @tc.desc      onKeyUp for unpaired unknown key code 59 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0407 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 59, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0407 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0408
     * @tc.name      testKeyboardControllerSequence0408
     * @tc.desc      onKeyUp for unpaired unknown key code 60 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0408 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 60, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0408 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0409
     * @tc.name      testKeyboardControllerSequence0409
     * @tc.desc      onKeyUp for unpaired unknown key code 61 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0409 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 61, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0409 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0410
     * @tc.name      testKeyboardControllerSequence0410
     * @tc.desc      onKeyUp for unpaired unknown key code 62 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0410 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 62, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0410 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0411
     * @tc.name      testKeyboardControllerSequence0411
     * @tc.desc      onKeyUp for unpaired unknown key code 63 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0411 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 63, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0411 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0412
     * @tc.name      testKeyboardControllerSequence0412
     * @tc.desc      onKeyUp for unpaired unknown key code 64 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0412 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 64, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0412 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0413
     * @tc.name      testKeyboardControllerSequence0413
     * @tc.desc      onKeyUp for unpaired unknown key code 65 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0413 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 65, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0413 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0414
     * @tc.name      testKeyboardControllerSequence0414
     * @tc.desc      onKeyUp for unpaired unknown key code 66 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0414 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 66, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0414 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0415
     * @tc.name      testKeyboardControllerSequence0415
     * @tc.desc      onKeyUp for unpaired unknown key code 67 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0415 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 67, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0415 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0416
     * @tc.name      testKeyboardControllerSequence0416
     * @tc.desc      onKeyUp for unpaired unknown key code 68 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0416 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 68, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0416 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0417
     * @tc.name      testKeyboardControllerSequence0417
     * @tc.desc      onKeyUp for unpaired unknown key code 69 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0417 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 69, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0417 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0418
     * @tc.name      testKeyboardControllerSequence0418
     * @tc.desc      onKeyUp for unpaired unknown key code 70 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0418 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 70, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0418 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0419
     * @tc.name      testKeyboardControllerSequence0419
     * @tc.desc      onKeyUp for unpaired unknown key code 71 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0419 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 71, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0419 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0420
     * @tc.name      testKeyboardControllerSequence0420
     * @tc.desc      onKeyUp for unpaired unknown key code 72 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0420 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 72, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0420 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0421
     * @tc.name      testKeyboardControllerSequence0421
     * @tc.desc      onKeyUp for unpaired unknown key code 73 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0421 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 73, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0421 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0422
     * @tc.name      testKeyboardControllerSequence0422
     * @tc.desc      onKeyUp for unpaired unknown key code 74 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0422 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 74, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0422 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0423
     * @tc.name      testKeyboardControllerSequence0423
     * @tc.desc      onKeyUp for unpaired unknown key code 75 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0423 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 75, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0423 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0424
     * @tc.name      testKeyboardControllerSequence0424
     * @tc.desc      onKeyUp for unpaired unknown key code 76 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0424 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 76, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0424 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0425
     * @tc.name      testKeyboardControllerSequence0425
     * @tc.desc      onKeyUp for unpaired unknown key code 77 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0425 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 77, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0425 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0426
     * @tc.name      testKeyboardControllerSequence0426
     * @tc.desc      onKeyUp for unpaired unknown key code 78 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0426 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 78, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0426 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0427
     * @tc.name      testKeyboardControllerSequence0427
     * @tc.desc      onKeyUp for unpaired unknown key code 79 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0427 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 79, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0427 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0428
     * @tc.name      testKeyboardControllerSequence0428
     * @tc.desc      onKeyUp for unpaired unknown key code 80 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0428 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 80, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0428 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0429
     * @tc.name      testKeyboardControllerSequence0429
     * @tc.desc      onKeyUp for unpaired unknown key code 81 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0429 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 81, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0429 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0430
     * @tc.name      testKeyboardControllerSequence0430
     * @tc.desc      onKeyUp for unpaired unknown key code 82 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0430 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 82, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0430 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0431
     * @tc.name      testKeyboardControllerSequence0431
     * @tc.desc      onKeyUp for unpaired unknown key code 83 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0431 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 83, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0431 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0432
     * @tc.name      testKeyboardControllerSequence0432
     * @tc.desc      onKeyUp for unpaired unknown key code 84 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0432 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 84, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0432 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0433
     * @tc.name      testKeyboardControllerSequence0433
     * @tc.desc      onKeyUp for unpaired unknown key code 85 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0433 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 85, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0433 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0434
     * @tc.name      testKeyboardControllerSequence0434
     * @tc.desc      onKeyUp for unpaired unknown key code 86 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0434 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 86, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0434 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0435
     * @tc.name      testKeyboardControllerSequence0435
     * @tc.desc      onKeyUp for unpaired unknown key code 87 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0435 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 87, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0435 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0436
     * @tc.name      testKeyboardControllerSequence0436
     * @tc.desc      onKeyUp for unpaired unknown key code 88 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0436 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 88, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0436 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0437
     * @tc.name      testKeyboardControllerSequence0437
     * @tc.desc      onKeyUp for unpaired unknown key code 89 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0437 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 89, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0437 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0438
     * @tc.name      testKeyboardControllerSequence0438
     * @tc.desc      onKeyUp for unpaired unknown key code 90 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0438 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 90, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0438 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0439
     * @tc.name      testKeyboardControllerSequence0439
     * @tc.desc      onKeyUp for unpaired unknown key code 91 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0439 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 91, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0439 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0440
     * @tc.name      testKeyboardControllerSequence0440
     * @tc.desc      onKeyUp for unpaired unknown key code 92 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0440', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0440 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 92, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0440 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0441
     * @tc.name      testKeyboardControllerSequence0441
     * @tc.desc      onKeyUp for unpaired unknown key code 93 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0441', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0441 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 93, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0441 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0442
     * @tc.name      testKeyboardControllerSequence0442
     * @tc.desc      onKeyUp for unpaired unknown key code 94 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0442', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0442 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 94, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0442 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0443
     * @tc.name      testKeyboardControllerSequence0443
     * @tc.desc      onKeyUp for unpaired unknown key code 95 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0443', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0443 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 95, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0443 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0444
     * @tc.name      testKeyboardControllerSequence0444
     * @tc.desc      onKeyUp for unpaired unknown key code 96 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0444', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0444 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 96, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0444 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0445
     * @tc.name      testKeyboardControllerSequence0445
     * @tc.desc      onKeyUp for unpaired unknown key code 97 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0445', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0445 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 97, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0445 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0446
     * @tc.name      testKeyboardControllerSequence0446
     * @tc.desc      onKeyUp for unpaired unknown key code 98 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0446', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0446 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 98, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0446 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0447
     * @tc.name      testKeyboardControllerSequence0447
     * @tc.desc      onKeyUp for unpaired unknown key code 99 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0447', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0447 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 99, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0447 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0448
     * @tc.name      testKeyboardControllerSequence0448
     * @tc.desc      processFunctionKeys rejects extended non-function value KEYCODE_F1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0448', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0448 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_F1')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_F1')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0448 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0449
     * @tc.name      testKeyboardControllerSequence0449
     * @tc.desc      processFunctionKeys rejects extended non-function value KEYCODE_F2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0449', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0449 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_F2')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_F2')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0449 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0450
     * @tc.name      testKeyboardControllerSequence0450
     * @tc.desc      processFunctionKeys rejects extended non-function value KEYCODE_F3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0450', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0450 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_F3')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_F3')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0450 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0451
     * @tc.name      testKeyboardControllerSequence0451
     * @tc.desc      processFunctionKeys rejects extended non-function value KEYCODE_F4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0451 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_F4')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_F4')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0451 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0452
     * @tc.name      testKeyboardControllerSequence0452
     * @tc.desc      processFunctionKeys rejects extended non-function value KEYCODE_F5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0452 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_F5')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_F5')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0452 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0453
     * @tc.name      testKeyboardControllerSequence0453
     * @tc.desc      processFunctionKeys rejects extended non-function value KEYCODE_F6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0453 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_F6')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_F6')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0453 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0454
     * @tc.name      testKeyboardControllerSequence0454
     * @tc.desc      processFunctionKeys rejects extended non-function value KEYCODE_F7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0454 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_F7')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_F7')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0454 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0455
     * @tc.name      testKeyboardControllerSequence0455
     * @tc.desc      processFunctionKeys rejects extended non-function value KEYCODE_F8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0455 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_F8')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_F8')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0455 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0456
     * @tc.name      testKeyboardControllerSequence0456
     * @tc.desc      processFunctionKeys rejects extended non-function value KEYCODE_F9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0456', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0456 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_F9')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_F9')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0456 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0457
     * @tc.name      testKeyboardControllerSequence0457
     * @tc.desc      processFunctionKeys rejects extended non-function value KEYCODE_F10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0457', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0457 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_F10')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_F10')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0457 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0458
     * @tc.name      testKeyboardControllerSequence0458
     * @tc.desc      processFunctionKeys rejects extended non-function value KEYCODE_F11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0458', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0458 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_F11')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_F11')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0458 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0459
     * @tc.name      testKeyboardControllerSequence0459
     * @tc.desc      processFunctionKeys rejects extended non-function value KEYCODE_F12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0459', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0459 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_F12')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_F12')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0459 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0460
     * @tc.name      testKeyboardControllerSequence0460
     * @tc.desc      processFunctionKeys rejects extended non-function value KEYCODE_CTRL_LEFT.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0460', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0460 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_CTRL_LEFT')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_CTRL_LEFT')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0460 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0461
     * @tc.name      testKeyboardControllerSequence0461
     * @tc.desc      processFunctionKeys rejects extended non-function value KEYCODE_CTRL_RIGHT.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0461', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0461 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_CTRL_RIGHT')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_CTRL_RIGHT')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0461 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0462
     * @tc.name      testKeyboardControllerSequence0462
     * @tc.desc      processFunctionKeys rejects extended non-function value KEYCODE_MOVE_HOME.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0462', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0462 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_MOVE_HOME')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_MOVE_HOME')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0462 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0463
     * @tc.name      testKeyboardControllerSequence0463
     * @tc.desc      processFunctionKeys rejects extended non-function value KEYCODE_MOVE_END.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0463', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0463 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_MOVE_END')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_MOVE_END')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0463 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0464
     * @tc.name      testKeyboardControllerSequence0464
     * @tc.desc      processFunctionKeys rejects extended non-function value KEYCODE_PAGE_UP.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0464', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0464 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_PAGE_UP')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_PAGE_UP')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0464 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0465
     * @tc.name      testKeyboardControllerSequence0465
     * @tc.desc      processFunctionKeys rejects extended non-function value KEYCODE_PAGE_DOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0465', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0465 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_PAGE_DOWN')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_PAGE_DOWN')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0465 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0466
     * @tc.name      testKeyboardControllerSequence0466
     * @tc.desc      processFunctionKeys rejects extended non-function value KEYCODE_INSERT.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0466', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0466 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_INSERT')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_INSERT')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0466 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0467
     * @tc.name      testKeyboardControllerSequence0467
     * @tc.desc      processFunctionKeys rejects extended non-function value KEYCODE_CAPS_LOCK.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0467', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0467 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_CAPS_LOCK')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_CAPS_LOCK')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0467 end');
    })
  })
}
