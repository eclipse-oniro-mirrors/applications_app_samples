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

import { describe, beforeAll, beforeEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { DataType, MyDataSource } from '../../../../main/ets/model/GameModuel';
import { BoardKit, CELLS } from '../common/Game2048TestKit';

/**
 * 监听器登记与注销的生命周期测试套件。
 *
 * 生产实现把监听器保存在私有数组里：register 依靠 indexOf 去重，unregister
 * 依靠 indexOf 定位后 splice 一个元素，三个 notify 方法在每次调用时遍历当前
 * 数组快照。本套件只固化登记顺序、去重、注销与“注销后立即静默”这几条契约，
 * 不触碰访问器语义与棋盘规则。
 */

/**
 * 记录十种回调的监听器实现。
 * trail 由同一数据源上的多个监听器共享，用来观察通知到达的先后顺序。
 */
class SessionListener implements DataChangeListener {
  public label: string = '';
  public reloadCount: number = 0;
  public addCount: number = 0;
  public addedCount: number = 0;
  public changeCount: number = 0;
  public changedCount: number = 0;
  public datasetChangeCount: number = 0;
  public lastAddIndex: number = -1;
  public lastChangeIndex: number = -1;
  public trail: string[] = [];

  constructor(label: string, trail: string[]) {
    this.label = label;
    this.trail = trail;
  }

  onDataReloaded(): void {
    this.reloadCount = this.reloadCount + 1;
    this.trail.push(this.label + ':reload');
  }

  onDataAdded(index: number): void {
    this.addedCount = this.addedCount + 1;
    this.lastAddIndex = index;
    this.trail.push(this.label + ':added:' + index);
  }

  onDataAdd(index: number): void {
    this.addCount = this.addCount + 1;
    this.lastAddIndex = index;
    this.trail.push(this.label + ':add:' + index);
  }

  onDataMoved(from: number, to: number): void {
    this.trail.push(this.label + ':moved:' + from + '>' + to);
  }

  onDataMove(from: number, to: number): void {
    this.trail.push(this.label + ':move:' + from + '>' + to);
  }

  onDataDeleted(index: number): void {
    this.trail.push(this.label + ':deleted:' + index);
  }

  onDataDelete(index: number): void {
    this.trail.push(this.label + ':delete:' + index);
  }

  onDataChanged(index: number): void {
    this.changedCount = this.changedCount + 1;
    this.lastChangeIndex = index;
    this.trail.push(this.label + ':changed:' + index);
  }

  onDataChange(index: number): void {
    this.changeCount = this.changeCount + 1;
    this.lastChangeIndex = index;
    this.trail.push(this.label + ':change:' + index);
  }

  onDatasetChange(dataOperations: DataOperation[]): void {
    this.datasetChangeCount = this.datasetChangeCount + 1;
    this.trail.push(this.label + ':dataset:' + dataOperations.length);
  }

  /**
   * 汇总三种数据通知的回调次数，用于“注销后整体静默”的联合断言。
   * 生产实现只调用 onDataReloaded、onDataAdded、onDataChanged 三个旧名回调。
   */
  public notificationTotal(): number {
    return this.reloadCount + this.addedCount + this.changedCount;
  }
}

/**
 * 构造一个十六格数据源，使生命周期断言不依赖具体棋盘数值。
 */
function blankSource(): MyDataSource {
  return new MyDataSource(BoardKit.data(BoardKit.blank()));
}

/**
 * 构造一个没有任何格子的数据源，用于空数据集上的登记与注销。
 */
function emptySource(): MyDataSource {
  let list: DataType[] = [];
  return new MyDataSource(list);
}

/**
 * 按入参顺序逐个登记监听器。
 */
function attachAll(source: MyDataSource, listeners: DataChangeListener[]): void {
  for (let index: number = 0; index < listeners.length; index++) {
    source.registerDataChangeListener(listeners[index]);
  }
}

/**
 * 把共享轨迹拼成一行文本，便于用单条断言校验整体到达顺序。
 */
function trailText(trail: string[]): string {
  return trail.join(',');
}

/**
 * MyDataSource 监听器生命周期测试套件。
 */
export default function myDataSourceLifecycleTest() {
  describe('myDataSourceLifecycleTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('myDataSourceLifecycleTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('myDataSourceLifecycleTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_0200
     * @tc.name unregisterThenNotifyIsSilent0200
     * @tc.desc Verify all three notification kinds reach no callback after the only listener is unregistered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_unregisterThenNotifyIsSilent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let trail: string[] = [];
      let observer: SessionListener = new SessionListener('alpha', trail);
      source.registerDataChangeListener(observer);
      source.unregisterDataChangeListener(observer);
      source.notifyDataReload();
      source.notifyDataAdd(0);
      source.notifyDataChange(0);
      expect(observer.notificationTotal()).assertEqual(0);
      expect(observer.reloadCount).assertEqual(0);
      expect(observer.addedCount).assertEqual(0);
      expect(observer.changedCount).assertEqual(0);
      expect(trail.length).assertEqual(0);
      BoardKit.log('lifecycle_unregisterThenNotifyIsSilent', 'silent after unregister');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_0400
     * @tc.name unregisterUnknownListenerIsHarmless0400
     * @tc.desc Verify unregistering a listener that was never registered neither throws nor damages the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_unregisterUnknownListenerIsHarmless', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let trail: string[] = [];
      let observer: SessionListener = new SessionListener('alpha', trail);
      let threw: boolean = false;
      try {
        source.unregisterDataChangeListener(observer);
      } catch (error) {
        threw = true;
        BoardKit.warn('lifecycle_unregisterUnknownListenerIsHarmless', 'unexpected throw');
      }
      expect(threw).assertFalse();
      expect(source.totalCount()).assertEqual(CELLS);
      source.registerDataChangeListener(observer);
      source.notifyDataReload();
      expect(observer.reloadCount).assertEqual(1);
      expect(trail.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_0500
     * @tc.name unknownUnregisterLeavesPeerDelivering0500
     * @tc.desc Verify unregistering an unknown listener does not remove a genuinely registered peer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_unknownUnregisterLeavesPeerDelivering', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let trail: string[] = [];
      let alpha: SessionListener = new SessionListener('alpha', trail);
      let beta: SessionListener = new SessionListener('beta', trail);
      source.registerDataChangeListener(alpha);
      source.unregisterDataChangeListener(beta);
      source.notifyDataReload();
      expect(alpha.reloadCount).assertEqual(1);
      expect(beta.reloadCount).assertEqual(0);
      expect(trail.length).assertEqual(1);
      expect(trail[0]).assertEqual('alpha:reload');
      BoardKit.log('lifecycle_unknownUnregisterLeavesPeerDelivering', 'peer still receives');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_0600
     * @tc.name unregisterTwiceLeavesNoDelivery0600
     * @tc.desc Verify a second unregister of the same listener is a no-op and the listener stays silent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_unregisterTwiceLeavesNoDelivery', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let trail: string[] = [];
      let observer: SessionListener = new SessionListener('alpha', trail);
      source.registerDataChangeListener(observer);
      source.unregisterDataChangeListener(observer);
      source.unregisterDataChangeListener(observer);
      source.notifyDataReload();
      expect(observer.reloadCount).assertEqual(0);
      expect(observer.notificationTotal()).assertEqual(0);
      expect(trail.length).assertEqual(0);
      BoardKit.log('lifecycle_unregisterTwiceLeavesNoDelivery', 'double unregister is a no-op');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_0700
     * @tc.name doubleUnregisterKeepsSourceUsable0700
     * @tc.desc Verify the source accepts a fresh registration after a repeated unregister of an old listener
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_doubleUnregisterKeepsSourceUsable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let trail: string[] = [];
      let alpha: SessionListener = new SessionListener('alpha', trail);
      let beta: SessionListener = new SessionListener('beta', trail);
      source.registerDataChangeListener(alpha);
      source.unregisterDataChangeListener(alpha);
      source.unregisterDataChangeListener(alpha);
      source.registerDataChangeListener(beta);
      source.notifyDataReload();
      expect(beta.reloadCount).assertEqual(1);
      expect(alpha.reloadCount).assertEqual(0);
      expect(trailText(trail)).assertEqual('beta:reload');
      BoardKit.log('lifecycle_doubleUnregisterKeepsSourceUsable', 'fresh listener still accepted');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_0800
     * @tc.name twoListenersUnregisteredInOrder0800
     * @tc.desc Verify unregistering two listeners in registration order silences both of them
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_twoListenersUnregisteredInOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let trail: string[] = [];
      let alpha: SessionListener = new SessionListener('alpha', trail);
      let beta: SessionListener = new SessionListener('beta', trail);
      attachAll(source, [alpha, beta]);
      source.unregisterDataChangeListener(alpha);
      source.unregisterDataChangeListener(beta);
      source.notifyDataReload();
      expect(alpha.reloadCount).assertEqual(0);
      expect(beta.reloadCount).assertEqual(0);
      expect(trail.length).assertEqual(0);
      BoardKit.log('lifecycle_twoListenersUnregisteredInOrder', 'both silent');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_0900
     * @tc.name twoListenersUnregisteredInReverse0900
     * @tc.desc Verify removing the rear listener first still allows the front listener to be removed without residue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_twoListenersUnregisteredInReverse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let trail: string[] = [];
      let alpha: SessionListener = new SessionListener('alpha', trail);
      let beta: SessionListener = new SessionListener('beta', trail);
      attachAll(source, [alpha, beta]);
      source.unregisterDataChangeListener(beta);
      source.unregisterDataChangeListener(alpha);
      source.notifyDataReload();
      source.notifyDataAdd(3);
      expect(alpha.notificationTotal()).assertEqual(0);
      expect(beta.notificationTotal()).assertEqual(0);
      expect(trail.length).assertEqual(0);
      BoardKit.log('lifecycle_twoListenersUnregisteredInReverse', 'reverse removal leaves no residue');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_1000
     * @tc.name unregisterFirstKeepsSecondDelivering1000
     * @tc.desc Verify removing the first of two listeners leaves the second one receiving every notification kind
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_unregisterFirstKeepsSecondDelivering', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let trail: string[] = [];
      let alpha: SessionListener = new SessionListener('alpha', trail);
      let beta: SessionListener = new SessionListener('beta', trail);
      attachAll(source, [alpha, beta]);
      source.unregisterDataChangeListener(alpha);
      source.notifyDataReload();
      source.notifyDataAdd(2);
      source.notifyDataChange(4);
      expect(alpha.notificationTotal()).assertEqual(0);
      expect(beta.reloadCount).assertEqual(1);
      expect(beta.addedCount).assertEqual(1);
      expect(beta.changedCount).assertEqual(1);
      expect(trailText(trail)).assertEqual('beta:reload,beta:added:2,beta:changed:4');
      BoardKit.log('lifecycle_unregisterFirstKeepsSecondDelivering', 'second listener keeps all kinds');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_1100
     * @tc.name unregisterSecondKeepsFirstDelivering1100
     * @tc.desc Verify removing the second of two listeners leaves the first one receiving notifications
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_unregisterSecondKeepsFirstDelivering', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let trail: string[] = [];
      let alpha: SessionListener = new SessionListener('alpha', trail);
      let beta: SessionListener = new SessionListener('beta', trail);
      attachAll(source, [alpha, beta]);
      source.unregisterDataChangeListener(beta);
      source.notifyDataReload();
      source.notifyDataAdd(9);
      expect(alpha.reloadCount).assertEqual(1);
      expect(alpha.lastAddIndex).assertEqual(9);
      expect(beta.notificationTotal()).assertEqual(0);
      expect(trailText(trail)).assertEqual('alpha:reload,alpha:added:9');
      BoardKit.log('lifecycle_unregisterSecondKeepsFirstDelivering', 'first listener keeps receiving');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_1200
     * @tc.name threeListenersAllNotifiedOnce1200
     * @tc.desc Verify three simultaneously registered listeners each receive one reload notification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_threeListenersAllNotifiedOnce', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let trail: string[] = [];
      let alpha: SessionListener = new SessionListener('alpha', trail);
      let beta: SessionListener = new SessionListener('beta', trail);
      let gamma: SessionListener = new SessionListener('gamma', trail);
      attachAll(source, [alpha, beta, gamma]);
      source.notifyDataReload();
      expect(alpha.reloadCount).assertEqual(1);
      expect(beta.reloadCount).assertEqual(1);
      expect(gamma.reloadCount).assertEqual(1);
      expect(trail.length).assertEqual(3);
      BoardKit.log('lifecycle_threeListenersAllNotifiedOnce', 'three listeners, three callbacks');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_1300
     * @tc.name threeListenersUnregisterMiddle1300
     * @tc.desc Verify removing the middle of three listeners leaves the two outer listeners receiving
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_threeListenersUnregisterMiddle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let trail: string[] = [];
      let alpha: SessionListener = new SessionListener('alpha', trail);
      let beta: SessionListener = new SessionListener('beta', trail);
      let gamma: SessionListener = new SessionListener('gamma', trail);
      attachAll(source, [alpha, beta, gamma]);
      source.unregisterDataChangeListener(beta);
      source.notifyDataReload();
      expect(alpha.reloadCount).assertEqual(1);
      expect(beta.reloadCount).assertEqual(0);
      expect(gamma.reloadCount).assertEqual(1);
      expect(trailText(trail)).assertEqual('alpha:reload,gamma:reload');
      BoardKit.log('lifecycle_threeListenersUnregisterMiddle', 'outer pair survives');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_1400
     * @tc.name threeListenersUnregisterFirst1400
     * @tc.desc Verify removing the head of three listeners keeps the remaining pair in registration order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_threeListenersUnregisterFirst', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let trail: string[] = [];
      let alpha: SessionListener = new SessionListener('alpha', trail);
      let beta: SessionListener = new SessionListener('beta', trail);
      let gamma: SessionListener = new SessionListener('gamma', trail);
      attachAll(source, [alpha, beta, gamma]);
      source.unregisterDataChangeListener(alpha);
      source.notifyDataReload();
      expect(alpha.reloadCount).assertEqual(0);
      expect(beta.reloadCount).assertEqual(1);
      expect(gamma.reloadCount).assertEqual(1);
      expect(trailText(trail)).assertEqual('beta:reload,gamma:reload');
      BoardKit.log('lifecycle_threeListenersUnregisterFirst', 'pair order preserved');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_1500
     * @tc.name threeListenersUnregisterLast1500
     * @tc.desc Verify removing the tail of three listeners keeps the leading pair in registration order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_threeListenersUnregisterLast', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let trail: string[] = [];
      let alpha: SessionListener = new SessionListener('alpha', trail);
      let beta: SessionListener = new SessionListener('beta', trail);
      let gamma: SessionListener = new SessionListener('gamma', trail);
      attachAll(source, [alpha, beta, gamma]);
      source.unregisterDataChangeListener(gamma);
      source.notifyDataReload();
      expect(alpha.reloadCount).assertEqual(1);
      expect(beta.reloadCount).assertEqual(1);
      expect(gamma.reloadCount).assertEqual(0);
      expect(trailText(trail)).assertEqual('alpha:reload,beta:reload');
      BoardKit.log('lifecycle_threeListenersUnregisterLast', 'leading pair preserved');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_1700
     * @tc.name notificationOrderFollowsReverseRegistration1700
     * @tc.desc Verify registration order, not object identity, decides the callback order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_notificationOrderFollowsReverseRegistration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let trail: string[] = [];
      let alpha: SessionListener = new SessionListener('alpha', trail);
      let beta: SessionListener = new SessionListener('beta', trail);
      let gamma: SessionListener = new SessionListener('gamma', trail);
      attachAll(source, [gamma, beta, alpha]);
      source.notifyDataReload();
      expect(trailText(trail)).assertEqual('gamma:reload,beta:reload,alpha:reload');
      expect(trail[0]).assertEqual('gamma:reload');
      expect(trail[2]).assertEqual('alpha:reload');
      BoardKit.log('lifecycle_notificationOrderFollowsReverseRegistration', trailText(trail));
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_1800
     * @tc.name orderAfterMiddleRemoval1800
     * @tc.desc Verify the surviving listeners keep their relative order after the middle one is removed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_orderAfterMiddleRemoval', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let trail: string[] = [];
      let alpha: SessionListener = new SessionListener('alpha', trail);
      let beta: SessionListener = new SessionListener('beta', trail);
      let gamma: SessionListener = new SessionListener('gamma', trail);
      attachAll(source, [alpha, beta, gamma]);
      source.unregisterDataChangeListener(beta);
      source.notifyDataAdd(7);
      expect(trailText(trail)).assertEqual('alpha:added:7,gamma:added:7');
      expect(trail.length).assertEqual(2);
      expect(trail[0]).assertEqual('alpha:added:7');
      expect(trail[1]).assertEqual('gamma:added:7');
      BoardKit.log('lifecycle_orderAfterMiddleRemoval', trailText(trail));
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_2000
     * @tc.name tripleRegistrationDeliversOnce2000
     * @tc.desc Verify three registrations of the same object still deliver one callback for an add notification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_tripleRegistrationDeliversOnce', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let trail: string[] = [];
      let observer: SessionListener = new SessionListener('alpha', trail);
      source.registerDataChangeListener(observer);
      source.registerDataChangeListener(observer);
      source.registerDataChangeListener(observer);
      source.notifyDataAdd(5);
      expect(observer.addedCount).assertEqual(1);
      expect(observer.lastAddIndex).assertEqual(5);
      expect(trail.length).assertEqual(1);
      BoardKit.log('lifecycle_tripleRegistrationDeliversOnce', 'one callback for three registrations');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_2100
     * @tc.name duplicateRegistrationSingleUnregisterRemoves2100
     * @tc.desc Verify one unregister removes an object that was registered more than once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_duplicateRegistrationSingleUnregisterRemoves', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let trail: string[] = [];
      let observer: SessionListener = new SessionListener('alpha', trail);
      source.registerDataChangeListener(observer);
      source.registerDataChangeListener(observer);
      source.unregisterDataChangeListener(observer);
      source.notifyDataReload();
      expect(observer.reloadCount).assertEqual(0);
      expect(observer.notificationTotal()).assertEqual(0);
      expect(trail.length).assertEqual(0);
      BoardKit.log('lifecycle_duplicateRegistrationSingleUnregisterRemoves', 'single unregister clears duplicate');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_2200
     * @tc.name duplicateRegistrationTrailStaysSingle2200
     * @tc.desc Verify a repeatedly registered listener contributes exactly one trail entry per notification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_duplicateRegistrationTrailStaysSingle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let trail: string[] = [];
      let alpha: SessionListener = new SessionListener('alpha', trail);
      let beta: SessionListener = new SessionListener('beta', trail);
      attachAll(source, [alpha, alpha, beta, beta]);
      source.notifyDataReload();
      expect(trailText(trail)).assertEqual('alpha:reload,beta:reload');
      expect(trail.length).assertEqual(2);
      expect(alpha.reloadCount).assertEqual(1);
      expect(beta.reloadCount).assertEqual(1);
      BoardKit.log('lifecycle_duplicateRegistrationTrailStaysSingle', trailText(trail));
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_2300
     * @tc.name fiveRegisterUnregisterRounds2300
     * @tc.desc Verify five consecutive register, notify, unregister rounds deliver exactly five reloads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_fiveRegisterUnregisterRounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let trail: string[] = [];
      let observer: SessionListener = new SessionListener('alpha', trail);
      for (let round: number = 0; round < 5; round++) {
        source.registerDataChangeListener(observer);
        source.notifyDataReload();
        source.unregisterDataChangeListener(observer);
      }
      expect(observer.reloadCount).assertEqual(5);
      expect(trail.length).assertEqual(5);
      expect(observer.notificationTotal()).assertEqual(5);
      BoardKit.log('lifecycle_fiveRegisterUnregisterRounds', 'reload=' + observer.reloadCount);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_2400
     * @tc.name fiveRoundsCountGrowsOneByOne2400
     * @tc.desc Verify the reload counter equals the round number after every single register and notify round
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_fiveRoundsCountGrowsOneByOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let trail: string[] = [];
      let observer: SessionListener = new SessionListener('alpha', trail);
      let consistent: boolean = true;
      for (let round: number = 1; round <= 5; round++) {
        source.registerDataChangeListener(observer);
        source.notifyDataAdd(round);
        if (observer.addedCount !== round) {
          consistent = false;
        }
        source.unregisterDataChangeListener(observer);
      }
      expect(consistent).assertTrue();
      expect(observer.addedCount).assertEqual(5);
      expect(observer.lastAddIndex).assertEqual(5);
      BoardKit.log('lifecycle_fiveRoundsCountGrowsOneByOne', 'count follows rounds');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_2500
     * @tc.name fiveRoundsEndSilent2500
     * @tc.desc Verify a notification after the last of five unregister rounds adds no callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_fiveRoundsEndSilent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let trail: string[] = [];
      let observer: SessionListener = new SessionListener('alpha', trail);
      for (let round: number = 0; round < 5; round++) {
        source.registerDataChangeListener(observer);
        source.notifyDataChange(round);
        source.unregisterDataChangeListener(observer);
      }
      let settled: number = observer.changedCount;
      source.notifyDataChange(15);
      expect(settled).assertEqual(5);
      expect(observer.changedCount).assertEqual(5);
      expect(observer.lastChangeIndex).assertEqual(4);
      expect(trail.length).assertEqual(5);
      BoardKit.log('lifecycle_fiveRoundsEndSilent', 'trailing notify ignored');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_2600
     * @tc.name fiveConsecutiveRegistrationsDeliverOnce2600
     * @tc.desc Verify five registrations without any unregister still deliver a single callback per notification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_fiveConsecutiveRegistrationsDeliverOnce', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let trail: string[] = [];
      let observer: SessionListener = new SessionListener('alpha', trail);
      for (let round: number = 0; round < 5; round++) {
        source.registerDataChangeListener(observer);
      }
      source.notifyDataChange(11);
      expect(observer.changedCount).assertEqual(1);
      expect(trail.length).assertEqual(1);
      expect(trail[0]).assertEqual('alpha:changed:11');
      BoardKit.log('lifecycle_fiveConsecutiveRegistrationsDeliverOnce', 'dedup holds across five registrations');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_2800
     * @tc.name unregisterBetweenNotificationsLosesLater2800
     * @tc.desc Verify a listener keeps the count it earned before unregistering but receives nothing afterwards
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_unregisterBetweenNotificationsLosesLater', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let trail: string[] = [];
      let observer: SessionListener = new SessionListener('alpha', trail);
      source.registerDataChangeListener(observer);
      source.notifyDataChange(2);
      source.unregisterDataChangeListener(observer);
      source.notifyDataChange(9);
      expect(observer.changedCount).assertEqual(1);
      expect(observer.lastChangeIndex).assertEqual(2);
      expect(trail.length).assertEqual(1);
      expect(trailText(trail)).assertEqual('alpha:changed:2');
      BoardKit.log('lifecycle_unregisterBetweenNotificationsLosesLater', 'later notification lost');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_2900
     * @tc.name registerBetweenNotificationsOnlyLater2900
     * @tc.desc Verify a listener registered between two notifications receives only the second one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_registerBetweenNotificationsOnlyLater', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let trail: string[] = [];
      let alpha: SessionListener = new SessionListener('alpha', trail);
      let beta: SessionListener = new SessionListener('beta', trail);
      source.registerDataChangeListener(alpha);
      source.notifyDataAdd(0);
      source.registerDataChangeListener(beta);
      source.notifyDataAdd(1);
      expect(alpha.addedCount).assertEqual(2);
      expect(beta.addedCount).assertEqual(1);
      expect(beta.lastAddIndex).assertEqual(1);
      expect(trailText(trail)).assertEqual('alpha:added:0,alpha:added:1,beta:added:1');
      BoardKit.log('lifecycle_registerBetweenNotificationsOnlyLater', 'late listener sees one add');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_3000
     * @tc.name notificationBeforeRegistrationNotReplayed3000
     * @tc.desc Verify notifications issued while nobody is registered are lost rather than queued
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_notificationBeforeRegistrationNotReplayed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let trail: string[] = [];
      let observer: SessionListener = new SessionListener('alpha', trail);
      source.notifyDataReload();
      source.notifyDataAdd(4);
      source.notifyDataChange(8);
      source.registerDataChangeListener(observer);
      expect(observer.notificationTotal()).assertEqual(0);
      expect(trail.length).assertEqual(0);
      source.notifyDataReload();
      expect(observer.reloadCount).assertEqual(1);
      expect(observer.notificationTotal()).assertEqual(1);
      BoardKit.log('lifecycle_notificationBeforeRegistrationNotReplayed', 'no replay');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_3100
     * @tc.name registrationRightAfterConstructionWorks3100
     * @tc.desc Verify a listener attached immediately after construction receives the very next notification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_registrationRightAfterConstructionWorks', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let trail: string[] = [];
      let observer: SessionListener = new SessionListener('alpha', trail);
      expect(source.totalCount()).assertEqual(CELLS);
      source.registerDataChangeListener(observer);
      source.notifyDataReload();
      expect(observer.reloadCount).assertEqual(1);
      expect(source.totalCount()).assertEqual(CELLS);
      expect(trailText(trail)).assertEqual('alpha:reload');
      BoardKit.log('lifecycle_registrationRightAfterConstructionWorks', 'registration after construction works');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_3200
     * @tc.name emptySourceRegistrationNotifies3200
     * @tc.desc Verify a source built from zero cells still delivers reload notifications to a registered listener
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_emptySourceRegistrationNotifies', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = emptySource();
      let trail: string[] = [];
      let observer: SessionListener = new SessionListener('alpha', trail);
      source.registerDataChangeListener(observer);
      source.notifyDataReload();
      source.notifyDataAdd(0);
      expect(source.totalCount()).assertEqual(0);
      expect(observer.reloadCount).assertEqual(1);
      expect(observer.addedCount).assertEqual(1);
      expect(trailText(trail)).assertEqual('alpha:reload,alpha:added:0');
      BoardKit.log('lifecycle_emptySourceRegistrationNotifies', 'empty source still notifies');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_3300
     * @tc.name emptySourceUnregisterIsHarmless3300
     * @tc.desc Verify unregistering from an empty data source neither throws nor blocks a later notification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_emptySourceUnregisterIsHarmless', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = emptySource();
      let trail: string[] = [];
      let alpha: SessionListener = new SessionListener('alpha', trail);
      let beta: SessionListener = new SessionListener('beta', trail);
      let threw: boolean = false;
      try {
        source.unregisterDataChangeListener(beta);
      } catch (error) {
        threw = true;
        BoardKit.warn('lifecycle_emptySourceUnregisterIsHarmless', 'unexpected throw');
      }
      expect(threw).assertFalse();
      source.registerDataChangeListener(alpha);
      source.notifyDataReload();
      expect(alpha.reloadCount).assertEqual(1);
      expect(beta.reloadCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_3400
     * @tc.name sameListenerOnTwoSources3400
     * @tc.desc Verify one listener object may observe two sources and counts the callbacks of both
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_sameListenerOnTwoSources', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let first: MyDataSource = blankSource();
      let second: MyDataSource = blankSource();
      let trail: string[] = [];
      let observer: SessionListener = new SessionListener('alpha', trail);
      first.registerDataChangeListener(observer);
      second.registerDataChangeListener(observer);
      first.notifyDataReload();
      second.notifyDataReload();
      expect(observer.reloadCount).assertEqual(2);
      expect(trailText(trail)).assertEqual('alpha:reload,alpha:reload');
      BoardKit.log('lifecycle_sameListenerOnTwoSources', 'two sources, two callbacks');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_3500
     * @tc.name sameListenerTwoSourcesUnregisterOne3500
     * @tc.desc Verify unregistering from one source leaves the registration on the other source active
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_sameListenerTwoSourcesUnregisterOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let first: MyDataSource = blankSource();
      let second: MyDataSource = blankSource();
      let trail: string[] = [];
      let observer: SessionListener = new SessionListener('alpha', trail);
      first.registerDataChangeListener(observer);
      second.registerDataChangeListener(observer);
      first.unregisterDataChangeListener(observer);
      first.notifyDataChange(1);
      second.notifyDataChange(2);
      expect(observer.changedCount).assertEqual(1);
      expect(observer.lastChangeIndex).assertEqual(2);
      expect(trailText(trail)).assertEqual('alpha:changed:2');
      BoardKit.log('lifecycle_sameListenerTwoSourcesUnregisterOne', 'registration on the other source survives');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_3600
     * @tc.name listenersOnDifferentSourcesDoNotCross3600
     * @tc.desc Verify a listener registered on one source never receives notifications from another source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_listenersOnDifferentSourcesDoNotCross', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let first: MyDataSource = blankSource();
      let second: MyDataSource = blankSource();
      let trail: string[] = [];
      let alpha: SessionListener = new SessionListener('alpha', trail);
      let beta: SessionListener = new SessionListener('beta', trail);
      first.registerDataChangeListener(alpha);
      second.registerDataChangeListener(beta);
      first.notifyDataAdd(6);
      expect(alpha.addedCount).assertEqual(1);
      expect(beta.addedCount).assertEqual(0);
      expect(trailText(trail)).assertEqual('alpha:added:6');
      BoardKit.log('lifecycle_listenersOnDifferentSourcesDoNotCross', 'no cross source delivery');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_3700
     * @tc.name allThreeKindsThenUnregisterSilences3700
     * @tc.desc Verify reload, add and change all reach the listener before unregister and none reach it after
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_allThreeKindsThenUnregisterSilences', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let trail: string[] = [];
      let observer: SessionListener = new SessionListener('alpha', trail);
      source.registerDataChangeListener(observer);
      source.notifyDataReload();
      source.notifyDataAdd(3);
      source.notifyDataChange(3);
      expect(observer.notificationTotal()).assertEqual(3);
      source.unregisterDataChangeListener(observer);
      source.notifyDataReload();
      source.notifyDataAdd(3);
      source.notifyDataChange(3);
      expect(observer.reloadCount).assertEqual(1);
      expect(observer.addedCount).assertEqual(1);
      expect(observer.changedCount).assertEqual(1);
      expect(trail.length).assertEqual(3);
      BoardKit.log('lifecycle_allThreeKindsThenUnregisterSilences', 'three kinds then silence');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_3900
     * @tc.name fiveListenersThenRemoveTwo3900
     * @tc.desc Verify removing two of five listeners leaves the other three receiving exactly one callback each
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_fiveListenersThenRemoveTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let trail: string[] = [];
      let alpha: SessionListener = new SessionListener('alpha', trail);
      let beta: SessionListener = new SessionListener('beta', trail);
      let gamma: SessionListener = new SessionListener('gamma', trail);
      let delta: SessionListener = new SessionListener('delta', trail);
      let epsilon: SessionListener = new SessionListener('epsilon', trail);
      attachAll(source, [alpha, beta, gamma, delta, epsilon]);
      source.notifyDataReload();
      expect(trail.length).assertEqual(5);
      source.unregisterDataChangeListener(beta);
      source.unregisterDataChangeListener(delta);
      source.notifyDataReload();
      expect(alpha.reloadCount).assertEqual(2);
      expect(beta.reloadCount).assertEqual(1);
      expect(gamma.reloadCount).assertEqual(2);
      expect(delta.reloadCount).assertEqual(1);
      expect(epsilon.reloadCount).assertEqual(2);
      BoardKit.log('lifecycle_fiveListenersThenRemoveTwo', 'three of five keep receiving');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_4000
     * @tc.name removalInReverseOrderLeavesNone4000
     * @tc.desc Verify removing three listeners from the tail backwards removes every registration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_removalInReverseOrderLeavesNone', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let trail: string[] = [];
      let alpha: SessionListener = new SessionListener('alpha', trail);
      let beta: SessionListener = new SessionListener('beta', trail);
      let gamma: SessionListener = new SessionListener('gamma', trail);
      attachAll(source, [alpha, beta, gamma]);
      source.unregisterDataChangeListener(gamma);
      source.unregisterDataChangeListener(beta);
      source.unregisterDataChangeListener(alpha);
      source.notifyDataReload();
      source.notifyDataAdd(12);
      expect(alpha.notificationTotal()).assertEqual(0);
      expect(beta.notificationTotal()).assertEqual(0);
      expect(gamma.notificationTotal()).assertEqual(0);
      expect(trail.length).assertEqual(0);
      BoardKit.log('lifecycle_removalInReverseOrderLeavesNone', 'all removed');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_4100
     * @tc.name intermixedSequenceSplitsCounts4100
     * @tc.desc Verify an interleaved register, notify and unregister sequence splits counts two and two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_intermixedSequenceSplitsCounts', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let trail: string[] = [];
      let alpha: SessionListener = new SessionListener('alpha', trail);
      let beta: SessionListener = new SessionListener('beta', trail);
      source.registerDataChangeListener(alpha);
      source.notifyDataReload();
      source.registerDataChangeListener(beta);
      source.notifyDataAdd(1);
      source.unregisterDataChangeListener(alpha);
      source.notifyDataChange(2);
      expect(alpha.notificationTotal()).assertEqual(2);
      expect(beta.notificationTotal()).assertEqual(2);
      expect(alpha.lastAddIndex).assertEqual(1);
      expect(beta.lastChangeIndex).assertEqual(2);
      expect(trailText(trail)).assertEqual('alpha:reload,alpha:added:1,beta:added:1,beta:changed:2');
      BoardKit.log('lifecycle_intermixedSequenceSplitsCounts', trailText(trail));
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_4200
     * @tc.name lastRemovalThenReRegistrationWorks4200
     * @tc.desc Verify a source whose only listener was removed accepts the same listener again and notifies it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_lastRemovalThenReRegistrationWorks', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let trail: string[] = [];
      let observer: SessionListener = new SessionListener('alpha', trail);
      source.registerDataChangeListener(observer);
      source.unregisterDataChangeListener(observer);
      source.notifyDataReload();
      expect(observer.reloadCount).assertEqual(0);
      source.registerDataChangeListener(observer);
      source.notifyDataReload();
      expect(observer.reloadCount).assertEqual(1);
      expect(trail.length).assertEqual(1);
      expect(trailText(trail)).assertEqual('alpha:reload');
      BoardKit.log('lifecycle_lastRemovalThenReRegistrationWorks', 're-registration after last removal works');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELIFECYCLE_4300
     * @tc.name tenRegisterUnregisterCycles4300
     * @tc.desc Verify ten full register, notify and unregister cycles deliver exactly ten change callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lifecycle_tenRegisterUnregisterCycles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let trail: string[] = [];
      let observer: SessionListener = new SessionListener('alpha', trail);
      for (let cycle: number = 0; cycle < 10; cycle++) {
        source.registerDataChangeListener(observer);
        source.notifyDataChange(cycle % CELLS);
        source.unregisterDataChangeListener(observer);
      }
      expect(observer.changedCount).assertEqual(10);
      expect(observer.lastChangeIndex).assertEqual(9);
      expect(trail.length).assertEqual(10);
      expect(observer.notificationTotal()).assertEqual(10);
      BoardKit.log('lifecycle_tenRegisterUnregisterCycles', 'changed=' + observer.changedCount);
    });
  });
}
