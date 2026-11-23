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
import { CommentData } from 'publishmultimediaupdate/src/main/ets/model/BasicDataSource';
import { FriendMoment } from 'publishmultimediaupdate/src/main/ets/model/BasicDataSource';
import { BUNDLE, TAG } from '../common/TestConstant';
import { RecordingListener } from '../common/RecordingListener';
import { buildMoment } from '../common/DataFactory';
/**
 * Listener that appends its label to a shared sink before recording the event.
 * RecordingListener alone keeps per-listener order only, so this subclass makes
 * the cross-listener delivery order observable without a second helper file.
 */
class OrderedProbeListener extends RecordingListener {
  private sharedOrder: Array<string>;
  constructor(label: string, sharedOrder: Array<string>) {
    super(label);
    this.sharedOrder = sharedOrder;
  }
  onDataAdd(index: number): void {
    this.sharedOrder.push(this.label);
    super.onDataAdd(index);
  }
}
/**
 * Notification sequence of the CommentData lazy list source.
 * The list only inserts rows, therefore every write must be announced as a
 * single add event at the affected position and never as a reload or move.
 */
export default function commentDataSequenceTest() {
  describe('CommentDataSequenceTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_0100
     * @tc.name PushOnEmptyEmitsAddAtZero001
     * @tc.desc Verify push on empty emits add at zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PushOnEmptyEmitsAddAtZero_001', 0, (): void => {
      Logger.info(TAG, 'PushOnEmptyEmitsAddAtZero_001 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('primary');
      source.registerDataChangeListener(listener);
      source.pushData(buildMoment('seq-9110', 'Author', 'first'));
      expect(listener.eventCount()).assertEqual(1);
      expect(listener.kindAt(0)).assertEqual('add');
      expect(listener.indexAt(0)).assertEqual(0);
      Logger.info(TAG, 'PushOnEmptyEmitsAddAtZero_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_0200
     * @tc.name SecondPushEmitsIndexOne002
     * @tc.desc Verify second push emits index one
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SecondPushEmitsIndexOne_002', 0, (): void => {
      Logger.info(TAG, 'SecondPushEmitsIndexOne_002 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('primary');
      source.registerDataChangeListener(listener);
      source.pushData(buildMoment('seq-9120', 'Author', 'first'));
      source.pushData(buildMoment('seq-9121', 'Author', 'second'));
      expect(listener.eventCount()).assertEqual(2);
      expect(listener.indexAt(0)).assertEqual(0);
      expect(listener.indexAt(1)).assertEqual(1);
      expect(listener.kindSequence()).assertEqual('add|add');
      Logger.info(TAG, 'SecondPushEmitsIndexOne_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_0300
     * @tc.name AddFirstAfterTwoPushesEmitsZero003
     * @tc.desc Verify add first after two pushes emits zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AddFirstAfterTwoPushesEmitsZero_003', 0, (): void => {
      Logger.info(TAG, 'AddFirstAfterTwoPushesEmitsZero_003 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('primary');
      source.registerDataChangeListener(listener);
      source.pushData(buildMoment('seq-9130', 'Author', 'first'));
      source.pushData(buildMoment('seq-9131', 'Author', 'second'));
      source.addDataFirst(buildMoment('seq-9132', 'Author', 'front'));
      expect(listener.eventCount()).assertEqual(3);
      expect(listener.kindAt(2)).assertEqual('add');
      expect(listener.indexAt(2)).assertEqual(0);
      expect(listener.kindSequence()).assertEqual('add|add|add');
      Logger.info(TAG, 'AddFirstAfterTwoPushesEmitsZero_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_0400
     * @tc.name PushThenAddFirstIndices004
     * @tc.desc Verify push then add first indices
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PushThenAddFirstIndices_004', 0, (): void => {
      Logger.info(TAG, 'PushThenAddFirstIndices_004 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('primary');
      source.registerDataChangeListener(listener);
      source.pushData(buildMoment('seq-9140', 'Author', 'pushed'));
      source.addDataFirst(buildMoment('seq-9141', 'Author', 'prepended'));
      expect(listener.eventCount()).assertEqual(2);
      expect(listener.indexAt(0)).assertEqual(0);
      expect(listener.indexAt(1)).assertEqual(0);
      const check01: boolean = listener.indexAt(0) === 0 && listener.indexAt(1) === 0;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'PushThenAddFirstIndices_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_0500
     * @tc.name InterleavedPushAddFirstPush005
     * @tc.desc Verify interleaved push add first push
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'InterleavedPushAddFirstPush_005', 0, (): void => {
      Logger.info(TAG, 'InterleavedPushAddFirstPush_005 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('primary');
      source.registerDataChangeListener(listener);
      source.pushData(buildMoment('seq-9150', 'Author', 'one'));
      source.addDataFirst(buildMoment('seq-9151', 'Author', 'two'));
      source.pushData(buildMoment('seq-9152', 'Author', 'three'));
      expect(listener.eventCount()).assertEqual(3);
      expect(listener.indexAt(0)).assertEqual(0);
      expect(listener.indexAt(1)).assertEqual(0);
      expect(listener.indexAt(2)).assertEqual(2);
      Logger.info(TAG, 'InterleavedPushAddFirstPush_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_0600
     * @tc.name AddFirstAlwaysZeroOnEmpty006
     * @tc.desc Verify add first always zero on empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AddFirstAlwaysZeroOnEmpty_006', 0, (): void => {
      Logger.info(TAG, 'AddFirstAlwaysZeroOnEmpty_006 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('primary');
      source.registerDataChangeListener(listener);
      for (let index: number = 0; index < 5; index++) {
        source.addDataFirst(buildMoment('seq-9160-' + index, 'Author', 'row ' + index));
      }
      expect(listener.eventCount()).assertEqual(5);
      let zeroCount: number = 0;
      for (let position: number = 0; position < 5; position++) {
        if (listener.indexAt(position) === 0) {
          zeroCount += 1;
        }
      }
      expect(zeroCount).assertEqual(5);
      Logger.info(TAG, 'AddFirstAlwaysZeroOnEmpty_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_0700
     * @tc.name ThreePushesThenTwoAddFirstIndices007
     * @tc.desc Verify three pushes then two add first indices
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ThreePushesThenTwoAddFirstIndices_007', 0, (): void => {
      Logger.info(TAG, 'ThreePushesThenTwoAddFirstIndices_007 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('primary');
      source.registerDataChangeListener(listener);
      for (let index: number = 0; index < 3; index++) {
        source.pushData(buildMoment('seq-9170-' + index, 'Author', 'push ' + index));
      }
      source.addDataFirst(buildMoment('seq-9170-front-a', 'Author', 'front a'));
      source.addDataFirst(buildMoment('seq-9170-front-b', 'Author', 'front b'));
      const expected: Array<number> = [0, 1, 2, 0, 0];
      let matched: number = 0;
      for (let position: number = 0; position < expected.length; position++) {
        if (listener.indexAt(position) === expected[position]) {
          matched += 1;
        }
      }
      expect(listener.eventCount()).assertEqual(5);
      expect(matched).assertEqual(5);
      Logger.info(TAG, 'ThreePushesThenTwoAddFirstIndices_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_0800
     * @tc.name OnlyAddKindEmitted008
     * @tc.desc Verify only add kind emitted
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'OnlyAddKindEmitted_008', 0, (): void => {
      Logger.info(TAG, 'OnlyAddKindEmitted_008 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('primary');
      source.registerDataChangeListener(listener);
      source.pushData(buildMoment('seq-9180', 'Author', 'one'));
      source.addDataFirst(buildMoment('seq-9181', 'Author', 'two'));
      source.pushData(buildMoment('seq-9182', 'Author', 'three'));
      source.addDataFirst(buildMoment('seq-9183', 'Author', 'four'));
      source.addDataFirst(buildMoment('seq-9184', 'Author', 'five'));
      source.pushData(buildMoment('seq-9185', 'Author', 'six'));
      expect(listener.kindSequence()).assertEqual('add|add|add|add|add|add');
      expect(listener.kindAt(0)).assertEqual('add');
      expect(listener.kindAt(5)).assertEqual('add');
      Logger.info(TAG, 'OnlyAddKindEmitted_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_0900
     * @tc.name OneEventPerOperation009
     * @tc.desc Verify one event per operation
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'OneEventPerOperation_009', 0, (): void => {
      Logger.info(TAG, 'OneEventPerOperation_009 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('primary');
      source.registerDataChangeListener(listener);
      let operations: number = 0;
      for (let index: number = 0; index < 6; index++) {
        source.pushData(buildMoment('seq-9190-push-' + index, 'Author', 'push ' + index));
        operations += 1;
        source.addDataFirst(buildMoment('seq-9190-front-' + index, 'Author', 'front ' + index));
        operations += 1;
      }
      expect(operations).assertEqual(12);
      expect(listener.eventCount()).assertEqual(12);
      const check01: boolean = listener.eventCount() === operations;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'OneEventPerOperation_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_1000
     * @tc.name TwoListenersBothNotified010
     * @tc.desc Verify two listeners both notified
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TwoListenersBothNotified_010', 0, (): void => {
      Logger.info(TAG, 'TwoListenersBothNotified_010 begin');
      const source: CommentData = new CommentData();
      const first: RecordingListener = new RecordingListener('first');
      const second: RecordingListener = new RecordingListener('second');
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.pushData(buildMoment('seq-9200', 'Author', 'shared'));
      expect(first.eventCount()).assertEqual(1);
      expect(second.eventCount()).assertEqual(1);
      expect(first.indexAt(0)).assertEqual(0);
      expect(second.indexAt(0)).assertEqual(0);
      const check01: boolean = second.eventCount() === first.eventCount();
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'TwoListenersBothNotified_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_1100
     * @tc.name BothListenersSameSequence011
     * @tc.desc Verify both listeners same sequence
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'BothListenersSameSequence_011', 0, (): void => {
      Logger.info(TAG, 'BothListenersSameSequence_011 begin');
      const source: CommentData = new CommentData();
      const first: RecordingListener = new RecordingListener('first');
      const second: RecordingListener = new RecordingListener('second');
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.pushData(buildMoment('seq-9210', 'Author', 'one'));
      source.addDataFirst(buildMoment('seq-9211', 'Author', 'two'));
      source.pushData(buildMoment('seq-9212', 'Author', 'three'));
      expect(first.kindSequence()).assertEqual('add|add|add');
      expect(second.kindSequence()).assertEqual(first.kindSequence());
      const check01: boolean = first.indexAt(2) === second.indexAt(2);
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'BothListenersSameSequence_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_1200
     * @tc.name ListenersNotifiedInRegistrationOrder012
     * @tc.desc Verify listeners notified in registration order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ListenersNotifiedInRegistrationOrder_012', 0, (): void => {
      Logger.info(TAG, 'ListenersNotifiedInRegistrationOrder_012 begin');
      const source: CommentData = new CommentData();
      const order: Array<string> = [];
      const alpha: OrderedProbeListener = new OrderedProbeListener('alpha', order);
      const beta: OrderedProbeListener = new OrderedProbeListener('beta', order);
      source.registerDataChangeListener(alpha);
      source.registerDataChangeListener(beta);
      source.pushData(buildMoment('seq-9220', 'Author', 'ordered'));
      expect(order.length).assertEqual(2);
      expect(order[0]).assertEqual('alpha');
      expect(order[1]).assertEqual('beta');
      expect(alpha.eventCount()).assertEqual(1);
      expect(beta.eventCount()).assertEqual(1);
      Logger.info(TAG, 'ListenersNotifiedInRegistrationOrder_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_1300
     * @tc.name FiveAddFirstReversedOrder013
     * @tc.desc Verify five add first reversed order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FiveAddFirstReversedOrder_013', 0, (): void => {
      Logger.info(TAG, 'FiveAddFirstReversedOrder_013 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('primary');
      source.registerDataChangeListener(listener);
      for (let index: number = 0; index < 5; index++) {
        source.addDataFirst(buildMoment('seq-9230-' + index, 'Author', 'row ' + index));
      }
      expect(source.totalCount()).assertEqual(5);
      expect(source.getData(0).id).assertEqual('seq-9230-4');
      expect(source.getData(4).id).assertEqual('seq-9230-0');
      const check01: boolean = source.getData(0).id === 'seq-9230-4' && listener.eventCount() === 5;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'FiveAddFirstReversedOrder_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_1400
     * @tc.name EarlierEventIndicesUnchanged014
     * @tc.desc Verify earlier event indices unchanged
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EarlierEventIndicesUnchanged_014', 0, (): void => {
      Logger.info(TAG, 'EarlierEventIndicesUnchanged_014 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('primary');
      source.registerDataChangeListener(listener);
      source.pushData(buildMoment('seq-9240', 'Author', 'one'));
      source.pushData(buildMoment('seq-9241', 'Author', 'two'));
      source.addDataFirst(buildMoment('seq-9242', 'Author', 'front'));
      expect(listener.eventCount()).assertEqual(3);
      expect(listener.indexAt(0)).assertEqual(0);
      expect(listener.indexAt(1)).assertEqual(1);
      const check01: boolean = listener.indexAt(2) === 0;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'EarlierEventIndicesUnchanged_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_1500
     * @tc.name CountEqualsEventCount015
     * @tc.desc Verify count equals event count
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'CountEqualsEventCount_015', 0, (): void => {
      Logger.info(TAG, 'CountEqualsEventCount_015 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('primary');
      source.registerDataChangeListener(listener);
      let matched: number = 0;
      for (let index: number = 0; index < 8; index++) {
        if (index % 2 === 0) {
          source.pushData(buildMoment('seq-9250-push-' + index, 'Author', 'push ' + index));
        }
        else {
          source.addDataFirst(buildMoment('seq-9250-front-' + index, 'Author', 'front ' + index));
        }
        if (source.totalCount() === listener.eventCount()) {
          matched += 1;
        }
      }
      expect(matched).assertEqual(8);
      expect(source.totalCount()).assertEqual(8);
      Logger.info(TAG, 'CountEqualsEventCount_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_1600
     * @tc.name AddFirstOnPopulatedNotifiesZero016
     * @tc.desc Verify add first on populated notifies zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AddFirstOnPopulatedNotifiesZero_016', 0, (): void => {
      Logger.info(TAG, 'AddFirstOnPopulatedNotifiesZero_016 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('primary');
      source.registerDataChangeListener(listener);
      for (let index: number = 0; index < 3; index++) {
        source.pushData(buildMoment('seq-9260-base-' + index, 'Author', 'base ' + index));
      }
      for (let index: number = 0; index < 3; index++) {
        source.addDataFirst(buildMoment('seq-9260-front-' + index, 'Author', 'front ' + index));
      }
      expect(listener.eventCount()).assertEqual(6);
      expect(listener.indexAt(3)).assertEqual(0);
      expect(listener.indexAt(4)).assertEqual(0);
      expect(listener.indexAt(5)).assertEqual(0);
      Logger.info(TAG, 'AddFirstOnPopulatedNotifiesZero_016 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_1700
     * @tc.name AddEventHasNoDestination017
     * @tc.desc Verify add event has no destination
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AddEventHasNoDestination_017', 0, (): void => {
      Logger.info(TAG, 'AddEventHasNoDestination_017 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('primary');
      source.registerDataChangeListener(listener);
      source.pushData(buildMoment('seq-9270', 'Author', 'row'));
      expect(listener.toIndexAt(0)).assertEqual(-1);
      const check01: boolean = listener.toIndexAt(0) === -1;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'AddEventHasNoDestination_017 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_1800
     * @tc.name AddEventCarriesSingleOperand018
     * @tc.desc Verify add event carries single operand
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AddEventCarriesSingleOperand_018', 0, (): void => {
      Logger.info(TAG, 'AddEventCarriesSingleOperand_018 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('primary');
      source.registerDataChangeListener(listener);
      source.addDataFirst(buildMoment('seq-9280', 'Author', 'row'));
      expect(listener.operandCountAt(0)).assertEqual(1);
      const check01: boolean = listener.operandCountAt(0) === 1;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'AddEventCarriesSingleOperand_018 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_1900
     * @tc.name RegistrationEmitsNothing019
     * @tc.desc Verify registration emits nothing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RegistrationEmitsNothing_019', 0, (): void => {
      Logger.info(TAG, 'RegistrationEmitsNothing_019 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('primary');
      source.registerDataChangeListener(listener);
      expect(listener.eventCount()).assertEqual(0);
      const check01: boolean = listener.isSilent();
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(source.totalCount()).assertEqual(0);
      Logger.info(TAG, 'RegistrationEmitsNothing_019 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_2000
     * @tc.name UnregisterStopsNotifications020
     * @tc.desc Verify unregister stops notifications
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UnregisterStopsNotifications_020', 0, (): void => {
      Logger.info(TAG, 'UnregisterStopsNotifications_020 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('primary');
      source.registerDataChangeListener(listener);
      source.pushData(buildMoment('seq-9300', 'Author', 'seen'));
      source.unregisterDataChangeListener(listener);
      source.pushData(buildMoment('seq-9301', 'Author', 'unseen'));
      expect(listener.eventCount()).assertEqual(1);
      const check01: boolean = listener.eventCount() === 2;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      expect(source.totalCount()).assertEqual(2);
      Logger.info(TAG, 'UnregisterStopsNotifications_020 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_2100
     * @tc.name ReRegisterSameListenerDeduplicated021
     * @tc.desc Verify re register same listener deduplicated
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ReRegisterSameListenerDeduplicated_021', 0, (): void => {
      Logger.info(TAG, 'ReRegisterSameListenerDeduplicated_021 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('primary');
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.pushData(buildMoment('seq-9310', 'Author', 'once'));
      expect(listener.eventCount()).assertEqual(1);
      const check01: boolean = listener.eventCount() === 1;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(listener.indexAt(0)).assertEqual(0);
      Logger.info(TAG, 'ReRegisterSameListenerDeduplicated_021 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_2200
     * @tc.name OneListenerTwoSources022
     * @tc.desc Verify one listener two sources
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'OneListenerTwoSources_022', 0, (): void => {
      Logger.info(TAG, 'OneListenerTwoSources_022 begin');
      const first: CommentData = new CommentData();
      const second: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('shared');
      first.registerDataChangeListener(listener);
      second.registerDataChangeListener(listener);
      first.pushData(buildMoment('seq-9320-a', 'Author', 'from first'));
      second.pushData(buildMoment('seq-9321-b', 'Author', 'from second'));
      expect(listener.eventCount()).assertEqual(2);
      expect(listener.indexAt(0)).assertEqual(0);
      expect(listener.indexAt(1)).assertEqual(0);
      const check01: boolean = listener.kindSequence() === 'add|add';
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'OneListenerTwoSources_022 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_2300
     * @tc.name ListenerIgnoresUnboundSource023
     * @tc.desc Verify listener ignores unbound source
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ListenerIgnoresUnboundSource_023', 0, (): void => {
      Logger.info(TAG, 'ListenerIgnoresUnboundSource_023 begin');
      const watched: CommentData = new CommentData();
      const other: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('watched');
      watched.registerDataChangeListener(listener);
      other.pushData(buildMoment('seq-9330', 'Author', 'other source'));
      expect(listener.eventCount()).assertEqual(0);
      const check01: boolean = listener.isSilent();
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      watched.pushData(buildMoment('seq-9331', 'Author', 'watched source'));
      expect(listener.eventCount()).assertEqual(1);
      Logger.info(TAG, 'ListenerIgnoresUnboundSource_023 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_2400
     * @tc.name ReadsEmitNoEvents024
     * @tc.desc Verify reads emit no events
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ReadsEmitNoEvents_024', 0, (): void => {
      Logger.info(TAG, 'ReadsEmitNoEvents_024 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('primary');
      source.registerDataChangeListener(listener);
      source.pushData(buildMoment('seq-9340', 'Author', 'one'));
      const before: number = listener.eventCount();
      for (let round: number = 0; round < 5; round++) {
        source.getData(0);
        source.getData(-1);
        source.totalCount();
      }
      const after: number = listener.eventCount();
      expect(before).assertEqual(1);
      expect(after).assertEqual(1);
      const check01: boolean = before === after;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'ReadsEmitNoEvents_024 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_2500
     * @tc.name HundredPushesIndices025
     * @tc.desc Verify hundred pushes indices
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'HundredPushesIndices_025', 0, (): void => {
      Logger.info(TAG, 'HundredPushesIndices_025 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('primary');
      source.registerDataChangeListener(listener);
      for (let index: number = 0; index < 100; index++) {
        source.pushData(buildMoment('seq-9350-' + index, 'Author', 'row ' + index));
      }
      expect(listener.eventCount()).assertEqual(100);
      expect(listener.indexAt(0)).assertEqual(0);
      expect(listener.indexAt(50)).assertEqual(50);
      expect(listener.indexAt(99)).assertEqual(99);
      Logger.info(TAG, 'HundredPushesIndices_025 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_2600
     * @tc.name AddFirstThenPushIndices026
     * @tc.desc Verify add first then push indices
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AddFirstThenPushIndices_026', 0, (): void => {
      Logger.info(TAG, 'AddFirstThenPushIndices_026 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('primary');
      source.registerDataChangeListener(listener);
      source.addDataFirst(buildMoment('seq-9360', 'Author', 'front'));
      source.pushData(buildMoment('seq-9361', 'Author', 'back'));
      expect(listener.eventCount()).assertEqual(2);
      expect(listener.indexAt(0)).assertEqual(0);
      expect(listener.indexAt(1)).assertEqual(1);
      expect(source.getData(0).id).assertEqual('seq-9360');
      expect(source.getData(1).id).assertEqual('seq-9361');
      Logger.info(TAG, 'AddFirstThenPushIndices_026 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_2700
     * @tc.name PushPushAddFirstPushPush027
     * @tc.desc Verify push push add first push push
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PushPushAddFirstPushPush_027', 0, (): void => {
      Logger.info(TAG, 'PushPushAddFirstPushPush_027 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('primary');
      source.registerDataChangeListener(listener);
      source.pushData(buildMoment('seq-9370-a', 'Author', 'a'));
      source.pushData(buildMoment('seq-9371-b', 'Author', 'b'));
      source.addDataFirst(buildMoment('seq-9372-c', 'Author', 'c'));
      source.pushData(buildMoment('seq-9373-d', 'Author', 'd'));
      source.pushData(buildMoment('seq-9374-e', 'Author', 'e'));
      const expected: Array<number> = [0, 1, 0, 3, 4];
      let matched: number = 0;
      for (let position: number = 0; position < expected.length; position++) {
        if (listener.indexAt(position) === expected[position]) {
          matched += 1;
        }
      }
      expect(listener.eventCount()).assertEqual(5);
      expect(matched).assertEqual(5);
      Logger.info(TAG, 'PushPushAddFirstPushPush_027 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_2800
     * @tc.name AlternatingTenOpsIndices028
     * @tc.desc Verify alternating ten ops indices
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AlternatingTenOpsIndices_028', 0, (): void => {
      Logger.info(TAG, 'AlternatingTenOpsIndices_028 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('primary');
      source.registerDataChangeListener(listener);
      for (let index: number = 0; index < 5; index++) {
        source.pushData(buildMoment('seq-9380-push-' + index, 'Author', 'push ' + index));
        source.addDataFirst(buildMoment('seq-9380-front-' + index, 'Author', 'front ' + index));
      }
      const expected: Array<number> = [0, 0, 2, 0, 4, 0, 6, 0, 8, 0];
      let matched: number = 0;
      for (let position: number = 0; position < expected.length; position++) {
        if (listener.indexAt(position) === expected[position]) {
          matched += 1;
        }
      }
      expect(listener.eventCount()).assertEqual(10);
      expect(matched).assertEqual(10);
      Logger.info(TAG, 'AlternatingTenOpsIndices_028 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_2900
     * @tc.name SecondListenerLateRegistration029
     * @tc.desc Verify second listener late registration
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SecondListenerLateRegistration_029', 0, (): void => {
      Logger.info(TAG, 'SecondListenerLateRegistration_029 begin');
      const source: CommentData = new CommentData();
      const early: RecordingListener = new RecordingListener('early');
      const late: RecordingListener = new RecordingListener('late');
      source.registerDataChangeListener(early);
      source.pushData(buildMoment('seq-9390-a', 'Author', 'a'));
      source.pushData(buildMoment('seq-9391-b', 'Author', 'b'));
      source.registerDataChangeListener(late);
      expect(late.eventCount()).assertEqual(0);
      source.pushData(buildMoment('seq-9392-c', 'Author', 'c'));
      expect(early.eventCount()).assertEqual(3);
      expect(late.eventCount()).assertEqual(1);
      expect(late.indexAt(0)).assertEqual(2);
      const check01: boolean = late.eventCount() === 1;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'SecondListenerLateRegistration_029 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_3000
     * @tc.name UnregisterOneOfTwoKeepsOther030
     * @tc.desc Verify unregister one of two keeps other
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UnregisterOneOfTwoKeepsOther_030', 0, (): void => {
      Logger.info(TAG, 'UnregisterOneOfTwoKeepsOther_030 begin');
      const source: CommentData = new CommentData();
      const removed: RecordingListener = new RecordingListener('removed');
      const kept: RecordingListener = new RecordingListener('kept');
      source.registerDataChangeListener(removed);
      source.registerDataChangeListener(kept);
      source.unregisterDataChangeListener(removed);
      source.pushData(buildMoment('seq-9400', 'Author', 'row'));
      expect(removed.eventCount()).assertEqual(0);
      expect(kept.eventCount()).assertEqual(1);
      const check01: boolean = removed.isSilent() && kept.eventCount() === 1;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'UnregisterOneOfTwoKeepsOther_030 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_3100
     * @tc.name ReRegisterAfterUnregisterResumes031
     * @tc.desc Verify re register after unregister resumes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ReRegisterAfterUnregisterResumes_031', 0, (): void => {
      Logger.info(TAG, 'ReRegisterAfterUnregisterResumes_031 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('primary');
      source.registerDataChangeListener(listener);
      source.pushData(buildMoment('seq-9410-a', 'Author', 'a'));
      source.unregisterDataChangeListener(listener);
      source.pushData(buildMoment('seq-9411-b', 'Author', 'b'));
      source.registerDataChangeListener(listener);
      source.pushData(buildMoment('seq-9412-c', 'Author', 'c'));
      expect(listener.eventCount()).assertEqual(2);
      expect(listener.indexAt(1)).assertEqual(2);
      const check01: boolean = listener.eventCount() === 2;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'ReRegisterAfterUnregisterResumes_031 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_3200
     * @tc.name PushNotificationPointsAtPushedRow032
     * @tc.desc Verify push notification points at pushed row
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PushNotificationPointsAtPushedRow_032', 0, (): void => {
      Logger.info(TAG, 'PushNotificationPointsAtPushedRow_032 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('primary');
      source.registerDataChangeListener(listener);
      source.pushData(buildMoment('seq-9420-a', 'Author', 'a'));
      const row: FriendMoment = buildMoment('seq-9421-b', 'Author', 'b');
      source.pushData(row);
      const reported: number = listener.indexAt(1);
      expect(reported).assertEqual(1);
      const check01: boolean = source.getData(reported) === row;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'PushNotificationPointsAtPushedRow_032 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_3300
     * @tc.name AddFirstNotificationPointsAtNewHead033
     * @tc.desc Verify add first notification points at new head
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AddFirstNotificationPointsAtNewHead_033', 0, (): void => {
      Logger.info(TAG, 'AddFirstNotificationPointsAtNewHead_033 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('primary');
      source.registerDataChangeListener(listener);
      source.pushData(buildMoment('seq-9430-base', 'Author', 'base'));
      const fresh: FriendMoment = buildMoment('seq-9431-fresh', 'Author', 'fresh');
      source.addDataFirst(fresh);
      const reported: number = listener.indexAt(1);
      expect(reported).assertEqual(0);
      const check01: boolean = source.getData(reported) === fresh;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'AddFirstNotificationPointsAtNewHead_033 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_3400
     * @tc.name UnregisterUnknownListenerIsHarmless034
     * @tc.desc Verify unregister unknown listener is harmless
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UnregisterUnknownListenerIsHarmless_034', 0, (): void => {
      Logger.info(TAG, 'UnregisterUnknownListenerIsHarmless_034 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('primary');
      const stranger: RecordingListener = new RecordingListener('stranger');
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(stranger);
      source.pushData(buildMoment('seq-9440', 'Author', 'row'));
      expect(stranger.eventCount()).assertEqual(0);
      expect(listener.eventCount()).assertEqual(1);
      const check01: boolean = stranger.isSilent() && listener.eventCount() === 1;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'UnregisterUnknownListenerIsHarmless_034 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_3500
     * @tc.name DoubleRegisterSingleUnregisterSilences035
     * @tc.desc Verify double register single unregister silences
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DoubleRegisterSingleUnregisterSilences_035', 0, (): void => {
      Logger.info(TAG, 'DoubleRegisterSingleUnregisterSilences_035 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('primary');
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.pushData(buildMoment('seq-9450', 'Author', 'row'));
      expect(listener.eventCount()).assertEqual(0);
      const check01: boolean = listener.isSilent();
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(source.totalCount()).assertEqual(1);
      Logger.info(TAG, 'DoubleRegisterSingleUnregisterSilences_035 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_3600
     * @tc.name AddPushAddIndices036
     * @tc.desc Verify add push add indices
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AddPushAddIndices_036', 0, (): void => {
      Logger.info(TAG, 'AddPushAddIndices_036 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('primary');
      source.registerDataChangeListener(listener);
      source.addDataFirst(buildMoment('seq-9460-a', 'Author', 'a'));
      source.pushData(buildMoment('seq-9461-b', 'Author', 'b'));
      source.addDataFirst(buildMoment('seq-9462-c', 'Author', 'c'));
      expect(listener.eventCount()).assertEqual(3);
      expect(listener.indexAt(0)).assertEqual(0);
      expect(listener.indexAt(1)).assertEqual(1);
      expect(listener.indexAt(2)).assertEqual(0);
      Logger.info(TAG, 'AddPushAddIndices_036 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_3700
     * @tc.name UnregisterAllListenersSilencesWrites037
     * @tc.desc Verify unregister all listeners silences writes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UnregisterAllListenersSilencesWrites_037', 0, (): void => {
      Logger.info(TAG, 'UnregisterAllListenersSilencesWrites_037 begin');
      const source: CommentData = new CommentData();
      const first: RecordingListener = new RecordingListener('first');
      const second: RecordingListener = new RecordingListener('second');
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.unregisterDataChangeListener(first);
      source.unregisterDataChangeListener(second);
      source.pushData(buildMoment('seq-9470', 'Author', 'row'));
      expect(first.eventCount()).assertEqual(0);
      expect(second.eventCount()).assertEqual(0);
      const check01: boolean = first.isSilent() && second.isSilent();
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(source.totalCount()).assertEqual(1);
      Logger.info(TAG, 'UnregisterAllListenersSilencesWrites_037 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_3800
     * @tc.name TenAddFirstThenPushNotifiesTen038
     * @tc.desc Verify ten add first then push notifies ten
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TenAddFirstThenPushNotifiesTen_038', 0, (): void => {
      Logger.info(TAG, 'TenAddFirstThenPushNotifiesTen_038 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('primary');
      source.registerDataChangeListener(listener);
      for (let index: number = 0; index < 10; index++) {
        source.addDataFirst(buildMoment('seq-9480-front-' + index, 'Author', 'front ' + index));
      }
      source.pushData(buildMoment('seq-9481-tail', 'Author', 'tail'));
      expect(listener.eventCount()).assertEqual(11);
      expect(listener.indexAt(10)).assertEqual(10);
      const check01: boolean = listener.indexAt(10) === source.totalCount() - 1;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'TenAddFirstThenPushNotifiesTen_038 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_3900
     * @tc.name UnregisterBeforeAnyWriteSilences039
     * @tc.desc Verify unregister before any write silences
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UnregisterBeforeAnyWriteSilences_039', 0, (): void => {
      Logger.info(TAG, 'UnregisterBeforeAnyWriteSilences_039 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('primary');
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.pushData(buildMoment('seq-9490', 'Author', 'row'));
      expect(listener.eventCount()).assertEqual(0);
      const check01: boolean = listener.isSilent();
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(source.totalCount()).assertEqual(1);
      Logger.info(TAG, 'UnregisterBeforeAnyWriteSilences_039 end');
    });
  });
}
