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
import { createKeyboardController, pressHardKey, releaseHardKey, isShiftHeld } from '../support/TestSupport';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputWordScenario]';

function tap(controller: KeyboardController, keyCode: number): void {
  pressHardKey(controller, keyCode);
  releaseHardKey(controller, keyCode);
}

export default function wordScenarioTest(): void {
  describe('WordScenarioTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_WORD_SCENARIO_0100
     * @tc.name      testWordScenario_001
     * @tc.desc      Verify that a shift hold across three letters yields three uppercase insertions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWordScenario_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWordScenario_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      pressHardKey(controller, 2047);
      tap(controller, 2017);
      tap(controller, 2018);
      tap(controller, 2019);
      releaseHardKey(controller, 2047);
      expect(harness.client.insertedTexts.join('')).assertEqual('ABC');
      expect(harness.client.journal.length).assertEqual(3);
      expect(isShiftHeld(controller)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testWordScenario_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_WORD_SCENARIO_0200
     * @tc.name      testWordScenario_002
     * @tc.desc      Verify that two caret-left moves between typed letters land before the next insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWordScenario_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWordScenario_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      tap(controller, 2017);
      tap(controller, 2018);
      tap(controller, 2014);
      tap(controller, 2014);
      tap(controller, 2042);
      expect(harness.client.journal.join('|')).assertEqual('insert:a|insert:b|move:3|move:3|insert:z');
      expect(harness.client.movedDirections.join('|')).assertEqual('3|3');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testWordScenario_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_WORD_SCENARIO_0300
     * @tc.name      testWordScenario_003
     * @tc.desc      Verify that three backward deletions after a word are followed by two new letters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWordScenario_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWordScenario_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      tap(controller, 2017);
      tap(controller, 2018);
      tap(controller, 2019);
      tap(controller, 2071);
      tap(controller, 2071);
      tap(controller, 2071);
      tap(controller, 2040);
      tap(controller, 2041);
      expect(harness.client.backwardLengths.join('|')).assertEqual('1|1|1');
      expect(harness.client.insertedTexts.slice(3).join('')).assertEqual('xy');
      expect(harness.client.journal.length).assertEqual(8);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testWordScenario_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_WORD_SCENARIO_0400
     * @tc.name      testWordScenario_004
     * @tc.desc      Verify that comma, period and a letter are inserted as three separate glyphs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWordScenario_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWordScenario_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      tap(controller, 2043);
      tap(controller, 2044);
      tap(controller, 2017);
      expect(harness.client.insertedTexts.join('')).assertEqual(',.a');
      expect(harness.client.journal[0]).assertEqual('insert:,');
      expect(harness.client.journal[2]).assertEqual('insert:a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testWordScenario_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_WORD_SCENARIO_0500
     * @tc.name      testWordScenario_005
     * @tc.desc      Verify that a forward deletion between digit and letter insertions keeps its slot.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWordScenario_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWordScenario_005 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      tap(controller, 2001);
      tap(controller, 2002);
      tap(controller, 2055);
      tap(controller, 2018);
      expect(harness.client.journal.join('|')).assertEqual('insert:1|insert:2|forward:1|insert:b');
      expect(harness.client.forwardLengths.length).assertEqual(1);
      expect(harness.client.insertedTexts.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testWordScenario_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_WORD_SCENARIO_0600
     * @tc.name      testWordScenario_006
     * @tc.desc      Verify that a shift tap around one letter changes only that letter to uppercase.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWordScenario_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWordScenario_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      tap(controller, 2017);
      pressHardKey(controller, 2047);
      tap(controller, 2018);
      releaseHardKey(controller, 2047);
      tap(controller, 2019);
      expect(harness.client.insertedTexts.join('')).assertEqual('aBc');
      expect(harness.client.insertedTexts[1].charCodeAt(0)).assertEqual(66);
      expect(harness.client.journal.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testWordScenario_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_WORD_SCENARIO_0700
     * @tc.name      testWordScenario_007
     * @tc.desc      Verify that two left moves after a space place a correction before the last letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWordScenario_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWordScenario_007 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      tap(controller, 2017);
      tap(controller, 2018);
      tap(controller, 2050);
      tap(controller, 2019);
      tap(controller, 2014);
      tap(controller, 2014);
      tap(controller, 2020);
      expect(harness.client.insertedTexts.join('')).assertEqual('ab cd');
      expect(harness.client.journal.slice(4).join('|')).assertEqual('move:3|move:3|insert:d');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testWordScenario_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_WORD_SCENARIO_0800
     * @tc.name      testWordScenario_008
     * @tc.desc      Verify that an unmapped key swallowed before a letter leaves a single insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWordScenario_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWordScenario_008 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 9999)).assertFalse();
      releaseHardKey(controller, 9999);
      tap(controller, 2017);
      expect(harness.client.journal.join('')).assertEqual('insert:a');
      expect(harness.client.journal.length).assertEqual(1);
      expect(isShiftHeld(controller)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testWordScenario_008 end');
      await yieldToEventLoop();
    });

  });

}
