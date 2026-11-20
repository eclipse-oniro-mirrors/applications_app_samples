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
import { CountingKeyboardController, FaultInputClient, FaultKeyboardController, attachFaultClient } from '../support/FaultHarness';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputFaultResilience]';

export default function FaultResilienceTestTest(): void {
  describe('FaultResilienceTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_FAULT_RESILIENCE_0100
     * @tc.name      testFaultResilience_001
     * @tc.desc      Verify a healthy hide after a throwing controller reaches the new controller once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultResilience_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultResilience_002 begin');
      InputHandler.getInstance().onInputStop();
      attachFaultClient(new FaultInputClient(), new FaultKeyboardController());
      let thrown: boolean = false;
      try {
        InputHandler.getInstance().hideKeyboardSelf();
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertEqual(true);
      InputHandler.getInstance().onInputStop();
      const healthy: FaultInputClient = new FaultInputClient();
      const keyboard: CountingKeyboardController = new CountingKeyboardController();
      attachFaultClient(healthy, keyboard);
      InputHandler.getInstance().hideKeyboardSelf();
      expect(keyboard.hideCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultResilience_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_FAULT_RESILIENCE_0200
     * @tc.name      testFaultResilience_002
     * @tc.desc      Verify clearing the preview-fault flag makes refreshInfo produce a preview block.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultResilience_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultResilience_003 begin');
      handlerRef.onInputStop();
      const client: FaultInputClient = new FaultInputClient();
      client.throwOnPreview = true;
      attachFaultClient(client, new FaultKeyboardController());
      let thrown: boolean = false;
      try {
        handlerRef.refreshInfo();
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertTrue();
      client.throwOnPreview = false;
      AppStorage.setOrCreate<string>('showLog', '');
      handlerRef.refreshInfo();
      const text: string = AppStorage.get<string>('showLog') ?? '';
      expect(text.indexOf('FWD5') >= 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultResilience_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_FAULT_RESILIENCE_0300
     * @tc.name      testFaultResilience_003
     * @tc.desc      Verify a false-return client becomes a normal client once the flag is cleared.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultResilience_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultResilience_004 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = new FaultInputClient();
      client.returnFalse = true;
      attachFaultClient(client, new FaultKeyboardController());
      InputHandler.getInstance().insertText('first');
      client.returnFalse = false;
      InputHandler.getInstance().insertText('second');
      expect(client.insertedTexts.length).assertEqual(2);
      expect(client.journal.join('|')).assertEqual('insert:first|insert:second');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultResilience_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_FAULT_RESILIENCE_0400
     * @tc.name      testFaultResilience_004
     * @tc.desc      Verify the same fault client resumes delivery after a stop and reattach.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultResilience_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultResilience_005 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = new FaultInputClient();
      attachFaultClient(client, new FaultKeyboardController());
      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().onInputStop();
      attachFaultClient(client, new FaultKeyboardController());
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('b');
      expect(client.insertedTexts.join('|')).assertEqual('a|b');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultResilience_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_FAULT_RESILIENCE_0500
     * @tc.name      testFaultResilience_005
     * @tc.desc      Verify an attribute fault followed by a hide fault keeps both failure points distinct.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultResilience_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultResilience_006 begin');
      handlerRef.onInputStop();
      const client: FaultInputClient = new FaultInputClient();
      client.throwOnAttribute = true;
      const keyboard: FaultKeyboardController = new FaultKeyboardController();
      let attributeThrown: boolean = false;
      try {
        attachFaultClient(client, keyboard);
      } catch (error) {
        attributeThrown = true;
      }
      let hideThrown: boolean = false;
      try {
        handlerRef.hideKeyboardSelf();
      } catch (error) {
        hideThrown = true;
      }
      expect(attributeThrown).assertTrue();
      expect(hideThrown).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultResilience_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_FAULT_RESILIENCE_0600
     * @tc.name      testFaultResilience_006
     * @tc.desc      Verify a fault client attached mid-session receives only the later command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultResilience_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultResilience_007 begin');
      InputHandler.getInstance().onInputStop();
      const first: FaultInputClient = new FaultInputClient();
      attachFaultClient(first, new FaultKeyboardController());
      InputHandler.getInstance().insertText('early');
      const second: FaultInputClient = new FaultInputClient();
      attachFaultClient(second, new FaultKeyboardController());
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('late');
      expect(second.insertedTexts.join('|')).assertEqual('late');
      expect(first.insertedTexts.join('|')).assertEqual('early');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultResilience_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_FAULT_RESILIENCE_0700
     * @tc.name      testFaultResilience_007
     * @tc.desc      Verify the preview fault wins over the empty-preview flag.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultResilience_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultResilience_008 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = new FaultInputClient();
      client.throwOnPreview = true;
      client.emptyPreview = true;
      attachFaultClient(client, new FaultKeyboardController());
      let thrown: boolean = false;
      try {
        InputHandler.getInstance().refreshInfo();
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertEqual(true);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultResilience_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_FAULT_RESILIENCE_0800
     * @tc.name      testFaultResilience_008
     * @tc.desc      Verify a failed start followed by a stop leaves no client for insertions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultResilience_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultResilience_009 begin');
      handlerRef.onInputStop();
      const client: FaultInputClient = new FaultInputClient();
      client.throwOnAttribute = true;
      try {
        attachFaultClient(client, new FaultKeyboardController());
      } catch (error) {
        // Expected.
      }
      handlerRef.onInputStop();
      handlerRef.insertText('lost');
      expect(client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultResilience_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_FAULT_RESILIENCE_0900
     * @tc.name      testFaultResilience_009
     * @tc.desc      Verify every command kind is recorded even when the client reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultResilience_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultResilience_010 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = new FaultInputClient();
      client.returnFalse = true;
      attachFaultClient(client, new FaultKeyboardController());
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('x');
      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().deleteForward(2);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_UP);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.COPY);
      InputHandler.getInstance().sendKeyFunction();
      expect(client.journal.length).assertEqual(6);
      expect(client.journal.join('|')).assertEqual('insert:x|back:1|forward:2|move:1|extend:4|enter:0');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultResilience_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_FAULT_EXTRA_0100
     * @tc.name      testFaultResilienceExtra_001
     * @tc.desc      Verify a failing attach still leaves its client assigned for later insertions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultResilienceExtra_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultResilienceExtra_001 begin');
      InputHandler.getInstance().onInputStop();
      const healthy: FaultInputClient = new FaultInputClient();
      attachFaultClient(healthy, new FaultKeyboardController());
      InputHandler.getInstance().insertText('before');
      const broken: FaultInputClient = new FaultInputClient();
      broken.throwOnAttribute = true;
      let thrown: boolean = false;
      try {
        attachFaultClient(broken, new FaultKeyboardController());
      } catch (error) {
        thrown = true;
      }
      InputHandler.getInstance().insertText('after');
      expect(thrown).assertEqual(true);
      expect(healthy.insertedTexts.join('')).assertEqual('before');
      expect(broken.insertedTexts.join('')).assertEqual('after');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultResilienceExtra_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_FAULT_EXTRA_0200
     * @tc.name      testFaultResilienceExtra_002
     * @tc.desc      Verify two failing attaches hand ownership to the second broken client only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultResilienceExtra_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultResilienceExtra_002 begin');
      handlerRef.onInputStop();
      const first: FaultInputClient = new FaultInputClient();
      const second: FaultInputClient = new FaultInputClient();
      first.throwOnAttribute = true;
      second.throwOnAttribute = true;
      let throws: number = 0;
      try {
        attachFaultClient(first, new FaultKeyboardController());
      } catch (error) {
        throws = throws + 1;
      }
      try {
        attachFaultClient(second, new FaultKeyboardController());
      } catch (error) {
        throws = throws + 1;
      }
      handlerRef.insertText('owned');
      expect(first.insertedTexts.length).assertEqual(0);
      expect(second.insertedTexts.join('')).assertEqual('owned');
      expect(throws).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultResilienceExtra_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_FAULT_EXTRA_0300
     * @tc.name      testFaultResilienceExtra_003
     * @tc.desc      Verify a healthy attach after a failed one takes over every later command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultResilienceExtra_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultResilienceExtra_003 begin');
      InputHandler.getInstance().onInputStop();
      const broken: FaultInputClient = new FaultInputClient();
      broken.throwOnAttribute = true;
      try {
        attachFaultClient(broken, new FaultKeyboardController());
      } catch (error) {
        // Expected.
      }
      const healthy: FaultInputClient = new FaultInputClient();
      attachFaultClient(healthy, new FaultKeyboardController());
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('takeover');
      InputHandler.getInstance().deleteBackward(2);
      expect(healthy.journal.join('|')).assertEqual('insert:takeover|back:2');
      expect(broken.journal.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultResilienceExtra_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_FAULT_EXTRA_0400
     * @tc.name      testFaultResilienceExtra_004
     * @tc.desc      Verify an empty preview with false results still lets a refresh build the summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultResilienceExtra_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultResilienceExtra_004 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = new FaultInputClient();
      client.emptyPreview = true;
      client.returnFalse = true;
      attachFaultClient(client, new FaultKeyboardController());
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('kept');
      AppStorage.setOrCreate<string>('showLog', '');
      let thrown: boolean = false;
      try {
        InputHandler.getInstance().refreshInfo();
      } catch (error) {
        thrown = true;
      }
      const text: string = AppStorage.get<string>('showLog') ?? '';
      expect(thrown).assertEqual(false);
      expect(text.indexOf('five chars:')).assertEqual(0);
      expect(client.insertedTexts.join('')).assertEqual('kept');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultResilienceExtra_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_FAULT_EXTRA_0500
     * @tc.name      testFaultResilienceExtra_005
     * @tc.desc      Verify an insert survives a preview fault and a later refresh recovers the summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultResilienceExtra_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultResilienceExtra_005 begin');
      handlerRef.onInputStop();
      const client: FaultInputClient = new FaultInputClient();
      client.throwOnPreview = true;
      attachFaultClient(client, new FaultKeyboardController());
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.insertText('survives');
      let thrown: boolean = false;
      try {
        handlerRef.refreshInfo();
      } catch (error) {
        thrown = true;
      }
      client.throwOnPreview = false;
      AppStorage.setOrCreate<string>('showLog', '');
      handlerRef.refreshInfo();
      const text: string = AppStorage.get<string>('showLog') ?? '';
      expect(client.insertedTexts.join('')).assertEqual('survives');
      expect(text.indexOf('FWD5') >= 0).assertTrue();
      expect(client.journal.length).assertEqual(1);
      expect(thrown).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultResilienceExtra_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_FAULT_EXTRA_0600
     * @tc.name      testFaultResilienceExtra_006
     * @tc.desc      Verify a hide fault repeats while attached and becomes harmless after a stop.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultResilienceExtra_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultResilienceExtra_006 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = new FaultInputClient();
      attachFaultClient(client, new FaultKeyboardController());
      let throws: number = 0;
      let i: number = 0;
      while (i < 3) {
        try {
          InputHandler.getInstance().hideKeyboardSelf();
          } catch (error) {
          throws = throws + 1;
        }
        i = i + 1;
      }
      InputHandler.getInstance().onInputStop();
      let afterStop: boolean = false;
      try {
        InputHandler.getInstance().hideKeyboardSelf();
      } catch (error) {
        afterStop = true;
      }
      expect(client.journal.length).assertEqual(0);
      expect(throws).assertEqual(3);
      expect(afterStop).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultResilienceExtra_006 end');
      await yieldToEventLoop();
    });

  });
}
