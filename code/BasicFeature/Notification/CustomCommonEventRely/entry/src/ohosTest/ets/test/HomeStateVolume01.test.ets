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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { HomeStateModel } from '../../../main/ets/feature/HomeStateModel';
import { EventRecordManager } from '../../../main/ets/feature/EventRecordManager';
import { FakePublisher } from './util/ModelSupport';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function homeStateTest() {
  describe('HomeStateVolume01Test', () => {

    /**
     * @tc.name   testHomeState010001
     * @tc.number SUB_CCER_HSTATUS_01_0001
     * @tc.desc   初始状态：status 为 READY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010001 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);

      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":0'));
      expect(result).assertContain('"status":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":false'));
      expect(result).assertContain('"subscribed":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"operating":false'));
      expect(result).assertContain('"operating":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010001 end');
    })

    /**
     * @tc.name   testHomeState010002
     * @tc.number SUB_CCER_HSTATUS_01_0002
     * @tc.desc   初始状态：subscribed 为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010002 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);

      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":false'));
      expect(result).assertContain('"subscribed":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"operating":false'));
      expect(result).assertContain('"operating":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010002 end');
    })

    /**
     * @tc.name   testHomeState010003
     * @tc.number SUB_CCER_HSTATUS_01_0003
     * @tc.desc   初始状态：operating 为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010003 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);

      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"operating":false'));
      expect(result).assertContain('"operating":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"lastData":""'));
      expect(result).assertContain('"lastData":""');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010003 end');
    })

    /**
     * @tc.name   testHomeState010004
     * @tc.number SUB_CCER_HSTATUS_01_0004
     * @tc.desc   初始状态：count 为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010004 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);

      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"lastData":""'));
      expect(result).assertContain('"lastData":""');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":-1'));
      expect(result).assertContain('"lastSource":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010004 end');
    })

    /**
     * @tc.name   testHomeState010005
     * @tc.number SUB_CCER_HSTATUS_01_0005
     * @tc.desc   初始状态：lastData 为空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010005 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);

      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"lastData":""'));
      expect(result).assertContain('"lastData":""');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":-1'));
      expect(result).assertContain('"lastSource":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"firstSequence":-1'));
      expect(result).assertContain('"firstSequence":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010005 end');
    })

    /**
     * @tc.name   testHomeState010006
     * @tc.number SUB_CCER_HSTATUS_01_0006
     * @tc.desc   初始状态：lastSource 为 NO_SOURCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010006 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);

      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":-1'));
      expect(result).assertContain('"lastSource":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"firstSequence":-1'));
      expect(result).assertContain('"firstSequence":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSequence":-1'));
      expect(result).assertContain('"lastSequence":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010006 end');
    })

    /**
     * @tc.name   testHomeState010007
     * @tc.number SUB_CCER_HSTATUS_01_0007
     * @tc.desc   初始状态：firstSequence 为 -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010007 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);

      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"firstSequence":-1'));
      expect(result).assertContain('"firstSequence":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSequence":-1'));
      expect(result).assertContain('"lastSequence":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":0'));
      expect(result).assertContain('"status":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010007 end');
    })

    /**
     * @tc.name   testHomeState010008
     * @tc.number SUB_CCER_HSTATUS_01_0008
     * @tc.desc   初始状态：lastSequence 为 -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010008 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);

      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSequence":-1'));
      expect(result).assertContain('"lastSequence":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":0'));
      expect(result).assertContain('"status":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":false'));
      expect(result).assertContain('"subscribed":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010008 end');
    })

    /**
     * @tc.name   testHomeState010009
     * @tc.number SUB_CCER_HSTATUS_01_0009
     * @tc.desc   初始状态：count 与 lastData 同时为零值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010009 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);

      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":0'));
      expect(result).assertContain('"status":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":false'));
      expect(result).assertContain('"subscribed":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"operating":false'));
      expect(result).assertContain('"operating":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010009 end');
    })

    /**
     * @tc.name   testHomeState010010
     * @tc.number SUB_CCER_HSTATUS_01_0010
     * @tc.desc   初始状态：全部字段保持初始值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010010 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);

      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":false'));
      expect(result).assertContain('"subscribed":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"operating":false'));
      expect(result).assertContain('"operating":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010010 end');
    })

    /**
     * @tc.name   testHomeState010011
     * @tc.number SUB_CCER_HSTATUS_01_0011
     * @tc.desc   标记订阅成功：status 变为 SUBSCRIBED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010011 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":1'));
      expect(result).assertContain('"status":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":true'));
      expect(result).assertContain('"subscribed":true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"operating":false'));
      expect(result).assertContain('"operating":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010011 end');
    })

    /**
     * @tc.name   testHomeState010012
     * @tc.number SUB_CCER_HSTATUS_01_0012
     * @tc.desc   标记订阅成功：subscribed 变为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010012 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":true'));
      expect(result).assertContain('"subscribed":true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"operating":false'));
      expect(result).assertContain('"operating":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010012 end');
    })

    /**
     * @tc.name   testHomeState010013
     * @tc.number SUB_CCER_HSTATUS_01_0013
     * @tc.desc   标记订阅成功：operating 仍为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010013 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"operating":false'));
      expect(result).assertContain('"operating":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":-1'));
      expect(result).assertContain('"lastSource":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010013 end');
    })

    /**
     * @tc.name   testHomeState010014
     * @tc.number SUB_CCER_HSTATUS_01_0014
     * @tc.desc   标记订阅成功：count 保持 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010014 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":-1'));
      expect(result).assertContain('"lastSource":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":1'));
      expect(result).assertContain('"status":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010014 end');
    })

    /**
     * @tc.name   testHomeState010015
     * @tc.number SUB_CCER_HSTATUS_01_0015
     * @tc.desc   标记订阅成功：lastData 保持空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010015 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":-1'));
      expect(result).assertContain('"lastSource":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":1'));
      expect(result).assertContain('"status":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":true'));
      expect(result).assertContain('"subscribed":true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010015 end');
    })

    /**
     * @tc.name   testHomeState010016
     * @tc.number SUB_CCER_HSTATUS_01_0016
     * @tc.desc   标记订阅成功：lastSource 保持 NO_SOURCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010016 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":1'));
      expect(result).assertContain('"status":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":true'));
      expect(result).assertContain('"subscribed":true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"operating":false'));
      expect(result).assertContain('"operating":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010016 end');
    })

    /**
     * @tc.name   testHomeState010017
     * @tc.number SUB_CCER_HSTATUS_01_0017
     * @tc.desc   标记订阅成功：firstSequence 仍为 -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010017 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":true'));
      expect(result).assertContain('"subscribed":true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"operating":false'));
      expect(result).assertContain('"operating":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010017 end');
    })

    /**
     * @tc.name   testHomeState010018
     * @tc.number SUB_CCER_HSTATUS_01_0018
     * @tc.desc   标记订阅成功：lastSequence 仍为 -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010018 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"operating":false'));
      expect(result).assertContain('"operating":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":-1'));
      expect(result).assertContain('"lastSource":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010018 end');
    })

    /**
     * @tc.name   testHomeState010019
     * @tc.number SUB_CCER_HSTATUS_01_0019
     * @tc.desc   标记订阅成功：订阅不产生记录
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010019 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":-1'));
      expect(result).assertContain('"lastSource":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":1'));
      expect(result).assertContain('"status":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010019 end');
    })

    /**
     * @tc.name   testHomeState010020
     * @tc.number SUB_CCER_HSTATUS_01_0020
     * @tc.desc   标记订阅成功：订阅不改变计数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010020 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":-1'));
      expect(result).assertContain('"lastSource":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":1'));
      expect(result).assertContain('"status":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":true'));
      expect(result).assertContain('"subscribed":true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010020 end');
    })

    /**
     * @tc.name   testHomeState010021
     * @tc.number SUB_CCER_HSTATUS_01_0021
     * @tc.desc   标记订阅成功：status 与 subscribed 同步变化
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010021 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":1'));
      expect(result).assertContain('"status":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":true'));
      expect(result).assertContain('"subscribed":true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"operating":false'));
      expect(result).assertContain('"operating":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010021 end');
    })

    /**
     * @tc.name   testHomeState010022
     * @tc.number SUB_CCER_HSTATUS_01_0022
     * @tc.desc   标记订阅成功：重复标记订阅保持幂等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010022 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":true'));
      expect(result).assertContain('"subscribed":true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"operating":false'));
      expect(result).assertContain('"operating":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010022 end');
    })

    /**
     * @tc.name   testHomeState010023
     * @tc.number SUB_CCER_HSTATUS_01_0023
     * @tc.desc   标记订阅失败：status 变为 SUBSCRIBE_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010023 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribeFailed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"operating":false'));
      expect(result).assertContain('"operating":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":2'));
      expect(result).assertContain('"status":2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010023 end');
    })

    /**
     * @tc.name   testHomeState010024
     * @tc.number SUB_CCER_HSTATUS_01_0024
     * @tc.desc   标记订阅失败：subscribed 保持 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010024 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribeFailed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":2'));
      expect(result).assertContain('"status":2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":false'));
      expect(result).assertContain('"subscribed":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010024 end');
    })

    /**
     * @tc.name   testHomeState010025
     * @tc.number SUB_CCER_HSTATUS_01_0025
     * @tc.desc   标记订阅失败：operating 仍为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010025 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribeFailed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":2'));
      expect(result).assertContain('"status":2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":false'));
      expect(result).assertContain('"subscribed":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"operating":false'));
      expect(result).assertContain('"operating":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010025 end');
    })

    /**
     * @tc.name   testHomeState010026
     * @tc.number SUB_CCER_HSTATUS_01_0026
     * @tc.desc   标记订阅失败：count 保持 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010026 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribeFailed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":false'));
      expect(result).assertContain('"subscribed":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"operating":false'));
      expect(result).assertContain('"operating":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010026 end');
    })

    /**
     * @tc.name   testHomeState010027
     * @tc.number SUB_CCER_HSTATUS_01_0027
     * @tc.desc   标记订阅失败：lastData 保持空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010027 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribeFailed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"operating":false'));
      expect(result).assertContain('"operating":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":2'));
      expect(result).assertContain('"status":2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010027 end');
    })

    /**
     * @tc.name   testHomeState010028
     * @tc.number SUB_CCER_HSTATUS_01_0028
     * @tc.desc   标记订阅失败：lastSource 保持 NO_SOURCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010028 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribeFailed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":2'));
      expect(result).assertContain('"status":2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":false'));
      expect(result).assertContain('"subscribed":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010028 end');
    })

    /**
     * @tc.name   testHomeState010029
     * @tc.number SUB_CCER_HSTATUS_01_0029
     * @tc.desc   标记订阅失败：firstSequence 仍为 -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010029 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribeFailed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":2'));
      expect(result).assertContain('"status":2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":false'));
      expect(result).assertContain('"subscribed":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"operating":false'));
      expect(result).assertContain('"operating":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010029 end');
    })

    /**
     * @tc.name   testHomeState010030
     * @tc.number SUB_CCER_HSTATUS_01_0030
     * @tc.desc   标记订阅失败：lastSequence 仍为 -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010030 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribeFailed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":false'));
      expect(result).assertContain('"subscribed":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"operating":false'));
      expect(result).assertContain('"operating":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010030 end');
    })

    /**
     * @tc.name   testHomeState010031
     * @tc.number SUB_CCER_HSTATUS_01_0031
     * @tc.desc   标记订阅失败：失败不产生记录
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010031 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribeFailed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"operating":false'));
      expect(result).assertContain('"operating":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":2'));
      expect(result).assertContain('"status":2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010031 end');
    })

    /**
     * @tc.name   testHomeState010032
     * @tc.number SUB_CCER_HSTATUS_01_0032
     * @tc.desc   标记订阅失败：失败不改变计数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010032 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribeFailed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":2'));
      expect(result).assertContain('"status":2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":false'));
      expect(result).assertContain('"subscribed":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010032 end');
    })

    /**
     * @tc.name   testHomeState010033
     * @tc.number SUB_CCER_HSTATUS_01_0033
     * @tc.desc   标记订阅失败：status 与 subscribed 不相同步
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010033 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribeFailed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":2'));
      expect(result).assertContain('"status":2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":false'));
      expect(result).assertContain('"subscribed":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"operating":false'));
      expect(result).assertContain('"operating":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010033 end');
    })

    /**
     * @tc.name   testHomeState010034
     * @tc.number SUB_CCER_HSTATUS_01_0034
     * @tc.desc   标记订阅失败：失败后可再次标记成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010034 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribeFailed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":false'));
      expect(result).assertContain('"subscribed":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"operating":false'));
      expect(result).assertContain('"operating":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010034 end');
    })

    /**
     * @tc.name   testHomeState010035
     * @tc.number SUB_CCER_HSTATUS_01_0035
     * @tc.desc   标记取消订阅：status 变为 UNSUBSCRIBED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010035 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribed(); model.markUnsubscribed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":false'));
      expect(result).assertContain('"subscribed":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":3'));
      expect(result).assertContain('"status":3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010035 end');
    })

    /**
     * @tc.name   testHomeState010036
     * @tc.number SUB_CCER_HSTATUS_01_0036
     * @tc.desc   标记取消订阅：subscribed 变为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010036 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribed(); model.markUnsubscribed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":3'));
      expect(result).assertContain('"status":3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":false'));
      expect(result).assertContain('"subscribed":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010036 end');
    })

    /**
     * @tc.name   testHomeState010037
     * @tc.number SUB_CCER_HSTATUS_01_0037
     * @tc.desc   标记取消订阅：operating 仍为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010037 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribed(); model.markUnsubscribed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":3'));
      expect(result).assertContain('"status":3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":false'));
      expect(result).assertContain('"subscribed":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010037 end');
    })

    /**
     * @tc.name   testHomeState010038
     * @tc.number SUB_CCER_HSTATUS_01_0038
     * @tc.desc   标记取消订阅：count 保持 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010038 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribed(); model.markUnsubscribed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":false'));
      expect(result).assertContain('"subscribed":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":3'));
      expect(result).assertContain('"status":3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010038 end');
    })

    /**
     * @tc.name   testHomeState010039
     * @tc.number SUB_CCER_HSTATUS_01_0039
     * @tc.desc   标记取消订阅：lastData 保持空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010039 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribed(); model.markUnsubscribed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":3'));
      expect(result).assertContain('"status":3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":false'));
      expect(result).assertContain('"subscribed":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010039 end');
    })

    /**
     * @tc.name   testHomeState010040
     * @tc.number SUB_CCER_HSTATUS_01_0040
     * @tc.desc   标记取消订阅：lastSource 保持 NO_SOURCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010040 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribed(); model.markUnsubscribed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":3'));
      expect(result).assertContain('"status":3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":false'));
      expect(result).assertContain('"subscribed":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010040 end');
    })

    /**
     * @tc.name   testHomeState010041
     * @tc.number SUB_CCER_HSTATUS_01_0041
     * @tc.desc   标记取消订阅：firstSequence 仍为 -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010041 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribed(); model.markUnsubscribed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":false'));
      expect(result).assertContain('"subscribed":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":3'));
      expect(result).assertContain('"status":3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010041 end');
    })

    /**
     * @tc.name   testHomeState010042
     * @tc.number SUB_CCER_HSTATUS_01_0042
     * @tc.desc   标记取消订阅：lastSequence 仍为 -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010042 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribed(); model.markUnsubscribed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":3'));
      expect(result).assertContain('"status":3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":false'));
      expect(result).assertContain('"subscribed":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010042 end');
    })

    /**
     * @tc.name   testHomeState010043
     * @tc.number SUB_CCER_HSTATUS_01_0043
     * @tc.desc   标记取消订阅：取消不产生记录
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010043 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribed(); model.markUnsubscribed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":3'));
      expect(result).assertContain('"status":3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":false'));
      expect(result).assertContain('"subscribed":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010043 end');
    })

    /**
     * @tc.name   testHomeState010044
     * @tc.number SUB_CCER_HSTATUS_01_0044
     * @tc.desc   标记取消订阅：取消不改变计数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010044 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribed(); model.markUnsubscribed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":false'));
      expect(result).assertContain('"subscribed":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":3'));
      expect(result).assertContain('"status":3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010044 end');
    })

    /**
     * @tc.name   testHomeState010045
     * @tc.number SUB_CCER_HSTATUS_01_0045
     * @tc.desc   标记取消订阅：订阅后取消保持 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010045 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribed(); model.markUnsubscribed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":3'));
      expect(result).assertContain('"status":3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":false'));
      expect(result).assertContain('"subscribed":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010045 end');
    })

    /**
     * @tc.name   testHomeState010046
     * @tc.number SUB_CCER_HSTATUS_01_0046
     * @tc.desc   标记取消订阅：直接取消保持 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010046 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribed(); model.markUnsubscribed();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":3'));
      expect(result).assertContain('"status":3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":false'));
      expect(result).assertContain('"subscribed":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010046 end');
    })

    /**
     * @tc.name   testHomeState010047
     * @tc.number SUB_CCER_HSTATUS_01_0047
     * @tc.desc   接收合法事件：status 变为 EVENT_RECEIVED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010047 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('InApp', 1002);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":1002'));
      expect(result).assertContain('"lastSource":1002');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"firstSequence":1'));
      expect(result).assertContain('"firstSequence":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSequence":1'));
      expect(result).assertContain('"lastSequence":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010047 end');
    })

    /**
     * @tc.name   testHomeState010048
     * @tc.number SUB_CCER_HSTATUS_01_0048
     * @tc.desc   接收合法事件：count 变为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010048 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('InApp', 1002);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"firstSequence":1'));
      expect(result).assertContain('"firstSequence":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSequence":1'));
      expect(result).assertContain('"lastSequence":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":7'));
      expect(result).assertContain('"status":7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010048 end');
    })

    /**
     * @tc.name   testHomeState010049
     * @tc.number SUB_CCER_HSTATUS_01_0049
     * @tc.desc   接收合法事件：lastData 记录事件数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010049 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('InApp', 1002);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSequence":1'));
      expect(result).assertContain('"lastSequence":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":7'));
      expect(result).assertContain('"status":7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":false'));
      expect(result).assertContain('"subscribed":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010049 end');
    })

    /**
     * @tc.name   testHomeState010050
     * @tc.number SUB_CCER_HSTATUS_01_0050
     * @tc.desc   接收合法事件：lastSource 记录来源码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010050 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('InApp', 1002);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":7'));
      expect(result).assertContain('"status":7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":false'));
      expect(result).assertContain('"subscribed":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":1'));
      expect(result).assertContain('"count":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010050 end');
    })

    /**
     * @tc.name   testHomeState010051
     * @tc.number SUB_CCER_HSTATUS_01_0051
     * @tc.desc   接收合法事件：firstSequence 为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010051 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('InApp', 1002);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":false'));
      expect(result).assertContain('"subscribed":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":1'));
      expect(result).assertContain('"count":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastData":"InApp"'));
      expect(result).assertContain('"lastData":"InApp"');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010051 end');
    })

    /**
     * @tc.name   testHomeState010052
     * @tc.number SUB_CCER_HSTATUS_01_0052
     * @tc.desc   接收合法事件：lastSequence 为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010052 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('InApp', 1002);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":1'));
      expect(result).assertContain('"count":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastData":"InApp"'));
      expect(result).assertContain('"lastData":"InApp"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":1002'));
      expect(result).assertContain('"lastSource":1002');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010052 end');
    })

    /**
     * @tc.name   testHomeState010053
     * @tc.number SUB_CCER_HSTATUS_01_0053
     * @tc.desc   接收合法事件：subscribed 不受事件影响
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010053 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('InApp', 1002);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastData":"InApp"'));
      expect(result).assertContain('"lastData":"InApp"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":1002'));
      expect(result).assertContain('"lastSource":1002');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"firstSequence":1'));
      expect(result).assertContain('"firstSequence":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010053 end');
    })

    /**
     * @tc.name   testHomeState010054
     * @tc.number SUB_CCER_HSTATUS_01_0054
     * @tc.desc   接收合法事件：operating 不受事件影响
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010054 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('InApp', 1002);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":1002'));
      expect(result).assertContain('"lastSource":1002');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"firstSequence":1'));
      expect(result).assertContain('"firstSequence":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSequence":1'));
      expect(result).assertContain('"lastSequence":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010054 end');
    })

    /**
     * @tc.name   testHomeState010055
     * @tc.number SUB_CCER_HSTATUS_01_0055
     * @tc.desc   接收合法事件：记录数与计数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010055 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('InApp', 1002);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"firstSequence":1'));
      expect(result).assertContain('"firstSequence":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSequence":1'));
      expect(result).assertContain('"lastSequence":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":7'));
      expect(result).assertContain('"status":7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010055 end');
    })

    /**
     * @tc.name   testHomeState010056
     * @tc.number SUB_CCER_HSTATUS_01_0056
     * @tc.desc   接收合法事件：来源码为页面来源
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010056 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('InApp', 1002);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSequence":1'));
      expect(result).assertContain('"lastSequence":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":7'));
      expect(result).assertContain('"status":7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":false'));
      expect(result).assertContain('"subscribed":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010056 end');
    })

    /**
     * @tc.name   testHomeState010057
     * @tc.number SUB_CCER_HSTATUS_01_0057
     * @tc.desc   接收合法事件：status 与 count 同时更新
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010057 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('InApp', 1002);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":7'));
      expect(result).assertContain('"status":7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":false'));
      expect(result).assertContain('"subscribed":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":1'));
      expect(result).assertContain('"count":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010057 end');
    })

    /**
     * @tc.name   testHomeState010058
     * @tc.number SUB_CCER_HSTATUS_01_0058
     * @tc.desc   接收合法事件：首末序号相同
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010058 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('InApp', 1002);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"subscribed":false'));
      expect(result).assertContain('"subscribed":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":1'));
      expect(result).assertContain('"count":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastData":"InApp"'));
      expect(result).assertContain('"lastData":"InApp"');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010058 end');
    })

    /**
     * @tc.name   testHomeState010059
     * @tc.number SUB_CCER_HSTATUS_01_0059
     * @tc.desc   接收合法事件：lastData 内容可读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010059 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('InApp', 1002);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":1'));
      expect(result).assertContain('"count":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastData":"InApp"'));
      expect(result).assertContain('"lastData":"InApp"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":1002'));
      expect(result).assertContain('"lastSource":1002');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010059 end');
    })

    /**
     * @tc.name   testHomeState010060
     * @tc.number SUB_CCER_HSTATUS_01_0060
     * @tc.desc   订阅后连续接收两条事件
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState010060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010060 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.markSubscribed(); model.handleEvent('OutApp', 1001); model.handleEvent('InApp', 1002);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":2'));
      expect(result).assertContain('"count":2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":1002'));
      expect(result).assertContain('"lastSource":1002');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"firstSequence":1'));
      expect(result).assertContain('"firstSequence":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSequence":2'));
      expect(result).assertContain('"lastSequence":2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState010060 end');
    })

  })
}
