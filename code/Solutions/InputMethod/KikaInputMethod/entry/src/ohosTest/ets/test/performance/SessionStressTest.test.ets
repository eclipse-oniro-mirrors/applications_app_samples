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
import { PreviewHarness, createPreviewHarness } from '../support/PreviewHarness';
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodSessionStress]';

export default function sessionStressTest(): void {
  describe('SessionStressTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0001
     * @tc.name      testSessionStress_001
     * @tc.desc      Verify that five attaches of four insertions total twenty editor calls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_001 begin');
      let sessionIndex: number = 0;
      const lengths: number[] = [];
      while (sessionIndex < 5) {
        const harness: PreviewHarness = await createPreviewHarness('', sessionIndex);
        let typed: number = 0;
        while (typed < 4) {
          InputHandler.getInstance().insertText('v');
          typed = typed + 1;
        }
        lengths.push(harness.client.buffer.length);
        sessionIndex = sessionIndex + 1;
      }
      expect(lengths.join('|')).assertEqual('4|4|4|4|4');
      expect(lengths.length * 4).assertEqual(20);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0002
     * @tc.name      testSessionStress_002
     * @tc.desc      Verify that eleven attaches each keep one distinct buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_002 begin');
      let total: number = 0;
      const seen: Set<string> = new Set<string>();
      for (let i = 0; i < 11; i++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        InputHandler.getInstance().insertText(String.fromCharCode(107 + i));
        total = total + harness.client.insertedTexts.length;
        seen.add(harness.client.buffer);
      }
      expect(total).assertEqual(11);
      expect(seen.size).assertEqual(11);
      expect(seen.has('o')).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0003
     * @tc.name      testSessionStress_003
     * @tc.desc      Verify that thirty-one attach cycles each add exactly one buffer unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_003 begin');
      let units: number = 0;
      for (let i = 0; i < 31; i++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        InputHandler.getInstance().insertText('c');
        units = units + harness.client.buffer.length;
      }
      expect(units).assertEqual(31);
      expect(units % 2).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0004
     * @tc.name      testSessionStress_004
     * @tc.desc      Verify that nineteen two-insert attaches total thirty-eight commands.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_004 begin');
      let total: number = 0;
      for (let i = 0; i < 19; i++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        InputHandler.getInstance().insertText('x');
        InputHandler.getInstance().insertText('y');
        total = total + harness.client.insertedTexts.length;
      }
      expect(total).assertEqual(38);
      expect(total / 19).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0005
     * @tc.name      testSessionStress_005
     * @tc.desc      Verify that thirteen alternating sessions split seven enter and six hide calls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_005 begin');
      const outcomes: boolean[] = [];
      for (let i = 0; i < 13; i++) {
        const harness: PreviewHarness = await createPreviewHarness('', i);
        if (i % 2 === 0) {
          InputHandler.getInstance().sendKeyFunction();
          outcomes.push(harness.client.finishCount === 1);
        } else {
          InputHandler.getInstance().hideKeyboardSelf();
          outcomes.push(harness.keyboard.hideCount === 1);
        }
      }
      let satisfied: number = 0;
      for (let i = 0; i < outcomes.length; i++) {
        if (outcomes[i]) {
          satisfied = satisfied + 1;
        }
      }
      expect(outcomes.length).assertEqual(13);
      expect(satisfied).assertEqual(13);
      expect(outcomes[0] && outcomes[1]).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0006
     * @tc.name      testSessionStress_006
     * @tc.desc      Verify that seven switches record odd forward deletion lengths.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_006 begin');
      const sessions: PreviewHarness[] = [];
      for (let i = 0; i < 7; i++) {
        sessions.push(await createPreviewHarness(''));
        InputHandler.getInstance().deleteForward(i * 2 + 1);
      }
      expect(sessions[0].client.forwardLengths.join('')).assertEqual('1');
      expect(sessions[6].client.forwardLengths.join('')).assertEqual('13');
      let odd: number = 0;
      for (let i = 0; i < sessions.length; i++) {
        if (sessions[i].client.forwardLengths[0] % 2 === 1) {
          odd = odd + 1;
        }
      }
      expect(odd).assertEqual(7);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0007
     * @tc.name      testSessionStress_007
     * @tc.desc      Verify that twenty-five zero backward deletions leave every buffer empty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_007 begin');
      let zeros: number = 0;
      for (let i = 0; i < 25; i++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        InputHandler.getInstance().deleteBackward(0);
        zeros = zeros + harness.client.backwardLengths.length;
        expect(harness.client.buffer).assertEqual('');
      }
      expect(zeros).assertEqual(25);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0008
     * @tc.name      testSessionStress_008
     * @tc.desc      Verify that four sessions of four inserts and four deletions total thirty-two calls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_008 begin');
      let calls: number = 0;
      for (let session = 0; session < 4; session++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        for (let i = 0; i < 4; i++) {
          InputHandler.getInstance().insertText('w');
          InputHandler.getInstance().deleteBackward(i);
        }
        calls = calls + harness.client.insertedTexts.length + harness.client.backwardLengths.length;
      }
      expect(calls).assertEqual(32);
      expect(calls / 4).assertEqual(8);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0009
     * @tc.name      testSessionStress_009
     * @tc.desc      Verify that twelve attaches accept one increasing letter each and spell the full alphabet run.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_009 begin');
      const buffers: string[] = [];
      let inserted: number = 0;
      for (let round = 0; round < 12; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        InputHandler.getInstance().insertText(String.fromCharCode(97 + round));
        buffers.push(harness.client.buffer);
        inserted = inserted + harness.client.insertedTexts.length;
      }

      expect(buffers.join('')).assertEqual('abcdefghijkl');
      expect(inserted).assertEqual(12);
      expect(buffers.length).assertEqual(12);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0010
     * @tc.name      testSessionStress_010
     * @tc.desc      Verify that sixteen alternating insert-delete attaches raise both channels by two per four sessions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_010 begin');
      let inserts: number = 0;
      let deletes: number = 0;
      const checkpoints: string[] = [];
      for (let round = 0; round < 16; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        if (round % 2 === 0) {
          InputHandler.getInstance().insertText('t');
          inserts = inserts + harness.client.insertedTexts.length;
        } else {
          InputHandler.getInstance().deleteBackward(1);
          deletes = deletes + harness.client.backwardLengths.length;
        }
        if ((round + 1) % 4 === 0) {
          checkpoints.push(inserts.toString() + ':' + deletes.toString());
        }
      }

      expect(checkpoints.join('|')).assertEqual('2:2|4:4|6:6|8:8');
      expect(inserts + deletes).assertEqual(16);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0011
     * @tc.name      testSessionStress_011
     * @tc.desc      Verify that fourteen insert-and-caret attaches keep insertion and caret-move channels equal.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_011 begin');
      let inserts: number = 0;
      let moves: number = 0;
      let ranges: number = 0;
      let halfway: number = 0;
      for (let round = 0; round < 14; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        InputHandler.getInstance().insertText('d');
        InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
        inserts = inserts + harness.client.insertedTexts.length;
        moves = moves + harness.client.movedDirections.length;
        ranges = ranges + harness.client.selectedRanges.length;
        if (round === 6) {
          halfway = moves;
        }
      }
      const channels: number[] = [inserts, moves, ranges];

      expect(channels.join('|')).assertEqual('14|14|0');
      expect(halfway).assertEqual(7);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0012
     * @tc.name      testSessionStress_012
     * @tc.desc      Verify that nine alternating enter-hide sessions split five commits and four hides at three checkpoints.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_012 begin');
      let finishes: number = 0;
      let hides: number = 0;
      const checkpoints: string[] = [];
      for (let round = 0; round < 9; round++) {
        const harness: PreviewHarness = await createPreviewHarness('', round);
        if (round % 2 === 0) {
          InputHandler.getInstance().sendKeyFunction();
          finishes = finishes + harness.client.finishCount;
        } else {
          InputHandler.getInstance().hideKeyboardSelf();
          hides = hides + harness.keyboard.hideCount;
        }
        if ((round + 1) % 3 === 0) {
          checkpoints.push(finishes.toString() + ':' + hides.toString());
        }
      }

      expect(checkpoints.join('|')).assertEqual('2:1|3:3|5:4');
      expect(finishes).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0013
     * @tc.name      testSessionStress_013
     * @tc.desc      Verify that twenty re-attach cycles each collect two insertions on their single client.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_013 begin');
      let doubled: number = 0;
      for (let round = 0; round < 20; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        InputHandler.getInstance().insertText('p');
        InputHandler.getInstance().onInputStart(
          harness.keyboard as object as inputMethodEngine.KeyboardController,
          harness.client as object as inputMethodEngine.InputClient);
        await Promise.resolve();
        await Promise.resolve();
        InputHandler.getInstance().insertText('q');
        if (harness.client.insertedTexts.length === 2 && harness.client.buffer === 'pq') {
          doubled = doubled + 1;
        }
      }

      expect(doubled).assertEqual(20);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0014
     * @tc.name      testSessionStress_014
     * @tc.desc      Verify that fifteen attaches with distinct enter types forward their own type when committed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_014 begin');
      const recorded: number[] = [];
      let finishes: number = 0;
      for (let round = 0; round < 15; round++) {
        const harness: PreviewHarness = await createPreviewHarness('', round);
        InputHandler.getInstance().sendKeyFunction();
        recorded.push(harness.client.keyFunctions[0]);
        finishes = finishes + harness.client.finishCount;
      }

      expect(recorded[0]).assertEqual(0);
      expect(recorded[7]).assertEqual(7);
      expect(recorded[14]).assertEqual(14);
      expect(finishes).assertEqual(15);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0015
     * @tc.name      testSessionStress_015
     * @tc.desc      Verify that thirteen attaches with growing seed text report buffer lengths summing to seventy-eight.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_015 begin');
      const lengths: number[] = [];
      let sum: number = 0;
      for (let round = 0; round < 13; round++) {
        let seed: string = '';
        for (let unit = 0; unit < round; unit++) {
          seed = seed + 'x';
        }
        const harness: PreviewHarness = await createPreviewHarness(seed);
        lengths.push(harness.client.buffer.length);
        sum = sum + harness.client.buffer.length;
      }

      expect(sum).assertEqual(78);
      expect(lengths[0]).assertEqual(0);
      expect(lengths[12]).assertEqual(12);
      expect(lengths.length).assertEqual(13);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0016
     * @tc.name      testSessionStress_016
     * @tc.desc      Verify that seventeen double-hide attaches accumulate hides in one and two unit checkpoints.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_016 begin');
      let hides: number = 0;
      const checkpoints: number[] = [];
      for (let round = 0; round < 17; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        InputHandler.getInstance().hideKeyboardSelf();
        InputHandler.getInstance().hideKeyboardSelf();
        hides = hides + harness.keyboard.hideCount;
        if (round === 7) {
          checkpoints.push(hides);
        }
      }
      checkpoints.push(hides);

      expect(checkpoints.join('|')).assertEqual('16|34');
      expect(hides).assertEqual(34);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0017
     * @tc.name      testSessionStress_017
     * @tc.desc      Verify that ten attaches with two ordered insertions all end with the same pair buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_017 begin');
      let canonical: number = 0;
      let inserted: number = 0;
      for (let round = 0; round < 10; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        InputHandler.getInstance().insertText('a');
        InputHandler.getInstance().insertText('b');
        if (harness.client.buffer === 'ab') {
          canonical = canonical + 1;
        }
        inserted = inserted + harness.client.insertedTexts.length;
      }

      expect(canonical).assertEqual(10);
      expect(inserted).assertEqual(20);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0018
     * @tc.name      testSessionStress_018
     * @tc.desc      Verify that twenty-six zero backward deletions leave every record at zero and every buffer empty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_018 begin');
      let records: number = 0;
      let emptyBuffers: number = 0;
      for (let round = 0; round < 26; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        InputHandler.getInstance().deleteBackward(0);
        records = records + harness.client.backwardLengths.length;
        if (harness.client.backwardLengths[0] === 0 && harness.client.buffer === '') {
          emptyBuffers = emptyBuffers + 1;
        }
      }

      expect(records).assertEqual(26);
      expect(emptyBuffers).assertEqual(26);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0019
     * @tc.name      testSessionStress_019
     * @tc.desc      Verify that eighteen increasing forward deletions sum to one hundred seventy-one in two checkpoints.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_019 begin');
      let sum: number = 0;
      let ninth: number = 0;
      let halfway: number = 0;
      for (let round = 0; round < 18; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        InputHandler.getInstance().deleteForward(round + 1);
        sum = sum + harness.client.forwardLengths[0];
        if (round === 8) {
          ninth = harness.client.forwardLengths[0];
          halfway = sum;
        }
      }

      expect(ninth).assertEqual(9);
      expect(halfway).assertEqual(45);
      expect(sum).assertEqual(171);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_019 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0020
     * @tc.name      testSessionStress_020
     * @tc.desc      Verify that twelve alternating begin and end selections record fixed zero and thousand endpoints.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_020 begin');
      InputHandler.getInstance().setCursorInfo({ x: 0, y: 0, height: 0 });
      const ends: number[] = [];
      for (let round = 0; round < 12; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        if (round % 2 === 0) {
          await InputHandler.getInstance().selectToBegin();
        } else {
          await InputHandler.getInstance().selectToEnd();
        }
        ends.push(harness.client.selectedRanges[0].end);
      }

      expect(ends.join('|')).assertEqual('0|1000|0|1000|0|1000|0|1000|0|1000|0|1000');
      expect(ends.length).assertEqual(12);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_020 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0021
     * @tc.name      testSessionStress_021
     * @tc.desc      Verify that twenty-four insert-delete attaches keep the insertion and deletion channels equal.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_021 begin');
      let inserts: number = 0;
      let deletes: number = 0;
      let aligned: number = 0;
      for (let round = 0; round < 24; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        InputHandler.getInstance().insertText('m');
        InputHandler.getInstance().deleteBackward(1);
        inserts = inserts + harness.client.insertedTexts.length;
        deletes = deletes + harness.client.backwardLengths.length;
        if (harness.client.insertedTexts.length === harness.client.backwardLengths.length) {
          aligned = aligned + 1;
        }
      }

      expect(aligned).assertEqual(24);
      expect(inserts).assertEqual(24);
      expect(deletes).assertEqual(24);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_021 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0022
     * @tc.name      testSessionStress_022
     * @tc.desc      Verify that eight three-command attaches each record one insertion, one range and one commit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_022 begin');
      let inserts: number = 0;
      let ranges: number = 0;
      let finishes: number = 0;
      for (let round = 0; round < 8; round++) {
        const harness: PreviewHarness = await createPreviewHarness('', round);
        InputHandler.getInstance().insertText('g');
        await InputHandler.getInstance().selectToBegin();
        InputHandler.getInstance().sendKeyFunction();
        inserts = inserts + harness.client.insertedTexts.length;
        ranges = ranges + harness.client.selectedRanges.length;
        finishes = finishes + harness.client.finishCount;
      }
      const totals: number[] = [inserts, ranges, finishes];

      expect(totals.join('|')).assertEqual('8|8|8');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_022 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0023
     * @tc.name      testSessionStress_023
     * @tc.desc      Verify that eleven private-command-fault attaches still accept their single typed character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_023 begin');
      let commands: number = 0;
      let edited: number = 0;
      let previews: number = 0;
      for (let round = 0; round < 11; round++) {
        const harness: PreviewHarness = await createPreviewHarness('', 0, 0, true, false, true);
        InputHandler.getInstance().insertText('x');
        commands = commands + harness.client.privateCommandCount;
        if (harness.client.buffer === 'x') {
          edited = edited + 1;
        }
        previews = previews + harness.client.previewCalls.length;
      }

      expect(commands).assertEqual(11);
      expect(edited).assertEqual(11);
      expect(previews).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_023 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0024
     * @tc.name      testSessionStress_024
     * @tc.desc      Verify that seven double-enter attaches each count two finishes on their own client.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_024 begin');
      let finishes: number = 0;
      let doubled: number = 0;
      for (let round = 0; round < 7; round++) {
        const harness: PreviewHarness = await createPreviewHarness('', 3);
        InputHandler.getInstance().sendKeyFunction();
        InputHandler.getInstance().sendKeyFunction();
        finishes = finishes + harness.client.finishCount;
        if (harness.client.finishCount === 2) {
          doubled = doubled + 1;
        }
      }

      expect(finishes).assertEqual(14);
      expect(doubled).assertEqual(7);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_024 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0025
     * @tc.name      testSessionStress_025
     * @tc.desc      Verify that fifteen patterned attaches publish their own input pattern at three sampled sessions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_025 begin');
      const sampled: number[] = [];
      for (let round = 0; round < 15; round++) {
        await createPreviewHarness('', 0, round);
        if (round === 0 || round === 7 || round === 14) {
          const published: number = AppStorage.get<number>('inputPattern') ?? -1;
          sampled.push(published);
        }
      }

      expect(sampled.join('|')).assertEqual('0|7|14');
      expect(sampled.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_025 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0026
     * @tc.name      testSessionStress_026
     * @tc.desc      Verify that nineteen attaches split into two opposite buffer groups of ten and nine.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_026 begin');
      const seen: Set<string> = new Set<string>();
      let firstBuffer: string = 'unset';
      let lastBuffer: string = 'unset';
      for (let round = 0; round < 19; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        const letter: string = round < 10 ? 'a' : 'b';
        InputHandler.getInstance().insertText(letter);
        seen.add(harness.client.buffer);
        if (round === 0) {
          firstBuffer = harness.client.buffer;
        }
        if (round === 18) {
          lastBuffer = harness.client.buffer;
        }
      }

      expect(seen.size).assertEqual(2);
      expect(firstBuffer).assertEqual('a');
      expect(lastBuffer).assertEqual('b');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_026 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0027
     * @tc.name      testSessionStress_027
     * @tc.desc      Verify that six five-insert attaches reach thirty commands at ten-command checkpoints.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_027 begin');
      let commands: number = 0;
      let fullBuffers: number = 0;
      const checkpoints: number[] = [];
      for (let round = 0; round < 6; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        for (let unit = 0; unit < 5; unit++) {
          InputHandler.getInstance().insertText('k');
          commands = commands + 1;
        }
        if (harness.client.buffer.length === 5) {
          fullBuffers = fullBuffers + 1;
        }
        if (commands === 10 || commands === 20 || commands === 30) {
          checkpoints.push(commands);
        }
      }

      expect(checkpoints.join('|')).assertEqual('10|20|30');
      expect(commands).assertEqual(30);
      expect(fullBuffers).assertEqual(6);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_027 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0028
     * @tc.name      testSessionStress_028
     * @tc.desc      Verify that twenty-one alternating forward and backward deletions split eleven against ten.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_028 begin');
      let forwards: number = 0;
      let backwards: number = 0;
      let midway: string = '';
      for (let round = 0; round < 21; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        if (round % 2 === 0) {
          InputHandler.getInstance().deleteForward(round + 1);
          forwards = forwards + harness.client.forwardLengths.length;
        } else {
          InputHandler.getInstance().deleteBackward(round + 1);
          backwards = backwards + harness.client.backwardLengths.length;
        }
        if (round === 9) {
          midway = forwards.toString() + ':' + backwards.toString();
        }
      }
      const split: number[] = [forwards, backwards];

      expect(split.join('|')).assertEqual('11|10');
      expect(midway).assertEqual('5:5');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_028 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0029
     * @tc.name      testSessionStress_029
     * @tc.desc      Verify that nine paste attaches each record one paste on a fresh editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_029 begin');
      let actions: number = 0;
      let pastes: number = 0;
      const laterKinds: inputMethodEngine.ExtendAction[] = [];
      for (let round = 0; round < 9; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
        actions = actions + harness.client.extendActions.length;
        if (harness.client.extendActions[0] === inputMethodEngine.ExtendAction.PASTE) {
          pastes = pastes + 1;
        }
        if (round === 2 || round === 5 || round === 8) {
          laterKinds.push(harness.client.extendActions[0]);
        }
      }

      expect(actions).assertEqual(9);
      expect(pastes).assertEqual(9);
      expect(laterKinds.length).assertEqual(3);
      expect(laterKinds[2]).assertEqual(inputMethodEngine.ExtendAction.PASTE);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_029 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0030
     * @tc.name      testSessionStress_030
     * @tc.desc      Verify that twelve three-insert attaches accumulate commands at twelve, twenty-four and thirty-six.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_030 begin');
      let commands: number = 0;
      const checkpoints: number[] = [];
      for (let round = 0; round < 12; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        for (let unit = 0; unit < 3; unit++) {
          InputHandler.getInstance().insertText('n');
          commands = commands + 1;
        }
        if (round === 3 || round === 7 || round === 11) {
          checkpoints.push(commands);
        }
      }

      expect(checkpoints.join('|')).assertEqual('12|24|36');
      expect(commands).assertEqual(36);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_030 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0031
     * @tc.name      testSessionStress_031
     * @tc.desc      Verify that thirteen descending enter types are forwarded from twelve down to zero in request order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_031 begin');
      const recorded: number[] = [];
      let finishes: number = 0;
      for (let round = 0; round < 13; round++) {
        const harness: PreviewHarness = await createPreviewHarness('', 12 - round);
        InputHandler.getInstance().sendKeyFunction();
        recorded.push(harness.client.keyFunctions[0]);
        finishes = finishes + harness.client.finishCount;
      }

      expect(recorded.join('|')).assertEqual('12|11|10|9|8|7|6|5|4|3|2|1|0');
      expect(finishes).assertEqual(13);
      expect(recorded[0]).assertEqual(12);
      expect(recorded[12]).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_031 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0032
     * @tc.name      testSessionStress_032
     * @tc.desc      Verify that five four-command attaches keep insertion, deletion, range and finish channels equal.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_032 begin');
      let inserts: number = 0;
      let deletes: number = 0;
      let ranges: number = 0;
      let finishes: number = 0;
      for (let round = 0; round < 5; round++) {
        const harness: PreviewHarness = await createPreviewHarness('', round);
        InputHandler.getInstance().insertText('s');
        InputHandler.getInstance().deleteBackward(2);
        await InputHandler.getInstance().selectToEnd();
        InputHandler.getInstance().sendKeyFunction();
        inserts = inserts + harness.client.insertedTexts.length;
        deletes = deletes + harness.client.backwardLengths.length;
        ranges = ranges + harness.client.selectedRanges.length;
        finishes = finishes + harness.client.finishCount;
      }
      const totals: number[] = [inserts, deletes, ranges, finishes];

      expect(totals.join('|')).assertEqual('5|5|5|5');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_032 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0033
     * @tc.name      testSessionStress_033
     * @tc.desc      Verify that fifteen seeded attaches accepting a two-character completion each open one preview.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_033 begin');
      let previews: number = 0;
      let canonical: number = 0;
      const checkpoints: number[] = [];
      for (let round = 0; round < 15; round++) {
        const harness: PreviewHarness = await createPreviewHarness('he');
        InputHandler.getInstance().insertText('lo');
        previews = previews + harness.client.previewCalls.length;
        if (harness.client.buffer === 'hello world') {
          canonical = canonical + 1;
        }
        if ((round + 1) % 5 === 0) {
          checkpoints.push(previews);
        }
      }

      expect(checkpoints.join('|')).assertEqual('5|10|15');
      expect(previews).assertEqual(15);
      expect(canonical).assertEqual(15);
      expect(checkpoints[2]).assertEqual(15);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_033 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0034
     * @tc.name      testSessionStress_034
     * @tc.desc      Verify that ten refreshed attaches leave the last diagnostic marker in the snapshot.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_034 begin');
      AppStorage.setOrCreate<string>('showLog', '');
      let queries: number = 0;
      for (let round = 0; round < 10; round++) {
        const harness: PreviewHarness = await createPreviewHarness('w');
        InputHandler.getInstance().setTextInfo('TXT-' + round.toString());
        InputHandler.getInstance().refreshInfo();
        queries = queries + harness.client.forwardQueries.length;
      }
      const summary: string = AppStorage.get<string>('showLog') ?? '';

      expect(queries).assertEqual(10);
      expect(summary.indexOf('before：[w]') >= 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_034 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0035
     * @tc.name      testSessionStress_035
     * @tc.desc      Verify that twenty-two hide-then-enter attaches keep both channels equal at the halfway point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_035 begin');
      let hides: number = 0;
      let finishes: number = 0;
      let halfway: string = '';
      for (let round = 0; round < 22; round++) {
        const harness: PreviewHarness = await createPreviewHarness('', 1);
        InputHandler.getInstance().hideKeyboardSelf();
        InputHandler.getInstance().sendKeyFunction();
        hides = hides + harness.keyboard.hideCount;
        finishes = finishes + harness.client.finishCount;
        if (round === 10) {
          halfway = hides.toString() + ':' + finishes.toString();
        }
      }

      expect(halfway).assertEqual('11:11');
      expect(hides).assertEqual(22);
      expect(finishes).assertEqual(22);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_035 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0036
     * @tc.name      testSessionStress_036
     * @tc.desc      Verify that eighteen commits issued before an insertion still leave one trailing character each.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_036 begin');
      let finishes: number = 0;
      let canonical: number = 0;
      let keys: number = 0;
      for (let round = 0; round < 18; round++) {
        const harness: PreviewHarness = await createPreviewHarness('', round % 4);
        InputHandler.getInstance().sendKeyFunction();
        InputHandler.getInstance().insertText('z');
        finishes = finishes + harness.client.finishCount;
        keys = keys + harness.client.keyFunctions.length;
        if (harness.client.buffer === 'z') {
          canonical = canonical + 1;
        }
      }
      const totals: number[] = [finishes, keys, canonical];

      expect(totals.join('|')).assertEqual('18|18|18');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_036 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0037
     * @tc.name      testSessionStress_037
     * @tc.desc      Verify that eight attaches each record their own increasing backward deletion length.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_037 begin');
      const lengths: number[] = [];
      let matched: number = 0;
      for (let round = 0; round < 8; round++) {
        const harness: PreviewHarness = await createPreviewHarness('seed');
        InputHandler.getInstance().deleteBackward(round);
        lengths.push(harness.client.backwardLengths[0]);
        if (harness.client.backwardLengths.length === 1 && harness.client.backwardLengths[0] === round) {
          matched = matched + 1;
        }
      }

      expect(lengths.join('|')).assertEqual('0|1|2|3|4|5|6|7');
      expect(matched).assertEqual(8);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_037 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0038
     * @tc.name      testSessionStress_038
     * @tc.desc      Verify that twenty-five empty attaches each query one attribute, send one command and stay empty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_038 begin');
      let attributes: number = 0;
      let commands: number = 0;
      let empty: number = 0;
      for (let round = 0; round < 25; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        attributes = attributes + harness.client.editorAttributeCount;
        commands = commands + harness.client.privateCommandCount;
        if (harness.client.buffer === '' && harness.client.insertedTexts.length === 0) {
          empty = empty + 1;
        }
      }
      const totals: number[] = [attributes, commands, empty];

      expect(totals.join('|')).assertEqual('25|25|25');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_038 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0039
     * @tc.name      testSessionStress_039
     * @tc.desc      Verify that fourteen one-insert sessions requesting both selection ends produce twice as many ranges.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_039 begin');
      InputHandler.getInstance().setCursorInfo({ x: 0, y: 0, height: 0 });
      let inserts: number = 0;
      let ranges: number = 0;
      let doubled: number = 0;
      for (let round = 0; round < 14; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        InputHandler.getInstance().insertText('v');
        await InputHandler.getInstance().selectToBegin();
        await InputHandler.getInstance().selectToEnd();
        inserts = inserts + harness.client.insertedTexts.length;
        ranges = ranges + harness.client.selectedRanges.length;
        if (harness.client.selectedRanges.length === 2) {
          doubled = doubled + 1;
        }
      }

      expect(inserts).assertEqual(14);
      expect(ranges).assertEqual(28);
      expect(doubled).assertEqual(14);
      expect(ranges).assertEqual(inserts * 2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_039 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0040
     * @tc.name      testSessionStress_040
     * @tc.desc      Verify that thirty-two cycled letters cover twenty-six distinct buffers and wrap back to the first letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_040 begin');
      const distinct: Set<string> = new Set<string>();
      let wrapped: string = '';
      let first: string = '';
      for (let round = 0; round < 32; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        InputHandler.getInstance().insertText(String.fromCharCode(97 + round % 26));
        distinct.add(harness.client.buffer);
        if (round === 0) {
          first = harness.client.buffer;
        }
        if (round === 26) {
          wrapped = harness.client.buffer;
        }
      }

      expect(distinct.size).assertEqual(26);
      expect(first).assertEqual('a');
      expect(wrapped).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_040 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0041
     * @tc.name      testSessionStress_041
     * @tc.desc      Verify that twelve alternating paste and cut attaches split six each with an early checkpoint.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_041 begin');
      let pastes: number = 0;
      let cuts: number = 0;
      let actions: number = 0;
      let early: string = '';
      for (let round = 0; round < 12; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        if (round % 2 === 0) {
          InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
          pastes = pastes + harness.client.extendActions.length;
        } else {
          InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
          cuts = cuts + harness.client.extendActions.length;
        }
        actions = actions + harness.client.extendActions.length;
        if (round === 3) {
          early = pastes.toString() + ':' + cuts.toString();
        }
      }
      const split: number[] = [pastes, cuts, actions];

      expect(split.join('|')).assertEqual('6|6|12');
      expect(early).assertEqual('2:2');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_041 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0042
     * @tc.name      testSessionStress_042
     * @tc.desc      Verify that twenty-seven end selections all reach the fixed thousand endpoint.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_042 begin');
      InputHandler.getInstance().setCursorInfo({ x: 0, y: 0, height: 0 });
      let ranges: number = 0;
      let fixed: number = 0;
      let lastEnd: number = 0;
      for (let round = 0; round < 27; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        await InputHandler.getInstance().selectToEnd();
        ranges = ranges + harness.client.selectedRanges.length;
        lastEnd = harness.client.selectedRanges[0].end;
        if (lastEnd === 1000) {
          fixed = fixed + 1;
        }
      }

      expect(ranges).assertEqual(27);
      expect(fixed).assertEqual(27);
      expect(lastEnd).assertEqual(1000);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_042 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0043
     * @tc.name      testSessionStress_043
     * @tc.desc      Verify that twelve insert-hide-enter attaches keep all three channels equal at the halfway point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_043 begin');
      let inserts: number = 0;
      let hides: number = 0;
      let finishes: number = 0;
      let halfway: string = '';
      for (let round = 0; round < 12; round++) {
        const harness: PreviewHarness = await createPreviewHarness('', 1);
        InputHandler.getInstance().insertText('f');
        InputHandler.getInstance().hideKeyboardSelf();
        InputHandler.getInstance().sendKeyFunction();
        inserts = inserts + harness.client.insertedTexts.length;
        hides = hides + harness.keyboard.hideCount;
        finishes = finishes + harness.client.finishCount;
        if (round === 5) {
          halfway = inserts.toString() + ':' + hides.toString() + ':' + finishes.toString();
        }
      }
      const totals: number[] = [inserts, hides, finishes];

      expect(totals.join('|')).assertEqual('12|12|12');
      expect(halfway).assertEqual('6:6:6');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_043 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0044
     * @tc.name      testSessionStress_044
     * @tc.desc      Verify that nine attaches each issuing two begin selections collect eighteen anchored ranges.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_044 begin');
      InputHandler.getInstance().setCursorInfo({ x: 0, y: 0, height: 0 });
      let ranges: number = 0;
      let doubled: number = 0;
      let checkpoint: number = 0;
      for (let round = 0; round < 9; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        await InputHandler.getInstance().selectToBegin();
        await InputHandler.getInstance().selectToBegin();
        ranges = ranges + harness.client.selectedRanges.length;
        if (harness.client.selectedRanges.length === 2) {
          doubled = doubled + 1;
        }
        if (round === 2) {
          checkpoint = ranges;
        }
      }

      expect(ranges).assertEqual(18);
      expect(doubled).assertEqual(9);
      expect(checkpoint).assertEqual(6);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_044 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_STRESS_0045
     * @tc.name      testSessionStress_045
     * @tc.desc      Verify that fourteen hide-insert-hide attaches total twenty-eight hides and fourteen insertions without commits.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_045 begin');
      let hides: number = 0;
      let inserts: number = 0;
      let finishes: number = 0;
      let checkpoint: number = 0;
      for (let round = 0; round < 14; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        InputHandler.getInstance().hideKeyboardSelf();
        InputHandler.getInstance().insertText('y');
        InputHandler.getInstance().hideKeyboardSelf();
        hides = hides + harness.keyboard.hideCount;
        inserts = inserts + harness.client.insertedTexts.length;
        finishes = finishes + harness.client.finishCount;
        if (round === 6) {
          checkpoint = hides;
        }
      }
      const totals: number[] = [hides, inserts, finishes];

      expect(totals.join('|')).assertEqual('28|14|0');
      expect(checkpoint).assertEqual(14);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_045 end');
      await yieldToEventLoop();
    });

  });
}
