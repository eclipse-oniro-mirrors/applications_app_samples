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
import { WaterFlowDataSource } from '@ohos/WaterFlow';

enum Edit {
  Prepend,
  Append,
  Insert,
  DeleteFirst,
  DeleteSecond,
  DeleteLast,
  Reload
}

class SequenceListener implements DataChangeListener {
  events: string[] = [];
  private source: WaterFlowDataSource;

  constructor(source: WaterFlowDataSource) {
    this.source = source;
  }

  onDataReloaded(): void {
    this.events.push(`reload:${this.source.totalCount()}`);
  }

  onDataAdd(index: number): void {
    this.events.push(`add:${index}:${this.source.totalCount()}:${this.source.getData(index)}`);
  }

  onDataDelete(index: number): void {
    this.events.push(`delete:${index}:${this.source.totalCount()}`);
  }

  onDataChange(index: number): void {
    this.events.push(`unexpected change:${index}`);
  }

  onDataMove(from: number, to: number): void {
    this.events.push(`unexpected move:${from}:${to}`);
  }

  onDataAdded(index: number): void { this.onDataAdd(index); }
  onDataDeleted(index: number): void { this.onDataDelete(index); }
  onDataChanged(index: number): void { this.onDataChange(index); }
  onDataMoved(from: number, to: number): void { this.onDataMove(from, to); }
  onDatasetChange(dataOperations: DataOperation[]): void {
    this.events.push(`unexpected dataset:${dataOperations.length}`);
  }
}

class ExpectedEdit {
  edit: Edit;
  removed: number[];
  index: number;
  event: string;

  constructor(edit: Edit, event: string, removed: number[] = [], index: number = 0) {
    this.edit = edit;
    this.event = event;
    this.removed = removed;
    this.index = index;
  }
}

function apply(source: WaterFlowDataSource, action: ExpectedEdit): void {
  switch (action.edit) {
    case Edit.Prepend:
      source.Add1stItem();
      break;
    case Edit.Append:
      source.AddLastItem();
      break;
    case Edit.Insert:
      source.AddItem(action.index);
      break;
    case Edit.DeleteFirst:
      source.Delete1stItem();
      break;
    case Edit.DeleteSecond:
      source.Delete2ndItem();
      break;
    case Edit.DeleteLast:
      source.DeleteLastItem();
      break;
    case Edit.Reload:
      source.Reload();
      break;
  }
}

// Build the expected dataset from declared removed positions and insertion position, not from notifier output.
function nextItems(items: number[], action: ExpectedEdit): number[] {
  const result: number[] = [];
  const inserts = action.edit === Edit.Prepend || action.edit === Edit.Append || action.edit === Edit.Insert;
  for (let index = 0; index <= items.length; index++) {
    if (inserts && index === action.index) {
      result.push(items.length);
    }
    if (index < items.length && action.removed.indexOf(index) < 0) {
      result.push(items[index]);
    }
  }
  return result;
}

function initialItems(): number[] {
  const items: number[] = [];
  for (let index = 0; index < 100; index++) {
    items.push(index);
  }
  return items;
}

function assertData(source: WaterFlowDataSource, items: number[], step: number): void {
  const count = source.totalCount();
  expect(count).assertEqual(items.length);
  for (let index = 0; index < count; index++) {
    const actual = source.getData(index);
    if (actual !== items[index]) {
      throw new Error(`Step ${step}, item ${index}: expected ${items[index]}, got ${actual}`);
    }
  }
}

function verifyEdits(actions: ExpectedEdit[], detachAfter: number = -1, reattachAfter: number = -1): void {
  const source = new WaterFlowDataSource();
  const observer = new SequenceListener(source);
  const secondary = new SequenceListener(source);
  source.registerDataChangeListener(observer);
  source.registerDataChangeListener(secondary);
  let items = initialItems();
  let secondaryActive = true;
  let secondaryCount = 0;

  for (let step = 0; step < actions.length; step++) {
    const action = actions[step];
    items = nextItems(items, action);
    apply(source, action);
    assertData(source, items, step);
    const primaryCount = observer.events.length;
    const primaryEvent = observer.events[step];
    expect(primaryCount).assertEqual(step + 1);
    expect(primaryEvent).assertEqual(action.event);

    if (secondaryActive) {
      const secondaryEvent = secondary.events[secondaryCount];
      expect(secondaryEvent).assertEqual(action.event);
      secondaryCount++;
    }
    const actualSecondaryCount = secondary.events.length;
    expect(actualSecondaryCount).assertEqual(secondaryCount);

    if (step === detachAfter) {
      source.unregisterDataChangeListener(secondary);
      secondaryActive = false;
    }
    if (step === reattachAfter) {
      source.registerDataChangeListener(secondary);
      secondaryActive = true;
    }
  }
}

// Keep the domain to valid indexes. The table describes the expected callback and positions
// removed from the pre-edit dataset; it does not call the stock array mutators used in the HAR.
function edgeEdits(count: number): ExpectedEdit[] {
  const added = count + 1;
  const removed = count - 1;
  const middle = Math.floor(count / 2);
  return [
    new ExpectedEdit(Edit.Prepend, `add:0:${added}:${count}`),
    new ExpectedEdit(Edit.Append, `add:${count}:${added}:${count}`, [], count),
    new ExpectedEdit(Edit.Insert, `add:${middle}:${added}:${count}`, [], middle),
    new ExpectedEdit(Edit.DeleteFirst, `delete:0:${removed}`, [0]),
    new ExpectedEdit(Edit.DeleteSecond, `delete:1:${removed}`, [1]),
    new ExpectedEdit(Edit.DeleteLast, `delete:${removed}:${removed}`, [removed]),
    new ExpectedEdit(Edit.Reload, `reload:${count - 3}`, [1, 4, 5])
  ];
}

function countChange(edit: Edit): number {
  if (edit === Edit.Reload) {
    return -3;
  }
  if (edit === Edit.DeleteFirst || edit === Edit.DeleteSecond || edit === Edit.DeleteLast) {
    return -1;
  }
  return 1;
}

function verifyEveryContinuation(start: ExpectedEdit): void {
  const afterStart = 100 + countChange(start.edit);
  for (const second of edgeEdits(afterStart)) {
    for (const third of edgeEdits(afterStart + countChange(second.edit))) {
      try {
        verifyEdits([start, second, third]);
      } catch (error) {
        throw new Error(`WaterFlow sequence ${start.edit}/${second.edit}/${third.edit}: ${String(error)}`);
      }
    }
  }
}

export default function waterFlowMutationSequenceTest(): void {
  describe('PerformanceWaterFlowMutationSequence', () => {
    // @tc.number SUB_PERFORMANCE_WATERFLOWSEQUENCE_0100
    // @tc.name waterFlowReloadAndBoundaryEditsReportAlreadyCommittedData
    // @tc.desc Verify Reload and subsequent boundary changes deliver indexes against committed data.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('waterFlowReloadAndBoundaryEditsReportAlreadyCommittedData', 0, () => {
      verifyEdits([
        new ExpectedEdit(Edit.Append, 'add:100:101:100', [], 100),
        new ExpectedEdit(Edit.Reload, 'reload:98', [1, 4, 5]),
        new ExpectedEdit(Edit.DeleteLast, 'delete:97:97', [97]),
        new ExpectedEdit(Edit.Prepend, 'add:0:98:97'),
        new ExpectedEdit(Edit.DeleteSecond, 'delete:1:97', [1]),
        new ExpectedEdit(Edit.Insert, 'add:48:98:97', [], 48)
      ]);
    });

    // @tc.number SUB_PERFORMANCE_WATERFLOWSEQUENCE_0200
    // @tc.name waterFlowMissedNotificationsAreNotReplayedAfterResubscription
    // @tc.desc Verify unregisterDataChangeListener suppresses edits until a fresh subscription is registered.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('waterFlowMissedNotificationsAreNotReplayedAfterResubscription', 0, () => {
      verifyEdits([
        new ExpectedEdit(Edit.DeleteFirst, 'delete:0:99', [0]),
        new ExpectedEdit(Edit.Insert, 'add:1:100:99', [], 1),
        new ExpectedEdit(Edit.Reload, 'reload:97', [1, 4, 5]),
        new ExpectedEdit(Edit.DeleteSecond, 'delete:1:96', [1]),
        new ExpectedEdit(Edit.Append, 'add:96:97:96', [], 96)
      ], 0, 2);
    });

    // @tc.number SUB_PERFORMANCE_WATERFLOWSEQUENCE_0300
    // @tc.name waterFlowTwentyItemPrefetchAppendsInOrderAfterHeadChange
    // @tc.desc Verify AddLastItem emits the twenty consecutive append events used by the WaterFlow viewport.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('waterFlowTwentyItemPrefetchAppendsInOrderAfterHeadChange', 0, () => {
      const actions: ExpectedEdit[] = [new ExpectedEdit(Edit.Prepend, 'add:0:101:100')];
      for (let index = 101; index < 121; index++) {
        actions.push(new ExpectedEdit(Edit.Append, `add:${index}:${index + 1}:${index}`, [], index));
      }
      actions.push(new ExpectedEdit(Edit.DeleteFirst, 'delete:0:120', [0]));
      verifyEdits(actions);
    });

    // @tc.number SUB_PERFORMANCE_WATERFLOWSEQUENCE_0400
    // @tc.name waterFlowTailInsertUsesTheSamePositionAsAppend
    // @tc.desc Verify AddItem at totalCount is equivalent to appending both in data and listener payload.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('waterFlowTailInsertUsesTheSamePositionAsAppend', 0, () => {
      const sourceA = new WaterFlowDataSource();
      const sourceB = new WaterFlowDataSource();
      const listenerA = new SequenceListener(sourceA);
      const listenerB = new SequenceListener(sourceB);
      sourceA.registerDataChangeListener(listenerA);
      sourceB.registerDataChangeListener(listenerB);
      sourceA.Reload();
      sourceB.Reload();
      sourceA.AddItem(sourceA.totalCount());
      sourceB.AddLastItem();
      const count = sourceA.totalCount();
      const otherCount = sourceB.totalCount();
      expect(count).assertEqual(98);
      expect(otherCount).assertEqual(98);
      const eventsA = listenerA.events.join(',');
      const eventsB = listenerB.events.join(',');
      expect(eventsA).assertEqual('reload:97,add:97:98:97');
      expect(eventsB).assertEqual(eventsA);
      for (let index = 0; index < count; index++) {
        const a = sourceA.getData(index);
        const b = sourceB.getData(index);
        expect(a).assertEqual(b);
      }
    });

    // @tc.number SUB_PERFORMANCE_WATERFLOWSEQUENCE_0500
    // @tc.name waterFlowPrependComposesWithEveryOrderedEditPair
    // @tc.desc Verify Add1stItem and all ordered pairs of subsequent valid edits retain full order and event payloads.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('waterFlowPrependComposesWithEveryOrderedEditPair', 0, () => {
      verifyEveryContinuation(new ExpectedEdit(Edit.Prepend, 'add:0:101:100'));
    });

    // @tc.number SUB_PERFORMANCE_WATERFLOWSEQUENCE_0600
    // @tc.name waterFlowAppendComposesWithEveryOrderedEditPair
    // @tc.desc Verify AddLastItem and all ordered pairs of subsequent valid edits retain full order and event payloads.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('waterFlowAppendComposesWithEveryOrderedEditPair', 0, () => {
      verifyEveryContinuation(new ExpectedEdit(Edit.Append, 'add:100:101:100', [], 100));
    });

    // @tc.number SUB_PERFORMANCE_WATERFLOWSEQUENCE_0700
    // @tc.name waterFlowInsertComposesWithEveryOrderedEditPair
    // @tc.desc Verify AddItem and all ordered pairs of subsequent valid edits retain full order and event payloads.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('waterFlowInsertComposesWithEveryOrderedEditPair', 0, () => {
      verifyEveryContinuation(new ExpectedEdit(Edit.Insert, 'add:50:101:100', [], 50));
    });

    // @tc.number SUB_PERFORMANCE_WATERFLOWSEQUENCE_0800
    // @tc.name waterFlowDeleteFirstComposesWithEveryOrderedEditPair
    // @tc.desc Verify Delete1stItem and all ordered pairs of subsequent valid edits use current indexes.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('waterFlowDeleteFirstComposesWithEveryOrderedEditPair', 0, () => {
      verifyEveryContinuation(new ExpectedEdit(Edit.DeleteFirst, 'delete:0:99', [0]));
    });

    // @tc.number SUB_PERFORMANCE_WATERFLOWSEQUENCE_0900
    // @tc.name waterFlowDeleteSecondComposesWithEveryOrderedEditPair
    // @tc.desc Verify Delete2ndItem and all ordered pairs of subsequent valid edits use current indexes.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('waterFlowDeleteSecondComposesWithEveryOrderedEditPair', 0, () => {
      verifyEveryContinuation(new ExpectedEdit(Edit.DeleteSecond, 'delete:1:99', [1]));
    });

    // @tc.number SUB_PERFORMANCE_WATERFLOWSEQUENCE_1000
    // @tc.name waterFlowDeleteLastComposesWithEveryOrderedEditPair
    // @tc.desc Verify DeleteLast and all ordered pairs of subsequent valid edits use current indexes.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('waterFlowDeleteLastComposesWithEveryOrderedEditPair', 0, () => {
      verifyEveryContinuation(new ExpectedEdit(Edit.DeleteLast, 'delete:99:99', [99]));
    });

    // @tc.number SUB_PERFORMANCE_WATERFLOWSEQUENCE_1100
    // @tc.name waterFlowReloadComposesWithEveryOrderedEditPair
    // @tc.desc Verify Reload and all ordered pairs of subsequent valid edits operate on the reloaded dataset.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('waterFlowReloadComposesWithEveryOrderedEditPair', 0, () => {
      verifyEveryContinuation(new ExpectedEdit(Edit.Reload, 'reload:97', [1, 4, 5]));
    });
  });
}
