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
import { ClientHarness, createClientHarness, FakeInputClient } from '../support/ClientHarness';
import { createKeyboardController, pressHardKey, releaseHardKey, isShiftHeld } from '../support/TestSupport';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputControllerHoldGraph]';

export default function ControllerHoldGraphTestTest(): void {
  describe('ControllerHoldGraphTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_HOLD_GRAPH_0100
     * @tc.name      testControllerHoldGraph_001
     * @tc.desc      Verify all six release orders of a three-key hold leave an empty stack behind.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldGraph_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const orders: number[][] = [[0, 1, 2], [0, 2, 1], [1, 0, 2], [1, 2, 0], [2, 0, 1], [2, 1, 0]];
      let p: number = 0;
      while (p < orders.length) {
        const controller: KeyboardController = createKeyboardController();
        const keys: number[] = [2017, 2018, 2019];
        for (let i = 0; i < keys.length; i++) {
          expect(pressHardKey(controller, keys[i])).assertEqual(true);
        }
        const order: number[] = orders[p];
        for (let i = 0; i < order.length; i++) {
          releaseHardKey(controller, keys[order[i]]);
        }
        expect(pressHardKey(controller, 2020)).assertEqual(true);
        releaseHardKey(controller, 2020);
        expect(isShiftHeld(controller)).assertEqual(false);
        p = p + 1;
      }
      expect(harness.client.insertedTexts.length).assertEqual(24);
      expect(harness.client.insertedTexts.join('')).assertEqual('abcdabcdabcdabcdabcdabcd');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_HOLD_GRAPH_0200
     * @tc.name      testControllerHoldGraph_002
     * @tc.desc      Verify releasing the middle of three held letters leaves the other two held.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldGraph_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      pressHardKey(controller, 2017);
      pressHardKey(controller, 2018);
      pressHardKey(controller, 2019);
      releaseHardKey(controller, 2018);
      expect(pressHardKey(controller, 2020)).assertTrue();
      expect(pressHardKey(controller, 2021)).assertTrue();
      releaseHardKey(controller, 2020);
      releaseHardKey(controller, 2021);
      releaseHardKey(controller, 2017);
      releaseHardKey(controller, 2019);
      expect(harness.client.journal.length).assertEqual(5);
      expect(harness.client.insertedTexts.join('')).assertEqual('abcde');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_HOLD_GRAPH_0300
     * @tc.name      testControllerHoldGraph_003
     * @tc.desc      Verify a duplicate down inserts again while the held stack keeps one entry.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldGraph_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();
      const repeatKey: number = 2017;
      expect(pressHardKey(controller, repeatKey)).assertTrue();
      expect(editorRef.insertedTexts.length).assertEqual(1);
      expect(pressHardKey(controller, repeatKey)).assertTrue();
      expect(editorRef.insertedTexts.join('')).assertEqual('aa');
      releaseHardKey(controller, 2017);
      expect(pressHardKey(controller, 2019)).assertTrue();
      releaseHardKey(controller, 2019);
      expect(editorRef.insertedTexts.join('')).assertEqual('aac');
      expect(editorRef.journal.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_HOLD_GRAPH_0400
     * @tc.name      testControllerHoldGraph_004
     * @tc.desc      Verify three downs of one letter insert three times and one release clears the hold.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldGraph_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      pressHardKey(controller, 2042);
      pressHardKey(controller, 2042);
      pressHardKey(controller, 2042);
      releaseHardKey(controller, 2042);
      releaseHardKey(controller, 2042);
      pressHardKey(controller, 2041);
      releaseHardKey(controller, 2041);
      expect(harness.client.journal.length).assertEqual(4);
      expect(harness.client.insertedTexts.join('')).assertEqual('zzzy');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_HOLD_GRAPH_0500
     * @tc.name      testControllerHoldGraph_005
     * @tc.desc      Verify shift in the middle or at the end of a chord never arms uppercase.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldGraph_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_005 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controllers: KeyboardController[] = [createKeyboardController(), createKeyboardController()];
      pressHardKey(controllers[0], 2017);
      pressHardKey(controllers[0], 2047);
      pressHardKey(controllers[0], 2018);
      releaseHardKey(controllers[0], 2018);
      releaseHardKey(controllers[0], 2047);
      releaseHardKey(controllers[0], 2017);
      pressHardKey(controllers[1], 2017);
      pressHardKey(controllers[1], 2018);
      pressHardKey(controllers[1], 2047);
      pressHardKey(controllers[1], 2019);
      releaseHardKey(controllers[1], 2019);
      releaseHardKey(controllers[1], 2047);
      releaseHardKey(controllers[1], 2018);
      releaseHardKey(controllers[1], 2017);
      expect(harness.client.insertedTexts.join('')).assertEqual('ababc');
      expect(harness.client.insertedTexts.length).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_HOLD_GRAPH_0600
     * @tc.name      testControllerHoldGraph_006
     * @tc.desc      Verify shifting down behind two held letters still leaves the next letter lowercase.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldGraph_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      pressHardKey(controller, 2017);
      pressHardKey(controller, 2018);
      pressHardKey(controller, 2047);
      expect(pressHardKey(controller, 2019)).assertTrue();
      releaseHardKey(controller, 2019);
      releaseHardKey(controller, 2047);
      releaseHardKey(controller, 2018);
      releaseHardKey(controller, 2017);
      expect(isShiftHeld(controller)).assertFalse();
      expect(harness.client.insertedTexts.join('')).assertEqual('abc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_HOLD_GRAPH_0700
     * @tc.name      testControllerHoldGraph_007
     * @tc.desc      Verify releasing shift before the second letter keeps the first uppercase only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldGraph_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_007 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();
      const pressRun1: number[] = [2047, 2017];
      for (const pressCode of pressRun1) {
        pressHardKey(controller, pressCode);
      }
      releaseHardKey(controller, 2047);
      pressHardKey(controller, 2018);
      const releaseRun0: number[] = [2018, 2017];
      let relIdx0: number = 0;
      while (relIdx0 < releaseRun0.length) {
        releaseHardKey(controller, releaseRun0[relIdx0]);
        relIdx0 = relIdx0 + 1;
      }
      expect(editorRef.insertedTexts[0]).assertEqual('A');
      expect(editorRef.insertedTexts[1]).assertEqual('b');
      expect(editorRef.insertedTexts.join('')).assertEqual('Ab');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_HOLD_GRAPH_0800
     * @tc.name      testControllerHoldGraph_008
     * @tc.desc      Verify a shift tap between two held letters leaves the third letter lowercase.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldGraph_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_008 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      pressHardKey(controller, 2017);
      pressHardKey(controller, 2047);
      releaseHardKey(controller, 2047);
      pressHardKey(controller, 2018);
      releaseHardKey(controller, 2018);
      releaseHardKey(controller, 2017);
      expect(harness.client.keyFunctions.length).assertEqual(0);
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_HOLD_GRAPH_0900
     * @tc.name      testControllerHoldGraph_009
     * @tc.desc      Verify two held shifts block letters until both releases and then reset cleanly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldGraph_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_009 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      const pressRun3: number[] = [2047, 2048];
      for (const pressCode of pressRun3) {
        pressHardKey(controller, pressCode);
      }
      expect(pressHardKey(controller, 2017)).assertFalse();
      const releaseRun0: number[] = [2017, 2047];
      let relIdx0: number = 0;
      while (relIdx0 < releaseRun0.length) {
        releaseHardKey(controller, releaseRun0[relIdx0]);
        relIdx0 = relIdx0 + 1;
      }
      expect(pressHardKey(controller, 2018)).assertFalse();
      const releaseRun1: number[] = [2018, 2048];
      let relIdx1: number = 0;
      while (relIdx1 < releaseRun1.length) {
        releaseHardKey(controller, releaseRun1[relIdx1]);
        relIdx1 = relIdx1 + 1;
      }
      expect(harness.client.journal.length).assertEqual(0);
      pressHardKey(controller, 2017);
      releaseHardKey(controller, 2017);
      const pressRun4: number[] = [2047, 2018];
      for (const pressCode of pressRun4) {
        pressHardKey(controller, pressCode);
      }
      const releaseRun2: number[] = [2018, 2047];
      let relIdx2: number = 0;
      while (relIdx2 < releaseRun2.length) {
        releaseHardKey(controller, releaseRun2[relIdx2]);
        relIdx2 = relIdx2 + 1;
      }
      expect(harness.client.insertedTexts.join('')).assertEqual('aB');
      expect(isShiftHeld(controller)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_HOLD_GRAPH_1000
     * @tc.name      testControllerHoldGraph_010
     * @tc.desc      Verify two consecutive shift hold cycles each uppercase exactly one letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldGraph_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_010 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      const letters: number[] = [2017, 2026];
      for (let i = 0; i < letters.length; i++) {
        expect(pressHardKey(controller, 2047)).assertEqual(false);
        expect(pressHardKey(controller, letters[i])).assertEqual(true);
        releaseHardKey(controller, letters[i]);
        releaseHardKey(controller, 2047);
        expect(isShiftHeld(controller)).assertEqual(false);
      }
      expect(harness.client.insertedTexts.join('')).assertEqual('AJ');
      expect(harness.client.insertedTexts.length).assertEqual(2);
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_HOLD_GRAPH_1100
     * @tc.name      testControllerHoldGraph_011
     * @tc.desc      Verify an unknown key ahead of a chord blocks every letter until the stack empties.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldGraph_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_011 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();
      expect(pressHardKey(controller, 9999)).assertFalse();
      pressHardKey(controller, 2047);
      expect(pressHardKey(controller, 2017)).assertFalse();
      const releaseRun0: number[] = [2017, 2047];
      let relIdx0: number = 0;
      while (relIdx0 < releaseRun0.length) {
        releaseHardKey(controller, releaseRun0[relIdx0]);
        relIdx0 = relIdx0 + 1;
      }
      expect(editorRef.journal.length).assertEqual(0);
      releaseHardKey(controller, 9999);
      expect(pressHardKey(controller, 2018)).assertTrue();
      releaseHardKey(controller, 2018);
      expect(editorRef.insertedTexts.join('')).assertEqual('b');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_HOLD_GRAPH_1200
     * @tc.name      testControllerHoldGraph_012
     * @tc.desc      Verify releasing an unknown key before a held letter still delays the latch recovery.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldGraph_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_012 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      const journalSizes: number[] = [];
      pressHardKey(controller, 9998);
      pressHardKey(controller, 2020);
      journalSizes.push(harness.client.journal.length);
      releaseHardKey(controller, 9998);
      journalSizes.push(harness.client.journal.length);
      releaseHardKey(controller, 2020);
      expect(pressHardKey(controller, 2021)).assertTrue();
      releaseHardKey(controller, 2021);
      journalSizes.push(harness.client.journal.length);
      expect(journalSizes.join('|')).assertEqual('0|0|1');
      expect(harness.client.insertedTexts.join('')).assertEqual('e');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_HOLD_GRAPH_1300
     * @tc.name      testControllerHoldGraph_013
     * @tc.desc      Verify a delete key pressed while a letter is held still reaches the editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldGraph_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_013 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      pressHardKey(controller, 2017);
      expect(pressHardKey(controller, 2055)).assertEqual(true);
      expect(pressHardKey(controller, 2071)).assertEqual(true);
      const releaseRun0: number[] = [2071, 2055, 2017];
      let relIdx0: number = 0;
      while (relIdx0 < releaseRun0.length) {
        releaseHardKey(controller, releaseRun0[relIdx0]);
        relIdx0 = relIdx0 + 1;
      }
      expect(harness.client.journal.join('|')).assertEqual('insert:a|forward:1|back:1');
      expect(harness.client.forwardLengths[0]).assertEqual(1);
      expect(harness.client.backwardLengths[0]).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_HOLD_GRAPH_1400
     * @tc.name      testControllerHoldGraph_014
     * @tc.desc      Verify releasing the first of three letters lets shift at the second slot arm a later key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldGraph_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_014 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      pressHardKey(controller, 2017);
      pressHardKey(controller, 2047);
      pressHardKey(controller, 2018);
      releaseHardKey(controller, 2017);
      expect(pressHardKey(controller, 2019)).assertTrue();
      releaseHardKey(controller, 2019);
      releaseHardKey(controller, 2018);
      releaseHardKey(controller, 2047);
      expect(harness.client.insertedTexts[2]).assertEqual('C');
      expect(harness.client.insertedTexts.join('')).assertEqual('abC');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_HOLD_GRAPH_1500
     * @tc.name      testControllerHoldGraph_015
     * @tc.desc      Verify draining the stack after a letter-shift-letter chord restores lowercase.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldGraph_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_015 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();
      const pressRun1: number[] = [2017, 2018, 2047];
      for (const pressCode of pressRun1) {
        pressHardKey(controller, pressCode);
      }
      const releaseRun0: number[] = [2018, 2017, 2047];
      let relIdx0: number = 0;
      while (relIdx0 < releaseRun0.length) {
        releaseHardKey(controller, releaseRun0[relIdx0]);
        relIdx0 = relIdx0 + 1;
      }
      expect(isShiftHeld(controller)).assertFalse();
      expect(pressHardKey(controller, 2019)).assertTrue();
      releaseHardKey(controller, 2019);
      expect(editorRef.insertedTexts.join('')).assertEqual('abc');
      expect(editorRef.journal.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_HOLD_GRAPH_1600
     * @tc.name      testControllerHoldGraph_016
     * @tc.desc      Verify an up event without a down emits nothing for letters, shift and unknown codes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldGraph_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_016 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      const codes: number[] = [2017, 2047, 9997];
      for (let i = 0; i < codes.length; i++) {
        expect(releaseHardKey(controller, codes[i])).assertEqual(false);
      }
      expect(harness.client.journal.length).assertEqual(0);
      expect(pressHardKey(controller, 2018)).assertEqual(true);
      releaseHardKey(controller, 2018);
      expect(harness.client.insertedTexts.join('')).assertEqual('b');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_HOLD_GRAPH_1700
     * @tc.name      testControllerHoldGraph_017
     * @tc.desc      Verify a duplicate shift down keeps one held shift and a single up clears it.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldGraph_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_017 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      expect(pressHardKey(controller, 2047)).assertFalse();
      expect(isShiftHeld(controller)).assertTrue();
      expect(pressHardKey(controller, 2047)).assertFalse();
      expect(isShiftHeld(controller)).assertTrue();
      expect(pressHardKey(controller, 2017)).assertTrue();
      releaseHardKey(controller, 2017);
      expect(isShiftHeld(controller)).assertTrue();
      releaseHardKey(controller, 2047);
      expect(isShiftHeld(controller)).assertFalse();
      pressHardKey(controller, 2018);
      releaseHardKey(controller, 2018);
      expect(harness.client.insertedTexts.join('')).assertEqual('Ab');
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_HOLD_GRAPH_1800
     * @tc.name      testControllerHoldGraph_018
     * @tc.desc      Verify a three-letter hold keeps digit keys working as plain glyphs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldGraph_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_018 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      pressHardKey(controller, 2017);
      pressHardKey(controller, 2018);
      pressHardKey(controller, 2019);
      expect(pressHardKey(controller, 2007)).assertTrue();
      releaseHardKey(controller, 2007);
      releaseHardKey(controller, 2019);
      releaseHardKey(controller, 2018);
      releaseHardKey(controller, 2017);
      expect(harness.client.insertedTexts[3]).assertEqual('7');
      expect(harness.client.insertedTexts.join('')).assertEqual('abc7');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldGraph_018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HOLD_EXTRA_0100
     * @tc.name      testControllerHoldExtra_001
     * @tc.desc      Verify one shift hold capitalizes four consecutive letters before and after release.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldExtra_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();
      pressHardKey(controller, 2047);
      let i: number = 0;
      while (i < 4) {
        pressHardKey(controller, 2017 + i);
        releaseHardKey(controller, 2017 + i);
        i = i + 1;
      }
      releaseHardKey(controller, 2047);
      let iW1: number = 0;
      while (iW1 < 4) {
        pressHardKey(controller, 2021 + iW1);
        releaseHardKey(controller, 2021 + iW1);
        iW1 = iW1 + 1;
      }
      expect(editorRef.insertedTexts.join('')).assertEqual('ABCDefgh');
      expect(editorRef.insertedTexts.length).assertEqual(8);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HOLD_EXTRA_0200
     * @tc.name      testControllerHoldExtra_002
     * @tc.desc      Verify a controller key stack survives an input-handler stop between sessions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldExtra_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_002 begin');
      handlerRef.onInputStop();
      const controller: KeyboardController = createKeyboardController();
      pressHardKey(controller, 2047);
      handlerRef.onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      pressHardKey(controller, 2017);
      releaseHardKey(controller, 2017);
      releaseHardKey(controller, 2047);
      expect(isShiftHeld(controller)).assertFalse();
      expect(harness.client.insertedTexts.join('')).assertEqual('A');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HOLD_EXTRA_0300
     * @tc.name      testControllerHoldExtra_003
     * @tc.desc      Verify releasing a held letter after a stop leaves the shift latch usable in the new session.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldExtra_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_003 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      const pressRun1: number[] = [2047, 2017];
      for (const pressCode of pressRun1) {
        pressHardKey(controller, pressCode);
      }
      expect(first.client.insertedTexts.join('')).assertEqual('A');
      InputHandler.getInstance().onInputStop();
      releaseHardKey(controller, 2017);
      const second: ClientHarness = await createClientHarness(0);
      pressHardKey(controller, 2018);
      const releaseRun0: number[] = [2018, 2047];
      let relIdx0: number = 0;
      while (relIdx0 < releaseRun0.length) {
        releaseHardKey(controller, releaseRun0[relIdx0]);
        relIdx0 = relIdx0 + 1;
      }
      expect(second.client.insertedTexts.join('')).assertEqual('B');
      expect(first.client.insertedTexts.length + second.client.insertedTexts.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HOLD_EXTRA_0400
     * @tc.name      testControllerHoldExtra_004
     * @tc.desc      Verify two controllers holding shift at once both produce uppercase glyphs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldExtra_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const left: KeyboardController = createKeyboardController();
      const right: KeyboardController = createKeyboardController();
      pressHardKey(left, 2047);
      pressHardKey(right, 2048);
      pressHardKey(left, 2017);
      pressHardKey(right, 2018);
      releaseHardKey(right, 2018);
      releaseHardKey(left, 2017);
      releaseHardKey(right, 2048);
      releaseHardKey(left, 2047);
      expect(harness.client.insertedTexts.join('')).assertEqual('AB');
      expect(isShiftHeld(left)).assertEqual(false);
      expect(isShiftHeld(right)).assertEqual(false);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HOLD_EXTRA_0500
     * @tc.name      testControllerHoldExtra_005
     * @tc.desc      Verify a letter held on one controller does not block typing on another controller.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldExtra_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_005 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const holder: KeyboardController = createKeyboardController();
      const typist: KeyboardController = createKeyboardController();
      pressHardKey(holder, 2017);
      pressHardKey(typist, 2018);
      releaseHardKey(typist, 2018);
      pressHardKey(typist, 2019);
      releaseHardKey(typist, 2019);
      releaseHardKey(holder, 2017);
      expect(editorRef.insertedTexts.join('')).assertEqual('abc');
      expect(editorRef.journal.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HOLD_EXTRA_0600
     * @tc.name      testControllerHoldExtra_006
     * @tc.desc      Verify an unknown key while a shift-letter chord is held blocks later letters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldExtra_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      pressHardKey(controller, 2047);
      pressHardKey(controller, 2017);
      releaseHardKey(controller, 2017);
      pressHardKey(controller, 9040);
      expect(pressHardKey(controller, 2018)).assertFalse();
      releaseHardKey(controller, 2018);
      releaseHardKey(controller, 9040);
      releaseHardKey(controller, 2047);
      expect(harness.client.insertedTexts.join('')).assertEqual('A');
      pressHardKey(controller, 2019);
      releaseHardKey(controller, 2019);
      expect(harness.client.journal.length).assertEqual(2);
      expect(harness.client.insertedTexts.join('')).assertEqual('Ac');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HOLD_EXTRA_0700
     * @tc.name      testControllerHoldExtra_007
     * @tc.desc      Verify a second shift pressed during a chord arms the latch only until all keys lift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldExtra_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_007 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      const pressRun1: number[] = [2047, 2017];
      for (const pressCode of pressRun1) {
        pressHardKey(controller, pressCode);
      }
      releaseHardKey(controller, 2017);
      pressHardKey(controller, 2048);
      expect(pressHardKey(controller, 2018)).assertEqual(false);
      releaseHardKey(controller, 2018);
      expect(pressHardKey(controller, 2019)).assertEqual(false);
      const releaseRun0: number[] = [2019, 2048, 2047];
      let relIdx0: number = 0;
      while (relIdx0 < releaseRun0.length) {
        releaseHardKey(controller, releaseRun0[relIdx0]);
        relIdx0 = relIdx0 + 1;
      }
      expect(harness.client.insertedTexts.join('')).assertEqual('A');
      pressHardKey(controller, 2020);
      releaseHardKey(controller, 2020);
      expect(harness.client.insertedTexts.join('')).assertEqual('Ad');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HOLD_EXTRA_0800
     * @tc.name      testControllerHoldExtra_008
     * @tc.desc      Verify arrow keys are blocked by a shift-letter chord and work after the chord releases.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldExtra_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_008 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      pressHardKey(controller, 2047);
      pressHardKey(controller, 2017);
      releaseHardKey(controller, 2017);
      expect(pressHardKey(controller, 2015)).assertFalse();
      releaseHardKey(controller, 2015);
      releaseHardKey(controller, 2047);
      expect(harness.client.movedDirections.length).assertEqual(0);
      pressHardKey(controller, 2014);
      releaseHardKey(controller, 2014);
      expect(harness.client.insertedTexts.join('')).assertEqual('A');
      expect(harness.client.movedDirections.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HOLD_EXTRA_0900
     * @tc.name      testControllerHoldExtra_009
     * @tc.desc      Verify an alt hold does not change the case of a letter or block a digit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldExtra_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_009 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();
      expect(pressHardKey(controller, 2045)).assertFalse();
      pressHardKey(controller, 2017);
      releaseHardKey(controller, 2017);
      pressHardKey(controller, 2005);
      const releaseRun0: number[] = [2005, 2045];
      let relIdx0: number = 0;
      while (relIdx0 < releaseRun0.length) {
        releaseHardKey(controller, releaseRun0[relIdx0]);
        relIdx0 = relIdx0 + 1;
      }
      expect(isShiftHeld(controller)).assertFalse();
      expect(editorRef.insertedTexts.join('')).assertEqual('a5');
      expect(editorRef.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HOLD_EXTRA_1000
     * @tc.name      testControllerHoldExtra_010
     * @tc.desc      Verify the right shift capitalizes exactly like the left shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldExtra_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_010 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const left: KeyboardController = createKeyboardController();
      const right: KeyboardController = createKeyboardController();
      pressHardKey(left, 2047);
      pressHardKey(left, 2042);
      releaseHardKey(left, 2042);
      releaseHardKey(left, 2047);
      pressHardKey(right, 2048);
      pressHardKey(right, 2042);
      releaseHardKey(right, 2042);
      releaseHardKey(right, 2048);
      expect(harness.client.insertedTexts[0]).assertEqual(harness.client.insertedTexts[1]);
      expect(harness.client.insertedTexts.join('')).assertEqual('ZZ');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HOLD_EXTRA_1100
     * @tc.name      testControllerHoldExtra_011
     * @tc.desc      Verify two shift downs on one letter produce two uppercase insertions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldExtra_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_011 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      const pressRun1: number[] = [2047, 2017, 2017];
      for (const pressCode of pressRun1) {
        pressHardKey(controller, pressCode);
      }
      const releaseRun0: number[] = [2017, 2047];
      let relIdx0: number = 0;
      while (relIdx0 < releaseRun0.length) {
        releaseHardKey(controller, releaseRun0[relIdx0]);
        relIdx0 = relIdx0 + 1;
      }
      expect(harness.client.insertedTexts.length).assertEqual(2);
      expect(harness.client.journal.length).assertEqual(2);
      expect(harness.client.insertedTexts.join('')).assertEqual('AA');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HOLD_EXTRA_1200
     * @tc.name      testControllerHoldExtra_012
     * @tc.desc      Verify shift pressed behind three held letters leaves the next letter lowercase.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldExtra_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_012 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      pressHardKey(controller, 2017);
      pressHardKey(controller, 2018);
      pressHardKey(controller, 2019);
      pressHardKey(controller, 2047);
      pressHardKey(controller, 2020);
      releaseHardKey(controller, 2020);
      releaseHardKey(controller, 2047);
      releaseHardKey(controller, 2019);
      releaseHardKey(controller, 2018);
      releaseHardKey(controller, 2017);
      expect(harness.client.insertedTexts[3]).assertEqual('d');
      expect(harness.client.insertedTexts.join('')).assertEqual('abcd');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HOLD_EXTRA_1300
     * @tc.name      testControllerHoldExtra_013
     * @tc.desc      Verify deleting while shift and a letter are held produces no deletion commands.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldExtra_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_013 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();
      const pressRun1: number[] = [2047, 2017];
      for (const pressCode of pressRun1) {
        pressHardKey(controller, pressCode);
      }
      releaseHardKey(controller, 2017);
      pressHardKey(controller, 2055);
      releaseHardKey(controller, 2055);
      pressHardKey(controller, 2071);
      const releaseRun0: number[] = [2071, 2047];
      let relIdx0: number = 0;
      while (relIdx0 < releaseRun0.length) {
        releaseHardKey(controller, releaseRun0[relIdx0]);
        relIdx0 = relIdx0 + 1;
      }
      expect(editorRef.forwardLengths.length).assertEqual(0);
      expect(editorRef.backwardLengths.length).assertEqual(0);
      expect(editorRef.journal.length).assertEqual(1);
      pressHardKey(controller, 2055);
      releaseHardKey(controller, 2055);
      expect(editorRef.forwardLengths.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HOLD_EXTRA_1400
     * @tc.name      testControllerHoldExtra_014
     * @tc.desc      Verify a double shift release while a letter is held still leaves lowercase typing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldExtra_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_014 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      pressHardKey(controller, 2047);
      pressHardKey(controller, 2018);
      releaseHardKey(controller, 2047);
      releaseHardKey(controller, 2047);
      pressHardKey(controller, 2019);
      releaseHardKey(controller, 2019);
      releaseHardKey(controller, 2018);
      expect(harness.client.insertedTexts.length).assertEqual(2);
      expect(isShiftHeld(controller)).assertFalse();
      expect(harness.client.insertedTexts.join('')).assertEqual('Bc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HOLD_EXTRA_1500
     * @tc.name      testControllerHoldExtra_015
     * @tc.desc      Verify a shift added behind two letters stays ineffective for the next glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldExtra_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_015 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      const pressRun1: number[] = [2017, 2018];
      for (const pressCode of pressRun1) {
        pressHardKey(controller, pressCode);
      }
      releaseHardKey(controller, 2018);
      const pressRun2: number[] = [2047, 2019];
      for (const pressCode of pressRun2) {
        pressHardKey(controller, pressCode);
      }
      const releaseRun0: number[] = [2019, 2047, 2017];
      let relIdx0: number = 0;
      while (relIdx0 < releaseRun0.length) {
        releaseHardKey(controller, releaseRun0[relIdx0]);
        relIdx0 = relIdx0 + 1;
      }
      expect(harness.client.insertedTexts.join('')).assertEqual('abc');
      expect(harness.client.journal.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HOLD_EXTRA_1600
     * @tc.name      testControllerHoldExtra_016
     * @tc.desc      Verify a blocked shift-digit latch on one controller leaves another controller free.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldExtra_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_016 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const blocked: KeyboardController = createKeyboardController();
      const free: KeyboardController = createKeyboardController();
      pressHardKey(blocked, 2047);
      pressHardKey(blocked, 2001);
      releaseHardKey(blocked, 2001);
      pressHardKey(free, 2017);
      releaseHardKey(free, 2017);
      releaseHardKey(blocked, 2047);
      expect(harness.client.journal.length).assertEqual(1);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HOLD_EXTRA_1700
     * @tc.name      testControllerHoldExtra_017
     * @tc.desc      Verify two held letters with shift between them keep the first two lowercase.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldExtra_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_017 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();
      const pressRun2: number[] = [2017, 2047, 2018];
      for (const pressCode of pressRun2) {
        pressHardKey(controller, pressCode);
      }
      const releaseRun0: number[] = [2018, 2047];
      let relIdx0: number = 0;
      while (relIdx0 < releaseRun0.length) {
        releaseHardKey(controller, releaseRun0[relIdx0]);
        relIdx0 = relIdx0 + 1;
      }
      pressHardKey(controller, 2019);
      const releaseRun1: number[] = [2019, 2017];
      let relIdx1: number = 0;
      while (relIdx1 < releaseRun1.length) {
        releaseHardKey(controller, releaseRun1[relIdx1]);
        relIdx1 = relIdx1 + 1;
      }
      expect(editorRef.insertedTexts.join('')).assertEqual('abc');
      expect(editorRef.insertedTexts[2]).assertEqual('c');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HOLD_EXTRA_1800
     * @tc.name      testControllerHoldExtra_018
     * @tc.desc      Verify a key-up for a letter that was never pressed after a full chord changes nothing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerHoldExtra_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_018 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      pressHardKey(controller, 2017);
      pressHardKey(controller, 2018);
      releaseHardKey(controller, 2017);
      releaseHardKey(controller, 2018);
      const before: number = harness.client.journal.length;
      expect(releaseHardKey(controller, 2030)).assertFalse();
      expect(releaseHardKey(controller, 2047)).assertFalse();
      expect(harness.client.journal.length).assertEqual(before);
      pressHardKey(controller, 2019);
      releaseHardKey(controller, 2019);
      expect(harness.client.insertedTexts.join('')).assertEqual('abc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerHoldExtra_018 end');
      await yieldToEventLoop();
    });

  });
}
