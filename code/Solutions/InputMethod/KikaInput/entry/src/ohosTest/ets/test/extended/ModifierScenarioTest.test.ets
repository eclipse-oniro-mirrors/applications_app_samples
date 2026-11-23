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
import { KeyboardController, InputHandler } from '../../../../main/ets/model/KeyboardController';
import { ClientHarness, createClientHarness, FakeInputClient } from '../support/ClientHarness';
import { createKeyboardController, pressHardKey, releaseHardKey, isShiftHeld } from '../support/TestSupport';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputModifierScenario]';

function tap(controller: KeyboardController, keyCode: number): void {
  pressHardKey(controller, keyCode);
  releaseHardKey(controller, keyCode);
}

export default function ModifierScenarioTestTest(): void {
  describe('ModifierScenarioTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_MODIFIER_SCENARIO_0100
     * @tc.name      testModifierScenario_001
     * @tc.desc      Verify a three-key shift path inserts the letter and the punctuation literally.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierScenario_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenario_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2047)).assertEqual(false);
      expect(pressHardKey(controller, 2017)).assertEqual(true);
      expect(pressHardKey(controller, 2043)).assertEqual(true);
      const releaseRun0: number[] = [2043, 2017, 2047];
      let relIdx0: number = 0;
      while (relIdx0 < releaseRun0.length) {
        releaseHardKey(controller, releaseRun0[relIdx0]);
        relIdx0 = relIdx0 + 1;
      }
      expect(harness.client.insertedTexts.join('')).assertEqual('A,');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenario_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MODIFIER_SCENARIO_0200
     * @tc.name      testModifierScenario_002
     * @tc.desc      Verify a shift tap between three letters yields lower-upper-lower case.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierScenario_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenario_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      tap(controller, 2017);
      pressHardKey(controller, 2047);
      tap(controller, 2018);
      releaseHardKey(controller, 2047);
      tap(controller, 2019);
      const cases: string[] = [];
      for (let i = 0; i < harness.client.insertedTexts.length; i++) {
        cases.push(harness.client.insertedTexts[i]);
      }
      expect(cases.join('')).assertEqual('aBc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenario_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MODIFIER_SCENARIO_0300
     * @tc.name      testModifierScenario_003
     * @tc.desc      Verify an alt key followed by a letter and a digit inserts both.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierScenario_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenario_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2045)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertTrue();
      releaseHardKey(controller, 2017);
      expect(pressHardKey(controller, 2001)).assertTrue();
      const releaseRun0: number[] = [2001, 2045];
      let relIdx0: number = 0;
      while (relIdx0 < releaseRun0.length) {
        releaseHardKey(controller, releaseRun0[relIdx0]);
        relIdx0 = relIdx0 + 1;
      }
      expect(editorRef.insertedTexts.join('')).assertEqual('a1');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenario_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MODIFIER_SCENARIO_0400
     * @tc.name      testModifierScenario_004
     * @tc.desc      Verify a shift plus alt latch blocks a letter until both modifiers are released.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierScenario_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenario_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      pressHardKey(controller, 2047);
      pressHardKey(controller, 2045);
      expect(pressHardKey(controller, 2017)).assertEqual(false);
      releaseHardKey(controller, 2017);
      releaseHardKey(controller, 2045);
      releaseHardKey(controller, 2047);
      expect(harness.client.journal.length).assertEqual(0);
      expect(pressHardKey(controller, 2018)).assertEqual(true);
      releaseHardKey(controller, 2018);
      expect(harness.client.insertedTexts.join('')).assertEqual('b');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenario_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MODIFIER_SCENARIO_0500
     * @tc.name      testModifierScenario_005
     * @tc.desc      Verify one shift hold capitalizes a five-letter run.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierScenario_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenario_005 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      pressHardKey(controller, 2047);
      let i: number = 0;
      while (i < 5) {
        tap(controller, 2017 + i);
        i = i + 1;
      }
      releaseHardKey(controller, 2047);
      const allUpper: boolean = harness.client.insertedTexts.join('') ===
        harness.client.insertedTexts.join('').toUpperCase();
      expect(allUpper).assertTrue();
      expect(harness.client.insertedTexts.length).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenario_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MODIFIER_SCENARIO_0600
     * @tc.name      testModifierScenario_006
     * @tc.desc      Verify two held shift keys block a letter until the second release.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierScenario_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenario_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      pressHardKey(controller, 2047);
      pressHardKey(controller, 2048);
      expect(pressHardKey(controller, 2017)).assertFalse();
      releaseHardKey(controller, 2017);
      releaseHardKey(controller, 2047);
      expect(pressHardKey(controller, 2017)).assertFalse();
      releaseHardKey(controller, 2017);
      releaseHardKey(controller, 2048);
      const recovered: boolean = pressHardKey(controller, 2017);
      releaseHardKey(controller, 2017);
      expect(harness.client.journal.join('|')).assertEqual('insert:a');
      expect(recovered).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenario_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MODIFIER_SCENARIO_0700
     * @tc.name      testModifierScenario_007
     * @tc.desc      Verify a letter released before shift keeps the next letter uppercase.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierScenario_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenario_007 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();

      const pressRun1: number[] = [2047, 2017];
      for (const pressCode of pressRun1) {
        pressHardKey(controller, pressCode);
      }
      releaseHardKey(controller, 2017);
      pressHardKey(controller, 2018);
      const releaseRun0: number[] = [2018, 2047];
      let relIdx0: number = 0;
      while (relIdx0 < releaseRun0.length) {
        releaseHardKey(controller, releaseRun0[relIdx0]);
        relIdx0 = relIdx0 + 1;
      }
      expect(editorRef.insertedTexts[0]).assertEqual('A');
      expect(editorRef.insertedTexts[1]).assertEqual('B');
      expect(isShiftHeld(controller)).assertEqual(false);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenario_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MODIFIER_SCENARIO_0800
     * @tc.name      testModifierScenario_008
     * @tc.desc      Verify a shift released before a letter leaves that letter lowercase.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierScenario_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenario_009 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      pressHardKey(controller, 2048);
      releaseHardKey(controller, 2048);
      tap(controller, 2017);
      expect(harness.client.journal.length).assertEqual(1);
      expect(harness.client.insertedTexts[0]).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenario_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MODIFIER_SCENARIO_0900
     * @tc.name      testModifierScenario_009
     * @tc.desc      Verify a shift tap before every letter of a three-letter word uppercases all three.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierScenario_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenario_010 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      let i: number = 0;
      while (i < 3) {
        pressHardKey(controller, 2047);
        tap(controller, 2017 + i);
        releaseHardKey(controller, 2047);
        i = i + 1;
      }
      expect(harness.client.insertedTexts.join('')).assertEqual('ABC');
      expect(harness.client.journal.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenario_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MODIFIER_EXTRA_0100
     * @tc.name      testModifierScenarioExtra_001
     * @tc.desc      Verify two alt taps followed by a letter emit one lowercase insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierScenarioExtra_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenarioExtra_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      expect(pressHardKey(controller, 2045)).assertEqual(false);
      releaseHardKey(controller, 2045);
      expect(pressHardKey(controller, 2045)).assertEqual(false);
      releaseHardKey(controller, 2045);
      pressHardKey(controller, 2017);
      releaseHardKey(controller, 2017);
      expect(harness.client.journal.length).assertEqual(1);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenarioExtra_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MODIFIER_EXTRA_0200
     * @tc.name      testModifierScenarioExtra_002
     * @tc.desc      Verify alt ahead of shift keeps the next letter lowercase.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierScenarioExtra_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenarioExtra_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();
      const pressRun1: number[] = [2045, 2047];
      for (const pressCode of pressRun1) {
        pressHardKey(controller, pressCode);
      }
      releaseHardKey(controller, 2047);
      pressHardKey(controller, 2018);
      const releaseRun0: number[] = [2018, 2045];
      let relIdx0: number = 0;
      while (relIdx0 < releaseRun0.length) {
        releaseHardKey(controller, releaseRun0[relIdx0]);
        relIdx0 = relIdx0 + 1;
      }
      expect(editorRef.insertedTexts.join('')).assertEqual('b');
      expect(isShiftHeld(controller)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenarioExtra_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MODIFIER_EXTRA_0300
     * @tc.name      testModifierScenarioExtra_003
     * @tc.desc      Verify alt pressed behind shift arms the latch and blocks the next letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierScenarioExtra_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenarioExtra_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      pressHardKey(controller, 2047);
      pressHardKey(controller, 2045);
      expect(pressHardKey(controller, 2017)).assertFalse();
      releaseHardKey(controller, 2017);
      releaseHardKey(controller, 2045);
      expect(pressHardKey(controller, 2018)).assertFalse();
      releaseHardKey(controller, 2018);
      releaseHardKey(controller, 2047);
      expect(harness.client.journal.length).assertEqual(0);
      pressHardKey(controller, 2019);
      releaseHardKey(controller, 2019);
      expect(harness.client.insertedTexts.join('')).assertEqual('c');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenarioExtra_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MODIFIER_EXTRA_0400
     * @tc.name      testModifierScenarioExtra_004
     * @tc.desc      Verify alt then digit then letter keeps both lowercase and numeric glyphs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierScenarioExtra_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenarioExtra_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      const pressRun1: number[] = [2045, 2009];
      for (const pressCode of pressRun1) {
        pressHardKey(controller, pressCode);
      }
      releaseHardKey(controller, 2009);
      pressHardKey(controller, 2020);
      const releaseRun0: number[] = [2020, 2045];
      let relIdx0: number = 0;
      while (relIdx0 < releaseRun0.length) {
        releaseHardKey(controller, releaseRun0[relIdx0]);
        relIdx0 = relIdx0 + 1;
      }
      expect(harness.client.insertedTexts.join('')).assertEqual('9d');
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenarioExtra_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MODIFIER_EXTRA_0500
     * @tc.name      testModifierScenarioExtra_005
     * @tc.desc      Verify shift and alt taps in sequence leave the following letter lowercase.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierScenarioExtra_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenarioExtra_005 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      const tapCodes0: number[] = [2047, 2045, 2021];
      for (let tapIndex0 = 0; tapIndex0 < tapCodes0.length; tapIndex0++) {
        tap(controller, tapCodes0[tapIndex0]);
      }
      expect(harness.client.insertedTexts.join('')).assertEqual('e');
      expect(isShiftHeld(controller)).assertFalse();
      expect(harness.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenarioExtra_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MODIFIER_EXTRA_0600
     * @tc.name      testModifierScenarioExtra_006
     * @tc.desc      Verify alt taps while an unknown latch is active still leave the letter blocked.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierScenarioExtra_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenarioExtra_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();
      pressHardKey(controller, 8800);
      tap(controller, 2045);
      expect(pressHardKey(controller, 2017)).assertFalse();
      const releaseRun0: number[] = [2017, 8800];
      let relIdx0: number = 0;
      while (relIdx0 < releaseRun0.length) {
        releaseHardKey(controller, releaseRun0[relIdx0]);
        relIdx0 = relIdx0 + 1;
      }
      expect(editorRef.journal.length).assertEqual(0);
      tap(controller, 2018);
      expect(editorRef.insertedTexts.join('')).assertEqual('b');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenarioExtra_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MODIFIER_EXTRA_0700
     * @tc.name      testModifierScenarioExtra_007
     * @tc.desc      Verify a space behind shift is blocked by the latch and works after release.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierScenarioExtra_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenarioExtra_007 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      pressHardKey(controller, 2047);
      expect(pressHardKey(controller, 2050)).assertEqual(false);
      releaseHardKey(controller, 2050);
      releaseHardKey(controller, 2047);
      expect(harness.client.journal.length).assertEqual(0);
      pressHardKey(controller, 2050);
      releaseHardKey(controller, 2050);
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.insertedTexts.join('')).assertEqual(' ');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenarioExtra_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MODIFIER_EXTRA_0800
     * @tc.name      testModifierScenarioExtra_008
     * @tc.desc      Verify a comma behind shift is blocked while a shifted letter stays uppercase.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierScenarioExtra_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenarioExtra_008 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      const pressRun1: number[] = [2047, 2017];
      for (const pressCode of pressRun1) {
        pressHardKey(controller, pressCode);
      }
      releaseHardKey(controller, 2017);
      expect(pressHardKey(controller, 2043)).assertFalse();
      const releaseRun0: number[] = [2043, 2047];
      let relIdx0: number = 0;
      while (relIdx0 < releaseRun0.length) {
        releaseHardKey(controller, releaseRun0[relIdx0]);
        relIdx0 = relIdx0 + 1;
      }
      expect(harness.client.insertedTexts.join('')).assertEqual('A');
      pressHardKey(controller, 2043);
      releaseHardKey(controller, 2043);
      expect(harness.client.insertedTexts.join('')).assertEqual('A,');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenarioExtra_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MODIFIER_EXTRA_0900
     * @tc.name      testModifierScenarioExtra_009
     * @tc.desc      Verify two alt keys never arm a latch and a letter between them still inserts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierScenarioExtra_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenarioExtra_009 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();
      pressHardKey(controller, 2045);
      pressHardKey(controller, 2020);
      releaseHardKey(controller, 2020);
      releaseHardKey(controller, 2045);
      pressHardKey(controller, 2045);
      pressHardKey(controller, 2021);
      releaseHardKey(controller, 2021);
      releaseHardKey(controller, 2045);
      expect(isShiftHeld(controller)).assertFalse();
      expect(harness.client.insertedTexts.join('')).assertEqual('de');
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenarioExtra_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MODIFIER_EXTRA_1000
     * @tc.name      testModifierScenarioExtra_010
     * @tc.desc      Verify ten alternate alt pairs leave the controller without a shift latch.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierScenarioExtra_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenarioExtra_010 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();
      let i: number = 0;
      while (i < 10) {
        pressHardKey(controller, 2045);
        releaseHardKey(controller, 2045);
        pressHardKey(controller, 2022);
        releaseHardKey(controller, 2022);
        expect(isShiftHeld(controller)).assertEqual(false);
        i = i + 1;
      }
      expect(editorRef.insertedTexts.length).assertEqual(10);
      expect(editorRef.insertedTexts.join('')).assertEqual('ffffffffff');
      expect(editorRef.journal.length).assertEqual(10);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierScenarioExtra_010 end');
      await yieldToEventLoop();
    });

  });
}
