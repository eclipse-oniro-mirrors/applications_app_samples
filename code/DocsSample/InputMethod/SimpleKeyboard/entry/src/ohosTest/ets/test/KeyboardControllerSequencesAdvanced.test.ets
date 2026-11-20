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

export default function KeyboardControllerSequencesAdvancedTest(): void {
  describe('KeyboardControllerSequencesAdvancedTest', () => {
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0231
     * @tc.name      testKeyboardControllerSequence0231
     * @tc.desc      onKeyUp for letter code 2036 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0231 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2036, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0231 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0232
     * @tc.name      testKeyboardControllerSequence0232
     * @tc.desc      onKeyUp for letter code 2037 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0232 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2037, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0232 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0233
     * @tc.name      testKeyboardControllerSequence0233
     * @tc.desc      onKeyUp for letter code 2038 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0233 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2038, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0233 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0234
     * @tc.name      testKeyboardControllerSequence0234
     * @tc.desc      onKeyUp for letter code 2039 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0234 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2039, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0234 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0235
     * @tc.name      testKeyboardControllerSequence0235
     * @tc.desc      onKeyUp for letter code 2040 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0235 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2040, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0235 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0236
     * @tc.name      testKeyboardControllerSequence0236
     * @tc.desc      onKeyUp for letter code 2041 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0236 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2041, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0236 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0237
     * @tc.name      testKeyboardControllerSequence0237
     * @tc.desc      onKeyUp for letter code 2042 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0237 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2042, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0237 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0238
     * @tc.name      testKeyboardControllerSequence0238
     * @tc.desc      onKeyUp for digit code 2000 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0238 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2000, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0238 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0239
     * @tc.name      testKeyboardControllerSequence0239
     * @tc.desc      onKeyUp for digit code 2001 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0239 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2001, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0239 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0240
     * @tc.name      testKeyboardControllerSequence0240
     * @tc.desc      onKeyUp for digit code 2002 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0240 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2002, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0240 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0241
     * @tc.name      testKeyboardControllerSequence0241
     * @tc.desc      onKeyUp for digit code 2003 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0241 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2003, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0241 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0242
     * @tc.name      testKeyboardControllerSequence0242
     * @tc.desc      onKeyUp for digit code 2004 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0242 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2004, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0242 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0243
     * @tc.name      testKeyboardControllerSequence0243
     * @tc.desc      onKeyUp for digit code 2005 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0243 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2005, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0243 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0244
     * @tc.name      testKeyboardControllerSequence0244
     * @tc.desc      onKeyUp for digit code 2006 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0244 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2006, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0244 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0245
     * @tc.name      testKeyboardControllerSequence0245
     * @tc.desc      onKeyUp for digit code 2007 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0245 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2007, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0245 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0246
     * @tc.name      testKeyboardControllerSequence0246
     * @tc.desc      onKeyUp for digit code 2008 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0246 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2008, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0246 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0247
     * @tc.name      testKeyboardControllerSequence0247
     * @tc.desc      onKeyUp for digit code 2009 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0247 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2009, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0247 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0248
     * @tc.name      testKeyboardControllerSequence0248
     * @tc.desc      Punctuation key code 2010 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0248 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2010, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2010, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0248 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0249
     * @tc.name      testKeyboardControllerSequence0249
     * @tc.desc      Punctuation key code 2011 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0249 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2011, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2011, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0249 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0250
     * @tc.name      testKeyboardControllerSequence0250
     * @tc.desc      Punctuation key code 2043 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0250 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2043, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2043, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0250 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0251
     * @tc.name      testKeyboardControllerSequence0251
     * @tc.desc      Punctuation key code 2044 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0251 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2044, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2044, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0251 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0252
     * @tc.name      testKeyboardControllerSequence0252
     * @tc.desc      Punctuation key code 2050 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0252 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2050, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2050, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0252 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0253
     * @tc.name      testKeyboardControllerSequence0253
     * @tc.desc      Punctuation key code 2058 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0253 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2058, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2058, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0253 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0254
     * @tc.name      testKeyboardControllerSequence0254
     * @tc.desc      Punctuation key code 2064 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0254 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2064, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2064, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0254 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0255
     * @tc.name      testKeyboardControllerSequence0255
     * @tc.desc      Punctuation key code 2065 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0255 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2065, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2065, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0255 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0256
     * @tc.name      testKeyboardControllerSequence0256
     * @tc.desc      Punctuation key code 2066 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0256 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2066, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2066, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0256 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0257
     * @tc.name      testKeyboardControllerSequence0257
     * @tc.desc      Punctuation key code 2121 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0257 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2121, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2121, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0257 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0258
     * @tc.name      testKeyboardControllerSequence0258
     * @tc.desc      Punctuation key code 2122 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0258 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2122, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2122, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0258 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0259
     * @tc.name      testKeyboardControllerSequence0259
     * @tc.desc      processFunctionKeys handles KEYCODE_DEL.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0259 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_DEL')).assertTrue();
      expect(controller.processFunctionKeys('KEYCODE_DEL')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0259 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0260
     * @tc.name      testKeyboardControllerSequence0260
     * @tc.desc      processFunctionKeys handles KEYCODE_FORWARD_DEL.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0260 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_FORWARD_DEL')).assertTrue();
      expect(controller.processFunctionKeys('KEYCODE_FORWARD_DEL')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0260 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0261
     * @tc.name      testKeyboardControllerSequence0261
     * @tc.desc      processFunctionKeys handles KEYCODE_DPAD_UP.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0261 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_DPAD_UP')).assertTrue();
      expect(controller.processFunctionKeys('KEYCODE_DPAD_UP')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0261 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0262
     * @tc.name      testKeyboardControllerSequence0262
     * @tc.desc      processFunctionKeys handles KEYCODE_DPAD_DOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0262 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_DPAD_DOWN')).assertTrue();
      expect(controller.processFunctionKeys('KEYCODE_DPAD_DOWN')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0262 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0263
     * @tc.name      testKeyboardControllerSequence0263
     * @tc.desc      processFunctionKeys handles KEYCODE_DPAD_LEFT.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0263 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_DPAD_LEFT')).assertTrue();
      expect(controller.processFunctionKeys('KEYCODE_DPAD_LEFT')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0263 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0264
     * @tc.name      testKeyboardControllerSequence0264
     * @tc.desc      processFunctionKeys handles KEYCODE_DPAD_RIGHT.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0264 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_DPAD_RIGHT')).assertTrue();
      expect(controller.processFunctionKeys('KEYCODE_DPAD_RIGHT')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0264 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0265
     * @tc.name      testKeyboardControllerSequence0265
     * @tc.desc      processFunctionKeys rejects non-function value ''.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0265 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('')).assertFalse();
      expect(controller.processFunctionKeys('')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0265 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0266
     * @tc.name      testKeyboardControllerSequence0266
     * @tc.desc      processFunctionKeys rejects non-function value 'KEYCODE_DPAD_CENTER'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0266 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_DPAD_CENTER')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_DPAD_CENTER')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0266 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0267
     * @tc.name      testKeyboardControllerSequence0267
     * @tc.desc      processFunctionKeys rejects non-function value 'KEYCODE_SHIFT_LEFT'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0267 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_SHIFT_LEFT')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_SHIFT_LEFT')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0267 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0268
     * @tc.name      testKeyboardControllerSequence0268
     * @tc.desc      processFunctionKeys rejects non-function value 'KEYCODE_SHIFT_RIGHT'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0268 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_SHIFT_RIGHT')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_SHIFT_RIGHT')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0268 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0269
     * @tc.name      testKeyboardControllerSequence0269
     * @tc.desc      processFunctionKeys rejects non-function value 'KEYCODE_DEL '.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0269 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_DEL ')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_DEL ')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0269 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0270
     * @tc.name      testKeyboardControllerSequence0270
     * @tc.desc      processFunctionKeys rejects non-function value 'KEYCODE_DELX'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0270 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_DELX')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_DELX')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0270 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0271
     * @tc.name      testKeyboardControllerSequence0271
     * @tc.desc      processFunctionKeys rejects non-function value 'keycode_del'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0271 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('keycode_del')).assertFalse();
      expect(controller.processFunctionKeys('keycode_del')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0271 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0272
     * @tc.name      testKeyboardControllerSequence0272
     * @tc.desc      processFunctionKeys rejects non-function value 'KEYCODE_ALT_LEFT'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0272 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_ALT_LEFT')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_ALT_LEFT')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0272 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0273
     * @tc.name      testKeyboardControllerSequence0273
     * @tc.desc      processFunctionKeys rejects non-function value 'KEYCODE_ALT_RIGHT'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0273 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_ALT_RIGHT')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_ALT_RIGHT')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0273 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0274
     * @tc.name      testKeyboardControllerSequence0274
     * @tc.desc      processFunctionKeys rejects non-function value 'a'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0274 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('a')).assertFalse();
      expect(controller.processFunctionKeys('a')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0274 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0275
     * @tc.name      testKeyboardControllerSequence0275
     * @tc.desc      processFunctionKeys rejects non-function value '0'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0275 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('0')).assertFalse();
      expect(controller.processFunctionKeys('0')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0275 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0276
     * @tc.name      testKeyboardControllerSequence0276
     * @tc.desc      processFunctionKeys rejects non-function value 'space'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0276 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('space')).assertFalse();
      expect(controller.processFunctionKeys('space')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0276 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0277
     * @tc.name      testKeyboardControllerSequence0277
     * @tc.desc      processFunctionKeys rejects non-function value 'delete'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0277 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('delete')).assertFalse();
      expect(controller.processFunctionKeys('delete')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0277 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0278
     * @tc.name      testKeyboardControllerSequence0278
     * @tc.desc      processFunctionKeys rejects non-function value 'KEYCODE_HOME'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0278 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_HOME')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_HOME')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0278 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0279
     * @tc.name      testKeyboardControllerSequence0279
     * @tc.desc      processFunctionKeys rejects non-function value 'KEYCODE_BACK'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0279 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_BACK')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_BACK')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0279 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0280
     * @tc.name      testKeyboardControllerSequence0280
     * @tc.desc      processFunctionKeys rejects non-function value 'KEYCODE_ENTER'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0280 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_ENTER')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_ENTER')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0280 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0281
     * @tc.name      testKeyboardControllerSequence0281
     * @tc.desc      processFunctionKeys rejects non-function value 'KEYCODE_TAB'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0281 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_TAB')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_TAB')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0281 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0282
     * @tc.name      testKeyboardControllerSequence0282
     * @tc.desc      processFunctionKeys rejects non-function value 'KEYCODE_ESCAPE'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0282 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_ESCAPE')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_ESCAPE')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0282 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0283
     * @tc.name      testKeyboardControllerSequence0283
     * @tc.desc      processFunctionKeys rejects non-function value 'KEYCODE_VOLUME_UP'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0283 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_VOLUME_UP')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_VOLUME_UP')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0283 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0284
     * @tc.name      testKeyboardControllerSequence0284
     * @tc.desc      processFunctionKeys rejects non-function value 'KEYCODE_VOLUME_DOWN'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0284 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_VOLUME_DOWN')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_VOLUME_DOWN')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0284 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0285
     * @tc.name      testKeyboardControllerSequence0285
     * @tc.desc      shiftKeys recognizes KEYCODE_SHIFT_LEFT.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0285 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.shiftKeys('KEYCODE_SHIFT_LEFT')).assertTrue();
      expect(controller.shiftKeys('KEYCODE_SHIFT_LEFT')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0285 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0286
     * @tc.name      testKeyboardControllerSequence0286
     * @tc.desc      shiftKeys recognizes KEYCODE_SHIFT_RIGHT.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0286 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.shiftKeys('KEYCODE_SHIFT_RIGHT')).assertTrue();
      expect(controller.shiftKeys('KEYCODE_SHIFT_RIGHT')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0286 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0287
     * @tc.name      testKeyboardControllerSequence0287
     * @tc.desc      shiftKeys rejects non-shift value ''.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0287 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.shiftKeys('')).assertFalse();
      expect(controller.shiftKeys('')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0287 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0288
     * @tc.name      testKeyboardControllerSequence0288
     * @tc.desc      shiftKeys rejects non-shift value 'KEYCODE_DPAD_CENTER'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0288 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.shiftKeys('KEYCODE_DPAD_CENTER')).assertFalse();
      expect(controller.shiftKeys('KEYCODE_DPAD_CENTER')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0288 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0289
     * @tc.name      testKeyboardControllerSequence0289
     * @tc.desc      shiftKeys recognizes the exact KEYCODE_SHIFT_LEFT value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0289 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.shiftKeys('KEYCODE_SHIFT_LEFT')).assertTrue();
      expect(controller.shiftKeys('KEYCODE_SHIFT_LEFT')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0289 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0290
     * @tc.name      testKeyboardControllerSequence0290
     * @tc.desc      shiftKeys recognizes the exact KEYCODE_SHIFT_RIGHT value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0290 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.shiftKeys('KEYCODE_SHIFT_RIGHT')).assertTrue();
      expect(controller.shiftKeys('KEYCODE_SHIFT_RIGHT')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0290 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0291
     * @tc.name      testKeyboardControllerSequence0291
     * @tc.desc      shiftKeys rejects non-shift value 'KEYCODE_DEL '.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0291 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.shiftKeys('KEYCODE_DEL ')).assertFalse();
      expect(controller.shiftKeys('KEYCODE_DEL ')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0291 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0292
     * @tc.name      testKeyboardControllerSequence0292
     * @tc.desc      shiftKeys rejects non-shift value 'KEYCODE_DELX'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0292 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.shiftKeys('KEYCODE_DELX')).assertFalse();
      expect(controller.shiftKeys('KEYCODE_DELX')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0292 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0293
     * @tc.name      testKeyboardControllerSequence0293
     * @tc.desc      shiftKeys rejects non-shift value 'keycode_del'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0293 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.shiftKeys('keycode_del')).assertFalse();
      expect(controller.shiftKeys('keycode_del')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0293 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0294
     * @tc.name      testKeyboardControllerSequence0294
     * @tc.desc      shiftKeys rejects non-shift value 'KEYCODE_ALT_LEFT'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0294 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.shiftKeys('KEYCODE_ALT_LEFT')).assertFalse();
      expect(controller.shiftKeys('KEYCODE_ALT_LEFT')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0294 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0295
     * @tc.name      testKeyboardControllerSequence0295
     * @tc.desc      shiftKeys rejects non-shift value 'KEYCODE_ALT_RIGHT'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0295 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.shiftKeys('KEYCODE_ALT_RIGHT')).assertFalse();
      expect(controller.shiftKeys('KEYCODE_ALT_RIGHT')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0295 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0296
     * @tc.name      testKeyboardControllerSequence0296
     * @tc.desc      shiftKeys rejects non-shift value 'a'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0296 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.shiftKeys('a')).assertFalse();
      expect(controller.shiftKeys('a')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0296 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0297
     * @tc.name      testKeyboardControllerSequence0297
     * @tc.desc      shiftKeys rejects non-shift value '0'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0297 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.shiftKeys('0')).assertFalse();
      expect(controller.shiftKeys('0')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0297 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0298
     * @tc.name      testKeyboardControllerSequence0298
     * @tc.desc      shiftKeys rejects non-shift value 'space'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0298 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.shiftKeys('space')).assertFalse();
      expect(controller.shiftKeys('space')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0298 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0299
     * @tc.name      testKeyboardControllerSequence0299
     * @tc.desc      shiftKeys rejects non-shift value 'delete'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0299 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.shiftKeys('delete')).assertFalse();
      expect(controller.shiftKeys('delete')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0299 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0300
     * @tc.name      testKeyboardControllerSequence0300
     * @tc.desc      shiftKeys rejects non-shift value 'KEYCODE_HOME'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0300 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.shiftKeys('KEYCODE_HOME')).assertFalse();
      expect(controller.shiftKeys('KEYCODE_HOME')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0300 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0301
     * @tc.name      testKeyboardControllerSequence0301
     * @tc.desc      shiftKeys rejects non-shift value 'KEYCODE_BACK'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0301 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.shiftKeys('KEYCODE_BACK')).assertFalse();
      expect(controller.shiftKeys('KEYCODE_BACK')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0301 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0302
     * @tc.name      testKeyboardControllerSequence0302
     * @tc.desc      shiftKeys rejects non-shift value 'KEYCODE_ENTER'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0302 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.shiftKeys('KEYCODE_ENTER')).assertFalse();
      expect(controller.shiftKeys('KEYCODE_ENTER')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0302 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0303
     * @tc.name      testKeyboardControllerSequence0303
     * @tc.desc      shiftKeys rejects non-shift value 'KEYCODE_TAB'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0303 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.shiftKeys('KEYCODE_TAB')).assertFalse();
      expect(controller.shiftKeys('KEYCODE_TAB')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0303 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0304
     * @tc.name      testKeyboardControllerSequence0304
     * @tc.desc      shiftKeys rejects non-shift value 'KEYCODE_ESCAPE'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0304 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.shiftKeys('KEYCODE_ESCAPE')).assertFalse();
      expect(controller.shiftKeys('KEYCODE_ESCAPE')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0304 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0305
     * @tc.name      testKeyboardControllerSequence0305
     * @tc.desc      shiftKeys rejects non-shift value 'KEYCODE_VOLUME_UP'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0305 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.shiftKeys('KEYCODE_VOLUME_UP')).assertFalse();
      expect(controller.shiftKeys('KEYCODE_VOLUME_UP')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0305 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0306
     * @tc.name      testKeyboardControllerSequence0306
     * @tc.desc      shiftKeys rejects non-shift value 'KEYCODE_VOLUME_DOWN'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0306 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.shiftKeys('KEYCODE_VOLUME_DOWN')).assertFalse();
      expect(controller.shiftKeys('KEYCODE_VOLUME_DOWN')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0306 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0307
     * @tc.name      testKeyboardControllerSequence0307
     * @tc.desc      inputHardKeyCode accepts letter value a.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0307 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('a', 2017 + 0)).assertTrue();
      expect(controller.shiftKeys('a')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0307 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0308
     * @tc.name      testKeyboardControllerSequence0308
     * @tc.desc      inputHardKeyCode accepts letter value b.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0308 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('b', 2017 + 1)).assertTrue();
      expect(controller.shiftKeys('b')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0308 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0309
     * @tc.name      testKeyboardControllerSequence0309
     * @tc.desc      inputHardKeyCode accepts letter value c.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0309 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('c', 2017 + 2)).assertTrue();
      expect(controller.shiftKeys('c')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0309 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0310
     * @tc.name      testKeyboardControllerSequence0310
     * @tc.desc      inputHardKeyCode accepts letter value d.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0310 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('d', 2017 + 3)).assertTrue();
      expect(controller.shiftKeys('d')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0310 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0311
     * @tc.name      testKeyboardControllerSequence0311
     * @tc.desc      inputHardKeyCode accepts letter value e.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0311 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('e', 2017 + 4)).assertTrue();
      expect(controller.shiftKeys('e')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0311 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0312
     * @tc.name      testKeyboardControllerSequence0312
     * @tc.desc      inputHardKeyCode accepts letter value f.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0312 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('f', 2017 + 5)).assertTrue();
      expect(controller.shiftKeys('f')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0312 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0313
     * @tc.name      testKeyboardControllerSequence0313
     * @tc.desc      inputHardKeyCode accepts letter value g.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0313 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('g', 2017 + 6)).assertTrue();
      expect(controller.shiftKeys('g')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0313 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0314
     * @tc.name      testKeyboardControllerSequence0314
     * @tc.desc      inputHardKeyCode accepts letter value h.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0314 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('h', 2017 + 7)).assertTrue();
      expect(controller.shiftKeys('h')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0314 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0315
     * @tc.name      testKeyboardControllerSequence0315
     * @tc.desc      inputHardKeyCode accepts letter value i.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0315 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('i', 2017 + 8)).assertTrue();
      expect(controller.shiftKeys('i')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0315 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0316
     * @tc.name      testKeyboardControllerSequence0316
     * @tc.desc      inputHardKeyCode accepts letter value j.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0316 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('j', 2017 + 9)).assertTrue();
      expect(controller.shiftKeys('j')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0316 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0317
     * @tc.name      testKeyboardControllerSequence0317
     * @tc.desc      inputHardKeyCode accepts letter value k.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0317 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('k', 2017 + 10)).assertTrue();
      expect(controller.shiftKeys('k')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0317 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0318
     * @tc.name      testKeyboardControllerSequence0318
     * @tc.desc      inputHardKeyCode accepts letter value l.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0318 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('l', 2017 + 11)).assertTrue();
      expect(controller.shiftKeys('l')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0318 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0319
     * @tc.name      testKeyboardControllerSequence0319
     * @tc.desc      inputHardKeyCode accepts letter value m.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0319 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('m', 2017 + 12)).assertTrue();
      expect(controller.shiftKeys('m')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0319 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0320
     * @tc.name      testKeyboardControllerSequence0320
     * @tc.desc      inputHardKeyCode accepts letter value n.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0320 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('n', 2017 + 13)).assertTrue();
      expect(controller.shiftKeys('n')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0320 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0321
     * @tc.name      testKeyboardControllerSequence0321
     * @tc.desc      inputHardKeyCode accepts letter value o.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0321 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('o', 2017 + 14)).assertTrue();
      expect(controller.shiftKeys('o')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0321 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0322
     * @tc.name      testKeyboardControllerSequence0322
     * @tc.desc      inputHardKeyCode accepts letter value p.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0322 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('p', 2017 + 15)).assertTrue();
      expect(controller.shiftKeys('p')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0322 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0323
     * @tc.name      testKeyboardControllerSequence0323
     * @tc.desc      inputHardKeyCode accepts letter value q.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0323 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('q', 2017 + 16)).assertTrue();
      expect(controller.shiftKeys('q')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0323 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0324
     * @tc.name      testKeyboardControllerSequence0324
     * @tc.desc      inputHardKeyCode accepts letter value r.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0324 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('r', 2017 + 17)).assertTrue();
      expect(controller.shiftKeys('r')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0324 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0325
     * @tc.name      testKeyboardControllerSequence0325
     * @tc.desc      inputHardKeyCode accepts letter value s.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0325 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('s', 2017 + 18)).assertTrue();
      expect(controller.shiftKeys('s')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0325 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0326
     * @tc.name      testKeyboardControllerSequence0326
     * @tc.desc      inputHardKeyCode accepts letter value t.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0326 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('t', 2017 + 19)).assertTrue();
      expect(controller.shiftKeys('t')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0326 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0327
     * @tc.name      testKeyboardControllerSequence0327
     * @tc.desc      inputHardKeyCode accepts letter value u.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0327 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('u', 2017 + 20)).assertTrue();
      expect(controller.shiftKeys('u')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0327 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0328
     * @tc.name      testKeyboardControllerSequence0328
     * @tc.desc      inputHardKeyCode accepts letter value v.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0328 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('v', 2017 + 21)).assertTrue();
      expect(controller.shiftKeys('v')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0328 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0329
     * @tc.name      testKeyboardControllerSequence0329
     * @tc.desc      inputHardKeyCode accepts letter value w.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0329 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('w', 2017 + 22)).assertTrue();
      expect(controller.shiftKeys('w')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0329 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0330
     * @tc.name      testKeyboardControllerSequence0330
     * @tc.desc      inputHardKeyCode accepts letter value x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0330 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('x', 2017 + 23)).assertTrue();
      expect(controller.shiftKeys('x')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0330 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0331
     * @tc.name      testKeyboardControllerSequence0331
     * @tc.desc      inputHardKeyCode accepts letter value y.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0331 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('y', 2017 + 24)).assertTrue();
      expect(controller.shiftKeys('y')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0331 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0332
     * @tc.name      testKeyboardControllerSequence0332
     * @tc.desc      inputHardKeyCode accepts letter value z.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0332 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('z', 2017 + 25)).assertTrue();
      expect(controller.shiftKeys('z')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0332 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0333
     * @tc.name      testKeyboardControllerSequence0333
     * @tc.desc      inputHardKeyCode returns false for KEYCODE_SHIFT_LEFT.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0333 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('KEYCODE_SHIFT_LEFT', 2047)).assertFalse();
      expect(controller.shiftKeys('KEYCODE_SHIFT_LEFT')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0333 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0334
     * @tc.name      testKeyboardControllerSequence0334
     * @tc.desc      inputHardKeyCode returns false for KEYCODE_SHIFT_RIGHT.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0334 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('KEYCODE_SHIFT_RIGHT', 2047)).assertFalse();
      expect(controller.shiftKeys('KEYCODE_SHIFT_RIGHT')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0334 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0335
     * @tc.name      testKeyboardControllerSequence0335
     * @tc.desc      inputHardKeyCode dispatches function value KEYCODE_DEL.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0335 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('KEYCODE_DEL', 2012)).assertTrue();
      expect(controller.processFunctionKeys('KEYCODE_DEL')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0335 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0336
     * @tc.name      testKeyboardControllerSequence0336
     * @tc.desc      inputHardKeyCode dispatches function value KEYCODE_FORWARD_DEL.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0336 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('KEYCODE_FORWARD_DEL', 2012)).assertTrue();
      expect(controller.processFunctionKeys('KEYCODE_FORWARD_DEL')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0336 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0337
     * @tc.name      testKeyboardControllerSequence0337
     * @tc.desc      inputHardKeyCode dispatches function value KEYCODE_DPAD_UP.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0337 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('KEYCODE_DPAD_UP', 2012)).assertTrue();
      expect(controller.processFunctionKeys('KEYCODE_DPAD_UP')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0337 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0338
     * @tc.name      testKeyboardControllerSequence0338
     * @tc.desc      inputHardKeyCode dispatches function value KEYCODE_DPAD_DOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0338 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('KEYCODE_DPAD_DOWN', 2012)).assertTrue();
      expect(controller.processFunctionKeys('KEYCODE_DPAD_DOWN')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0338 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0339
     * @tc.name      testKeyboardControllerSequence0339
     * @tc.desc      inputHardKeyCode dispatches function value KEYCODE_DPAD_LEFT.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0339 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('KEYCODE_DPAD_LEFT', 2012)).assertTrue();
      expect(controller.processFunctionKeys('KEYCODE_DPAD_LEFT')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0339 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0340
     * @tc.name      testKeyboardControllerSequence0340
     * @tc.desc      inputHardKeyCode dispatches function value KEYCODE_DPAD_RIGHT.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0340 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('KEYCODE_DPAD_RIGHT', 2012)).assertTrue();
      expect(controller.processFunctionKeys('KEYCODE_DPAD_RIGHT')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0340 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0341
     * @tc.name      testKeyboardControllerSequence0341
     * @tc.desc      onKeyUp always consumes special key code 2012.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0341 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2012, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2012, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0341 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0342
     * @tc.name      testKeyboardControllerSequence0342
     * @tc.desc      onKeyUp always consumes special key code 2013.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0342 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2013, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2013, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0342 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0343
     * @tc.name      testKeyboardControllerSequence0343
     * @tc.desc      onKeyUp always consumes special key code 2014.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0343 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2014, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2014, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0343 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0344
     * @tc.name      testKeyboardControllerSequence0344
     * @tc.desc      onKeyUp always consumes special key code 2015.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0344 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2015, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2015, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0344 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0345
     * @tc.name      testKeyboardControllerSequence0345
     * @tc.desc      onKeyUp always consumes special key code 2016.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0345 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2016, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2016, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0345 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0346
     * @tc.name      testKeyboardControllerSequence0346
     * @tc.desc      onKeyUp always consumes special key code 2055.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0346 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2055, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2055, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0346 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0347
     * @tc.name      testKeyboardControllerSequence0347
     * @tc.desc      onKeyUp always consumes special key code 2071.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0347 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2071, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2071, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0347 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0348
     * @tc.name      testKeyboardControllerSequence0348
     * @tc.desc      onKeyUp for unpaired unknown key code 0 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0348 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 0, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0348 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0349
     * @tc.name      testKeyboardControllerSequence0349
     * @tc.desc      onKeyUp for unpaired unknown key code 1 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0349 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 1, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0349 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0350
     * @tc.name      testKeyboardControllerSequence0350
     * @tc.desc      onKeyUp for unpaired unknown key code 2 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0350 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0350 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0351
     * @tc.name      testKeyboardControllerSequence0351
     * @tc.desc      onKeyUp for unpaired unknown key code 3 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0351 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 3, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0351 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0352
     * @tc.name      testKeyboardControllerSequence0352
     * @tc.desc      onKeyUp for unpaired unknown key code 4 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0352 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 4, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0352 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0353
     * @tc.name      testKeyboardControllerSequence0353
     * @tc.desc      onKeyUp for unpaired unknown key code 5 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0353 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 5, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0353 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0354
     * @tc.name      testKeyboardControllerSequence0354
     * @tc.desc      onKeyUp for unpaired unknown key code 6 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0354 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 6, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0354 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0355
     * @tc.name      testKeyboardControllerSequence0355
     * @tc.desc      onKeyUp for unpaired unknown key code 7 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0355 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 7, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0355 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0356
     * @tc.name      testKeyboardControllerSequence0356
     * @tc.desc      onKeyUp for unpaired unknown key code 8 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0356 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 8, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0356 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0357
     * @tc.name      testKeyboardControllerSequence0357
     * @tc.desc      onKeyUp for unpaired unknown key code 9 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0357 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 9, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0357 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0358
     * @tc.name      testKeyboardControllerSequence0358
     * @tc.desc      onKeyUp for unpaired unknown key code 10 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0358 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 10, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0358 end');
    })
  })
}
