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
import { FormPublishCounter } from '../../../main/ets/feature/FormPublishCounter';
import { FormEventService } from '../../../main/ets/feature/FormEventService';
import { FakeFormUpdater } from './util/ModelSupport';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function formRefreshTest() {
  describe('FormRefreshVolume01Test', () => {

    /**
     * @tc.name   testFormRefresh0001
     * @tc.number SUB_CCER_FREFRESH_01_0001
     * @tc.desc   卡片 "f1" 刷新时携带计数 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormRefresh0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0001 begin');
      const counter: FormPublishCounter = new FormPublishCounter();
      const updater: FakeFormUpdater = new FakeFormUpdater(false);

      updater.updateForm("f1", FormEventService.createBindingData(counter.get("f1")));
      const result: string = updater.getLastJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"publishCount":0'));
      expect(result).assertContain('"publishCount":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(updater.getCount()), String(1));
      expect(updater.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.get("f1")), String(0));
      expect(counter.get("f1")).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0001 end');
    })

    /**
     * @tc.name   testFormRefresh0002
     * @tc.number SUB_CCER_FREFRESH_01_0002
     * @tc.desc   卡片 "f2" 刷新时携带计数 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormRefresh0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0002 begin');
      const counter: FormPublishCounter = new FormPublishCounter();
      const updater: FakeFormUpdater = new FakeFormUpdater(false);

      updater.updateForm("f2", FormEventService.createBindingData(counter.get("f2")));
      const result: string = updater.getLastJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"publishCount":0'));
      expect(result).assertContain('"publishCount":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(updater.getCount()), String(1));
      expect(updater.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.get("f2")), String(0));
      expect(counter.get("f2")).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0002 end');
    })

    /**
     * @tc.name   testFormRefresh0003
     * @tc.number SUB_CCER_FREFRESH_01_0003
     * @tc.desc   卡片 "f3" 刷新时携带计数 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormRefresh0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0003 begin');
      const counter: FormPublishCounter = new FormPublishCounter();
      const updater: FakeFormUpdater = new FakeFormUpdater(false);

      updater.updateForm("f3", FormEventService.createBindingData(counter.get("f3")));
      const result: string = updater.getLastJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"publishCount":0'));
      expect(result).assertContain('"publishCount":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(updater.getCount()), String(1));
      expect(updater.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.get("f3")), String(0));
      expect(counter.get("f3")).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0003 end');
    })

    /**
     * @tc.name   testFormRefresh0004
     * @tc.number SUB_CCER_FREFRESH_01_0004
     * @tc.desc   卡片 "f4" 刷新时携带计数 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormRefresh0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0004 begin');
      const counter: FormPublishCounter = new FormPublishCounter();
      const updater: FakeFormUpdater = new FakeFormUpdater(false);

      updater.updateForm("f4", FormEventService.createBindingData(counter.get("f4")));
      const result: string = updater.getLastJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"publishCount":0'));
      expect(result).assertContain('"publishCount":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(updater.getCount()), String(1));
      expect(updater.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.get("f4")), String(0));
      expect(counter.get("f4")).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0004 end');
    })

    /**
     * @tc.name   testFormRefresh0005
     * @tc.number SUB_CCER_FREFRESH_01_0005
     * @tc.desc   卡片 "f5" 刷新时携带计数 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormRefresh0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0005 begin');
      const counter: FormPublishCounter = new FormPublishCounter();
      const updater: FakeFormUpdater = new FakeFormUpdater(false);

      updater.updateForm("f5", FormEventService.createBindingData(counter.get("f5")));
      const result: string = updater.getLastJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"publishCount":0'));
      expect(result).assertContain('"publishCount":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(updater.getCount()), String(1));
      expect(updater.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.get("f5")), String(0));
      expect(counter.get("f5")).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0005 end');
    })

    /**
     * @tc.name   testFormRefresh0006
     * @tc.number SUB_CCER_FREFRESH_01_0006
     * @tc.desc   卡片 "f6" 刷新时携带计数 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormRefresh0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0006 begin');
      const counter: FormPublishCounter = new FormPublishCounter();
      const updater: FakeFormUpdater = new FakeFormUpdater(false);

      updater.updateForm("f6", FormEventService.createBindingData(counter.get("f6")));
      const result: string = updater.getLastJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"publishCount":0'));
      expect(result).assertContain('"publishCount":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(updater.getCount()), String(1));
      expect(updater.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.get("f6")), String(0));
      expect(counter.get("f6")).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0006 end');
    })

    /**
     * @tc.name   testFormRefresh0007
     * @tc.number SUB_CCER_FREFRESH_01_0007
     * @tc.desc   卡片 "" 刷新时携带计数 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormRefresh0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0007 begin');
      const counter: FormPublishCounter = new FormPublishCounter();
      const updater: FakeFormUpdater = new FakeFormUpdater(false);

      updater.updateForm("", FormEventService.createBindingData(counter.get("")));
      const result: string = updater.getLastJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"publishCount":0'));
      expect(result).assertContain('"publishCount":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(updater.getCount()), String(1));
      expect(updater.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.get("")), String(0));
      expect(counter.get("")).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0007 end');
    })

    /**
     * @tc.name   testFormRefresh0008
     * @tc.number SUB_CCER_FREFRESH_01_0008
     * @tc.desc   卡片 "form-with-dash" 刷新时携带计数 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormRefresh0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0008 begin');
      const counter: FormPublishCounter = new FormPublishCounter();
      const updater: FakeFormUpdater = new FakeFormUpdater(false);

      updater.updateForm("form-with-dash", FormEventService.createBindingData(counter.get("form-with-dash")));
      const result: string = updater.getLastJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"publishCount":0'));
      expect(result).assertContain('"publishCount":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(updater.getCount()), String(1));
      expect(updater.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.get("form-with-dash")),
        String(0));
      expect(counter.get("form-with-dash")).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0008 end');
    })

    /**
     * @tc.name   testFormRefresh0009
     * @tc.number SUB_CCER_FREFRESH_01_0009
     * @tc.desc   卡片 "中文标识" 刷新时携带计数 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormRefresh0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0009 begin');
      const counter: FormPublishCounter = new FormPublishCounter();
      const updater: FakeFormUpdater = new FakeFormUpdater(false);

      updater.updateForm("中文标识", FormEventService.createBindingData(counter.get("中文标识")));
      const result: string = updater.getLastJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"publishCount":0'));
      expect(result).assertContain('"publishCount":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(updater.getCount()), String(1));
      expect(updater.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.get("中文标识")), String(0));
      expect(counter.get("中文标识")).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0009 end');
    })

    /**
     * @tc.name   testFormRefresh0010
     * @tc.number SUB_CCER_FREFRESH_01_0010
     * @tc.desc   卡片 "F" 刷新时携带计数 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormRefresh0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0010 begin');
      const counter: FormPublishCounter = new FormPublishCounter();
      const updater: FakeFormUpdater = new FakeFormUpdater(false);

      updater.updateForm("F", FormEventService.createBindingData(counter.get("F")));
      const result: string = updater.getLastJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"publishCount":0'));
      expect(result).assertContain('"publishCount":0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(updater.getCount()), String(1));
      expect(updater.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.get("F")), String(0));
      expect(counter.get("F")).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0010 end');
    })

    /**
     * @tc.name   testFormRefresh0011
     * @tc.number SUB_CCER_FREFRESH_01_0011
     * @tc.desc   卡片 "f1" 刷新时携带计数 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormRefresh0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0011 begin');
      const counter: FormPublishCounter = new FormPublishCounter();
      const updater: FakeFormUpdater = new FakeFormUpdater(false);
      counter.increment("f1");
      updater.updateForm("f1", FormEventService.createBindingData(counter.get("f1")));
      const result: string = updater.getLastJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"publishCount":1'));
      expect(result).assertContain('"publishCount":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(updater.getCount()), String(1));
      expect(updater.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.get("f1")), String(1));
      expect(counter.get("f1")).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0011 end');
    })

    /**
     * @tc.name   testFormRefresh0012
     * @tc.number SUB_CCER_FREFRESH_01_0012
     * @tc.desc   卡片 "f2" 刷新时携带计数 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormRefresh0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0012 begin');
      const counter: FormPublishCounter = new FormPublishCounter();
      const updater: FakeFormUpdater = new FakeFormUpdater(false);
      counter.increment("f2");
      updater.updateForm("f2", FormEventService.createBindingData(counter.get("f2")));
      const result: string = updater.getLastJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"publishCount":1'));
      expect(result).assertContain('"publishCount":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(updater.getCount()), String(1));
      expect(updater.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.get("f2")), String(1));
      expect(counter.get("f2")).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0012 end');
    })

    /**
     * @tc.name   testFormRefresh0013
     * @tc.number SUB_CCER_FREFRESH_01_0013
     * @tc.desc   卡片 "f3" 刷新时携带计数 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormRefresh0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0013 begin');
      const counter: FormPublishCounter = new FormPublishCounter();
      const updater: FakeFormUpdater = new FakeFormUpdater(false);
      counter.increment("f3");
      updater.updateForm("f3", FormEventService.createBindingData(counter.get("f3")));
      const result: string = updater.getLastJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"publishCount":1'));
      expect(result).assertContain('"publishCount":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(updater.getCount()), String(1));
      expect(updater.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.get("f3")), String(1));
      expect(counter.get("f3")).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0013 end');
    })

    /**
     * @tc.name   testFormRefresh0014
     * @tc.number SUB_CCER_FREFRESH_01_0014
     * @tc.desc   卡片 "f4" 刷新时携带计数 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormRefresh0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0014 begin');
      const counter: FormPublishCounter = new FormPublishCounter();
      const updater: FakeFormUpdater = new FakeFormUpdater(false);
      counter.increment("f4");
      updater.updateForm("f4", FormEventService.createBindingData(counter.get("f4")));
      const result: string = updater.getLastJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"publishCount":1'));
      expect(result).assertContain('"publishCount":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(updater.getCount()), String(1));
      expect(updater.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.get("f4")), String(1));
      expect(counter.get("f4")).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0014 end');
    })

    /**
     * @tc.name   testFormRefresh0015
     * @tc.number SUB_CCER_FREFRESH_01_0015
     * @tc.desc   卡片 "f5" 刷新时携带计数 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormRefresh0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0015 begin');
      const counter: FormPublishCounter = new FormPublishCounter();
      const updater: FakeFormUpdater = new FakeFormUpdater(false);
      counter.increment("f5");
      updater.updateForm("f5", FormEventService.createBindingData(counter.get("f5")));
      const result: string = updater.getLastJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"publishCount":1'));
      expect(result).assertContain('"publishCount":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(updater.getCount()), String(1));
      expect(updater.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.get("f5")), String(1));
      expect(counter.get("f5")).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0015 end');
    })

    /**
     * @tc.name   testFormRefresh0016
     * @tc.number SUB_CCER_FREFRESH_01_0016
     * @tc.desc   卡片 "f6" 刷新时携带计数 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormRefresh0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0016 begin');
      const counter: FormPublishCounter = new FormPublishCounter();
      const updater: FakeFormUpdater = new FakeFormUpdater(false);
      counter.increment("f6");
      updater.updateForm("f6", FormEventService.createBindingData(counter.get("f6")));
      const result: string = updater.getLastJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"publishCount":1'));
      expect(result).assertContain('"publishCount":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(updater.getCount()), String(1));
      expect(updater.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.get("f6")), String(1));
      expect(counter.get("f6")).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0016 end');
    })

    /**
     * @tc.name   testFormRefresh0017
     * @tc.number SUB_CCER_FREFRESH_01_0017
     * @tc.desc   卡片 "" 刷新时携带计数 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormRefresh0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0017 begin');
      const counter: FormPublishCounter = new FormPublishCounter();
      const updater: FakeFormUpdater = new FakeFormUpdater(false);
      counter.increment("");
      updater.updateForm("", FormEventService.createBindingData(counter.get("")));
      const result: string = updater.getLastJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"publishCount":1'));
      expect(result).assertContain('"publishCount":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(updater.getCount()), String(1));
      expect(updater.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.get("")), String(1));
      expect(counter.get("")).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0017 end');
    })

    /**
     * @tc.name   testFormRefresh0018
     * @tc.number SUB_CCER_FREFRESH_01_0018
     * @tc.desc   卡片 "form-with-dash" 刷新时携带计数 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormRefresh0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0018 begin');
      const counter: FormPublishCounter = new FormPublishCounter();
      const updater: FakeFormUpdater = new FakeFormUpdater(false);
      counter.increment("form-with-dash");
      updater.updateForm("form-with-dash", FormEventService.createBindingData(counter.get("form-with-dash")));
      const result: string = updater.getLastJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"publishCount":1'));
      expect(result).assertContain('"publishCount":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(updater.getCount()), String(1));
      expect(updater.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.get("form-with-dash")),
        String(1));
      expect(counter.get("form-with-dash")).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0018 end');
    })

    /**
     * @tc.name   testFormRefresh0019
     * @tc.number SUB_CCER_FREFRESH_01_0019
     * @tc.desc   卡片 "中文标识" 刷新时携带计数 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormRefresh0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0019 begin');
      const counter: FormPublishCounter = new FormPublishCounter();
      const updater: FakeFormUpdater = new FakeFormUpdater(false);
      counter.increment("中文标识");
      updater.updateForm("中文标识", FormEventService.createBindingData(counter.get("中文标识")));
      const result: string = updater.getLastJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"publishCount":1'));
      expect(result).assertContain('"publishCount":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(updater.getCount()), String(1));
      expect(updater.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.get("中文标识")), String(1));
      expect(counter.get("中文标识")).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0019 end');
    })

    /**
     * @tc.name   testFormRefresh0020
     * @tc.number SUB_CCER_FREFRESH_01_0020
     * @tc.desc   卡片 "F" 刷新时携带计数 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormRefresh0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0020 begin');
      const counter: FormPublishCounter = new FormPublishCounter();
      const updater: FakeFormUpdater = new FakeFormUpdater(false);
      counter.increment("F");
      updater.updateForm("F", FormEventService.createBindingData(counter.get("F")));
      const result: string = updater.getLastJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"publishCount":1'));
      expect(result).assertContain('"publishCount":1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(updater.getCount()), String(1));
      expect(updater.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.get("F")), String(1));
      expect(counter.get("F")).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0020 end');
    })

    /**
     * @tc.name   testFormRefresh0021
     * @tc.number SUB_CCER_FREFRESH_01_0021
     * @tc.desc   卡片 "f1" 刷新时携带计数 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormRefresh0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0021 begin');
      const counter: FormPublishCounter = new FormPublishCounter();
      const updater: FakeFormUpdater = new FakeFormUpdater(false);
      counter.increment("f1"); counter.increment("f1");
      updater.updateForm("f1", FormEventService.createBindingData(counter.get("f1")));
      const result: string = updater.getLastJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"publishCount":2'));
      expect(result).assertContain('"publishCount":2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(updater.getCount()), String(1));
      expect(updater.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.get("f1")), String(2));
      expect(counter.get("f1")).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0021 end');
    })

    /**
     * @tc.name   testFormRefresh0022
     * @tc.number SUB_CCER_FREFRESH_01_0022
     * @tc.desc   卡片 "f2" 刷新时携带计数 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormRefresh0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0022 begin');
      const counter: FormPublishCounter = new FormPublishCounter();
      const updater: FakeFormUpdater = new FakeFormUpdater(false);
      counter.increment("f2"); counter.increment("f2");
      updater.updateForm("f2", FormEventService.createBindingData(counter.get("f2")));
      const result: string = updater.getLastJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"publishCount":2'));
      expect(result).assertContain('"publishCount":2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(updater.getCount()), String(1));
      expect(updater.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.get("f2")), String(2));
      expect(counter.get("f2")).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0022 end');
    })

    /**
     * @tc.name   testFormRefresh0023
     * @tc.number SUB_CCER_FREFRESH_01_0023
     * @tc.desc   卡片 "f3" 刷新时携带计数 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormRefresh0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0023 begin');
      const counter: FormPublishCounter = new FormPublishCounter();
      const updater: FakeFormUpdater = new FakeFormUpdater(false);
      counter.increment("f3"); counter.increment("f3");
      updater.updateForm("f3", FormEventService.createBindingData(counter.get("f3")));
      const result: string = updater.getLastJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"publishCount":2'));
      expect(result).assertContain('"publishCount":2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(updater.getCount()), String(1));
      expect(updater.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.get("f3")), String(2));
      expect(counter.get("f3")).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0023 end');
    })

    /**
     * @tc.name   testFormRefresh0024
     * @tc.number SUB_CCER_FREFRESH_01_0024
     * @tc.desc   卡片 "f4" 刷新时携带计数 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormRefresh0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0024 begin');
      const counter: FormPublishCounter = new FormPublishCounter();
      const updater: FakeFormUpdater = new FakeFormUpdater(false);
      counter.increment("f4"); counter.increment("f4");
      updater.updateForm("f4", FormEventService.createBindingData(counter.get("f4")));
      const result: string = updater.getLastJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"publishCount":2'));
      expect(result).assertContain('"publishCount":2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(updater.getCount()), String(1));
      expect(updater.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.get("f4")), String(2));
      expect(counter.get("f4")).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0024 end');
    })

    /**
     * @tc.name   testFormRefresh0025
     * @tc.number SUB_CCER_FREFRESH_01_0025
     * @tc.desc   卡片 "f5" 刷新时携带计数 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormRefresh0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0025 begin');
      const counter: FormPublishCounter = new FormPublishCounter();
      const updater: FakeFormUpdater = new FakeFormUpdater(false);
      counter.increment("f5"); counter.increment("f5");
      updater.updateForm("f5", FormEventService.createBindingData(counter.get("f5")));
      const result: string = updater.getLastJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"publishCount":2'));
      expect(result).assertContain('"publishCount":2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(updater.getCount()), String(1));
      expect(updater.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.get("f5")), String(2));
      expect(counter.get("f5")).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0025 end');
    })

    /**
     * @tc.name   testFormRefresh0026
     * @tc.number SUB_CCER_FREFRESH_01_0026
     * @tc.desc   卡片 "f6" 刷新时携带计数 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormRefresh0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0026 begin');
      const counter: FormPublishCounter = new FormPublishCounter();
      const updater: FakeFormUpdater = new FakeFormUpdater(false);
      counter.increment("f6"); counter.increment("f6");
      updater.updateForm("f6", FormEventService.createBindingData(counter.get("f6")));
      const result: string = updater.getLastJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"publishCount":2'));
      expect(result).assertContain('"publishCount":2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(updater.getCount()), String(1));
      expect(updater.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.get("f6")), String(2));
      expect(counter.get("f6")).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0026 end');
    })

    /**
     * @tc.name   testFormRefresh0027
     * @tc.number SUB_CCER_FREFRESH_01_0027
     * @tc.desc   卡片 "" 刷新时携带计数 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormRefresh0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0027 begin');
      const counter: FormPublishCounter = new FormPublishCounter();
      const updater: FakeFormUpdater = new FakeFormUpdater(false);
      counter.increment(""); counter.increment("");
      updater.updateForm("", FormEventService.createBindingData(counter.get("")));
      const result: string = updater.getLastJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"publishCount":2'));
      expect(result).assertContain('"publishCount":2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(updater.getCount()), String(1));
      expect(updater.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.get("")), String(2));
      expect(counter.get("")).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0027 end');
    })

    /**
     * @tc.name   testFormRefresh0028
     * @tc.number SUB_CCER_FREFRESH_01_0028
     * @tc.desc   卡片 "form-with-dash" 刷新时携带计数 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormRefresh0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0028 begin');
      const counter: FormPublishCounter = new FormPublishCounter();
      const updater: FakeFormUpdater = new FakeFormUpdater(false);
      counter.increment("form-with-dash"); counter.increment("form-with-dash");
      updater.updateForm("form-with-dash", FormEventService.createBindingData(counter.get("form-with-dash")));
      const result: string = updater.getLastJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"publishCount":2'));
      expect(result).assertContain('"publishCount":2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(updater.getCount()), String(1));
      expect(updater.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.get("form-with-dash")),
        String(2));
      expect(counter.get("form-with-dash")).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0028 end');
    })

    /**
     * @tc.name   testFormRefresh0029
     * @tc.number SUB_CCER_FREFRESH_01_0029
     * @tc.desc   卡片 "中文标识" 刷新时携带计数 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormRefresh0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0029 begin');
      const counter: FormPublishCounter = new FormPublishCounter();
      const updater: FakeFormUpdater = new FakeFormUpdater(false);
      counter.increment("中文标识"); counter.increment("中文标识");
      updater.updateForm("中文标识", FormEventService.createBindingData(counter.get("中文标识")));
      const result: string = updater.getLastJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"publishCount":2'));
      expect(result).assertContain('"publishCount":2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(updater.getCount()), String(1));
      expect(updater.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.get("中文标识")), String(2));
      expect(counter.get("中文标识")).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0029 end');
    })

    /**
     * @tc.name   testFormRefresh0030
     * @tc.number SUB_CCER_FREFRESH_01_0030
     * @tc.desc   卡片 "F" 刷新时携带计数 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormRefresh0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0030 begin');
      const counter: FormPublishCounter = new FormPublishCounter();
      const updater: FakeFormUpdater = new FakeFormUpdater(false);
      counter.increment("F"); counter.increment("F");
      updater.updateForm("F", FormEventService.createBindingData(counter.get("F")));
      const result: string = updater.getLastJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"publishCount":2'));
      expect(result).assertContain('"publishCount":2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(updater.getCount()), String(1));
      expect(updater.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.get("F")), String(2));
      expect(counter.get("F")).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0030 end');
    })

    /**
     * @tc.name   testFormRefresh0031
     * @tc.number SUB_CCER_FREFRESH_01_0031
     * @tc.desc   刷新载荷携带累加后的计数与卡片标识
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormRefresh0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0031 begin');
      const counter: FormPublishCounter = new FormPublishCounter();
      const updater: FakeFormUpdater = new FakeFormUpdater(false);
      counter.increment("anchor_form");
      counter.increment("anchor_form");
      counter.increment("anchor_form");
      counter.increment("anchor_form");
      updater.updateForm("anchor_form", FormEventService.createBindingData(counter.get("anchor_form")));
      const result: string = updater.getLastJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('"publishCount":4'));
      expect(result).assertContain('"publishCount":4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(updater.getLastFormId()),
        String("anchor_form"));
      expect(updater.getLastFormId()).assertEqual("anchor_form");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(counter.get("anchor_form")),
        String(4));
      expect(counter.get("anchor_form")).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormRefresh0031 end');
    })

  })
}
