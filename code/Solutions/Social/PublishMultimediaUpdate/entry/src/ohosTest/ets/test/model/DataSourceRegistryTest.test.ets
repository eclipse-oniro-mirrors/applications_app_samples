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
export default function dataSourceRegistryTest() {
  describe('DataSourceRegistryTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_0100
     * @tc.name ListenerStoredThenNotified001
     * @tc.desc Verify listener stored then notified
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ListenerStoredThenNotified_001', 0, (): void => {
      Logger.info(TAG, 'ListenerStoredThenNotified_001 begin');
      const source: StringSource = new StringSource();
      source.rows = ['alpha', 'beta'];
      const listener: RecordingListener = new RecordingListener('primary');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(1);
      const delivered: number = listener.eventCount();
      Logger.info(TAG, 'delivered=' + delivered);
      expect(delivered).assertEqual(1);
      expect(listener.kindAt(0)).assertEqual('add');
      expect(listener.indexAt(0)).assertEqual(1);
      expect(listener.toIndexAt(0)).assertEqual(-1);
      expect(listener.kindSequence()).assertEqual('add');
      Logger.info(TAG, 'ListenerStoredThenNotified_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_0200
     * @tc.name RegistrationEmitsNoCallback002
     * @tc.desc Verify registration emits no callback
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RegistrationEmitsNoCallback_002', 0, (): void => {
      Logger.info(TAG, 'RegistrationEmitsNoCallback_002 begin');
      const source: StringSource = new StringSource();
      source.rows = ['alpha'];
      const first: RecordingListener = new RecordingListener('first');
      const second: RecordingListener = new RecordingListener('second');
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      const bothQuiet: boolean = first.eventCount() === 0 && second.eventCount() === 0;
      Logger.info(TAG, 'bothQuiet=' + JSON.stringify(bothQuiet));
      expect(bothQuiet).assertTrue();
      expect(first.kindSequence()).assertEqual('');
      expect(second.kindSequence()).assertEqual('');
      expect(source.totalCount()).assertEqual(1);
      Logger.info(TAG, 'RegistrationEmitsNoCallback_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_0300
     * @tc.name DuplicateRegistrationDeliversOnce003
     * @tc.desc Verify duplicate registration delivers once
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DuplicateRegistrationDeliversOnce_003', 0, (): void => {
      Logger.info(TAG, 'DuplicateRegistrationDeliversOnce_003 begin');
      const source: StringSource = new StringSource();
      source.rows = ['alpha', 'beta'];
      const listener: RecordingListener = new RecordingListener('twin');
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      const delivered: number = listener.eventCount();
      Logger.info(TAG, 'delivered=' + delivered);
      expect(delivered).assertEqual(1);
      expect(listener.kindAt(0)).assertEqual('reload');
      expect(listener.indexAt(0)).assertEqual(-1);
      expect(listener.kindSequence()).assertEqual('reload');
      Logger.info(TAG, 'DuplicateRegistrationDeliversOnce_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_0400
     * @tc.name DuplicateRegistrationKeepsOrder004
     * @tc.desc Verify duplicate registration keeps order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DuplicateRegistrationKeepsOrder_004', 0, (): void => {
      Logger.info(TAG, 'DuplicateRegistrationKeepsOrder_004 begin');
      const source: StringSource = new StringSource();
      const trace: Array<string> = [];
      const first: TraceListener = new TraceListener('first', trace);
      const second: TraceListener = new TraceListener('second', trace);
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.registerDataChangeListener(first);
      source.notifyDataAdd(0);
      const line: string = trace.join('|');
      Logger.info(TAG, 'trace=' + line);
      expect(line).assertEqual('first:add:0:-1|second:add:0:-1');
      expect(line).assertContain('first:add:0:-1');
      const entries: number = trace.length;
      Logger.info(TAG, 'entries=' + entries);
      expect(entries).assertEqual(2);
      Logger.info(TAG, 'DuplicateRegistrationKeepsOrder_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_0500
     * @tc.name UnregisterStopsDelivery005
     * @tc.desc Verify unregister stops delivery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UnregisterStopsDelivery_005', 0, (): void => {
      Logger.info(TAG, 'UnregisterStopsDelivery_005 begin');
      const source: StringSource = new StringSource();
      source.rows = ['alpha'];
      const listener: RecordingListener = new RecordingListener('departing');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      expect(listener.eventCount()).assertEqual(1);
      source.unregisterDataChangeListener(listener);
      source.notifyDataReload();
      const afterRemoval: number = listener.eventCount();
      Logger.info(TAG, 'afterRemoval=' + afterRemoval);
      expect(afterRemoval).assertEqual(1);
      expect(listener.kindSequence()).assertEqual('add');
      expect(listener.kindAt(1)).assertEqual('');
      Logger.info(TAG, 'UnregisterStopsDelivery_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_0600
     * @tc.name UnregisterUnknownKeepsOthers006
     * @tc.desc Verify unregister unknown keeps others
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UnregisterUnknownKeepsOthers_006', 0, (): void => {
      Logger.info(TAG, 'UnregisterUnknownKeepsOthers_006 begin');
      const source: StringSource = new StringSource();
      const registered: RecordingListener = new RecordingListener('registered');
      const stranger: RecordingListener = new RecordingListener('stranger');
      source.registerDataChangeListener(registered);
      source.unregisterDataChangeListener(stranger);
      source.notifyDataAdd(2);
      const registeredCount: number = registered.eventCount();
      Logger.info(TAG, 'registeredCount=' + registeredCount);
      expect(registeredCount).assertEqual(1);
      expect(registered.indexAt(0)).assertEqual(2);
      expect(stranger.eventCount()).assertEqual(0);
      expect(stranger.isSilent()).assertTrue();
      Logger.info(TAG, 'UnregisterUnknownKeepsOthers_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_0700
     * @tc.name UnregisterUnknownOnEmptyNoThrow007
     * @tc.desc Verify unregister unknown on empty no throw
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UnregisterUnknownOnEmptyNoThrow_007', 0, (): void => {
      Logger.info(TAG, 'UnregisterUnknownOnEmptyNoThrow_007 begin');
      const source: StringSource = new StringSource();
      const stranger: RecordingListener = new RecordingListener('stranger');
      let threw: boolean = false;
      try {
        source.unregisterDataChangeListener(stranger);
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
      expect(listener.kindAt(0)).assertEqual('add');
      Logger.info(TAG, 'UnregisterUnknownOnEmptyNoThrow_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_0800
     * @tc.name UnregisterTwiceIsIdempotent008
     * @tc.desc Verify unregister twice is idempotent
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UnregisterTwiceIsIdempotent_008', 0, (): void => {
      Logger.info(TAG, 'UnregisterTwiceIsIdempotent_008 begin');
      const source: StringSource = new StringSource();
      const keeper: RecordingListener = new RecordingListener('keeper');
      const target: RecordingListener = new RecordingListener('target');
      source.registerDataChangeListener(keeper);
      source.registerDataChangeListener(target);
      let threw: boolean = false;
      try {
        source.unregisterDataChangeListener(target);
        source.unregisterDataChangeListener(target);
      }
      catch (error) {
        threw = true;
      }
      const raised: boolean = threw;
      Logger.info(TAG, 'raised=' + JSON.stringify(raised));
      expect(raised).assertFalse();
      source.notifyDataAdd(0);
      expect(keeper.eventCount()).assertEqual(1);
      expect(target.eventCount()).assertEqual(0);
      expect(target.isSilent()).assertTrue();
      Logger.info(TAG, 'UnregisterTwiceIsIdempotent_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_0900
     * @tc.name ReRegisterAppendsAtEnd009
     * @tc.desc Verify re register appends at end
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ReRegisterAppendsAtEnd_009', 0, (): void => {
      Logger.info(TAG, 'ReRegisterAppendsAtEnd_009 begin');
      const source: StringSource = new StringSource();
      const trace: Array<string> = [];
      const first: TraceListener = new TraceListener('first', trace);
      const second: TraceListener = new TraceListener('second', trace);
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.unregisterDataChangeListener(first);
      source.registerDataChangeListener(first);
      source.notifyDataAdd(1);
      const line: string = trace.join('|');
      Logger.info(TAG, 'trace=' + line);
      expect(line).assertEqual('second:add:1:-1|first:add:1:-1');
      expect(line).assertContain('second:add:1:-1');
      expect(trace.length).assertEqual(2);
      Logger.info(TAG, 'ReRegisterAppendsAtEnd_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_1000
     * @tc.name ReRegisterDeliversAgain010
     * @tc.desc Verify re register delivers again
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ReRegisterDeliversAgain_010', 0, (): void => {
      Logger.info(TAG, 'ReRegisterDeliversAgain_010 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('reused');
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.notifyDataReload();
      expect(listener.eventCount()).assertEqual(0);
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      const delivered: number = listener.eventCount();
      Logger.info(TAG, 'delivered=' + delivered);
      expect(delivered).assertEqual(1);
      expect(listener.kindAt(0)).assertEqual('add');
      expect(listener.kindSequence()).assertEqual('add');
      Logger.info(TAG, 'ReRegisterDeliversAgain_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_1100
     * @tc.name ThreeListenersAllNotified011
     * @tc.desc Verify three listeners all notified
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ThreeListenersAllNotified_011', 0, (): void => {
      Logger.info(TAG, 'ThreeListenersAllNotified_011 begin');
      const source: StringSource = new StringSource();
      source.rows = ['alpha'];
      let listeners: Array<RecordingListener> = [];
      for (let index: number = 0; index < 3; index++) {
        const listener: RecordingListener = new RecordingListener('member_' + index);
        listeners.push(listener);
        source.registerDataChangeListener(listener);
      }
      source.notifyDataReload();
      let total: number = 0;
      for (let index: number = 0; index < listeners.length; index++) {
        total += listeners[index].eventCount();
      }
      Logger.info(TAG, 'total=' + total);
      expect(total).assertEqual(3);
      expect(listeners[0].eventCount()).assertEqual(1);
      expect(listeners[1].eventCount()).assertEqual(1);
      expect(listeners[2].eventCount()).assertEqual(1);
      expect(listeners[2].kindAt(0)).assertEqual('reload');
      Logger.info(TAG, 'ThreeListenersAllNotified_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_1200
     * @tc.name OrderFollowsRegistration012
     * @tc.desc Verify order follows registration
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'OrderFollowsRegistration_012', 0, (): void => {
      Logger.info(TAG, 'OrderFollowsRegistration_012 begin');
      const source: StringSource = new StringSource();
      const trace: Array<string> = [];
      const first: TraceListener = new TraceListener('first', trace);
      const second: TraceListener = new TraceListener('second', trace);
      const third: TraceListener = new TraceListener('third', trace);
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.registerDataChangeListener(third);
      source.notifyDataAdd(5);
      const line: string = trace.join('|');
      Logger.info(TAG, 'trace=' + line);
      expect(line).assertEqual('first:add:5:-1|second:add:5:-1|third:add:5:-1');
      expect(line).assertContain('second:add:5:-1');
      expect(trace.length).assertEqual(3);
      Logger.info(TAG, 'OrderFollowsRegistration_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_1300
     * @tc.name OrderIgnoresLabelSorting013
     * @tc.desc Verify order ignores label sorting
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'OrderIgnoresLabelSorting_013', 0, (): void => {
      Logger.info(TAG, 'OrderIgnoresLabelSorting_013 begin');
      const source: StringSource = new StringSource();
      const trace: Array<string> = [];
      const zulu: TraceListener = new TraceListener('zulu', trace);
      const alpha: TraceListener = new TraceListener('alpha', trace);
      source.registerDataChangeListener(zulu);
      source.registerDataChangeListener(alpha);
      source.notifyDataReload();
      const line: string = trace.join('|');
      Logger.info(TAG, 'trace=' + line);
      expect(line).assertEqual('zulu:reload:-1:-1|alpha:reload:-1:-1');
      expect(line).assertContain('zulu:reload:-1:-1');
      const firstLabel: string = trace[0];
      Logger.info(TAG, 'firstLabel=' + firstLabel);
      expect(firstLabel).assertContain('zulu');
      Logger.info(TAG, 'OrderIgnoresLabelSorting_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_1400
     * @tc.name FiftyListenersEachNotified014
     * @tc.desc Verify fifty listeners each notified
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FiftyListenersEachNotified_014', 0, (): void => {
      Logger.info(TAG, 'FiftyListenersEachNotified_014 begin');
      const source: StringSource = new StringSource();
      source.rows = ['alpha', 'beta', 'gamma'];
      let listeners: Array<RecordingListener> = [];
      for (let index: number = 0; index < 50; index++) {
        const listener: RecordingListener = new RecordingListener('bulk_' + index);
        listeners.push(listener);
        source.registerDataChangeListener(listener);
      }
      source.notifyDataReload();
      let missed: number = 0;
      for (let index: number = 0; index < listeners.length; index++) {
        if (listeners[index].eventCount() !== 1) {
          missed += 1;
        }
      }
      Logger.info(TAG, 'missed=' + missed);
      expect(listeners.length).assertEqual(50);
      expect(missed).assertEqual(0);
      expect(listeners[49].kindAt(0)).assertEqual('reload');
      Logger.info(TAG, 'FiftyListenersEachNotified_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_1500
     * @tc.name FiftyListenersUnregisterHalf015
     * @tc.desc Verify fifty listeners unregister half
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FiftyListenersUnregisterHalf_015', 0, (): void => {
      Logger.info(TAG, 'FiftyListenersUnregisterHalf_015 begin');
      const source: StringSource = new StringSource();
      source.rows = ['alpha'];
      let listeners: Array<RecordingListener> = [];
      for (let index: number = 0; index < 50; index++) {
        const listener: RecordingListener = new RecordingListener('half_' + index);
        listeners.push(listener);
        source.registerDataChangeListener(listener);
      }
      for (let index: number = 0; index < 50; index += 2) {
        source.unregisterDataChangeListener(listeners[index]);
      }
      source.notifyDataAdd(3);
      let receiving: number = 0;
      let silent: number = 0;
      for (let index: number = 0; index < 50; index++) {
        if (listeners[index].eventCount() === 1) {
          receiving += 1;
        }
        if (listeners[index].eventCount() === 0) {
          silent += 1;
        }
      }
      Logger.info(TAG, 'receiving=' + receiving + ', silent=' + silent);
      expect(receiving).assertEqual(25);
      expect(silent).assertEqual(25);
      expect(listeners[0].isSilent()).assertTrue();
      expect(listeners[1].kindAt(0)).assertEqual('add');
      Logger.info(TAG, 'FiftyListenersUnregisterHalf_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_1600
     * @tc.name SourcesNotifyIndependently016
     * @tc.desc Verify sources notify independently
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SourcesNotifyIndependently_016', 0, (): void => {
      Logger.info(TAG, 'SourcesNotifyIndependently_016 begin');
      const firstSource: StringSource = new StringSource();
      const secondSource: StringSource = new StringSource();
      const firstListener: RecordingListener = new RecordingListener('first_source');
      const secondListener: RecordingListener = new RecordingListener('second_source');
      firstSource.registerDataChangeListener(firstListener);
      secondSource.registerDataChangeListener(secondListener);
      firstSource.notifyDataAdd(0);
      expect(firstListener.eventCount()).assertEqual(1);
      expect(secondListener.eventCount()).assertEqual(0);
      secondSource.notifyDataReload();
      expect(secondListener.eventCount()).assertEqual(1);
      expect(firstListener.kindSequence()).assertEqual('add');
      expect(secondListener.kindSequence()).assertEqual('reload');
      Logger.info(TAG, 'SourcesNotifyIndependently_016 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_1700
     * @tc.name RegisterAfterSlotFreed017
     * @tc.desc Verify register after slot freed
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RegisterAfterSlotFreed_017', 0, (): void => {
      Logger.info(TAG, 'RegisterAfterSlotFreed_017 begin');
      const source: StringSource = new StringSource();
      const retired: RecordingListener = new RecordingListener('retired');
      const fresh: RecordingListener = new RecordingListener('fresh');
      source.registerDataChangeListener(retired);
      source.notifyDataAdd(0);
      expect(retired.eventCount()).assertEqual(1);
      source.unregisterDataChangeListener(retired);
      source.registerDataChangeListener(fresh);
      source.notifyDataReload();
      const freshCount: number = fresh.eventCount();
      Logger.info(TAG, 'freshCount=' + freshCount);
      expect(freshCount).assertEqual(1);
      expect(fresh.kindAt(0)).assertEqual('reload');
      expect(retired.kindSequence()).assertEqual('add');
      Logger.info(TAG, 'RegisterAfterSlotFreed_017 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_1800
     * @tc.name SameLabelListenersAreDistinct018
     * @tc.desc Verify same label listeners are distinct, as covered by the data source registry test suite
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SameLabelListenersAreDistinct_018', 0, (): void => {
      Logger.info(TAG, 'SameLabelListenersAreDistinct_018 begin');
      const source: StringSource = new StringSource();
      const twinOne: RecordingListener = new RecordingListener('twin');
      const twinTwo: RecordingListener = new RecordingListener('twin');
      source.registerDataChangeListener(twinOne);
      source.registerDataChangeListener(twinTwo);
      const labelsMatch: boolean = twinOne.label === twinTwo.label;
      Logger.info(TAG, 'labelsMatch=' + JSON.stringify(labelsMatch));
      expect(labelsMatch).assertTrue();
      source.notifyDataAdd(0);
      expect(twinOne.eventCount()).assertEqual(1);
      expect(twinTwo.eventCount()).assertEqual(1);
      source.unregisterDataChangeListener(twinOne);
      source.notifyDataAdd(1);
      const survivor: number = twinTwo.eventCount();
      Logger.info(TAG, 'survivor=' + survivor);
      expect(survivor).assertEqual(2);
      Logger.info(TAG, 'SameLabelListenersAreDistinct_018 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_1900
     * @tc.name RegistrySurvivesDataChange019
     * @tc.desc Verify registry survives data change
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RegistrySurvivesDataChange_019', 0, (): void => {
      Logger.info(TAG, 'RegistrySurvivesDataChange_019 begin');
      const source: StringSource = new StringSource();
      source.rows = ['alpha'];
      const listener: RecordingListener = new RecordingListener('steady');
      source.registerDataChangeListener(listener);
      source.rows.push('beta');
      source.notifyDataAdd(1);
      expect(listener.eventCount()).assertEqual(1);
      source.rows.pop();
      source.notifyDataDelete(1);
      const afterDelete: number = listener.eventCount();
      Logger.info(TAG, 'afterDelete=' + afterDelete);
      expect(afterDelete).assertEqual(2);
      expect(listener.kindSequence()).assertEqual('add|delete');
      expect(listener.indexAt(1)).assertEqual(1);
      expect(source.totalCount()).assertEqual(1);
      Logger.info(TAG, 'RegistrySurvivesDataChange_019 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_2000
     * @tc.name RegistrationDoesNotTouchRows020
     * @tc.desc Verify registration does not touch rows
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RegistrationDoesNotTouchRows_020', 0, (): void => {
      Logger.info(TAG, 'RegistrationDoesNotTouchRows_020 begin');
      const source: StringSource = new StringSource();
      source.rows = ['alpha', 'beta', 'gamma'];
      const first: RecordingListener = new RecordingListener('first');
      const second: RecordingListener = new RecordingListener('second');
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataAdd(3);
      const rowCount: number = source.totalCount();
      Logger.info(TAG, 'rowCount=' + rowCount);
      expect(rowCount).assertEqual(3);
      expect(source.rows.length).assertEqual(3);
      expect(source.getData(0)).assertEqual('alpha');
      expect(source.getData(2)).assertEqual('gamma');
      Logger.info(TAG, 'RegistrationDoesNotTouchRows_020 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_2100
     * @tc.name EmptySourceCountZero021
     * @tc.desc Verify empty source count zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptySourceCountZero_021', 0, (): void => {
      Logger.info(TAG, 'EmptySourceCountZero_021 begin');
      const source: StringSource = new StringSource();
      const count: number = source.totalCount();
      Logger.info(TAG, 'count=' + count);
      expect(count).assertEqual(0);
      expect(source.rows.length).assertEqual(0);
      expect(source.getData(0)).assertUndefined();
      const isEmpty: boolean = source.totalCount() === 0;
      Logger.info(TAG, 'isEmpty=' + JSON.stringify(isEmpty));
      expect(isEmpty).assertTrue();
      Logger.info(TAG, 'EmptySourceCountZero_021 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_2200
     * @tc.name CountTracksRows022
     * @tc.desc Verify count tracks rows
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'CountTracksRows_022', 0, (): void => {
      Logger.info(TAG, 'CountTracksRows_022 begin');
      const source: StringSource = new StringSource();
      source.rows = ['row_0', 'row_1', 'row_2'];
      expect(source.totalCount()).assertEqual(3);
      source.rows.pop();
      const afterPop: number = source.totalCount();
      Logger.info(TAG, 'afterPop=' + afterPop);
      expect(afterPop).assertEqual(2);
      expect(source.getData(1)).assertEqual('row_1');
      source.rows.push('row_3');
      expect(source.getData(2)).assertEqual('row_3');
      Logger.info(TAG, 'CountTracksRows_022 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_2300
     * @tc.name GetDataReturnsStoredRow023
     * @tc.desc Verify get data returns stored row
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'GetDataReturnsStoredRow_023', 0, (): void => {
      Logger.info(TAG, 'GetDataReturnsStoredRow_023 begin');
      const source: StringSource = new StringSource();
      source.rows = ['red', 'green', 'blue'];
      const second: string = source.getData(1);
      Logger.info(TAG, 'second=' + second);
      expect(second).assertEqual('green');
      expect(second).assertContain('ree');
      expect(source.getData(0)).assertEqual('red');
      expect(source.getData(2)).assertEqual('blue');
      Logger.info(TAG, 'GetDataReturnsStoredRow_023 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_2400
     * @tc.name GetDataLastIndex024
     * @tc.desc Verify get data last index
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'GetDataLastIndex_024', 0, (): void => {
      Logger.info(TAG, 'GetDataLastIndex_024 begin');
      const source: StringSource = new StringSource();
      for (let index: number = 0; index < 5; index++) {
        source.rows.push('entry_' + index);
      }
      const last: string = source.getData(4);
      Logger.info(TAG, 'last=' + last);
      expect(last).assertEqual('entry_4');
      expect(source.totalCount()).assertEqual(5);
      const lastMatches: boolean = last === source.rows[4];
      Logger.info(TAG, 'lastMatches=' + JSON.stringify(lastMatches));
      expect(lastMatches).assertTrue();
      Logger.info(TAG, 'GetDataLastIndex_024 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_2500
     * @tc.name GetDataOutOfRangeUndefined025
     * @tc.desc Verify get data out of range undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'GetDataOutOfRangeUndefined_025', 0, (): void => {
      Logger.info(TAG, 'GetDataOutOfRangeUndefined_025 begin');
      const source: StringSource = new StringSource();
      source.rows = ['alpha', 'beta'];
      expect(source.getData(2)).assertUndefined();
      expect(source.getData(99)).assertUndefined();
      const overflow: number = 2;
      Logger.info(TAG, 'overflow=' + overflow);
      expect(source.totalCount()).assertEqual(2);
      Logger.info(TAG, 'GetDataOutOfRangeUndefined_025 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_2600
     * @tc.name LateListenerMissesEarlierEvent026
     * @tc.desc Verify late listener misses earlier event
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LateListenerMissesEarlierEvent_026', 0, (): void => {
      Logger.info(TAG, 'LateListenerMissesEarlierEvent_026 begin');
      const source: StringSource = new StringSource();
      const early: RecordingListener = new RecordingListener('early');
      source.registerDataChangeListener(early);
      source.notifyDataAdd(0);
      source.notifyDataAdd(1);
      const late: RecordingListener = new RecordingListener('late');
      source.registerDataChangeListener(late);
      source.notifyDataAdd(2);
      expect(early.eventCount()).assertEqual(3);
      const lateCount: number = late.eventCount();
      Logger.info(TAG, 'lateCount=' + lateCount);
      expect(lateCount).assertEqual(1);
      expect(late.indexAt(0)).assertEqual(2);
      expect(late.kindSequence()).assertEqual('add');
      Logger.info(TAG, 'LateListenerMissesEarlierEvent_026 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_2700
     * @tc.name RepeatedDuplicateRegistrationBetweenNotifies027
     * @tc.desc Verify repeated duplicate registration between notifies
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RepeatedDuplicateRegistrationBetweenNotifies_027', 0, (): void => {
      Logger.info(TAG, 'RepeatedDuplicateRegistrationBetweenNotifies_027 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('persistent');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      expect(listener.eventCount()).assertEqual(1);
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(1);
      const afterSecond: number = listener.eventCount();
      Logger.info(TAG, 'afterSecond=' + afterSecond);
      expect(afterSecond).assertEqual(2);
      expect(listener.kindSequence()).assertEqual('add|add');
      expect(listener.indexAt(1)).assertEqual(1);
      Logger.info(TAG, 'RepeatedDuplicateRegistrationBetweenNotifies_027 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_2800
     * @tc.name UnregisterAllListenersSilent028
     * @tc.desc Verify unregister all listeners silent
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UnregisterAllListenersSilent_028', 0, (): void => {
      Logger.info(TAG, 'UnregisterAllListenersSilent_028 begin');
      const source: StringSource = new StringSource();
      const first: RecordingListener = new RecordingListener('first');
      const second: RecordingListener = new RecordingListener('second');
      const third: RecordingListener = new RecordingListener('third');
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.registerDataChangeListener(third);
      source.unregisterDataChangeListener(first);
      source.unregisterDataChangeListener(second);
      source.unregisterDataChangeListener(third);
      source.notifyDataReload();
      const total: number = first.eventCount() + second.eventCount() + third.eventCount();
      Logger.info(TAG, 'total=' + total);
      expect(total).assertEqual(0);
      expect(first.isSilent()).assertTrue();
      expect(second.isSilent()).assertTrue();
      expect(third.isSilent()).assertTrue();
      Logger.info(TAG, 'UnregisterAllListenersSilent_028 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_2900
     * @tc.name PerSourceListenerCounts029
     * @tc.desc Verify per source listener counts
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PerSourceListenerCounts_029', 0, (): void => {
      Logger.info(TAG, 'PerSourceListenerCounts_029 begin');
      const firstSource: StringSource = new StringSource();
      const secondSource: StringSource = new StringSource();
      const firstA: RecordingListener = new RecordingListener('first_a');
      const firstB: RecordingListener = new RecordingListener('first_b');
      const secondA: RecordingListener = new RecordingListener('second_a');
      firstSource.registerDataChangeListener(firstA);
      firstSource.registerDataChangeListener(firstB);
      secondSource.registerDataChangeListener(secondA);
      firstSource.notifyDataReload();
      secondSource.notifyDataReload();
      const firstTotal: number = firstA.eventCount() + firstB.eventCount();
      const secondTotal: number = secondA.eventCount();
      Logger.info(TAG, 'firstTotal=' + firstTotal + ', secondTotal=' + secondTotal);
      expect(firstTotal).assertEqual(2);
      expect(secondTotal).assertEqual(1);
      expect(firstA.kindAt(0)).assertEqual('reload');
      expect(secondA.kindAt(0)).assertEqual('reload');
      Logger.info(TAG, 'PerSourceListenerCounts_029 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_3000
     * @tc.name NotifyWithoutRegistrationCreatesNoEntry030
     * @tc.desc Verify notify without registration creates no entry
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NotifyWithoutRegistrationCreatesNoEntry_030', 0, (): void => {
      Logger.info(TAG, 'NotifyWithoutRegistrationCreatesNoEntry_030 begin');
      const source: StringSource = new StringSource();
      source.notifyDataAdd(0);
      const listener: RecordingListener = new RecordingListener('registered_later');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(1);
      const delivered: number = listener.eventCount();
      Logger.info(TAG, 'delivered=' + delivered);
      expect(delivered).assertEqual(1);
      expect(listener.indexAt(0)).assertEqual(1);
      expect(listener.kindSequence()).assertEqual('add');
      Logger.info(TAG, 'NotifyWithoutRegistrationCreatesNoEntry_030 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_3100
     * @tc.name DuplicateGuardAppliesAfterReRegister031
     * @tc.desc Verify duplicate guard applies after re register
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DuplicateGuardAppliesAfterReRegister_031', 0, (): void => {
      Logger.info(TAG, 'DuplicateGuardAppliesAfterReRegister_031 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('restored');
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.notifyDataChange(4);
      const delivered: number = listener.eventCount();
      Logger.info(TAG, 'delivered=' + delivered);
      expect(delivered).assertEqual(1);
      expect(listener.kindAt(0)).assertEqual('change');
      expect(listener.indexAt(0)).assertEqual(4);
      expect(listener.kindSequence()).assertEqual('change');
      Logger.info(TAG, 'DuplicateGuardAppliesAfterReRegister_031 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_3200
     * @tc.name RepeatedRegisterUnregisterCycleKeepsSingle032
     * @tc.desc Verify repeated register unregister cycle keeps single
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RepeatedRegisterUnregisterCycleKeepsSingle_032', 0, (): void => {
      Logger.info(TAG, 'RepeatedRegisterUnregisterCycleKeepsSingle_032 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('cycling');
      for (let index: number = 0; index < 5; index++) {
        source.registerDataChangeListener(listener);
        source.unregisterDataChangeListener(listener);
      }
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      const delivered: number = listener.eventCount();
      Logger.info(TAG, 'delivered=' + delivered);
      expect(delivered).assertEqual(1);
      expect(listener.kindAt(0)).assertEqual('reload');
      expect(listener.kindSequence()).assertEqual('reload');
      Logger.info(TAG, 'RepeatedRegisterUnregisterCycleKeepsSingle_032 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_3300
     * @tc.name ManyDuplicateRegistrationsEachOnce033
     * @tc.desc Verify many duplicate registrations each once
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ManyDuplicateRegistrationsEachOnce_033', 0, (): void => {
      Logger.info(TAG, 'ManyDuplicateRegistrationsEachOnce_033 begin');
      const source: StringSource = new StringSource();
      source.rows = ['alpha'];
      let listeners: Array<RecordingListener> = [];
      for (let index: number = 0; index < 10; index++) {
        const listener: RecordingListener = new RecordingListener('doubled_' + index);
        listeners.push(listener);
        source.registerDataChangeListener(listener);
        source.registerDataChangeListener(listener);
      }
      source.notifyDataAdd(3);
      let overDelivered: number = 0;
      for (let index: number = 0; index < listeners.length; index++) {
        if (listeners[index].eventCount() !== 1) {
          overDelivered += 1;
        }
      }
      Logger.info(TAG, 'overDelivered=' + overDelivered);
      expect(listeners.length).assertEqual(10);
      expect(overDelivered).assertEqual(0);
      expect(listeners[9].indexAt(0)).assertEqual(3);
      Logger.info(TAG, 'ManyDuplicateRegistrationsEachOnce_033 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_3400
     * @tc.name EmptyAfterUnregisterAllThenRegisterOne034
     * @tc.desc Verify empty after unregister all then register one
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyAfterUnregisterAllThenRegisterOne_034', 0, (): void => {
      Logger.info(TAG, 'EmptyAfterUnregisterAllThenRegisterOne_034 begin');
      const source: StringSource = new StringSource();
      const first: RecordingListener = new RecordingListener('first');
      const second: RecordingListener = new RecordingListener('second');
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.unregisterDataChangeListener(first);
      source.unregisterDataChangeListener(second);
      const replacement: RecordingListener = new RecordingListener('replacement');
      source.registerDataChangeListener(replacement);
      source.notifyDataAdd(8);
      expect(replacement.eventCount()).assertEqual(1);
      expect(replacement.indexAt(0)).assertEqual(8);
      expect(first.eventCount()).assertEqual(0);
      expect(second.isSilent()).assertTrue();
      Logger.info(TAG, 'EmptyAfterUnregisterAllThenRegisterOne_034 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_3500
     * @tc.name GetDataReflectsRowOverwrite035
     * @tc.desc Verify get data reflects row overwrite
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'GetDataReflectsRowOverwrite_035', 0, (): void => {
      Logger.info(TAG, 'GetDataReflectsRowOverwrite_035 begin');
      const source: StringSource = new StringSource();
      source.rows = ['alpha', 'beta'];
      expect(source.getData(1)).assertEqual('beta');
      source.rows[1] = 'updated';
      const current: string = source.getData(1);
      Logger.info(TAG, 'current=' + current);
      expect(current).assertEqual('updated');
      expect(current).assertContain('update');
      expect(source.totalCount()).assertEqual(2);
      Logger.info(TAG, 'GetDataReflectsRowOverwrite_035 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_REGISTRY_3600
     * @tc.name OrderStableAcrossNotifications036
     * @tc.desc Verify order stable across notifications
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'OrderStableAcrossNotifications_036', 0, (): void => {
      Logger.info(TAG, 'OrderStableAcrossNotifications_036 begin');
      const source: StringSource = new StringSource();
      const trace: Array<string> = [];
      const first: TraceListener = new TraceListener('first', trace);
      const second: TraceListener = new TraceListener('second', trace);
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataReload();
      source.notifyDataReload();
      source.notifyDataReload();
      const line: string = trace.join('|');
      Logger.info(TAG, 'trace=' + line);
      const expected: string = 'first:reload:-1:-1|second:reload:-1:-1|first:reload:-1:-1|'
        + 'second:reload:-1:-1|first:reload:-1:-1|second:reload:-1:-1';
      expect(line).assertEqual(expected);
      expect(trace.length).assertEqual(6);
      expect(trace[0]).assertContain('first');
      Logger.info(TAG, 'OrderStableAcrossNotifications_036 end');
    });
  });
}
