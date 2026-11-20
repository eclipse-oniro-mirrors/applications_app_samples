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
import { TEXT_PAYLOAD_KEY } from '../../../main/ets/learning/LearningTypes';
import {
  SCENE_PAYLOAD_KEY, SceneDocument, decodeScene, encodeScene
} from '../../../main/ets/learning/scene/SceneModel';
import { ScenePageSession } from '../../../main/ets/learning/scene/ScenePageSession';
import { SceneWorkbench } from '../../../main/ets/learning/scene/SceneWorkbench';
import { STORE_KEY, inboundWant, payloadBag } from '../support/LearningFixtures';
import {
  WaveSceneFixture, WaveSceneStore, fillWaveForm, waveReading, waveTarget, waveWant
} from '../support/ContinuationWaveOneFixtures';

export default function continuationModeBoundaryWaveTwo(): void {
  describe('ContinuationModeBoundaryWaveTwo', (): void => {
    /**
     * @tc.number SUB_CONTINUATION_MODEBOUNDARYWAVETWO_0100
     * @tc.name com.samples.appcontinuation_ContinuationModeBoundaryWaveTwo_0001
     * @tc.desc 返回文本工作台后源端命名空间切换回文本而保留业务草稿和两份存档
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationModeBoundaryWaveTwo_0001', 0, (): void => {
      const f = new WaveSceneFixture();
      try {
        f.controller.updateText('文本保存基线');
        f.controller.saveText();
        const textIdentity = f.controller.snapshot().documentId;
        const textDisk = f.store.getSync(STORE_KEY, ''); f.controller.openScene('note');
        f.controller.sceneWorkbench.editNote('业务标题', '业务保存正文', 0, 2);
        f.controller.sceneWorkbench.saveNote();
        const sceneDisk = f.store.stored();
        f.controller.sceneWorkbench.editNote('业务草稿题', '未保存业务正文', 1, 3);
        const parameters: Record<string, Object> = {}; parameters['unrelated'] = '保留外部参数';
        loggedExpect(f.controller.buildContinuation(parameters), 'ContinuationModeBoundaryWaveTwo.test.ets:A0001', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0001').assertEqual(AbilityConstant.OnContinueResult.AGREE);
        const business = decodeScene(parameters[SCENE_PAYLOAD_KEY]).value as SceneDocument;
        loggedExpect(business.state.note.body, 'ContinuationModeBoundaryWaveTwo.test.ets:A0002', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0001').assertEqual('未保存业务正文');
        f.controller.activateText();
        loggedExpect(f.controller.buildContinuation(parameters), 'ContinuationModeBoundaryWaveTwo.test.ets:A0003', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0001').assertEqual(AbilityConstant.OnContinueResult.AGREE);
        const text = JSON.parse(parameters[TEXT_PAYLOAD_KEY] as string) as Record<string, Object>;
        loggedExpect(text['text'], 'ContinuationModeBoundaryWaveTwo.test.ets:A0004', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0001').assertEqual('文本保存基线'); loggedExpect(text['documentId'], 'ContinuationModeBoundaryWaveTwo.test.ets:A0005', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0001').assertEqual(textIdentity);
        loggedExpect(parameters[SCENE_PAYLOAD_KEY], 'ContinuationModeBoundaryWaveTwo.test.ets:A0006', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0001').assertEqual(''); loggedExpect(parameters['unrelated'], 'ContinuationModeBoundaryWaveTwo.test.ets:A0007', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0001').assertEqual('保留外部参数');
        loggedExpect(f.controller.sceneWorkbench.snapshot().noteDirty, 'ContinuationModeBoundaryWaveTwo.test.ets:A0008', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0001').assertTrue();
        loggedExpect(f.store.stored(), 'ContinuationModeBoundaryWaveTwo.test.ets:A0009', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0001').assertEqual(sceneDisk); loggedExpect(f.store.getSync(STORE_KEY, ''), 'ContinuationModeBoundaryWaveTwo.test.ets:A0010', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0001').assertEqual(textDisk);
      } finally { f.release(); }
    });

    /**
     * @tc.number SUB_CONTINUATION_MODEBOUNDARYWAVETWO_0200
     * @tc.name com.samples.appcontinuation_ContinuationModeBoundaryWaveTwo_0002
     * @tc.desc 本机原文本未保存时接到阅读候选仍需选择，保留本机不得落盘业务候选
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationModeBoundaryWaveTwo_0002', 0, (): void => {
      const f = new WaveSceneFixture();
      try {
        f.controller.updateText('原文本已保存'); f.controller.saveText(); const raw = f.store.getSync(STORE_KEY, '');
        f.controller.updateText('原文本未保存编辑'); f.controller.markWindowReady();
        f.controller.handleLaunch(waveWant(encodeScene(waveReading('cross-mode-reading', 4, 1, 2))), AbilityConstant.LaunchReason.CONTINUATION);
        const target = waveTarget(f);
        f.controller.reportScenePosition(target.request, 'reading', target.document.documentId, 4, 1, 2, true);
        loggedExpect(f.controller.snapshot().conflictPending, 'ContinuationModeBoundaryWaveTwo.test.ets:A0011', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0002').assertTrue();
        loggedExpect(f.controller.snapshot().committed, 'ContinuationModeBoundaryWaveTwo.test.ets:A0012', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0002').assertFalse();
        loggedExpect(f.controller.snapshot().conflictSummary, 'ContinuationModeBoundaryWaveTwo.test.ets:A0013', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0002').assertEqual('原文本有未保存内容；切换业务前需明确选择。');
        f.controller.rejectConflict();
        loggedExpect(f.controller.snapshot().text, 'ContinuationModeBoundaryWaveTwo.test.ets:A0014', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0002').assertEqual('原文本未保存编辑');
        loggedExpect(f.controller.snapshot().sessionActive, 'ContinuationModeBoundaryWaveTwo.test.ets:A0015', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0002').assertFalse();
        loggedExpect(f.controller.sceneWorkbench.document('reading').state.reading.chapter, 'ContinuationModeBoundaryWaveTwo.test.ets:A0016', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0002').assertEqual(0);
        loggedExpect(f.store.stored(), 'ContinuationModeBoundaryWaveTwo.test.ets:A0017', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0002').assertEqual(''); loggedExpect(f.store.getSync(STORE_KEY, ''), 'ContinuationModeBoundaryWaveTwo.test.ets:A0018', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0002').assertEqual(raw);
      } finally { f.release(); }
    });

    /**
     * @tc.number SUB_CONTINUATION_MODEBOUNDARYWAVETWO_0300
     * @tc.name com.samples.appcontinuation_ContinuationModeBoundaryWaveTwo_0003
     * @tc.desc 业务草稿未保存时接受原文本候选只写文本存储，重新进入业务页仍可继续草稿
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationModeBoundaryWaveTwo_0003', 0, (): void => {
      const f = new WaveSceneFixture();
      try {
        f.controller.openScene('note'); f.controller.sceneWorkbench.editNote('保存题', '业务保存正文', 0, 2);
        f.controller.sceneWorkbench.saveNote(); const raw = f.store.stored();
        f.controller.sceneWorkbench.editNote('未保存题', '业务未保存正文', 1, 3);
        const bag = payloadBag('接续原文本', 'cross-mode-text', 0, 4);
        bag['version'] = 2;
        bag['documentId'] = 'incoming-text-doc';
        bag['revision'] = 5;
        f.controller.markWindowReady(); f.controller.handleLaunch(inboundWant(JSON.stringify(bag)), AbilityConstant.LaunchReason.CONTINUATION);
        loggedExpect(f.controller.snapshot().conflictPending, 'ContinuationModeBoundaryWaveTwo.test.ets:A0019', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0003').assertTrue();
        loggedExpect(f.store.getSync(STORE_KEY, ''), 'ContinuationModeBoundaryWaveTwo.test.ets:A0020', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0003').assertEqual('');
        f.controller.acceptConflict();
        const text = JSON.parse(f.store.getSync(STORE_KEY, '') as string) as Record<string, Object>;
        loggedExpect(f.controller.snapshot().committed, 'ContinuationModeBoundaryWaveTwo.test.ets:A0021', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0003').assertTrue(); loggedExpect(text['text'], 'ContinuationModeBoundaryWaveTwo.test.ets:A0022', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0003').assertEqual('接续原文本');
        loggedExpect(text['documentId'], 'ContinuationModeBoundaryWaveTwo.test.ets:A0023', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0003').assertEqual('incoming-text-doc'); loggedExpect(text['revision'], 'ContinuationModeBoundaryWaveTwo.test.ets:A0024', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0003').assertEqual(6);
        loggedExpect(f.store.stored(), 'ContinuationModeBoundaryWaveTwo.test.ets:A0025', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0003').assertEqual(raw); loggedExpect(f.controller.openScene('note'), 'ContinuationModeBoundaryWaveTwo.test.ets:A0026', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0003').assertTrue();
        loggedExpect(f.controller.sceneSnapshot('note').noteBody, 'ContinuationModeBoundaryWaveTwo.test.ets:A0027', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0003').assertEqual('业务未保存正文');
        loggedExpect(f.controller.sceneSnapshot('note').noteSavedBody, 'ContinuationModeBoundaryWaveTwo.test.ets:A0028', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0003').assertEqual('业务保存正文');
      } finally { f.release(); }
    });

    /**
     * @tc.number SUB_CONTINUATION_MODEBOUNDARYWAVETWO_0400
     * @tc.name com.samples.appcontinuation_ContinuationModeBoundaryWaveTwo_0004
     * @tc.desc 表单定位必须匹配步骤，旧请求失效后新步骤回执不依赖第二坐标
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationModeBoundaryWaveTwo_0004', 0, (): void => {
      const f = new WaveSceneFixture();
      const source = new SceneWorkbench(new WaveSceneStore());
      const page = new ScenePageSession('form');
      try {
        fillWaveForm(source); source.gotoFormStep(1); const incoming = source.document('form'); incoming.revision = 4;
        f.controller.handleLaunch(waveWant(encodeScene(incoming)), AbilityConstant.LaunchReason.CONTINUATION);
        f.controller.markWindowReady();
        page.bind(f.controller, (): void => {});
        const old = waveTarget(f); page.receipt(old, 0, 0, true);
        loggedExpect(f.controller.snapshot().committed, 'ContinuationModeBoundaryWaveTwo.test.ets:A0029', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0004').assertFalse();
        loggedExpect(waveTarget(f).request !== old.request, 'ContinuationModeBoundaryWaveTwo.test.ets:A0030', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0004').assertTrue();
        page.receipt(old, 1, 0, true); loggedExpect(f.store.putCalls, 'ContinuationModeBoundaryWaveTwo.test.ets:A0031', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0004').assertEqual(0);
        f.controller.retryBusinessPosition();
        page.bind(f.controller, (): void => {});
        page.receipt(waveTarget(f), 1, 999, true);
        loggedExpect(f.controller.snapshot().committed, 'ContinuationModeBoundaryWaveTwo.test.ets:A0032', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0004').assertTrue();
        loggedExpect(f.controller.sceneWorkbench.document('form').revision, 'ContinuationModeBoundaryWaveTwo.test.ets:A0033', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0004').assertEqual(4);
        const reopened = new SceneWorkbench(new WaveSceneStore(f.store.stored()));
        loggedExpect(reopened.snapshot().formStep, 'ContinuationModeBoundaryWaveTwo.test.ets:A0034', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0004').assertEqual(1); loggedExpect(reopened.snapshot().formName, 'ContinuationModeBoundaryWaveTwo.test.ets:A0035', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0004').assertEqual('接续用户');
        loggedExpect(reopened.snapshot().formConfirmed, 'ContinuationModeBoundaryWaveTwo.test.ets:A0036', BUNDLE + '_ContinuationModeBoundaryWaveTwo_0004').assertFalse(); reopened.dispose();
      } finally { page.detach(); source.dispose(); f.release(); }
    });
  });
}
