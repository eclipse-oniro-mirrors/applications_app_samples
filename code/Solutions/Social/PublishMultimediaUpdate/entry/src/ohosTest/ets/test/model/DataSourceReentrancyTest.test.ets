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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import { yieldToEventLoop } from '../common/TestYield';
import Logger from '../Logger';
import { BasicDataSource } from 'publishmultimediaupdate/src/main/ets/model/BasicDataSource';
import { BUNDLE, TAG } from '../common/TestConstant';
import { RecordingListener } from '../common/RecordingListener';
/**
 * Re-entrant and self-modifying notification behaviour.
 * BasicDataSource notifies through Array.forEach, which captures the listener
 * count when the call starts. The cases below pin what that means for a page
 * that registers or unregisters around a refresh, and for a listener that
 * triggers another update from inside its own callback.
 */
class CountingSource extends BasicDataSource<number> {
  public rows: Array<number> = [];
  totalCount(): number {
    return this.rows.length;
  }
  getData(index: number): number {
    return this.rows[index];
  }
}
/**
 * Listener that performs one action the first time it is called.
 */
class ReactiveListener implements DataChangeListener {
  public seen: number = 0;
  public action: () => void;
  public fired: boolean = false;
  constructor(action: () => void) {
    this.action = action;
  }
  private trigger(): void {
    this.seen += 1;
    if (!this.fired) {
      this.fired = true;
      this.action();
    }
  }
  onDataReloaded(): void {
    this.trigger();
  }
  onDataAdd(index: number): void {
    this.trigger();
  }
  onDataMove(from: number, to: number): void {
    this.trigger();
  }
  onDataDelete(index: number): void {
    this.trigger();
  }
  onDataChange(index: number): void {
    this.trigger();
  }
  onDatasetChange(dataOperations: DataOperation[]): void {
    this.trigger();
  }
  onDataAdded(index: number): void {
    this.trigger();
  }
  onDataMoved(from: number, to: number): void {
    this.trigger();
  }
  onDataDeleted(index: number): void {
    this.trigger();
  }
  onDataChanged(index: number): void {
    this.trigger();
  }
}
/**
 * Listener that throws, used to observe how a failing callback affects the
 * remaining listeners of the same notification.
 */
class ThrowingListener implements DataChangeListener {
  public seen: number = 0;
  private fail(): void {
    this.seen += 1;
    throw new Error('listener failure');
  }
  onDataReloaded(): void {
    this.fail();
  }
  onDataAdd(index: number): void {
    this.fail();
  }
  onDataMove(from: number, to: number): void {
    this.fail();
  }
  onDataDelete(index: number): void {
    this.fail();
  }
  onDataChange(index: number): void {
    this.fail();
  }
  onDatasetChange(dataOperations: DataOperation[]): void {
    this.fail();
  }
  onDataAdded(index: number): void {
    this.fail();
  }
  onDataMoved(from: number, to: number): void {
    this.fail();
  }
  onDataDeleted(index: number): void {
    this.fail();
  }
  onDataChanged(index: number): void {
    this.fail();
  }
}
export default function dataSourceReentrancyTest() {
  describe('DataSourceReentrancyTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REENTRANCY_0100
     * @tc.name RegisterDuringNotifyIsNotVisited001
     * @tc.desc Verify register during notify is not visited
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RegisterDuringNotifyIsNotVisited_001', 0, (): void => {
      Logger.info(TAG, 'RegisterDuringNotifyIsNotVisited_001 begin');
      const source: CountingSource = new CountingSource();
      const late: RecordingListener = new RecordingListener('late');
      const reactive: ReactiveListener = new ReactiveListener((): void => {
        source.registerDataChangeListener(late);
      });
      source.registerDataChangeListener(reactive);
      source.notifyDataAdd(0);
      const check01: boolean = reactive.seen === 1 && late.isSilent();
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'RegisterDuringNotifyIsNotVisited_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REENTRANCY_0200
     * @tc.name LateListenerServesNextNotify002
     * @tc.desc Verify late listener serves next notify
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LateListenerServesNextNotify_002', 0, (): void => {
      Logger.info(TAG, 'LateListenerServesNextNotify_002 begin');
      const source: CountingSource = new CountingSource();
      const late: RecordingListener = new RecordingListener('late');
      const reactive: ReactiveListener = new ReactiveListener((): void => {
        source.registerDataChangeListener(late);
      });
      source.registerDataChangeListener(reactive);
      source.notifyDataAdd(0);
      source.notifyDataAdd(1);
      expect(late.eventCount()).assertEqual(1);
      expect(late.indexAt(0)).assertEqual(1);
      Logger.info(TAG, 'LateListenerServesNextNotify_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REENTRANCY_0300
     * @tc.name UnregisterLaterPeerSkipsIt003
     * @tc.desc Verify unregister later peer skips it
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UnregisterLaterPeerSkipsIt_003', 0, (): void => {
      Logger.info(TAG, 'UnregisterLaterPeerSkipsIt_003 begin');
      const source: CountingSource = new CountingSource();
      const victim: RecordingListener = new RecordingListener('victim');
      const reactive: ReactiveListener = new ReactiveListener((): void => {
        source.unregisterDataChangeListener(victim);
      });
      source.registerDataChangeListener(reactive);
      source.registerDataChangeListener(victim);
      source.notifyDataAdd(0);
      const check01: boolean = victim.isSilent();
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'UnregisterLaterPeerSkipsIt_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REENTRANCY_0400
     * @tc.name UnregisterEarlierPeerKeepsOwn004
     * @tc.desc Verify unregister earlier peer keeps own
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UnregisterEarlierPeerKeepsOwn_004', 0, (): void => {
      Logger.info(TAG, 'UnregisterEarlierPeerKeepsOwn_004 begin');
      const source: CountingSource = new CountingSource();
      const early: RecordingListener = new RecordingListener('early');
      const reactive: ReactiveListener = new ReactiveListener((): void => {
        source.unregisterDataChangeListener(early);
      });
      source.registerDataChangeListener(early);
      source.registerDataChangeListener(reactive);
      source.notifyDataAdd(0);
      expect(early.eventCount()).assertEqual(1);
      expect(reactive.seen).assertEqual(1);
      Logger.info(TAG, 'UnregisterEarlierPeerKeepsOwn_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REENTRANCY_0500
     * @tc.name SelfUnregisterDuringCallback005
     * @tc.desc Verify self unregister during callback
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SelfUnregisterDuringCallback_005', 0, (): void => {
      Logger.info(TAG, 'SelfUnregisterDuringCallback_005 begin');
      const source: CountingSource = new CountingSource();
      const listener: RecordingListener = new RecordingListener('self');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      source.unregisterDataChangeListener(listener);
      source.notifyDataAdd(1);
      expect(listener.eventCount()).assertEqual(1);
      Logger.info(TAG, 'SelfUnregisterDuringCallback_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REENTRANCY_0600
     * @tc.name NestedNotifyReachesSameListener006
     * @tc.desc Verify nested notify reaches same listener
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NestedNotifyReachesSameListener_006', 0, (): void => {
      Logger.info(TAG, 'NestedNotifyReachesSameListener_006 begin');
      const source: CountingSource = new CountingSource();
      const listener: RecordingListener = new RecordingListener('nested');
      source.registerDataChangeListener(listener);
      const reactive: ReactiveListener = new ReactiveListener((): void => {
        source.notifyDataChange(7);
      });
      source.registerDataChangeListener(reactive);
      source.notifyDataAdd(0);
      expect(listener.eventCount()).assertEqual(2);
      expect(listener.kindSequence()).assertEqual('add|change');
      expect(listener.indexAt(1)).assertEqual(7);
      Logger.info(TAG, 'NestedNotifyReachesSameListener_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REENTRANCY_0700
     * @tc.name NestedNotifyOrderIsInnerFirst007
     * @tc.desc Verify nested notify order is inner first
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NestedNotifyOrderIsInnerFirst_007', 0, (): void => {
      Logger.info(TAG, 'NestedNotifyOrderIsInnerFirst_007 begin');
      const source: CountingSource = new CountingSource();
      const listener: RecordingListener = new RecordingListener('order');
      source.registerDataChangeListener(listener);
      const reactive: ReactiveListener = new ReactiveListener((): void => {
        source.notifyDataMove(2, 5);
      });
      source.registerDataChangeListener(reactive);
      source.notifyDataDelete(1);
      expect(listener.kindSequence()).assertEqual('delete|move');
      expect(listener.toIndexAt(1)).assertEqual(5);
      Logger.info(TAG, 'NestedNotifyOrderIsInnerFirst_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REENTRANCY_0800
     * @tc.name ThrowStopsRemainingListeners008
     * @tc.desc Verify throw stops remaining listeners
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ThrowStopsRemainingListeners_008', 0, (): void => {
      Logger.info(TAG, 'ThrowStopsRemainingListeners_008 begin');
      const source: CountingSource = new CountingSource();
      const throwing: ThrowingListener = new ThrowingListener();
      const after: RecordingListener = new RecordingListener('after');
      source.registerDataChangeListener(throwing);
      source.registerDataChangeListener(after);
      let escaped: boolean = false;
      try {
        source.notifyDataAdd(0);
      }
      catch (error) {
        escaped = true;
      }
      const check01: boolean = escaped && after.isSilent();
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'ThrowStopsRemainingListeners_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REENTRANCY_0900
     * @tc.name ThrowingListenerKeepsSubscription009
     * @tc.desc Verify throwing listener keeps subscription
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ThrowingListenerKeepsSubscription_009', 0, (): void => {
      Logger.info(TAG, 'ThrowingListenerKeepsSubscription_009 begin');
      const source: CountingSource = new CountingSource();
      const throwing: ThrowingListener = new ThrowingListener();
      source.registerDataChangeListener(throwing);
      try {
        source.notifyDataAdd(0);
      }
      catch (error) {
        Logger.info(TAG, 'first notify threw as expected');
      }
      try {
        source.notifyDataAdd(1);
      }
      catch (error) {
        Logger.info(TAG, 'second notify threw as expected');
      }
      expect(throwing.seen).assertEqual(2);
      Logger.info(TAG, 'ThrowingListenerKeepsSubscription_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REENTRANCY_1000
     * @tc.name ResetDuringNotifyKeepsDelivery010
     * @tc.desc Verify reset during notify keeps delivery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ResetDuringNotifyKeepsDelivery_010', 0, (): void => {
      Logger.info(TAG, 'ResetDuringNotifyKeepsDelivery_010 begin');
      const source: CountingSource = new CountingSource();
      const first: RecordingListener = new RecordingListener('first');
      const second: RecordingListener = new RecordingListener('second');
      const reactive: ReactiveListener = new ReactiveListener((): void => {
        first.reset();
      });
      source.registerDataChangeListener(reactive);
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataReload();
      const bothDelivered: boolean = first.eventCount() === 1 && second.eventCount() === 1;
      Logger.info(TAG, 'bothDelivered=' + JSON.stringify(bothDelivered));
      expect(bothDelivered).assertTrue();
      expect(first.kindAt(0)).assertEqual('reload');
      Logger.info(TAG, 'ResetDuringNotifyKeepsDelivery_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REENTRANCY_1100
     * @tc.name DuplicateRegisterDuringNotify011
     * @tc.desc Verify duplicate register during notify
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DuplicateRegisterDuringNotify_011', 0, (): void => {
      Logger.info(TAG, 'DuplicateRegisterDuringNotify_011 begin');
      const source: CountingSource = new CountingSource();
      const listener: RecordingListener = new RecordingListener('dup');
      const reactive: ReactiveListener = new ReactiveListener((): void => {
        source.registerDataChangeListener(listener);
        source.registerDataChangeListener(listener);
      });
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(reactive);
      source.notifyDataAdd(0);
      source.notifyDataAdd(1);
      expect(listener.eventCount()).assertEqual(2);
      Logger.info(TAG, 'DuplicateRegisterDuringNotify_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REENTRANCY_1200
     * @tc.name UnregisterAllDuringNotify012
     * @tc.desc Verify unregister all during notify
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UnregisterAllDuringNotify_012', 0, (): void => {
      Logger.info(TAG, 'UnregisterAllDuringNotify_012 begin');
      const source: CountingSource = new CountingSource();
      const first: RecordingListener = new RecordingListener('first');
      const second: RecordingListener = new RecordingListener('second');
      const third: RecordingListener = new RecordingListener('third');
      const reactive: ReactiveListener = new ReactiveListener((): void => {
        source.unregisterDataChangeListener(first);
        source.unregisterDataChangeListener(second);
        source.unregisterDataChangeListener(third);
      });
      source.registerDataChangeListener(reactive);
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.registerDataChangeListener(third);
      source.notifyDataAdd(0);
      const silent: boolean = first.isSilent() && second.isSilent() && third.isSilent();
      Logger.info(TAG, 'silent=' + JSON.stringify(silent));
      expect(silent).assertTrue();
      Logger.info(TAG, 'UnregisterAllDuringNotify_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REENTRANCY_1300
     * @tc.name NotifyAfterAllGoneIsSilent013
     * @tc.desc Verify notify after all gone is silent
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NotifyAfterAllGoneIsSilent_013', 0, (): void => {
      Logger.info(TAG, 'NotifyAfterAllGoneIsSilent_013 begin');
      const source: CountingSource = new CountingSource();
      const listener: RecordingListener = new RecordingListener('gone');
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      let threw: boolean = false;
      try {
        source.notifyDataChange(3);
      }
      catch (error) {
        threw = true;
      }
      const check01: boolean = threw === false && listener.isSilent();
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'NotifyAfterAllGoneIsSilent_013 end');
    });
  });
}
