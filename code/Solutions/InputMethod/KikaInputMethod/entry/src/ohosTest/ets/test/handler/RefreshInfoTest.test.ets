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
import { createPreviewHarness, PreviewHarness } from '../support/PreviewHarness';
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodRefreshInfo]';

export default function refreshInfoTest(): void {
  describe('RefreshInfoTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_REFRESH_INFO_0001
     * @tc.name      testRefreshInfoTest_001
     * @tc.desc      Verify that the debug snapshot contains both five-character extracts and the recorded labels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testRefreshInfoTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRefreshInfoTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('abcdefghij');
      const handler: InputHandler = InputHandler.getInstance();
      handler.setCursorInfo({ x: 3, y: 4, height: 5 });
      handler.setSelectInfo('selection-A');
      handler.setTextInfo('text-B');
      handler.setInputInfo('input-C');
      AppStorage.setOrCreate<string>('showLog', '');

      handler.refreshInfo();

      const snapshot: string = AppStorage.get<string>('showLog') as string;
      expect(snapshot.includes('abcde')).assertTrue();
      expect(snapshot.includes('fghij')).assertTrue();
      expect(snapshot.includes('selection-A')).assertTrue();
      expect(snapshot.includes('text-B')).assertTrue();
      expect(snapshot.includes('input-C')).assertTrue();
      expect(harness.client.forwardQueries.length).assertEqual(1);
      expect(harness.client.backwardQueries.length).assertEqual(1);
      expect(harness.client.forwardQueries[0]).assertEqual(5);
      expect(harness.client.backwardQueries[0]).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testRefreshInfoTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_REFRESH_INFO_0002
     * @tc.name      testRefreshInfoTest_002
     * @tc.desc      Verify that two refreshes with unchanged editor state produce the same snapshot.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testRefreshInfoTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRefreshInfoTest_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      const handler: InputHandler = InputHandler.getInstance();
      handler.setCursorInfo({ x: 0, y: 0, height: 0 });
      handler.setSelectInfo('same');
      handler.setTextInfo('same');
      handler.setInputInfo('same');
      AppStorage.setOrCreate<string>('showLog', '');

      handler.refreshInfo();
      const first: string = AppStorage.get<string>('showLog') as string;
      handler.refreshInfo();
      const second: string = AppStorage.get<string>('showLog') as string;

      expect(first).assertEqual(second);
      expect(harness.client.forwardQueries.length).assertEqual(2);
      expect(harness.client.backwardQueries.length).assertEqual(2);
      expect(first.split('\n').length).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testRefreshInfoTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_REFRESH_INFO_0003
     * @tc.name      testRefreshInfoTest_003
     * @tc.desc      Verify that a later label overwrites the earlier one in the shared debug snapshot.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testRefreshInfoTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRefreshInfoTest_003 begin');
      await createPreviewHarness('');
      const handler: InputHandler = InputHandler.getInstance();

      handler.setSelectInfo('old-label');
      handler.setTextInfo('old-label');
      handler.setInputInfo('old-label');
      AppStorage.setOrCreate<string>('showLog', '');
      handler.refreshInfo();
      handler.setSelectInfo('new-label');
      handler.setTextInfo('new-label');
      handler.setInputInfo('new-label');
      handler.refreshInfo();

      const snapshot: string = AppStorage.get<string>('showLog') as string;
      expect(snapshot.includes('new-label')).assertTrue();
      expect(snapshot.includes('old-label')).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testRefreshInfoTest_003 end');
      await yieldToEventLoop();
    });

  });

}
