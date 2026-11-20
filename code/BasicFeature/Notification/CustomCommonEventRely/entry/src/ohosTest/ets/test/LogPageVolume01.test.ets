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
import Logger from '../../../main/ets/util/Logger';
import { CollectingSink } from './util/ModelSupport';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function logPageVolume01Test() {
  describe('LogPageVolume01Test', () => {

    /**
     * @tc.name   testLogPage0001
     * @tc.number SUB_CCER_LOGPAGE_01_0001
     * @tc.desc   第 1 种页面生命周期或事件日志写入级别 INFO 与固定前缀消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogPage0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0001 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.enter('Index')
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String("[Index] enter"));
      expect(result).assertEqual("[Index] enter");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0001 end');
    })

    /**
     * @tc.name   testLogPage0002
     * @tc.number SUB_CCER_LOGPAGE_01_0002
     * @tc.desc   第 2 种页面生命周期或事件日志写入级别 INFO 与固定前缀消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogPage0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0002 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.enter('PublishCard')
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String("[PublishCard] enter"));
      expect(result).assertEqual("[PublishCard] enter");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0002 end');
    })

    /**
     * @tc.name   testLogPage0003
     * @tc.number SUB_CCER_LOGPAGE_01_0003
     * @tc.desc   第 3 种页面生命周期或事件日志写入级别 INFO 与固定前缀消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogPage0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0003 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.enter('EntryFormAbility')
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String("[EntryFormAbility] enter"));
      expect(result).assertEqual("[EntryFormAbility] enter");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0003 end');
    })

    /**
     * @tc.name   testLogPage0004
     * @tc.number SUB_CCER_LOGPAGE_01_0004
     * @tc.desc   第 4 种页面生命周期或事件日志写入级别 INFO 与固定前缀消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogPage0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0004 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.enter('EntryAbility')
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String("[EntryAbility] enter"));
      expect(result).assertEqual("[EntryAbility] enter");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0004 end');
    })

    /**
     * @tc.name   testLogPage0005
     * @tc.number SUB_CCER_LOGPAGE_01_0005
     * @tc.desc   第 5 种页面生命周期或事件日志写入级别 INFO 与固定前缀消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogPage0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0005 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.enter('Home')
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String("[Home] enter"));
      expect(result).assertEqual("[Home] enter");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0005 end');
    })

    /**
     * @tc.name   testLogPage0006
     * @tc.number SUB_CCER_LOGPAGE_01_0006
     * @tc.desc   第 6 种页面生命周期或事件日志写入级别 INFO 与固定前缀消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogPage0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0006 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.enter('Detail')
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String("[Detail] enter"));
      expect(result).assertEqual("[Detail] enter");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0006 end');
    })

    /**
     * @tc.name   testLogPage0007
     * @tc.number SUB_CCER_LOGPAGE_01_0007
     * @tc.desc   第 7 种页面生命周期或事件日志写入级别 INFO 与固定前缀消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogPage0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0007 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.leave('Index')
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String("[Index] leave"));
      expect(result).assertEqual("[Index] leave");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0007 end');
    })

    /**
     * @tc.name   testLogPage0008
     * @tc.number SUB_CCER_LOGPAGE_01_0008
     * @tc.desc   第 8 种页面生命周期或事件日志写入级别 INFO 与固定前缀消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogPage0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0008 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.leave('PublishCard')
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String("[PublishCard] leave"));
      expect(result).assertEqual("[PublishCard] leave");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0008 end');
    })

    /**
     * @tc.name   testLogPage0009
     * @tc.number SUB_CCER_LOGPAGE_01_0009
     * @tc.desc   第 9 种页面生命周期或事件日志写入级别 INFO 与固定前缀消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogPage0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0009 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.leave('EntryFormAbility')
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String("[EntryFormAbility] leave"));
      expect(result).assertEqual("[EntryFormAbility] leave");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0009 end');
    })

    /**
     * @tc.name   testLogPage0010
     * @tc.number SUB_CCER_LOGPAGE_01_0010
     * @tc.desc   第 10 种页面生命周期或事件日志写入级别 INFO 与固定前缀消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogPage0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0010 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.leave('EntryAbility')
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String("[EntryAbility] leave"));
      expect(result).assertEqual("[EntryAbility] leave");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0010 end');
    })

    /**
     * @tc.name   testLogPage0011
     * @tc.number SUB_CCER_LOGPAGE_01_0011
     * @tc.desc   第 11 种页面生命周期或事件日志写入级别 INFO 与固定前缀消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogPage0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0011 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.leave('Home')
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String("[Home] leave"));
      expect(result).assertEqual("[Home] leave");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0011 end');
    })

    /**
     * @tc.name   testLogPage0012
     * @tc.number SUB_CCER_LOGPAGE_01_0012
     * @tc.desc   第 12 种页面生命周期或事件日志写入级别 INFO 与固定前缀消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogPage0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0012 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.leave('Detail')
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String("[Detail] leave"));
      expect(result).assertEqual("[Detail] leave");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0012 end');
    })

    /**
     * @tc.name   testLogPage0013
     * @tc.number SUB_CCER_LOGPAGE_01_0013
     * @tc.desc   第 13 种页面生命周期或事件日志写入级别 INFO 与固定前缀消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogPage0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0013 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.show('Index')
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String("[Index] onPageShow"));
      expect(result).assertEqual("[Index] onPageShow");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0013 end');
    })

    /**
     * @tc.name   testLogPage0014
     * @tc.number SUB_CCER_LOGPAGE_01_0014
     * @tc.desc   第 14 种页面生命周期或事件日志写入级别 INFO 与固定前缀消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogPage0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0014 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.show('PublishCard')
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String("[PublishCard] onPageShow"));
      expect(result).assertEqual("[PublishCard] onPageShow");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0014 end');
    })

    /**
     * @tc.name   testLogPage0015
     * @tc.number SUB_CCER_LOGPAGE_01_0015
     * @tc.desc   第 15 种页面生命周期或事件日志写入级别 INFO 与固定前缀消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogPage0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0015 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.show('EntryFormAbility')
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String("[EntryFormAbility] onPageShow"));
      expect(result).assertEqual("[EntryFormAbility] onPageShow");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0015 end');
    })

    /**
     * @tc.name   testLogPage0016
     * @tc.number SUB_CCER_LOGPAGE_01_0016
     * @tc.desc   第 16 种页面生命周期或事件日志写入级别 INFO 与固定前缀消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogPage0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0016 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.show('EntryAbility')
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String("[EntryAbility] onPageShow"));
      expect(result).assertEqual("[EntryAbility] onPageShow");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0016 end');
    })

    /**
     * @tc.name   testLogPage0017
     * @tc.number SUB_CCER_LOGPAGE_01_0017
     * @tc.desc   第 17 种页面生命周期或事件日志写入级别 INFO 与固定前缀消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogPage0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0017 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.hide('Index')
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String("[Index] onPageHide"));
      expect(result).assertEqual("[Index] onPageHide");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0017 end');
    })

    /**
     * @tc.name   testLogPage0018
     * @tc.number SUB_CCER_LOGPAGE_01_0018
     * @tc.desc   第 18 种页面生命周期或事件日志写入级别 INFO 与固定前缀消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogPage0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0018 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.hide('PublishCard')
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String("[PublishCard] onPageHide"));
      expect(result).assertEqual("[PublishCard] onPageHide");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0018 end');
    })

    /**
     * @tc.name   testLogPage0019
     * @tc.number SUB_CCER_LOGPAGE_01_0019
     * @tc.desc   第 19 种页面生命周期或事件日志写入级别 INFO 与固定前缀消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogPage0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0019 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.hide('EntryFormAbility')
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String("[EntryFormAbility] onPageHide"));
      expect(result).assertEqual("[EntryFormAbility] onPageHide");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0019 end');
    })

    /**
     * @tc.name   testLogPage0020
     * @tc.number SUB_CCER_LOGPAGE_01_0020
     * @tc.desc   第 20 种页面生命周期或事件日志写入级别 INFO 与固定前缀消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogPage0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0020 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.hide('EntryAbility')
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String("[EntryAbility] onPageHide"));
      expect(result).assertEqual("[EntryAbility] onPageHide");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0020 end');
    })

    /**
     * @tc.name   testLogPage0021
     * @tc.number SUB_CCER_LOGPAGE_01_0021
     * @tc.desc   第 21 种页面生命周期或事件日志写入级别 INFO 与固定前缀消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogPage0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0021 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('Index', 'subscribe')
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String("[Index] subscribe"));
      expect(result).assertEqual("[Index] subscribe");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0021 end');
    })

    /**
     * @tc.name   testLogPage0022
     * @tc.number SUB_CCER_LOGPAGE_01_0022
     * @tc.desc   第 22 种页面生命周期或事件日志写入级别 INFO 与固定前缀消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogPage0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0022 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('Index', 'publish')
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String("[Index] publish"));
      expect(result).assertEqual("[Index] publish");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0022 end');
    })

    /**
     * @tc.name   testLogPage0023
     * @tc.number SUB_CCER_LOGPAGE_01_0023
     * @tc.desc   第 23 种页面生命周期或事件日志写入级别 INFO 与固定前缀消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogPage0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0023 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('PublishCard', 'click')
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String("[PublishCard] click"));
      expect(result).assertEqual("[PublishCard] click");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0023 end');
    })

    /**
     * @tc.name   testLogPage0024
     * @tc.number SUB_CCER_LOGPAGE_01_0024
     * @tc.desc   第 24 种页面生命周期或事件日志写入级别 INFO 与固定前缀消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogPage0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0024 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('EntryFormAbility', 'onAddForm')
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String("[EntryFormAbility] onAddForm"));
      expect(result).assertEqual("[EntryFormAbility] onAddForm");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0024 end');
    })

    /**
     * @tc.name   testLogPage0025
     * @tc.number SUB_CCER_LOGPAGE_01_0025
     * @tc.desc   第 25 种页面生命周期或事件日志写入级别 INFO 与固定前缀消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogPage0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0025 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('Index', 'publish', 'OutApp')
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String("[Index] publish, OutApp"));
      expect(result).assertEqual("[Index] publish, OutApp");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0025 end');
    })

    /**
     * @tc.name   testLogPage0026
     * @tc.number SUB_CCER_LOGPAGE_01_0026
     * @tc.desc   第 26 种页面生命周期或事件日志写入级别 INFO 与固定前缀消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogPage0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0026 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('EntryFormAbility', 'onFormEvent', 'formId: f1')
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String("[EntryFormAbility] onFormEvent, formId: f1"));
      expect(result).assertEqual("[EntryFormAbility] onFormEvent, formId: f1");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0026 end');
    })

    /**
     * @tc.name   testLogPage0027
     * @tc.number SUB_CCER_LOGPAGE_01_0027
     * @tc.desc   第 27 种页面生命周期或事件日志写入级别 INFO 与固定前缀消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogPage0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0027 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('PublishCard', 'click', 'InApp')
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String("[PublishCard] click, InApp"));
      expect(result).assertEqual("[PublishCard] click, InApp");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0027 end');
    })

    /**
     * @tc.name   testLogPage0028
     * @tc.number SUB_CCER_LOGPAGE_01_0028
     * @tc.desc   第 28 种页面生命周期或事件日志写入级别 INFO 与固定前缀消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogPage0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0028 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('Home', 'subscribe', 'twice')
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String("[Home] subscribe, twice"));
      expect(result).assertEqual("[Home] subscribe, twice");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0028 end');
    })

    /**
     * @tc.name   testLogPage0029
     * @tc.number SUB_CCER_LOGPAGE_01_0029
     * @tc.desc   第 29 种页面生命周期或事件日志写入级别 INFO 与固定前缀消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogPage0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0029 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('Index', 'click', '')
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String("[Index] click"));
      expect(result).assertEqual("[Index] click");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0029 end');
    })

    /**
     * @tc.name   testLogPage0030
     * @tc.number SUB_CCER_LOGPAGE_01_0030
     * @tc.desc   第 30 种页面生命周期或事件日志写入级别 INFO 与固定前缀消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogPage0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0030 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.enter('Main Page')
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String("[Main Page] enter"));
      expect(result).assertEqual("[Main Page] enter");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0030 end');
    })

    /**
     * @tc.name   testLogPage0031
     * @tc.number SUB_CCER_LOGPAGE_01_0031
     * @tc.desc   生命周期与事件日志按调用顺序保存且格式互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogPage0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0031 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.enter('Index'); Logger.event('Index', 'publish', 'OutApp');
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String("[Index] publish, OutApp"));
      expect(result).assertEqual("[Index] publish, OutApp");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getMessageAt(0)),
        String('[Index] enter'));
      expect(sink.getMessageAt(0)).assertEqual('[Index] enter');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(2));
      expect(sink.getCount()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogPage0031 end');
    })

  })
}
