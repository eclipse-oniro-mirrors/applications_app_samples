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
class StringSource extends BasicDataSource<string> {
  public rows: Array<string> = [];
  totalCount(): number {
    return this.rows.length;
  }
  getData(index: number): string {
    return this.rows[index];
  }
}
class TraceListener implements DataChangeListener {
  public label: string;
  public trace: Array<string>;
  constructor(label: string, trace: Array<string>) {
    this.label = label;
    this.trace = trace;
  }
  private stamp(kind: string, index: number, toIndex: number): void {
    this.trace.push(this.label + ':' + kind + ':' + index + ':' + toIndex);
  }
  onDataReloaded(): void {
    this.stamp('reload', -1, -1);
  }
  onDataAdd(index: number): void {
    this.stamp('add', index, -1);
  }
  onDataMove(from: number, to: number): void {
    this.stamp('move', from, to);
  }
  onDataDelete(index: number): void {
    this.stamp('delete', index, -1);
  }
  onDataChange(index: number): void {
    this.stamp('change', index, -1);
  }
  onDatasetChange(dataOperations: DataOperation[]): void {
    this.stamp('dataset', dataOperations.length, -1);
  }
  onDataAdded(index: number): void {
    this.stamp('deprecatedAdded', index, -1);
  }
  onDataMoved(from: number, to: number): void {
    this.stamp('deprecatedMoved', from, to);
  }
  onDataDeleted(index: number): void {
    this.stamp('deprecatedDeleted', index, -1);
  }
  onDataChanged(index: number): void {
    this.stamp('deprecatedChanged', index, -1);
  }
}
export default function dataSourceNotificationTest() {
  describe('DataSourceNotificationTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_0100
     * @tc.name ReloadKindIsReload001
     * @tc.desc Verify reload kind is reload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ReloadKindIsReload_001', 0, (): void => {
      Logger.info(TAG, 'ReloadKindIsReload_001 begin');
      const source: StringSource = new StringSource();
      source.rows = ['alpha', 'beta'];
      const listener: RecordingListener = new RecordingListener('observer');
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      const delivered: number = listener.eventCount();
      Logger.info(TAG, 'delivered=' + delivered);
      expect(delivered).assertEqual(1);
      expect(listener.kindAt(0)).assertEqual('reload');
      expect(listener.indexAt(0)).assertEqual(-1);
      expect(listener.toIndexAt(0)).assertEqual(-1);
      expect(listener.kindSequence()).assertEqual('reload');
      Logger.info(TAG, 'ReloadKindIsReload_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_0200
     * @tc.name ReloadSequenceIsExclusive002
     * @tc.desc Verify reload sequence is exclusive
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ReloadSequenceIsExclusive_002', 0, (): void => {
      Logger.info(TAG, 'ReloadSequenceIsExclusive_002 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('observer');
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      const sequence: string = listener.kindSequence();
      Logger.info(TAG, 'sequence=' + sequence);
      const onlyReload: boolean = sequence === 'reload';
      const hasDataset: boolean = sequence.indexOf('dataset') !== -1;
      Logger.info(TAG, 'onlyReload=' + JSON.stringify(onlyReload));
      Logger.info(TAG, 'hasDataset=' + JSON.stringify(hasDataset));
      expect(onlyReload).assertTrue();
      expect(hasDataset).assertFalse();
      expect(listener.operandCountAt(0)).assertEqual(0);
      Logger.info(TAG, 'ReloadSequenceIsExclusive_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_0300
     * @tc.name NotificationIndependentOfRowCount003
     * @tc.desc Verify notification independent of row count
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NotificationIndependentOfRowCount_003', 0, (): void => {
      Logger.info(TAG, 'NotificationIndependentOfRowCount_003 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('observer');
      source.registerDataChangeListener(listener);
      expect(source.totalCount()).assertEqual(0);
      source.notifyDataAdd(0);
      const delivered: number = listener.eventCount();
      Logger.info(TAG, 'delivered=' + delivered);
      expect(delivered).assertEqual(1);
      expect(listener.kindAt(0)).assertEqual('add');
      expect(listener.indexAt(0)).assertEqual(0);
      Logger.info(TAG, 'NotificationIndependentOfRowCount_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_0400
     * @tc.name AddCarriesExactIndex004
     * @tc.desc Verify add carries exact index
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AddCarriesExactIndex_004', 0, (): void => {
      Logger.info(TAG, 'AddCarriesExactIndex_004 begin');
      const source: StringSource = new StringSource();
      source.rows = ['alpha', 'beta'];
      const listener: RecordingListener = new RecordingListener('observer');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(4);
      expect(listener.kindAt(0)).assertEqual('add');
      const carried: number = listener.indexAt(0);
      Logger.info(TAG, 'carried=' + carried);
      expect(carried).assertEqual(4);
      expect(listener.eventCount()).assertEqual(1);
      expect(listener.kindSequence()).assertEqual('add');
      Logger.info(TAG, 'AddCarriesExactIndex_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_0500
     * @tc.name AddAtZeroIndex005
     * @tc.desc Verify add at zero index
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AddAtZeroIndex_005', 0, (): void => {
      Logger.info(TAG, 'AddAtZeroIndex_005 begin');
      const source: StringSource = new StringSource();
      source.rows = ['alpha'];
      const listener: RecordingListener = new RecordingListener('observer');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      const carried: number = listener.indexAt(0);
      Logger.info(TAG, 'carried=' + carried);
      expect(carried).assertEqual(0);
      expect(listener.kindAt(0)).assertEqual('add');
      expect(listener.toIndexAt(0)).assertEqual(-1);
      Logger.info(TAG, 'AddAtZeroIndex_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_0600
     * @tc.name AddAtLargeIndex006
     * @tc.desc Verify add at large index
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AddAtLargeIndex_006', 0, (): void => {
      Logger.info(TAG, 'AddAtLargeIndex_006 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('observer');
      source.registerDataChangeListener(listener);
      const largeIndex: number = 1000000;
      source.notifyDataAdd(largeIndex);
      const carried: number = listener.indexAt(0);
      Logger.info(TAG, 'carried=' + carried);
      expect(carried).assertEqual(largeIndex);
      expect(listener.kindAt(0)).assertEqual('add');
      expect(listener.eventCount()).assertEqual(1);
      Logger.info(TAG, 'AddAtLargeIndex_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_0700
     * @tc.name AddNegativeIndexPassthrough007
     * @tc.desc Verify add negative index passthrough
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AddNegativeIndexPassthrough_007', 0, (): void => {
      Logger.info(TAG, 'AddNegativeIndexPassthrough_007 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('observer');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(-5);
      const carried: number = listener.indexAt(0);
      Logger.info(TAG, 'carried=' + carried);
      expect(carried).assertEqual(-5);
      expect(listener.kindAt(0)).assertEqual('add');
      expect(listener.toIndexAt(0)).assertEqual(-1);
      Logger.info(TAG, 'AddNegativeIndexPassthrough_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_0800
     * @tc.name AddEmitsSingleCallback008
     * @tc.desc Verify add emits single callback
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AddEmitsSingleCallback_008', 0, (): void => {
      Logger.info(TAG, 'AddEmitsSingleCallback_008 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('observer');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(2);
      const delivered: number = listener.eventCount();
      Logger.info(TAG, 'delivered=' + delivered);
      expect(delivered).assertEqual(1);
      expect(listener.kindSequence()).assertEqual('add');
      expect(listener.kindAt(1)).assertEqual('');
      Logger.info(TAG, 'AddEmitsSingleCallback_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_0900
     * @tc.name ChangeCarriesExactIndex009
     * @tc.desc Verify change carries exact index
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ChangeCarriesExactIndex_009', 0, (): void => {
      Logger.info(TAG, 'ChangeCarriesExactIndex_009 begin');
      const source: StringSource = new StringSource();
      source.rows = ['alpha', 'beta', 'gamma'];
      const listener: RecordingListener = new RecordingListener('observer');
      source.registerDataChangeListener(listener);
      source.notifyDataChange(6);
      const carried: number = listener.indexAt(0);
      Logger.info(TAG, 'carried=' + carried);
      expect(carried).assertEqual(6);
      expect(listener.kindAt(0)).assertEqual('change');
      expect(listener.kindSequence()).assertEqual('change');
      expect(listener.eventCount()).assertEqual(1);
      Logger.info(TAG, 'ChangeCarriesExactIndex_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_1000
     * @tc.name ChangeAtZeroIndex010
     * @tc.desc Verify change at zero index
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ChangeAtZeroIndex_010', 0, (): void => {
      Logger.info(TAG, 'ChangeAtZeroIndex_010 begin');
      const source: StringSource = new StringSource();
      source.rows = ['alpha'];
      const listener: RecordingListener = new RecordingListener('observer');
      source.registerDataChangeListener(listener);
      source.notifyDataChange(0);
      const carried: number = listener.indexAt(0);
      Logger.info(TAG, 'carried=' + carried);
      expect(carried).assertEqual(0);
      expect(listener.kindAt(0)).assertEqual('change');
      expect(listener.toIndexAt(0)).assertEqual(-1);
      Logger.info(TAG, 'ChangeAtZeroIndex_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_1100
     * @tc.name ChangeNegativeIndexPassthrough011
     * @tc.desc Verify change negative index passthrough
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ChangeNegativeIndexPassthrough_011', 0, (): void => {
      Logger.info(TAG, 'ChangeNegativeIndexPassthrough_011 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('observer');
      source.registerDataChangeListener(listener);
      source.notifyDataChange(-3);
      const carried: number = listener.indexAt(0);
      Logger.info(TAG, 'carried=' + carried);
      expect(carried).assertEqual(-3);
      expect(listener.kindAt(0)).assertEqual('change');
      expect(listener.eventCount()).assertEqual(1);
      Logger.info(TAG, 'ChangeNegativeIndexPassthrough_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_1200
     * @tc.name DeleteCarriesExactIndex012
     * @tc.desc Verify delete carries exact index
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DeleteCarriesExactIndex_012', 0, (): void => {
      Logger.info(TAG, 'DeleteCarriesExactIndex_012 begin');
      const source: StringSource = new StringSource();
      source.rows = ['alpha', 'beta', 'gamma'];
      const listener: RecordingListener = new RecordingListener('observer');
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(2);
      const carried: number = listener.indexAt(0);
      Logger.info(TAG, 'carried=' + carried);
      expect(carried).assertEqual(2);
      expect(listener.kindAt(0)).assertEqual('delete');
      expect(listener.kindSequence()).assertEqual('delete');
      expect(listener.eventCount()).assertEqual(1);
      Logger.info(TAG, 'DeleteCarriesExactIndex_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_1300
     * @tc.name DeleteAtLargeIndex013
     * @tc.desc Verify delete at large index
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DeleteAtLargeIndex_013', 0, (): void => {
      Logger.info(TAG, 'DeleteAtLargeIndex_013 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('observer');
      source.registerDataChangeListener(listener);
      const largeIndex: number = 123456;
      source.notifyDataDelete(largeIndex);
      const carried: number = listener.indexAt(0);
      Logger.info(TAG, 'carried=' + carried);
      expect(carried).assertEqual(largeIndex);
      expect(listener.kindAt(0)).assertEqual('delete');
      expect(listener.toIndexAt(0)).assertEqual(-1);
      Logger.info(TAG, 'DeleteAtLargeIndex_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_1400
     * @tc.name MoveCarriesFromAndTo014
     * @tc.desc Verify move carries from and to
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MoveCarriesFromAndTo_014', 0, (): void => {
      Logger.info(TAG, 'MoveCarriesFromAndTo_014 begin');
      const source: StringSource = new StringSource();
      source.rows = ['alpha', 'beta', 'gamma'];
      const listener: RecordingListener = new RecordingListener('observer');
      source.registerDataChangeListener(listener);
      source.notifyDataMove(2, 5);
      expect(listener.kindAt(0)).assertEqual('move');
      expect(listener.indexAt(0)).assertEqual(2);
      const destination: number = listener.toIndexAt(0);
      Logger.info(TAG, 'destination=' + destination);
      expect(destination).assertEqual(5);
      expect(listener.eventCount()).assertEqual(1);
      Logger.info(TAG, 'MoveCarriesFromAndTo_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_1500
     * @tc.name MoveBackwardCarriesBothEnds015
     * @tc.desc Verify move backward carries both ends
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MoveBackwardCarriesBothEnds_015', 0, (): void => {
      Logger.info(TAG, 'MoveBackwardCarriesBothEnds_015 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('observer');
      source.registerDataChangeListener(listener);
      source.notifyDataMove(7, 1);
      const origin: number = listener.indexAt(0);
      const destination: number = listener.toIndexAt(0);
      Logger.info(TAG, 'origin=' + origin + ', destination=' + destination);
      expect(origin).assertEqual(7);
      expect(destination).assertEqual(1);
      expect(listener.kindAt(0)).assertEqual('move');
      Logger.info(TAG, 'MoveBackwardCarriesBothEnds_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_1600
     * @tc.name MoveSameIndexPassthrough016
     * @tc.desc Verify move same index passthrough
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MoveSameIndexPassthrough_016', 0, (): void => {
      Logger.info(TAG, 'MoveSameIndexPassthrough_016 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('observer');
      source.registerDataChangeListener(listener);
      source.notifyDataMove(3, 3);
      const origin: number = listener.indexAt(0);
      const destination: number = listener.toIndexAt(0);
      Logger.info(TAG, 'origin=' + origin + ', destination=' + destination);
      expect(origin).assertEqual(3);
      expect(destination).assertEqual(3);
      expect(listener.eventCount()).assertEqual(1);
      Logger.info(TAG, 'MoveSameIndexPassthrough_016 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_1700
     * @tc.name MoveNegativeFromPassthrough017
     * @tc.desc Verify move negative from passthrough
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MoveNegativeFromPassthrough_017', 0, (): void => {
      Logger.info(TAG, 'MoveNegativeFromPassthrough_017 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('observer');
      source.registerDataChangeListener(listener);
      source.notifyDataMove(-2, 4);
      const origin: number = listener.indexAt(0);
      const destination: number = listener.toIndexAt(0);
      Logger.info(TAG, 'origin=' + origin + ', destination=' + destination);
      expect(origin).assertEqual(-2);
      expect(destination).assertEqual(4);
      expect(listener.kindAt(0)).assertEqual('move');
      Logger.info(TAG, 'MoveNegativeFromPassthrough_017 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_1800
     * @tc.name AddReachesAllListeners018
     * @tc.desc Verify add reaches all listeners
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AddReachesAllListeners_018', 0, (): void => {
      Logger.info(TAG, 'AddReachesAllListeners_018 begin');
      const source: StringSource = new StringSource();
      let listeners: Array<RecordingListener> = [];
      for (let index: number = 0; index < 3; index++) {
        const listener: RecordingListener = new RecordingListener('watcher_' + index);
        listeners.push(listener);
        source.registerDataChangeListener(listener);
      }
      source.notifyDataAdd(8);
      let wrongIndex: number = 0;
      for (let index: number = 0; index < listeners.length; index++) {
        if (listeners[index].indexAt(0) !== 8) {
          wrongIndex += 1;
        }
      }
      Logger.info(TAG, 'wrongIndex=' + wrongIndex);
      expect(wrongIndex).assertEqual(0);
      expect(listeners[0].eventCount()).assertEqual(1);
      expect(listeners[1].kindAt(0)).assertEqual('add');
      expect(listeners[2].indexAt(0)).assertEqual(8);
      Logger.info(TAG, 'AddReachesAllListeners_018 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_1900
     * @tc.name ReloadReachesAllListeners019
     * @tc.desc Verify reload reaches all listeners
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ReloadReachesAllListeners_019', 0, (): void => {
      Logger.info(TAG, 'ReloadReachesAllListeners_019 begin');
      const source: StringSource = new StringSource();
      source.rows = ['alpha', 'beta'];
      const first: RecordingListener = new RecordingListener('first');
      const second: RecordingListener = new RecordingListener('second');
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataReload();
      expect(first.eventCount()).assertEqual(1);
      expect(second.eventCount()).assertEqual(1);
      expect(first.kindAt(0)).assertEqual('reload');
      expect(second.kindAt(0)).assertEqual('reload');
      const sameKind: boolean = first.kindSequence() === second.kindSequence();
      Logger.info(TAG, 'sameKind=' + JSON.stringify(sameKind));
      expect(sameKind).assertTrue();
      Logger.info(TAG, 'ReloadReachesAllListeners_019 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_2000
     * @tc.name OrderAcrossListenersOnMove020
     * @tc.desc Verify order across listeners on move
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'OrderAcrossListenersOnMove_020', 0, (): void => {
      Logger.info(TAG, 'OrderAcrossListenersOnMove_020 begin');
      const source: StringSource = new StringSource();
      const trace: Array<string> = [];
      const first: TraceListener = new TraceListener('first', trace);
      const second: TraceListener = new TraceListener('second', trace);
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataMove(4, 1);
      const line: string = trace.join('|');
      Logger.info(TAG, 'trace=' + line);
      expect(line).assertEqual('first:move:4:1|second:move:4:1');
      expect(trace[0]).assertContain('first:move:4:1');
      expect(trace.length).assertEqual(2);
      Logger.info(TAG, 'OrderAcrossListenersOnMove_020 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_2100
     * @tc.name RepeatedAddsAccumulateInOrder021
     * @tc.desc Verify repeated adds accumulate in order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RepeatedAddsAccumulateInOrder_021', 0, (): void => {
      Logger.info(TAG, 'RepeatedAddsAccumulateInOrder_021 begin');
      const source: StringSource = new StringSource();
      source.rows = ['alpha'];
      const listener: RecordingListener = new RecordingListener('observer');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(1);
      source.notifyDataAdd(2);
      source.notifyDataAdd(3);
      const sequence: string = listener.kindSequence();
      Logger.info(TAG, 'sequence=' + sequence);
      expect(sequence).assertEqual('add|add|add');
      expect(listener.eventCount()).assertEqual(3);
      expect(listener.indexAt(0)).assertEqual(1);
      expect(listener.indexAt(1)).assertEqual(2);
      expect(listener.indexAt(2)).assertEqual(3);
      Logger.info(TAG, 'RepeatedAddsAccumulateInOrder_021 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_2200
     * @tc.name FiveNotificationsProduceExactSequence022
     * @tc.desc Verify five notifications produce exact sequence
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FiveNotificationsProduceExactSequence_022', 0, (): void => {
      Logger.info(TAG, 'FiveNotificationsProduceExactSequence_022 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('observer');
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.notifyDataAdd(2);
      source.notifyDataChange(3);
      source.notifyDataDelete(4);
      source.notifyDataMove(5, 6);
      const sequence: string = listener.kindSequence();
      Logger.info(TAG, 'sequence=' + sequence);
      expect(sequence).assertEqual('reload|add|change|delete|move');
      expect(listener.eventCount()).assertEqual(5);
      expect(listener.indexAt(4)).assertEqual(5);
      expect(listener.toIndexAt(4)).assertEqual(6);
      Logger.info(TAG, 'FiveNotificationsProduceExactSequence_022 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_2300
     * @tc.name SecondNotificationKeepsFirstPayload023
     * @tc.desc Verify second notification keeps first payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SecondNotificationKeepsFirstPayload_023', 0, (): void => {
      Logger.info(TAG, 'SecondNotificationKeepsFirstPayload_023 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('observer');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(3);
      source.notifyDataAdd(7);
      const firstIndex: number = listener.indexAt(0);
      const secondIndex: number = listener.indexAt(1);
      Logger.info(TAG, 'firstIndex=' + firstIndex + ', secondIndex=' + secondIndex);
      expect(firstIndex).assertEqual(3);
      expect(secondIndex).assertEqual(7);
      expect(listener.eventCount()).assertEqual(2);
      Logger.info(TAG, 'SecondNotificationKeepsFirstPayload_023 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_2400
     * @tc.name ReloadPayloadHasNoIndex024
     * @tc.desc Verify reload payload has no index
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ReloadPayloadHasNoIndex_024', 0, (): void => {
      Logger.info(TAG, 'ReloadPayloadHasNoIndex_024 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('observer');
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      expect(listener.indexAt(0)).assertEqual(-1);
      expect(listener.toIndexAt(0)).assertEqual(-1);
      expect(listener.operandCountAt(0)).assertEqual(0);
      expect(listener.kindAt(0)).assertEqual('reload');
      Logger.info(TAG, 'ReloadPayloadHasNoIndex_024 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_2500
     * @tc.name AddPayloadHasNoToIndex025
     * @tc.desc Verify add payload has no to index
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AddPayloadHasNoToIndex_025', 0, (): void => {
      Logger.info(TAG, 'AddPayloadHasNoToIndex_025 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('observer');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(9);
      expect(listener.toIndexAt(0)).assertEqual(-1);
      expect(listener.indexAt(0)).assertEqual(9);
      expect(listener.kindAt(0)).assertEqual('add');
      Logger.info(TAG, 'AddPayloadHasNoToIndex_025 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_2600
     * @tc.name EmptyRegistryNoThrow026
     * @tc.desc Verify empty registry no throw
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyRegistryNoThrow_026', 0, (): void => {
      Logger.info(TAG, 'EmptyRegistryNoThrow_026 begin');
      const source: StringSource = new StringSource();
      let threw: boolean = false;
      try {
        source.notifyDataReload();
        source.notifyDataAdd(0);
        source.notifyDataChange(0);
        source.notifyDataDelete(0);
        source.notifyDataMove(0, 1);
      }
      catch (error) {
        threw = true;
      }
      const raised: boolean = threw;
      Logger.info(TAG, 'raised=' + JSON.stringify(raised));
      expect(raised).assertFalse();
      const listener: RecordingListener = new RecordingListener('later');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      expect(listener.eventCount()).assertEqual(1);
      Logger.info(TAG, 'EmptyRegistryNoThrow_026 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_2700
     * @tc.name DeprecatedCallbacksNeverInvoked027
     * @tc.desc Verify deprecated callbacks never invoked
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DeprecatedCallbacksNeverInvoked_027', 0, (): void => {
      Logger.info(TAG, 'DeprecatedCallbacksNeverInvoked_027 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('observer');
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.notifyDataAdd(1);
      source.notifyDataChange(2);
      source.notifyDataDelete(3);
      source.notifyDataMove(4, 5);
      const sequence: string = listener.kindSequence();
      Logger.info(TAG, 'sequence=' + sequence);
      const hasDeprecated: boolean = sequence.indexOf('deprecated') !== -1;
      Logger.info(TAG, 'hasDeprecated=' + JSON.stringify(hasDeprecated));
      expect(hasDeprecated).assertFalse();
      expect(listener.eventCount()).assertEqual(5);
      expect(sequence).assertContain('reload');
      Logger.info(TAG, 'DeprecatedCallbacksNeverInvoked_027 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_2800
     * @tc.name DatasetCallbackNeverInvoked028
     * @tc.desc Verify dataset callback never invoked
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DatasetCallbackNeverInvoked_028', 0, (): void => {
      Logger.info(TAG, 'DatasetCallbackNeverInvoked_028 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('observer');
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.notifyDataAdd(1);
      source.notifyDataChange(2);
      source.notifyDataDelete(3);
      source.notifyDataMove(4, 5);
      const sequence: string = listener.kindSequence();
      const hasDataset: boolean = sequence.indexOf('dataset') !== -1;
      Logger.info(TAG, 'hasDataset=' + JSON.stringify(hasDataset));
      expect(hasDataset).assertFalse();
      expect(sequence).assertEqual('reload|add|change|delete|move');
      expect(listener.eventCount()).assertEqual(5);
      Logger.info(TAG, 'DatasetCallbackNeverInvoked_028 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_2900
     * @tc.name NotifyKeepsRegistryIntact029
     * @tc.desc Verify notify keeps registry intact
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NotifyKeepsRegistryIntact_029', 0, (): void => {
      Logger.info(TAG, 'NotifyKeepsRegistryIntact_029 begin');
      const source: StringSource = new StringSource();
      const first: RecordingListener = new RecordingListener('first');
      const second: RecordingListener = new RecordingListener('second');
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataAdd(0);
      expect(first.eventCount()).assertEqual(1);
      expect(second.eventCount()).assertEqual(1);
      source.unregisterDataChangeListener(first);
      source.notifyDataAdd(1);
      const remaining: number = second.eventCount();
      Logger.info(TAG, 'remaining=' + remaining);
      expect(remaining).assertEqual(2);
      expect(second.kindSequence()).assertEqual('add|add');
      Logger.info(TAG, 'NotifyKeepsRegistryIntact_029 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_3000
     * @tc.name EachListenerGetsOneCallbackPerNotify030
     * @tc.desc Verify each listener gets one callback per notify
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EachListenerGetsOneCallbackPerNotify_030', 0, (): void => {
      Logger.info(TAG, 'EachListenerGetsOneCallbackPerNotify_030 begin');
      const source: StringSource = new StringSource();
      let listeners: Array<RecordingListener> = [];
      for (let index: number = 0; index < 3; index++) {
        const listener: RecordingListener = new RecordingListener('peer_' + index);
        listeners.push(listener);
        source.registerDataChangeListener(listener);
      }
      source.notifyDataReload();
      source.notifyDataAdd(1);
      source.notifyDataChange(2);
      source.notifyDataDelete(3);
      source.notifyDataMove(4, 5);
      expect(listeners[0].eventCount()).assertEqual(5);
      expect(listeners[1].eventCount()).assertEqual(5);
      expect(listeners[2].eventCount()).assertEqual(5);
      const sameSequence: boolean = listeners[0].kindSequence() === listeners[2].kindSequence();
      Logger.info(TAG, 'sameSequence=' + JSON.stringify(sameSequence));
      expect(sameSequence).assertTrue();
      Logger.info(TAG, 'EachListenerGetsOneCallbackPerNotify_030 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_3100
     * @tc.name ReloadKeepsEarlierRecords031
     * @tc.desc Verify reload keeps earlier records
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ReloadKeepsEarlierRecords_031', 0, (): void => {
      Logger.info(TAG, 'ReloadKeepsEarlierRecords_031 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('observer');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(1);
      source.notifyDataReload();
      const sequence: string = listener.kindSequence();
      Logger.info(TAG, 'sequence=' + sequence);
      expect(sequence).assertEqual('add|reload');
      expect(listener.eventCount()).assertEqual(2);
      expect(listener.kindAt(0)).assertEqual('add');
      expect(listener.indexAt(0)).assertEqual(1);
      Logger.info(TAG, 'ReloadKeepsEarlierRecords_031 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_3200
     * @tc.name NotifyDoesNotTouchRows032
     * @tc.desc Verify notify does not touch rows
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NotifyDoesNotTouchRows_032', 0, (): void => {
      Logger.info(TAG, 'NotifyDoesNotTouchRows_032 begin');
      const source: StringSource = new StringSource();
      source.rows = ['alpha', 'beta', 'gamma'];
      const listener: RecordingListener = new RecordingListener('observer');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(3);
      const rowCount: number = source.totalCount();
      Logger.info(TAG, 'rowCount=' + rowCount);
      expect(rowCount).assertEqual(3);
      expect(source.rows.length).assertEqual(3);
      expect(source.getData(2)).assertEqual('gamma');
      expect(listener.eventCount()).assertEqual(1);
      Logger.info(TAG, 'NotifyDoesNotTouchRows_032 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_3300
     * @tc.name NoListenersAfterRemovalNoThrow033
     * @tc.desc Verify no listeners after removal no throw
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NoListenersAfterRemovalNoThrow_033', 0, (): void => {
      Logger.info(TAG, 'NoListenersAfterRemovalNoThrow_033 begin');
      const source: StringSource = new StringSource();
      source.rows = ['alpha'];
      const listener: RecordingListener = new RecordingListener('departing');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      source.unregisterDataChangeListener(listener);
      let threw: boolean = false;
      try {
        source.notifyDataReload();
        source.notifyDataAdd(1);
        source.notifyDataChange(1);
        source.notifyDataDelete(1);
        source.notifyDataMove(0, 1);
      }
      catch (error) {
        threw = true;
      }
      const raised: boolean = threw;
      Logger.info(TAG, 'raised=' + JSON.stringify(raised));
      expect(raised).assertFalse();
      const afterRemoval: number = listener.eventCount();
      Logger.info(TAG, 'afterRemoval=' + afterRemoval);
      expect(afterRemoval).assertEqual(1);
      expect(listener.kindSequence()).assertEqual('add');
      Logger.info(TAG, 'NoListenersAfterRemovalNoThrow_033 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_3400
     * @tc.name CrossKindPayloadStaysIndependent034
     * @tc.desc Verify cross kind payload stays independent
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'CrossKindPayloadStaysIndependent_034', 0, (): void => {
      Logger.info(TAG, 'CrossKindPayloadStaysIndependent_034 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('observer');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(3);
      source.notifyDataMove(9, 10);
      const sequence: string = listener.kindSequence();
      Logger.info(TAG, 'sequence=' + sequence);
      expect(sequence).assertEqual('add|move');
      expect(listener.indexAt(0)).assertEqual(3);
      expect(listener.toIndexAt(0)).assertEqual(-1);
      expect(listener.indexAt(1)).assertEqual(9);
      expect(listener.toIndexAt(1)).assertEqual(10);
      Logger.info(TAG, 'CrossKindPayloadStaysIndependent_034 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_3500
     * @tc.name ReloadBetweenAddsKeepsOrder035
     * @tc.desc Verify reload between adds keeps order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ReloadBetweenAddsKeepsOrder_035', 0, (): void => {
      Logger.info(TAG, 'ReloadBetweenAddsKeepsOrder_035 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('observer');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(1);
      source.notifyDataReload();
      source.notifyDataAdd(2);
      const sequence: string = listener.kindSequence();
      Logger.info(TAG, 'sequence=' + sequence);
      expect(sequence).assertEqual('add|reload|add');
      expect(listener.eventCount()).assertEqual(3);
      expect(listener.indexAt(0)).assertEqual(1);
      expect(listener.indexAt(1)).assertEqual(-1);
      expect(listener.indexAt(2)).assertEqual(2);
      Logger.info(TAG, 'ReloadBetweenAddsKeepsOrder_035 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_3600
     * @tc.name MoveFanOutKeepsEndpoints036
     * @tc.desc Verify move fan out keeps endpoints
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MoveFanOutKeepsEndpoints_036', 0, (): void => {
      Logger.info(TAG, 'MoveFanOutKeepsEndpoints_036 begin');
      const source: StringSource = new StringSource();
      source.rows = ['alpha', 'beta', 'gamma'];
      const first: RecordingListener = new RecordingListener('first');
      const second: RecordingListener = new RecordingListener('second');
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataMove(6, 2);
      expect(first.eventCount()).assertEqual(1);
      expect(second.eventCount()).assertEqual(1);
      expect(first.kindAt(0)).assertEqual('move');
      const firstOrigin: number = first.indexAt(0);
      const secondOrigin: number = second.indexAt(0);
      const firstDestination: number = first.toIndexAt(0);
      const secondDestination: number = second.toIndexAt(0);
      Logger.info(TAG, 'origins=' + firstOrigin + '/' + secondOrigin);
      Logger.info(TAG, 'destinations=' + firstDestination + '/' + secondDestination);
      expect(firstOrigin).assertEqual(6);
      expect(secondOrigin).assertEqual(6);
      expect(firstDestination).assertEqual(2);
      expect(secondDestination).assertEqual(2);
      Logger.info(TAG, 'MoveFanOutKeepsEndpoints_036 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_3700
     * @tc.name DeleteThenAddAtSameIndexKeepsKinds037
     * @tc.desc Verify delete then add at same index keeps kinds
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DeleteThenAddAtSameIndexKeepsKinds_037', 0, (): void => {
      Logger.info(TAG, 'DeleteThenAddAtSameIndexKeepsKinds_037 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('observer');
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(2);
      source.notifyDataAdd(2);
      const sequence: string = listener.kindSequence();
      Logger.info(TAG, 'sequence=' + sequence);
      expect(sequence).assertEqual('delete|add');
      expect(listener.eventCount()).assertEqual(2);
      expect(listener.kindAt(0)).assertEqual('delete');
      expect(listener.kindAt(1)).assertEqual('add');
      expect(listener.indexAt(0)).assertEqual(2);
      expect(listener.indexAt(1)).assertEqual(2);
      Logger.info(TAG, 'DeleteThenAddAtSameIndexKeepsKinds_037 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_NOTIFY_3800
     * @tc.name RepeatedIndexNotificationsAreKept038
     * @tc.desc Verify repeated index notifications are kept
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RepeatedIndexNotificationsAreKept_038', 0, (): void => {
      Logger.info(TAG, 'RepeatedIndexNotificationsAreKept_038 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('observer');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(1);
      source.notifyDataAdd(1);
      const sequence: string = listener.kindSequence();
      Logger.info(TAG, 'sequence=' + sequence);
      expect(sequence).assertEqual('add|add');
      expect(listener.eventCount()).assertEqual(2);
      expect(listener.indexAt(0)).assertEqual(1);
      const repeatedIndex: number = listener.indexAt(1);
      Logger.info(TAG, 'repeatedIndex=' + repeatedIndex);
      expect(repeatedIndex).assertEqual(1);
      expect(listener.toIndexAt(1)).assertEqual(-1);
      Logger.info(TAG, 'RepeatedIndexNotificationsAreKept_038 end');
    });
  });
}
