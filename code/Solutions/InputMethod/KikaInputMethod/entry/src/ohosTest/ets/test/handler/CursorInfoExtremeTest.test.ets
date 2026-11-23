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
const TAG: string = '[Sample_KikaInputMethodCursorInfoExtreme]';

export default function cursorInfoExtremeTest(): void {
  describe('CursorInfoExtremeTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CURSOR_EXTREME_0001
     * @tc.name      testCursorInfoExtremeTest_001
     * @tc.desc      Verify that a negative cursor x is used as the empty-editor selection endpoint.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testCursorInfoExtremeTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCursorInfoExtremeTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().setCursorInfo({ x: -5, y: 0, height: 0 });
      await InputHandler.getInstance().selectToBegin();
      await InputHandler.getInstance().selectToEnd();
      expect(harness.client.selectedRanges[0].end).assertEqual(-5);
      expect(harness.client.selectedRanges[1].start).assertEqual(-5);
      InputHandler.getInstance().setCursorInfo({ x: 0, y: 0, height: 0 });
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCursorInfoExtremeTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CURSOR_EXTREME_0002
     * @tc.name      testCursorInfoExtremeTest_002
     * @tc.desc      Verify that a large cursor x is used verbatim when the editor is empty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testCursorInfoExtremeTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCursorInfoExtremeTest_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().setCursorInfo({ x: 1000, y: 0, height: 0 });
      await InputHandler.getInstance().selectToBegin();
      await InputHandler.getInstance().selectToEnd();
      expect(harness.client.selectedRanges[0].end).assertEqual(1000);
      expect(harness.client.selectedRanges[1].start).assertEqual(1000);
      InputHandler.getInstance().setCursorInfo({ x: 0, y: 0, height: 0 });
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCursorInfoExtremeTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CURSOR_EXTREME_0003
     * @tc.name      testCursorInfoExtremeTest_003
     * @tc.desc      Verify that a positive cursor index ignores a negative x on a two-character editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCursorInfoExtremeTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCursorInfoExtremeTest_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('ab');
      InputHandler.getInstance().setCursorInfo({ x: -9, y: 0, height: 0 });
      await InputHandler.getInstance().selectToBegin();
      await InputHandler.getInstance().selectToEnd();
      expect(harness.client.selectedRanges[0].end).assertEqual(1);
      expect(harness.client.selectedRanges[1].start).assertEqual(1);
      InputHandler.getInstance().setCursorInfo({ x: 0, y: 0, height: 0 });
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCursorInfoExtremeTest_003 end');
      await yieldToEventLoop();
    });

  });

}
