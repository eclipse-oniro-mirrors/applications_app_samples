import { describe, expect, it } from '@ohos/hypium';
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
     * @tc.name testContinuationHistoryScopeWaveTwo0001
     * @tc.desc 笔记历史列表只展示笔记版本而全工作区历史仍保留阅读版本
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationHistoryScopeWaveTwo0001', 0, (): void => {
      const store = new WaveSceneStore(encodeWorkspace(interleavedHistory())); const work = new SceneWorkbench(store);
      const lines = work.historyLines('note'); const documents = work.historyDocuments('note');
      expect(lines.length).assertEqual(1); expect(lines[0]).assertEqual('note r1｜history-note');
      expect(documents[0].state.note.body).assertEqual('笔记旧正文'); expect(work.historyDocuments().length).assertEqual(2);
      expect(work.historyDocuments()[0].state.reading.chapter).assertEqual(0);
      expect(store.putCalls).assertEqual(0);
      work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_HISTORYSCOPEWAVETWO_0200
     * @tc.name testContinuationHistoryScopeWaveTwo0002
     * @tc.desc 笔记页第零项恢复必须对应笔记而非全局第零项阅读版本，下一次接续发送所选笔记
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationHistoryScopeWaveTwo0002', 0, (): void => {
      const f = new WaveSceneFixture(encodeWorkspace(interleavedHistory())); const page = new ScenePageSession('note');
      try {
        page.bind(f.controller, (): void => {}); const restored = f.controller.sceneWorkbench.restoreHistory(0, 'note');
        expect(restored).assertTrue(); expect(f.controller.sceneWorkbench.document('reading').revision).assertEqual(2);
        expect(page.snapshot().noteBody).assertEqual('笔记旧正文'); expect(page.snapshot().revision).assertEqual(3);
        const parameters: Record<string, Object> = {};
        expect(f.controller.buildContinuation(parameters)).assertEqual(AbilityConstant.OnContinueResult.AGREE);
        const outgoing = decodeScene(parameters[SCENE_PAYLOAD_KEY]).value as SceneDocument;
        expect(outgoing.state.note.body).assertEqual('笔记旧正文'); expect(outgoing.documentId).assertEqual('history-note');
        const reopened = new SceneWorkbench(new WaveSceneStore(f.store.stored()));
        expect(reopened.document('reading').state.reading.chapter).assertEqual(2);
        expect(reopened.historyDocuments('note')[1].state.note.body).assertEqual('笔记新正文');
        reopened.dispose();
      } finally { page.detach(); f.release(); }
    });
  });
}
