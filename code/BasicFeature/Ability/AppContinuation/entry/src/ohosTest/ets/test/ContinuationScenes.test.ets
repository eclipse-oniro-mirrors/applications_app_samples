/** Real SceneWorkbench + LearningController composition, with controlled native/store/widget receipts only. */
import { describe, expect } from '@ohos/hypium';
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
import { scenario } from '../support/BoundedCase';

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
  expect(f.controller.buildContinuation(parameters)).assertEqual(AbilityConstant.OnContinueResult.AGREE);
  // ArkTS 不支持 delete：写入端以空串标记"未携带"，此处断言不残留可解析的文本载荷。
  expect(String(parameters[TEXT_PAYLOAD_KEY] ?? '').length).assertEqual(0);
  return parameters[SCENE_PAYLOAD_KEY] as string;
}

export default function continuationScenes(): void {
  describe('ContinuationScenes', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENES_0100
     * @tc.name      testContinuationScenes0001
     * @tc.desc      Verify sC 001 persistence is a transaction
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario('testContinuationScenes0001', (): void => {
      const store = new SceneTestStore(); const work = new SceneWorkbench(store);
      work.open('note'); work.editNote('标题A', 'A🌱BC', 1, 3); expect(work.saveNote()).assertTrue();
      const baseline = work.snapshot(); const raw = store.stored();
      work.editNote('标题B', '编辑内容', 0, 2);
      store.failPut = [store.putCalls + 1];
      expect(work.saveNote()).assertFalse();
      expect(work.snapshot().revision).assertEqual(baseline.revision);
      expect(work.snapshot().historyCount).assertEqual(0);
      expect(work.snapshot().noteDirty).assertTrue();
      expect(work.snapshot().noteSavedBody).assertEqual('A🌱BC');
      expect(store.stored()).assertEqual(raw);
      store.failFlush = [store.flushCalls + 1];
      expect(work.saveNote()).assertFalse(); expect(store.stored()).assertEqual(raw);
      expect(work.snapshot().revision).assertEqual(baseline.revision);
      expect(work.saveNote()).assertTrue();
      const history = work.historyDocuments();
      expect(history.length).assertEqual(1); expect(history[0].state.note.body).assertEqual('A🌱BC');
      expect(history[0].state.note.title).assertEqual('标题A'); expect(history[0].state.note.selectionEnd).assertEqual(3);
      const reopened = new SceneWorkbench(new SceneTestStore(store.stored()));
      expect(reopened.snapshot().noteTitle).assertEqual('标题B'); expect(reopened.snapshot().noteDirty).assertFalse();
      work.dispose(); reopened.dispose();
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENES_0200
     * @tc.name      testContinuationScenes0002
     * @tc.desc      Verify sC 002 discard restores complete baseline
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario('testContinuationScenes0002', (): void => {
      const work = new SceneWorkbench(new SceneTestStore());
      work.open('note'); work.editNote('原题', 'A🌱BC', 1, 3); work.saveNote();
      work.editNote('改题', '别的内容', 0, 4); work.discardNote();
      expect(work.snapshot().noteTitle).assertEqual('原题'); expect(work.snapshot().noteBody).assertEqual('A🌱BC');
      expect(work.snapshot().noteSelectionStart).assertEqual(1);
      expect(work.snapshot().noteSelectionEnd).assertEqual(3);
      expect(work.hasDirtyWork()).assertFalse(); expect(work.open('reading')).assertTrue(); work.dispose();
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENES_0300
     * @tc.name      testContinuationScenes0003
     * @tc.desc      Verify sC 003 compensation failure freezes
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario('testContinuationScenes0003', (): void => {
      const store = new SceneTestStore(); const work = new SceneWorkbench(store);
      work.editNote('草稿', '必须保留', 0, 4); store.failFlush = [1]; store.failDelete = true;
      expect(work.saveNote()).assertFalse(); expect(work.snapshot().storageFrozen).assertTrue();
      const writes = store.putCalls; expect(work.saveNote()).assertFalse(); expect(work.resetWorkspace()).assertFalse();
      expect(store.putCalls).assertEqual(writes); expect(work.snapshot().noteBody).assertEqual('必须保留');
      expect(work.snapshot().revision).assertEqual(0); expect(work.snapshot().noteDirty).assertTrue(); work.dispose();
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENES_0400
     * @tc.name      testContinuationScenes0004
     * @tc.desc      Verify sC 004 partial form and validation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario('testContinuationScenes0004', (): void => {
      const store = new SceneTestStore(); const work = new SceneWorkbench(store); work.open('form');
      expect(work.setFormField('name', '小明')).assertTrue();
      expect(work.setFormField('name', 'x'.repeat(41))).assertFalse();
      expect(work.snapshot().formName).assertEqual('小明');
      expect(work.setFormField('address', '\uD800')).assertFalse();
      expect(work.gotoFormStep(2)).assertFalse(); expect(work.saveForm()).assertTrue();
      expect(work.snapshot().formDirty).assertFalse(); expect(work.confirmForm()).assertFalse();
      const reopened = new SceneWorkbench(new SceneTestStore(store.stored()));
      expect(reopened.snapshot().formName).assertEqual('小明'); expect(reopened.snapshot().formPhone).assertEqual('');
      reopened.setFormField('phone', '13800000000'); expect(reopened.nextFormStep()).assertTrue();
      reopened.setFormField('address', '受控测试地址'); expect(reopened.nextFormStep()).assertTrue();
      reopened.setFormAgreed(true);
      expect(reopened.confirmForm()).assertTrue();
      expect(reopened.snapshot().formConfirmed).assertTrue();
      work.dispose(); reopened.dispose();
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENES_0500
     * @tc.name      testContinuationScenes0005
     * @tc.desc      Verify sC 005 scene system roundtrip
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario('testContinuationScenes0005', (): void => {
      ['note', 'reading', 'form'].forEach((kind: string): void => {
        const source = new SceneControllerFixture(); const target = new SceneControllerFixture();
        try {
          expect(source.controller.openScene(kind)).assertTrue();
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
          target.controller.handleLaunch(inbound(raw), 10); target.controller.markWindowReady();
          target.native.deliverOn(0, undefined, resultInfo(0));
          expect(target.controller.snapshot().committed).assertFalse(); expect(target.store.putCalls).assertEqual(0);
          expect(target.native.onCallbacks.length).assertEqual(1);
          receipt(target, targetOf(target));
          expect(target.controller.snapshot().committed).assertTrue();
          expect(target.controller.snapshot().canEdit).assertTrue();
          const restored = target.controller.sceneWorkbench.document(kind);
          expect(JSON.stringify(restored.state)).assertEqual(JSON.stringify(first.state));
          if (kind === 'note') {
            expect(target.controller.sceneWorkbench.snapshot().noteDirty).assertTrue();
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
          expect(next.transferId !== first.transferId).assertTrue();
          expect(next.documentId).assertEqual(first.documentId);
          expect(next.revision > first.revision).assertTrue();
          const reopened = new SceneControllerFixture(target.store.stored());
          expect(JSON.stringify(reopened.controller.sceneWorkbench.document(kind).state))
        .assertEqual(JSON.stringify(next.state)); reopened.release();
        } finally { source.release(); target.release(); }
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENES_0600
     * @tc.name      testContinuationScenes0006
     * @tc.desc      Verify sC 006 position failure retry and stale receipt
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario('testContinuationScenes0006', (): void => {
      const source = new SceneControllerFixture(); const target = new SceneControllerFixture();
      try {
        source.controller.openScene('reading'); source.controller.sceneWorkbench.gotoParagraph(2, 1);
        target.controller.handleLaunch(inbound(outgoing(source)), 3); target.controller.markWindowReady();
        const old = targetOf(target); receipt(target, old, false);
        expect(target.controller.snapshot().targetPage).assertEqual('pages/ProcessPage');
        expect(target.store.putCalls).assertEqual(0);
        target.controller.retryBusinessPosition(); const retried = targetOf(target);
        expect(retried.request !== old.request).assertTrue(); receipt(target, old);
        expect(target.store.putCalls).assertEqual(0);
        target.controller.markWindowGone(); target.controller.markWindowReady();
        receipt(target, retried); expect(target.store.putCalls).assertEqual(0);
        receipt(target, targetOf(target)); expect(target.controller.snapshot().committed).assertTrue();
      } finally { source.release(); target.release(); }
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENES_0700
     * @tc.name      testContinuationScenes0007
     * @tc.desc      Verify sC 007 conflict accept still obeys all gates
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario('testContinuationScenes0007', (): void => {
      const source = new SceneControllerFixture(); const target = new SceneControllerFixture();
      try {
        source.controller.openScene('note'); source.controller.sceneWorkbench.editNote('远端', '远端草稿', 0, 2);
        target.controller.openScene('note'); target.controller.sceneWorkbench.editNote('本机', '本机草稿', 1, 3);
        const before = target.controller.sceneWorkbench.document('note');
        target.controller.handleLaunch(inbound(outgoing(source)), 10); target.controller.acceptConflict();
        expect(target.controller.snapshot().conflictAccepted).assertTrue();
        expect(target.store.putCalls).assertEqual(0);
        receipt(target, targetOf(target));
        target.controller.markWindowReady();
        expect(target.store.putCalls).assertEqual(0);
        target.store.failFlush = [1]; target.native.deliverOn(0);
        expect(target.controller.snapshot().committed).assertFalse();
        expect(target.controller.snapshot().sessionActive).assertFalse();
        expect(JSON.stringify(target.controller.sceneWorkbench.document('note')))
          .assertEqual(JSON.stringify(before));
        expect(target.controller.sceneWorkbench.snapshot().noteDirty).assertTrue();
        expect(target.store.stored()).assertEqual('');
      } finally { source.release(); target.release(); }
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENES_0800
     * @tc.name      testContinuationScenes0008
     * @tc.desc      Verify sC 008 page rebind and privacy
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario('testContinuationScenes0008', (): void => {
      const f = new SceneControllerFixture(); const page = new ScenePageSession('form'); let changes: number = 0;
      try {
        page.bind(f.controller, (): void => { changes++; }); page.detach(); const afterDetach = changes;
        f.controller.sceneWorkbench.setFormField('name', '隐私姓名'); expect(changes).assertEqual(afterDetach);
        page.bind(f.controller, (): void => { changes++; }); expect(page.snapshot().formName).assertEqual('隐私姓名');
        const afterBind = changes;
        f.controller.sceneWorkbench.setFormField('address', '隐私地址');
        expect(changes).assertEqual(afterBind + 1);
        const source = new SceneControllerFixture();
        try {
          source.controller.openScene('form'); source.controller.sceneWorkbench.setFormField('phone', '13812345678');
          f.controller.handleLaunch({} as Want, 10);
          f.native.deliverOn(0, undefined, resultInfo(0, '13812345678 隐私地址'));
          f.controller.handleLaunch(inbound(outgoing(source)), 3);
          const summary = JSON.stringify(f.controller.snapshot().records);
          expect(summary.indexOf('13812345678')).assertEqual(-1); expect(summary.indexOf('隐私地址')).assertEqual(-1);
          f.controller.stopLocalWait(); const writes = f.store.putCalls;
          expect(f.controller.positionTarget()).assertUndefined(); expect(f.store.putCalls).assertEqual(writes);
        } finally { source.release(); }
      } finally { page.detach(); f.release(); }
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENES_0900
     * @tc.name      testContinuationScenes0009
     * @tc.desc      Verify sC 009 namespace and storage validation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario('testContinuationScenes0009', (): void => {
      const source = new SceneControllerFixture(); const target = new SceneControllerFixture();
      try {
        source.controller.openScene('reading');
        const raw = outgoing(source);
        const parameters: Record<string, Object> = {};
        parameters[TEXT_PAYLOAD_KEY] = raw;
        target.controller.handleLaunch({ parameters: parameters } as Want, 3);
        expect(target.store.putCalls).assertEqual(0);
        parameters[SCENE_PAYLOAD_KEY] = raw;
        target.controller.handleLaunch({ parameters: parameters } as Want, 3);
        expect(target.controller.snapshot().sessionActive).assertFalse();
        expect(target.store.putCalls).assertEqual(0);
        const broken = new SceneWorkbench(new SceneTestStore('{bad'));
        expect(broken.snapshot().storageFrozen).assertTrue(); expect(broken.saveNote()).assertFalse(); broken.dispose();
      } finally { source.release(); target.release(); }
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENES_1000
     * @tc.name      testContinuationScenes0010
     * @tc.desc      Verify sC 010 history restore is real content
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario('testContinuationScenes0010', (): void => {
      const store = new SceneTestStore(); const work = new SceneWorkbench(store); work.open('note');
      work.editNote('第一版', '原始正文', 0, 2); work.saveNote();
      work.editNote('第二版', '另一个正文', 1, 4); work.saveNote();
      expect(work.restoreHistory(0)).assertTrue(); expect(work.snapshot().revision).assertEqual(3);
      expect(work.snapshot().noteTitle).assertEqual('第一版'); expect(work.snapshot().noteBody).assertEqual('原始正文');
      expect(decodeWorkspace(store.stored()) !== undefined).assertTrue(); work.dispose();
    });
  });
}
