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

export default function EnduranceAggregateTest001Test(): void {
  describe('EnduranceAggregateTest001', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_AGGREGATE_0100
     * @tc.name      testEnduranceAggregate_001
     * @tc.desc      Verify two hundred taps of one key produce two hundred single-glyph insertions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceAggregate_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceAggregate_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      let i: number = 0;
      while (i < 200) {
        pressHardKey(controller, 2017);
        releaseHardKey(controller, 2017);
        i = i + 1;
      }
      expect(harness.client.insertedTexts.length).assertEqual(200);
      expect(harness.client.journal.length).assertEqual(200);
      expect(harness.client.insertedTexts.join('').length).assertEqual(200);
      expect(harness.client.insertedTexts[199]).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceAggregate_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_AGGREGATE_0200
     * @tc.name      testEnduranceAggregate_002
     * @tc.desc      Verify ten passes over the ten digit keys rebuild the decimal cycle every time.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceAggregate_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceAggregate_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      const codes: number[] = [2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2000];
      let expected: string = '';
      for (let pass = 0; pass < 10; pass++) {
        for (let i = 0; i < codes.length; i++) {
          pressHardKey(controller, codes[i]);
          releaseHardKey(controller, codes[i]);
        }
        expected = expected + '1234567890';
      }
      expect(harness.client.insertedTexts.length).assertEqual(100);
      expect(expected.length).assertEqual(100);
      expect(harness.client.insertedTexts.join('')).assertEqual(expected);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceAggregate_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_AGGREGATE_0300
     * @tc.name      testEnduranceAggregate_003
     * @tc.desc      Verify an alternating shift run of fifty-two letters splits evenly by case.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceAggregate_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceAggregate_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();
      let upperCount: number = 0;
      let lowerCount: number = 0;
      let i: number = 0;
      while (i < 52) {
        const shift: boolean = i % 2 === 0;
        if (shift) {
          pressHardKey(controller, 2047);
        }
        pressHardKey(controller, 2017);
        releaseHardKey(controller, 2017);
        if (shift) {
          releaseHardKey(controller, 2047);
          upperCount = upperCount + 1;
          } else {
          lowerCount = lowerCount + 1;
        }
        i = i + 1;
      }
      expect(editorRef.insertedTexts.length).assertEqual(52);
      expect(editorRef.insertedTexts[0]).assertEqual('A');
      expect(editorRef.insertedTexts[1]).assertEqual('a');
      expect(upperCount).assertEqual(26);
      expect(lowerCount).assertEqual(26);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceAggregate_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_AGGREGATE_0400
     * @tc.name      testEnduranceAggregate_004
     * @tc.desc      Verify sixty three-key chords fill a one hundred eighty glyph journal.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceAggregate_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceAggregate_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      const keys: number[] = [2017, 2018, 2019];
      let expected: string = '';
      for (let chord = 0; chord < 60; chord++) {
        for (let k = 0; k < keys.length; k++) {
          pressHardKey(controller, keys[k]);
          releaseHardKey(controller, keys[k]);
        }
        expected = expected + 'abc';
      }
      expect(harness.client.insertedTexts.join('')).assertEqual(expected);
      expect(harness.client.insertedTexts.length).assertEqual(180);
      expect(harness.client.journal.length).assertEqual(180);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceAggregate_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_AGGREGATE_0500
     * @tc.name      testEnduranceAggregate_005
     * @tc.desc      Verify a hundred twenty handler calls split into sixty inserts and sixty deletes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceAggregate_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceAggregate_005 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      let i: number = 0;
      while (i < 60) {
        handlerRef.insertText('x' + i);
        handlerRef.deleteBackward(i + 1);
        i = i + 1;
      }
      expect(harness.client.backwardLengths[59]).assertEqual(60);
      expect(harness.client.insertedTexts.length).assertEqual(60);
      expect(harness.client.backwardLengths.length).assertEqual(60);
      expect(harness.client.journal.length).assertEqual(120);
      expect(harness.client.insertedTexts[59]).assertEqual('x59');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceAggregate_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_AGGREGATE_0600
     * @tc.name      testEnduranceAggregate_006
     * @tc.desc      Verify one hundred letters separated by spaces double the insertion count.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceAggregate_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceAggregate_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      for (let i = 0; i < 100; i++) {
        pressHardKey(controller, 2018);
        releaseHardKey(controller, 2018);
        pressHardKey(controller, 2050);
        releaseHardKey(controller, 2050);
      }
      expect(harness.client.insertedTexts.join('').length).assertEqual(200);
      expect(harness.client.insertedTexts.length).assertEqual(200);
      const text: string = harness.client.insertedTexts.join('');
      expect(text.indexOf('b b')).assertEqual(0);
      expect(text.split(' ').length).assertEqual(101);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceAggregate_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_AGGREGATE_0700
     * @tc.name      testEnduranceAggregate_007
     * @tc.desc      Verify eighty deletion lengths accumulate to the triangular total.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceAggregate_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceAggregate_007 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      let total: number = 0;
      for (let i = 1; i <= 80; i++) {
        InputHandler.getInstance().deleteForward(i);
        total = total + i;
      }
      expect(total).assertEqual(3240);
      expect(editorRef.forwardLengths.length).assertEqual(80);
      expect(editorRef.forwardLengths[79]).assertEqual(80);
      let recomputed: number = 0;
      let i: number = 0;
      while (i < editorRef.forwardLengths.length) {
        recomputed = recomputed + editorRef.forwardLengths[i];
        i = i + 1;
      }
      expect(recomputed).assertEqual(total);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceAggregate_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_AGGREGATE_0800
     * @tc.name      testEnduranceAggregate_008
     * @tc.desc      Verify one hundred enter calls all reuse the single stored editor type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceAggregate_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceAggregate_008 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = new ClientHarness(7, 0);
      await Promise.resolve();
      await Promise.resolve();
      const counts: Map<number, number> = new Map<number, number>();
      for (let i = 0; i < 100; i++) {
        handlerRef.sendKeyFunction();
      }
      for (let i = 0; i < harness.client.keyFunctions.length; i++) {
        const type: number = harness.client.keyFunctions[i];
        const seen: number = counts.get(type) ?? 0;
        counts.set(type, seen + 1);
      }
      expect(counts.get(7)).assertEqual(100);
      expect(harness.client.journal.length).assertEqual(100);
      expect(counts.size).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceAggregate_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_AGGREGATE_0900
     * @tc.name      testEnduranceAggregate_009
     * @tc.desc      Verify forty cycled extend actions distribute ten calls to each action.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceAggregate_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceAggregate_009 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const actions: number[] = [inputMethodEngine.ExtendAction.CUT, inputMethodEngine.ExtendAction.COPY,
        inputMethodEngine.ExtendAction.PASTE, inputMethodEngine.ExtendAction.SELECT_ALL];
      let i: number = 0;
      while (i < 40) {
        InputHandler.getInstance().sendExtendAction(actions[i % actions.length]);
        i = i + 1;
      }
      expect(harness.client.extendActions.length).assertEqual(40);
      let firstActionCount: number = 0;
      let iW1: number = 0;
      while (iW1 < harness.client.extendActions.length) {
        if (harness.client.extendActions[iW1] === inputMethodEngine.ExtendAction.CUT) {
          firstActionCount = firstActionCount + 1;
        }
        iW1 = iW1 + 1;
      }
      expect(firstActionCount).assertEqual(10);
      expect(harness.client.extendActions[0]).assertEqual(harness.client.extendActions[4]);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceAggregate_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_AGGREGATE_1000
     * @tc.name      testEnduranceAggregate_010
     * @tc.desc      Verify one hundred cycled cursor moves balance the four directions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceAggregate_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceAggregate_010 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const directions: number[] = [inputMethodEngine.Direction.CURSOR_UP, inputMethodEngine.Direction.CURSOR_DOWN,
        inputMethodEngine.Direction.CURSOR_LEFT, inputMethodEngine.Direction.CURSOR_RIGHT];
      for (let i = 0; i < 100; i++) {
        InputHandler.getInstance().moveCursor(directions[i % directions.length]);
      }
      const histogram: number[] = [0, 0, 0, 0];
      for (let i = 0; i < harness.client.movedDirections.length; i++) {
        for (let d = 0; d < directions.length; d++) {
          if (harness.client.movedDirections[i] === directions[d]) {
            histogram[d] = histogram[d] + 1;
          }
        }
      }
      expect(harness.client.movedDirections.length).assertEqual(100);
      expect(histogram.join('|')).assertEqual('25|25|25|25');
      expect(harness.client.movedDirections[3]).assertEqual(harness.client.movedDirections[7]);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceAggregate_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_AGGREGATE_1100
     * @tc.name      testEnduranceAggregate_011
     * @tc.desc      Verify one full QWERTY traversal through the controller rebuilds the row string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceAggregate_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceAggregate_011 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();
      const order: number[] = [2033, 2039, 2021, 2034, 2036, 2041, 2037, 2025, 2031, 2032,
        2017, 2035, 2020, 2022, 2023, 2024, 2026, 2027, 2028, 2042, 2040, 2019, 2038, 2018, 2030, 2029];
      let i: number = 0;
      while (i < order.length) {
        pressHardKey(controller, order[i]);
        releaseHardKey(controller, order[i]);
        i = i + 1;
      }
      expect(editorRef.insertedTexts.length).assertEqual(26);
      expect(editorRef.journal.length).assertEqual(26);
      expect(editorRef.insertedTexts.join('')).assertEqual('qwertyuiopasdfghjklzxcvbnm');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceAggregate_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_AGGREGATE_1200
     * @tc.name      testEnduranceAggregate_012
     * @tc.desc      Verify seventy-five growing payloads total the sum from one through seventy-five.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceAggregate_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceAggregate_012 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      let totalUnits: number = 0;
      for (let i = 1; i <= 75; i++) {
        let payload: string = '';
        for (let c = 0; c < i; c++) {
          payload = payload + 'p';
        }
        InputHandler.getInstance().insertText(payload);
        totalUnits = totalUnits + payload.length;
      }
      expect(harness.client.insertedTexts[74].length).assertEqual(75);
      expect(totalUnits).assertEqual(2850);
      expect(harness.client.insertedTexts.length).assertEqual(75);
      let measured: number = 0;
      for (let i = 0; i < harness.client.insertedTexts.length; i++) {
        measured = measured + harness.client.insertedTexts[i].length;
      }
      expect(measured).assertEqual(totalUnits);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceAggregate_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_AGGREGATE_1300
     * @tc.name      testEnduranceAggregate_013
     * @tc.desc      Verify fifty shift hold cycles each add one uppercase glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceAggregate_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceAggregate_013 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      let i: number = 0;
      while (i < 50) {
        const pressRun1: number[] = [2047, 2021];
        for (const pressCode of pressRun1) {
          pressHardKey(controller, pressCode);
        }
        const releaseRun0: number[] = [2021, 2047];
        let relIdx0: number = 0;
        while (relIdx0 < releaseRun0.length) {
          releaseHardKey(controller, releaseRun0[relIdx0]);
          relIdx0 = relIdx0 + 1;
        }
        i = i + 1;
      }
      expect(harness.client.insertedTexts.length).assertEqual(50);
      let upperText: string = '';
      let iW1: number = 0;
      while (iW1 < 50) {
        upperText = upperText + 'E';
        iW1 = iW1 + 1;
      }
      expect(harness.client.insertedTexts.join('')).assertEqual(upperText);
      expect(upperText.length).assertEqual(50);
      expect(harness.client.journal.length).assertEqual(50);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceAggregate_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_AGGREGATE_1400
     * @tc.name      testEnduranceAggregate_014
     * @tc.desc      Verify two hundred alternating mapped and unmapped keys leave half the commands.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceAggregate_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceAggregate_014 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      for (let i = 0; i < 200; i++) {
        if (i % 2 === 0) {
          pressHardKey(controller, 2017);
          releaseHardKey(controller, 2017);
        } else {
          pressHardKey(controller, 9000 + i);
          releaseHardKey(controller, 9000 + i);
        }
      }
      expect(harness.client.journal.length).assertEqual(100);
      expect(harness.client.insertedTexts.join('').length).assertEqual(100);
      expect(harness.client.insertedTexts[99]).assertEqual('a');
      expect(harness.client.insertedTexts.length).assertEqual(100);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceAggregate_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_AGGREGATE_1500
     * @tc.name      testEnduranceAggregate_015
     * @tc.desc      Verify sixty digit taps add up to the arithmetic string total.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceAggregate_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceAggregate_015 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();
      let expected: string = '';
      let i: number = 0;
      while (i < 60) {
        const code: number = 2001 + (i % 9);
        pressHardKey(controller, code);
        releaseHardKey(controller, code);
        expected = expected + String(i % 9 + 1);
        i = i + 1;
      }
      expect(editorRef.insertedTexts.join('')).assertEqual(expected);
      expect(expected.length).assertEqual(60);
      let digitSum: number = 0;
      let iW1: number = 0;
      while (iW1 < editorRef.insertedTexts.length) {
        digitSum = digitSum + Number(editorRef.insertedTexts[iW1]);
        iW1 = iW1 + 1;
      }
      expect(digitSum).assertEqual(291);
      expect(editorRef.journal.length).assertEqual(60);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceAggregate_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_AGGREGATE_1600
     * @tc.name      testEnduranceAggregate_016
     * @tc.desc      Verify a three hundred key letter cycle keeps one insertion per tap.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceAggregate_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceAggregate_016 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      for (let i = 0; i < 300; i++) {
        const code: number = 2017 + (i % 26);
        pressHardKey(controller, code);
        releaseHardKey(controller, code);
      }
      expect(harness.client.insertedTexts[299]).assertEqual('n');
      expect(harness.client.insertedTexts.length).assertEqual(300);
      expect(harness.client.journal.length).assertEqual(300);
      expect(harness.client.insertedTexts[0]).assertEqual('a');
      const firstCycle: string = harness.client.insertedTexts.slice(0, 26).join('');
      expect(firstCycle).assertEqual(harness.client.insertedTexts.slice(26, 52).join(''));

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceAggregate_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_EXTRA_0100
     * @tc.name      testEnduranceExtra_001
     * @tc.desc      Verify a letter-digit alternation keeps the glyph classes at their own indices.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceExtra_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      let i: number = 0;
      while (i < 150) {
        const code: number = i % 2 === 0 ? 2018 : 2000 + (i % 10);
        pressHardKey(controller, code);
        releaseHardKey(controller, code);
        i = i + 1;
      }
      let misplaced: number = 0;
      let iW1: number = 0;
      while (iW1 < harness.client.insertedTexts.length) {
        const code: number = harness.client.insertedTexts[iW1].charCodeAt(0);
        const isDigit: boolean = code >= 48 && code <= 57;
        if (isDigit !== (iW1 % 2 === 1)) {
          misplaced = misplaced + 1;
        }
        iW1 = iW1 + 1;
      }
      expect(harness.client.insertedTexts.length).assertEqual(150);
      expect(harness.client.insertedTexts[0]).assertEqual('b');
      expect(misplaced).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_EXTRA_0200
     * @tc.name      testEnduranceExtra_002
     * @tc.desc      Verify ninety insert-delete pairs alternate command kinds at every index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceExtra_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      for (let i = 0; i < 90; i++) {
        InputHandler.getInstance().insertText('i' + i);
        InputHandler.getInstance().deleteBackward(i);
      }
      let alternating: boolean = true;
      for (let i = 0; i < harness.client.journal.length; i++) {
        const startsWithInsert: boolean = harness.client.journal[i].indexOf('insert:') === 0;
        if (startsWithInsert !== (i % 2 === 0)) {
          alternating = false;
        }
      }
      expect(harness.client.backwardLengths[89]).assertEqual(89);
      expect(alternating).assertTrue();
      expect(harness.client.journal.length).assertEqual(180);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_EXTRA_0300
     * @tc.name      testEnduranceExtra_003
     * @tc.desc      Verify one hundred twenty bare shift taps emit no editor commands at all.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceExtra_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();
      let i: number = 0;
      while (i < 120) {
        pressHardKey(controller, i % 2 === 0 ? 2047 : 2048);
        releaseHardKey(controller, i % 2 === 0 ? 2047 : 2048);
        i = i + 1;
      }
      expect(editorRef.journal.length).assertEqual(0);
      let iW1: number = 0;
      while (iW1 < 12) {
        pressHardKey(controller, 2017);
        releaseHardKey(controller, 2017);
        iW1 = iW1 + 1;
      }
      expect(editorRef.insertedTexts.length).assertEqual(12);
      expect(editorRef.insertedTexts.join('')).assertEqual('aaaaaaaaaaaa');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_EXTRA_0400
     * @tc.name      testEnduranceExtra_004
     * @tc.desc      Verify sixty-four separately shifted letters all land in the uppercase range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceExtra_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      for (let i = 0; i < 64; i++) {
        const code: number = 2017 + (i % 26);
        pressHardKey(controller, 2047);
        pressHardKey(controller, code);
        releaseHardKey(controller, code);
        releaseHardKey(controller, 2047);
      }
      let belowUpper: number = 0;
      for (let i = 0; i < harness.client.insertedTexts.length; i++) {
        if (harness.client.insertedTexts[i].charCodeAt(0) < 65 ||
          harness.client.insertedTexts[i].charCodeAt(0) > 90) {
          belowUpper = belowUpper + 1;
        }
      }
      expect(harness.client.insertedTexts.length).assertEqual(64);
      expect(harness.client.insertedTexts[63]).assertEqual('L');
      expect(belowUpper).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_EXTRA_0500
     * @tc.name      testEnduranceExtra_005
     * @tc.desc      Verify two hundred arrow taps distribute evenly across the four directions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceExtra_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_005 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      const codes: number[] = [2012, 2013, 2014, 2015];
      let i: number = 0;
      while (i < 200) {
        const code: number = codes[i % codes.length];
        pressHardKey(controller, code);
        releaseHardKey(controller, code);
        i = i + 1;
      }
      const counts: Map<number, number> = new Map<number, number>();
      let iW1: number = 0;
      while (iW1 < harness.client.movedDirections.length) {
        const direction: number = harness.client.movedDirections[iW1];
        counts.set(direction, (counts.get(direction) ?? 0) + 1);
        iW1 = iW1 + 1;
      }
      expect(harness.client.movedDirections.length).assertEqual(200);
      expect(counts.size).assertEqual(4);
      expect(counts.get(harness.client.movedDirections[0])).assertEqual(50);
      expect(harness.client.journal.length).assertEqual(200);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_EXTRA_0600
     * @tc.name      testEnduranceExtra_006
     * @tc.desc      Verify alternating delete keys split equally between backward and forward calls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceExtra_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      for (let i = 0; i < 100; i++) {
        const code: number = i % 2 === 0 ? 2055 : 2071;
        pressHardKey(controller, code);
        releaseHardKey(controller, code);
      }
      expect(harness.client.backwardLengths.length).assertEqual(50);
      expect(harness.client.journal.length).assertEqual(100);
      expect(harness.client.journal[0]).assertEqual('forward:1');
      expect(harness.client.journal[1]).assertEqual('back:1');
      expect(harness.client.forwardLengths.length).assertEqual(50);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_EXTRA_0700
     * @tc.name      testEnduranceExtra_007
     * @tc.desc      Verify eighty growing payloads accumulate the triangular unit total.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceExtra_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_007 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      let units: number = 0;
      let index: number = 1;
      while (index <= 80) {
        let payload: string = '';
        let k: number = 0;
        while (k < index) {
          payload = payload + 'k';
          k = k + 1;
        }
        handlerRef.insertText(payload);
        units = units + index;
        index = index + 1;
      }
      expect(editorRef.insertedTexts[0].length).assertEqual(1);
      expect(editorRef.insertedTexts[79].length).assertEqual(80);
      expect(units).assertEqual(3240);
      expect(editorRef.insertedTexts.length).assertEqual(80);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_EXTRA_0800
     * @tc.name      testEnduranceExtra_008
     * @tc.desc      Verify one hundred moves followed by one hundred inserts split at the journal midpoint.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceExtra_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_008 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      for (let i = 0; i < 100; i++) {
        InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      }
      for (let i = 0; i < 100; i++) {
        InputHandler.getInstance().insertText('n');
      }
      expect(harness.client.movedDirections.length).assertEqual(100);
      expect(harness.client.insertedTexts.length).assertEqual(100);
      expect(harness.client.journal.length).assertEqual(200);
      expect(harness.client.journal[99].indexOf('move:')).assertEqual(0);
      expect(harness.client.journal[100].indexOf('insert:')).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_EXTRA_0900
     * @tc.name      testEnduranceExtra_009
     * @tc.desc      Verify a three-class key cycle keeps forty glyphs of each class.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceExtra_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_009 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      const classes: number[] = [2017, 2003, 2044];
      let i: number = 0;
      while (i < 120) {
        const code: number = classes[i % 3];
        pressHardKey(controller, code);
        releaseHardKey(controller, code);
        i = i + 1;
      }
      let letters: number = 0;
      let digits: number = 0;
      let periods: number = 0;
      let iW1: number = 0;
      while (iW1 < harness.client.insertedTexts.length) {
        const glyph: string = harness.client.insertedTexts[iW1];
        if (glyph === '.') {
          periods = periods + 1;
          } else if (glyph >= '0' && glyph <= '9') {
          digits = digits + 1;
          } else {
          letters = letters + 1;
        }
        iW1 = iW1 + 1;
      }
      expect(letters).assertEqual(40);
      expect(digits).assertEqual(40);
      expect(periods).assertEqual(40);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_EXTRA_1000
     * @tc.name      testEnduranceExtra_010
     * @tc.desc      Verify sixty alternating clients each collect their own thirty enter types.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceExtra_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_010 begin');
      handlerRef.onInputStop();
      const typed: number[] = [];
      for (let i = 0; i < 60; i++) {
        const enterType: number = i % 2 === 0 ? 1 : 2;
        handlerRef.onInputStop();
        const session: ClientHarness = new ClientHarness(enterType, 0);
        await Promise.resolve();
        await Promise.resolve();
        handlerRef.sendKeyFunction();
        typed.push(session.client.keyFunctions[0]);
      }
      let typeOne: number = 0;
      let typeTwo: number = 0;
      for (let i = 0; i < typed.length; i++) {
        if (typed[i] === 1) {
          typeOne = typeOne + 1;
        } else {
          typeTwo = typeTwo + 1;
        }
      }
      expect(typeOne).assertEqual(30);
      expect(typeTwo).assertEqual(30);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(2);
      expect(typed.length).assertEqual(60);
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_EXTRA_1100
     * @tc.name      testEnduranceExtra_011
     * @tc.desc      Verify two controllers alternating one hundred times share one journal stream.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceExtra_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_011 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controllers: KeyboardController[] = [createKeyboardController(), createKeyboardController()];
      let i: number = 0;
      while (i < 100) {
        const controller: KeyboardController = controllers[i % 2];
        pressHardKey(controller, 2017);
        releaseHardKey(controller, 2017);
        i = i + 1;
      }
      expect(editorRef.journal.length).assertEqual(100);
      expect(editorRef.insertedTexts.length).assertEqual(100);
      expect(editorRef.insertedTexts.join('').length).assertEqual(100);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_EXTRA_1200
     * @tc.name      testEnduranceExtra_012
     * @tc.desc      Verify seventy-five unknown codes between seventy-five letters leave half the journal.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceExtra_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_012 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      for (let i = 0; i < 150; i++) {
        if (i % 2 === 0) {
          pressHardKey(controller, 2019);
          releaseHardKey(controller, 2019);
        } else {
          pressHardKey(controller, 8000 + i);
          releaseHardKey(controller, 8000 + i);
        }
      }
      expect(harness.client.journal.length).assertEqual(75);
      expect(harness.client.insertedTexts.length).assertEqual(75);
      const text: string = harness.client.insertedTexts.join('');
      expect(text.length).assertEqual(75);
      expect(text.charAt(0)).assertEqual('c');
      expect(text.charAt(74)).assertEqual('c');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_EXTRA_1300
     * @tc.name      testEnduranceExtra_013
     * @tc.desc      Verify a shift every third letter yields thirty uppercase out of ninety.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceExtra_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_013 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      let i: number = 0;
      while (i < 90) {
        const shifted: boolean = i % 3 === 0;
        if (shifted) {
          pressHardKey(controller, 2047);
        }
        pressHardKey(controller, 2020);
        releaseHardKey(controller, 2020);
        if (shifted) {
          releaseHardKey(controller, 2047);
        }
        i = i + 1;
      }
      let upper: number = 0;
      let iW1: number = 0;
      while (iW1 < harness.client.insertedTexts.length) {
        if (harness.client.insertedTexts[iW1] === 'D') {
          upper = upper + 1;
        }
        iW1 = iW1 + 1;
      }
      expect(upper).assertEqual(30);
      expect(harness.client.insertedTexts.length).assertEqual(90);
      expect(harness.client.insertedTexts[0]).assertEqual('D');
      expect(harness.client.insertedTexts[1]).assertEqual('d');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENDURANCE_EXTRA_1400
     * @tc.name      testEnduranceExtra_014
     * @tc.desc      Verify a two hundred key five-letter cycle has forty hits per letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnduranceExtra_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_014 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      const codes: number[] = [2017, 2018, 2019, 2020, 2021];
      const frequency: Map<string, number> = new Map<string, number>();
      for (let i = 0; i < 200; i++) {
        const code: number = codes[i % codes.length];
        pressHardKey(controller, code);
        releaseHardKey(controller, code);
      }
      for (let i = 0; i < harness.client.insertedTexts.length; i++) {
        const glyph: string = harness.client.insertedTexts[i];
        frequency.set(glyph, (frequency.get(glyph) ?? 0) + 1);
      }
      expect(frequency.get('a')).assertEqual(40);
      expect(frequency.get('e')).assertEqual(40);
      expect(harness.client.journal.length).assertEqual(200);
      expect(frequency.size).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnduranceExtra_014 end');
      await yieldToEventLoop();
    });

  });
}
