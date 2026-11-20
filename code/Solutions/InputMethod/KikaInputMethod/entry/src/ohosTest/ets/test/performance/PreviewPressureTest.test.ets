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
import { PreviewHarness, createPreviewHarness, typeSequence } from '../support/PreviewHarness';
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodPreviewPressure]';

export default function previewPressureTest(): void {
  describe('PreviewPressureTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0001
     * @tc.name      testPreviewPressure_001
     * @tc.desc      Verify that sixty separate trigger sessions open sixty preview requests.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_001 begin');
      let calls: number = 0;
      for (let i = 0; i < 60; i++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        typeSequence(harness, 'hel');
        calls = calls + harness.client.previewCalls.length;
      }
      expect(calls).assertEqual(60);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0002
     * @tc.name      testPreviewPressure_002
     * @tc.desc      Verify that forty preview commits each finish exactly once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_002 begin');
      let finishes: number = 0;
      for (let i = 0; i < 40; i++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        typeSequence(harness, 'hel');
        InputHandler.getInstance().sendKeyFunction();
        finishes = finishes + harness.client.finishCount;
      }
      expect(finishes).assertEqual(40);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0003
     * @tc.name      testPreviewPressure_003
     * @tc.desc      Verify that twenty-five preview sessions with hides keep finish at zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_003 begin');
      let hides: number = 0;
      let finishes: number = 0;
      for (let i = 0; i < 25; i++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        typeSequence(harness, 'hel');
        InputHandler.getInstance().hideKeyboardSelf();
        hides = hides + harness.keyboard.hideCount;
        finishes = finishes + harness.client.finishCount;
      }
      expect(hides).assertEqual(25);
      expect(finishes).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0004
     * @tc.name      testPreviewPressure_004
     * @tc.desc      Verify that thirty-five preview sessions with caret-end record thirty-five ranges.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_004 begin');
      let ranges: number = 0;
      for (let i = 0; i < 35; i++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        typeSequence(harness, 'hel');
        await InputHandler.getInstance().moveCursorToEnd();
        ranges = ranges + harness.client.selectedRanges.length;
      }
      expect(ranges).assertEqual(35);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0005
     * @tc.name      testPreviewPressure_005
     * @tc.desc      Verify that twenty preview sessions with forward deletes keep twenty calls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_005 begin');
      let deletes: number = 0;
      let calls: number = 0;
      for (let i = 0; i < 20; i++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        typeSequence(harness, 'hel');
        InputHandler.getInstance().deleteForward(1);
        deletes = deletes + harness.client.forwardLengths.length;
        calls = calls + harness.client.previewCalls.length;
      }
      expect(deletes).assertEqual(20);
      expect(calls).assertEqual(20);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0006
     * @tc.name      testPreviewPressure_006
     * @tc.desc      Verify that fifteen unsupported editors still emit fifteen preview requests.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_006 begin');
      let calls: number = 0;
      for (let i = 0; i < 15; i++) {
        const harness: PreviewHarness = await createPreviewHarness('', 0, 0, false);
        typeSequence(harness, 'hel');
        calls = calls + harness.client.previewCalls.length;
      }
      expect(calls).assertEqual(15);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0007
     * @tc.name      testPreviewPressure_007
     * @tc.desc      Verify that fifty non-trigger sessions open no preview at all.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const checkpoints: number[] = [];
      let rounds: number = 0;
      let calls: number = 0;
      while (rounds < 50) {
        const harness: PreviewHarness = await createPreviewHarness('');
        typeSequence(harness, 'abc');
        calls = calls + harness.client.previewCalls.length;
        rounds = rounds + 1;
        if (rounds % 10 === 0) {
          checkpoints.push(calls);
        }
      }
      expect(checkpoints.join('|')).assertEqual('0|0|0|0|0');
      expect(calls + 50).assertEqual(50);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0008
     * @tc.name      testPreviewPressure_008
     * @tc.desc      Verify that thirty preview sessions with select-begin record thirty ranges.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_008 begin');
      let ranges: number = 0;
      for (let i = 0; i < 30; i++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        typeSequence(harness, 'hel');
        await InputHandler.getInstance().selectToBegin();
        ranges = ranges + harness.client.selectedRanges.length;
      }
      expect(ranges).assertEqual(30);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0009
     * @tc.name      testPreviewPressure_009
     * @tc.desc      Verify that sixty trigger sessions raise preview totals at each fifteen-session checkpoint.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_009 begin');
      let calls: number = 0;
      const batchTotals: number[] = [];
      for (let batch = 0; batch < 4; batch++) {
        for (let step = 0; step < 15; step++) {
          const harness: PreviewHarness = await createPreviewHarness('');
          typeSequence(harness, 'hel');
          calls = calls + harness.client.previewCalls.length;
        }
        batchTotals.push(calls);
      }

      expect(batchTotals.join('|')).assertEqual('15|30|45|60');
      expect(calls).assertEqual(60);
      expect(batchTotals.length).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0010
     * @tc.name      testPreviewPressure_010
     * @tc.desc      Verify that forty-five trigger-commit sessions finish in nine-session checkpoint batches.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_010 begin');
      let finishes: number = 0;
      const checkpoints: number[] = [];
      for (let round = 0; round < 45; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        typeSequence(harness, 'hel');
        InputHandler.getInstance().sendKeyFunction();
        finishes = finishes + harness.client.finishCount;
        if ((round + 1) % 9 === 0) {
          checkpoints.push(finishes);
        }
      }

      expect(checkpoints.join('|')).assertEqual('9|18|27|36|45');
      expect(finishes).assertEqual(45);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0011
     * @tc.name      testPreviewPressure_011
     * @tc.desc      Verify that twenty-four alternating sessions add three previews per six-session checkpoint.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_011 begin');
      let previews: number = 0;
      const checkpoints: number[] = [];
      for (let round = 0; round < 24; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        if (round % 2 === 0) {
          typeSequence(harness, 'hel');
        } else {
          typeSequence(harness, 'abc');
        }
        previews = previews + harness.client.previewCalls.length;
        if ((round + 1) % 6 === 0) {
          checkpoints.push(previews);
        }
      }

      expect(checkpoints.join('|')).assertEqual('3|6|9|12');
      expect(previews).assertEqual(12);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0012
     * @tc.name      testPreviewPressure_012
     * @tc.desc      Verify that thirty-six hidden trigger sessions raise the hide checkpoint every twelve sessions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_012 begin');
      let hides: number = 0;
      let finishes: number = 0;
      const checkpoints: number[] = [];
      for (let round = 0; round < 36; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        typeSequence(harness, 'hel');
        InputHandler.getInstance().hideKeyboardSelf();
        hides = hides + harness.keyboard.hideCount;
        finishes = finishes + harness.client.finishCount;
        if ((round + 1) % 12 === 0) {
          checkpoints.push(hides);
        }
      }

      expect(checkpoints.join('|')).assertEqual('12|24|36');
      expect(hides).assertEqual(36);
      expect(finishes).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0013
     * @tc.name      testPreviewPressure_013
     * @tc.desc      Verify that forty modular backward deletions distribute eight units into every residue bucket.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_013 begin');
      let records: number = 0;
      const unitsByResidue: number[] = [];
      for (let residue = 0; residue < 5; residue++) {
        let units: number = 0;
        for (let copy = 0; copy < 8; copy++) {
          const harness: PreviewHarness = await createPreviewHarness('');
          InputHandler.getInstance().deleteBackward(residue);
          records = records + harness.client.backwardLengths.length;
          units = units + harness.client.backwardLengths[0];
        }
        unitsByResidue.push(units);
      }

      expect(unitsByResidue.join('|')).assertEqual('0|8|16|24|32');
      expect(records).assertEqual(40);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0014
     * @tc.name      testPreviewPressure_014
     * @tc.desc      Verify that thirty sessions issuing both selections accumulate two ranges each per half run.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_014 begin');
      let ranges: number = 0;
      const halfTotals: number[] = [];
      for (let half = 0; half < 2; half++) {
        for (let step = 0; step < 15; step++) {
          const harness: PreviewHarness = await createPreviewHarness('');
          typeSequence(harness, 'hel');
          await InputHandler.getInstance().selectToBegin();
          await InputHandler.getInstance().selectToEnd();
          ranges = ranges + harness.client.selectedRanges.length;
        }
        halfTotals.push(ranges);
      }

      expect(halfTotals.join('|')).assertEqual('30|60');
      expect(ranges).assertEqual(60);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0015
     * @tc.name      testPreviewPressure_015
     * @tc.desc      Verify that twenty-one paste sessions reach action checkpoints at seven and fourteen.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_015 begin');
      let actions: number = 0;
      const checkpoints: number[] = [];
      let lastKind: inputMethodEngine.ExtendAction = inputMethodEngine.ExtendAction.CUT;
      for (let round = 0; round < 21; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
        actions = actions + harness.client.extendActions.length;
        lastKind = harness.client.extendActions[0];
        if ((round + 1) % 7 === 0) {
          checkpoints.push(actions);
        }
      }

      expect(checkpoints.join('|')).assertEqual('7|14|21');
      expect(lastKind).assertEqual(inputMethodEngine.ExtendAction.PASTE);
      expect(actions).assertEqual(21);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0016
     * @tc.name      testPreviewPressure_016
     * @tc.desc      Verify that eighteen unsupported sessions open previews at six-session checkpoints.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_016 begin');
      let calls: number = 0;
      const checkpoints: number[] = [];
      for (let round = 0; round < 18; round++) {
        const harness: PreviewHarness = await createPreviewHarness('', 0, 0, false);
        typeSequence(harness, 'hel');
        calls = calls + harness.client.previewCalls.length;
        if ((round + 1) % 6 === 0) {
          checkpoints.push(calls);
        }
      }

      expect(checkpoints.join('|')).assertEqual('6|12|18');
      expect(calls).assertEqual(18);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0017
     * @tc.name      testPreviewPressure_017
     * @tc.desc      Verify that fifty-four sessions split into eighteen previews, eighteen hides and eighteen plain runs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_017 begin');
      let previews: number = 0;
      let hides: number = 0;
      let finishes: number = 0;
      for (let round = 0; round < 54; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        const bucket: number = round % 3;
        if (bucket === 0) {
          typeSequence(harness, 'hel');
        } else if (bucket === 1) {
          InputHandler.getInstance().hideKeyboardSelf();
        } else {
          typeSequence(harness, 'abc');
        }
        previews = previews + harness.client.previewCalls.length;
        hides = hides + harness.keyboard.hideCount;
        finishes = finishes + harness.client.finishCount;
      }
      const split: number[] = [previews, hides, finishes];

      expect(split.join('|')).assertEqual('18|18|0');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0018
     * @tc.name      testPreviewPressure_018
     * @tc.desc      Verify that forty-five growing prefixes sum their preview starts to nine hundred ninety.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_018 begin');
      let prefix: string = '';
      let startSum: number = 0;
      let lastStart: number = -1;
      for (let round = 0; round < 45; round++) {
        const harness: PreviewHarness = await createPreviewHarness(prefix);
        typeSequence(harness, 'hel');
        startSum = startSum + harness.client.previewCalls[0].start;
        lastStart = harness.client.previewCalls[0].start;
        prefix = prefix + 'a';
      }

      expect(startSum).assertEqual(990);
      expect(lastStart).assertEqual(44);
      expect(prefix.length).assertEqual(45);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0019
     * @tc.name      testPreviewPressure_019
     * @tc.desc      Verify that thirty-two attaches accumulate private commands in eight-attach checkpoint batches.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_019 begin');
      let commands: number = 0;
      const checkpoints: number[] = [];
      for (let round = 0; round < 32; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        commands = commands + harness.client.privateCommandCount;
        if ((round + 1) % 8 === 0) {
          checkpoints.push(commands);
        }
      }

      expect(checkpoints.join('|')).assertEqual('8|16|24|32');
      expect(commands).assertEqual(32);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_019 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0020
     * @tc.name      testPreviewPressure_020
     * @tc.desc      Verify that twenty-eight attaches raise the attribute-query count at seven-attach checkpoints.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_020 begin');
      let queries: number = 0;
      const checkpoints: number[] = [];
      for (let round = 0; round < 28; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        queries = queries + harness.client.editorAttributeCount;
        if ((round + 1) % 7 === 0) {
          checkpoints.push(queries);
        }
      }

      expect(checkpoints.join('|')).assertEqual('7|14|21|28');
      expect(queries).assertEqual(28);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_020 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0021
     * @tc.name      testPreviewPressure_021
     * @tc.desc      Verify that twenty-five rejected finishes still accumulate one finish per session at three checkpoints.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_021 begin');
      let finishes: number = 0;
      const checkpoints: number[] = [];
      for (let round = 0; round < 25; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        harness.client.failFinish = true;
        typeSequence(harness, 'hel');
        InputHandler.getInstance().sendKeyFunction();
        finishes = finishes + harness.client.finishCount;
        if (round === 9 || round === 19 || round === 24) {
          checkpoints.push(finishes);
        }
      }

      expect(checkpoints.join('|')).assertEqual('10|20|25');
      expect(finishes).assertEqual(25);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_021 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0022
     * @tc.name      testPreviewPressure_022
     * @tc.desc      Verify that twenty rejected hides each count once while every preview remains open.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_022 begin');
      let hides: number = 0;
      let previews: number = 0;
      let finishes: number = 0;
      for (let round = 0; round < 20; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        harness.keyboard.failHide = true;
        typeSequence(harness, 'hel');
        InputHandler.getInstance().hideKeyboardSelf();
        hides = hides + harness.keyboard.hideCount;
        previews = previews + harness.client.previewCalls.length;
        finishes = finishes + harness.client.finishCount;
      }
      const totals: number[] = [hides, previews, finishes];

      expect(totals.join('|')).assertEqual('20|20|0');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_022 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0023
     * @tc.name      testPreviewPressure_023
     * @tc.desc      Verify that thirty-three preview sessions committing every third split into eleven finishes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_023 begin');
      let previews: number = 0;
      let finishes: number = 0;
      let commits: number = 0;
      for (let round = 0; round < 33; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        typeSequence(harness, 'hel');
        previews = previews + harness.client.previewCalls.length;
        if (round % 3 === 0) {
          InputHandler.getInstance().sendKeyFunction();
          finishes = finishes + harness.client.finishCount;
          commits = commits + 1;
        }
      }
      const split: number[] = [previews, commits, finishes];

      expect(split.join('|')).assertEqual('33|11|11');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_023 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0024
     * @tc.name      testPreviewPressure_024
     * @tc.desc      Verify that fifty plain sessions each forwarding a two-unit deletion produce no previews.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_024 begin');
      let previews: number = 0;
      let deletes: number = 0;
      const halfTotals: number[] = [];
      for (let half = 0; half < 2; half++) {
        for (let step = 0; step < 25; step++) {
          const harness: PreviewHarness = await createPreviewHarness('');
          typeSequence(harness, 'abc');
          InputHandler.getInstance().deleteForward(2);
          previews = previews + harness.client.previewCalls.length;
          deletes = deletes + harness.client.forwardLengths.length;
        }
        halfTotals.push(deletes);
      }

      expect(previews).assertEqual(0);
      expect(deletes).assertEqual(50);
      expect(halfTotals.join('|')).assertEqual('25|50');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_024 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0025
     * @tc.name      testPreviewPressure_025
     * @tc.desc      Verify that sixteen sessions typing the trigger twice accumulate two previews per four sessions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_025 begin');
      let calls: number = 0;
      const checkpoints: number[] = [];
      for (let round = 0; round < 16; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        typeSequence(harness, 'hel');
        typeSequence(harness, 'hel');
        calls = calls + harness.client.previewCalls.length;
        if ((round + 1) % 4 === 0) {
          checkpoints.push(calls);
        }
      }

      expect(checkpoints.join('|')).assertEqual('8|16|24|32');
      expect(calls).assertEqual(32);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_025 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0026
     * @tc.name      testPreviewPressure_026
     * @tc.desc      Verify that forty sessions hiding and committing keep three equal channels at two checkpoints.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_026 begin');
      let previews: number = 0;
      let hides: number = 0;
      let finishes: number = 0;
      const checkpoints: number[] = [];
      for (let round = 0; round < 40; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        typeSequence(harness, 'hel');
        InputHandler.getInstance().hideKeyboardSelf();
        InputHandler.getInstance().sendKeyFunction();
        previews = previews + harness.client.previewCalls.length;
        hides = hides + harness.keyboard.hideCount;
        finishes = finishes + harness.client.finishCount;
        if ((round + 1) % 20 === 0) {
          checkpoints.push(finishes);
        }
      }

      expect(previews).assertEqual(40);
      expect(hides).assertEqual(40);
      expect(finishes).assertEqual(40);
      expect(checkpoints.join('|')).assertEqual('20|40');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_026 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0027
     * @tc.name      testPreviewPressure_027
     * @tc.desc      Verify that twenty-six seeded editors each open one preview and finish with the same buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_027 begin');
      let calls: number = 0;
      let canonical: number = 0;
      const checkpoints: number[] = [];
      for (let round = 0; round < 26; round++) {
        const harness: PreviewHarness = await createPreviewHarness('he');
        InputHandler.getInstance().insertText('l');
        calls = calls + harness.client.previewCalls.length;
        if (harness.client.buffer === 'hello world') {
          canonical = canonical + 1;
        }
        if ((round + 1) % 13 === 0) {
          checkpoints.push(calls);
        }
      }

      expect(checkpoints.join('|')).assertEqual('13|26');
      expect(calls).assertEqual(26);
      expect(canonical).assertEqual(26);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_027 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0028
     * @tc.name      testPreviewPressure_028
     * @tc.desc      Verify that thirty diagnostic refreshes leave only the newest marker in the snapshot.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_028 begin');
      AppStorage.setOrCreate<string>('showLog', '');
      let queries: number = 0;
      const checkpoints: number[] = [];
      for (let round = 0; round < 30; round++) {
        const harness: PreviewHarness = await createPreviewHarness('abc');
        InputHandler.getInstance().setTextInfo('TXT-' + round.toString());
        InputHandler.getInstance().refreshInfo();
        queries = queries + harness.client.forwardQueries.length;
        if ((round + 1) % 10 === 0) {
          checkpoints.push(queries);
        }
      }
      const summary: string = AppStorage.get<string>('showLog') ?? '';

      expect(checkpoints.join('|')).assertEqual('10|20|30');
      expect(summary.indexOf('five chars:')).assertEqual(0);
      expect(queries).assertEqual(30);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_028 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0029
     * @tc.name      testPreviewPressure_029
     * @tc.desc      Verify that twenty-seven empty begin selections all anchor at the zero cursor in three batches.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_029 begin');
      InputHandler.getInstance().setCursorInfo({ x: 0, y: 0, height: 0 });
      let ranges: number = 0;
      let anchored: number = 0;
      const checkpoints: number[] = [];
      for (let round = 0; round < 27; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        await InputHandler.getInstance().selectToBegin();
        ranges = ranges + harness.client.selectedRanges.length;
        if (harness.client.selectedRanges[0].end === 0) {
          anchored = anchored + 1;
        }
        if ((round + 1) % 9 === 0) {
          checkpoints.push(ranges);
        }
      }

      expect(checkpoints.join('|')).assertEqual('9|18|27');
      expect(ranges).assertEqual(27);
      expect(anchored).assertEqual(27);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_029 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0030
     * @tc.name      testPreviewPressure_030
     * @tc.desc      Verify that forty-four three-command sessions raise a combined checkpoint every eleven sessions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_030 begin');
      let commands: number = 0;
      const checkpoints: number[] = [];
      for (let round = 0; round < 44; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        InputHandler.getInstance().insertText('a');
        InputHandler.getInstance().deleteBackward(1);
        InputHandler.getInstance().deleteForward(1);
        commands = commands + harness.client.insertedTexts.length +
          harness.client.backwardLengths.length + harness.client.forwardLengths.length;
        if ((round + 1) % 11 === 0) {
          checkpoints.push(commands);
        }
      }

      expect(checkpoints.join('|')).assertEqual('33|66|99|132');
      expect(commands).assertEqual(132);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_030 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0031
     * @tc.name      testPreviewPressure_031
     * @tc.desc      Verify that thirty-five patterned sessions republish patterns zero, one and two at seven-session checkpoints.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_031 begin');
      const observed: number[] = [];
      for (let round = 0; round < 35; round++) {
        await createPreviewHarness('', 0, round % 3);
        if ((round + 1) % 7 === 0) {
          const published: number = AppStorage.get<number>('inputPattern') ?? -1;
          observed.push(published);
        }
      }

      expect(observed.join('|')).assertEqual('0|1|2|0|1');
      expect(observed.length).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_031 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0032
     * @tc.name      testPreviewPressure_032
     * @tc.desc      Verify that twenty-two settled deferred sessions each commit once at eleven-session checkpoints.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_032 begin');
      let finishes: number = 0;
      let attributes: number = 0;
      const checkpoints: number[] = [];
      for (let round = 0; round < 22; round++) {
        const harness: PreviewHarness = await createPreviewHarness('', 0, 0, true, true);
        typeSequence(harness, 'hel');
        harness.client.resolveAttribute();
        await Promise.resolve();
        await Promise.resolve();
        InputHandler.getInstance().sendKeyFunction();
        finishes = finishes + harness.client.finishCount;
        attributes = attributes + harness.client.editorAttributeCount;
        if ((round + 1) % 11 === 0) {
          checkpoints.push(finishes);
        }
      }

      expect(checkpoints.join('|')).assertEqual('11|22');
      expect(finishes).assertEqual(22);
      expect(attributes).assertEqual(22);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_032 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0033
     * @tc.name      testPreviewPressure_033
     * @tc.desc      Verify that nineteen double-enter sessions accumulate two finishes each in one checkpointed run.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_033 begin');
      let finishes: number = 0;
      const checkpoints: number[] = [];
      for (let round = 0; round < 19; round++) {
        const harness: PreviewHarness = await createPreviewHarness('', 2);
        typeSequence(harness, 'hel');
        InputHandler.getInstance().sendKeyFunction();
        InputHandler.getInstance().sendKeyFunction();
        finishes = finishes + harness.client.finishCount;
        if (round === 9 || round === 18) {
          checkpoints.push(finishes);
        }
      }

      expect(checkpoints.join('|')).assertEqual('20|38');
      expect(finishes).assertEqual(38);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_033 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0034
     * @tc.name      testPreviewPressure_034
     * @tc.desc      Verify that fifty alternating paste and cut sessions split their actions evenly at one checkpoint.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_034 begin');
      let pastes: number = 0;
      let cuts: number = 0;
      let actions: number = 0;
      let midpoint: number = 0;
      for (let round = 0; round < 50; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        if (round % 2 === 0) {
          InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
          pastes = pastes + 1;
        } else {
          InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
          cuts = cuts + 1;
        }
        actions = actions + harness.client.extendActions.length;
        if (round === 24) {
          midpoint = actions;
        }
      }
      const split: number[] = [pastes, cuts, actions];

      expect(split.join('|')).assertEqual('25|25|50');
      expect(midpoint).assertEqual(25);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_034 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0035
     * @tc.name      testPreviewPressure_035
     * @tc.desc      Verify that twenty trigger-delete-commit sessions keep preview, deletion and finish equal.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_035 begin');
      let previews: number = 0;
      let deletes: number = 0;
      let finishes: number = 0;
      const checkpoints: number[] = [];
      for (let round = 0; round < 20; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        typeSequence(harness, 'hel');
        InputHandler.getInstance().deleteBackward(3);
        InputHandler.getInstance().sendKeyFunction();
        previews = previews + harness.client.previewCalls.length;
        deletes = deletes + harness.client.backwardLengths.length;
        finishes = finishes + harness.client.finishCount;
        if ((round + 1) % 10 === 0) {
          checkpoints.push(finishes);
        }
      }

      expect(previews).assertEqual(20);
      expect(deletes).assertEqual(20);
      expect(finishes).assertEqual(20);
      expect(checkpoints.join('|')).assertEqual('10|20');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_035 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0036
     * @tc.name      testPreviewPressure_036
     * @tc.desc      Verify that sixty-four plain sessions each end with the same two-character buffer in four batches.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_036 begin');
      let canonical: number = 0;
      let previews: number = 0;
      const checkpoints: number[] = [];
      for (let round = 0; round < 64; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        typeSequence(harness, 'ab');
        if (harness.client.buffer === 'ab') {
          canonical = canonical + 1;
        }
        previews = previews + harness.client.previewCalls.length;
        if ((round + 1) % 16 === 0) {
          checkpoints.push(round + 1);
        }
      }

      expect(canonical).assertEqual(64);
      expect(previews).assertEqual(0);
      expect(checkpoints.join('|')).assertEqual('16|32|48|64');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_036 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0037
     * @tc.name      testPreviewPressure_037
     * @tc.desc      Verify that twenty-nine begin-end pairs accumulate fifty-eight ranges with two range checkpoints.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_037 begin');
      let ranges: number = 0;
      const checkpoints: number[] = [];
      for (let round = 0; round < 29; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        await InputHandler.getInstance().moveCursorToBegin();
        await InputHandler.getInstance().moveCursorToEnd();
        ranges = ranges + harness.client.selectedRanges.length;
        if (round === 9 || round === 19 || round === 28) {
          checkpoints.push(ranges);
        }
      }

      expect(checkpoints.join('|')).assertEqual('20|40|58');
      expect(ranges).assertEqual(58);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_037 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0038
     * @tc.name      testPreviewPressure_038
     * @tc.desc      Verify that thirty-one unsupported sessions closed by hides total thirty-one previews and hides.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_038 begin');
      let previews: number = 0;
      let hides: number = 0;
      for (let round = 0; round < 31; round++) {
        const harness: PreviewHarness = await createPreviewHarness('', 0, 0, false);
        typeSequence(harness, 'hel');
        InputHandler.getInstance().hideKeyboardSelf();
        previews = previews + harness.client.previewCalls.length;
        hides = hides + harness.keyboard.hideCount;
      }
      const channels: number[] = [previews, hides];

      expect(channels.join('|')).assertEqual('31|31');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_038 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0039
     * @tc.name      testPreviewPressure_039
     * @tc.desc      Verify that twenty-three rejected private commands leave the preview channel at twenty-three.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_039 begin');
      let commands: number = 0;
      let previews: number = 0;
      for (let round = 0; round < 23; round++) {
        const harness: PreviewHarness = await createPreviewHarness('', 0, 0, false, false, true);
        typeSequence(harness, 'hel');
        commands = commands + harness.client.privateCommandCount;
        previews = previews + harness.client.previewCalls.length;
      }
      const totals: number[] = [commands, previews];

      expect(totals.join('|')).assertEqual('23|23');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_039 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0040
     * @tc.name      testPreviewPressure_040
     * @tc.desc      Verify that of thirty-nine sessions only every fifth opens a preview, growing one by one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_040 begin');
      const progression: number[] = [];
      let buffers: number = 0;
      for (let round = 0; round < 39; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        typeSequence(harness, 'hel');
        if (round % 5 === 0) {
          progression.push(harness.client.previewCalls.length);
          if (harness.client.buffer === 'hello world') {
            buffers = buffers + 1;
          }
        }
      }

      expect(progression.length).assertEqual(8);
      expect(progression.join('')).assertEqual('11111111');
      expect(buffers).assertEqual(8);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_040 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0041
     * @tc.name      testPreviewPressure_041
     * @tc.desc      Verify that forty-eight zero backward deletions preserve two-character buffers across two unequal batches.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_041 begin');
      let records: number = 0;
      let preserved: number = 0;
      const batchSizes: number[] = [20, 28];
      const checkpoint: number[] = [];
      for (let batch = 0; batch < batchSizes.length; batch++) {
        for (let step = 0; step < batchSizes[batch]; step++) {
          const harness: PreviewHarness = await createPreviewHarness('xy');
          InputHandler.getInstance().deleteBackward(0);
          records = records + harness.client.backwardLengths.length;
          if (harness.client.backwardLengths[0] === 0 && harness.client.buffer === 'xy') {
            preserved = preserved + 1;
          }
        }
        checkpoint.push(records);
      }

      expect(records).assertEqual(48);
      expect(preserved).assertEqual(48);
      expect(checkpoint.join('|')).assertEqual('20|48');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_041 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0042
     * @tc.name      testPreviewPressure_042
     * @tc.desc      Verify that forty mixed insertion sessions reach thirty commands at the halfway checkpoint and sixty at the end.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_042 begin');
      let inserted: number = 0;
      let doubleBuffers: number = 0;
      let singleBuffers: number = 0;
      let midpoint: number = 0;
      for (let round = 0; round < 40; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        if (round % 2 === 0) {
          InputHandler.getInstance().insertText('p');
          InputHandler.getInstance().insertText('q');
        } else {
          InputHandler.getInstance().insertText('r');
        }
        inserted = inserted + harness.client.insertedTexts.length;
        if (harness.client.buffer === 'pq') {
          doubleBuffers = doubleBuffers + 1;
        } else if (harness.client.buffer === 'r') {
          singleBuffers = singleBuffers + 1;
        }
        if (round === 19) {
          midpoint = inserted;
        }
      }
      const totals: number[] = [inserted, doubleBuffers, singleBuffers, midpoint];

      expect(totals.join('|')).assertEqual('60|20|20|30');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_042 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0043
     * @tc.name      testPreviewPressure_043
     * @tc.desc      Verify that twenty-eight alternating trigger and delete sessions keep both channels at fourteen.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_043 begin');
      let previews: number = 0;
      let deletes: number = 0;
      let midway: string = '';
      for (let round = 0; round < 28; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        if (round % 2 === 0) {
          typeSequence(harness, 'hel');
          previews = previews + harness.client.previewCalls.length;
        } else {
          InputHandler.getInstance().deleteForward(1);
          deletes = deletes + harness.client.forwardLengths.length;
        }
        if (round === 13) {
          midway = previews.toString() + ':' + deletes.toString();
        }
      }
      const split: number[] = [previews, deletes];

      expect(split.join('|')).assertEqual('14|14');
      expect(midway).assertEqual('7:7');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_043 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0044
     * @tc.name      testPreviewPressure_044
     * @tc.desc      Verify that thirty-three sessions committing every sixth end with six evenly spaced commits.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_044 begin');
      const committedAt: number[] = [];
      let finishes: number = 0;
      let ranges: number = 0;
      for (let round = 0; round < 33; round++) {
        const harness: PreviewHarness = await createPreviewHarness('', 0);
        await InputHandler.getInstance().selectToBegin();
        ranges = ranges + harness.client.selectedRanges.length;
        if (round % 6 === 0) {
          InputHandler.getInstance().sendKeyFunction();
          finishes = finishes + harness.client.finishCount;
          committedAt.push(round);
        }
      }

      expect(committedAt.join('|')).assertEqual('0|6|12|18|24|30');
      expect(finishes).assertEqual(6);
      expect(ranges).assertEqual(33);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_044 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PRESSURE_0045
     * @tc.name      testPreviewPressure_045
     * @tc.desc      Verify that forty hide-and-paste sessions keep both channels equal with no preview opened.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewPressure_045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_045 begin');
      let hides: number = 0;
      let actions: number = 0;
      let previews: number = 0;
      let midway: string = '';
      for (let round = 0; round < 40; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        InputHandler.getInstance().hideKeyboardSelf();
        InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
        hides = hides + harness.keyboard.hideCount;
        actions = actions + harness.client.extendActions.length;
        previews = previews + harness.client.previewCalls.length;
        if (round === 19) {
          midway = hides.toString() + ':' + actions.toString();
        }
      }
      const totals: number[] = [hides, actions, previews];

      expect(totals.join('|')).assertEqual('40|40|0');
      expect(midway).assertEqual('20:20');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPressure_045 end');
      await yieldToEventLoop();
    });

  });
}
