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
import { InputHandler, KeyboardController } from '../../../../main/ets/model/KeyboardController';
import { ClientHarness, createClientHarness } from '../support/ClientHarness';
import { createKeyboardController, inputHardKeyValue } from '../support/TestSupport';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputTokenArgument]';

export default function TokenArgumentTestTest(): void {
  describe('TokenArgumentTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_TOKEN_ARGUMENT_0100
     * @tc.name      testTokenArgument_001
     * @tc.desc      Verify that an empty token with an unknown code is accepted as an empty insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTokenArgument_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgument_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      expect(inputHardKeyValue(controller, '', 9999)).assertTrue();
      expect(harness.client.journal.join('')).assertEqual('insert:');
      expect(harness.client.insertedTexts[0].length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgument_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TOKEN_ARGUMENT_0200
     * @tc.name      testTokenArgument_002
     * @tc.desc      Verify that a left-arrow token routes to a cursor move instead of an insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTokenArgument_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgument_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      expect(inputHardKeyValue(controller, 'KEYCODE_DPAD_LEFT', 2014)).assertTrue();
      expect(harness.client.movedDirections.join('')).assertEqual('3');
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgument_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TOKEN_ARGUMENT_0300
     * @tc.name      testTokenArgument_003
     * @tc.desc      Verify that a DEL token sends one forward deletion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTokenArgument_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgument_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      expect(inputHardKeyValue(controller, 'KEYCODE_DEL', 2055)).assertTrue();
      expect(harness.client.forwardLengths.join('')).assertEqual('1');
      expect(harness.client.journal.join('')).assertEqual('forward:1');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgument_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TOKEN_ARGUMENT_0400
     * @tc.name      testTokenArgument_004
     * @tc.desc      Verify that a FORWARD_DEL token sends one backward deletion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTokenArgument_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgument_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      expect(inputHardKeyValue(controller, 'KEYCODE_FORWARD_DEL', 2071)).assertTrue();
      expect(harness.client.backwardLengths.join('')).assertEqual('1');
      expect(harness.client.forwardLengths.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgument_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TOKEN_ARGUMENT_0500
     * @tc.name      testTokenArgument_005
     * @tc.desc      Verify that a shift token is consumed without insertion or movement.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTokenArgument_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgument_005 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      expect(inputHardKeyValue(controller, 'KEYCODE_SHIFT_LEFT', 2047)).assertFalse();
      expect(inputHardKeyValue(controller, 'KEYCODE_SHIFT_RIGHT', 2048)).assertFalse();
      expect(harness.client.journal.length).assertEqual(0);
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgument_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TOKEN_ARGUMENT_0600
     * @tc.name      testTokenArgument_006
     * @tc.desc      Verify that a CJK literal token is inserted unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTokenArgument_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgument_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      expect(inputHardKeyValue(controller, '中文', 9999)).assertTrue();
      expect(harness.client.insertedTexts[0]).assertEqual('中文');
      expect(harness.client.insertedTexts[0].length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgument_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TOKEN_ARGUMENT_0700
     * @tc.name      testTokenArgument_007
     * @tc.desc      Verify that a single-space token inserts one whitespace unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTokenArgument_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgument_007 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      expect(inputHardKeyValue(controller, ' ', 2050)).assertTrue();
      expect(harness.client.insertedTexts[0]).assertEqual(' ');
      expect(harness.client.insertedTexts[0].charCodeAt(0)).assertEqual(32);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgument_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TOKEN_ARGUMENT_0800
     * @tc.name      testTokenArgument_008
     * @tc.desc      Verify that a letter token with its own code is inserted by the composed stage.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTokenArgument_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgument_008 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      expect(inputHardKeyValue(controller, 'a', 2017)).assertTrue();
      expect(harness.client.journal.join('')).assertEqual('insert:a');
      expect(harness.client.movedDirections.length + harness.client.forwardLengths.length +
        harness.client.backwardLengths.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgument_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TOKEN_ARGUMENT_FAULT_0100
     * @tc.name      testTokenArgumentFault_001
     * @tc.desc      Verify that a literal, a function token and a literal compose in that exact order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTokenArgumentFault_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(inputHardKeyValue(controller, 'a', 2017)).assertTrue();
      expect(inputHardKeyValue(controller, 'KEYCODE_DEL', 2055)).assertTrue();
      expect(inputHardKeyValue(controller, 'b', 2018)).assertTrue();
      expect(harness.client.journal.join('|')).assertEqual('insert:a|forward:1|insert:b');
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');
      expect(harness.client.forwardLengths.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TOKEN_ARGUMENT_FAULT_0200
     * @tc.name      testTokenArgumentFault_002
     * @tc.desc      Verify that a shift token call leaves the composed stage ready for a lowercase literal.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTokenArgumentFault_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      // A shift token is consumed by its stage, so the call reports false and stops there.
      expect(inputHardKeyValue(controller, 'KEYCODE_SHIFT_RIGHT', 2048)).assertFalse();
      expect(harness.client.journal.length).assertEqual(0);
      // The next independent call must not inherit any shifted state.
      expect(inputHardKeyValue(controller, 'c', 2019)).assertTrue();
      expect(harness.client.insertedTexts[0]).assertEqual('c');
      expect(harness.client.movedDirections.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TOKEN_ARGUMENT_FAULT_0300
     * @tc.name      testTokenArgumentFault_003
     * @tc.desc      Verify that an empty token with the left-shift code still inserts empty text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTokenArgumentFault_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      // The key code is diagnostic only; an empty token never turns into shift handling.
      expect(inputHardKeyValue(controller, '', 2047)).assertTrue();
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.insertedTexts[0]).assertEqual('');
      expect(harness.client.journal.join('|')).assertEqual('insert:');
      expect(harness.client.movedDirections.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TOKEN_ARGUMENT_FAULT_0400
     * @tc.name      testTokenArgumentFault_004
     * @tc.desc      Verify that an empty token carrying the DEL code does not delete.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTokenArgumentFault_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(inputHardKeyValue(controller, '', 2055)).assertTrue();
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.insertedTexts[0]).assertEqual('');
      expect(harness.client.journal.join('|')).assertEqual('insert:');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TOKEN_ARGUMENT_FAULT_0500
     * @tc.name      testTokenArgumentFault_005
     * @tc.desc      Verify that a newline token with the DEL code is inserted instead of deleting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTokenArgumentFault_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_005 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(inputHardKeyValue(controller, '\n', 2055)).assertTrue();
      expect(harness.client.insertedTexts[0]).assertEqual('\n');
      expect(harness.client.insertedTexts[0].length).assertEqual(1);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TOKEN_ARGUMENT_FAULT_0600
     * @tc.name      testTokenArgumentFault_006
     * @tc.desc      Verify that a payload resembling a journal command is inserted as plain text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTokenArgumentFault_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      const payload: string = 'insert:KEYCODE_DEL';

      expect(inputHardKeyValue(controller, payload, 2055)).assertTrue();
      expect(harness.client.insertedTexts[0]).assertEqual(payload);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.journal.length).assertEqual(1);
      expect(harness.client.journal[0].indexOf('insert:')).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TOKEN_ARGUMENT_FAULT_0700
     * @tc.name      testTokenArgumentFault_007
     * @tc.desc      Verify that a backward-command lookalike token does not create a deletion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTokenArgumentFault_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_007 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(inputHardKeyValue(controller, 'back:7', 2042)).assertTrue();
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.insertedTexts[0]).assertEqual('back:7');
      expect(harness.client.journal.join('|')).assertEqual('insert:back:7');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TOKEN_ARGUMENT_FAULT_0800
     * @tc.name      testTokenArgumentFault_008
     * @tc.desc      Verify that consecutive DEL and FORWARD_DEL calls keep each direction separate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTokenArgumentFault_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_008 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(inputHardKeyValue(controller, 'KEYCODE_DEL', 2055)).assertTrue();
      expect(inputHardKeyValue(controller, 'KEYCODE_FORWARD_DEL', 2071)).assertTrue();
      expect(harness.client.forwardLengths[0]).assertEqual(1);
      expect(harness.client.backwardLengths[0]).assertEqual(1);
      expect(harness.client.journal.join('|')).assertEqual('forward:1|back:1');
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TOKEN_ARGUMENT_FAULT_0900
     * @tc.name      testTokenArgumentFault_009
     * @tc.desc      Verify that a literal between two DEL calls does not replace either deletion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTokenArgumentFault_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_009 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(inputHardKeyValue(controller, 'KEYCODE_DEL', 2055)).assertTrue();
      expect(inputHardKeyValue(controller, 'x', 2017)).assertTrue();
      expect(inputHardKeyValue(controller, 'KEYCODE_DEL', 2055)).assertTrue();
      expect(harness.client.journal.join('|')).assertEqual('forward:1|insert:x|forward:1');
      expect(harness.client.forwardLengths.length).assertEqual(2);
      expect(harness.client.insertedTexts.join('')).assertEqual('x');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TOKEN_ARGUMENT_FAULT_1000
     * @tc.name      testTokenArgumentFault_010
     * @tc.desc      Verify that two upward-arrow calls are both recorded instead of collapsed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTokenArgumentFault_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_010 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(inputHardKeyValue(controller, 'KEYCODE_DPAD_UP', 2012)).assertTrue();
      expect(inputHardKeyValue(controller, 'KEYCODE_DPAD_UP', 2012)).assertTrue();
      expect(harness.client.movedDirections.join('|')).assertEqual('1|1');
      expect(harness.client.journal.length).assertEqual(2);
      expect(harness.client.journal[1].indexOf('move:')).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TOKEN_ARGUMENT_FAULT_1100
     * @tc.name      testTokenArgumentFault_011
     * @tc.desc      Verify that a downward move between two identical literals keeps its middle slot.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTokenArgumentFault_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_011 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(inputHardKeyValue(controller, 'q', 2033)).assertTrue();
      expect(inputHardKeyValue(controller, 'KEYCODE_DPAD_DOWN', 2013)).assertTrue();
      expect(inputHardKeyValue(controller, 'q', 2033)).assertTrue();
      expect(harness.client.journal.join('|')).assertEqual('insert:q|move:2|insert:q');
      expect(harness.client.insertedTexts.join('')).assertEqual('qq');
      expect(harness.client.movedDirections[0]).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TOKEN_ARGUMENT_FAULT_1200
     * @tc.name      testTokenArgumentFault_012
     * @tc.desc      Verify that FORWARD_DEL still deletes backward when it carries the DEL code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTokenArgumentFault_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_012 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(inputHardKeyValue(controller, 'KEYCODE_FORWARD_DEL', 2055)).assertTrue();
      expect(harness.client.backwardLengths.join('')).assertEqual('1');
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TOKEN_ARGUMENT_FAULT_1300
     * @tc.name      testTokenArgumentFault_013
     * @tc.desc      Verify that DEL still deletes forward when it carries a letter code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTokenArgumentFault_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_013 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(inputHardKeyValue(controller, 'KEYCODE_DEL', 2017)).assertTrue();
      expect(harness.client.forwardLengths[0]).assertEqual(1);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.movedDirections.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TOKEN_ARGUMENT_FAULT_1400
     * @tc.name      testTokenArgumentFault_014
     * @tc.desc      Verify that a literal carrying the DEL code inserts without deleting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTokenArgumentFault_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_014 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(inputHardKeyValue(controller, 'x', 2055)).assertTrue();
      const expectedJournal: string[] = ['insert:x'];
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.insertedTexts.join('')).assertEqual('x');
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.journal.length).assertEqual(expectedJournal.length);
      expect(harness.client.journal[0]).assertEqual(expectedJournal[0]);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TOKEN_ARGUMENT_FAULT_1500
     * @tc.name      testTokenArgumentFault_015
     * @tc.desc      Verify that a NUL token is stored as one code unit with value zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTokenArgumentFault_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_015 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(inputHardKeyValue(controller, '\u0000', 9999)).assertTrue();
      expect(harness.client.insertedTexts[0].length).assertEqual(1);
      expect(harness.client.insertedTexts[0].charCodeAt(0)).assertEqual(0);
      expect(harness.client.journal.length).assertEqual(1);
      expect(harness.client.journal[0].indexOf('insert:')).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TOKEN_ARGUMENT_FAULT_1600
     * @tc.name      testTokenArgumentFault_016
     * @tc.desc      Verify that the zero glyph token is inserted rather than treated as empty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTokenArgumentFault_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_016 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(inputHardKeyValue(controller, '0', 2000)).assertTrue();
      expect(harness.client.insertedTexts[0]).assertEqual('0');
      expect(harness.client.insertedTexts[0].length).assertEqual(1);
      expect(harness.client.journal.join('|')).assertEqual('insert:0');
      expect(harness.client.forwardLengths.length +
        harness.client.backwardLengths.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TOKEN_ARGUMENT_FAULT_1700
     * @tc.name      testTokenArgumentFault_017
     * @tc.desc      Verify that a shift token between two literals contributes no journal entry.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTokenArgumentFault_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_017 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(inputHardKeyValue(controller, 'a', 2017)).assertTrue();
      expect(inputHardKeyValue(controller, 'KEYCODE_SHIFT_LEFT', 2047)).assertFalse();
      expect(inputHardKeyValue(controller, 'b', 2018)).assertTrue();
      expect(harness.client.journal.join('|')).assertEqual('insert:a|insert:b');
      expect(harness.client.journal.length).assertEqual(2);
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TOKEN_ARGUMENT_FAULT_1800
     * @tc.name      testTokenArgumentFault_018
     * @tc.desc      Verify that a function token after a shift token still dispatches on its own call.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTokenArgumentFault_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_018 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(inputHardKeyValue(controller, 'KEYCODE_SHIFT_RIGHT', 2048)).assertFalse();
      expect(inputHardKeyValue(controller, 'KEYCODE_DEL', 2055)).assertTrue();
      expect(harness.client.forwardLengths[0]).assertEqual(1);
      expect(harness.client.journal.join('|')).assertEqual('forward:1');
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TOKEN_ARGUMENT_FAULT_1900
     * @tc.name      testTokenArgumentFault_019
     * @tc.desc      Verify that a CRLF token carrying the DEL code inserts two units without deleting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTokenArgumentFault_019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_019 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(inputHardKeyValue(controller, '\r\n', 2055)).assertTrue();
      const stored: string = harness.client.insertedTexts[0];
      const storedCodes: number[] = [stored.charCodeAt(0), stored.charCodeAt(1)];
      expect(stored.length).assertEqual(2);
      expect(storedCodes.join(',')).assertEqual('13,10');
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_019 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TOKEN_ARGUMENT_FAULT_2000
     * @tc.name      testTokenArgumentFault_020
     * @tc.desc      Verify that an embedded NUL keeps its position inside a longer token.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTokenArgumentFault_020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_020 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      const payload: string = 'a\u0000b';

      expect(inputHardKeyValue(controller, payload, 9999)).assertTrue();
      expect(harness.client.insertedTexts[0]).assertEqual(payload);
      expect(harness.client.insertedTexts[0].length).assertEqual(3);
      expect(harness.client.insertedTexts[0].charCodeAt(1)).assertEqual(0);
      expect(harness.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_020 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TOKEN_ARGUMENT_FAULT_2100
     * @tc.name      testTokenArgumentFault_021
     * @tc.desc      Verify that two empty token calls remain two separate insertion entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTokenArgumentFault_021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_021 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(inputHardKeyValue(controller, '', 9999)).assertTrue();
      expect(inputHardKeyValue(controller, '', 9999)).assertTrue();
      expect(harness.client.insertedTexts.length).assertEqual(2);
      expect(harness.client.journal.join('|')).assertEqual('insert:|insert:');
      expect(harness.client.forwardLengths.length +
        harness.client.backwardLengths.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_021 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TOKEN_ARGUMENT_FAULT_2200
     * @tc.name      testTokenArgumentFault_022
     * @tc.desc      Verify that a literal with a zero companion code still inserts its glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTokenArgumentFault_022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_022 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      // Zero is a valid companion code even though it is falsy.
      expect(inputHardKeyValue(controller, 'q', 0)).assertTrue();
      expect(harness.client.insertedTexts[0]).assertEqual('q');
      expect(harness.client.journal.join('|')).assertEqual('insert:q');
      expect(harness.client.forwardLengths.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_022 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TOKEN_ARGUMENT_FAULT_2300
     * @tc.name      testTokenArgumentFault_023
     * @tc.desc      Verify that a deletion, a right move and a backward deletion keep three ordered steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTokenArgumentFault_023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_023 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(inputHardKeyValue(controller, 'KEYCODE_DEL', 2055)).assertTrue();
      expect(inputHardKeyValue(controller, 'KEYCODE_DPAD_RIGHT', 2015)).assertTrue();
      expect(inputHardKeyValue(controller, 'KEYCODE_FORWARD_DEL', 2071)).assertTrue();
      expect(harness.client.journal.join('|')).assertEqual('forward:1|move:4|back:1');
      expect(harness.client.movedDirections[0]).assertEqual(4);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.forwardLengths.length).assertEqual(1);
      expect(harness.client.backwardLengths.length).assertEqual(1);
      expect(harness.client.journal.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTokenArgumentFault_023 end');
      await yieldToEventLoop();
    });

  });
}
