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
import { FaultInputClient, FaultKeyboardController, attachFaultClient } from '../support/FaultHarness';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputInputHandlerPreviewEdge]';

function summary(): string {
  return AppStorage.get<string>('showLog') ?? '';
}

export default function inputHandlerPreviewEdgeTest(): void {
  describe('InputHandlerPreviewEdgeTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_PREVIEW_EDGE_0100
     * @tc.name      testInputHandlerPreviewEdge_001
     * @tc.desc      Verify that empty preview probes render as empty brackets in the summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerPreviewEdge_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPreviewEdge_001 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = new FaultInputClient();
      client.emptyPreview = true;
      attachFaultClient(client, new FaultKeyboardController());
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      expect(summary().indexOf('five chars: before：[];after：[]') >= 0).assertEqual(true);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPreviewEdge_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_PREVIEW_EDGE_0200
     * @tc.name      testInputHandlerPreviewEdge_002
     * @tc.desc      Verify that the empty preview block contains exactly two empty bracket pairs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerPreviewEdge_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPreviewEdge_002 begin');
      handlerRef.onInputStop();
      const client: FaultInputClient = new FaultInputClient();
      client.emptyPreview = true;
      attachFaultClient(client, new FaultKeyboardController());
      AppStorage.setOrCreate<string>('showLog', '');
      handlerRef.refreshInfo();
      const text: string = summary();
      const first: number = text.indexOf('[]');
      const second: number = first < 0 ? -1 : text.indexOf('[]', first + 2);
      expect(second >= 0).assertTrue();
      expect(text.indexOf('[]', second + 2)).assertEqual(-1);
      expect(first >= 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPreviewEdge_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_PREVIEW_EDGE_0300
     * @tc.name      testInputHandlerPreviewEdge_003
     * @tc.desc      Verify that a non-empty preview still reports the fake five-character payloads.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerPreviewEdge_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPreviewEdge_003 begin');
      InputHandler.getInstance().onInputStop();
      attachFaultClient(new FaultInputClient(), new FaultKeyboardController());
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const text: string = summary();
      expect(text.indexOf('[]')).assertEqual(-1);
      expect(text.indexOf('FWD5') >= 0).assertTrue();
      expect(text.indexOf('BWD5') >= 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPreviewEdge_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_PREVIEW_EDGE_0400
     * @tc.name      testInputHandlerPreviewEdge_004
     * @tc.desc      Verify that empty previews do not hide the diagnostic text fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerPreviewEdge_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPreviewEdge_004 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = new FaultInputClient();
      client.emptyPreview = true;
      attachFaultClient(client, new FaultKeyboardController());
      InputHandler.getInstance().setSelectInfo('EMPTY-PREVIEW-SELECT');
      InputHandler.getInstance().setTextInfo('EMPTY-PREVIEW-TEXT');
      InputHandler.getInstance().setInputInfo('EMPTY-PREVIEW-INPUT');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const text: string = summary();
      expect(text.indexOf('EMPTY-PREVIEW-SELECT') >= 0).assertEqual(true);
      expect(text.indexOf('EMPTY-PREVIEW-TEXT') >= 0).assertEqual(true);
      expect(text.indexOf('EMPTY-PREVIEW-INPUT') >= 0).assertEqual(true);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPreviewEdge_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_PREVIEW_EDGE_0500
     * @tc.name      testInputHandlerPreviewEdge_005
     * @tc.desc      Verify that a stop removes the preview block even for an empty-preview client.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerPreviewEdge_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPreviewEdge_005 begin');
      handlerRef.onInputStop();
      const client: FaultInputClient = new FaultInputClient();
      client.emptyPreview = true;
      attachFaultClient(client, new FaultKeyboardController());
      handlerRef.onInputStop();
      AppStorage.setOrCreate<string>('showLog', '');
      handlerRef.refreshInfo();
      expect(summary().indexOf('five chars:')).assertEqual(-1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPreviewEdge_005 end');
      await yieldToEventLoop();
    });

  });

}
