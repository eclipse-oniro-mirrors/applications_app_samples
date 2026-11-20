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
import { FaultInputClient, FaultKeyboardController, attachFaultClient } from '../support/FaultHarness';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputFaultCombination]';

export default function faultCombinationTest(): void {
  describe('FaultCombinationTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_FAULT_COMBINATION_0100
     * @tc.name      testFaultCombination_001
     * @tc.desc      Verify that an attribute throw is reported while the assigned client still receives inserts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultCombination_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultCombination_001 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = new FaultInputClient();
      client.throwOnAttribute = true;
      client.returnFalse = true;
      let thrown: boolean = false;
      try {
        attachFaultClient(client, new FaultKeyboardController());
      } catch (error) {
        thrown = true;
      }
      InputHandler.getInstance().insertText('x');
      expect(thrown).assertTrue();
      expect(client.insertedTexts.join('')).assertEqual('x');
      expect(client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultCombination_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_FAULT_COMBINATION_0200
     * @tc.name      testFaultCombination_002
     * @tc.desc      Verify that a preview fault with false results still records earlier insertions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultCombination_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultCombination_002 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = new FaultInputClient();
      client.throwOnPreview = true;
      client.returnFalse = true;
      attachFaultClient(client, new FaultKeyboardController());
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('a');
      let thrown: boolean = false;
      try {
        InputHandler.getInstance().refreshInfo();
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertTrue();
      expect(client.insertedTexts.join('')).assertEqual('a');
      expect(client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultCombination_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_FAULT_COMBINATION_0300
     * @tc.name      testFaultCombination_003
     * @tc.desc      Verify that empty preview with false results keeps the summary brackets after an insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultCombination_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultCombination_003 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = new FaultInputClient();
      client.emptyPreview = true;
      client.returnFalse = true;
      attachFaultClient(client, new FaultKeyboardController());
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('b');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const text: string = AppStorage.get<string>('showLog') ?? '';
      expect(client.insertedTexts.join('')).assertEqual('b');
      expect(text.indexOf('before：[];after：[]') >= 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultCombination_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_FAULT_COMBINATION_0400
     * @tc.name      testFaultCombination_004
     * @tc.desc      Verify that a cleared preview fault allows a later refresh to include the preview.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultCombination_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultCombination_004 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = new FaultInputClient();
      client.throwOnPreview = true;
      attachFaultClient(client, new FaultKeyboardController());
      await Promise.resolve();
      await Promise.resolve();
      let thrown: boolean = false;
      try {
        InputHandler.getInstance().refreshInfo();
      } catch (error) {
        thrown = true;
      }
      client.throwOnPreview = false;
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const text: string = AppStorage.get<string>('showLog') ?? '';
      expect(thrown).assertTrue();
      expect(text.indexOf('FWD5') >= 0).assertTrue();
      expect(text.indexOf('BWD5') >= 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultCombination_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_FAULT_COMBINATION_0500
     * @tc.name      testFaultCombination_005
     * @tc.desc      Verify that a failed attach followed by a stop leaves no client for insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultCombination_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultCombination_005 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = new FaultInputClient();
      client.throwOnAttribute = true;
      try {
        attachFaultClient(client, new FaultKeyboardController());
      } catch (error) {
        // Expected.
      }
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().deleteBackward(3);
      expect(client.backwardLengths.length).assertEqual(0);
      expect(client.journal.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultCombination_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_FAULT_COMBINATION_0600
     * @tc.name      testFaultCombination_006
     * @tc.desc      Verify that a false-result client records six kinds before the flag is cleared.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultCombination_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultCombination_006 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = new FaultInputClient();
      client.returnFalse = true;
      attachFaultClient(client, new FaultKeyboardController());
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('z');
      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().deleteForward(2);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_DOWN);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      InputHandler.getInstance().sendKeyFunction();
      expect(client.journal.length).assertEqual(6);
      expect(client.journal[0]).assertEqual('insert:z');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultCombination_006 end');
      await yieldToEventLoop();
    });

  });
}
