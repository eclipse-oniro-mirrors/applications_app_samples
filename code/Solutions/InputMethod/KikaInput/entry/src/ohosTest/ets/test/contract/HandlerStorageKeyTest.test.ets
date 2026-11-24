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
import { InputHandler } from '../../../../main/ets/model/KeyboardController';
import { ClientHarness, createClientHarness } from '../support/ClientHarness';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputHandlerStorageKey]';

export default function handlerStorageKeyTest(): void {
  describe('HandlerStorageKeyTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_STORAGE_KEY_0100
     * @tc.name      testHandlerStorageKey_001
     * @tc.desc      Verify that a start publishes both editor fields as readable numbers.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerStorageKey_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerStorageKey_001 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(3, 4);

      const type: number | undefined = AppStorage.get<number>('enterKeyType');
      const pattern: number | undefined = AppStorage.get<number>('inputPattern');
      expect(type !== undefined).assertTrue();
      expect(pattern !== undefined).assertTrue();
      expect(type).assertEqual(3);
      expect(pattern).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerStorageKey_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_STORAGE_KEY_0200
     * @tc.name      testHandlerStorageKey_002
     * @tc.desc      Verify that stopping the input keeps both editor storage keys readable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerStorageKey_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerStorageKey_002 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(5, 6);
      InputHandler.getInstance().onInputStop();

      expect(AppStorage.get<number>('enterKeyType') !== undefined).assertTrue();
      expect(AppStorage.get<number>('inputPattern') !== undefined).assertTrue();
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(5);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(6);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerStorageKey_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_STORAGE_KEY_0300
     * @tc.name      testHandlerStorageKey_003
     * @tc.desc      Verify that a restart overwrites both existing storage keys in place.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerStorageKey_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerStorageKey_003 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(1, 2);
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(8, 9);

      expect(AppStorage.get<number>('enterKeyType')).assertEqual(8);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(9);
      InputHandler.getInstance().sendKeyFunction();
      expect(second.client.keyFunctions[0]).assertEqual(8);
      expect(second.client.keyFunctions.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerStorageKey_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_STORAGE_KEY_0400
     * @tc.name      testHandlerStorageKey_004
     * @tc.desc      Verify that refresh publishes a string summary when its key was pre-created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerStorageKey_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerStorageKey_004 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(0);
      AppStorage.setOrCreate<string>('showLog', 'seed');
      InputHandler.getInstance().refreshInfo();

      const log: string | undefined = AppStorage.get<string>('showLog');
      expect(log !== undefined).assertTrue();
      expect((log ?? '').indexOf('five chars:')).assertEqual(0);
      expect((log ?? '').length > 10).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerStorageKey_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_STORAGE_KEY_0500
     * @tc.name      testHandlerStorageKey_005
     * @tc.desc      Verify that the handler storage key survives a stop and is not undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerStorageKey_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerStorageKey_005 begin');
      InputHandler.getInstance().onInputStop();
      const handler: InputHandler = InputHandler.getInstance();
      InputHandler.getInstance().onInputStop();

      const stored: InputHandler | undefined = AppStorage.get<InputHandler>('inputHandler');
      expect(stored !== undefined).assertTrue();
      expect(handler !== undefined).assertTrue();
      expect(InputHandler.getInstance()).assertEqual(handler);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerStorageKey_005 end');
      await yieldToEventLoop();
    });

  });
}
