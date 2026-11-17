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

/** Real SceneWorkbench + LearningController composition, with controlled native/store/widget receipts only. */
import { describe } from '@ohos/hypium';
import { loggedExpect } from '../support/LoggedExpect';
import { AbilityConstant, Want } from '@kit.AbilityKit';
import { LearningController, ScenePositionTarget } from '../../../main/ets/learning/LearningController';
import { LearningDependencies, LearningStore } from '../../../main/ets/learning/LearningPorts';
import { TEXT_PAYLOAD_KEY } from '../../../main/ets/learning/LearningTypes';
import { ScenePageSession } from '../../../main/ets/learning/scene/ScenePageSession';
import { SceneStorePort, SceneWorkbench } from '../../../main/ets/learning/scene/SceneWorkbench';
import {
  decodeScene, decodeWorkspace, encodeScene, SCENE_PAYLOAD_KEY, SCENE_STORE_KEY, SceneDocument
} from '../../../main/ets/learning/scene/SceneModel';
import {
  FakeContinueNative, FakeLearningEnvironment, ManualLearningClock, resultInfo
} from '../support/LearningFixtures';
import { BUNDLE, scenario } from '../support/BoundedCase';

class SceneTestStore implements LearningStore, SceneStorePort {
  private cache: Map<string, string> = new Map<string, string>();
  private disk: Map<string, string> = new Map<string, string>();
  public putCalls: number = 0;
  public flushCalls: number = 0;
  public deleteCalls: number = 0;
  public failPut: number[] = [];
  public failFlush: number[] = [];
  public failDelete: boolean = false;
  constructor(raw: string = '') {
    if (raw.length > 0) { this.cache.set(SCENE_STORE_KEY, raw); this.disk.set(SCENE_STORE_KEY, raw); }
  }
  public getSync(key: string, fallback: string): Object { return this.cache.get(key) ?? fallback; }
  public putSync(key: string, value: string): void {
    this.putCalls++;
    this.cache.set(key, value);
    if (this.failPut.indexOf(this.putCalls) >= 0) { throw new Error('controlled put failure after cache mutation'); }
  }
  public deleteSync(key: string): void {
    this.deleteCalls++;
    if (this.failDelete) { throw new Error('controlled compensation failure'); }
    this.cache.delete(key);
  }
  public flushSync(): void {
    this.flushCalls++;
    if (this.failFlush.indexOf(this.flushCalls) >= 0) { throw new Error('controlled flush failure'); }
    this.disk = new Map<string, string>(this.cache);
  }
  public stored(): string { return this.disk.get(SCENE_STORE_KEY) ?? ''; }
}

class SceneControllerFixture implements LearningDependencies {
  public readonly clock: ManualLearningClock = new ManualLearningClock();
  public readonly native: FakeContinueNative = new FakeContinueNative();
  public readonly environment: FakeLearningEnvironment = new FakeLearningEnvironment();
  public readonly store: SceneTestStore;
  public readonly controller: LearningController;
  constructor(raw: string = '') {
    this.store = new SceneTestStore(raw);
    this.controller = new LearningController(undefined, this);
  }
  public openStore(): LearningStore { return this.store; }
  public release(): void { this.controller.dispose(); this.clock.clearAll(); }
}

function inbound(raw: string): Want {
  const parameters: Record<string, Object> = {}; parameters[SCENE_PAYLOAD_KEY] = raw;
  return { parameters: parameters } as Want;
}
function targetOf(f: SceneControllerFixture): ScenePositionTarget {
  const target = f.controller.positionTarget();
  if (target === undefined) { throw new Error('Missing production position target'); }
  return target;
}
function receipt(f: SceneControllerFixture, target: ScenePositionTarget, ok: boolean = true): void {
  const state = target.document.state;
  f.controller.reportScenePosition(target.request, state.kind, target.document.documentId, target.document.revision,
    state.kind === 'note' ? state.note.selectionStart :
      state.kind === 'reading' ? state.reading.chapter : state.form.step,
    state.kind === 'note' ? state.note.selectionEnd : state.kind === 'reading' ? state.reading.anchor : 0, ok);
}
function outgoing(f: SceneControllerFixture): string {
  const parameters: Record<string, Object> = {};
  loggedExpect(f.controller.buildContinuation(parameters), 'ContinuationScenes.test.ets:A0001').assertEqual(AbilityConstant.OnContinueResult.AGREE);
  // ArkTS 不支持 delete：写入端以空串标记"未携带"，此处断言不残留可解析的文本载荷。
  loggedExpect(String(parameters[TEXT_PAYLOAD_KEY] ?? '').length, 'ContinuationScenes.test.ets:A0002').assertEqual(0);
  return parameters[SCENE_PAYLOAD_KEY] as string;
}

export default function continuationScenes(): void {
  describe('ContinuationScenes', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENES_0100
     * @tc.name      com.samples.appcontinuation_ContinuationScenes_0001
     * @tc.desc      Verify sC 001 persistence is a transaction
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario(BUNDLE + '_ContinuationScenes_0001', (): void => {
      const store = new SceneTestStore(); const work = new SceneWorkbench(store);
      work.open('note'); work.editNote('标题A', 'A🌱BC', 1, 3); loggedExpect(work.saveNote(), 'ContinuationScenes.test.ets:A0003', BUNDLE + '_ContinuationScenes_0001').assertTrue();
      const baseline = work.snapshot(); const raw = store.stored();
      work.editNote('标题B', '编辑内容', 0, 2);
      store.failPut = [store.putCalls + 1];
      loggedExpect(work.saveNote(), 'ContinuationScenes.test.ets:A0004', BUNDLE + '_ContinuationScenes_0001').assertFalse();
      loggedExpect(work.snapshot().revision, 'ContinuationScenes.test.ets:A0005', BUNDLE + '_ContinuationScenes_0001').assertEqual(baseline.revision);
      loggedExpect(work.snapshot().historyCount, 'ContinuationScenes.test.ets:A0006', BUNDLE + '_ContinuationScenes_0001').assertEqual(0);
      loggedExpect(work.snapshot().noteDirty, 'ContinuationScenes.test.ets:A0007', BUNDLE + '_ContinuationScenes_0001').assertTrue();
      loggedExpect(work.snapshot().noteSavedBody, 'ContinuationScenes.test.ets:A0008', BUNDLE + '_ContinuationScenes_0001').assertEqual('A🌱BC');
      loggedExpect(store.stored(), 'ContinuationScenes.test.ets:A0009', BUNDLE + '_ContinuationScenes_0001').assertEqual(raw);
      store.failFlush = [store.flushCalls + 1];
      loggedExpect(work.saveNote(), 'ContinuationScenes.test.ets:A0010', BUNDLE + '_ContinuationScenes_0001').assertFalse(); loggedExpect(store.stored(), 'ContinuationScenes.test.ets:A0011', BUNDLE + '_ContinuationScenes_0001').assertEqual(raw);
      loggedExpect(work.snapshot().revision, 'ContinuationScenes.test.ets:A0012', BUNDLE + '_ContinuationScenes_0001').assertEqual(baseline.revision);
      loggedExpect(work.saveNote(), 'ContinuationScenes.test.ets:A0013', BUNDLE + '_ContinuationScenes_0001').assertTrue();
      const history = work.historyDocuments();
      loggedExpect(history.length, 'ContinuationScenes.test.ets:A0014', BUNDLE + '_ContinuationScenes_0001').assertEqual(1); loggedExpect(history[0].state.note.body, 'ContinuationScenes.test.ets:A0015', BUNDLE + '_ContinuationScenes_0001').assertEqual('A🌱BC');
      loggedExpect(history[0].state.note.title, 'ContinuationScenes.test.ets:A0016', BUNDLE + '_ContinuationScenes_0001').assertEqual('标题A'); loggedExpect(history[0].state.note.selectionEnd, 'ContinuationScenes.test.ets:A0017', BUNDLE + '_ContinuationScenes_0001').assertEqual(3);
      const reopened = new SceneWorkbench(new SceneTestStore(store.stored()));
      loggedExpect(reopened.snapshot().noteTitle, 'ContinuationScenes.test.ets:A0018', BUNDLE + '_ContinuationScenes_0001').assertEqual('标题B'); loggedExpect(reopened.snapshot().noteDirty, 'ContinuationScenes.test.ets:A0019', BUNDLE + '_ContinuationScenes_0001').assertFalse();
      work.dispose(); reopened.dispose();
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENES_0200
     * @tc.name      com.samples.appcontinuation_ContinuationScenes_0002
     * @tc.desc      Verify sC 002 discard restores complete baseline
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario(BUNDLE + '_ContinuationScenes_0002', (): void => {
      const work = new SceneWorkbench(new SceneTestStore());
      work.open('note'); work.editNote('原题', 'A🌱BC', 1, 3); work.saveNote();
      work.editNote('改题', '别的内容', 0, 4); work.discardNote();
      loggedExpect(work.snapshot().noteTitle, 'ContinuationScenes.test.ets:A0020', BUNDLE + '_ContinuationScenes_0002').assertEqual('原题'); loggedExpect(work.snapshot().noteBody, 'ContinuationScenes.test.ets:A0021', BUNDLE + '_ContinuationScenes_0002').assertEqual('A🌱BC');
      loggedExpect(work.snapshot().noteSelectionStart, 'ContinuationScenes.test.ets:A0022', BUNDLE + '_ContinuationScenes_0002').assertEqual(1);
      loggedExpect(work.snapshot().noteSelectionEnd, 'ContinuationScenes.test.ets:A0023', BUNDLE + '_ContinuationScenes_0002').assertEqual(3);
      loggedExpect(work.hasDirtyWork(), 'ContinuationScenes.test.ets:A0024', BUNDLE + '_ContinuationScenes_0002').assertFalse(); loggedExpect(work.open('reading'), 'ContinuationScenes.test.ets:A0025', BUNDLE + '_ContinuationScenes_0002').assertTrue(); work.dispose();
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENES_0300
     * @tc.name      com.samples.appcontinuation_ContinuationScenes_0003
     * @tc.desc      Verify sC 003 compensation failure freezes
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario(BUNDLE + '_ContinuationScenes_0003', (): void => {
      const store = new SceneTestStore(); const work = new SceneWorkbench(store);
      work.editNote('草稿', '必须保留', 0, 4); store.failFlush = [1]; store.failDelete = true;
      loggedExpect(work.saveNote(), 'ContinuationScenes.test.ets:A0026', BUNDLE + '_ContinuationScenes_0003').assertFalse(); loggedExpect(work.snapshot().storageFrozen, 'ContinuationScenes.test.ets:A0027', BUNDLE + '_ContinuationScenes_0003').assertTrue();
      const writes = store.putCalls; loggedExpect(work.saveNote(), 'ContinuationScenes.test.ets:A0028', BUNDLE + '_ContinuationScenes_0003').assertFalse(); loggedExpect(work.resetWorkspace(), 'ContinuationScenes.test.ets:A0029', BUNDLE + '_ContinuationScenes_0003').assertFalse();
      loggedExpect(store.putCalls, 'ContinuationScenes.test.ets:A0030', BUNDLE + '_ContinuationScenes_0003').assertEqual(writes); loggedExpect(work.snapshot().noteBody, 'ContinuationScenes.test.ets:A0031', BUNDLE + '_ContinuationScenes_0003').assertEqual('必须保留');
      loggedExpect(work.snapshot().revision, 'ContinuationScenes.test.ets:A0032', BUNDLE + '_ContinuationScenes_0003').assertEqual(0); loggedExpect(work.snapshot().noteDirty, 'ContinuationScenes.test.ets:A0033', BUNDLE + '_ContinuationScenes_0003').assertTrue(); work.dispose();
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENES_0400
     * @tc.name      com.samples.appcontinuation_ContinuationScenes_0004
     * @tc.desc      Verify sC 004 partial form and validation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario(BUNDLE + '_ContinuationScenes_0004', (): void => {
      const store = new SceneTestStore(); const work = new SceneWorkbench(store); work.open('form');
      loggedExpect(work.setFormField('name', '小明'), 'ContinuationScenes.test.ets:A0034', BUNDLE + '_ContinuationScenes_0004').assertTrue();
      loggedExpect(work.setFormField('name', 'x'.repeat(41)), 'ContinuationScenes.test.ets:A0035', BUNDLE + '_ContinuationScenes_0004').assertFalse();
      loggedExpect(work.snapshot().formName, 'ContinuationScenes.test.ets:A0036', BUNDLE + '_ContinuationScenes_0004').assertEqual('小明');
      loggedExpect(work.setFormField('address', '\uD800'), 'ContinuationScenes.test.ets:A0037', BUNDLE + '_ContinuationScenes_0004').assertFalse();
      loggedExpect(work.gotoFormStep(2), 'ContinuationScenes.test.ets:A0038', BUNDLE + '_ContinuationScenes_0004').assertFalse(); loggedExpect(work.saveForm(), 'ContinuationScenes.test.ets:A0039', BUNDLE + '_ContinuationScenes_0004').assertTrue();
      loggedExpect(work.snapshot().formDirty, 'ContinuationScenes.test.ets:A0040', BUNDLE + '_ContinuationScenes_0004').assertFalse(); loggedExpect(work.confirmForm(), 'ContinuationScenes.test.ets:A0041', BUNDLE + '_ContinuationScenes_0004').assertFalse();
      const reopened = new SceneWorkbench(new SceneTestStore(store.stored()));
      loggedExpect(reopened.snapshot().formName, 'ContinuationScenes.test.ets:A0042', BUNDLE + '_ContinuationScenes_0004').assertEqual('小明'); loggedExpect(reopened.snapshot().formPhone, 'ContinuationScenes.test.ets:A0043', BUNDLE + '_ContinuationScenes_0004').assertEqual('');
      reopened.setFormField('phone', '13800000000'); loggedExpect(reopened.nextFormStep(), 'ContinuationScenes.test.ets:A0044', BUNDLE + '_ContinuationScenes_0004').assertTrue();
      reopened.setFormField('address', '受控测试地址'); loggedExpect(reopened.nextFormStep(), 'ContinuationScenes.test.ets:A0045', BUNDLE + '_ContinuationScenes_0004').assertTrue();
      reopened.setFormAgreed(true);
      loggedExpect(reopened.confirmForm(), 'ContinuationScenes.test.ets:A0046', BUNDLE + '_ContinuationScenes_0004').assertTrue();
      loggedExpect(reopened.snapshot().formConfirmed, 'ContinuationScenes.test.ets:A0047', BUNDLE + '_ContinuationScenes_0004').assertTrue();
      work.dispose(); reopened.dispose();
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENES_0500
     * @tc.name      com.samples.appcontinuation_ContinuationScenes_0005
     * @tc.desc      Verify sC 005 scene system roundtrip
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario(BUNDLE + '_ContinuationScenes_0005', (): void => {
      ['note', 'reading', 'form'].forEach((kind: string): void => {
        const source = new SceneControllerFixture(); const target = new SceneControllerFixture();
        try {
          loggedExpect(source.controller.openScene(kind), 'ContinuationScenes.test.ets:A0048', BUNDLE + '_ContinuationScenes_0005').assertTrue();
          const work = source.controller.sceneWorkbench;
          if (kind === 'note') {
            work.editNote('未保存标题', 'A🌱BC', 1, 3);
          } else if (kind === 'reading') {
            work.gotoParagraph(1, 2);
            work.addBookmark();
          } else {
            work.setFormField('name', '受控姓名');
            work.setFormField('phone', '13800000000');
            work.nextFormStep();
            work.setFormField('address', '半填');
          }
          const raw = outgoing(source); const first = decodeScene(raw).value as SceneDocument;
          target.controller.handleLaunch(inbound(raw), AbilityConstant.LaunchReason.PREPARE_CONTINUATION); target.controller.markWindowReady();
          target.native.deliverOn(0, undefined, resultInfo(0));
          loggedExpect(target.controller.snapshot().committed, 'ContinuationScenes.test.ets:A0049', BUNDLE + '_ContinuationScenes_0005').assertFalse(); loggedExpect(target.store.putCalls, 'ContinuationScenes.test.ets:A0050', BUNDLE + '_ContinuationScenes_0005').assertEqual(0);
          loggedExpect(target.native.onCallbacks.length, 'ContinuationScenes.test.ets:A0051', BUNDLE + '_ContinuationScenes_0005').assertEqual(1);
          receipt(target, targetOf(target));
          loggedExpect(target.controller.snapshot().committed, 'ContinuationScenes.test.ets:A0052', BUNDLE + '_ContinuationScenes_0005').assertTrue();
          loggedExpect(target.controller.snapshot().canEdit, 'ContinuationScenes.test.ets:A0053', BUNDLE + '_ContinuationScenes_0005').assertTrue();
          const restored = target.controller.sceneWorkbench.document(kind);
          loggedExpect(JSON.stringify(restored.state), 'ContinuationScenes.test.ets:A0054', BUNDLE + '_ContinuationScenes_0005').assertEqual(JSON.stringify(first.state));
          if (kind === 'note') {
            loggedExpect(target.controller.sceneWorkbench.snapshot().noteDirty, 'ContinuationScenes.test.ets:A0055', BUNDLE + '_ContinuationScenes_0005').assertTrue();
            target.controller.sceneWorkbench.editNote('继续编辑', '目标端继续操作', 0, 3);
            target.controller.sceneWorkbench.saveNote();
          } else if (kind === 'reading') {
            target.controller.sceneWorkbench.previousParagraph();
            target.controller.sceneWorkbench.saveReading();
          } else {
            target.controller.sceneWorkbench.setFormField('address', '目标端继续填写');
            target.controller.sceneWorkbench.saveForm();
          }
          const next = decodeScene(outgoing(target)).value as SceneDocument;
          loggedExpect(next.transferId !== first.transferId, 'ContinuationScenes.test.ets:A0056', BUNDLE + '_ContinuationScenes_0005').assertTrue();
          loggedExpect(next.documentId, 'ContinuationScenes.test.ets:A0057', BUNDLE + '_ContinuationScenes_0005').assertEqual(first.documentId);
          loggedExpect(next.revision > first.revision, 'ContinuationScenes.test.ets:A0058', BUNDLE + '_ContinuationScenes_0005').assertTrue();
          const reopened = new SceneControllerFixture(target.store.stored());
          loggedExpect(JSON.stringify(reopened.controller.sceneWorkbench.document(kind).state), 'ContinuationScenes.test.ets:A0059', BUNDLE + '_ContinuationScenes_0005')
        .assertEqual(JSON.stringify(next.state)); reopened.release();
        } finally { source.release(); target.release(); }
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENES_0600
     * @tc.name      com.samples.appcontinuation_ContinuationScenes_0006
     * @tc.desc      Verify sC 006 position failure retry and stale receipt
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario(BUNDLE + '_ContinuationScenes_0006', (): void => {
      const source = new SceneControllerFixture(); const target = new SceneControllerFixture();
      try {
        source.controller.openScene('reading'); source.controller.sceneWorkbench.gotoParagraph(2, 1);
        target.controller.handleLaunch(inbound(outgoing(source)), AbilityConstant.LaunchReason.CONTINUATION); target.controller.markWindowReady();
        const old = targetOf(target); receipt(target, old, false);
        loggedExpect(target.controller.snapshot().targetPage, 'ContinuationScenes.test.ets:A0060', BUNDLE + '_ContinuationScenes_0006').assertEqual('continuation/pages/ProcessPage');
        loggedExpect(target.store.putCalls, 'ContinuationScenes.test.ets:A0061', BUNDLE + '_ContinuationScenes_0006').assertEqual(0);
        target.controller.retryBusinessPosition(); const retried = targetOf(target);
        loggedExpect(retried.request !== old.request, 'ContinuationScenes.test.ets:A0062', BUNDLE + '_ContinuationScenes_0006').assertTrue(); receipt(target, old);
        loggedExpect(target.store.putCalls, 'ContinuationScenes.test.ets:A0063', BUNDLE + '_ContinuationScenes_0006').assertEqual(0);
        target.controller.markWindowGone(); target.controller.markWindowReady();
        receipt(target, retried); loggedExpect(target.store.putCalls, 'ContinuationScenes.test.ets:A0064', BUNDLE + '_ContinuationScenes_0006').assertEqual(0);
        receipt(target, targetOf(target)); loggedExpect(target.controller.snapshot().committed, 'ContinuationScenes.test.ets:A0065', BUNDLE + '_ContinuationScenes_0006').assertTrue();
      } finally { source.release(); target.release(); }
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENES_0700
     * @tc.name      com.samples.appcontinuation_ContinuationScenes_0007
     * @tc.desc      Verify sC 007 conflict accept still obeys all gates
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario(BUNDLE + '_ContinuationScenes_0007', (): void => {
      const source = new SceneControllerFixture(); const target = new SceneControllerFixture();
      try {
        source.controller.openScene('note'); source.controller.sceneWorkbench.editNote('远端', '远端草稿', 0, 2);
        target.controller.openScene('note'); target.controller.sceneWorkbench.editNote('本机', '本机草稿', 1, 3);
        const before = target.controller.sceneWorkbench.document('note');
        target.controller.handleLaunch(inbound(outgoing(source)), AbilityConstant.LaunchReason.PREPARE_CONTINUATION); target.controller.acceptConflict();
        loggedExpect(target.controller.snapshot().conflictAccepted, 'ContinuationScenes.test.ets:A0066', BUNDLE + '_ContinuationScenes_0007').assertTrue();
        loggedExpect(target.store.putCalls, 'ContinuationScenes.test.ets:A0067', BUNDLE + '_ContinuationScenes_0007').assertEqual(0);
        receipt(target, targetOf(target));
        target.controller.markWindowReady();
        loggedExpect(target.store.putCalls, 'ContinuationScenes.test.ets:A0068', BUNDLE + '_ContinuationScenes_0007').assertEqual(0);
        target.store.failFlush = [1]; target.native.deliverOn(0);
        loggedExpect(target.controller.snapshot().committed, 'ContinuationScenes.test.ets:A0069', BUNDLE + '_ContinuationScenes_0007').assertFalse();
        loggedExpect(target.controller.snapshot().sessionActive, 'ContinuationScenes.test.ets:A0070', BUNDLE + '_ContinuationScenes_0007').assertFalse();
        loggedExpect(JSON.stringify(target.controller.sceneWorkbench.document('note')), 'ContinuationScenes.test.ets:A0071', BUNDLE + '_ContinuationScenes_0007')
          .assertEqual(JSON.stringify(before));
        loggedExpect(target.controller.sceneWorkbench.snapshot().noteDirty, 'ContinuationScenes.test.ets:A0072', BUNDLE + '_ContinuationScenes_0007').assertTrue();
        loggedExpect(target.store.stored(), 'ContinuationScenes.test.ets:A0073', BUNDLE + '_ContinuationScenes_0007').assertEqual('');
      } finally { source.release(); target.release(); }
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENES_0800
     * @tc.name      com.samples.appcontinuation_ContinuationScenes_0008
     * @tc.desc      Verify sC 008 page rebind and privacy
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario(BUNDLE + '_ContinuationScenes_0008', (): void => {
      const f = new SceneControllerFixture(); const page = new ScenePageSession('form'); let changes: number = 0;
      try {
        page.bind(f.controller, (): void => { changes++; }); page.detach(); const afterDetach = changes;
        f.controller.sceneWorkbench.setFormField('name', '隐私姓名'); loggedExpect(changes, 'ContinuationScenes.test.ets:A0074', BUNDLE + '_ContinuationScenes_0008').assertEqual(afterDetach);
        page.bind(f.controller, (): void => { changes++; }); loggedExpect(page.snapshot().formName, 'ContinuationScenes.test.ets:A0075', BUNDLE + '_ContinuationScenes_0008').assertEqual('隐私姓名');
        const afterBind = changes;
        f.controller.sceneWorkbench.setFormField('address', '隐私地址');
        loggedExpect(changes, 'ContinuationScenes.test.ets:A0076', BUNDLE + '_ContinuationScenes_0008').assertEqual(afterBind + 1);
        const source = new SceneControllerFixture();
        try {
          source.controller.openScene('form'); source.controller.sceneWorkbench.setFormField('phone', '13812345678');
          f.controller.handleLaunch({} as Want, AbilityConstant.LaunchReason.PREPARE_CONTINUATION);
          f.native.deliverOn(0, undefined, resultInfo(0, '13812345678 隐私地址'));
          f.controller.handleLaunch(inbound(outgoing(source)), AbilityConstant.LaunchReason.CONTINUATION);
          const summary = JSON.stringify(f.controller.snapshot().records);
          loggedExpect(summary.indexOf('13812345678'), 'ContinuationScenes.test.ets:A0077', BUNDLE + '_ContinuationScenes_0008').assertEqual(-1); loggedExpect(summary.indexOf('隐私地址'), 'ContinuationScenes.test.ets:A0078', BUNDLE + '_ContinuationScenes_0008').assertEqual(-1);
          f.controller.stopLocalWait(); const writes = f.store.putCalls;
          loggedExpect(f.controller.positionTarget(), 'ContinuationScenes.test.ets:A0079', BUNDLE + '_ContinuationScenes_0008').assertUndefined(); loggedExpect(f.store.putCalls, 'ContinuationScenes.test.ets:A0080', BUNDLE + '_ContinuationScenes_0008').assertEqual(writes);
        } finally { source.release(); }
      } finally { page.detach(); f.release(); }
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENES_0900
     * @tc.name      com.samples.appcontinuation_ContinuationScenes_0009
     * @tc.desc      Verify sC 009 namespace and storage validation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario(BUNDLE + '_ContinuationScenes_0009', (): void => {
      const source = new SceneControllerFixture(); const target = new SceneControllerFixture();
      try {
        source.controller.openScene('reading');
        const raw = outgoing(source);
        const parameters: Record<string, Object> = {};
        parameters[TEXT_PAYLOAD_KEY] = raw;
        target.controller.handleLaunch({ parameters: parameters } as Want, AbilityConstant.LaunchReason.CONTINUATION);
        loggedExpect(target.store.putCalls, 'ContinuationScenes.test.ets:A0081', BUNDLE + '_ContinuationScenes_0009').assertEqual(0);
        parameters[SCENE_PAYLOAD_KEY] = raw;
        target.controller.handleLaunch({ parameters: parameters } as Want, AbilityConstant.LaunchReason.CONTINUATION);
        loggedExpect(target.controller.snapshot().sessionActive, 'ContinuationScenes.test.ets:A0082', BUNDLE + '_ContinuationScenes_0009').assertFalse();
        loggedExpect(target.store.putCalls, 'ContinuationScenes.test.ets:A0083', BUNDLE + '_ContinuationScenes_0009').assertEqual(0);
        const broken = new SceneWorkbench(new SceneTestStore('{bad'));
        loggedExpect(broken.snapshot().storageFrozen, 'ContinuationScenes.test.ets:A0084', BUNDLE + '_ContinuationScenes_0009').assertTrue(); loggedExpect(broken.saveNote(), 'ContinuationScenes.test.ets:A0085', BUNDLE + '_ContinuationScenes_0009').assertFalse(); broken.dispose();
      } finally { source.release(); target.release(); }
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENES_1000
     * @tc.name      com.samples.appcontinuation_ContinuationScenes_0010
     * @tc.desc      Verify sC 010 history restore is real content
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario(BUNDLE + '_ContinuationScenes_0010', (): void => {
      const store = new SceneTestStore(); const work = new SceneWorkbench(store); work.open('note');
      work.editNote('第一版', '原始正文', 0, 2); work.saveNote();
      work.editNote('第二版', '另一个正文', 1, 4); work.saveNote();
      loggedExpect(work.restoreHistory(0), 'ContinuationScenes.test.ets:A0086', BUNDLE + '_ContinuationScenes_0010').assertTrue(); loggedExpect(work.snapshot().revision, 'ContinuationScenes.test.ets:A0087', BUNDLE + '_ContinuationScenes_0010').assertEqual(3);
      loggedExpect(work.snapshot().noteTitle, 'ContinuationScenes.test.ets:A0088', BUNDLE + '_ContinuationScenes_0010').assertEqual('第一版'); loggedExpect(work.snapshot().noteBody, 'ContinuationScenes.test.ets:A0089', BUNDLE + '_ContinuationScenes_0010').assertEqual('原始正文');
      loggedExpect(decodeWorkspace(store.stored()) !== undefined, 'ContinuationScenes.test.ets:A0090', BUNDLE + '_ContinuationScenes_0010').assertTrue(); work.dispose();
    });
  });
}
