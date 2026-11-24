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
import { createPreviewHarness, PreviewHarness } from '../support/PreviewHarness';
import { pressHardKey, releaseHardKey, isShiftHeld } from '../support/TestSupport';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodModifierRoute]';

export default function ModifierRouteTestTest(): void {
  describe('ModifierRouteTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIER_ROUTE_0001
     * @tc.name      testModifierRouteTest_001
     * @tc.desc      Verify that pressing DEL twice while held sends two forward deletions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierRouteTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      expect(pressHardKey(2055)).assertEqual(true);
      expect(pressHardKey(2055)).assertEqual(true);
      expect(harness.client.forwardLengths.length).assertEqual(2);
      expect(releaseHardKey(2055)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIER_ROUTE_0002
     * @tc.name      testModifierRouteTest_002
     * @tc.desc      Verify that alt followed by the up direction still emits one caret move.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierRouteTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteTest_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      expect(pressHardKey(2045)).assertEqual(false);
      expect(pressHardKey(2012)).assertEqual(true);
      expect(harness.client.movedDirections[0]).assertEqual(1);
      expect(releaseHardKey(2012)).assertEqual(true);
      expect(releaseHardKey(2045)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIER_ROUTE_0003
     * @tc.name      testModifierRouteTest_003
     * @tc.desc      Verify that DEL is blocked under an unknown latch and works after the latch clears.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierRouteTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteTest_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      expect(pressHardKey(3000)).assertEqual(false);
      expect(pressHardKey(2055)).assertEqual(false);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(3000)).assertEqual(false);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(pressHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(harness.client.forwardLengths.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteTest_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIER_ROUTE_0004
     * @tc.name      testModifierRouteTest_004
     * @tc.desc      Verify that the same shift pressed twice and released twice leaves no hold.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierRouteTest_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteTest_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2047)).assertEqual(false);
      expect(releaseHardKey(2047)).assertEqual(true);
      expect(releaseHardKey(2047)).assertEqual(true);
      expect(isShiftHeld()).assertEqual(false);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteTest_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIER_ROUTE_EXT_0001
     * @tc.name      testModifierRouteExtended_001
     * @tc.desc      Verify that alt routes the forward-delete code to one backward deletion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierRouteExtended_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteExtended_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      expect(pressHardKey(2045)).assertEqual(false);
      expect(pressHardKey(2071)).assertEqual(true);
      expect(harness.client.backwardLengths.join(',')).assertEqual('1');
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(releaseHardKey(2071)).assertEqual(true);
      expect(releaseHardKey(2045)).assertEqual(true);
      expect(harness.client.buffer).assertEqual('abc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteExtended_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIER_ROUTE_EXT_0002
     * @tc.name      testModifierRouteExtended_002
     * @tc.desc      Verify that alt does not stop the center-pad token from being typed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierRouteExtended_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteExtended_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2045)).assertEqual(false);
      expect(pressHardKey(2016)).assertEqual(true);
      expect(releaseHardKey(2016)).assertEqual(true);
      expect(releaseHardKey(2045)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('KEYCODE_DPAD_CENTER');
      expect(harness.client.movedDirections.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('KEYCODE_DPAD_CENTER');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteExtended_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIER_ROUTE_EXT_0003
     * @tc.name      testModifierRouteExtended_003
     * @tc.desc      Verify that an unrecognized control modifier blocks both a letter and DEL until released.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierRouteExtended_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteExtended_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      expect(pressHardKey(2072)).assertEqual(false);
      expect(pressHardKey(2017)).assertEqual(false);
      expect(pressHardKey(2055)).assertEqual(false);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(false);
      expect(releaseHardKey(2072)).assertEqual(false);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('abc');
      expect(pressHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteExtended_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIER_ROUTE_EXT_0004
     * @tc.name      testModifierRouteExtended_004
     * @tc.desc      Verify that the shift-then-alt block clears after both releases and a fresh shift types uppercase.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierRouteExtended_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteExtended_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      const blocked: boolean[] = [pressHardKey(2047), pressHardKey(2045), pressHardKey(2017),
        releaseHardKey(2017), releaseHardKey(2045), releaseHardKey(2047)];
      expect(blocked.join('|')).assertEqual('false|false|false|false|false|false');
      expect(harness.client.insertedTexts.length).assertEqual(0);
      const typed: string = 'A';
      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2047)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual(typed);
      expect(harness.client.buffer).assertEqual(typed);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteExtended_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIER_ROUTE_EXT_0005
     * @tc.name      testModifierRouteExtended_005
     * @tc.desc      Verify that alt released before DEL keeps the forwarded deletion and later typing intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierRouteExtended_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteExtended_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      expect(pressHardKey(2045)).assertEqual(false);
      expect(pressHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(2045)).assertEqual(true);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(harness.client.forwardLengths.join(',')).assertEqual('1');
      expect(pressHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      expect(harness.client.buffer).assertEqual('abca');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteExtended_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIER_ROUTE_EXT_0006
     * @tc.name      testModifierRouteExtended_006
     * @tc.desc      Verify that releasing shift first in a blocked shift-DEL chord leaves the latch for one more key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierRouteExtended_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteExtended_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2055)).assertEqual(false);
      expect(releaseHardKey(2047)).assertEqual(false);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(pressHardKey(2017)).assertEqual(false);
      expect(releaseHardKey(2017)).assertEqual(false);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteExtended_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIER_ROUTE_EXT_0007
     * @tc.name      testModifierRouteExtended_007
     * @tc.desc      Verify that holding both alt keys still lets a letter reach the editor unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierRouteExtended_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteExtended_007 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2045)).assertEqual(false);
      expect(pressHardKey(2046)).assertEqual(false);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2046)).assertEqual(true);
      expect(releaseHardKey(2045)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      expect(harness.client.buffer).assertEqual('a');
      expect(isShiftHeld()).assertEqual(false);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteExtended_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIER_ROUTE_EXT_0008
     * @tc.name      testModifierRouteExtended_008
     * @tc.desc      Verify that alt pressed before shift keeps shift from arming gating for DEL.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierRouteExtended_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteExtended_008 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      expect(pressHardKey(2045)).assertEqual(false);
      expect(pressHardKey(2047)).assertEqual(false);
      expect(isShiftHeld()).assertEqual(false);
      expect(pressHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(2047)).assertEqual(true);
      expect(releaseHardKey(2045)).assertEqual(true);
      expect(harness.client.forwardLengths.join(',')).assertEqual('1');
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteExtended_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIER_ROUTE_EXT_0009
     * @tc.name      testModifierRouteExtended_009
     * @tc.desc      Verify that two letters typed under alt are both delivered in press order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierRouteExtended_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteExtended_009 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2045)).assertEqual(false);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2018)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2018)).assertEqual(true);
      expect(releaseHardKey(2045)).assertEqual(true);
      expect(harness.client.insertedTexts.length).assertEqual(2);
      expect(harness.client.insertedTexts[0]).assertEqual('a');
      expect(harness.client.insertedTexts[1]).assertEqual('b');
      expect(harness.client.buffer).assertEqual('ab');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteExtended_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIER_ROUTE_EXT_0010
     * @tc.name      testModifierRouteExtended_010
     * @tc.desc      Verify that two DEL presses under alt produce two forward deletions without releases between.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierRouteExtended_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteExtended_010 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      expect(pressHardKey(2045)).assertEqual(false);
      expect(pressHardKey(2055)).assertEqual(true);
      expect(pressHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(2045)).assertEqual(true);
      expect(harness.client.forwardLengths.join(',')).assertEqual('1,1');
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('abc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteExtended_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIER_ROUTE_EXT_0011
     * @tc.name      testModifierRouteExtended_011
     * @tc.desc      Verify that shift followed by alt blocks DEL and that both releases stay blocked.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierRouteExtended_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteExtended_011 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2045)).assertEqual(false);
      expect(pressHardKey(2055)).assertEqual(false);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(2045)).assertEqual(false);
      expect(releaseHardKey(2047)).assertEqual(false);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('abc');
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteExtended_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIER_ROUTE_EXT_0012
     * @tc.name      testModifierRouteExtended_012
     * @tc.desc      Verify that releasing DEL before shift ends the blocked chord immediately and typing resumes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierRouteExtended_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteExtended_012 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2055)).assertEqual(false);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(2047)).assertEqual(false);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      expect(harness.client.buffer).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteExtended_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIER_ROUTE_EXT_0013
     * @tc.name      testModifierRouteExtended_013
     * @tc.desc      Verify that two held alt keys do not block a forward deletion from being routed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierRouteExtended_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteExtended_013 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      expect(pressHardKey(2045)).assertEqual(false);
      expect(pressHardKey(2046)).assertEqual(false);
      expect(pressHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(2046)).assertEqual(true);
      expect(releaseHardKey(2045)).assertEqual(true);
      expect(harness.client.forwardLengths.join(',')).assertEqual('1');
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('abc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteExtended_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIER_ROUTE_EXT_0014
     * @tc.name      testModifierRouteExtended_014
     * @tc.desc      Verify that releasing alt first ends the shift-alt block and the next letter stays lowercase.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierRouteExtended_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteExtended_014 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2045)).assertEqual(false);
      expect(releaseHardKey(2045)).assertEqual(false);
      expect(releaseHardKey(2047)).assertEqual(false);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      expect(isShiftHeld()).assertEqual(false);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteExtended_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIER_ROUTE_CHORD_0001
     * @tc.name      testModifierRouteChord_001
     * @tc.desc      Verify that a digit is swallowed under shift and delivered after both releases.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierRouteChord_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteChord_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2001)).assertEqual(false);
      expect(releaseHardKey(2001)).assertEqual(false);
      expect(releaseHardKey(2047)).assertEqual(false);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(pressHardKey(2001)).assertEqual(true);
      expect(releaseHardKey(2001)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('1');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteChord_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIER_ROUTE_CHORD_0002
     * @tc.name      testModifierRouteChord_002
     * @tc.desc      Verify that a keypad code held with alt latches and recovers after all releases.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierRouteChord_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteChord_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2045)).assertEqual(false);
      expect(pressHardKey(2103)).assertEqual(false);
      expect(pressHardKey(2018)).assertEqual(false);
      expect(releaseHardKey(2018)).assertEqual(false);
      expect(releaseHardKey(2103)).assertEqual(false);
      expect(releaseHardKey(2045)).assertEqual(false);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(pressHardKey(2018)).assertEqual(true);
      expect(releaseHardKey(2018)).assertEqual(true);
      expect(harness.client.buffer).assertEqual('b');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteChord_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIER_ROUTE_CHORD_0003
     * @tc.name      testModifierRouteChord_003
     * @tc.desc      Verify that a shift held over the forward-delete code suppresses the backward deletion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierRouteChord_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteChord_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      const outcomes: boolean[] = [pressHardKey(2047), pressHardKey(2071), releaseHardKey(2071),
        releaseHardKey(2047)];
      expect(outcomes.length).assertEqual(4);
      expect(outcomes.join(',')).assertEqual('false,false,true,false');
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('abc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteChord_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIER_ROUTE_CHORD_0004
     * @tc.name      testModifierRouteChord_004
     * @tc.desc      Verify that DEL still deletes while alt and a letter are held before it.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierRouteChord_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteChord_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      const keyOrder: number[] = [2045, 2017, 2055];
      expect(pressHardKey(keyOrder[0])).assertEqual(false);
      expect(pressHardKey(keyOrder[1])).assertEqual(true);
      expect(pressHardKey(keyOrder[2])).assertEqual(true);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2045)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      expect(harness.client.forwardLengths.length).assertEqual(1);
      expect(harness.client.forwardLengths[0]).assertEqual(1);
      expect(harness.client.buffer).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteChord_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIER_ROUTE_CHORD_0005
     * @tc.name      testModifierRouteChord_005
     * @tc.desc      Verify that a digit then a letter under alt both insert in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierRouteChord_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteChord_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2045)).assertEqual(false);
      expect(pressHardKey(2001)).assertEqual(true);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2001)).assertEqual(true);
      expect(releaseHardKey(2045)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('1a');
      expect(harness.client.buffer).assertEqual('1a');
      expect(harness.client.forwardLengths.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteChord_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIER_ROUTE_CHORD_0006
     * @tc.name      testModifierRouteChord_006
     * @tc.desc      Verify that a control modifier pressed after a letter poisons the next letter until release.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierRouteChord_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteChord_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2072)).assertEqual(false);
      expect(pressHardKey(2018)).assertEqual(false);
      expect(releaseHardKey(2018)).assertEqual(false);
      expect(releaseHardKey(2072)).assertEqual(false);
      expect(releaseHardKey(2017)).assertEqual(false);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      expect(pressHardKey(2018)).assertEqual(true);
      expect(releaseHardKey(2018)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteChord_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIER_ROUTE_CHORD_0007
     * @tc.name      testModifierRouteChord_007
     * @tc.desc      Verify that alt pressed after a letter stays inert and the next letter still inserts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierRouteChord_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteChord_007 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2045)).assertEqual(false);
      expect(pressHardKey(2018)).assertEqual(true);
      expect(releaseHardKey(2018)).assertEqual(true);
      expect(releaseHardKey(2045)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');
      expect(harness.client.buffer).assertEqual('ab');
      expect(harness.client.movedDirections.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteChord_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIER_ROUTE_CHORD_0008
     * @tc.name      testModifierRouteChord_008
     * @tc.desc      Verify that the right shift blocks the forward-delete code without any deletion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierRouteChord_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteChord_008 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      expect(pressHardKey(2048)).assertEqual(false);
      expect(pressHardKey(2071)).assertEqual(false);
      expect(releaseHardKey(2071)).assertEqual(true);
      expect(releaseHardKey(2048)).assertEqual(false);
      expect(harness.client.backwardLengths.join(',')).assertEqual('');
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.buffer.length).assertEqual(3);
      expect(harness.client.buffer.indexOf('abc')).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteChord_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIER_ROUTE_CHORD_0009
     * @tc.name      testModifierRouteChord_009
     * @tc.desc      Verify that a repeated DEL release after one alt deletion adds no second deletion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierRouteChord_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteChord_009 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      expect(pressHardKey(2045)).assertEqual(false);
      expect(pressHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(2045)).assertEqual(true);
      expect(harness.client.forwardLengths.join(',')).assertEqual('1');
      expect(harness.client.forwardLengths.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('abc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteChord_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIER_ROUTE_CHORD_0010
     * @tc.name      testModifierRouteChord_010
     * @tc.desc      Verify that a control modifier blocks a digit and releases the block only after all keys clear.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierRouteChord_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteChord_010 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      const outcomes: boolean[] = [];
      outcomes.push(pressHardKey(2072));
      outcomes.push(pressHardKey(2001));
      outcomes.push(releaseHardKey(2001));
      outcomes.push(releaseHardKey(2072));
      expect(outcomes.join('|')).assertEqual('false|false|false|false');
      expect(harness.client.insertedTexts.join('')).assertEqual('');
      const delivered: boolean = pressHardKey(2001);
      expect(delivered).assertEqual(true);
      expect(releaseHardKey(2001)).assertEqual(true);
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.insertedTexts[0]).assertEqual('1');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteChord_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIER_ROUTE_CHORD_0011
     * @tc.name      testModifierRouteChord_011
     * @tc.desc      Verify that the forward-delete code under alt performs one backward deletion and no forward one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierRouteChord_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteChord_011 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      expect(pressHardKey(2045)).assertEqual(false);
      expect(pressHardKey(2071)).assertEqual(true);
      expect(releaseHardKey(2071)).assertEqual(true);
      expect(releaseHardKey(2045)).assertEqual(true);
      expect(harness.client.backwardLengths.join(',')).assertEqual('1');
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteChord_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIER_ROUTE_CHORD_0012
     * @tc.name      testModifierRouteChord_012
     * @tc.desc      Verify that releasing control before the blocked letter keeps the latch closed for that letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierRouteChord_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteChord_012 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2072)).assertEqual(false);
      expect(pressHardKey(2017)).assertEqual(false);
      expect(releaseHardKey(2072)).assertEqual(false);
      expect(pressHardKey(2018)).assertEqual(false);
      expect(releaseHardKey(2018)).assertEqual(false);
      expect(releaseHardKey(2017)).assertEqual(false);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(pressHardKey(2018)).assertEqual(true);
      expect(releaseHardKey(2018)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('b');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteChord_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIER_ROUTE_GATE_0001
     * @tc.name      testModifierRouteGate_001
     * @tc.desc      Verify that the control modifier blocks the forward-delete code as well as letters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierRouteGate_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteGate_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      expect(pressHardKey(2072)).assertEqual(false);
      expect(pressHardKey(2071)).assertEqual(false);
      expect(releaseHardKey(2071)).assertEqual(true);
      expect(releaseHardKey(2072)).assertEqual(false);
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('abc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteGate_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIER_ROUTE_GATE_0002
     * @tc.name      testModifierRouteGate_002
     * @tc.desc      Verify that shift blocks the center-pad token so no glyph and no caret move appear.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierRouteGate_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteGate_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2016)).assertEqual(false);
      expect(releaseHardKey(2016)).assertEqual(true);
      expect(releaseHardKey(2047)).assertEqual(false);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.movedDirections.length).assertEqual(0);
      expect(harness.client.selectedRanges.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('abc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierRouteGate_002 end');
      await yieldToEventLoop();
    });

  });
}
