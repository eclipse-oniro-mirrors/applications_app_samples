import { describe, expect, it } from '@ohos/hypium';
import { AbilityConstant } from '@kit.AbilityKit';
import { TEXT_PAYLOAD_KEY } from '../../../main/ets/learning/LearningTypes';
import { SCENE_PAYLOAD_KEY, SceneDocument, decodeScene, encodeScene } from '../../../main/ets/learning/scene/SceneModel';
import { ScenePageSession } from '../../../main/ets/learning/scene/ScenePageSession';
import { SceneWorkbench } from '../../../main/ets/learning/scene/SceneWorkbench';
import { STORE_KEY, inboundWant, payloadBag } from '../support/LearningFixtures';
import { WaveSceneFixture, WaveSceneStore, fillWaveForm, waveReading, waveTarget, waveWant } from '../support/ContinuationWaveOneFixtures';

export default function continuationModeBoundaryWaveTwo(): void {
  describe('ContinuationModeBoundaryWaveTwo', (): void => {
    /**
     * @tc.number SUB_CONTINUATION_MODEBOUNDARYWAVETWO_0100
     * @tc.name testContinuationModeBoundaryWaveTwo0001
     * @tc.desc 返回文本工作台后源端命名空间切换回文本而保留业务草稿和两份存档
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationModeBoundaryWaveTwo0001', 0, (): void => {
      const f = new WaveSceneFixture();
      try {
        f.controller.updateText('文本保存基线'); f.controller.saveText(); const textIdentity = f.controller.snapshot().documentId;
        const textDisk = f.store.getSync(STORE_KEY, ''); f.controller.openScene('note');
        f.controller.sceneWorkbench.editNote('业务标题', '业务保存正文', 0, 2); f.controller.sceneWorkbench.saveNote(); const sceneDisk = f.store.stored();
        f.controller.sceneWorkbench.editNote('业务草稿题', '未保存业务正文', 1, 3);
        const parameters: Record<string, Object> = {}; parameters['unrelated'] = '保留外部参数';
        expect(f.controller.buildContinuation(parameters)).assertEqual(AbilityConstant.OnContinueResult.AGREE);
        const business = decodeScene(parameters[SCENE_PAYLOAD_KEY]).value as SceneDocument;
        expect(business.state.note.body).assertEqual('未保存业务正文');
        f.controller.activateText(); expect(f.controller.buildContinuation(parameters)).assertEqual(AbilityConstant.OnContinueResult.AGREE);
        const text = JSON.parse(parameters[TEXT_PAYLOAD_KEY] as string) as Record<string, Object>;
        expect(text['text']).assertEqual('文本保存基线'); expect(text['documentId']).assertEqual(textIdentity);
        expect(parameters[SCENE_PAYLOAD_KEY]).assertEqual(''); expect(parameters['unrelated']).assertEqual('保留外部参数');
        expect(f.controller.sceneWorkbench.snapshot().noteDirty).assertTrue();
        expect(f.store.stored()).assertEqual(sceneDisk); expect(f.store.getSync(STORE_KEY, '')).assertEqual(textDisk);
      } finally { f.release(); }
    });

    /**
     * @tc.number SUB_CONTINUATION_MODEBOUNDARYWAVETWO_0200
     * @tc.name testContinuationModeBoundaryWaveTwo0002
     * @tc.desc 本机原文本未保存时接到阅读候选仍需选择，保留本机不得落盘业务候选
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationModeBoundaryWaveTwo0002', 0, (): void => {
      const f = new WaveSceneFixture();
      try {
        f.controller.updateText('原文本已保存'); f.controller.saveText(); const raw = f.store.getSync(STORE_KEY, '');
        f.controller.updateText('原文本未保存编辑'); f.controller.markWindowReady();
        f.controller.handleLaunch(waveWant(encodeScene(waveReading('cross-mode-reading', 4, 1, 2))), 3);
        const target = waveTarget(f);
        f.controller.reportScenePosition(target.request, 'reading', target.document.documentId, 4, 1, 2, true);
        expect(f.controller.snapshot().conflictPending).assertTrue(); expect(f.controller.snapshot().committed).assertFalse();
        expect(f.controller.snapshot().conflictSummary).assertEqual('原文本有未保存内容；切换业务前需明确选择。');
        f.controller.rejectConflict();
        expect(f.controller.snapshot().text).assertEqual('原文本未保存编辑'); expect(f.controller.snapshot().sessionActive).assertFalse();
        expect(f.controller.sceneWorkbench.document('reading').state.reading.chapter).assertEqual(0);
        expect(f.store.stored()).assertEqual(''); expect(f.store.getSync(STORE_KEY, '')).assertEqual(raw);
      } finally { f.release(); }
    });

    /**
     * @tc.number SUB_CONTINUATION_MODEBOUNDARYWAVETWO_0300
     * @tc.name testContinuationModeBoundaryWaveTwo0003
     * @tc.desc 业务草稿未保存时接受原文本候选只写文本存储，重新进入业务页仍可继续草稿
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationModeBoundaryWaveTwo0003', 0, (): void => {
      const f = new WaveSceneFixture();
      try {
        f.controller.openScene('note'); f.controller.sceneWorkbench.editNote('保存题', '业务保存正文', 0, 2);
        f.controller.sceneWorkbench.saveNote(); const raw = f.store.stored();
        f.controller.sceneWorkbench.editNote('未保存题', '业务未保存正文', 1, 3);
        const bag = payloadBag('接续原文本', 'cross-mode-text', 0, 4); bag['version'] = 2; bag['documentId'] = 'incoming-text-doc'; bag['revision'] = 5;
        f.controller.markWindowReady(); f.controller.handleLaunch(inboundWant(JSON.stringify(bag)), 3);
        expect(f.controller.snapshot().conflictPending).assertTrue(); expect(f.store.getSync(STORE_KEY, '')).assertEqual('');
        f.controller.acceptConflict(); const text = JSON.parse(f.store.getSync(STORE_KEY, '') as string) as Record<string, Object>;
        expect(f.controller.snapshot().committed).assertTrue(); expect(text['text']).assertEqual('接续原文本');
        expect(text['documentId']).assertEqual('incoming-text-doc'); expect(text['revision']).assertEqual(6);
        expect(f.store.stored()).assertEqual(raw); expect(f.controller.openScene('note')).assertTrue();
        expect(f.controller.sceneSnapshot('note').noteBody).assertEqual('业务未保存正文');
        expect(f.controller.sceneSnapshot('note').noteSavedBody).assertEqual('业务保存正文');
      } finally { f.release(); }
    });

    /**
     * @tc.number SUB_CONTINUATION_MODEBOUNDARYWAVETWO_0400
     * @tc.name testContinuationModeBoundaryWaveTwo0004
     * @tc.desc 表单定位必须匹配步骤，旧请求失效后新步骤回执不依赖第二坐标
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationModeBoundaryWaveTwo0004', 0, (): void => {
      const f = new WaveSceneFixture(); const source = new SceneWorkbench(new WaveSceneStore()); const page = new ScenePageSession('form');
      try {
        fillWaveForm(source); source.gotoFormStep(1); const incoming = source.document('form'); incoming.revision = 4;
        f.controller.handleLaunch(waveWant(encodeScene(incoming)), 3); f.controller.markWindowReady(); page.bind(f.controller, (): void => {});
        const old = waveTarget(f); page.receipt(old, 0, 0, true);
        expect(f.controller.snapshot().committed).assertFalse(); expect(waveTarget(f).request !== old.request).assertTrue();
        page.receipt(old, 1, 0, true); expect(f.store.putCalls).assertEqual(0);
        f.controller.retryBusinessPosition(); page.bind(f.controller, (): void => {}); page.receipt(waveTarget(f), 1, 999, true);
        expect(f.controller.snapshot().committed).assertTrue(); expect(f.controller.sceneWorkbench.document('form').revision).assertEqual(4);
        const reopened = new SceneWorkbench(new WaveSceneStore(f.store.stored()));
        expect(reopened.snapshot().formStep).assertEqual(1); expect(reopened.snapshot().formName).assertEqual('接续用户');
        expect(reopened.snapshot().formConfirmed).assertFalse(); reopened.dispose();
      } finally { page.detach(); source.dispose(); f.release(); }
    });
  });
}
