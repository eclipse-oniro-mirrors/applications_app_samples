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
 * Fan-out across several listeners.
 * A page may attach more than one observer to the same data source (the list
 * itself plus a diagnostics surface). These cases pin that each observer sees
 * the same arguments, in registration order, without interfering with peers,
 * and that two sources never leak notifications into each other.
 */
class ListSource extends BasicDataSource<string> {
  public rows: Array<string> = [];
  totalCount(): number {
    return this.rows.length;
  }
  getData(index: number): string {
    return this.rows[index];
  }
}
/**
 * Listener that appends its own tag to a shared trace, exposing the exact
 * interleaving of several listeners within one notification.
 */
class TaggedListener implements DataChangeListener {
  public tag: string;
  public trace: Array<string>;
  public lastIndex: number = -1;
  constructor(tag: string, trace: Array<string>) {
    this.tag = tag;
    this.trace = trace;
  }
  private mark(kind: string, index: number): void {
    this.lastIndex = index;
    this.trace.push(this.tag + ':' + kind + ':' + index);
  }
  onDataReloaded(): void {
    this.mark('reload', -1);
  }
  onDataAdd(index: number): void {
    this.mark('add', index);
  }
  onDataMove(from: number, to: number): void {
    this.mark('move', from);
  }
  onDataDelete(index: number): void {
    this.mark('delete', index);
  }
  onDataChange(index: number): void {
    this.mark('change', index);
  }
  onDatasetChange(dataOperations: DataOperation[]): void {
    this.mark('dataset', dataOperations.length);
  }
  onDataAdded(index: number): void {
    this.mark('added', index);
  }
  onDataMoved(from: number, to: number): void {
    this.mark('moved', from);
  }
  onDataDeleted(index: number): void {
    this.mark('deleted', index);
  }
  onDataChanged(index: number): void {
    this.mark('changed', index);
  }
}
export default function dataSourceFanoutTest() {
  describe('DataSourceFanoutTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FANOUT_0100
     * @tc.name TwoListenersInterleaveByRegistration001
     * @tc.desc Verify two listeners interleave by registration
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TwoListenersInterleaveByRegistration_001', 0, (): void => {
      Logger.info(TAG, 'TwoListenersInterleaveByRegistration_001 begin');
      const source: ListSource = new ListSource();
      const trace: Array<string> = [];
      const first: TaggedListener = new TaggedListener('A', trace);
      const second: TaggedListener = new TaggedListener('B', trace);
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataAdd(4);
      expect(trace.join('|')).assertEqual('A:add:4|B:add:4');
      Logger.info(TAG, 'TwoListenersInterleaveByRegistration_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FANOUT_0200
     * @tc.name ReverseRegistrationReversesTrace002
     * @tc.desc Verify reverse registration reverses trace
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ReverseRegistrationReversesTrace_002', 0, (): void => {
      Logger.info(TAG, 'ReverseRegistrationReversesTrace_002 begin');
      const source: ListSource = new ListSource();
      const trace: Array<string> = [];
      const first: TaggedListener = new TaggedListener('A', trace);
      const second: TaggedListener = new TaggedListener('B', trace);
      source.registerDataChangeListener(second);
      source.registerDataChangeListener(first);
      source.notifyDataAdd(1);
      expect(trace.join('|')).assertEqual('B:add:1|A:add:1');
      Logger.info(TAG, 'ReverseRegistrationReversesTrace_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FANOUT_0300
     * @tc.name ThreeListenersSameArguments003
     * @tc.desc Verify three listeners same arguments
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ThreeListenersSameArguments_003', 0, (): void => {
      Logger.info(TAG, 'ThreeListenersSameArguments_003 begin');
      const source: ListSource = new ListSource();
      const first: RecordingListener = new RecordingListener('one');
      const second: RecordingListener = new RecordingListener('two');
      const third: RecordingListener = new RecordingListener('three');
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.registerDataChangeListener(third);
      source.notifyDataMove(2, 9);
      const sameIndex: boolean = first.indexAt(0) === 2 && second.indexAt(0) === 2 && third.indexAt(0) === 2;
      Logger.info(TAG, 'sameIndex=' + JSON.stringify(sameIndex));
      expect(sameIndex).assertTrue();
      const sameTarget: boolean = first.toIndexAt(0) === 9 && second.toIndexAt(0) === 9 && third.toIndexAt(0) === 9;
      Logger.info(TAG, 'sameTarget=' + JSON.stringify(sameTarget));
      expect(sameTarget).assertTrue();
      Logger.info(TAG, 'ThreeListenersSameArguments_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FANOUT_0400
     * @tc.name FiveNotificationsTripleFanout004
     * @tc.desc Verify five notifications triple fanout
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FiveNotificationsTripleFanout_004', 0, (): void => {
      Logger.info(TAG, 'FiveNotificationsTripleFanout_004 begin');
      const source: ListSource = new ListSource();
      const first: RecordingListener = new RecordingListener('one');
      const second: RecordingListener = new RecordingListener('two');
      const third: RecordingListener = new RecordingListener('three');
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.registerDataChangeListener(third);
      for (let round: number = 0; round < 5; round++) {
        source.notifyDataChange(round);
      }
      expect(first.eventCount()).assertEqual(5);
      expect(second.eventCount()).assertEqual(5);
      expect(third.eventCount()).assertEqual(5);
      expect(first.indexAt(4)).assertEqual(4);
      Logger.info(TAG, 'FiveNotificationsTripleFanout_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FANOUT_0500
     * @tc.name RoundOrderKeepsGroups005
     * @tc.desc Verify round order keeps groups
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RoundOrderKeepsGroups_005', 0, (): void => {
      Logger.info(TAG, 'RoundOrderKeepsGroups_005 begin');
      const source: ListSource = new ListSource();
      const trace: Array<string> = [];
      source.registerDataChangeListener(new TaggedListener('A', trace));
      source.registerDataChangeListener(new TaggedListener('B', trace));
      source.notifyDataAdd(0);
      source.notifyDataAdd(1);
      expect(trace.join('|')).assertEqual('A:add:0|B:add:0|A:add:1|B:add:1');
      Logger.info(TAG, 'RoundOrderKeepsGroups_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FANOUT_0600
     * @tc.name TwentyListenersAllServed006
     * @tc.desc Verify twenty listeners all served
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TwentyListenersAllServed_006', 0, (): void => {
      Logger.info(TAG, 'TwentyListenersAllServed_006 begin');
      const source: ListSource = new ListSource();
      let listeners: Array<RecordingListener> = [];
      for (let index: number = 0; index < 20; index++) {
        const listener: RecordingListener = new RecordingListener('peer_' + index);
        listeners.push(listener);
        source.registerDataChangeListener(listener);
      }
      source.notifyDataReload();
      let served: number = 0;
      for (let index: number = 0; index < listeners.length; index++) {
        if (listeners[index].eventCount() === 1) {
          served += 1;
        }
      }
      expect(served).assertEqual(20);
      Logger.info(TAG, 'TwentyListenersAllServed_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FANOUT_0700
     * @tc.name MiddleUnregisterKeepsOrder007
     * @tc.desc Verify middle unregister keeps order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MiddleUnregisterKeepsOrder_007', 0, (): void => {
      Logger.info(TAG, 'MiddleUnregisterKeepsOrder_007 begin');
      const source: ListSource = new ListSource();
      const trace: Array<string> = [];
      const first: TaggedListener = new TaggedListener('A', trace);
      const middle: TaggedListener = new TaggedListener('B', trace);
      const last: TaggedListener = new TaggedListener('C', trace);
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(middle);
      source.registerDataChangeListener(last);
      source.unregisterDataChangeListener(middle);
      source.notifyDataAdd(2);
      expect(trace.join('|')).assertEqual('A:add:2|C:add:2');
      Logger.info(TAG, 'MiddleUnregisterKeepsOrder_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FANOUT_0800
     * @tc.name ReRegisterMovesToEnd008
     * @tc.desc Verify re register moves to end
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ReRegisterMovesToEnd_008', 0, (): void => {
      Logger.info(TAG, 'ReRegisterMovesToEnd_008 begin');
      const source: ListSource = new ListSource();
      const trace: Array<string> = [];
      const first: TaggedListener = new TaggedListener('A', trace);
      const second: TaggedListener = new TaggedListener('B', trace);
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.unregisterDataChangeListener(first);
      source.registerDataChangeListener(first);
      source.notifyDataAdd(0);
      expect(trace.join('|')).assertEqual('B:add:0|A:add:0');
      Logger.info(TAG, 'ReRegisterMovesToEnd_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FANOUT_0900
     * @tc.name SameLabelListenersAreDistinct009
     * @tc.desc Verify same label listeners are distinct, as covered by the data source fanout test suite
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SameLabelListenersAreDistinct_009', 0, (): void => {
      Logger.info(TAG, 'SameLabelListenersAreDistinct_009 begin');
      const source: ListSource = new ListSource();
      const left: RecordingListener = new RecordingListener('same');
      const right: RecordingListener = new RecordingListener('same');
      source.registerDataChangeListener(left);
      source.registerDataChangeListener(right);
      source.notifyDataAdd(3);
      expect(left.eventCount()).assertEqual(1);
      expect(right.eventCount()).assertEqual(1);
      const separate: boolean = left !== right;
      Logger.info(TAG, 'separate=' + JSON.stringify(separate));
      expect(separate).assertTrue();
      Logger.info(TAG, 'SameLabelListenersAreDistinct_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FANOUT_1000
     * @tc.name ListenerResetDoesNotAffectPeer010
     * @tc.desc Verify listener reset does not affect peer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ListenerResetDoesNotAffectPeer_010', 0, (): void => {
      Logger.info(TAG, 'ListenerResetDoesNotAffectPeer_010 begin');
      const source: ListSource = new ListSource();
      const first: RecordingListener = new RecordingListener('one');
      const second: RecordingListener = new RecordingListener('two');
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataAdd(0);
      source.notifyDataAdd(1);
      first.reset();
      const check01: boolean = first.isSilent() && second.eventCount() === 2;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'ListenerResetDoesNotAffectPeer_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FANOUT_1100
     * @tc.name TwoSourcesDoNotCrossNotify011
     * @tc.desc Verify two sources do not cross notify
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TwoSourcesDoNotCrossNotify_011', 0, (): void => {
      Logger.info(TAG, 'TwoSourcesDoNotCrossNotify_011 begin');
      const left: ListSource = new ListSource();
      const right: ListSource = new ListSource();
      const leftListener: RecordingListener = new RecordingListener('left');
      const rightListener: RecordingListener = new RecordingListener('right');
      left.registerDataChangeListener(leftListener);
      right.registerDataChangeListener(rightListener);
      left.notifyDataAdd(0);
      const isolated: boolean = leftListener.eventCount() === 1 && rightListener.isSilent();
      Logger.info(TAG, 'isolated=' + JSON.stringify(isolated));
      expect(isolated).assertTrue();
      right.notifyDataAdd(0);
      expect(leftListener.eventCount()).assertEqual(1);
      expect(rightListener.eventCount()).assertEqual(1);
      Logger.info(TAG, 'TwoSourcesDoNotCrossNotify_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FANOUT_1200
     * @tc.name SharedListenerServesBothSources012
     * @tc.desc Verify shared listener serves both sources
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SharedListenerServesBothSources_012', 0, (): void => {
      Logger.info(TAG, 'SharedListenerServesBothSources_012 begin');
      const left: ListSource = new ListSource();
      const right: ListSource = new ListSource();
      const shared: RecordingListener = new RecordingListener('shared');
      left.registerDataChangeListener(shared);
      right.registerDataChangeListener(shared);
      left.notifyDataAdd(1);
      right.notifyDataAdd(2);
      expect(shared.eventCount()).assertEqual(2);
      expect(shared.indexAt(0)).assertEqual(1);
      expect(shared.indexAt(1)).assertEqual(2);
      Logger.info(TAG, 'SharedListenerServesBothSources_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FANOUT_1300
     * @tc.name UnregisterOneSourceKeepsOther013
     * @tc.desc Verify unregister one source keeps other
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UnregisterOneSourceKeepsOther_013', 0, (): void => {
      Logger.info(TAG, 'UnregisterOneSourceKeepsOther_013 begin');
      const left: ListSource = new ListSource();
      const right: ListSource = new ListSource();
      const shared: RecordingListener = new RecordingListener('shared');
      left.registerDataChangeListener(shared);
      right.registerDataChangeListener(shared);
      left.unregisterDataChangeListener(shared);
      left.notifyDataAdd(0);
      right.notifyDataAdd(1);
      expect(shared.eventCount()).assertEqual(1);
      expect(shared.indexAt(0)).assertEqual(1);
      Logger.info(TAG, 'UnregisterOneSourceKeepsOther_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FANOUT_1400
     * @tc.name ZeroListenersNotifyIsSilent014
     * @tc.desc Verify zero listeners notify is silent
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ZeroListenersNotifyIsSilent_014', 0, (): void => {
      Logger.info(TAG, 'ZeroListenersNotifyIsSilent_014 begin');
      const source: ListSource = new ListSource();
      let threw: boolean = false;
      try {
        source.notifyDataReload();
        source.notifyDataChange(2);
      }
      catch (error) {
        threw = true;
      }
      const check01: boolean = threw === false;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'ZeroListenersNotifyIsSilent_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FANOUT_1500
     * @tc.name PeerSeesDiscriminatingFields015
     * @tc.desc Verify peer sees discriminating fields
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PeerSeesDiscriminatingFields_015', 0, (): void => {
      Logger.info(TAG, 'PeerSeesDiscriminatingFields_015 begin');
      const source: ListSource = new ListSource();
      const first: RecordingListener = new RecordingListener('one');
      const second: RecordingListener = new RecordingListener('two');
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataDelete(6);
      expect(first.kindAt(0)).assertEqual('delete');
      expect(second.kindAt(0)).assertEqual('delete');
      expect(first.indexAt(0)).assertEqual(6);
      expect(second.indexAt(0)).assertEqual(6);
      Logger.info(TAG, 'PeerSeesDiscriminatingFields_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FANOUT_1600
     * @tc.name FanoutSurvivesDataMutation016
     * @tc.desc Verify fanout survives data mutation
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FanoutSurvivesDataMutation_016', 0, (): void => {
      Logger.info(TAG, 'FanoutSurvivesDataMutation_016 begin');
      const source: ListSource = new ListSource();
      const first: RecordingListener = new RecordingListener('one');
      const second: RecordingListener = new RecordingListener('two');
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.rows = ['a', 'b', 'c'];
      source.notifyDataAdd(source.totalCount() - 1);
      expect(first.indexAt(0)).assertEqual(2);
      expect(second.indexAt(0)).assertEqual(2);
      Logger.info(TAG, 'FanoutSurvivesDataMutation_016 end');
    });
  });
}
