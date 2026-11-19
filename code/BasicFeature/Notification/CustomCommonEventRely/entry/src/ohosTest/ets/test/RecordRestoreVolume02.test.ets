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
import { EventRecord, EventRecordManager } from '../../../main/ets/feature/EventRecordManager';
import { EventRecordStore } from '../../../main/ets/feature/EventRecordStore';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function recordRestoreVolume02Test() {
  describe('RecordRestoreVolume02Test', () => {

    /**
     * @tc.name   testRestoreTaxonomy0001
     * @tc.number SUB_CCER_RSTREC_02_0001
     * @tc.desc   数据为布尔值的条目回放后被跳过
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0001 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":true,"sourceCode":1002,"receivedTime":"t"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(JSON.parse(text).length > result));
      expect(JSON.parse(text).length > result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(okText).length), String(1));
      expect(EventRecordStore.deserialize(okText).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0001 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0002
     * @tc.number SUB_CCER_RSTREC_02_0002
     * @tc.desc   数据为空引用的条目回放后被跳过
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0002 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":null,"sourceCode":1002,"receivedTime":"t"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(JSON.parse(text).length > result));
      expect(JSON.parse(text).length > result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(okText).length), String(1));
      expect(EventRecordStore.deserialize(okText).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0002 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0003
     * @tc.number SUB_CCER_RSTREC_02_0003
     * @tc.desc   数据为数组的条目回放后被跳过
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0003 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":[],"sourceCode":1002,"receivedTime":"t"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(JSON.parse(text).length > result));
      expect(JSON.parse(text).length > result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(okText).length), String(1));
      expect(EventRecordStore.deserialize(okText).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0003 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0004
     * @tc.number SUB_CCER_RSTREC_02_0004
     * @tc.desc   数据为对象的条目回放后被跳过
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0004 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":{},"sourceCode":1002,"receivedTime":"t"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(JSON.parse(text).length > result));
      expect(JSON.parse(text).length > result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(okText).length), String(1));
      expect(EventRecordStore.deserialize(okText).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0004 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0005
     * @tc.number SUB_CCER_RSTREC_02_0005
     * @tc.desc   数据为浮点数的条目回放后被跳过
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0005 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":2.75,"sourceCode":1002,"receivedTime":"t"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(JSON.parse(text).length > result));
      expect(JSON.parse(text).length > result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(okText).length), String(1));
      expect(EventRecordStore.deserialize(okText).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0005 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0006
     * @tc.number SUB_CCER_RSTREC_02_0006
     * @tc.desc   来源码为空引用的条目回放后被跳过
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0006 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"a","sourceCode":null,"receivedTime":"t"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(JSON.parse(text).length > result));
      expect(JSON.parse(text).length > result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(okText).length), String(1));
      expect(EventRecordStore.deserialize(okText).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0006 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0007
     * @tc.number SUB_CCER_RSTREC_02_0007
     * @tc.desc   来源码为布尔值的条目回放后被跳过
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0007 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"a","sourceCode":true,"receivedTime":"t"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(JSON.parse(text).length > result));
      expect(JSON.parse(text).length > result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(okText).length), String(1));
      expect(EventRecordStore.deserialize(okText).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0007 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0008
     * @tc.number SUB_CCER_RSTREC_02_0008
     * @tc.desc   正无穷来源码的条目回放后被跳过
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0008 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"a","sourceCode":1e999,"receivedTime":"t"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(JSON.parse(text).length > result));
      expect(JSON.parse(text).length > result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(okText).length), String(1));
      expect(EventRecordStore.deserialize(okText).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0008 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0009
     * @tc.number SUB_CCER_RSTREC_02_0009
     * @tc.desc   负无穷来源码的条目回放后被跳过
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0009 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"a","sourceCode":-1e999,"receivedTime":"t"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(JSON.parse(text).length > result));
      expect(JSON.parse(text).length > result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(okText).length), String(1));
      expect(EventRecordStore.deserialize(okText).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0009 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0010
     * @tc.number SUB_CCER_RSTREC_02_0010
     * @tc.desc   指数小数来源码的条目回放后被跳过
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0010 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"a","sourceCode":1e-3,"receivedTime":"t"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(JSON.parse(text).length > result));
      expect(JSON.parse(text).length > result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(okText).length), String(1));
      expect(EventRecordStore.deserialize(okText).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0010 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0011
     * @tc.number SUB_CCER_RSTREC_02_0011
     * @tc.desc   接收时间为布尔值的条目回放后被跳过
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0011 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"a","sourceCode":1002,"receivedTime":true}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(JSON.parse(text).length > result));
      expect(JSON.parse(text).length > result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(okText).length), String(1));
      expect(EventRecordStore.deserialize(okText).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0011 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0012
     * @tc.number SUB_CCER_RSTREC_02_0012
     * @tc.desc   接收时间为空引用的条目回放后被跳过
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0012 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"a","sourceCode":1002,"receivedTime":null}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(JSON.parse(text).length > result));
      expect(JSON.parse(text).length > result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(okText).length), String(1));
      expect(EventRecordStore.deserialize(okText).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0012 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0013
     * @tc.number SUB_CCER_RSTREC_02_0013
     * @tc.desc   接收时间为数组的条目回放后被跳过
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0013 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"a","sourceCode":1002,"receivedTime":[]}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(JSON.parse(text).length > result));
      expect(JSON.parse(text).length > result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(okText).length), String(1));
      expect(EventRecordStore.deserialize(okText).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0013 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0014
     * @tc.number SUB_CCER_RSTREC_02_0014
     * @tc.desc   接收时间为对象的条目回放后被跳过
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0014 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"a","sourceCode":1002,"receivedTime":{}}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(JSON.parse(text).length > result));
      expect(JSON.parse(text).length > result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(okText).length), String(1));
      expect(EventRecordStore.deserialize(okText).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0014 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0015
     * @tc.number SUB_CCER_RSTREC_02_0015
     * @tc.desc   条目本身为字符串时回放后被跳过
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0015 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '["plain-string"]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(JSON.parse(text).length > result));
      expect(JSON.parse(text).length > result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(okText).length), String(1));
      expect(EventRecordStore.deserialize(okText).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0015 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0016
     * @tc.number SUB_CCER_RSTREC_02_0016
     * @tc.desc   条目本身为数字时回放后被跳过
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0016 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[7]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(JSON.parse(text).length > result));
      expect(JSON.parse(text).length > result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(okText).length), String(1));
      expect(EventRecordStore.deserialize(okText).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0016 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0017
     * @tc.number SUB_CCER_RSTREC_02_0017
     * @tc.desc   条目本身为空引用时回放后被跳过
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0017 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[null]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(JSON.parse(text).length > result));
      expect(JSON.parse(text).length > result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(okText).length), String(1));
      expect(EventRecordStore.deserialize(okText).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0017 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0018
     * @tc.number SUB_CCER_RSTREC_02_0018
     * @tc.desc   条目本身为布尔值时回放后被跳过
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0018 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[true]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(JSON.parse(text).length > result));
      expect(JSON.parse(text).length > result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(okText).length), String(1));
      expect(EventRecordStore.deserialize(okText).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0018 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0019
     * @tc.number SUB_CCER_RSTREC_02_0019
     * @tc.desc   条目本身为嵌套数组时回放后被跳过
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0019 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[[]]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(JSON.parse(text).length > result));
      expect(JSON.parse(text).length > result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(okText).length), String(1));
      expect(EventRecordStore.deserialize(okText).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0019 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0020
     * @tc.number SUB_CCER_RSTREC_02_0020
     * @tc.desc   三个字段全非法的条目回放后被跳过
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0020 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":1,"sourceCode":"x","receivedTime":9}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(JSON.parse(text).length > result));
      expect(JSON.parse(text).length > result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(okText).length), String(1));
      expect(EventRecordStore.deserialize(okText).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0020 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0021
     * @tc.number SUB_CCER_RSTREC_02_0021
     * @tc.desc   接收时间为空串的条目回放后被保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0021 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"a","sourceCode":1002,"receivedTime":""}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].receivedTime), String(''));
      expect(restored[0].receivedTime).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored[0].data), String('a'));
      expect(restored[0].data).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0021 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0022
     * @tc.number SUB_CCER_RSTREC_02_0022
     * @tc.desc   接收时间为自由文本的条目回放后被保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0022 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"a","sourceCode":1002,"receivedTime":"not-a-time"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].receivedTime), String('not-a-time'));
      expect(restored[0].receivedTime).assertEqual('not-a-time');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].sourceName), String('page'));
      expect(restored[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0022 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0023
     * @tc.number SUB_CCER_RSTREC_02_0023
     * @tc.desc   接收时间为长文本的条目回放后被保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0023 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"a","sourceCode":1002,"receivedTime":"2026-11-18 08:09:10.123456"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].receivedTime), String('2026-11-18 08:09:10.123456'));
      expect(restored[0].receivedTime).assertEqual('2026-11-18 08:09:10.123456');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(restored[0].sequence === 1));
      expect(restored[0].sequence === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0023 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0024
     * @tc.number SUB_CCER_RSTREC_02_0024
     * @tc.desc   数据含 Unicode 转义序列时按转义后的值回放
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0024 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"\\u0041\\u0042","sourceCode":1002,"receivedTime":"t"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored[0].data), String('AB'));
      expect(restored[0].data).assertEqual('AB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(restored[0].sequence === 1));
      expect(restored[0].sequence === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0024 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0025
     * @tc.number SUB_CCER_RSTREC_02_0025
     * @tc.desc   数据含引号转义时按转义后的值回放
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0025 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"a\\"b","sourceCode":1002,"receivedTime":"t"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored[0].data), String('a"b'));
      expect(restored[0].data).assertEqual('a"b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].sourceName), String('page'));
      expect(restored[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0025 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0026
     * @tc.number SUB_CCER_RSTREC_02_0026
     * @tc.desc   长度为 64 KB 的数据条目回放后被保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0026 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"' + 'x'.repeat(65536) + '","sourceCode":1002,"receivedTime":"t"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(restored[0].data.length === 65536));
      expect(restored[0].data.length === 65536).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].sourceName), String('page'));
      expect(restored[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0026 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0027
     * @tc.number SUB_CCER_RSTREC_02_0027
     * @tc.desc   超过 64 KB 的数据条目回放后被跳过并给出校验原因
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0027 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"' + 'x'.repeat(65537) + '","sourceCode":1002,"receivedTime":"t"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordManager.validateData('x'.repeat(65537)).length > 0));
      expect(EventRecordManager.validateData('x'.repeat(65537)).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(okText).length), String(1));
      expect(EventRecordStore.deserialize(okText).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0027 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0028
     * @tc.number SUB_CCER_RSTREC_02_0028
     * @tc.desc   指数来源码 1e3 解析为整数 1000 后保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0028 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"a","sourceCode":1e3,"receivedTime":"t"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].sourceCode), String(1000));
      expect(restored[0].sourceCode).assertEqual(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].sourceName), String('external'));
      expect(restored[0].sourceName).assertEqual('external');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0028 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0029
     * @tc.number SUB_CCER_RSTREC_02_0029
     * @tc.desc   来源码为零的条目回放后被保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0029 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"a","sourceCode":0,"receivedTime":"t"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].sourceCode), String(0));
      expect(restored[0].sourceCode).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].sourceName), String('external'));
      expect(restored[0].sourceName).assertEqual('external');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0029 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0030
     * @tc.number SUB_CCER_RSTREC_02_0030
     * @tc.desc   来源码为负零的条目回放后被保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0030 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"a","sourceCode":-0,"receivedTime":"t"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].sourceCode), String(0));
      expect(restored[0].sourceCode).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].sourceName), String('external'));
      expect(restored[0].sourceName).assertEqual('external');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0030 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0031
     * @tc.number SUB_CCER_RSTREC_02_0031
     * @tc.desc   来源码为最大安全整数时回放后被保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0031 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"a","sourceCode":9007199254740992,"receivedTime":"t"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].sourceCode), String(9007199254740992));
      expect(restored[0].sourceCode).assertEqual(9007199254740992);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(restored[0].sequence === 1));
      expect(restored[0].sequence === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0031 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0032
     * @tc.number SUB_CCER_RSTREC_02_0032
     * @tc.desc   数字 sequence 字段回放时被忽略并重新编号
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0032 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"a","sequence":99,"sourceCode":1002,"receivedTime":"t"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored[0].sequence), String(1));
      expect(restored[0].sequence).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored[0].data), String('a'));
      expect(restored[0].data).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0032 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0033
     * @tc.number SUB_CCER_RSTREC_02_0033
     * @tc.desc   字符串 sequence 字段回放时被忽略并重新编号
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0033 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"a","sequence":"9","sourceCode":1002,"receivedTime":"t"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored[0].sequence), String(1));
      expect(restored[0].sequence).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored[0].data), String('a'));
      expect(restored[0].data).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0033 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0034
     * @tc.number SUB_CCER_RSTREC_02_0034
     * @tc.desc   重复 data 键的条目按后出现的值回放
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0034 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"first","data":"second","sourceCode":1002,"receivedTime":"t"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].data), String('second'));
      expect(restored[0].data).assertEqual('second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].sourceName), String('page'));
      expect(restored[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0034 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0035
     * @tc.number SUB_CCER_RSTREC_02_0035
     * @tc.desc   重复 sourceCode 键的条目按后出现的值回放
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0035 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"a","sourceCode":1001,"sourceCode":1002,"receivedTime":"t"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].sourceCode), String(1002));
      expect(restored[0].sourceCode).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].sourceName), String('page'));
      expect(restored[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0035 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0036
     * @tc.number SUB_CCER_RSTREC_02_0036
     * @tc.desc   重复 receivedTime 键的条目按后出现的值回放
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0036 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"a","sourceCode":1002,"receivedTime":"first","receivedTime":"08:09:10"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].receivedTime), String('08:09:10'));
      expect(restored[0].receivedTime).assertEqual('08:09:10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(restored[0].sequence === 1));
      expect(restored[0].sequence === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0036 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0037
     * @tc.number SUB_CCER_RSTREC_02_0037
     * @tc.desc   合法在前非法在后的条目回放后仅保留合法条目
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0037 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"a","sourceCode":1002,"receivedTime":"t"},{"data":true,"sourceCode":1002,"receiv'
        + 'edTime":"t"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored[0].data), String('a'));
      expect(restored[0].data).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored[0].sequence), String(1));
      expect(restored[0].sequence).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0037 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0038
     * @tc.number SUB_CCER_RSTREC_02_0038
     * @tc.desc   非法在前合法在后的条目回放后仅保留合法条目
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0038 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":null,"sourceCode":1002,"receivedTime":"t"},{"data":"b","sourceCode":1002,"receiv'
        + 'edTime":"t"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored[0].data), String('b'));
      expect(restored[0].data).assertEqual('b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored[0].sequence), String(1));
      expect(restored[0].sequence).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0038 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0039
     * @tc.number SUB_CCER_RSTREC_02_0039
     * @tc.desc   三类非法条目全部回放失败而合法对照组可回放
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0039 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":true,"sourceCode":1002,"receivedTime":"t"},{"data":"a","sourceCode":null,"receiv'
        + 'edTime":"t"},{"data":"a","sourceCode":1002,"receivedTime":9}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(JSON.parse(text).length > result));
      expect(JSON.parse(text).length > result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(okText).length), String(1));
      expect(EventRecordStore.deserialize(okText).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0039 end');
    })

    /**
     * @tc.name   testRestoreTaxonomy0040
     * @tc.number SUB_CCER_RSTREC_02_0040
     * @tc.desc   五条混合条目回放后仅三条合法条目保留且序号连续
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreTaxonomy0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0040 begin');
      const okText: string = '[{"data":"ok","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"a","sourceCode":1002,"receivedTime":"t"},{"data":true,"sourceCode":1002,"receiv'
        + 'edTime":"t"},{"data":"b","sourceCode":1002,"receivedTime":"t"},{"data":null,"sourceCode":'
        + '1002,"receivedTime":"t"},{"data":"c","sourceCode":1002,"receivedTime":"t"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored[0].data), String('a'));
      expect(restored[0].data).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored[1].sequence), String(2));
      expect(restored[1].sequence).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored[2].data), String('c'));
      expect(restored[2].data).assertEqual('c');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored[2].sequence), String(3));
      expect(restored[2].sequence).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreTaxonomy0040 end');
    })

  })
}
