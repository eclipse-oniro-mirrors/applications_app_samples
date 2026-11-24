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
import { InputHandler } from '../../../../main/ets/model/KeyboardController';
import { ClientHarness, createClientHarness } from '../support/ClientHarness';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputClientJournalCapacity]';

export default function clientJournalCapacityTest(): void {
  describe('ClientJournalCapacityTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_CLIENT_JOURNAL_CAPACITY_0100
     * @tc.name      testClientJournalCapacity_001
     * @tc.desc      Verify that forty five-command cycles keep every kind at its own journal slot.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testClientJournalCapacity_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClientJournalCapacity_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      for (let cycle = 0; cycle < 40; cycle++) {
        InputHandler.getInstance().insertText('a');
        InputHandler.getInstance().deleteBackward(1);
        InputHandler.getInstance().deleteForward(2);
        InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
        InputHandler.getInstance().sendKeyFunction();
      }
      const journal: string[] = harness.client.journal;
      expect(journal.length).assertEqual(200);
      expect(journal[0]).assertEqual('insert:a');
      expect(journal[1]).assertEqual('back:1');
      expect(journal[2]).assertEqual('forward:2');
      expect(journal[3]).assertEqual('move:3');
      expect(journal[4]).assertEqual('enter:0');
      expect(journal[199]).assertEqual('enter:0');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClientJournalCapacity_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CLIENT_JOURNAL_CAPACITY_0200
     * @tc.name      testClientJournalCapacity_002
     * @tc.desc      Verify that two sessions of fifty commands keep separate fifty-entry journals.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testClientJournalCapacity_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClientJournalCapacity_002 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      for (let i = 0; i < 50; i++) {
        InputHandler.getInstance().insertText('x');
      }
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      for (let i = 0; i < 50; i++) {
        InputHandler.getInstance().deleteBackward(i);
      }
      expect(first.client.journal.length).assertEqual(50);
      expect(second.client.journal.length).assertEqual(50);
      expect(first.client.journal[0]).assertEqual('insert:x');
      expect(second.client.journal[49]).assertEqual('back:49');
      expect(first.client.backwardLengths.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClientJournalCapacity_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CLIENT_JOURNAL_CAPACITY_0300
     * @tc.name      testClientJournalCapacity_003
     * @tc.desc      Verify that forty zero-argument commands keep their two exact journal forms.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testClientJournalCapacity_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClientJournalCapacity_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      for (let i = 0; i < 20; i++) {
        InputHandler.getInstance().insertText('');
        InputHandler.getInstance().deleteForward(0);
      }
      let emptyInserts: number = 0;
      let zeroDeletes: number = 0;
      for (let i = 0; i < harness.client.journal.length; i++) {
        if (harness.client.journal[i] === 'insert:') {
          emptyInserts = emptyInserts + 1;
        }
        if (harness.client.journal[i] === 'forward:0') {
          zeroDeletes = zeroDeletes + 1;
        }
      }
      expect(harness.client.journal.length).assertEqual(40);
      expect(emptyInserts).assertEqual(20);
      expect(zeroDeletes).assertEqual(20);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClientJournalCapacity_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CLIENT_JOURNAL_CAPACITY_0400
     * @tc.name      testClientJournalCapacity_004
     * @tc.desc      Verify that ten consecutive sessions each hold one unique insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testClientJournalCapacity_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClientJournalCapacity_004 begin');
      InputHandler.getInstance().onInputStop();
      const texts: string[] = [];
      const unique: Set<string> = new Set<string>();
      for (let i = 0; i < 10; i++) {
        const harness: ClientHarness = await createClientHarness(0);
        const text: string = 'k' + i;
        InputHandler.getInstance().insertText(text);
        InputHandler.getInstance().onInputStop();
        expect(harness.client.journal.length).assertEqual(1);
        texts.push(harness.client.insertedTexts[0]);
        unique.add(harness.client.insertedTexts[0]);
      }
      expect(texts.length).assertEqual(10);
      expect(unique.size).assertEqual(10);
      expect(texts[9]).assertEqual('k9');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClientJournalCapacity_004 end');
      await yieldToEventLoop();
    });

  });
}
