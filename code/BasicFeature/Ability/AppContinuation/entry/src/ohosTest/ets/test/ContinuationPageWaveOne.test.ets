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
import { ScenePageSession } from '../../../main/ets/learning/scene/ScenePageSession';
import { encodeScene } from '../../../main/ets/learning/scene/SceneModel';
import { WaveSceneFixture, waveNote, waveReading, waveTarget, waveWant } from '../support/ContinuationWaveOneFixtures';

export default function continuationPageWaveOne(): void {
  describe('ContinuationPageWaveOne', (): void => {
    /**
     * @tc.number SUB_CONTINUATION_PAGEWAVEONE_0100
     * @tc.name com.samples.appcontinuation_ContinuationPageWaveOne_0001
     * @tc.desc 无控制器先展示未就绪状态，后续绑定读取真实表单并只接收有效通知
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationPageWaveOne_0001', 0, (): void => {
      const page = new ScenePageSession('form'); const f = new WaveSceneFixture(); let changes: number = 0;
      try {
        page.bind(undefined, (): void => { changes++; });
        loggedExpect(page.snapshot().ready, 'ContinuationPageWaveOne.test.ets:A0001', BUNDLE + '_ContinuationPageWaveOne_0001').assertFalse();
        loggedExpect(page.target(), 'ContinuationPageWaveOne.test.ets:A0002', BUNDLE + '_ContinuationPageWaveOne_0001').assertUndefined();
        loggedExpect(changes, 'ContinuationPageWaveOne.test.ets:A0003', BUNDLE + '_ContinuationPageWaveOne_0001').assertEqual(1);
        page.bind(f.controller, (): void => { changes++; }); f.controller.sceneWorkbench.setFormField('name', '绑定后的姓名');
        loggedExpect(page.snapshot().formName, 'ContinuationPageWaveOne.test.ets:A0004', BUNDLE + '_ContinuationPageWaveOne_0001').assertEqual('绑定后的姓名'); loggedExpect(changes, 'ContinuationPageWaveOne.test.ets:A0005', BUNDLE + '_ContinuationPageWaveOne_0001').assertEqual(4);
        page.hide(); f.controller.sceneWorkbench.setFormField('note', '离页不通知'); loggedExpect(changes, 'ContinuationPageWaveOne.test.ets:A0006', BUNDLE + '_ContinuationPageWaveOne_0001').assertEqual(4);
        loggedExpect(f.store.putCalls, 'ContinuationPageWaveOne.test.ets:A0007', BUNDLE + '_ContinuationPageWaveOne_0001').assertEqual(0);
      } finally { page.detach(); f.release(); }
    });

    /**
     * @tc.number SUB_CONTINUATION_PAGEWAVEONE_0200
     * @tc.name com.samples.appcontinuation_ContinuationPageWaveOne_0002
     * @tc.desc 页面更换控制器后同时退订旧工作区和旧运行时而只展示新数据
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationPageWaveOne_0002', 0, (): void => {
      const old = new WaveSceneFixture();
      const current = new WaveSceneFixture();
      const page = new ScenePageSession('form');
      let changes: number = 0;
      try {
        old.controller.openScene('form'); old.controller.sceneWorkbench.setFormField('name', '旧姓名');
        current.controller.openScene('form'); current.controller.sceneWorkbench.setFormField('name', '新姓名');
        page.bind(old.controller, (): void => { changes++; });
        page.bind(current.controller, (): void => { changes++; });
        const bound = changes;
        old.controller.sceneWorkbench.setFormField('name', '不应串入'); old.controller.updateText('旧运行时通知');
        loggedExpect(changes, 'ContinuationPageWaveOne.test.ets:A0008', BUNDLE + '_ContinuationPageWaveOne_0002').assertEqual(bound); loggedExpect(page.snapshot().formName, 'ContinuationPageWaveOne.test.ets:A0009', BUNDLE + '_ContinuationPageWaveOne_0002').assertEqual('新姓名');
        current.controller.sceneWorkbench.setFormField('address', '新地址');
        loggedExpect(changes, 'ContinuationPageWaveOne.test.ets:A0010', BUNDLE + '_ContinuationPageWaveOne_0002').assertEqual(bound + 1); loggedExpect(page.snapshot().formAddress, 'ContinuationPageWaveOne.test.ets:A0011', BUNDLE + '_ContinuationPageWaveOne_0002').assertEqual('新地址');
        loggedExpect(old.store.putCalls, 'ContinuationPageWaveOne.test.ets:A0012', BUNDLE + '_ContinuationPageWaveOne_0002').assertEqual(0); loggedExpect(current.store.putCalls, 'ContinuationPageWaveOne.test.ets:A0013', BUNDLE + '_ContinuationPageWaveOne_0002').assertEqual(0);
      } finally { page.detach(); old.release(); current.release(); }
    });

    /**
     * @tc.number SUB_CONTINUATION_PAGEWAVEONE_0300
     * @tc.name com.samples.appcontinuation_ContinuationPageWaveOne_0003
     * @tc.desc 在途绑定仅预览接续位置，修改返回目标副本不能改变真实候选
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationPageWaveOne_0003', 0, (): void => {
      const f = new WaveSceneFixture(); const page = new ScenePageSession('reading');
      try {
        f.controller.handleLaunch(waveWant(encodeScene(waveReading('preview-reading', 4, 2, 1))), 3);
        page.bind(f.controller, (): void => {}); const copy = page.target();
        if (copy === undefined) { throw new Error('Missing page target'); }
        copy.document.state.reading.chapter = 0;
        loggedExpect(page.snapshot().readingChapter, 'ContinuationPageWaveOne.test.ets:A0014', BUNDLE + '_ContinuationPageWaveOne_0003').assertEqual(2);
        loggedExpect(waveTarget(f).document.state.reading.anchor, 'ContinuationPageWaveOne.test.ets:A0015', BUNDLE + '_ContinuationPageWaveOne_0003').assertEqual(1);
        loggedExpect(f.controller.sceneWorkbench.document('reading').state.reading.chapter, 'ContinuationPageWaveOne.test.ets:A0016', BUNDLE + '_ContinuationPageWaveOne_0003').assertEqual(0);
        loggedExpect(f.controller.sceneWorkbench.snapshot().active, 'ContinuationPageWaveOne.test.ets:A0017', BUNDLE + '_ContinuationPageWaveOne_0003').assertEqual('note');
        loggedExpect(f.store.putCalls, 'ContinuationPageWaveOne.test.ets:A0018', BUNDLE + '_ContinuationPageWaveOne_0003').assertEqual(0);
        loggedExpect(f.controller.snapshot().committed, 'ContinuationPageWaveOne.test.ets:A0019', BUNDLE + '_ContinuationPageWaveOne_0003').assertFalse();
      } finally { page.detach(); f.release(); }
    });

    /**
     * @tc.number SUB_CONTINUATION_PAGEWAVEONE_0400
     * @tc.name com.samples.appcontinuation_ContinuationPageWaveOne_0004
     * @tc.desc 离页使原定位请求失效，旧回执不能写盘而重试重绑后的新回执可提交
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationPageWaveOne_0004', 0, (): void => {
      const f = new WaveSceneFixture(); const page = new ScenePageSession('reading');
      try {
        f.controller.handleLaunch(waveWant(encodeScene(waveReading('leave-reading', 3, 1, 2))), 3);
        f.controller.markWindowReady();
        page.bind(f.controller, (): void => {}); const old = waveTarget(f); page.hide();
        page.receipt(old, 1, 2, true);
        loggedExpect(f.store.putCalls, 'ContinuationPageWaveOne.test.ets:A0020', BUNDLE + '_ContinuationPageWaveOne_0004').assertEqual(0); loggedExpect(f.controller.snapshot().committed, 'ContinuationPageWaveOne.test.ets:A0021', BUNDLE + '_ContinuationPageWaveOne_0004').assertFalse();
        loggedExpect(waveTarget(f).request !== old.request, 'ContinuationPageWaveOne.test.ets:A0022', BUNDLE + '_ContinuationPageWaveOne_0004').assertTrue();
        loggedExpect(f.controller.snapshot().targetPage, 'ContinuationPageWaveOne.test.ets:A0023', BUNDLE + '_ContinuationPageWaveOne_0004').assertEqual('continuation/pages/ProcessPage');
        f.controller.retryBusinessPosition();
        page.bind(f.controller, (): void => {});
        page.receipt(waveTarget(f), 1, 2, true);
        loggedExpect(f.controller.snapshot().committed, 'ContinuationPageWaveOne.test.ets:A0024', BUNDLE + '_ContinuationPageWaveOne_0004').assertTrue();
        loggedExpect(f.controller.sceneWorkbench.document('reading').revision, 'ContinuationPageWaveOne.test.ets:A0025', BUNDLE + '_ContinuationPageWaveOne_0004').assertEqual(3);
        loggedExpect(f.clock.pendingCount(), 'ContinuationPageWaveOne.test.ets:A0026', BUNDLE + '_ContinuationPageWaveOne_0004').assertEqual(0);
      } finally { page.detach(); f.release(); }
    });

    /**
     * @tc.number SUB_CONTINUATION_PAGEWAVEONE_0500
     * @tc.name com.samples.appcontinuation_ContinuationPageWaveOne_0005
     * @tc.desc 旧页面离页不能使已生成的新定位请求再次失效
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationPageWaveOne_0005', 0, (): void => {
      const f = new WaveSceneFixture();
      const oldPage = new ScenePageSession('reading');
      const newPage = new ScenePageSession('reading');
      try {
        f.controller.handleLaunch(waveWant(encodeScene(waveReading('new-page', 5, 2, 2))), 3);
        f.controller.markWindowReady();
        oldPage.bind(f.controller, (): void => {}); const oldRequest = waveTarget(f).request;
        f.controller.retryBusinessPosition();
        const current = waveTarget(f);
        newPage.bind(f.controller, (): void => {});
        oldPage.hide();
        loggedExpect(current.request !== oldRequest, 'ContinuationPageWaveOne.test.ets:A0027', BUNDLE + '_ContinuationPageWaveOne_0005').assertTrue(); loggedExpect(waveTarget(f).request, 'ContinuationPageWaveOne.test.ets:A0028', BUNDLE + '_ContinuationPageWaveOne_0005').assertEqual(current.request);
        loggedExpect(f.controller.snapshot().targetPage, 'ContinuationPageWaveOne.test.ets:A0029', BUNDLE + '_ContinuationPageWaveOne_0005').assertEqual('continuation/pages/ReadingScenePage');
        loggedExpect(f.store.putCalls, 'ContinuationPageWaveOne.test.ets:A0030', BUNDLE + '_ContinuationPageWaveOne_0005').assertEqual(0);
        newPage.receipt(current, 2, 2, true);
        loggedExpect(f.controller.snapshot().committed, 'ContinuationPageWaveOne.test.ets:A0031', BUNDLE + '_ContinuationPageWaveOne_0005').assertTrue();
        loggedExpect(f.controller.sceneWorkbench.document('reading').state.reading.chapter, 'ContinuationPageWaveOne.test.ets:A0032', BUNDLE + '_ContinuationPageWaveOne_0005').assertEqual(2);
      } finally { oldPage.detach(); newPage.detach(); f.release(); }
    });

    /**
     * @tc.number SUB_CONTINUATION_PAGEWAVEONE_0600
     * @tc.name com.samples.appcontinuation_ContinuationPageWaveOne_0006
     * @tc.desc 暂时退订不会撤销在途定位，重新绑定原请求即可提交且无重复通知
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationPageWaveOne_0006', 0, (): void => {
      const f = new WaveSceneFixture(); const page = new ScenePageSession('note'); let changes: number = 0;
      try {
        f.controller.handleLaunch(waveWant(encodeScene(waveNote('detach-note', 2, '待接续正文'))), 3);
        page.bind(f.controller, (): void => { changes++; });
        const original = waveTarget(f);
        page.detach();
        const detached = changes;
        f.controller.markWindowReady();
        loggedExpect(changes, 'ContinuationPageWaveOne.test.ets:A0033', BUNDLE + '_ContinuationPageWaveOne_0006').assertEqual(detached);
        loggedExpect(waveTarget(f).request, 'ContinuationPageWaveOne.test.ets:A0034', BUNDLE + '_ContinuationPageWaveOne_0006').assertEqual(original.request);
        loggedExpect(f.store.putCalls, 'ContinuationPageWaveOne.test.ets:A0035', BUNDLE + '_ContinuationPageWaveOne_0006').assertEqual(0); page.bind(f.controller, (): void => { changes++; });
        page.receipt(original, 0, 5, true);
        loggedExpect(f.controller.snapshot().committed, 'ContinuationPageWaveOne.test.ets:A0036', BUNDLE + '_ContinuationPageWaveOne_0006').assertTrue();
        loggedExpect(page.snapshot().noteSavedBody, 'ContinuationPageWaveOne.test.ets:A0037', BUNDLE + '_ContinuationPageWaveOne_0006').assertEqual('待接续正文');
        loggedExpect(f.store.flushCalls, 'ContinuationPageWaveOne.test.ets:A0038', BUNDLE + '_ContinuationPageWaveOne_0006').assertEqual(1);
      } finally { page.detach(); f.release(); }
    });

    /**
     * @tc.number SUB_CONTINUATION_PAGEWAVEONE_0700
     * @tc.name com.samples.appcontinuation_ContinuationPageWaveOne_0007
     * @tc.desc 定位回执场景身份或修订错误时忽略且不推进代次，正确身份仍可提交
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationPageWaveOne_0007', 0, (): void => {
      const f = new WaveSceneFixture();
      const wrongPage = new ScenePageSession('note');
      const page = new ScenePageSession('reading');
      try {
        f.controller.handleLaunch(waveWant(encodeScene(waveReading('receipt-id', 6, 1, 1))), 3);
        f.controller.markWindowReady();
        wrongPage.bind(f.controller, (): void => {}); const target = waveTarget(f);
        wrongPage.receipt(target, 1, 1, true);
        f.controller.reportScenePosition(target.request, 'reading', 'wrong-document', 6, 1, 1, true);
        f.controller.reportScenePosition(target.request, 'reading', 'receipt-id', 5, 1, 1, true);
        loggedExpect(f.store.putCalls, 'ContinuationPageWaveOne.test.ets:A0039', BUNDLE + '_ContinuationPageWaveOne_0007').assertEqual(0); loggedExpect(waveTarget(f).request, 'ContinuationPageWaveOne.test.ets:A0040', BUNDLE + '_ContinuationPageWaveOne_0007').assertEqual(target.request);
        loggedExpect(f.controller.snapshot().businessPositionState, 'ContinuationPageWaveOne.test.ets:A0041', BUNDLE + '_ContinuationPageWaveOne_0007').assertEqual('业务候选待定位：需实际选区/段落/步骤回执');
        page.bind(f.controller, (): void => {}); page.receipt(target, 1, 1, true);
        loggedExpect(f.controller.snapshot().committed, 'ContinuationPageWaveOne.test.ets:A0042', BUNDLE + '_ContinuationPageWaveOne_0007').assertTrue();
        loggedExpect(f.controller.sceneWorkbench.document('reading').documentId, 'ContinuationPageWaveOne.test.ets:A0043', BUNDLE + '_ContinuationPageWaveOne_0007').assertEqual('receipt-id');
      } finally { wrongPage.detach(); page.detach(); f.release(); }
    });

    /**
     * @tc.number SUB_CONTINUATION_PAGEWAVEONE_0800
     * @tc.name com.samples.appcontinuation_ContinuationPageWaveOne_0008
     * @tc.desc 成功标记不替代实际笔记选区匹配，错误坐标换代后需新请求正确回执
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationPageWaveOne_0008', 0, (): void => {
      const f = new WaveSceneFixture(); const page = new ScenePageSession('note');
      try {
        const note = waveNote('coordinate-note', 3, 'A😀BC');
        note.state.note.selectionStart = 1;
        note.state.note.selectionEnd = 3;
        f.controller.handleLaunch(waveWant(encodeScene(note)), 3);
        f.controller.markWindowReady();
        page.bind(f.controller, (): void => {});
        const old = waveTarget(f); page.receipt(old, 0, 3, true);
        loggedExpect(f.store.putCalls, 'ContinuationPageWaveOne.test.ets:A0044', BUNDLE + '_ContinuationPageWaveOne_0008').assertEqual(0); loggedExpect(f.controller.snapshot().committed, 'ContinuationPageWaveOne.test.ets:A0045', BUNDLE + '_ContinuationPageWaveOne_0008').assertFalse();
        loggedExpect(waveTarget(f).request !== old.request, 'ContinuationPageWaveOne.test.ets:A0046', BUNDLE + '_ContinuationPageWaveOne_0008').assertTrue();
        loggedExpect(f.controller.snapshot().businessPositionState, 'ContinuationPageWaveOne.test.ets:A0047', BUNDLE + '_ContinuationPageWaveOne_0008').assertEqual('业务定位失败，候选未提交；可重试定位或停止');
        page.receipt(old, 1, 3, true); loggedExpect(f.store.putCalls, 'ContinuationPageWaveOne.test.ets:A0048', BUNDLE + '_ContinuationPageWaveOne_0008').assertEqual(0);
        f.controller.retryBusinessPosition();
        page.bind(f.controller, (): void => {});
        page.receipt(waveTarget(f), 1, 3, true);
        loggedExpect(f.controller.sceneWorkbench.document('note').state.note.selectionStart, 'ContinuationPageWaveOne.test.ets:A0049', BUNDLE + '_ContinuationPageWaveOne_0008').assertEqual(1);
        loggedExpect(f.controller.snapshot().committed, 'ContinuationPageWaveOne.test.ets:A0050', BUNDLE + '_ContinuationPageWaveOne_0008').assertTrue();
      } finally { page.detach(); f.release(); }
    });
  });
}
