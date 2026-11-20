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
import { beforeEach, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from './EventLoopYield';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ChatSource } from '../../../main/ets/model/DataSource';
import { ChatBox } from '../../../main/ets/model/ChatBox';

const DOMAIN: number = 0xF814;
const TAG: string = 'ListenerExtendedTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function box(message: string): ChatBox {
  return new ChatBox(true, message, '8.1-9:0');
}

class TestListener implements DataChangeListener {
  addCount: number = 0;
  changeCount: number = 0;
  deleteCount: number = 0;
  moveCount: number = 0;
  reloadCount: number = 0;
  addIndexes: number[] = [];
  changeIndexes: number[] = [];
  deleteIndexes: number[] = [];
  moveFrom: number[] = [];
  moveTo: number[] = [];
  events: string[] = [];

  onDataReloaded(): void {
    this.reloadCount++;
    this.events.push('reload');
  }

  onDataAdded(index: number): void {
  }

  onDataAdd(index: number): void {
    this.addCount++;
    this.addIndexes.push(index);
    this.events.push('add');
  }

  onDataChange(index: number): void {
    this.changeCount++;
    this.changeIndexes.push(index);
    this.events.push('change');
  }

  onDataChanged(index: number): void {
  }

  onDataDelete(index: number): void {
    this.deleteCount++;
    this.deleteIndexes.push(index);
    this.events.push('delete');
  }

  onDataDeleted(index: number): void {
  }

  onDataMove(from: number, to: number): void {
    this.moveCount++;
    this.moveFrom.push(from);
    this.moveTo.push(to);
    this.events.push('move');
  }

  onDataMoved(from: number, to: number): void {
  }

  onDatasetChange(dataOperations: DataOperation[]): void {
  }
}

export default function listenerExtendedTest(): void {
  describe('SocketListenerExtendedTest', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_SOCKET_LISTENER_0301
     * @tc.name      testListener0301
     * @tc.desc      Verify a registered listener observes one add on first push.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListener0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListener0301 begin');
      const source: ChatSource = new ChatSource();
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.pushData(box('m'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addCount=${listener.addCount}, expected=1`);
      expect(listener.addCount).assertEqual(1);
      log('testListener0301 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LISTENER_0302
     * @tc.name      testListener0302
     * @tc.desc      Verify the first push notifies the add callback with index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListener0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListener0302 begin');
      const source: ChatSource = new ChatSource();
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.pushData(box('m'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes[0]=${listener.addIndexes[0]}, expected=0`);
      expect(listener.addIndexes[0]).assertEqual(0);
      log('testListener0302 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LISTENER_0303
     * @tc.name      testListener0303
     * @tc.desc      Verify two pushes notify add with indexes 0 then 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListener0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListener0303 begin');
      const source: ChatSource = new ChatSource();
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.pushData(box('a'));
      source.pushData(box('b'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes[0]=${listener.addIndexes[0]}, expected=0`);
      expect(listener.addIndexes[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes[1]=${listener.addIndexes[1]}, expected=1`);
      expect(listener.addIndexes[1]).assertEqual(1);
      log('testListener0303 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LISTENER_0304
     * @tc.name      testListener0304
     * @tc.desc      Verify three pushes produce three ordered add callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListener0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListener0304 begin');
      const source: ChatSource = new ChatSource();
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.pushData(box('a'));
      source.pushData(box('b'));
      source.pushData(box('c'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addCount=${listener.addCount}, expected=3`);
      expect(listener.addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes[2]=${listener.addIndexes[2]}, expected=2`);
      expect(listener.addIndexes[2]).assertEqual(2);
      log('testListener0304 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LISTENER_0305
     * @tc.name      testListener0305
     * @tc.desc      Verify two registered listeners both observe the same add.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListener0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListener0305 begin');
      const source: ChatSource = new ChatSource();
      const first: TestListener = new TestListener();
      const second: TestListener = new TestListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.pushData(box('m'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.addCount=${first.addCount}, expected=1`);
      expect(first.addCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.addCount=${second.addCount}, expected=1`);
      expect(second.addCount).assertEqual(1);
      log('testListener0305 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LISTENER_0306
     * @tc.name      testListener0306
     * @tc.desc      Verify registering the same listener twice still notifies once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListener0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListener0306 begin');
      const source: ChatSource = new ChatSource();
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.pushData(box('m'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addCount=${listener.addCount}, expected=1`);
      expect(listener.addCount).assertEqual(1);
      log('testListener0306 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LISTENER_0307
     * @tc.name      testListener0307
     * @tc.desc      Verify a deduplicated registration stays single per push round.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListener0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListener0307 begin');
      const source: ChatSource = new ChatSource();
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.pushData(box('a'));
      source.pushData(box('b'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addCount=${listener.addCount}, expected=2`);
      expect(listener.addCount).assertEqual(2);
      log('testListener0307 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LISTENER_0308
     * @tc.name      testListener0308
     * @tc.desc      Verify an unregistered listener stops receiving add callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListener0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListener0308 begin');
      const source: ChatSource = new ChatSource();
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.pushData(box('m'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addCount=${listener.addCount}, expected=0`);
      expect(listener.addCount).assertEqual(0);
      log('testListener0308 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LISTENER_0309
     * @tc.name      testListener0309
     * @tc.desc      Verify unregistering an unknown listener is a safe no-op.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListener0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListener0309 begin');
      const source: ChatSource = new ChatSource();
      const listener: TestListener = new TestListener();
      let failed: boolean = false;
      try {
        source.unregisterDataChangeListener(listener);
      } catch (e) {
        failed = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse failed=${failed}`);
      expect(failed).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addCount=${listener.addCount}, expected=0`);
      expect(listener.addCount).assertEqual(0);
      log('testListener0309 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LISTENER_0310
     * @tc.name      testListener0310
     * @tc.desc      Verify a listener re-registered after unregistering receives again.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListener0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListener0310 begin');
      const source: ChatSource = new ChatSource();
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.pushData(box('m'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addCount=${listener.addCount}, expected=1`);
      expect(listener.addCount).assertEqual(1);
      log('testListener0310 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LISTENER_0311
     * @tc.name      testListener0311
     * @tc.desc      Verify addData(0) notifies the add callback with index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListener0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListener0311 begin');
      const source: ChatSource = new ChatSource();
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.addData(0, box('head'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addCount=${listener.addCount}, expected=1`);
      expect(listener.addCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes[0]=${listener.addIndexes[0]}, expected=0`);
      expect(listener.addIndexes[0]).assertEqual(0);
      log('testListener0311 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LISTENER_0312
     * @tc.name      testListener0312
     * @tc.desc      Verify a middle insert notifies add with the insert index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListener0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListener0312 begin');
      const source: ChatSource = new ChatSource();
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.pushData(box('a'));
      source.addData(1, box('b'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes[1]=${listener.addIndexes[1]}, expected=1`);
      expect(listener.addIndexes[1]).assertEqual(1);
      log('testListener0312 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LISTENER_0313
     * @tc.name      testListener0313
     * @tc.desc      Verify notifyDataReload triggers exactly one reload callback.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListener0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListener0313 begin');
      const source: ChatSource = new ChatSource();
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadCount=${listener.reloadCount}, expected=1`);
      expect(listener.reloadCount).assertEqual(1);
      log('testListener0313 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LISTENER_0314
     * @tc.name      testListener0314
     * @tc.desc      Verify two reload notifications accumulate to a count of two.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListener0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListener0314 begin');
      const source: ChatSource = new ChatSource();
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadCount=${listener.reloadCount}, expected=2`);
      expect(listener.reloadCount).assertEqual(2);
      log('testListener0314 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LISTENER_0315
     * @tc.name      testListener0315
     * @tc.desc      Verify notifyDataChange forwards the changed index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListener0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListener0315 begin');
      const source: ChatSource = new ChatSource();
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.changeCount=${listener.changeCount}, expected=1`);
      expect(listener.changeCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.changeIndexes[0]=${listener.changeIndexes[0]}`);
      expect(listener.changeIndexes[0]).assertEqual(0);
      log('testListener0315 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LISTENER_0316
     * @tc.name      testListener0316
     * @tc.desc      Verify notifyDataChange forwards an arbitrary index value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListener0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListener0316 begin');
      const source: ChatSource = new ChatSource();
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.changeIndexes[0]=${listener.changeIndexes[0]}`);
      expect(listener.changeIndexes[0]).assertEqual(2);
      log('testListener0316 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LISTENER_0317
     * @tc.name      testListener0317
     * @tc.desc      Verify notifyDataDelete forwards the deleted index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListener0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListener0317 begin');
      const source: ChatSource = new ChatSource();
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deleteCount=${listener.deleteCount}, expected=1`);
      expect(listener.deleteCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deleteIndexes[0]=${listener.deleteIndexes[0]}`);
      expect(listener.deleteIndexes[0]).assertEqual(0);
      log('testListener0317 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LISTENER_0318
     * @tc.name      testListener0318
     * @tc.desc      Verify notifyDataDelete forwards a non-zero index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListener0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListener0318 begin');
      const source: ChatSource = new ChatSource();
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deleteIndexes[0]=${listener.deleteIndexes[0]}`);
      expect(listener.deleteIndexes[0]).assertEqual(3);
      log('testListener0318 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LISTENER_0319
     * @tc.name      testListener0319
     * @tc.desc      Verify notifyDataMove forwards both move endpoints.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListener0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListener0319 begin');
      const source: ChatSource = new ChatSource();
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(0, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveCount=${listener.moveCount}, expected=1`);
      expect(listener.moveCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveFrom[0]=${listener.moveFrom[0]}, expected=0`);
      expect(listener.moveFrom[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveTo[0]=${listener.moveTo[0]}, expected=1`);
      expect(listener.moveTo[0]).assertEqual(1);
      log('testListener0319 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LISTENER_0320
     * @tc.name      testListener0320
     * @tc.desc      Verify a backward move keeps the from and to order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListener0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListener0320 begin');
      const source: ChatSource = new ChatSource();
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(2, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveFrom[0]=${listener.moveFrom[0]}, expected=2`);
      expect(listener.moveFrom[0]).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveTo[0]=${listener.moveTo[0]}, expected=0`);
      expect(listener.moveTo[0]).assertEqual(0);
      log('testListener0320 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LISTENER_0321
     * @tc.name      testListener0321
     * @tc.desc      Verify mixed notifications arrive in call order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListener0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListener0321 begin');
      const source: ChatSource = new ChatSource();
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.pushData(box('a'));
      source.notifyDataChange(0);
      source.notifyDataDelete(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.events[0]=${listener.events[0]}, expected='add'`);
      expect(listener.events[0]).assertEqual('add');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.events[1]=${listener.events[1]}, expected='change'`);
      expect(listener.events[1]).assertEqual('change');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.events[2]=${listener.events[2]}, expected='delete'`);
      expect(listener.events[2]).assertEqual('delete');
      log('testListener0321 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LISTENER_0322
     * @tc.name      testListener0322
     * @tc.desc      Verify one listener being removed does not affect another.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListener0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListener0322 begin');
      const source: ChatSource = new ChatSource();
      const kept: TestListener = new TestListener();
      const dropped: TestListener = new TestListener();
      source.registerDataChangeListener(kept);
      source.registerDataChangeListener(dropped);
      source.unregisterDataChangeListener(dropped);
      source.pushData(box('m'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual kept.addCount=${kept.addCount}, expected=1`);
      expect(kept.addCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual dropped.addCount=${dropped.addCount}, expected=0`);
      expect(dropped.addCount).assertEqual(0);
      log('testListener0322 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LISTENER_0323
     * @tc.name      testListener0323
     * @tc.desc      Verify a push after existing data notifies with its real index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListener0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListener0323 begin');
      const source: ChatSource = new ChatSource();
      source.pushData(box('a'));
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.pushData(box('b'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes[0]=${listener.addIndexes[0]}, expected=1`);
      expect(listener.addIndexes[0]).assertEqual(1);
      log('testListener0323 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LISTENER_0324
     * @tc.name      testListener0324
     * @tc.desc      Verify the add notification count tracks the push count.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListener0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListener0324 begin');
      const source: ChatSource = new ChatSource();
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.pushData(box('a'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=1`);
      expect(source.totalCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addCount=${listener.addCount}, expected=1`);
      expect(listener.addCount).assertEqual(1);
      log('testListener0324 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LISTENER_0325
     * @tc.name      testListener0325
     * @tc.desc      Verify pushing one shared object notifies add twice.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListener0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListener0325 begin');
      const source: ChatSource = new ChatSource();
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      const shared: ChatBox = box('dup');
      source.pushData(shared);
      source.pushData(shared);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addCount=${listener.addCount}, expected=2`);
      expect(listener.addCount).assertEqual(2);
      log('testListener0325 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LISTENER_0326
     * @tc.name      testListener0326
     * @tc.desc      Verify a bare notifyDataAdd reaches the listener directly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListener0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListener0326 begin');
      const source: ChatSource = new ChatSource();
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addCount=${listener.addCount}, expected=1`);
      expect(listener.addCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes[0]=${listener.addIndexes[0]}, expected=5`);
      expect(listener.addIndexes[0]).assertEqual(5);
      log('testListener0326 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LISTENER_0327
     * @tc.name      testListener0327
     * @tc.desc      Verify three listeners all observe the same notification.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListener0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListener0327 begin');
      const source: ChatSource = new ChatSource();
      const first: TestListener = new TestListener();
      const second: TestListener = new TestListener();
      const third: TestListener = new TestListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.registerDataChangeListener(third);
      source.pushData(box('m'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.addCount=${first.addCount}, expected=1`);
      expect(first.addCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.addCount=${second.addCount}, expected=1`);
      expect(second.addCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual third.addCount=${third.addCount}, expected=1`);
      expect(third.addCount).assertEqual(1);
      log('testListener0327 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LISTENER_0328
     * @tc.name      testListener0328
     * @tc.desc      Verify unregistering every listener silences later pushes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListener0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListener0328 begin');
      const source: ChatSource = new ChatSource();
      const first: TestListener = new TestListener();
      const second: TestListener = new TestListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.unregisterDataChangeListener(first);
      source.unregisterDataChangeListener(second);
      source.pushData(box('m'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.addCount=${first.addCount}, expected=0`);
      expect(first.addCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.addCount=${second.addCount}, expected=0`);
      expect(second.addCount).assertEqual(0);
      log('testListener0328 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LISTENER_0329
     * @tc.name      testListener0329
     * @tc.desc      Verify an add event does not fire change or delete callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListener0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListener0329 begin');
      const source: ChatSource = new ChatSource();
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.pushData(box('m'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.changeCount=${listener.changeCount}, expected=0`);
      expect(listener.changeCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deleteCount=${listener.deleteCount}, expected=0`);
      expect(listener.deleteCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveCount=${listener.moveCount}, expected=0`);
      expect(listener.moveCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadCount=${listener.reloadCount}, expected=0`);
      expect(listener.reloadCount).assertEqual(0);
      log('testListener0329 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LISTENER_0330
     * @tc.name      testListener0330
     * @tc.desc      Verify ten pushes notify ten sequential add callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListener0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListener0330 begin');
      const source: ChatSource = new ChatSource();
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      for (let i: number = 0; i < 10; i++) {
        source.pushData(box('m' + i));
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addCount=${listener.addCount}, expected=10`);
      expect(listener.addCount).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes[9]=${listener.addIndexes[9]}, expected=9`);
      expect(listener.addIndexes[9]).assertEqual(9);
      log('testListener0330 end');
    })
  })
}
