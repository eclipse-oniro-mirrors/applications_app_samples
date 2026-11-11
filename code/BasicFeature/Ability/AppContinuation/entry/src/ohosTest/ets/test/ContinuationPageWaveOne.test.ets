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

import { describe, expect, it } from '@ohos/hypium';
import { ScenePageSession } from '../../../main/ets/learning/scene/ScenePageSession';
import { encodeScene } from '../../../main/ets/learning/scene/SceneModel';
import { WaveSceneFixture, waveNote, waveReading, waveTarget, waveWant } from '../support/ContinuationWaveOneFixtures';

export default function continuationPageWaveOne(): void {
  describe('ContinuationPageWaveOne', (): void => {
    /**
     * @tc.number SUB_CONTINUATION_PAGEWAVEONE_0100
     * @tc.name testContinuationPageWaveOne0001
     * @tc.desc 无控制器先展示未就绪状态，后续绑定读取真实表单并只接收有效通知
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationPageWaveOne0001', 0, (): void => {
      const page = new ScenePageSession('form'); const f = new WaveSceneFixture(); let changes: number = 0;
      try {
        page.bind(undefined, (): void => { changes++; });
        expect(page.snapshot().ready).assertFalse();
        expect(page.target()).assertUndefined();
        expect(changes).assertEqual(1);
        page.bind(f.controller, (): void => { changes++; }); f.controller.sceneWorkbench.setFormField('name', '绑定后的姓名');
        expect(page.snapshot().formName).assertEqual('绑定后的姓名'); expect(changes).assertEqual(4);
        page.hide(); f.controller.sceneWorkbench.setFormField('note', '离页不通知'); expect(changes).assertEqual(4);
        expect(f.store.putCalls).assertEqual(0);
      } finally { page.detach(); f.release(); }
    });

    /**
     * @tc.number SUB_CONTINUATION_PAGEWAVEONE_0200
     * @tc.name testContinuationPageWaveOne0002
     * @tc.desc 页面更换控制器后同时退订旧工作区和旧运行时而只展示新数据
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationPageWaveOne0002', 0, (): void => {
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
        expect(changes).assertEqual(bound); expect(page.snapshot().formName).assertEqual('新姓名');
        current.controller.sceneWorkbench.setFormField('address', '新地址');
        expect(changes).assertEqual(bound + 1); expect(page.snapshot().formAddress).assertEqual('新地址');
        expect(old.store.putCalls).assertEqual(0); expect(current.store.putCalls).assertEqual(0);
      } finally { page.detach(); old.release(); current.release(); }
    });

    /**
     * @tc.number SUB_CONTINUATION_PAGEWAVEONE_0300
     * @tc.name testContinuationPageWaveOne0003
     * @tc.desc 在途绑定仅预览接续位置，修改返回目标副本不能改变真实候选
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationPageWaveOne0003', 0, (): void => {
      const f = new WaveSceneFixture(); const page = new ScenePageSession('reading');
      try {
        f.controller.handleLaunch(waveWant(encodeScene(waveReading('preview-reading', 4, 2, 1))), 3);
        page.bind(f.controller, (): void => {}); const copy = page.target();
        if (copy === undefined) { throw new Error('Missing page target'); }
        copy.document.state.reading.chapter = 0;
        expect(page.snapshot().readingChapter).assertEqual(2);
        expect(waveTarget(f).document.state.reading.anchor).assertEqual(1);
        expect(f.controller.sceneWorkbench.document('reading').state.reading.chapter).assertEqual(0);
        expect(f.controller.sceneWorkbench.snapshot().active).assertEqual('note');
        expect(f.store.putCalls).assertEqual(0);
        expect(f.controller.snapshot().committed).assertFalse();
      } finally { page.detach(); f.release(); }
    });

    /**
     * @tc.number SUB_CONTINUATION_PAGEWAVEONE_0400
     * @tc.name testContinuationPageWaveOne0004
     * @tc.desc 离页使原定位请求失效，旧回执不能写盘而重试重绑后的新回执可提交
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationPageWaveOne0004', 0, (): void => {
      const f = new WaveSceneFixture(); const page = new ScenePageSession('reading');
      try {
        f.controller.handleLaunch(waveWant(encodeScene(waveReading('leave-reading', 3, 1, 2))), 3);
        f.controller.markWindowReady();
        page.bind(f.controller, (): void => {}); const old = waveTarget(f); page.hide();
        page.receipt(old, 1, 2, true);
        expect(f.store.putCalls).assertEqual(0); expect(f.controller.snapshot().committed).assertFalse();
        expect(waveTarget(f).request !== old.request).assertTrue();
        expect(f.controller.snapshot().targetPage).assertEqual('pages/ProcessPage');
        f.controller.retryBusinessPosition();
        page.bind(f.controller, (): void => {});
        page.receipt(waveTarget(f), 1, 2, true);
        expect(f.controller.snapshot().committed).assertTrue();
        expect(f.controller.sceneWorkbench.document('reading').revision).assertEqual(3);
        expect(f.clock.pendingCount()).assertEqual(0);
      } finally { page.detach(); f.release(); }
    });

    /**
     * @tc.number SUB_CONTINUATION_PAGEWAVEONE_0500
     * @tc.name testContinuationPageWaveOne0005
     * @tc.desc 旧页面离页不能使已生成的新定位请求再次失效
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationPageWaveOne0005', 0, (): void => {
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
        expect(current.request !== oldRequest).assertTrue(); expect(waveTarget(f).request).assertEqual(current.request);
        expect(f.controller.snapshot().targetPage).assertEqual('pages/ReadingScenePage');
        expect(f.store.putCalls).assertEqual(0);
        newPage.receipt(current, 2, 2, true);
        expect(f.controller.snapshot().committed).assertTrue();
        expect(f.controller.sceneWorkbench.document('reading').state.reading.chapter).assertEqual(2);
      } finally { oldPage.detach(); newPage.detach(); f.release(); }
    });

    /**
     * @tc.number SUB_CONTINUATION_PAGEWAVEONE_0600
     * @tc.name testContinuationPageWaveOne0006
     * @tc.desc 暂时退订不会撤销在途定位，重新绑定原请求即可提交且无重复通知
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationPageWaveOne0006', 0, (): void => {
      const f = new WaveSceneFixture(); const page = new ScenePageSession('note'); let changes: number = 0;
      try {
        f.controller.handleLaunch(waveWant(encodeScene(waveNote('detach-note', 2, '待接续正文'))), 3);
        page.bind(f.controller, (): void => { changes++; });
        const original = waveTarget(f);
        page.detach();
        const detached = changes;
        f.controller.markWindowReady();
        expect(changes).assertEqual(detached);
        expect(waveTarget(f).request).assertEqual(original.request);
        expect(f.store.putCalls).assertEqual(0); page.bind(f.controller, (): void => { changes++; });
        page.receipt(original, 0, 5, true);
        expect(f.controller.snapshot().committed).assertTrue();
        expect(page.snapshot().noteSavedBody).assertEqual('待接续正文');
        expect(f.store.flushCalls).assertEqual(1);
      } finally { page.detach(); f.release(); }
    });

    /**
     * @tc.number SUB_CONTINUATION_PAGEWAVEONE_0700
     * @tc.name testContinuationPageWaveOne0007
     * @tc.desc 定位回执场景身份或修订错误时忽略且不推进代次，正确身份仍可提交
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationPageWaveOne0007', 0, (): void => {
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
        expect(f.store.putCalls).assertEqual(0); expect(waveTarget(f).request).assertEqual(target.request);
        expect(f.controller.snapshot().businessPositionState).assertEqual('业务候选待定位：需实际选区/段落/步骤回执');
        page.bind(f.controller, (): void => {}); page.receipt(target, 1, 1, true);
        expect(f.controller.snapshot().committed).assertTrue();
        expect(f.controller.sceneWorkbench.document('reading').documentId).assertEqual('receipt-id');
      } finally { wrongPage.detach(); page.detach(); f.release(); }
    });

    /**
     * @tc.number SUB_CONTINUATION_PAGEWAVEONE_0800
     * @tc.name testContinuationPageWaveOne0008
     * @tc.desc 成功标记不替代实际笔记选区匹配，错误坐标换代后需新请求正确回执
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationPageWaveOne0008', 0, (): void => {
      const f = new WaveSceneFixture(); const page = new ScenePageSession('note');
      try {
        const note = waveNote('coordinate-note', 3, 'A😀BC');
        note.state.note.selectionStart = 1;
        note.state.note.selectionEnd = 3;
        f.controller.handleLaunch(waveWant(encodeScene(note)), 3);
        f.controller.markWindowReady();
        page.bind(f.controller, (): void => {});
        const old = waveTarget(f); page.receipt(old, 0, 3, true);
        expect(f.store.putCalls).assertEqual(0); expect(f.controller.snapshot().committed).assertFalse();
        expect(waveTarget(f).request !== old.request).assertTrue();
        expect(f.controller.snapshot().businessPositionState).assertEqual('业务定位失败，候选未提交；可重试定位或停止');
        page.receipt(old, 1, 3, true); expect(f.store.putCalls).assertEqual(0);
        f.controller.retryBusinessPosition();
        page.bind(f.controller, (): void => {});
        page.receipt(waveTarget(f), 1, 3, true);
        expect(f.controller.sceneWorkbench.document('note').state.note.selectionStart).assertEqual(1);
        expect(f.controller.snapshot().committed).assertTrue();
      } finally { page.detach(); f.release(); }
    });
  });
}
