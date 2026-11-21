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
import { FriendMoment } from 'publishmultimediaupdate/src/main/ets/model/BasicDataSource';
import { BUNDLE, TAG } from '../common/TestConstant';
import { buildMoment } from '../common/DataFactory';
import { RecordingListener } from '../common/RecordingListener';
/**
 * Behaviour of the abstract data source across element types.
 * BasicDataSource is generic; the feed instantiates it with FriendMoment, but
 * the listener registry and notification logic sit in the abstract class and
 * must behave the same for any element type. These cases drive the same
 * operations through three concrete instantiations.
 */
class TextSource extends BasicDataSource<string> {
  public rows: Array<string> = [];
  totalCount(): number {
    return this.rows.length;
  }
  getData(index: number): string {
    return this.rows[index];
  }
}
class NumberSource extends BasicDataSource<number> {
  public rows: Array<number> = [];
  totalCount(): number {
    return this.rows.length;
  }
  getData(index: number): number {
    return this.rows[index];
  }
}
class MomentSource extends BasicDataSource<FriendMoment> {
  public rows: Array<FriendMoment> = [];
  totalCount(): number {
    return this.rows.length;
  }
  getData(index: number): FriendMoment {
    return this.rows[index];
  }
}
export default function basicDataSourceGenericTest() {
  describe('BasicDataSourceGenericTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_GENERIC_0100
     * @tc.name TextSourceCount001
     * @tc.desc Verify text source count
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TextSourceCount_001', 0, (): void => {
      Logger.info(TAG, 'TextSourceCount_001 begin');
      const source: TextSource = new TextSource();
      source.rows = ['a', 'b', 'c'];
      expect(source.totalCount()).assertEqual(3);
      Logger.info(TAG, 'TextSourceCount_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_GENERIC_0200
     * @tc.name TextSourceValues002
     * @tc.desc Verify text source values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TextSourceValues_002', 0, (): void => {
      Logger.info(TAG, 'TextSourceValues_002 begin');
      const source: TextSource = new TextSource();
      source.rows = ['a', 'b', 'c'];
      expect(source.getData(1)).assertEqual('b');
      Logger.info(TAG, 'TextSourceValues_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_GENERIC_0300
     * @tc.name NumberSourceValues003
     * @tc.desc Verify number source values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NumberSourceValues_003', 0, (): void => {
      Logger.info(TAG, 'NumberSourceValues_003 begin');
      const source: NumberSource = new NumberSource();
      source.rows = [10, 20, 30];
      expect(source.getData(2)).assertEqual(30);
      Logger.info(TAG, 'NumberSourceValues_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_GENERIC_0400
     * @tc.name MomentSourceIdentity004
     * @tc.desc Verify moment source identity
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MomentSourceIdentity_004', 0, (): void => {
      Logger.info(TAG, 'MomentSourceIdentity_004 begin');
      const source: MomentSource = new MomentSource();
      const moment: FriendMoment = buildMoment('generic-0400', 'Author', 'body');
      source.rows = [moment];
      const same: boolean = source.getData(0) === moment;
      Logger.info(TAG, 'same=' + JSON.stringify(same));
      expect(same).assertTrue();
      Logger.info(TAG, 'MomentSourceIdentity_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_GENERIC_0500
     * @tc.name EmptySourcesUndefined005
     * @tc.desc Verify empty sources undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptySourcesUndefined_005', 0, (): void => {
      Logger.info(TAG, 'EmptySourcesUndefined_005 begin');
      const text: TextSource = new TextSource();
      const number: NumberSource = new NumberSource();
      const moment: MomentSource = new MomentSource();
      expect(text.getData(0)).assertUndefined();
      expect(number.getData(0)).assertUndefined();
      expect(moment.getData(0)).assertUndefined();
      Logger.info(TAG, 'EmptySourcesUndefined_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_GENERIC_0600
     * @tc.name ListenerWorksForText006
     * @tc.desc Verify listener works for text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ListenerWorksForText_006', 0, (): void => {
      Logger.info(TAG, 'ListenerWorksForText_006 begin');
      const source: TextSource = new TextSource();
      const listener: RecordingListener = new RecordingListener('text');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(2);
      expect(listener.eventCount()).assertEqual(1);
      expect(listener.indexAt(0)).assertEqual(2);
      Logger.info(TAG, 'ListenerWorksForText_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_GENERIC_0700
     * @tc.name ListenerWorksForNumber007
     * @tc.desc Verify listener works for number
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ListenerWorksForNumber_007', 0, (): void => {
      Logger.info(TAG, 'ListenerWorksForNumber_007 begin');
      const source: NumberSource = new NumberSource();
      const listener: RecordingListener = new RecordingListener('number');
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(1);
      expect(listener.kindAt(0)).assertEqual('delete');
      expect(listener.indexAt(0)).assertEqual(1);
      Logger.info(TAG, 'ListenerWorksForNumber_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_GENERIC_0800
     * @tc.name ListenerWorksForMoment008
     * @tc.desc Verify listener works for moment
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ListenerWorksForMoment_008', 0, (): void => {
      Logger.info(TAG, 'ListenerWorksForMoment_008 begin');
      const source: MomentSource = new MomentSource();
      const listener: RecordingListener = new RecordingListener('moment');
      source.registerDataChangeListener(listener);
      source.notifyDataMove(1, 4);
      expect(listener.toIndexAt(0)).assertEqual(4);
      Logger.info(TAG, 'ListenerWorksForMoment_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_GENERIC_0900
     * @tc.name RegistriesArePerInstance009
     * @tc.desc Verify registries are per instance
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RegistriesArePerInstance_009', 0, (): void => {
      Logger.info(TAG, 'RegistriesArePerInstance_009 begin');
      const text: TextSource = new TextSource();
      const number: NumberSource = new NumberSource();
      const shared: RecordingListener = new RecordingListener('shared');
      text.registerDataChangeListener(shared);
      text.notifyDataAdd(0);
      number.notifyDataAdd(0);
      expect(shared.eventCount()).assertEqual(1);
      Logger.info(TAG, 'RegistriesArePerInstance_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_GENERIC_1000
     * @tc.name UnregisterWorksAcrossTypes010
     * @tc.desc Verify unregister works across types
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UnregisterWorksAcrossTypes_010', 0, (): void => {
      Logger.info(TAG, 'UnregisterWorksAcrossTypes_010 begin');
      const text: TextSource = new TextSource();
      const number: NumberSource = new NumberSource();
      const moment: MomentSource = new MomentSource();
      const listener: RecordingListener = new RecordingListener('all');
      text.registerDataChangeListener(listener);
      number.registerDataChangeListener(listener);
      moment.registerDataChangeListener(listener);
      text.unregisterDataChangeListener(listener);
      number.unregisterDataChangeListener(listener);
      moment.unregisterDataChangeListener(listener);
      text.notifyDataReload();
      number.notifyDataReload();
      moment.notifyDataReload();
      const silent: boolean = listener.isSilent();
      Logger.info(TAG, 'silent=' + JSON.stringify(silent));
      expect(silent).assertTrue();
      Logger.info(TAG, 'UnregisterWorksAcrossTypes_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_GENERIC_1100
     * @tc.name DuplicateRegisterIgnoredForAll011
     * @tc.desc Verify duplicate register ignored for all
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DuplicateRegisterIgnoredForAll_011', 0, (): void => {
      Logger.info(TAG, 'DuplicateRegisterIgnoredForAll_011 begin');
      const moment: MomentSource = new MomentSource();
      const listener: RecordingListener = new RecordingListener('dup');
      moment.registerDataChangeListener(listener);
      moment.registerDataChangeListener(listener);
      moment.notifyDataAdd(0);
      expect(listener.eventCount()).assertEqual(1);
      Logger.info(TAG, 'DuplicateRegisterIgnoredForAll_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_GENERIC_1200
     * @tc.name MomentSourceManyRows012
     * @tc.desc Verify moment source many rows
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MomentSourceManyRows_012', 0, (): void => {
      Logger.info(TAG, 'MomentSourceManyRows_012 begin');
      const source: MomentSource = new MomentSource();
      for (let index: number = 0; index < 100; index++) {
        source.rows.push(buildMoment('generic-' + index, 'Author', 'body_' + index));
      }
      expect(source.totalCount()).assertEqual(100);
      expect(source.getData(0).text).assertEqual('body_0');
      expect(source.getData(99).text).assertEqual('body_99');
      Logger.info(TAG, 'MomentSourceManyRows_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_GENERIC_1300
     * @tc.name AllNotifyKindsForMoment013
     * @tc.desc Verify all notify kinds for moment
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AllNotifyKindsForMoment_013', 0, (): void => {
      Logger.info(TAG, 'AllNotifyKindsForMoment_013 begin');
      const source: MomentSource = new MomentSource();
      const listener: RecordingListener = new RecordingListener('kinds');
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.notifyDataAdd(0);
      source.notifyDataChange(1);
      source.notifyDataDelete(2);
      source.notifyDataMove(3, 4);
      expect(listener.kindSequence()).assertEqual('reload|add|change|delete|move');
      Logger.info(TAG, 'AllNotifyKindsForMoment_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_GENERIC_1400
     * @tc.name NumberSourceCountMatchesRows014
     * @tc.desc Verify number source count matches rows
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NumberSourceCountMatchesRows_014', 0, (): void => {
      Logger.info(TAG, 'NumberSourceCountMatchesRows_014 begin');
      const source: NumberSource = new NumberSource();
      source.rows = [1, 2, 3, 4, 5];
      expect(source.totalCount()).assertEqual(5);
      expect(source.getData(4)).assertEqual(5);
      Logger.info(TAG, 'NumberSourceCountMatchesRows_014 end');
    });
  });
}
