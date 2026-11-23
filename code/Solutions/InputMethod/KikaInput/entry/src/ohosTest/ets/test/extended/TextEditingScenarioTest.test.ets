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
import { createKeyboardController, pressHardKey, releaseHardKey } from '../support/TestSupport';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputTextEditingScenario]';

function tap(controller: KeyboardController, keyCode: number): void {
  pressHardKey(controller, keyCode);
  releaseHardKey(controller, keyCode);
}

export default function textEditingScenarioTest(): void {
  describe('TextEditingScenarioTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_TEXT_EDITING_SCENARIO_0100
     * @tc.name      testTextEditingScenario_001
     * @tc.desc      Verify five left moves land before a single middle insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTextEditingScenario_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextEditingScenario_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      const word: number[] = [2024, 2021, 2028, 2028, 2031];
      let i: number = 0;
      while (i < word.length) {
        tap(controller, word[i]);
        i = i + 1;
      }
      let iW1: number = 0;
      while (iW1 < 5) {
        tap(controller, 2014);
        iW1 = iW1 + 1;
      }
      tap(controller, 2040);
      const tail: string[] = harness.client.journal.slice(-2);
      expect(tail.join('|')).assertEqual('move:3|insert:x');
      expect(harness.client.insertedTexts.join('')).assertEqual('hellox');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextEditingScenario_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TEXT_EDITING_SCENARIO_0200
     * @tc.name      testTextEditingScenario_002
     * @tc.desc      Verify three deletions after an insertion leave only the deletion commands.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTextEditingScenario_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextEditingScenario_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      const tapCodes0: number[] = [2017, 2018, 2019];
      for (const tapCode of tapCodes0) {
        tap(controller, tapCode);
      }
      for (let i = 0; i < 3; i++) {
        tap(controller, 2071);
      }
      let deletes: number = 0;
      for (let i = 0; i < harness.client.journal.length; i++) {
        if (harness.client.journal[i].indexOf('back:') === 0) {
          deletes = deletes + 1;
        }
      }
      expect(deletes).assertEqual(3);
      tap(controller, 2042);
      expect(harness.client.insertedTexts.join('')).assertEqual('abcz');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextEditingScenario_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TEXT_EDITING_SCENARIO_0300
     * @tc.name      testTextEditingScenario_003
     * @tc.desc      Verify two spaces are counted separately between three letters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTextEditingScenario_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextEditingScenario_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();

      const tapCodes0: number[] = [2017, 2050, 2018, 2050, 2019];
      for (const tapCode of tapCodes0) {
        tap(controller, tapCode);
      }
      const parts: string[] = editorRef.insertedTexts.join('').split(' ');
      expect(parts[1]).assertEqual('b');
      expect(parts[2]).assertEqual('c');
      expect(editorRef.insertedTexts.length).assertEqual(5);
      expect(parts.length).assertEqual(3);
      expect(parts[0]).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextEditingScenario_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TEXT_EDITING_SCENARIO_0400
     * @tc.name      testTextEditingScenario_004
     * @tc.desc      Verify a shifted word followed by two deletions keeps uppercase insertions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTextEditingScenario_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextEditingScenario_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      pressHardKey(controller, 2047);
      const tapCodes0: number[] = [2017, 2018, 2019];
      let tapIndex0: number = 0;
      while (tapIndex0 < tapCodes0.length) {
        tap(controller, tapCodes0[tapIndex0]);
        tapIndex0 = tapIndex0 + 1;
      }
      releaseHardKey(controller, 2047);
      tap(controller, 2071);
      tap(controller, 2071);
      expect(harness.client.insertedTexts.slice(0, 3).join('')).assertEqual('ABC');
      expect(harness.client.backwardLengths.length).assertEqual(2);
      expect(harness.client.insertedTexts.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextEditingScenario_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TEXT_EDITING_SCENARIO_0500
     * @tc.name      testTextEditingScenario_005
     * @tc.desc      Verify a digit run, one deletion and a letter run keep their segment boundaries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTextEditingScenario_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextEditingScenario_005 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      const digits: number[] = [2001, 2002, 2003];
      let i: number = 0;
      while (i < digits.length) {
        tap(controller, digits[i]);
        i = i + 1;
      }
      tap(controller, 2071);
      const letters: number[] = [2017, 2018];
      let iW1: number = 0;
      while (iW1 < letters.length) {
        tap(controller, letters[iW1]);
        iW1 = iW1 + 1;
      }
      const insertPositions: number[] = [];
      let iW2: number = 0;
      while (iW2 < harness.client.journal.length) {
        if (harness.client.journal[iW2].indexOf('insert:') === 0) {
          insertPositions.push(iW2);
        }
        iW2 = iW2 + 1;
      }
      expect(insertPositions.join('|')).assertEqual('0|1|2|4|5');
      expect(insertPositions.length).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextEditingScenario_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TEXT_EDITING_SCENARIO_0600
     * @tc.name      testTextEditingScenario_006
     * @tc.desc      Verify a punctuation key, a forward deletion and letters keep three command kinds.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTextEditingScenario_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextEditingScenario_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      const tapCodes0: number[] = [2043, 2055, 2017, 2014];
      let tapIndex0: number = 0;
      while (tapIndex0 < tapCodes0.length) {
        tap(controller, tapCodes0[tapIndex0]);
        tapIndex0 = tapIndex0 + 1;
      }
      const kinds: Set<string> = new Set<string>();
      for (let i = 0; i < harness.client.journal.length; i++) {
        kinds.add(harness.client.journal[i].split(':')[0]);
      }
      expect(kinds.has('forward')).assertTrue();
      expect(kinds.size).assertEqual(3);
      expect(kinds.has('insert')).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextEditingScenario_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TEXT_EDITING_SCENARIO_0700
     * @tc.name      testTextEditingScenario_007
     * @tc.desc      Verify three left moves from the word end reach the word start before a forward delete.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTextEditingScenario_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextEditingScenario_007 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();

      const tapCodes0: number[] = [2017, 2018, 2019];
      let tapIndex0: number = 0;
      while (tapIndex0 < tapCodes0.length) {
        tap(controller, tapCodes0[tapIndex0]);
        tapIndex0 = tapIndex0 + 1;
      }
      let i: number = 0;
      while (i < 3) {
        tap(controller, 2014);
        i = i + 1;
      }
      tap(controller, 2055);
      expect(editorRef.journal[6]).assertEqual('forward:1');
      expect(editorRef.journal.length).assertEqual(7);
      expect(editorRef.journal[3]).assertEqual('move:3');
      expect(editorRef.journal[5]).assertEqual('move:3');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextEditingScenario_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TEXT_EDITING_SCENARIO_0800
     * @tc.name      testTextEditingScenario_008
     * @tc.desc      Verify a mixed ten-step run keeps one command per step in the journal map.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTextEditingScenario_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextEditingScenario_008 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      const steps: number[] = [2017, 2018, 2014, 2055, 2020, 2071, 2015, 2043, 2019, 2001];
      for (let i = 0; i < steps.length; i++) {
        tap(controller, steps[i]);
      }
      expect(harness.client.journal.length).assertEqual(10);
      const uniqueKinds: Set<string> = new Set<string>();
      let insertCount: number = 0;
      for (let i = 0; i < harness.client.journal.length; i++) {
        uniqueKinds.add(harness.client.journal[i].split(':')[0]);
        if (harness.client.journal[i].indexOf('insert:') === 0) {
          insertCount = insertCount + 1;
        }
      }
      expect(insertCount).assertEqual(6);
      expect(uniqueKinds.size).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextEditingScenario_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TEXT_EDITING_SCENARIO_0900
     * @tc.name      testTextEditingScenario_009
     * @tc.desc      Verify a twenty-six letter run followed by thirteen deletions halves the insertion count.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTextEditingScenario_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextEditingScenario_009 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      for (let code = 2017; code <= 2042; code++) {
        tap(controller, code);
      }
      let i: number = 0;
      while (i < 13) {
        tap(controller, 2071);
        i = i + 1;
      }
      expect(harness.client.journal.length).assertEqual(39);
      expect(harness.client.insertedTexts.length).assertEqual(26);
      expect(harness.client.backwardLengths.length).assertEqual(13);
      const remaining: string = harness.client.insertedTexts.join('').substring(13);
      expect(remaining).assertEqual('nopqrstuvwxyz');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextEditingScenario_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TEXT_EDITING_SCENARIO_1000
     * @tc.name      testTextEditingScenario_010
     * @tc.desc      Verify a move across a space lands before the second word.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTextEditingScenario_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextEditingScenario_010 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      const tapCodes0: number[] = [2017, 2050, 2018, 2014, 2040];
      for (let tapIndex0 = 0; tapIndex0 < tapCodes0.length; tapIndex0++) {
        tap(controller, tapCodes0[tapIndex0]);
      }
      const commands: string[] = harness.client.journal;
      expect(commands[4]).assertEqual('insert:x');
      expect(harness.client.insertedTexts[2]).assertEqual('b');
      expect(harness.client.insertedTexts[3]).assertEqual('x');
      expect(commands[3]).assertEqual('move:3');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextEditingScenario_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TEXT_EDITING_SCENARIO_1100
     * @tc.name      testTextEditingScenario_011
     * @tc.desc      Verify a per-letter shift sequence yields five uppercase insertions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTextEditingScenario_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextEditingScenario_011 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();

      let i: number = 0;
      while (i < 5) {
        pressHardKey(controller, 2048);
        tap(controller, 2017 + i);
        releaseHardKey(controller, 2048);
        i = i + 1;
      }
      const uppercaseOnly: boolean = editorRef.insertedTexts.join('') ===
        editorRef.insertedTexts.join('').toUpperCase();
      expect(uppercaseOnly).assertTrue();
      expect(editorRef.insertedTexts.length).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextEditingScenario_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_TEXT_EDITING_SCENARIO_1200
     * @tc.name      testTextEditingScenario_012
     * @tc.desc      Verify alternating empty and non-empty insertions keep their multiplicities.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTextEditingScenario_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextEditingScenario_012 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      for (let i = 0; i < 3; i++) {
        InputHandler.getInstance().insertText('');
        InputHandler.getInstance().insertText('v');
        InputHandler.getInstance().deleteBackward(1);
      }
      let emptyCount: number = 0;
      let valueCount: number = 0;
      for (let i = 0; i < harness.client.insertedTexts.length; i++) {
        if (harness.client.insertedTexts[i] === '') {
          emptyCount = emptyCount + 1;
        } else {
          valueCount = valueCount + 1;
        }
      }
      expect(harness.client.backwardLengths.length).assertEqual(3);
      expect(emptyCount).assertEqual(3);
      expect(valueCount).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextEditingScenario_012 end');
      await yieldToEventLoop();
    });

  });

}
