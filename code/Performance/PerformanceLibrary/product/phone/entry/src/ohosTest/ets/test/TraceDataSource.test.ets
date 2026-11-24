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

import { beforeEach, describe, expect, it } from '@ohos/hypium';
import { BasicDataSource } from '@ohos/trace';

class TraceSource extends BasicDataSource<number> {
  private values: number[] = [7, 11, 19];

  totalCount(): number {
    return this.values.length;
  }

  getData(index: number): number {
    return this.values[index];
  }
}

class TraceListener implements DataChangeListener {
  events: string[] = [];
  deliveryOrder: string[];
  label: string;

  constructor(label: string, deliveryOrder: string[]) {
    this.label = label;
    this.deliveryOrder = deliveryOrder;
  }

  record(event: string): void {
    this.events.push(event);
    this.deliveryOrder.push(this.label + ':' + event);
  }

  onDataReloaded(): void { this.record('reload'); }
  onDataAdd(index: number): void { this.record('add:' + index); }
  onDataChange(index: number): void { this.record('change:' + index); }
  onDataDelete(index: number): void { this.record('delete:' + index); }
  onDataMove(from: number, to: number): void { this.record('move:' + from + ':' + to); }
  onDataAdded(index: number): void { this.onDataAdd(index); }
  onDataChanged(index: number): void { this.onDataChange(index); }
  onDataDeleted(index: number): void { this.onDataDelete(index); }
  onDataMoved(from: number, to: number): void { this.onDataMove(from, to); }
  onDatasetChange(dataOperations: DataOperation[]): void { this.record(`dataset:${dataOperations.length}`); }
}

function expectOriginalData(source: TraceSource): void {
  expect(source.totalCount()).assertEqual(3);
  expect(source.getData(0)).assertEqual(7);
  expect(source.getData(1)).assertEqual(11);
  expect(source.getData(2)).assertEqual(19);
}

export default function traceDataSourceTest(): void {
  describe('PerformanceTraceDataSource', () => {
    let source: TraceSource;
    let first: TraceListener;
    let second: TraceListener;
    let order: string[];

    beforeEach(() => {
      source = new TraceSource();
      order = [];
      first = new TraceListener('first', order);
      second = new TraceListener('second', order);
    });

    /**
     * @tc.number SUB_PERFORMANCE_TRACEDATASOURCE_0100
     * @tc.name reloadDeliversExactArguments
     * @tc.desc Invoke the real inherited notifier and inspect its recorded arguments.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('reloadDeliversExactArguments', 0, () => {
      source.registerDataChangeListener(first);
      source.notifyDataReload();
      expect(first.events.join(',')).assertEqual('reload');
      expect(second.events.length).assertEqual(0);
      expectOriginalData(source);
    });

    /**
     * @tc.number SUB_PERFORMANCE_TRACEDATASOURCE_0200
     * @tc.name reloadFansOutInRegistrationOrder
     * @tc.desc Two real registrations receive exactly one callback in registration order.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('reloadFansOutInRegistrationOrder', 0, () => {
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataReload();
      expect(first.events.join(',')).assertEqual('reload');
      expect(second.events.join(',')).assertEqual('reload');
      expect(order.join(',')).assertEqual('first:reload,second:reload');
    });

    /**
     * @tc.number SUB_PERFORMANCE_TRACEDATASOURCE_0300
     * @tc.name reloadDeduplicatesTheSameListener
     * @tc.desc Registering the same object twice must not duplicate callbacks.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('reloadDeduplicatesTheSameListener', 0, () => {
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(first);
      source.notifyDataReload();
      expect(first.events.join(',')).assertEqual('reload');
      expect(order.length).assertEqual(1);
      expectOriginalData(source);
    });

    /**
     * @tc.number SUB_PERFORMANCE_TRACEDATASOURCE_0400
     * @tc.name reloadStopsDeliveryAfterUnsubscribe
     * @tc.desc Unsubscribing one listener preserves the other subscription.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('reloadStopsDeliveryAfterUnsubscribe', 0, () => {
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.unregisterDataChangeListener(first);
      source.notifyDataReload();
      expect(first.events.length).assertEqual(0);
      expect(second.events.join(',')).assertEqual('reload');
      expect(order.join(',')).assertEqual('second:reload');
    });

    /**
     * @tc.number SUB_PERFORMANCE_TRACEDATASOURCE_0500
     * @tc.name addDeliversExactArguments
     * @tc.desc Invoke the real inherited notifier and inspect its recorded arguments.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('addDeliversExactArguments', 0, () => {
      source.registerDataChangeListener(first);
      source.notifyDataAdd(2);
      expect(first.events.join(',')).assertEqual('add:2');
      expect(second.events.length).assertEqual(0);
      expectOriginalData(source);
    });

    /**
     * @tc.number SUB_PERFORMANCE_TRACEDATASOURCE_0600
     * @tc.name addFansOutInRegistrationOrder
     * @tc.desc Two real registrations receive exactly one callback in registration order.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('addFansOutInRegistrationOrder', 0, () => {
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataAdd(2);
      expect(first.events.join(',')).assertEqual('add:2');
      expect(second.events.join(',')).assertEqual('add:2');
      expect(order.join(',')).assertEqual('first:add:2,second:add:2');
    });

    /**
     * @tc.number SUB_PERFORMANCE_TRACEDATASOURCE_0700
     * @tc.name addDeduplicatesTheSameListener
     * @tc.desc Registering the same object twice must not duplicate callbacks.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('addDeduplicatesTheSameListener', 0, () => {
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(first);
      source.notifyDataAdd(2);
      expect(first.events.join(',')).assertEqual('add:2');
      expect(order.length).assertEqual(1);
      expectOriginalData(source);
    });

    /**
     * @tc.number SUB_PERFORMANCE_TRACEDATASOURCE_0800
     * @tc.name addStopsDeliveryAfterUnsubscribe
     * @tc.desc Unsubscribing one listener preserves the other subscription.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('addStopsDeliveryAfterUnsubscribe', 0, () => {
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.unregisterDataChangeListener(first);
      source.notifyDataAdd(2);
      expect(first.events.length).assertEqual(0);
      expect(second.events.join(',')).assertEqual('add:2');
      expect(order.join(',')).assertEqual('second:add:2');
    });

    /**
     * @tc.number SUB_PERFORMANCE_TRACEDATASOURCE_0900
     * @tc.name changeDeliversExactArguments
     * @tc.desc Invoke the real inherited notifier and inspect its recorded arguments.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('changeDeliversExactArguments', 0, () => {
      source.registerDataChangeListener(first);
      source.notifyDataChange(1);
      expect(first.events.join(',')).assertEqual('change:1');
      expect(second.events.length).assertEqual(0);
      expectOriginalData(source);
    });

    /**
     * @tc.number SUB_PERFORMANCE_TRACEDATASOURCE_1000
     * @tc.name changeFansOutInRegistrationOrder
     * @tc.desc Two real registrations receive exactly one callback in registration order.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('changeFansOutInRegistrationOrder', 0, () => {
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataChange(1);
      expect(first.events.join(',')).assertEqual('change:1');
      expect(second.events.join(',')).assertEqual('change:1');
      expect(order.join(',')).assertEqual('first:change:1,second:change:1');
    });

    /**
     * @tc.number SUB_PERFORMANCE_TRACEDATASOURCE_1100
     * @tc.name changeDeduplicatesTheSameListener
     * @tc.desc Registering the same object twice must not duplicate callbacks.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('changeDeduplicatesTheSameListener', 0, () => {
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(first);
      source.notifyDataChange(1);
      expect(first.events.join(',')).assertEqual('change:1');
      expect(order.length).assertEqual(1);
      expectOriginalData(source);
    });

    /**
     * @tc.number SUB_PERFORMANCE_TRACEDATASOURCE_1200
     * @tc.name changeStopsDeliveryAfterUnsubscribe
     * @tc.desc Unsubscribing one listener preserves the other subscription.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('changeStopsDeliveryAfterUnsubscribe', 0, () => {
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.unregisterDataChangeListener(first);
      source.notifyDataChange(1);
      expect(first.events.length).assertEqual(0);
      expect(second.events.join(',')).assertEqual('change:1');
      expect(order.join(',')).assertEqual('second:change:1');
    });

    /**
     * @tc.number SUB_PERFORMANCE_TRACEDATASOURCE_1300
     * @tc.name deleteDeliversExactArguments
     * @tc.desc Invoke the real inherited notifier and inspect its recorded arguments.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('deleteDeliversExactArguments', 0, () => {
      source.registerDataChangeListener(first);
      source.notifyDataDelete(0);
      expect(first.events.join(',')).assertEqual('delete:0');
      expect(second.events.length).assertEqual(0);
      expectOriginalData(source);
    });

    /**
     * @tc.number SUB_PERFORMANCE_TRACEDATASOURCE_1400
     * @tc.name deleteFansOutInRegistrationOrder
     * @tc.desc Two real registrations receive exactly one callback in registration order.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('deleteFansOutInRegistrationOrder', 0, () => {
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataDelete(0);
      expect(first.events.join(',')).assertEqual('delete:0');
      expect(second.events.join(',')).assertEqual('delete:0');
      expect(order.join(',')).assertEqual('first:delete:0,second:delete:0');
    });

    /**
     * @tc.number SUB_PERFORMANCE_TRACEDATASOURCE_1500
     * @tc.name deleteDeduplicatesTheSameListener
     * @tc.desc Registering the same object twice must not duplicate callbacks.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('deleteDeduplicatesTheSameListener', 0, () => {
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(first);
      source.notifyDataDelete(0);
      expect(first.events.join(',')).assertEqual('delete:0');
      expect(order.length).assertEqual(1);
      expectOriginalData(source);
    });

    /**
     * @tc.number SUB_PERFORMANCE_TRACEDATASOURCE_1600
     * @tc.name deleteStopsDeliveryAfterUnsubscribe
     * @tc.desc Unsubscribing one listener preserves the other subscription.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('deleteStopsDeliveryAfterUnsubscribe', 0, () => {
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.unregisterDataChangeListener(first);
      source.notifyDataDelete(0);
      expect(first.events.length).assertEqual(0);
      expect(second.events.join(',')).assertEqual('delete:0');
      expect(order.join(',')).assertEqual('second:delete:0');
    });

    /**
     * @tc.number SUB_PERFORMANCE_TRACEDATASOURCE_1700
     * @tc.name moveDeliversExactArguments
     * @tc.desc Invoke the real inherited notifier and inspect its recorded arguments.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('moveDeliversExactArguments', 0, () => {
      source.registerDataChangeListener(first);
      source.notifyDataMove(2, 0);
      expect(first.events.join(',')).assertEqual('move:2:0');
      expect(second.events.length).assertEqual(0);
      expectOriginalData(source);
    });

    /**
     * @tc.number SUB_PERFORMANCE_TRACEDATASOURCE_1800
     * @tc.name moveFansOutInRegistrationOrder
     * @tc.desc Two real registrations receive exactly one callback in registration order.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('moveFansOutInRegistrationOrder', 0, () => {
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataMove(2, 0);
      expect(first.events.join(',')).assertEqual('move:2:0');
      expect(second.events.join(',')).assertEqual('move:2:0');
      expect(order.join(',')).assertEqual('first:move:2:0,second:move:2:0');
    });

    /**
     * @tc.number SUB_PERFORMANCE_TRACEDATASOURCE_1900
     * @tc.name moveDeduplicatesTheSameListener
     * @tc.desc Registering the same object twice must not duplicate callbacks.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('moveDeduplicatesTheSameListener', 0, () => {
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(first);
      source.notifyDataMove(2, 0);
      expect(first.events.join(',')).assertEqual('move:2:0');
      expect(order.length).assertEqual(1);
      expectOriginalData(source);
    });

    /**
     * @tc.number SUB_PERFORMANCE_TRACEDATASOURCE_2000
     * @tc.name moveStopsDeliveryAfterUnsubscribe
     * @tc.desc Unsubscribing one listener preserves the other subscription.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('moveStopsDeliveryAfterUnsubscribe', 0, () => {
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.unregisterDataChangeListener(first);
      source.notifyDataMove(2, 0);
      expect(first.events.length).assertEqual(0);
      expect(second.events.join(',')).assertEqual('move:2:0');
      expect(order.join(',')).assertEqual('second:move:2:0');
    });

    /**
     * @tc.number SUB_PERFORMANCE_TRACEDATASOURCE_2100
     * @tc.name unknownUnsubscribePreservesAllSubscriptions
     * @tc.desc Removing a never registered listener must not remove the final real listener.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('unknownUnsubscribePreservesAllSubscriptions', 0, () => {
      source.registerDataChangeListener(first);
      source.unregisterDataChangeListener(second);
      source.notifyDataChange(1);
      expect(first.events.join(',')).assertEqual('change:1');
      expect(second.events.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_PERFORMANCE_TRACEDATASOURCE_2200
     * @tc.name repeatedUnsubscribeDoesNotRemoveTheOtherListener
     * @tc.desc A second unsubscribe must remain harmless to another listener.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('repeatedUnsubscribeDoesNotRemoveTheOtherListener', 0, () => {
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.unregisterDataChangeListener(first);
      source.unregisterDataChangeListener(first);
      source.notifyDataAdd(0);
      expect(first.events.length).assertEqual(0);
      expect(second.events.join(',')).assertEqual('add:0');
    });

    /**
     * @tc.number SUB_PERFORMANCE_TRACEDATASOURCE_2300
     * @tc.name resubscribeAppendsTheListenerToDeliveryOrder
     * @tc.desc A removed listener can join again without duplicate or replayed events.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('resubscribeAppendsTheListenerToDeliveryOrder', 0, () => {
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.unregisterDataChangeListener(first);
      source.notifyDataReload();
      source.registerDataChangeListener(first);
      source.notifyDataChange(2);
      expect(first.events.join(',')).assertEqual('change:2');
      expect(second.events.join(',')).assertEqual('reload,change:2');
      expect(order.join(',')).assertEqual('second:reload,second:change:2,first:change:2');
    });

    /**
     * @tc.number SUB_PERFORMANCE_TRACEDATASOURCE_2400
     * @tc.name separateSourcesKeepSeparateSubscriptions
     * @tc.desc The same concrete base implementation must isolate listener storage per source.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('separateSourcesKeepSeparateSubscriptions', 0, () => {
      const other = new TraceSource();
      source.registerDataChangeListener(first);
      other.registerDataChangeListener(second);
      source.notifyDataMove(0, 2);
      other.notifyDataReload();
      expect(first.events.join(',')).assertEqual('move:0:2');
      expect(second.events.join(',')).assertEqual('reload');
      expectOriginalData(source);
      expectOriginalData(other);
    });

    /**
     * @tc.number SUB_PERFORMANCE_TRACEDATASOURCE_2500
     * @tc.name notificationsWithoutSubscribersPreserveData
     * @tc.desc All notifier methods are safe before any subscription exists.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('notificationsWithoutSubscribersPreserveData', 0, () => {
      source.notifyDataReload();
      source.notifyDataAdd(0);
      source.notifyDataChange(1);
      source.notifyDataDelete(2);
      source.notifyDataMove(2, 0);
      expectOriginalData(source);
      expect(order.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_PERFORMANCE_TRACEDATASOURCE_2600
     * @tc.name mixedNotificationsPreserveEventSequence
     * @tc.desc Different event kinds must remain distinct and ordered.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mixedNotificationsPreserveEventSequence', 0, () => {
      source.registerDataChangeListener(first);
      source.notifyDataAdd(0);
      source.notifyDataChange(1);
      source.notifyDataMove(0, 2);
      source.notifyDataDelete(2);
      source.notifyDataReload();
      expect(first.events.join(',')).assertEqual('add:0,change:1,move:0:2,delete:2,reload');
      expectOriginalData(source);
    });

    /**
     * @tc.number SUB_PERFORMANCE_TRACEDATASOURCE_2700
     * @tc.name reverseMovesPreserveBothEndpoints
     * @tc.desc Moving back must not reuse or swap the prior move arguments.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('reverseMovesPreserveBothEndpoints', 0, () => {
      source.registerDataChangeListener(first);
      source.notifyDataMove(0, 2);
      source.notifyDataMove(2, 0);
      expect(first.events.join(',')).assertEqual('move:0:2,move:2:0');
      expectOriginalData(source);
    });

    /**
     * @tc.number SUB_PERFORMANCE_TRACEDATASOURCE_2800
     * @tc.name lateSubscriptionDoesNotReplayOldEvents
     * @tc.desc Only events emitted after registration are delivered.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('lateSubscriptionDoesNotReplayOldEvents', 0, () => {
      source.notifyDataReload();
      source.notifyDataAdd(1);
      source.registerDataChangeListener(first);
      expect(first.events.length).assertEqual(0);
      source.notifyDataChange(2);
      expect(first.events.join(',')).assertEqual('change:2');
    });

  });
}
