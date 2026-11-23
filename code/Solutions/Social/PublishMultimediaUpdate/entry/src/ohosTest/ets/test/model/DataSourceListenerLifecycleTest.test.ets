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
export default function dataSourceListenerLifecycleTest() {
  describe('DataSourceListenerLifecycleTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_LIFECYCLE_0100
     * @tc.name SilentBeforeAnyNotify001
     * @tc.desc Verify silent before any notify
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SilentBeforeAnyNotify_001', 0, (): void => {
      Logger.info(TAG, 'SilentBeforeAnyNotify_001 begin');
      const listener: RecordingListener = new RecordingListener('fresh');
      const silent: boolean = listener.isSilent();
      Logger.info(TAG, 'silent=' + JSON.stringify(silent));
      expect(silent).assertTrue();
      expect(listener.eventCount()).assertEqual(0);
      expect(listener.kindSequence()).assertEqual('');
      expect(listener.kindAt(0)).assertEqual('');
      Logger.info(TAG, 'SilentBeforeAnyNotify_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_LIFECYCLE_0200
     * @tc.name EventCountGrowsPerNotify002
     * @tc.desc Verify event count grows per notify
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EventCountGrowsPerNotify_002', 0, (): void => {
      Logger.info(TAG, 'EventCountGrowsPerNotify_002 begin');
      const source: StringSource = new StringSource();
      source.rows = ['alpha', 'beta'];
      const listener: RecordingListener = new RecordingListener('counter');
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      expect(listener.eventCount()).assertEqual(1);
      source.notifyDataReload();
      expect(listener.eventCount()).assertEqual(2);
      source.notifyDataReload();
      const afterThird: number = listener.eventCount();
      Logger.info(TAG, 'afterThird=' + afterThird);
      expect(afterThird).assertEqual(3);
      expect(listener.kindSequence()).assertEqual('reload|reload|reload');
      Logger.info(TAG, 'EventCountGrowsPerNotify_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_LIFECYCLE_0300
     * @tc.name KindAtOutOfRangeEmpty003
     * @tc.desc Verify kind at out of range empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'KindAtOutOfRangeEmpty_003', 0, (): void => {
      Logger.info(TAG, 'KindAtOutOfRangeEmpty_003 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('reader');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      expect(listener.kindAt(0)).assertEqual('add');
      const pastEnd: string = listener.kindAt(1);
      const beforeStart: string = listener.kindAt(-1);
      const farPast: string = listener.kindAt(9);
      Logger.info(TAG, 'pastEnd=' + pastEnd + ', beforeStart=' + beforeStart);
      Logger.info(TAG, 'farPast=' + farPast);
      expect(pastEnd).assertEqual('');
      expect(beforeStart).assertEqual('');
      expect(farPast).assertEqual('');
      Logger.info(TAG, 'KindAtOutOfRangeEmpty_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_LIFECYCLE_0400
     * @tc.name IndexAtOutOfRangeMinusOne004
     * @tc.desc Verify index at out of range minus one
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'IndexAtOutOfRangeMinusOne_004', 0, (): void => {
      Logger.info(TAG, 'IndexAtOutOfRangeMinusOne_004 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('reader');
      source.registerDataChangeListener(listener);
      source.notifyDataMove(2, 5);
      expect(listener.indexAt(0)).assertEqual(2);
      const pastEnd: number = listener.indexAt(1);
      const beforeStart: number = listener.indexAt(-3);
      Logger.info(TAG, 'pastEnd=' + pastEnd + ', beforeStart=' + beforeStart);
      expect(pastEnd).assertEqual(-1);
      expect(beforeStart).assertEqual(-1);
      Logger.info(TAG, 'IndexAtOutOfRangeMinusOne_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_LIFECYCLE_0500
     * @tc.name ToIndexAtOutOfRangeMinusOne005
     * @tc.desc Verify to index at out of range minus one
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ToIndexAtOutOfRangeMinusOne_005', 0, (): void => {
      Logger.info(TAG, 'ToIndexAtOutOfRangeMinusOne_005 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('reader');
      source.registerDataChangeListener(listener);
      source.notifyDataMove(1, 0);
      expect(listener.toIndexAt(0)).assertEqual(0);
      const pastEnd: number = listener.toIndexAt(1);
      const beforeStart: number = listener.toIndexAt(-4);
      Logger.info(TAG, 'pastEnd=' + pastEnd + ', beforeStart=' + beforeStart);
      expect(pastEnd).assertEqual(-1);
      expect(beforeStart).assertEqual(-1);
      Logger.info(TAG, 'ToIndexAtOutOfRangeMinusOne_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_LIFECYCLE_0600
     * @tc.name IndexAndToIndexAtValidPosition006
     * @tc.desc Verify index and to index at valid position
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'IndexAndToIndexAtValidPosition_006', 0, (): void => {
      Logger.info(TAG, 'IndexAndToIndexAtValidPosition_006 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('reader');
      source.registerDataChangeListener(listener);
      source.notifyDataMove(2, 5);
      const origin: number = listener.indexAt(0);
      const destination: number = listener.toIndexAt(0);
      Logger.info(TAG, 'origin=' + origin + ', destination=' + destination);
      expect(origin).assertEqual(2);
      expect(destination).assertEqual(5);
      expect(listener.kindAt(0)).assertEqual('move');
      expect(listener.operandCountAt(0)).assertEqual(1);
      Logger.info(TAG, 'IndexAndToIndexAtValidPosition_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_LIFECYCLE_0700
     * @tc.name UnregisteredReceivesNothing007
     * @tc.desc Verify unregistered receives nothing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UnregisteredReceivesNothing_007', 0, (): void => {
      Logger.info(TAG, 'UnregisteredReceivesNothing_007 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('departed');
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.notifyDataAdd(0);
      source.notifyDataAdd(1);
      const silent: boolean = listener.isSilent();
      Logger.info(TAG, 'silent=' + JSON.stringify(silent));
      expect(silent).assertTrue();
      expect(listener.eventCount()).assertEqual(0);
      expect(listener.kindSequence()).assertEqual('');
      Logger.info(TAG, 'UnregisteredReceivesNothing_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_LIFECYCLE_0800
     * @tc.name OtherListenersStillReceive008
     * @tc.desc Verify other listeners still receive
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'OtherListenersStillReceive_008', 0, (): void => {
      Logger.info(TAG, 'OtherListenersStillReceive_008 begin');
      const source: StringSource = new StringSource();
      const removed: RecordingListener = new RecordingListener('removed');
      const retained: RecordingListener = new RecordingListener('retained');
      source.registerDataChangeListener(removed);
      source.registerDataChangeListener(retained);
      source.unregisterDataChangeListener(removed);
      source.notifyDataAdd(1);
      expect(retained.eventCount()).assertEqual(1);
      expect(retained.indexAt(0)).assertEqual(1);
      expect(removed.eventCount()).assertEqual(0);
      expect(removed.isSilent()).assertTrue();
      Logger.info(TAG, 'OtherListenersStillReceive_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_LIFECYCLE_0900
     * @tc.name ResetClearsRecords009
     * @tc.desc Verify reset clears records
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ResetClearsRecords_009', 0, (): void => {
      Logger.info(TAG, 'ResetClearsRecords_009 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('reusable');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      source.notifyDataDelete(0);
      expect(listener.eventCount()).assertEqual(2);
      listener.reset();
      const cleared: number = listener.eventCount();
      Logger.info(TAG, 'cleared=' + cleared);
      expect(cleared).assertEqual(0);
      expect(listener.kindSequence()).assertEqual('');
      expect(listener.kindAt(0)).assertEqual('');
      Logger.info(TAG, 'ResetClearsRecords_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_LIFECYCLE_1000
     * @tc.name ResetKeepsRegistration010
     * @tc.desc Verify reset keeps registration
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ResetKeepsRegistration_010', 0, (): void => {
      Logger.info(TAG, 'ResetKeepsRegistration_010 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('reusable');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      listener.reset();
      expect(listener.eventCount()).assertEqual(0);
      source.notifyDataReload();
      const redelivered: number = listener.eventCount();
      Logger.info(TAG, 'redelivered=' + redelivered);
      expect(redelivered).assertEqual(1);
      expect(listener.kindAt(0)).assertEqual('reload');
      Logger.info(TAG, 'ResetKeepsRegistration_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_LIFECYCLE_1100
     * @tc.name ResetOnFreshListenerIsSafe011
     * @tc.desc Verify reset on fresh listener is safe
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ResetOnFreshListenerIsSafe_011', 0, (): void => {
      Logger.info(TAG, 'ResetOnFreshListenerIsSafe_011 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('fresh');
      let threw: boolean = false;
      try {
        listener.reset();
      }
      catch (error) {
        threw = true;
      }
      const raised: boolean = threw;
      Logger.info(TAG, 'raised=' + JSON.stringify(raised));
      expect(raised).assertFalse();
      expect(listener.isSilent()).assertTrue();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      expect(listener.eventCount()).assertEqual(1);
      Logger.info(TAG, 'ResetOnFreshListenerIsSafe_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_LIFECYCLE_1200
     * @tc.name ReRegisterAfterResetDeliversOnce012
     * @tc.desc Verify re register after reset delivers once
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ReRegisterAfterResetDeliversOnce_012', 0, (): void => {
      Logger.info(TAG, 'ReRegisterAfterResetDeliversOnce_012 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('reused');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      source.unregisterDataChangeListener(listener);
      listener.reset();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(1);
      const delivered: number = listener.eventCount();
      Logger.info(TAG, 'delivered=' + delivered);
      expect(delivered).assertEqual(1);
      expect(listener.indexAt(0)).assertEqual(1);
      expect(listener.kindSequence()).assertEqual('add');
      Logger.info(TAG, 'ReRegisterAfterResetDeliversOnce_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_LIFECYCLE_1300
     * @tc.name UnregisterMiddleKeepsOrder013
     * @tc.desc Verify unregister middle keeps order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UnregisterMiddleKeepsOrder_013', 0, (): void => {
      Logger.info(TAG, 'UnregisterMiddleKeepsOrder_013 begin');
      const source: StringSource = new StringSource();
      const trace: Array<string> = [];
      const first: TraceListener = new TraceListener('a', trace);
      const middle: RecordingListener = new RecordingListener('b');
      const last: TraceListener = new TraceListener('c', trace);
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(middle);
      source.registerDataChangeListener(last);
      source.unregisterDataChangeListener(middle);
      source.notifyDataAdd(1);
      const line: string = trace.join('|');
      Logger.info(TAG, 'trace=' + line);
      expect(line).assertEqual('a:add:1:-1|c:add:1:-1');
      expect(middle.eventCount()).assertEqual(0);
      expect(middle.isSilent()).assertTrue();
      Logger.info(TAG, 'UnregisterMiddleKeepsOrder_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_LIFECYCLE_1400
     * @tc.name DuplicateRegisterThenUnregisterRemovesSingle014
     * @tc.desc Verify duplicate register then unregister removes single
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DuplicateRegisterThenUnregisterRemovesSingle_014', 0, (): void => {
      Logger.info(TAG, 'DuplicateRegisterThenUnregisterRemovesSingle_014 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('single');
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.notifyDataReload();
      const silent: boolean = listener.isSilent();
      Logger.info(TAG, 'silent=' + JSON.stringify(silent));
      expect(silent).assertTrue();
      expect(listener.eventCount()).assertEqual(0);
      Logger.info(TAG, 'DuplicateRegisterThenUnregisterRemovesSingle_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_LIFECYCLE_1500
     * @tc.name RemovedListenerSilentAcrossTwoNotifies015
     * @tc.desc Verify removed listener silent across two notifies
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RemovedListenerSilentAcrossTwoNotifies_015', 0, (): void => {
      Logger.info(TAG, 'RemovedListenerSilentAcrossTwoNotifies_015 begin');
      const source: StringSource = new StringSource();
      const removed: RecordingListener = new RecordingListener('removed');
      const retained: RecordingListener = new RecordingListener('retained');
      source.registerDataChangeListener(removed);
      source.registerDataChangeListener(retained);
      source.unregisterDataChangeListener(removed);
      source.notifyDataAdd(0);
      source.notifyDataAdd(1);
      expect(removed.eventCount()).assertEqual(0);
      const retainedCount: number = retained.eventCount();
      Logger.info(TAG, 'retainedCount=' + retainedCount);
      expect(retainedCount).assertEqual(2);
      expect(retained.indexAt(1)).assertEqual(1);
      Logger.info(TAG, 'RemovedListenerSilentAcrossTwoNotifies_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_LIFECYCLE_1600
     * @tc.name RegistrationSurvivesManyNotifies016
     * @tc.desc Verify registration survives many notifies
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RegistrationSurvivesManyNotifies_016', 0, (): void => {
      Logger.info(TAG, 'RegistrationSurvivesManyNotifies_016 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('durable');
      source.registerDataChangeListener(listener);
      for (let index: number = 0; index < 10; index++) {
        source.notifyDataAdd(index);
      }
      const delivered: number = listener.eventCount();
      Logger.info(TAG, 'delivered=' + delivered);
      expect(delivered).assertEqual(10);
      expect(listener.kindAt(9)).assertEqual('add');
      expect(listener.indexAt(9)).assertEqual(9);
      expect(listener.kindSequence()).assertContain('add');
      Logger.info(TAG, 'RegistrationSurvivesManyNotifies_016 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_LIFECYCLE_1700
     * @tc.name SameListenerOnTwoSourcesReceivesBoth017
     * @tc.desc Verify same listener on two sources receives both
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SameListenerOnTwoSourcesReceivesBoth_017', 0, (): void => {
      Logger.info(TAG, 'SameListenerOnTwoSourcesReceivesBoth_017 begin');
      const firstSource: StringSource = new StringSource();
      const secondSource: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('shared');
      firstSource.registerDataChangeListener(listener);
      secondSource.registerDataChangeListener(listener);
      firstSource.notifyDataAdd(0);
      secondSource.notifyDataReload();
      const delivered: number = listener.eventCount();
      Logger.info(TAG, 'delivered=' + delivered);
      expect(delivered).assertEqual(2);
      expect(listener.kindSequence()).assertEqual('add|reload');
      expect(listener.indexAt(0)).assertEqual(0);
      expect(listener.kindAt(1)).assertEqual('reload');
      Logger.info(TAG, 'SameListenerOnTwoSourcesReceivesBoth_017 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_LIFECYCLE_1800
     * @tc.name UnregisterFromOneSourceKeepsOther018
     * @tc.desc Verify unregister from one source keeps other
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UnregisterFromOneSourceKeepsOther_018', 0, (): void => {
      Logger.info(TAG, 'UnregisterFromOneSourceKeepsOther_018 begin');
      const firstSource: StringSource = new StringSource();
      const secondSource: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('shared');
      firstSource.registerDataChangeListener(listener);
      secondSource.registerDataChangeListener(listener);
      firstSource.unregisterDataChangeListener(listener);
      firstSource.notifyDataAdd(0);
      expect(listener.eventCount()).assertEqual(0);
      secondSource.notifyDataAdd(1);
      const afterSecond: number = listener.eventCount();
      Logger.info(TAG, 'afterSecond=' + afterSecond);
      expect(afterSecond).assertEqual(1);
      expect(listener.indexAt(0)).assertEqual(1);
      firstSource.notifyDataReload();
      expect(listener.eventCount()).assertEqual(1);
      Logger.info(TAG, 'UnregisterFromOneSourceKeepsOther_018 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_LIFECYCLE_1900
     * @tc.name ResetOnlyAffectsTargetListener019
     * @tc.desc Verify reset only affects target listener
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ResetOnlyAffectsTargetListener_019', 0, (): void => {
      Logger.info(TAG, 'ResetOnlyAffectsTargetListener_019 begin');
      const source: StringSource = new StringSource();
      const first: RecordingListener = new RecordingListener('first');
      const second: RecordingListener = new RecordingListener('second');
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataAdd(0);
      first.reset();
      expect(first.eventCount()).assertEqual(0);
      const untouched: number = second.eventCount();
      Logger.info(TAG, 'untouched=' + untouched);
      expect(untouched).assertEqual(1);
      source.notifyDataAdd(1);
      expect(first.eventCount()).assertEqual(1);
      expect(second.eventCount()).assertEqual(2);
      Logger.info(TAG, 'ResetOnlyAffectsTargetListener_019 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_LIFECYCLE_2000
     * @tc.name EventCountAcrossMixedNotifications020
     * @tc.desc Verify event count across mixed notifications
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EventCountAcrossMixedNotifications_020', 0, (): void => {
      Logger.info(TAG, 'EventCountAcrossMixedNotifications_020 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('mixed');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      source.notifyDataDelete(1);
      source.notifyDataMove(2, 3);
      const delivered: number = listener.eventCount();
      Logger.info(TAG, 'delivered=' + delivered);
      expect(delivered).assertEqual(3);
      expect(listener.kindSequence()).assertEqual('add|delete|move');
      expect(listener.indexAt(2)).assertEqual(2);
      expect(listener.toIndexAt(2)).assertEqual(3);
      Logger.info(TAG, 'EventCountAcrossMixedNotifications_020 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_LIFECYCLE_2100
     * @tc.name DuplicateRegistrationAcrossResetKeepsSingle021
     * @tc.desc Verify duplicate registration across reset keeps single
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DuplicateRegistrationAcrossResetKeepsSingle_021', 0, (): void => {
      Logger.info(TAG, 'DuplicateRegistrationAcrossResetKeepsSingle_021 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('single');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      listener.reset();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(1);
      const delivered: number = listener.eventCount();
      Logger.info(TAG, 'delivered=' + delivered);
      expect(delivered).assertEqual(1);
      expect(listener.indexAt(0)).assertEqual(1);
      expect(listener.kindSequence()).assertEqual('add');
      Logger.info(TAG, 'DuplicateRegistrationAcrossResetKeepsSingle_021 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_LIFECYCLE_2200
     * @tc.name ListenerMigratesBetweenSources022
     * @tc.desc Verify listener migrates between sources
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ListenerMigratesBetweenSources_022', 0, (): void => {
      Logger.info(TAG, 'ListenerMigratesBetweenSources_022 begin');
      const oldSource: StringSource = new StringSource();
      const newSource: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('migrating');
      oldSource.registerDataChangeListener(listener);
      oldSource.unregisterDataChangeListener(listener);
      newSource.registerDataChangeListener(listener);
      oldSource.notifyDataAdd(0);
      expect(listener.eventCount()).assertEqual(0);
      newSource.notifyDataAdd(1);
      const delivered: number = listener.eventCount();
      Logger.info(TAG, 'delivered=' + delivered);
      expect(delivered).assertEqual(1);
      expect(listener.indexAt(0)).assertEqual(1);
      expect(listener.kindAt(0)).assertEqual('add');
      Logger.info(TAG, 'ListenerMigratesBetweenSources_022 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_LIFECYCLE_2300
     * @tc.name RegistrationSurvivesListenerChurn023
     * @tc.desc Verify registration survives listener churn
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RegistrationSurvivesListenerChurn_023', 0, (): void => {
      Logger.info(TAG, 'RegistrationSurvivesListenerChurn_023 begin');
      const source: StringSource = new StringSource();
      const stable: RecordingListener = new RecordingListener('stable');
      const noise: RecordingListener = new RecordingListener('noise');
      source.registerDataChangeListener(stable);
      for (let index: number = 0; index < 3; index++) {
        source.registerDataChangeListener(noise);
        source.unregisterDataChangeListener(noise);
      }
      source.notifyDataAdd(0);
      source.notifyDataAdd(1);
      const stableCount: number = stable.eventCount();
      Logger.info(TAG, 'stableCount=' + stableCount);
      expect(stableCount).assertEqual(2);
      expect(stable.indexAt(1)).assertEqual(1);
      expect(noise.isSilent()).assertTrue();
      Logger.info(TAG, 'RegistrationSurvivesListenerChurn_023 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_LIFECYCLE_2400
     * @tc.name KindsAfterResetReflectOnlyNewEvents024
     * @tc.desc Verify kinds after reset reflect only new events
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'KindsAfterResetReflectOnlyNewEvents_024', 0, (): void => {
      Logger.info(TAG, 'KindsAfterResetReflectOnlyNewEvents_024 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('reusable');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(1);
      listener.reset();
      source.notifyDataDelete(2);
      const sequence: string = listener.kindSequence();
      Logger.info(TAG, 'sequence=' + sequence);
      expect(sequence).assertEqual('delete');
      expect(listener.eventCount()).assertEqual(1);
      expect(listener.kindAt(0)).assertEqual('delete');
      expect(listener.indexAt(0)).assertEqual(2);
      Logger.info(TAG, 'KindsAfterResetReflectOnlyNewEvents_024 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_LIFECYCLE_2500
     * @tc.name SameListenerUnregisterBothSourcesSilent025
     * @tc.desc Verify same listener unregister both sources silent
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SameListenerUnregisterBothSourcesSilent_025', 0, (): void => {
      Logger.info(TAG, 'SameListenerUnregisterBothSourcesSilent_025 begin');
      const firstSource: StringSource = new StringSource();
      const secondSource: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('shared');
      firstSource.registerDataChangeListener(listener);
      secondSource.registerDataChangeListener(listener);
      firstSource.unregisterDataChangeListener(listener);
      secondSource.unregisterDataChangeListener(listener);
      firstSource.notifyDataReload();
      secondSource.notifyDataAdd(0);
      const silent: boolean = listener.isSilent();
      Logger.info(TAG, 'silent=' + JSON.stringify(silent));
      expect(silent).assertTrue();
      expect(listener.eventCount()).assertEqual(0);
      Logger.info(TAG, 'SameListenerUnregisterBothSourcesSilent_025 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_LIFECYCLE_2600
     * @tc.name ResetClearsPayloadFields026
     * @tc.desc Verify reset clears payload fields
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ResetClearsPayloadFields_026', 0, (): void => {
      Logger.info(TAG, 'ResetClearsPayloadFields_026 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('reusable');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(3);
      expect(listener.indexAt(0)).assertEqual(3);
      listener.reset();
      const clearedIndex: number = listener.indexAt(0);
      const clearedDestination: number = listener.toIndexAt(0);
      Logger.info(TAG, 'clearedIndex=' + clearedIndex + ', clearedDestination=' + clearedDestination);
      expect(clearedIndex).assertEqual(-1);
      expect(clearedDestination).assertEqual(-1);
      expect(listener.eventCount()).assertEqual(0);
      Logger.info(TAG, 'ResetClearsPayloadFields_026 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_LIFECYCLE_2700
     * @tc.name PerSourceDuplicateGuardKeepsSingle027
     * @tc.desc Verify per source duplicate guard keeps single
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PerSourceDuplicateGuardKeepsSingle_027', 0, (): void => {
      Logger.info(TAG, 'PerSourceDuplicateGuardKeepsSingle_027 begin');
      const firstSource: StringSource = new StringSource();
      const secondSource: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('shared');
      firstSource.registerDataChangeListener(listener);
      firstSource.registerDataChangeListener(listener);
      secondSource.registerDataChangeListener(listener);
      firstSource.notifyDataAdd(0);
      expect(listener.eventCount()).assertEqual(1);
      secondSource.notifyDataReload();
      const delivered: number = listener.eventCount();
      Logger.info(TAG, 'delivered=' + delivered);
      expect(delivered).assertEqual(2);
      expect(listener.kindSequence()).assertEqual('add|reload');
      expect(listener.indexAt(0)).assertEqual(0);
      Logger.info(TAG, 'PerSourceDuplicateGuardKeepsSingle_027 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_LIFECYCLE_2800
     * @tc.name ResetAfterUnregisterKeepsSilence028
     * @tc.desc Verify reset after unregister keeps silence
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ResetAfterUnregisterKeepsSilence_028', 0, (): void => {
      Logger.info(TAG, 'ResetAfterUnregisterKeepsSilence_028 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('reused');
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      listener.reset();
      source.notifyDataAdd(0);
      expect(listener.isSilent()).assertTrue();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(1);
      const delivered: number = listener.eventCount();
      Logger.info(TAG, 'delivered=' + delivered);
      expect(delivered).assertEqual(1);
      expect(listener.indexAt(0)).assertEqual(1);
      Logger.info(TAG, 'ResetAfterUnregisterKeepsSilence_028 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_LIFECYCLE_2900
     * @tc.name ResetTwiceIsIdempotent029
     * @tc.desc Verify reset twice is idempotent
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ResetTwiceIsIdempotent_029', 0, (): void => {
      Logger.info(TAG, 'ResetTwiceIsIdempotent_029 begin');
      const source: StringSource = new StringSource();
      const listener: RecordingListener = new RecordingListener('reusable');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      listener.reset();
      listener.reset();
      expect(listener.eventCount()).assertEqual(0);
      source.notifyDataReload();
      const delivered: number = listener.eventCount();
      Logger.info(TAG, 'delivered=' + delivered);
      expect(delivered).assertEqual(1);
      expect(listener.kindAt(0)).assertEqual('reload');
      Logger.info(TAG, 'ResetTwiceIsIdempotent_029 end');
    });
  });
}
