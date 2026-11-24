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
import { WaterFlowDataSource } from '@ohos/WaterFlow';

class RecordingListener implements DataChangeListener {
  events: string[] = [];
  reloadCount: number = 0;
  added: number[] = [];
  deleted: number[] = [];
  changed: number[] = [];
  moveFrom: number[] = [];
  moveTo: number[] = [];

  onDataReloaded(): void {
    this.events.push('reload');
    this.reloadCount++;
  }

  onDataAdd(index: number): void {
    this.events.push('add:' + index);
    this.added.push(index);
  }

  onDataDelete(index: number): void {
    this.events.push('delete:' + index);
    this.deleted.push(index);
  }

  onDataChange(index: number): void {
    this.events.push('change:' + index);
    this.changed.push(index);
  }

  onDataMove(from: number, to: number): void {
    this.events.push('move:' + from + ':' + to);
    this.moveFrom.push(from);
    this.moveTo.push(to);
  }

  onDataAdded(index: number): void {
    this.onDataAdd(index);
  }

  onDataDeleted(index: number): void {
    this.onDataDelete(index);
  }

  onDataChanged(index: number): void {
    this.onDataChange(index);
  }

  onDataMoved(from: number, to: number): void {
    this.onDataMove(from, to);
  }

  onDatasetChange(dataOperations: DataOperation[]): void {
    this.events.push(`dataset:${dataOperations.length}`);
  }
}

function expectData(source: WaterFlowDataSource, expected: number[]): void {
  expect(source.totalCount()).assertEqual(expected.length);
  for (let index = 0; index < expected.length; index++) {
    expect(source.getData(index)).assertEqual(expected[index]);
  }
}

function initialItems(): number[] {
  const result: number[] = [];
  for (let index = 0; index < 100; index++) {
    result.push(index);
  }
  return result;
}

export default function waterFlowDataSourceTest(): void {
  describe('PerformanceWaterFlowDataSource', () => {
    let source: WaterFlowDataSource;
    let listener: RecordingListener;

    beforeEach(() => {
      source = new WaterFlowDataSource();
      listener = new RecordingListener();
      source.registerDataChangeListener(listener);
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_0100
     * @tc.name initialDataIncludesTheFirstAndLastItems
     * @tc.desc Initial Data Includes The First And Last Items.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('initialDataIncludesTheFirstAndLastItems', 0, () => {
      expectData(source, initialItems());
      expect(listener.events.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_0200
     * @tc.name prependNotifiesIndexZeroAndShiftsExistingItems
     * @tc.desc totalCount, getData: Prepend Notifies Index Zero And Shifts Existing Items.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('prependNotifiesIndexZeroAndShiftsExistingItems', 0, () => {
      source.Add1stItem();
      expect(source.totalCount()).assertEqual(101);
      expect(source.getData(0)).assertEqual(100);
      expect(source.getData(1)).assertEqual(0);
      expect(listener.added.length).assertEqual(1);
      expect(listener.added[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_0300
     * @tc.name appendNotifiesTheNewLastIndex
     * @tc.desc AddLastItem, totalCount, getData: Append Notifies The New Last Index.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('appendNotifiesTheNewLastIndex', 0, () => {
      source.AddLastItem();
      expect(source.totalCount()).assertEqual(101);
      expect(source.getData(100)).assertEqual(100);
      expect(source.getData(99)).assertEqual(99);
      expect(listener.added.length).assertEqual(1);
      expect(listener.added[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_0400
     * @tc.name insertPreservesItemsOnBothSides
     * @tc.desc AddItem, totalCount, getData: Insert Preserves Items On Both Sides.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('insertPreservesItemsOnBothSides', 0, () => {
      source.AddItem(50);
      expect(source.totalCount()).assertEqual(101);
      expect(source.getData(49)).assertEqual(49);
      expect(source.getData(50)).assertEqual(100);
      expect(source.getData(51)).assertEqual(50);
      expect(listener.added[0]).assertEqual(50);
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_0500
     * @tc.name removeFirstNotifiesOnlyTheDeletedIndex
     * @tc.desc totalCount, getData: Remove First Notifies Only The Deleted Index.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('removeFirstNotifiesOnlyTheDeletedIndex', 0, () => {
      source.Delete1stItem();
      expect(source.totalCount()).assertEqual(99);
      expect(source.getData(0)).assertEqual(1);
      expect(listener.deleted.length).assertEqual(1);
      expect(listener.deleted[0]).assertEqual(0);
      expect(listener.added.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_0600
     * @tc.name removeSecondKeepsTheFirstItem
     * @tc.desc totalCount, getData: Remove Second Keeps The First Item.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('removeSecondKeepsTheFirstItem', 0, () => {
      source.Delete2ndItem();
      expect(source.totalCount()).assertEqual(99);
      expect(source.getData(0)).assertEqual(0);
      expect(source.getData(1)).assertEqual(2);
      expect(listener.deleted[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_0700
     * @tc.name removeLastNotifiesTheFormerLastIndex
     * @tc.desc DeleteLastItem, totalCount, getData: Remove Last Notifies The Former Last Index.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('removeLastNotifiesTheFormerLastIndex', 0, () => {
      source.DeleteLastItem();
      expect(source.totalCount()).assertEqual(99);
      expect(source.getData(98)).assertEqual(98);
      expect(listener.deleted.length).assertEqual(1);
      expect(listener.deleted[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_0800
     * @tc.name reloadRemovesThreeItemsAndEmitsOneReload
     * @tc.desc Reload, totalCount, getData: Reload Removes Three Items And Emits One Reload.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('reloadRemovesThreeItemsAndEmitsOneReload', 0, () => {
      source.Reload();
      expect(source.totalCount()).assertEqual(97);
      expect(source.getData(1)).assertEqual(2);
      expect(source.getData(2)).assertEqual(3);
      expect(source.getData(3)).assertEqual(6);
      expect(listener.reloadCount).assertEqual(1);
      expect(listener.deleted.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_0900
     * @tc.name registeringTheSameListenerTwiceDoesNotDuplicateDelivery
     * @tc.desc registerDataChangeListener, notifyDataReload: Registering The Same Listener Twice Does Not Duplicate Delivery.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('registeringTheSameListenerTwiceDoesNotDuplicateDelivery', 0, () => {
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      expect(listener.reloadCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_1000
     * @tc.name removedListenerStopsReceivingUpdatesAndCanRejoin
     * @tc.desc unregisterDataChangeListener, AddLastItem, registerDataChangeListener: Removed Listener Stops Receiving Updates And Can Rejoin.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('removedListenerStopsReceivingUpdatesAndCanRejoin', 0, () => {
      source.unregisterDataChangeListener(listener);
      source.AddLastItem();
      expect(listener.added.length).assertEqual(0);
      source.registerDataChangeListener(listener);
      source.AddLastItem();
      expect(listener.added.length).assertEqual(1);
      expect(listener.added[0]).assertEqual(101);
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_1100
     * @tc.name unregisteringOneListenerKeepsTheOtherSubscribed
     * @tc.desc registerDataChangeListener, unregisterDataChangeListener, notifyDataChange: Unregistering One Listener Keeps The Other Subscribed.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('unregisteringOneListenerKeepsTheOtherSubscribed', 0, () => {
      const other: RecordingListener = new RecordingListener();
      source.registerDataChangeListener(other);
      source.unregisterDataChangeListener(listener);
      source.notifyDataChange(4);
      expect(listener.changed.length).assertEqual(0);
      expect(other.changed.length).assertEqual(1);
      expect(other.changed[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_1200
     * @tc.name moveNotificationPreservesFromToOrderWithoutChangingData
     * @tc.desc notifyDataMove, totalCount, getData: Move Notification Preserves From To Order Without Changing Data.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('moveNotificationPreservesFromToOrderWithoutChangingData', 0, () => {
      source.notifyDataMove(8, 2);
      expect(listener.moveFrom.length).assertEqual(1);
      expect(listener.moveTo.length).assertEqual(1);
      expect(listener.moveFrom[0]).assertEqual(8);
      expect(listener.moveTo[0]).assertEqual(2);
      expect(source.totalCount()).assertEqual(100);
      expect(source.getData(8)).assertEqual(8);
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_1300
     * @tc.name mutationsDoNotLeakAcrossDataSourceInstances
     * @tc.desc DeleteLastItem, getData: Mutations Do Not Leak Across Data Source Instances.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mutationsDoNotLeakAcrossDataSourceInstances', 0, () => {
      const other = new WaterFlowDataSource();
      source.Add1stItem();
      source.DeleteLastItem();
      expectData(other, initialItems());
      expect(source.getData(0)).assertEqual(100);
      expect(source.getData(99)).assertEqual(98);
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_1400
     * @tc.name insertAtZeroPreservesTheEntireOriginalSequence
     * @tc.desc AddItem: Insert At Zero Preserves The Entire Original Sequence.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('insertAtZeroPreservesTheEntireOriginalSequence', 0, () => {
      source.AddItem(0);
      expectData(source, [100].concat(initialItems()));
      expect(listener.events.join(',')).assertEqual('add:0');
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_1500
     * @tc.name insertAtCountAppendsWithoutLosingTheTail
     * @tc.desc AddItem: Insert At Count Appends Without Losing The Tail.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('insertAtCountAppendsWithoutLosingTheTail', 0, () => {
      source.AddItem(100);
      expectData(source, initialItems().concat([100]));
      expect(listener.events.join(',')).assertEqual('add:100');
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_1600
     * @tc.name insertBeforeLastItemPreservesBothBoundaryValues
     * @tc.desc AddItem: Insert Before Last Item Preserves Both Boundary Values.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('insertBeforeLastItemPreservesBothBoundaryValues', 0, () => {
      source.AddItem(99);
      const expected = initialItems();
      expected.splice(99, 0, 100);
      expectData(source, expected);
      expect(listener.events.join(',')).assertEqual('add:99');
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_1700
     * @tc.name consecutivePrependsUseTheUpdatedCount
     * @tc.desc Consecutive Prepends Use The Updated Count.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('consecutivePrependsUseTheUpdatedCount', 0, () => {
      source.Add1stItem();
      source.Add1stItem();
      expectData(source, [101, 100].concat(initialItems()));
      expect(listener.events.join(',')).assertEqual('add:0,add:0');
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_1800
     * @tc.name consecutiveAppendsAdvanceTheNotifiedIndex
     * @tc.desc AddLastItem: Consecutive Appends Advance The Notified Index.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('consecutiveAppendsAdvanceTheNotifiedIndex', 0, () => {
      source.AddLastItem();
      source.AddLastItem();
      expectData(source, initialItems().concat([100, 101]));
      expect(listener.events.join(',')).assertEqual('add:100,add:101');
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_1900
     * @tc.name prependThenDeleteFirstRestoresAllOriginalData
     * @tc.desc Prepend Then Delete First Restores All Original Data.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('prependThenDeleteFirstRestoresAllOriginalData', 0, () => {
      source.Add1stItem();
      source.Delete1stItem();
      expectData(source, initialItems());
      expect(listener.events.join(',')).assertEqual('add:0,delete:0');
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_2000
     * @tc.name appendThenDeleteLastRestoresAllOriginalData
     * @tc.desc AddLastItem, DeleteLastItem: Append Then Delete Last Restores All Original Data.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('appendThenDeleteLastRestoresAllOriginalData', 0, () => {
      source.AddLastItem();
      source.DeleteLastItem();
      expectData(source, initialItems());
      expect(listener.events.join(',')).assertEqual('add:100,delete:100');
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_2100
     * @tc.name insertSecondThenDeleteSecondRestoresAllOriginalData
     * @tc.desc AddItem: Insert Second Then Delete Second Restores All Original Data.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('insertSecondThenDeleteSecondRestoresAllOriginalData', 0, () => {
      source.AddItem(1);
      source.Delete2ndItem();
      expectData(source, initialItems());
      expect(listener.events.join(',')).assertEqual('add:1,delete:1');
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_2200
     * @tc.name deleteFirstCanDrainTheDataSourceExactly
     * @tc.desc getData, totalCount: Delete First Can Drain The Data Source Exactly.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('deleteFirstCanDrainTheDataSourceExactly', 0, () => {
      for (let index = 0; index < 100; index++) {
        expect(source.getData(0)).assertEqual(index);
        source.Delete1stItem();
        expect(source.totalCount()).assertEqual(99 - index);
        expect(listener.deleted[index]).assertEqual(0);
      }
      expect(listener.events.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_2300
     * @tc.name deleteLastCanDrainTheDataSourceExactly
     * @tc.desc getData, DeleteLastItem, totalCount: Delete Last Can Drain The Data Source Exactly.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('deleteLastCanDrainTheDataSourceExactly', 0, () => {
      for (let index = 99; index >= 0; index--) {
        expect(source.getData(index)).assertEqual(index);
        source.DeleteLastItem();
        expect(source.totalCount()).assertEqual(index);
        expect(listener.deleted[99 - index]).assertEqual(index);
      }
      expect(listener.events.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_2400
     * @tc.name deleteSecondRepeatedlyPreservesTheFirstItem
     * @tc.desc getData, totalCount: Delete Second Repeatedly Preserves The First Item.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('deleteSecondRepeatedlyPreservesTheFirstItem', 0, () => {
      for (let index = 1; index < 100; index++) {
        source.Delete2ndItem();
        expect(source.getData(0)).assertEqual(0);
        expect(source.totalCount()).assertEqual(100 - index);
        expect(listener.deleted[index - 1]).assertEqual(1);
      }
      expectData(source, [0]);
      expect(listener.events.length).assertEqual(99);
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_2500
     * @tc.name prependCanRepopulateAnEmptySource
     * @tc.desc DeleteLastItem: Prepend Can Repopulate An Empty Source.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('prependCanRepopulateAnEmptySource', 0, () => {
      for (let index = 0; index < 100; index++) {
        source.DeleteLastItem();
      }
      source.Add1stItem();
      expectData(source, [0]);
      expect(listener.added.join(',')).assertEqual('0');
      expect(listener.events.length).assertEqual(101);
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_2600
     * @tc.name appendCanRepopulateAnEmptySource
     * @tc.desc DeleteLastItem, AddLastItem: Append Can Repopulate An Empty Source.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('appendCanRepopulateAnEmptySource', 0, () => {
      for (let index = 0; index < 100; index++) {
        source.DeleteLastItem();
      }
      source.AddLastItem();
      expectData(source, [0]);
      expect(listener.added.join(',')).assertEqual('0');
      expect(listener.events.length).assertEqual(101);
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_2700
     * @tc.name insertAtZeroCanRepopulateAnEmptySource
     * @tc.desc DeleteLastItem, AddItem: Insert At Zero Can Repopulate An Empty Source.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('insertAtZeroCanRepopulateAnEmptySource', 0, () => {
      for (let index = 0; index < 100; index++) {
        source.DeleteLastItem();
      }
      source.AddItem(0);
      expectData(source, [0]);
      expect(listener.added.join(',')).assertEqual('0');
      expect(listener.events.length).assertEqual(101);
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_2800
     * @tc.name consecutiveReloadsRemoveTheCurrentIndexedItems
     * @tc.desc Reload: Consecutive Reloads Remove The Current Indexed Items.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('consecutiveReloadsRemoveTheCurrentIndexedItems', 0, () => {
      source.Reload();
      source.Reload();
      const expected: number[] = [0, 3, 6];
      for (let value = 9; value < 100; value++) {
        expected.push(value);
      }
      expectData(source, expected);
      expect(listener.events.join(',')).assertEqual('reload,reload');
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_2900
     * @tc.name mixedMutationsPreserveCallbackOrderAndAllRemainingItems
     * @tc.desc AddItem, AddLastItem, DeleteLastItem: Mixed Mutations Preserve Callback Order And All Remaining Items.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mixedMutationsPreserveCallbackOrderAndAllRemainingItems', 0, () => {
      source.Add1stItem();
      source.AddItem(2);
      source.Delete2ndItem();
      source.AddLastItem();
      source.DeleteLastItem();
      const expected: number[] = [100, 101];
      for (let value = 1; value < 100; value++) {
        expected.push(value);
      }
      expectData(source, expected);
      expect(listener.events.join(',')).assertEqual('add:0,add:2,delete:1,add:101,delete:101');
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_3000
     * @tc.name allNotificationKindsPreserveDataAndEventArguments
     * @tc.desc notifyDataAdd, notifyDataChange, notifyDataDelete, notifyDataMove, notifyDataReload: All Notification Kinds Preserve Data And Event Arguments.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('allNotificationKindsPreserveDataAndEventArguments', 0, () => {
      source.notifyDataAdd(0);
      source.notifyDataChange(99);
      source.notifyDataDelete(50);
      source.notifyDataMove(0, 99);
      source.notifyDataReload();
      expectData(source, initialItems());
      expect(listener.events.join(',')).assertEqual('add:0,change:99,delete:50,move:0:99,reload');
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_3100
     * @tc.name bothListenersReceiveTheSameOrderedNotifications
     * @tc.desc registerDataChangeListener, notifyDataMove, DeleteLastItem: Both Listeners Receive The Same Ordered Notifications.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('bothListenersReceiveTheSameOrderedNotifications', 0, () => {
      const other = new RecordingListener();
      source.registerDataChangeListener(other);
      source.Add1stItem();
      source.notifyDataMove(0, 1);
      source.DeleteLastItem();
      expect(listener.events.join(',')).assertEqual('add:0,move:0:1,delete:100');
      expect(other.events.join(',')).assertEqual('add:0,move:0:1,delete:100');
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_3200
     * @tc.name removingAnUnknownListenerDoesNotRemoveRegisteredListeners
     * @tc.desc unregisterDataChangeListener, AddLastItem, getData: Removing An Unknown Listener Does Not Remove Registered Listeners.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('removingAnUnknownListenerDoesNotRemoveRegisteredListeners', 0, () => {
      source.unregisterDataChangeListener(new RecordingListener());
      source.AddLastItem();
      expect(listener.events.join(',')).assertEqual('add:100');
      expect(source.getData(100)).assertEqual(100);
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_3300
     * @tc.name repeatedUnregistrationDoesNotRemoveAnotherListener
     * @tc.desc registerDataChangeListener, unregisterDataChangeListener, notifyDataReload: Repeated Unregistration Does Not Remove Another Listener.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('repeatedUnregistrationDoesNotRemoveAnotherListener', 0, () => {
      const other = new RecordingListener();
      source.registerDataChangeListener(other);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.notifyDataReload();
      expect(listener.events.length).assertEqual(0);
      expect(other.events.join(',')).assertEqual('reload');
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_3400
     * @tc.name unsubscribedSourceStillMutatesWithoutDeliveringEvents
     * @tc.desc unregisterDataChangeListener, AddLastItem, notifyDataChange, notifyDataMove, DeleteLastItem: Unsubscribed Source Still Mutates Without Delivering Events.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('unsubscribedSourceStillMutatesWithoutDeliveringEvents', 0, () => {
      source.unregisterDataChangeListener(listener);
      source.Add1stItem();
      source.AddLastItem();
      source.notifyDataChange(1);
      source.notifyDataMove(0, 1);
      source.DeleteLastItem();
      expectData(source, [100].concat(initialItems()));
      expect(listener.events.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_3500
     * @tc.name resubscribedListenerReceivesFutureEventsWithoutReplay
     * @tc.desc unregisterDataChangeListener, DeleteLastItem, registerDataChangeListener, AddLastItem, totalCount: Resubscribed Listener Receives Future Events Without Replay.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('resubscribedListenerReceivesFutureEventsWithoutReplay', 0, () => {
      source.Add1stItem();
      source.unregisterDataChangeListener(listener);
      source.DeleteLastItem();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.AddLastItem();
      expect(listener.events.join(',')).assertEqual('add:0,add:100');
      expect(source.totalCount()).assertEqual(101);
    });

    /**
     * @tc.number SUB_PERFORMANCE_WATERFLOWDATASOURCE_3600
     * @tc.name listenersAreIsolatedBetweenSourceInstances
     * @tc.desc registerDataChangeListener, notifyDataChange, AddLastItem, totalCount: Listeners Are Isolated Between Source Instances.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('listenersAreIsolatedBetweenSourceInstances', 0, () => {
      const other = new WaterFlowDataSource();
      const otherListener = new RecordingListener();
      other.registerDataChangeListener(otherListener);
      source.notifyDataChange(3);
      other.AddLastItem();
      expect(listener.events.join(',')).assertEqual('change:3');
      expect(otherListener.events.join(',')).assertEqual('add:100');
      expect(source.totalCount()).assertEqual(100);
      expect(other.totalCount()).assertEqual(101);
    });
  });
}
