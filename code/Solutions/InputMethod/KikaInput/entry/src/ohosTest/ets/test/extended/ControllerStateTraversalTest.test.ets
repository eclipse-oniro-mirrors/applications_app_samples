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
const TAG: string = '[Sample_KikaInputControllerStateTraversal]';

export default function controllerStateTraversalTest(): void {
  describe('ControllerStateTraversalTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_STATE_TRAVERSAL_0100
     * @tc.name      testStateTraversal_001
     * @tc.desc      Verify a shift snapshot taken after every action matches the expected boolean sequence.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateTraversal_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateTraversal_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      const snapshots: boolean[] = [];
      pressHardKey(controller, 2047);
      snapshots.push(isShiftHeld(controller));
      pressHardKey(controller, 2017);
      snapshots.push(isShiftHeld(controller));
      releaseHardKey(controller, 2017);
      snapshots.push(isShiftHeld(controller));
      releaseHardKey(controller, 2047);
      snapshots.push(isShiftHeld(controller));
      expect(snapshots.join('|')).assertEqual('true|true|true|false');
      expect(harness.client.insertedTexts.join('')).assertEqual('A');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateTraversal_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STATE_TRAVERSAL_0200
     * @tc.name      testStateTraversal_002
     * @tc.desc      Verify the first rejected code in a mixed scan stops the accumulator at the right index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateTraversal_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateTraversal_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      const codes: number[] = [2017, 2018, 3000, 2019];
      let accepted: number = 0;
      let stopIndex: number = -1;
      for (let i = 0; i < codes.length; i++) {
        if (pressHardKey(controller, codes[i])) {
          accepted = accepted + 1;
          releaseHardKey(controller, codes[i]);
        } else {
          stopIndex = i;
          break;
        }
      }
      expect(stopIndex).assertEqual(2);
      expect(harness.client.journal.length).assertEqual(2);
      expect(accepted).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateTraversal_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STATE_TRAVERSAL_0300
     * @tc.name      testStateTraversal_003
     * @tc.desc      Verify two controllers keep independent key stacks while their actions interleave.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateTraversal_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateTraversal_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const first: KeyboardController = createKeyboardController();
      const second: KeyboardController = createKeyboardController();

      pressHardKey(first, 2047);
      pressHardKey(second, 2017);
      expect(pressHardKey(first, 2017)).assertTrue();
      releaseHardKey(first, 2017);
      releaseHardKey(first, 2047);
      releaseHardKey(second, 2017);
      expect(isShiftHeld(second)).assertFalse();
      expect(editorRef.insertedTexts.join('')).assertEqual('aA');
      expect(isShiftHeld(first)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateTraversal_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STATE_TRAVERSAL_0400
     * @tc.name      testStateTraversal_004
     * @tc.desc      Verify a code-to-character map drives a reverse release run.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateTraversal_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateTraversal_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      const mapping: Map<number, string> = new Map<number, string>();
      mapping.set(2017, 'a');
      mapping.set(2018, 'b');
      mapping.set(2019, 'c');
      const codes: number[] = [2017, 2018, 2019];
      for (let i = 0; i < codes.length; i++) {
        expect(pressHardKey(controller, codes[i])).assertEqual(true);
      }
      for (let i = codes.length - 1; i >= 0; i--) {
        expect(releaseHardKey(controller, codes[i])).assertEqual(false);
        expect(mapping.has(codes[i])).assertEqual(true);
      }
      expect(mapping.size).assertEqual(3);
      expect(harness.client.insertedTexts.join('')).assertEqual('abc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateTraversal_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STATE_TRAVERSAL_0500
     * @tc.name      testStateTraversal_005
     * @tc.desc      Verify conditional shift toggling produces alternating case for every letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateTraversal_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateTraversal_005 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      let i: number = 0;
      while (i < 6) {
        const shifted: boolean = i % 2 === 1;
        if (shifted) {
          pressHardKey(controller, 2047);
        }
        pressHardKey(controller, 2017 + i);
        releaseHardKey(controller, 2017 + i);
        if (shifted) {
          releaseHardKey(controller, 2047);
        }
        expect(isShiftHeld(controller)).assertFalse();
        i = i + 1;
      }
      expect(harness.client.insertedTexts.join('')).assertEqual('aBcDeF');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateTraversal_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STATE_TRAVERSAL_0600
     * @tc.name      testStateTraversal_006
     * @tc.desc      Verify a nested shift-letter loop records one uppercase glyph per iteration.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateTraversal_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateTraversal_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      const expected: string[] = ['A', 'B', 'C', 'D'];
      for (let i = 0; i < expected.length; i++) {
        pressHardKey(controller, 2047);
        pressHardKey(controller, 2017 + i);
        releaseHardKey(controller, 2017 + i);
        releaseHardKey(controller, 2047);
        expect(harness.client.journal.length).assertEqual(i + 1);
        expect(harness.client.insertedTexts[i]).assertEqual(expected[i]);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateTraversal_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STATE_TRAVERSAL_0700
     * @tc.name      testStateTraversal_007
     * @tc.desc      Verify a stack-style release loop empties the key set before the next word.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateTraversal_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateTraversal_007 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();

      const held: number[] = [2017, 2018, 2019];
      let i: number = 0;
      while (i < held.length) {
        pressHardKey(controller, held[i]);
        i = i + 1;
      }
      while (held.length > 0) {
        const code: number | undefined = held.pop();
        expect(code !== undefined).assertEqual(true);
        if (code !== undefined) {
          releaseHardKey(controller, code);
        }
      }
      expect(pressHardKey(controller, 2020)).assertEqual(true);
      releaseHardKey(controller, 2020);
      expect(editorRef.insertedTexts.join('')).assertEqual('abcd');
      expect(held.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateTraversal_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STATE_TRAVERSAL_0800
     * @tc.name      testStateTraversal_008
     * @tc.desc      Verify a set of inserted glyphs stays unique after several repeat presses.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateTraversal_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateTraversal_008 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      for (let i = 0; i < 4; i++) {
        pressHardKey(controller, 2017);
        releaseHardKey(controller, 2017);
      }
      const unique: Set<string> = new Set<string>();
      for (let i = 0; i < harness.client.insertedTexts.length; i++) {
        unique.add(harness.client.insertedTexts[i]);
      }
      expect(harness.client.insertedTexts.length).assertEqual(4);
      expect(unique.size).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateTraversal_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STATE_TRAVERSAL_0900
     * @tc.name      testStateTraversal_009
     * @tc.desc      Verify journal prefix and suffix slices describe the same three-command run.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateTraversal_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateTraversal_009 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      pressHardKey(controller, 2017);
      releaseHardKey(controller, 2017);
      pressHardKey(controller, 2018);
      releaseHardKey(controller, 2018);
      pressHardKey(controller, 2019);
      releaseHardKey(controller, 2019);
      const prefix: string[] = harness.client.journal.slice(0, 2);
      const suffix: string[] = harness.client.journal.slice(1);
      expect(prefix.join('|')).assertEqual('insert:a|insert:b');
      expect(suffix.join('|')).assertEqual('insert:b|insert:c');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateTraversal_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STATE_TRAVERSAL_1000
     * @tc.name      testStateTraversal_010
     * @tc.desc      Verify a mixed digit-letter run keeps the digit segment contiguous.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateTraversal_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateTraversal_010 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      const digits: number[] = [2001, 2002, 2003];
      const letters: number[] = [2017, 2018];
      for (let i = 0; i < digits.length; i++) {
        pressHardKey(controller, digits[i]);
        releaseHardKey(controller, digits[i]);
      }
      for (let i = 0; i < letters.length; i++) {
        pressHardKey(controller, letters[i]);
        releaseHardKey(controller, letters[i]);
      }
      expect(harness.client.journal[2]).assertEqual('insert:3');
      expect(harness.client.journal[3]).assertEqual('insert:a');
      expect(harness.client.journal.slice(0, 3).join('')).assertEqual('insert:1insert:2insert:3');
      expect(harness.client.journal[0]).assertEqual('insert:1');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateTraversal_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STATE_TRAVERSAL_1100
     * @tc.name      testStateTraversal_011
     * @tc.desc      Verify a fault-free controller reports no shift hold for every single-key tap.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateTraversal_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateTraversal_011 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();

      const taps: number[] = [2000, 2016, 2043, 2050, 2055, 2122];
      let cleanStates: number = 0;
      let i: number = 0;
      while (i < taps.length) {
        pressHardKey(controller, taps[i]);
        releaseHardKey(controller, taps[i]);
        if (!isShiftHeld(controller)) {
          cleanStates = cleanStates + 1;
        }
        i = i + 1;
      }
      expect(cleanStates).assertEqual(6);
      expect(editorRef.journal.length).assertEqual(6);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateTraversal_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STATE_TRAVERSAL_1200
     * @tc.name      testStateTraversal_012
     * @tc.desc      Verify an unknown-key latch is counted as one entry even after repeated downs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateTraversal_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateTraversal_012 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      let rejected: number = 0;
      for (let i = 0; i < 5; i++) {
        if (!pressHardKey(controller, 3000)) {
          rejected = rejected + 1;
        }
      }
      releaseHardKey(controller, 3000);
      const recovered: boolean = pressHardKey(controller, 2017);
      releaseHardKey(controller, 2017);
      expect(harness.client.journal.join('|')).assertEqual('insert:a');
      expect(rejected).assertEqual(5);
      expect(recovered).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateTraversal_012 end');
      await yieldToEventLoop();
    });

  });

}
