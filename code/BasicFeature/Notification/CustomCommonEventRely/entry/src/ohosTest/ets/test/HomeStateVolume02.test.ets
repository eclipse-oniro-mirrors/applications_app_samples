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
  describe('HomeStateVolume02Test', () => {

    /**
     * @tc.name   testHomeState020001
     * @tc.number SUB_CCER_HSTATUS_02_0001
     * @tc.desc   空数据事件 1 被拒绝且状态不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020001 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('', 1001);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":0'));
      expect(result).assertContain('"status":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"lastData":""'));
      expect(result).assertContain('"lastData":""');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020001 end');
    })

    /**
     * @tc.name   testHomeState020002
     * @tc.number SUB_CCER_HSTATUS_02_0002
     * @tc.desc   空数据事件 2 被拒绝且状态不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020002 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('', 1002);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"lastData":""'));
      expect(result).assertContain('"lastData":""');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":-1'));
      expect(result).assertContain('"lastSource":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020002 end');
    })

    /**
     * @tc.name   testHomeState020003
     * @tc.number SUB_CCER_HSTATUS_02_0003
     * @tc.desc   空数据事件 3 被拒绝且状态不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020003 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('', 0);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"lastData":""'));
      expect(result).assertContain('"lastData":""');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":-1'));
      expect(result).assertContain('"lastSource":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"firstSequence":-1'));
      expect(result).assertContain('"firstSequence":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020003 end');
    })

    /**
     * @tc.name   testHomeState020004
     * @tc.number SUB_CCER_HSTATUS_02_0004
     * @tc.desc   空数据事件 4 被拒绝且状态不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020004 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('', -1);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":-1'));
      expect(result).assertContain('"lastSource":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"firstSequence":-1'));
      expect(result).assertContain('"firstSequence":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":0'));
      expect(result).assertContain('"status":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020004 end');
    })

    /**
     * @tc.name   testHomeState020005
     * @tc.number SUB_CCER_HSTATUS_02_0005
     * @tc.desc   空数据事件 5 被拒绝且状态不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020005 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('', 7);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"firstSequence":-1'));
      expect(result).assertContain('"firstSequence":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":0'));
      expect(result).assertContain('"status":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020005 end');
    })

    /**
     * @tc.name   testHomeState020006
     * @tc.number SUB_CCER_HSTATUS_02_0006
     * @tc.desc   非整数来源码组 1 被拒绝且状态不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020006 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('InApp', 1.5); model.handleEvent('OutApp', 2.25);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":-1'));
      expect(result).assertContain('"lastSource":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"firstSequence":-1'));
      expect(result).assertContain('"firstSequence":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020006 end');
    })

    /**
     * @tc.name   testHomeState020007
     * @tc.number SUB_CCER_HSTATUS_02_0007
     * @tc.desc   非整数来源码组 2 被拒绝且状态不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020007 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('InApp', -0.5); model.handleEvent('OutApp', 0.1);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":-1'));
      expect(result).assertContain('"lastSource":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"firstSequence":-1'));
      expect(result).assertContain('"firstSequence":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":0'));
      expect(result).assertContain('"status":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020007 end');
    })

    /**
     * @tc.name   testHomeState020008
     * @tc.number SUB_CCER_HSTATUS_02_0008
     * @tc.desc   非整数来源码组 3 被拒绝且状态不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020008 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('InApp', 1e-7); model.handleEvent('OutApp', NaN);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"firstSequence":-1'));
      expect(result).assertContain('"firstSequence":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":0'));
      expect(result).assertContain('"status":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020008 end');
    })

    /**
     * @tc.name   testHomeState020009
     * @tc.number SUB_CCER_HSTATUS_02_0009
     * @tc.desc   非整数来源码组 4 被拒绝且状态不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020009 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('InApp', Infinity); model.handleEvent('OutApp', -Infinity);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":0'));
      expect(result).assertContain('"status":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":-1'));
      expect(result).assertContain('"lastSource":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020009 end');
    })

    /**
     * @tc.name   testHomeState020010
     * @tc.number SUB_CCER_HSTATUS_02_0010
     * @tc.desc   非整数来源码组 5 被拒绝且状态不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020010 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('InApp', 3.0000001); model.handleEvent('OutApp', 1001.5);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":-1'));
      expect(result).assertContain('"lastSource":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"firstSequence":-1'));
      expect(result).assertContain('"firstSequence":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020010 end');
    })

    /**
     * @tc.name   testHomeState020011
     * @tc.number SUB_CCER_HSTATUS_02_0011
     * @tc.desc   容量 1 接收 1 条后保留 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020011 begin');
      const manager: EventRecordManager = new EventRecordManager(1);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('Data_01', 1001);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSequence":1'));
      expect(result).assertContain('"lastSequence":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":7'));
      expect(result).assertContain('"status":7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":1'));
      expect(result).assertContain('"count":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020011 end');
    })

    /**
     * @tc.name   testHomeState020012
     * @tc.number SUB_CCER_HSTATUS_02_0012
     * @tc.desc   容量 1 接收 2 条后保留 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020012 begin');
      const manager: EventRecordManager = new EventRecordManager(1);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('Data_01', 1001); model.handleEvent('Data_02', 1001);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":7'));
      expect(result).assertContain('"status":7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":1'));
      expect(result).assertContain('"count":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"firstSequence":2'));
      expect(result).assertContain('"firstSequence":2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020012 end');
    })

    /**
     * @tc.name   testHomeState020013
     * @tc.number SUB_CCER_HSTATUS_02_0013
     * @tc.desc   容量 1 接收 3 条后保留 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020013 begin');
      const manager: EventRecordManager = new EventRecordManager(1);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('Data_01', 1001); model.handleEvent('Data_02', 1001); model.handleEvent('Data_03', 1001);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":1'));
      expect(result).assertContain('"count":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"firstSequence":3'));
      expect(result).assertContain('"firstSequence":3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSequence":3'));
      expect(result).assertContain('"lastSequence":3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020013 end');
    })

    /**
     * @tc.name   testHomeState020014
     * @tc.number SUB_CCER_HSTATUS_02_0014
     * @tc.desc   容量 2 接收 2 条后保留 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020014 begin');
      const manager: EventRecordManager = new EventRecordManager(2);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('Data_01', 1001); model.handleEvent('Data_02', 1001);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"firstSequence":1'));
      expect(result).assertContain('"firstSequence":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSequence":2'));
      expect(result).assertContain('"lastSequence":2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":7'));
      expect(result).assertContain('"status":7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020014 end');
    })

    /**
     * @tc.name   testHomeState020015
     * @tc.number SUB_CCER_HSTATUS_02_0015
     * @tc.desc   容量 2 接收 3 条后保留 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020015 begin');
      const manager: EventRecordManager = new EventRecordManager(2);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('Data_01', 1001); model.handleEvent('Data_02', 1001); model.handleEvent('Data_03', 1001);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSequence":3'));
      expect(result).assertContain('"lastSequence":3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":7'));
      expect(result).assertContain('"status":7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":2'));
      expect(result).assertContain('"count":2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020015 end');
    })

    /**
     * @tc.name   testHomeState020016
     * @tc.number SUB_CCER_HSTATUS_02_0016
     * @tc.desc   容量 2 接收 4 条后保留 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020016 begin');
      const manager: EventRecordManager = new EventRecordManager(2);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('Data_01', 1001);
      model.handleEvent('Data_02', 1001);
      model.handleEvent('Data_03', 1001);
      model.handleEvent('Data_04', 1001);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":7'));
      expect(result).assertContain('"status":7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":2'));
      expect(result).assertContain('"count":2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"firstSequence":3'));
      expect(result).assertContain('"firstSequence":3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020016 end');
    })

    /**
     * @tc.name   testHomeState020017
     * @tc.number SUB_CCER_HSTATUS_02_0017
     * @tc.desc   容量 3 接收 3 条后保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020017 begin');
      const manager: EventRecordManager = new EventRecordManager(3);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('Data_01', 1001); model.handleEvent('Data_02', 1001); model.handleEvent('Data_03', 1001);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":3'));
      expect(result).assertContain('"count":3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"firstSequence":1'));
      expect(result).assertContain('"firstSequence":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSequence":3'));
      expect(result).assertContain('"lastSequence":3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020017 end');
    })

    /**
     * @tc.name   testHomeState020018
     * @tc.number SUB_CCER_HSTATUS_02_0018
     * @tc.desc   容量 3 接收 4 条后保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020018 begin');
      const manager: EventRecordManager = new EventRecordManager(3);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('Data_01', 1001);
      model.handleEvent('Data_02', 1001);
      model.handleEvent('Data_03', 1001);
      model.handleEvent('Data_04', 1001);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"firstSequence":2'));
      expect(result).assertContain('"firstSequence":2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSequence":4'));
      expect(result).assertContain('"lastSequence":4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":7'));
      expect(result).assertContain('"status":7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020018 end');
    })

    /**
     * @tc.name   testHomeState020019
     * @tc.number SUB_CCER_HSTATUS_02_0019
     * @tc.desc   容量 3 接收 5 条后保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020019 begin');
      const manager: EventRecordManager = new EventRecordManager(3);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('Data_01', 1001);
      model.handleEvent('Data_02', 1001);
      model.handleEvent('Data_03', 1001);
      model.handleEvent('Data_04', 1001);
      model.handleEvent('Data_05', 1001);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSequence":5'));
      expect(result).assertContain('"lastSequence":5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":7'));
      expect(result).assertContain('"status":7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":3'));
      expect(result).assertContain('"count":3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020019 end');
    })

    /**
     * @tc.name   testHomeState020020
     * @tc.number SUB_CCER_HSTATUS_02_0020
     * @tc.desc   清空 1 条记录后状态复位
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020020 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('Data_01', 1002); model.clear();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"lastData":""'));
      expect(result).assertContain('"lastData":""');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":-1'));
      expect(result).assertContain('"lastSource":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020020 end');
    })

    /**
     * @tc.name   testHomeState020021
     * @tc.number SUB_CCER_HSTATUS_02_0021
     * @tc.desc   清空 2 条记录后状态复位
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020021 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('Data_01', 1002); model.handleEvent('Data_02', 1002); model.clear();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"lastData":""'));
      expect(result).assertContain('"lastData":""');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":-1'));
      expect(result).assertContain('"lastSource":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"firstSequence":-1'));
      expect(result).assertContain('"firstSequence":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020021 end');
    })

    /**
     * @tc.name   testHomeState020022
     * @tc.number SUB_CCER_HSTATUS_02_0022
     * @tc.desc   清空 3 条记录后状态复位
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020022 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('Data_01', 1002);
      model.handleEvent('Data_02', 1002);
      model.handleEvent('Data_03', 1002);
      model.clear();
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020022 end');
    })

    /**
     * @tc.name   testHomeState020023
     * @tc.number SUB_CCER_HSTATUS_02_0023
     * @tc.desc   清空 4 条记录后状态复位
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020023 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('Data_01', 1002);
      model.handleEvent('Data_02', 1002);
      model.handleEvent('Data_03', 1002);
      model.handleEvent('Data_04', 1002);
      model.clear();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"firstSequence":-1'));
      expect(result).assertContain('"firstSequence":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSequence":-1'));
      expect(result).assertContain('"lastSequence":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":8'));
      expect(result).assertContain('"status":8');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020023 end');
    })

    /**
     * @tc.name   testHomeState020024
     * @tc.number SUB_CCER_HSTATUS_02_0024
     * @tc.desc   清空 5 条记录后状态复位
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020024 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('Data_01', 1002);
      model.handleEvent('Data_02', 1002);
      model.handleEvent('Data_03', 1002);
      model.handleEvent('Data_04', 1002);
      model.handleEvent('Data_05', 1002);
      model.clear();
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSequence":-1'));
      expect(result).assertContain('"lastSequence":-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":8'));
      expect(result).assertContain('"status":8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":0'));
      expect(result).assertContain('"count":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020024 end');
    })

    /**
     * @tc.name   testHomeState020025
     * @tc.number SUB_CCER_HSTATUS_02_0025
     * @tc.desc   清空后再接收 1 条历史后新记录从 1 开始编号
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020025 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('Data_01', 1001); model.clear(); model.handleEvent('InApp', 1002);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":1002'));
      expect(result).assertContain('"lastSource":1002');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":7'));
      expect(result).assertContain('"status":7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":1'));
      expect(result).assertContain('"count":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020025 end');
    })

    /**
     * @tc.name   testHomeState020026
     * @tc.number SUB_CCER_HSTATUS_02_0026
     * @tc.desc   清空后再接收 2 条历史后新记录从 1 开始编号
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020026 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('Data_01', 1001);
      model.handleEvent('Data_02', 1001);
      model.clear();
      model.handleEvent('InApp', 1002);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":7'));
      expect(result).assertContain('"status":7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":1'));
      expect(result).assertContain('"count":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"firstSequence":1'));
      expect(result).assertContain('"firstSequence":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020026 end');
    })

    /**
     * @tc.name   testHomeState020027
     * @tc.number SUB_CCER_HSTATUS_02_0027
     * @tc.desc   清空后再接收 3 条历史后新记录从 1 开始编号
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020027 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('Data_01', 1001);
      model.handleEvent('Data_02', 1001);
      model.handleEvent('Data_03', 1001);
      model.clear();
      model.handleEvent('InApp', 1002);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":1'));
      expect(result).assertContain('"count":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"firstSequence":1'));
      expect(result).assertContain('"firstSequence":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSequence":1'));
      expect(result).assertContain('"lastSequence":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020027 end');
    })

    /**
     * @tc.name   testHomeState020028
     * @tc.number SUB_CCER_HSTATUS_02_0028
     * @tc.desc   清空后再接收 4 条历史后新记录从 1 开始编号
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020028 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('Data_01', 1001);
      model.handleEvent('Data_02', 1001);
      model.handleEvent('Data_03', 1001);
      model.handleEvent('Data_04', 1001);
      model.clear();
      model.handleEvent('InApp', 1002);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"firstSequence":1'));
      expect(result).assertContain('"firstSequence":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSequence":1'));
      expect(result).assertContain('"lastSequence":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":1002'));
      expect(result).assertContain('"lastSource":1002');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020028 end');
    })

    /**
     * @tc.name   testHomeState020029
     * @tc.number SUB_CCER_HSTATUS_02_0029
     * @tc.desc   清空后再接收 5 条历史后新记录从 1 开始编号
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020029 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('Data_01', 1001);
      model.handleEvent('Data_02', 1001);
      model.handleEvent('Data_03', 1001);
      model.handleEvent('Data_04', 1001);
      model.handleEvent('Data_05', 1001);
      model.clear();
      model.handleEvent('InApp', 1002);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSequence":1'));
      expect(result).assertContain('"lastSequence":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":1002'));
      expect(result).assertContain('"lastSource":1002');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"status":7'));
      expect(result).assertContain('"status":7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020029 end');
    })

    /**
     * @tc.name   testHomeState020030
     * @tc.number SUB_CCER_HSTATUS_02_0030
     * @tc.desc   连续接收 1 条后最新事件与计数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020030 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('Data_01', 1001);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastData":"Data_01"'));
      expect(result).assertContain('"lastData":"Data_01"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSequence":1'));
      expect(result).assertContain('"lastSequence":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":1001'));
      expect(result).assertContain('"lastSource":1001');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020030 end');
    })

    /**
     * @tc.name   testHomeState020031
     * @tc.number SUB_CCER_HSTATUS_02_0031
     * @tc.desc   连续接收 2 条后最新事件与计数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020031 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('Data_01', 1001); model.handleEvent('Data_02', 1002);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSequence":2'));
      expect(result).assertContain('"lastSequence":2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":1002'));
      expect(result).assertContain('"lastSource":1002');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":2'));
      expect(result).assertContain('"count":2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020031 end');
    })

    /**
     * @tc.name   testHomeState020032
     * @tc.number SUB_CCER_HSTATUS_02_0032
     * @tc.desc   连续接收 3 条后最新事件与计数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020032 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('Data_01', 1001); model.handleEvent('Data_02', 1002); model.handleEvent('Data_03', 1001);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":1001'));
      expect(result).assertContain('"lastSource":1001');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":3'));
      expect(result).assertContain('"count":3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastData":"Data_03"'));
      expect(result).assertContain('"lastData":"Data_03"');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020032 end');
    })

    /**
     * @tc.name   testHomeState020033
     * @tc.number SUB_CCER_HSTATUS_02_0033
     * @tc.desc   连续接收 4 条后最新事件与计数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020033 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('Data_01', 1001);
      model.handleEvent('Data_02', 1002);
      model.handleEvent('Data_03', 1001);
      model.handleEvent('Data_04', 1002);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":4'));
      expect(result).assertContain('"count":4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastData":"Data_04"'));
      expect(result).assertContain('"lastData":"Data_04"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSequence":4'));
      expect(result).assertContain('"lastSequence":4');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020033 end');
    })

    /**
     * @tc.name   testHomeState020034
     * @tc.number SUB_CCER_HSTATUS_02_0034
     * @tc.desc   连续接收 5 条后最新事件与计数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020034 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('Data_01', 1001);
      model.handleEvent('Data_02', 1002);
      model.handleEvent('Data_03', 1001);
      model.handleEvent('Data_04', 1002);
      model.handleEvent('Data_05', 1001);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastData":"Data_05"'));
      expect(result).assertContain('"lastData":"Data_05"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSequence":5'));
      expect(result).assertContain('"lastSequence":5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":1001'));
      expect(result).assertContain('"lastSource":1001');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020034 end');
    })

    /**
     * @tc.name   testHomeState020035
     * @tc.number SUB_CCER_HSTATUS_02_0035
     * @tc.desc   连续接收 6 条后最新事件与计数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020035 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('Data_01', 1001);
      model.handleEvent('Data_02', 1002);
      model.handleEvent('Data_03', 1001);
      model.handleEvent('Data_04', 1002);
      model.handleEvent('Data_05', 1001);
      model.handleEvent('Data_06', 1002);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSequence":6'));
      expect(result).assertContain('"lastSequence":6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":1002'));
      expect(result).assertContain('"lastSource":1002');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":6'));
      expect(result).assertContain('"count":6');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020035 end');
    })

    /**
     * @tc.name   testHomeState020036
     * @tc.number SUB_CCER_HSTATUS_02_0036
     * @tc.desc   连续接收 1 条后最新事件与计数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020036 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('Data_01', 1001);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":1001'));
      expect(result).assertContain('"lastSource":1001');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":1'));
      expect(result).assertContain('"count":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastData":"Data_01"'));
      expect(result).assertContain('"lastData":"Data_01"');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020036 end');
    })

    /**
     * @tc.name   testHomeState020037
     * @tc.number SUB_CCER_HSTATUS_02_0037
     * @tc.desc   连续接收 2 条后最新事件与计数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020037 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('Data_01', 1001); model.handleEvent('Data_02', 1002);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":2'));
      expect(result).assertContain('"count":2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastData":"Data_02"'));
      expect(result).assertContain('"lastData":"Data_02"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSequence":2'));
      expect(result).assertContain('"lastSequence":2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020037 end');
    })

    /**
     * @tc.name   testHomeState020038
     * @tc.number SUB_CCER_HSTATUS_02_0038
     * @tc.desc   连续接收 3 条后最新事件与计数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020038 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('Data_01', 1001); model.handleEvent('Data_02', 1002); model.handleEvent('Data_03', 1001);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastData":"Data_03"'));
      expect(result).assertContain('"lastData":"Data_03"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSequence":3'));
      expect(result).assertContain('"lastSequence":3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":1001'));
      expect(result).assertContain('"lastSource":1001');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020038 end');
    })

    /**
     * @tc.name   testHomeState020039
     * @tc.number SUB_CCER_HSTATUS_02_0039
     * @tc.desc   连续接收 4 条后最新事件与计数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020039 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('Data_01', 1001);
      model.handleEvent('Data_02', 1002);
      model.handleEvent('Data_03', 1001);
      model.handleEvent('Data_04', 1002);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSequence":4'));
      expect(result).assertContain('"lastSequence":4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":1002'));
      expect(result).assertContain('"lastSource":1002');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":4'));
      expect(result).assertContain('"count":4');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020039 end');
    })

    /**
     * @tc.name   testHomeState020040
     * @tc.number SUB_CCER_HSTATUS_02_0040
     * @tc.desc   连续接收 5 条后最新事件与计数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020040 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('Data_01', 1001);
      model.handleEvent('Data_02', 1002);
      model.handleEvent('Data_03', 1001);
      model.handleEvent('Data_04', 1002);
      model.handleEvent('Data_05', 1001);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":1001'));
      expect(result).assertContain('"lastSource":1001');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":5'));
      expect(result).assertContain('"count":5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastData":"Data_05"'));
      expect(result).assertContain('"lastData":"Data_05"');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020040 end');
    })

    /**
     * @tc.name   testHomeState020041
     * @tc.number SUB_CCER_HSTATUS_02_0041
     * @tc.desc   连续接收 6 条后最新事件与计数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020041 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('Data_01', 1001);
      model.handleEvent('Data_02', 1002);
      model.handleEvent('Data_03', 1001);
      model.handleEvent('Data_04', 1002);
      model.handleEvent('Data_05', 1001);
      model.handleEvent('Data_06', 1002);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":6'));
      expect(result).assertContain('"count":6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastData":"Data_06"'));
      expect(result).assertContain('"lastData":"Data_06"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSequence":6'));
      expect(result).assertContain('"lastSequence":6');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020041 end');
    })

    /**
     * @tc.name   testHomeState020042
     * @tc.number SUB_CCER_HSTATUS_02_0042
     * @tc.desc   连续接收 1 条后最新事件与计数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020042 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('Data_01', 1001);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastData":"Data_01"'));
      expect(result).assertContain('"lastData":"Data_01"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSequence":1'));
      expect(result).assertContain('"lastSequence":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSource":1001'));
      expect(result).assertContain('"lastSource":1001');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020042 end');
    })

    /**
     * @tc.name   testHomeState020043
     * @tc.number SUB_CCER_HSTATUS_02_0043
     * @tc.desc   容量 2 时最旧记录被移除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHomeState020043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020043 begin');
      const manager: EventRecordManager = new EventRecordManager(2);
      const publisher: FakePublisher = new FakePublisher(false);
      const model: HomeStateModel = new HomeStateModel(manager, publisher);
      model.handleEvent('Data_01', 1001); model.handleEvent('Data_02', 1002); model.handleEvent('Data_03', 1001);
      const result: string = JSON.stringify(model.snapshot());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"count":2'));
      expect(result).assertContain('"count":2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"firstSequence":2'));
      expect(result).assertContain('"firstSequence":2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastSequence":3'));
      expect(result).assertContain('"lastSequence":3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"lastData":"Data_03"'));
      expect(result).assertContain('"lastData":"Data_03"');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHomeState020043 end');
    })

  })
}
