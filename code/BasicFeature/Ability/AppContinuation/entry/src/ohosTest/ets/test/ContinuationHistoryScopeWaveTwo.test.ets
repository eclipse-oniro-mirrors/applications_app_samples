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

import { describe } from '@ohos/hypium';
import { loggedExpect } from '../support/LoggedExpect';
import { BUNDLE, loggedCase as it } from '../support/BoundedCase';
import { AbilityConstant } from '@kit.AbilityKit';
import {
  SCENE_PAYLOAD_KEY, SceneDocument, SceneWorkspace, decodeScene, emptyWorkspace, encodeWorkspace, stageScene
} from '../../../main/ets/learning/scene/SceneModel';
import { SceneWorkbench } from '../../../main/ets/learning/scene/SceneWorkbench';
import { ScenePageSession } from '../../../main/ets/learning/scene/ScenePageSession';
import { WaveSceneFixture, WaveSceneStore, waveNote, waveReading } from '../support/ContinuationWaveOneFixtures';

/** Reading history deliberately precedes note history, as real interleaved saves can produce. */
function interleavedHistory(): SceneWorkspace {
  let root = stageScene(emptyWorkspace(), waveReading('history-reading', 1, 0, 0), 'reading');
  root = stageScene(root, waveReading('history-reading', 2, 2, 1), 'reading');
  root = stageScene(root, waveNote('history-note', 1, '笔记旧正文'), 'note');
  return stageScene(root, waveNote('history-note', 2, '笔记新正文'), 'note');
}

export default function continuationHistoryScopeWaveTwo(): void {
  describe('ContinuationHistoryScopeWaveTwo', (): void => {
    /**
     * @tc.number SUB_CONTINUATION_HISTORYSCOPEWAVETWO_0100
     * @tc.name com.samples.appcontinuation_ContinuationHistoryScopeWaveTwo_0001
     * @tc.desc 笔记历史列表只展示笔记版本而全工作区历史仍保留阅读版本
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationHistoryScopeWaveTwo_0001', 0, (): void => {
      const store = new WaveSceneStore(encodeWorkspace(interleavedHistory())); const work = new SceneWorkbench(store);
      const lines = work.historyLines('note'); const documents = work.historyDocuments('note');
      loggedExpect(lines.length, 'ContinuationHistoryScopeWaveTwo.test.ets:A0001', BUNDLE + '_ContinuationHistoryScopeWaveTwo_0001').assertEqual(1); loggedExpect(lines[0], 'ContinuationHistoryScopeWaveTwo.test.ets:A0002', BUNDLE + '_ContinuationHistoryScopeWaveTwo_0001').assertEqual('note r1｜history-note');
      loggedExpect(documents[0].state.note.body, 'ContinuationHistoryScopeWaveTwo.test.ets:A0003', BUNDLE + '_ContinuationHistoryScopeWaveTwo_0001').assertEqual('笔记旧正文'); loggedExpect(work.historyDocuments().length, 'ContinuationHistoryScopeWaveTwo.test.ets:A0004', BUNDLE + '_ContinuationHistoryScopeWaveTwo_0001').assertEqual(2);
      loggedExpect(work.historyDocuments()[0].state.reading.chapter, 'ContinuationHistoryScopeWaveTwo.test.ets:A0005', BUNDLE + '_ContinuationHistoryScopeWaveTwo_0001').assertEqual(0);
      loggedExpect(store.putCalls, 'ContinuationHistoryScopeWaveTwo.test.ets:A0006', BUNDLE + '_ContinuationHistoryScopeWaveTwo_0001').assertEqual(0);
      work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_HISTORYSCOPEWAVETWO_0200
     * @tc.name com.samples.appcontinuation_ContinuationHistoryScopeWaveTwo_0002
     * @tc.desc 笔记页第零项恢复必须对应笔记而非全局第零项阅读版本，下一次接续发送所选笔记
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationHistoryScopeWaveTwo_0002', 0, (): void => {
      const f = new WaveSceneFixture(encodeWorkspace(interleavedHistory())); const page = new ScenePageSession('note');
      try {
        page.bind(f.controller, (): void => {}); const restored = f.controller.sceneWorkbench.restoreHistory(0, 'note');
        loggedExpect(restored, 'ContinuationHistoryScopeWaveTwo.test.ets:A0007', BUNDLE + '_ContinuationHistoryScopeWaveTwo_0002').assertTrue(); loggedExpect(f.controller.sceneWorkbench.document('reading').revision, 'ContinuationHistoryScopeWaveTwo.test.ets:A0008', BUNDLE + '_ContinuationHistoryScopeWaveTwo_0002').assertEqual(2);
        loggedExpect(page.snapshot().noteBody, 'ContinuationHistoryScopeWaveTwo.test.ets:A0009', BUNDLE + '_ContinuationHistoryScopeWaveTwo_0002').assertEqual('笔记旧正文'); loggedExpect(page.snapshot().revision, 'ContinuationHistoryScopeWaveTwo.test.ets:A0010', BUNDLE + '_ContinuationHistoryScopeWaveTwo_0002').assertEqual(3);
        const parameters: Record<string, Object> = {};
        loggedExpect(f.controller.buildContinuation(parameters), 'ContinuationHistoryScopeWaveTwo.test.ets:A0011', BUNDLE + '_ContinuationHistoryScopeWaveTwo_0002').assertEqual(AbilityConstant.OnContinueResult.AGREE);
        const outgoing = decodeScene(parameters[SCENE_PAYLOAD_KEY]).value as SceneDocument;
        loggedExpect(outgoing.state.note.body, 'ContinuationHistoryScopeWaveTwo.test.ets:A0012', BUNDLE + '_ContinuationHistoryScopeWaveTwo_0002').assertEqual('笔记旧正文'); loggedExpect(outgoing.documentId, 'ContinuationHistoryScopeWaveTwo.test.ets:A0013', BUNDLE + '_ContinuationHistoryScopeWaveTwo_0002').assertEqual('history-note');
        const reopened = new SceneWorkbench(new WaveSceneStore(f.store.stored()));
        loggedExpect(reopened.document('reading').state.reading.chapter, 'ContinuationHistoryScopeWaveTwo.test.ets:A0014', BUNDLE + '_ContinuationHistoryScopeWaveTwo_0002').assertEqual(2);
        loggedExpect(reopened.historyDocuments('note')[1].state.note.body, 'ContinuationHistoryScopeWaveTwo.test.ets:A0015', BUNDLE + '_ContinuationHistoryScopeWaveTwo_0002').assertEqual('笔记新正文');
        reopened.dispose();
      } finally { page.detach(); f.release(); }
    });
  });
}
