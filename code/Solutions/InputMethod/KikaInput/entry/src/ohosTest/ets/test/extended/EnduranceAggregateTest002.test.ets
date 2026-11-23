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
import inputMethodEngine from '@ohos.inputMethodEngine';
import { yieldToEventLoop } from '../support/AsyncSupport';
import { InputHandler, KeyboardController } from '../../../../main/ets/model/KeyboardController';
import { ClientHarness, createClientHarness, FakeInputClient } from '../support/ClientHarness';
import { createKeyboardController, pressHardKey, releaseHardKey } from '../support/TestSupport';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputEnduranceAggregate]';

export default function EnduranceAggregateTest002Test(): void {
  describe('EnduranceAggregateTest002', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_EXTRA_1500
     * @tc.name      testEnduranceExtra_015
     * @tc.desc      Verify fifty surrogate-pair inserts keep a total of one hundred code units.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceExtra_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_015 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      let i: number = 0;
      while (i < 50) {
        InputHandler.getInstance().insertText('😀');
        i = i + 1;
      }
      let units: number = 0;
      let iW1: number = 0;
      while (iW1 < editorRef.insertedTexts.length) {
        units = units + editorRef.insertedTexts[iW1].length;
        iW1 = iW1 + 1;
      }
      expect(units).assertEqual(100);
      expect(editorRef.insertedTexts.length).assertEqual(50);
      expect(editorRef.insertedTexts[49].charCodeAt(0)).assertEqual(55357);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_EXTRA_1600
     * @tc.name      testEnduranceExtra_016
     * @tc.desc      Verify one hundred deletions with cycled lengths accumulate three hundred units.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceExtra_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_016 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      let sum: number = 0;
      for (let i = 0; i < 100; i++) {
        const length: number = i % 5 + 1;
        handlerRef.deleteBackward(length);
        sum = sum + length;
      }
      expect(harness.client.backwardLengths.length).assertEqual(100);
      expect(harness.client.backwardLengths.slice(0, 6).join('|')).assertEqual('1|2|3|4|5|1');
      expect(sum).assertEqual(300);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_EXTRA_1700
     * @tc.name      testEnduranceExtra_017
     * @tc.desc      Verify sixty copy-paste cycles split thirty actions to each kind.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceExtra_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_017 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      let i: number = 0;
      while (i < 60) {
        const action: number = i % 2 === 0 ? inputMethodEngine.ExtendAction.COPY :
            inputMethodEngine.ExtendAction.PASTE;
        InputHandler.getInstance().sendExtendAction(action);
        i = i + 1;
      }
      let copies: number = 0;
      let pastes: number = 0;
      let iW1: number = 0;
      while (iW1 < harness.client.extendActions.length) {
        if (harness.client.extendActions[iW1] === inputMethodEngine.ExtendAction.COPY) {
          copies = copies + 1;
          } else {
          pastes = pastes + 1;
        }
        iW1 = iW1 + 1;
      }
      expect(harness.client.journal.length).assertEqual(60);
      expect(copies).assertEqual(30);
      expect(pastes).assertEqual(30);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_EXTRA_1800
     * @tc.name      testEnduranceExtra_018
     * @tc.desc      Verify eighty space taps build a blank-only text whose trim is empty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceExtra_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_018 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      for (let i = 0; i < 80; i++) {
        pressHardKey(controller, 2050);
        releaseHardKey(controller, 2050);
      }
      const text: string = harness.client.insertedTexts.join('');
      expect(text.trim().length).assertEqual(0);
      expect(harness.client.insertedTexts.length).assertEqual(80);
      expect(harness.client.journal.length).assertEqual(80);
      expect(text.length).assertEqual(80);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_EXTRA_1900
     * @tc.name      testEnduranceExtra_019
     * @tc.desc      Verify a hundred alternating inserts and moves keep the journal at even indices.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceExtra_019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_019 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      let i: number = 0;
      while (i < 100) {
        if (i % 2 === 0) {
          handlerRef.insertText('m' + i);
          } else {
          handlerRef.moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);
        }
        i = i + 1;
      }
      expect(editorRef.journal[99].indexOf('move:')).assertEqual(0);
      expect(editorRef.movedDirections.length).assertEqual(50);
      expect(editorRef.insertedTexts.length).assertEqual(50);
      expect(editorRef.journal[0]).assertEqual('insert:m0');
      expect(editorRef.journal[1].indexOf('move:')).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_019 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_EXTRA_2000
     * @tc.name      testEnduranceExtra_020
     * @tc.desc      Verify fifty shift-digit chords stay blocked and recover after each release.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceExtra_020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_020 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      for (let i = 0; i < 50; i++) {
        pressHardKey(controller, 2047);
        pressHardKey(controller, 2001);
        releaseHardKey(controller, 2001);
        releaseHardKey(controller, 2047);
      }
      expect(harness.client.journal.length).assertEqual(0);
      pressHardKey(controller, 2017);
      releaseHardKey(controller, 2017);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_020 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_EXTRA_2100
     * @tc.name      testEnduranceExtra_021
     * @tc.desc      Verify a reverse traversal of the alphabet rebuilds the descending letter string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceExtra_021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_021 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      let i: number = 0;
      while (i < 26) {
        const code: number = 2042 - i;
        pressHardKey(controller, code);
        releaseHardKey(controller, code);
        i = i + 1;
      }
      expect(harness.client.insertedTexts.join('')).assertEqual('zyxwvutsrqponmlkjihgfedcba');
      expect(harness.client.insertedTexts[0]).assertEqual('z');
      expect(harness.client.insertedTexts[25]).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_021 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_EXTRA_2200
     * @tc.name      testEnduranceExtra_022
     * @tc.desc      Verify forty inserts followed by forty forward deletes keep the journal split.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceExtra_022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_022 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      for (let i = 0; i < 40; i++) {
        handlerRef.insertText('t');
      }
      for (let i = 0; i < 40; i++) {
        handlerRef.deleteForward(3);
      }
      expect(harness.client.journal[39]).assertEqual('insert:t');
      expect(harness.client.journal[40]).assertEqual('forward:3');
      expect(harness.client.journal.length).assertEqual(80);
      expect(harness.client.insertedTexts.length).assertEqual(40);
      expect(harness.client.forwardLengths.length).assertEqual(40);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_022 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_EXTRA_2300
     * @tc.name      testEnduranceExtra_023
     * @tc.desc      Verify three hundred digit taps split exactly thirty hits per decimal glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceExtra_023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_023 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();
      let i: number = 0;
      while (i < 300) {
        const code: number = 2000 + (i % 10);
        pressHardKey(controller, code);
        releaseHardKey(controller, code);
        i = i + 1;
      }
      const counts: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
      let iW1: number = 0;
      while (iW1 < editorRef.insertedTexts.length) {
        const digit: number = Number(editorRef.insertedTexts[iW1]);
        counts[digit] = counts[digit] + 1;
        iW1 = iW1 + 1;
      }
      expect(counts.join('|')).assertEqual('30|30|30|30|30|30|30|30|30|30');
      expect(editorRef.journal.length).assertEqual(300);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_023 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_EXTRA_2400
     * @tc.name      testEnduranceExtra_024
     * @tc.desc      Verify one hundred empty insertions keep their multiplicity and zero text length.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceExtra_024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_024 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      for (let i = 0; i < 100; i++) {
        InputHandler.getInstance().insertText('');
      }
      expect(harness.client.journal[99]).assertEqual('insert:');
      expect(harness.client.insertedTexts.length).assertEqual(100);
      expect(harness.client.insertedTexts.join('').length).assertEqual(0);
      expect(harness.client.journal.length).assertEqual(100);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_024 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_LONG_0100
     * @tc.name      testEnduranceLong_001
     * @tc.desc      Verify five hundred taps of one letter keep a one-to-one journal ratio.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceLong_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      const seen: number[] = [];
      let taps: number = 0;
      while (taps < 500) {
        pressHardKey(controller, 2017);
        releaseHardKey(controller, 2017);
        seen.push(harness.client.journal.length);
        taps = taps + 1;
      }
      expect(seen[0]).assertEqual(1);
      expect(seen[499]).assertEqual(500);
      expect(seen.length).assertEqual(500);
      let running: number = 0;
      let i: number = 0;
      while (i < seen.length) {
        running = running + seen[i];
        i = i + 1;
      }
      expect(running).assertEqual(125250);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_LONG_0200
     * @tc.name      testEnduranceLong_002
     * @tc.desc      Verify two hundred shift toggles split one hundred each between cases.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceLong_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      for (let i = 0; i < 200; i++) {
        const shifted: boolean = i % 2 === 0;
        if (shifted) {
          pressHardKey(controller, 2047);
        }
        pressHardKey(controller, 2030);
        releaseHardKey(controller, 2030);
        if (shifted) {
          releaseHardKey(controller, 2047);
        }
      }
      let upper: number = 0;
      for (let i = 0; i < harness.client.insertedTexts.length; i++) {
        if (harness.client.insertedTexts[i] === 'N') {
          upper = upper + 1;
        }
      }
      expect(harness.client.insertedTexts[199]).assertEqual('n');
      expect(upper).assertEqual(100);
      expect(harness.client.insertedTexts.length).assertEqual(200);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_LONG_0300
     * @tc.name      testEnduranceLong_003
     * @tc.desc      Verify one hundred fifty numbered payloads total the triangular character sum.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceLong_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      let units: number = 0;
      for (let i = 1; i <= 150; i++) {
        const payload: string = 'p' + i;
        InputHandler.getInstance().insertText(payload);
        units = units + payload.length;
      }
      expect(editorRef.insertedTexts.length).assertEqual(150);
      expect(editorRef.insertedTexts[149]).assertEqual('p150');
      expect(units).assertEqual(150 + 9 * 1 + 90 * 2 + 51 * 3);
      let measured: number = 0;
      let i: number = 0;
      while (i < editorRef.insertedTexts.length) {
        measured = measured + editorRef.insertedTexts[i].length;
        i = i + 1;
      }
      expect(measured).assertEqual(units);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_LONG_0400
     * @tc.name      testEnduranceLong_004
     * @tc.desc      Verify one hundred enter-insert pairs stay strictly separated in the journal.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceLong_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_004 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = new ClientHarness(2, 0);
      await Promise.resolve();
      await Promise.resolve();
      for (let i = 0; i < 100; i++) {
        handlerRef.sendKeyFunction();
        handlerRef.insertText('e' + i);
      }
      let patternOk: boolean = true;
      for (let i = 0; i < harness.client.journal.length; i += 2) {
        if (harness.client.journal[i].indexOf('enter:') !== 0 ||
          harness.client.journal[i + 1].indexOf('insert:') !== 0) {
          patternOk = false;
        }
      }
      expect(harness.client.journal.length).assertEqual(200);
      expect(harness.client.keyFunctions.length).assertEqual(100);
      expect(patternOk).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_LONG_0500
     * @tc.name      testEnduranceLong_005
     * @tc.desc      Verify sixty insert-two delete-two cycles keep two hundred forty commands balanced.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceLong_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_005 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      let cycle: number = 0;
      while (cycle < 60) {
        InputHandler.getInstance().insertText('x');
        InputHandler.getInstance().insertText('y');
        InputHandler.getInstance().deleteBackward(1);
        InputHandler.getInstance().deleteForward(2);
        cycle = cycle + 1;
      }
      expect(harness.client.insertedTexts.length).assertEqual(120);
      expect(harness.client.backwardLengths.length).assertEqual(60);
      expect(harness.client.forwardLengths.length).assertEqual(60);
      expect(harness.client.journal.length).assertEqual(240);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_LONG_0600
     * @tc.name      testEnduranceLong_006
     * @tc.desc      Verify ninety moves plus thirty inserts split their journal at the expected boundary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceLong_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const directions: number[] = [inputMethodEngine.Direction.CURSOR_UP, inputMethodEngine.Direction.CURSOR_DOWN,
        inputMethodEngine.Direction.CURSOR_LEFT, inputMethodEngine.Direction.CURSOR_RIGHT];
      for (let i = 0; i < 90; i++) {
        InputHandler.getInstance().moveCursor(directions[i % 4]);
      }
      for (let i = 0; i < 30; i++) {
        InputHandler.getInstance().insertText('z');
      }
      expect(harness.client.journal[89].indexOf('move:') === 0).assertEqual(true);
      expect(harness.client.journal[90].indexOf('insert:') === 0).assertEqual(true);
      expect(harness.client.movedDirections.length).assertEqual(90);
      expect(harness.client.journal.length).assertEqual(120);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_LONG_0700
     * @tc.name      testEnduranceLong_007
     * @tc.desc      Verify four punctuation keys cycled one hundred twenty times split evenly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceLong_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_007 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();
      const codes: number[] = [2058, 2064, 2065, 2066];
      let i: number = 0;
      while (i < 120) {
        const code: number = codes[i % codes.length];
        pressHardKey(controller, code);
        releaseHardKey(controller, code);
        i = i + 1;
      }
      const counts: Map<string, number> = new Map<string, number>();
      let iW1: number = 0;
      while (iW1 < editorRef.insertedTexts.length) {
        const glyph: string = editorRef.insertedTexts[iW1];
        counts.set(glyph, (counts.get(glyph) ?? 0) + 1);
        iW1 = iW1 + 1;
      }
      expect(counts.get('+')).assertEqual(30);
      expect(editorRef.insertedTexts.join('').length).assertEqual(120);
      expect(counts.size).assertEqual(4);
      expect(counts.get('=')).assertEqual(30);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_LONG_0800
     * @tc.name      testEnduranceLong_008
     * @tc.desc      Verify eighty space-letter pairs produce an alternating two hundred glyph stream.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceLong_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_008 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      for (let i = 0; i < 80; i++) {
        pressHardKey(controller, 2050);
        releaseHardKey(controller, 2050);
        pressHardKey(controller, 2017);
        releaseHardKey(controller, 2017);
      }
      expect(harness.client.insertedTexts[1]).assertEqual('a');
      expect(harness.client.insertedTexts[159]).assertEqual('a');
      expect(harness.client.insertedTexts.join('').length).assertEqual(160);
      expect(harness.client.insertedTexts.length).assertEqual(160);
      expect(harness.client.insertedTexts[0]).assertEqual(' ');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_LONG_0900
     * @tc.name      testEnduranceLong_009
     * @tc.desc      Verify one hundred extend calls split twenty-five per action across four kinds.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceLong_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_009 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const actions: number[] = [inputMethodEngine.ExtendAction.CUT, inputMethodEngine.ExtendAction.COPY,
        inputMethodEngine.ExtendAction.PASTE, inputMethodEngine.ExtendAction.SELECT_ALL];
      let i: number = 0;
      while (i < 100) {
        InputHandler.getInstance().sendExtendAction(actions[i % 4]);
        i = i + 1;
      }
      const seen: Map<number, number> = new Map<number, number>();
      let iW1: number = 0;
      while (iW1 < harness.client.extendActions.length) {
        const action: number = harness.client.extendActions[iW1];
        seen.set(action, (seen.get(action) ?? 0) + 1);
        iW1 = iW1 + 1;
      }
      expect(seen.size).assertEqual(4);
      let twentyFive: number = 0;
      let iW2: number = 0;
      while (iW2 < actions.length) {
        if (seen.get(actions[iW2]) === 25) {
          twentyFive = twentyFive + 1;
        }
        iW2 = iW2 + 1;
      }
      expect(twentyFive).assertEqual(4);
      expect(harness.client.journal.length).assertEqual(100);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_LONG_1000
     * @tc.name      testEnduranceLong_010
     * @tc.desc      Verify a three-step shift rule over one hundred fifty letters counts fifty uppercase.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceLong_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_010 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      const plan: boolean[] = [];
      for (let i = 0; i < 150; i++) {
        plan.push(i % 3 === 0);
      }
      const upperRun: string[] = [];
      for (let i = 0; i < plan.length; i++) {
        if (plan[i]) {
          pressHardKey(controller, 2047);
        }
        pressHardKey(controller, 2032);
        releaseHardKey(controller, 2032);
        if (plan[i]) {
          releaseHardKey(controller, 2047);
        }
        if (plan[i]) {
          upperRun.push(harness.client.insertedTexts[harness.client.insertedTexts.length - 1]);
        }
      }
      let expectedRun: string = '';
      for (let i = 0; i < 50; i++) {
        expectedRun = expectedRun + 'P';
      }
      expect(upperRun.join('')).assertEqual(expectedRun);
      expect(harness.client.insertedTexts.length - upperRun.length).assertEqual(100);
      expect(upperRun.length).assertEqual(50);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_LONG_1100
     * @tc.name      testEnduranceLong_011
     * @tc.desc      Verify seventy cycled deletion lengths from zero through four total one hundred forty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceLong_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_011 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      let sum: number = 0;
      let i: number = 0;
      while (i < 70) {
        const length: number = i % 5;
        InputHandler.getInstance().deleteBackward(length);
        sum = sum + length;
        i = i + 1;
      }
      expect(editorRef.backwardLengths[0]).assertEqual(0);
      expect(editorRef.backwardLengths[4]).assertEqual(4);
      expect(sum).assertEqual(140);
      expect(editorRef.backwardLengths.length).assertEqual(70);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_LONG_1200
     * @tc.name      testEnduranceLong_012
     * @tc.desc      Verify one hundred unknown taps leave no trace before and after five real letters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceLong_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_012 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      for (let i = 0; i < 100; i++) {
        pressHardKey(controller, 7000 + i);
        releaseHardKey(controller, 7000 + i);
      }
      expect(harness.client.journal.length).assertEqual(0);
      for (let i = 0; i < 5; i++) {
        pressHardKey(controller, 2018);
        releaseHardKey(controller, 2018);
      }
      expect(harness.client.journal.length).assertEqual(5);
      expect(harness.client.insertedTexts.join('')).assertEqual('bbbbb');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_LONG_1300
     * @tc.name      testEnduranceLong_013
     * @tc.desc      Verify two hundred letter-digit pairs produce four hundred alternating glyphs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceLong_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_013 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      let i: number = 0;
      while (i < 200) {
        pressHardKey(controller, 2019);
        releaseHardKey(controller, 2019);
        pressHardKey(controller, 2004);
        releaseHardKey(controller, 2004);
        i = i + 1;
      }
      expect(harness.client.insertedTexts[1]).assertEqual('4');
      expect(harness.client.insertedTexts[399]).assertEqual('4');
      expect(harness.client.journal.length).assertEqual(400);
      expect(harness.client.insertedTexts.length).assertEqual(400);
      expect(harness.client.insertedTexts[0]).assertEqual('c');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_LONG_1400
     * @tc.name      testEnduranceLong_014
     * @tc.desc      Verify two clients alternating sixty commands split thirty each.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceLong_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_014 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const second: ClientHarness = await createClientHarness(1);
      for (let i = 0; i < 60; i++) {
        InputHandler.getInstance().onInputStop();
        const session: ClientHarness = i % 2 === 0 ? first : second;
        InputHandler.getInstance().onInputStart(
          session.keyboard as object as inputMethodEngine.KeyboardController,
          session.client as object as inputMethodEngine.InputClient);
        await Promise.resolve();
        await Promise.resolve();
        InputHandler.getInstance().insertText(i % 2 === 0 ? 'f' : 's');
      }
      expect(second.client.insertedTexts.length).assertEqual(30);
      expect(first.client.insertedTexts.length).assertEqual(30);
      let firstText: string = '';
      let secondText: string = '';
      for (let i = 0; i < 30; i++) {
        firstText = firstText + 'f';
        secondText = secondText + 's';
      }
      expect(second.client.insertedTexts.join('')).assertEqual(secondText);
      expect(first.client.insertedTexts.join('')).assertEqual(firstText);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_LONG_1500
     * @tc.name      testEnduranceLong_015
     * @tc.desc      Verify fifty mixed-script payloads keep their measured code unit total.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceLong_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_015 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const payloads: string[] = ['a', '中', '😀', 'e', 'z'];
      let expectedUnits: number = 0;
      let i: number = 0;
      while (i < 50) {
        const payload: string = payloads[i % payloads.length];
        InputHandler.getInstance().insertText(payload);
        expectedUnits = expectedUnits + payload.length;
        i = i + 1;
      }
      expect(editorRef.insertedTexts.length).assertEqual(50);
      expect(expectedUnits).assertEqual(60);
      let measured: number = 0;
      let iW1: number = 0;
      while (iW1 < editorRef.insertedTexts.length) {
        measured = measured + editorRef.insertedTexts[iW1].length;
        iW1 = iW1 + 1;
      }
      expect(measured).assertEqual(expectedUnits);
      expect(editorRef.insertedTexts[2]).assertEqual('😀');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_LONG_1600
     * @tc.name      testEnduranceLong_016
     * @tc.desc      Verify eighty shifted chords all produce one uppercase glyph each.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceLong_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_016 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      for (let i = 0; i < 80; i++) {
        const code: number = 2017 + (i % 26);
        pressHardKey(controller, 2048);
        pressHardKey(controller, code);
        releaseHardKey(controller, code);
        releaseHardKey(controller, 2048);
      }
      let lowercase: number = 0;
      for (let i = 0; i < harness.client.insertedTexts.length; i++) {
        if (harness.client.insertedTexts[i].charCodeAt(0) > 90) {
          lowercase = lowercase + 1;
        }
      }
      expect(harness.client.insertedTexts.length).assertEqual(80);
      expect(harness.client.journal.length).assertEqual(80);
      expect(lowercase).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_LONG_1700
     * @tc.name      testEnduranceLong_017
     * @tc.desc      Verify one hundred single-character handler inserts stay one hundred commands.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceLong_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_017 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      let i: number = 0;
      while (i < 100) {
        InputHandler.getInstance().insertText('q');
        i = i + 1;
      }
      expect(harness.client.insertedTexts.length).assertEqual(100);
      expect(harness.client.insertedTexts.join('')).assertEqual(
        harness.client.insertedTexts.join('').toLowerCase());
      expect(harness.client.insertedTexts.join('').length).assertEqual(100);
      expect(harness.client.journal[99]).assertEqual('insert:q');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_LONG_1800
     * @tc.name      testEnduranceLong_018
     * @tc.desc      Verify sixty move-extend pairs alternate two command kinds one hundred twenty times.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceLong_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_018 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      for (let i = 0; i < 60; i++) {
        InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
        InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.COPY);
      }
      expect(harness.client.journal.length).assertEqual(120);
      expect(harness.client.journal[0].indexOf('move:') === 0).assertEqual(true);
      expect(harness.client.journal[1].indexOf('extend:') === 0).assertEqual(true);
      expect(harness.client.movedDirections.length).assertEqual(60);
      expect(harness.client.extendActions.length).assertEqual(60);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_LONG_1900
     * @tc.name      testEnduranceLong_019
     * @tc.desc      Verify one hundred twenty delete-key taps split sixty backward and sixty forward.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceLong_019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_019 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();
      const order: number[] = [2071, 2055];
      let pass: number = 0;
      while (pass < 60) {
        for (let k = 0; k < order.length; k++) {
          pressHardKey(controller, order[k]);
          releaseHardKey(controller, order[k]);
        }
        pass = pass + 1;
      }
      expect(editorRef.journal[0]).assertEqual('back:1');
      expect(editorRef.journal[1]).assertEqual('forward:1');
      let backwardEntries: number = 0;
      let i: number = 0;
      while (i < editorRef.journal.length) {
        if (editorRef.journal[i].indexOf('back:') === 0) {
          backwardEntries = backwardEntries + 1;
        }
        i = i + 1;
      }
      expect(backwardEntries).assertEqual(60);
      expect(editorRef.forwardLengths.length + editorRef.backwardLengths.length).assertEqual(120);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_019 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_LONG_2000
     * @tc.name      testEnduranceLong_020
     * @tc.desc      Verify three hundred taps over five punctuation keys give sixty hits per glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceLong_020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_020 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      const codes: number[] = [2043, 2044, 2121, 2122, 2011];
      for (let i = 0; i < 300; i++) {
        const code: number = codes[i % codes.length];
        pressHardKey(controller, code);
        releaseHardKey(controller, code);
      }
      const glyphs: string[] = [',', '.', '(', ')', '#'];
      let verified: number = 0;
      for (let g = 0; g < glyphs.length; g++) {
        let count: number = 0;
        for (let i = 0; i < harness.client.insertedTexts.length; i++) {
          if (harness.client.insertedTexts[i] === glyphs[g]) {
            count = count + 1;
          }
        }
        if (count === 60) {
          verified = verified + 1;
        }
      }
      expect(harness.client.journal.length).assertEqual(300);
      expect(verified).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceLong_020 end');
      await yieldToEventLoop();
    });

  });
}
