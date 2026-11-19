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

export default function logPageVolume02Test() {
  describe('LogPageVolume02Test', () => {

    /**
     * @tc.name   testLogDetail0001
     * @tc.number SUB_CCER_LOGPAGE_02_0001
     * @tc.desc   日志详情 Index publish 写入 INFO 级别并保留内容
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogDetail0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0001 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('Index', 'publish', 'code: 1');
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('[Index] publish, code: 1'));
      expect(result).assertEqual('[Index] publish, code: 1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sink.getLastLevel()), String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0001 end');
    })

    /**
     * @tc.name   testLogDetail0002
     * @tc.number SUB_CCER_LOGPAGE_02_0002
     * @tc.desc   日志详情 Index subscribe 写入 INFO 级别并保留内容
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogDetail0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0002 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('Index', 'subscribe', 'value=2');
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('[Index] subscribe, value=2'));
      expect(result).assertEqual('[Index] subscribe, value=2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sink.getLastLevel()), String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0002 end');
    })

    /**
     * @tc.name   testLogDetail0003
     * @tc.number SUB_CCER_LOGPAGE_02_0003
     * @tc.desc   日志详情 PublishCard click 写入 INFO 级别并保留内容
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogDetail0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0003 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('PublishCard', 'click', 'seq #3');
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('[PublishCard] click, seq #3'));
      expect(result).assertEqual('[PublishCard] click, seq #3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sink.getLastLevel()), String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0003 end');
    })

    /**
     * @tc.name   testLogDetail0004
     * @tc.number SUB_CCER_LOGPAGE_02_0004
     * @tc.desc   日志详情 EntryFormAbility onFormEvent 写入 INFO 级别并保留内容
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogDetail0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0004 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('EntryFormAbility', 'onFormEvent', 'formId: f2');
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('[EntryFormAbility] onFormEvent, formId: f2'));
      expect(result).assertEqual('[EntryFormAbility] onFormEvent, formId: f2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sink.getLastLevel()), String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0004 end');
    })

    /**
     * @tc.name   testLogDetail0005
     * @tc.number SUB_CCER_LOGPAGE_02_0005
     * @tc.desc   日志详情 Detail share 写入 INFO 级别并保留内容
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogDetail0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0005 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('Detail', 'share', 'msg "quoted"');
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('[Detail] share, msg "quoted"'));
      expect(result).assertEqual('[Detail] share, msg "quoted"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sink.getLastLevel()), String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0005 end');
    })

    /**
     * @tc.name   testLogDetail0006
     * @tc.number SUB_CCER_LOGPAGE_02_0006
     * @tc.desc   日志详情 Home update 写入 INFO 级别并保留内容
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogDetail0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0006 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('Home', 'update', 'it\'s fine');
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('[Home] update, it\'s fine'));
      expect(result).assertEqual('[Home] update, it\'s fine');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sink.getLastLevel()), String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0006 end');
    })

    /**
     * @tc.name   testLogDetail0007
     * @tc.number SUB_CCER_LOGPAGE_02_0007
     * @tc.desc   日志详情 Index input 写入 INFO 级别并保留内容
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogDetail0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0007 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('Index', 'input', 'a,b,c');
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('[Index] input, a,b,c'));
      expect(result).assertEqual('[Index] input, a,b,c');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sink.getLastLevel()), String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0007 end');
    })

    /**
     * @tc.name   testLogDetail0008
     * @tc.number SUB_CCER_LOGPAGE_02_0008
     * @tc.desc   日志详情 Home path 写入 INFO 级别并保留内容
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogDetail0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0008 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('Home', 'path', 'a\\b\\c');
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('[Home] path, a\\b\\c'));
      expect(result).assertEqual('[Home] path, a\\b\\c');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sink.getLastLevel()), String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0008 end');
    })

    /**
     * @tc.name   testLogDetail0009
     * @tc.number SUB_CCER_LOGPAGE_02_0009
     * @tc.desc   日志详情 Detail uni 写入 INFO 级别并保留内容
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogDetail0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0009 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('Detail', 'uni', '中文详情');
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('[Detail] uni, 中文详情'));
      expect(result).assertEqual('[Detail] uni, 中文详情');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sink.getLastLevel()), String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0009 end');
    })

    /**
     * @tc.name   testLogDetail0010
     * @tc.number SUB_CCER_LOGPAGE_02_0010
     * @tc.desc   日志详情 Detail korean 写入 INFO 级别并保留内容
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogDetail0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0010 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('Detail', 'korean', '한국어 상세');
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('[Detail] korean, 한국어 상세'));
      expect(result).assertEqual('[Detail] korean, 한국어 상세');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sink.getLastLevel()), String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0010 end');
    })

    /**
     * @tc.name   testLogDetail0011
     * @tc.number SUB_CCER_LOGPAGE_02_0011
     * @tc.desc   日志详情 Index emoji 写入 INFO 级别并保留内容
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogDetail0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0011 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('Index', 'emoji', 'rocket 🚀 here');
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('[Index] emoji, rocket 🚀 here'));
      expect(result).assertEqual('[Index] emoji, rocket 🚀 here');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sink.getLastLevel()), String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0011 end');
    })

    /**
     * @tc.name   testLogDetail0012
     * @tc.number SUB_CCER_LOGPAGE_02_0012
     * @tc.desc   日志详情 Index space 写入 INFO 级别并保留内容
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogDetail0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0012 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('Index', 'space', ' ');
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('[Index] space,  '));
      expect(result).assertEqual('[Index] space,  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sink.getLastLevel()), String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0012 end');
    })

    /**
     * @tc.name   testLogDetail0013
     * @tc.number SUB_CCER_LOGPAGE_02_0013
     * @tc.desc   日志详情 Index wide 写入 INFO 级别并保留内容
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogDetail0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0013 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('Index', 'wide', '  two');
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('[Index] wide,   two'));
      expect(result).assertEqual('[Index] wide,   two');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sink.getLastLevel()), String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0013 end');
    })

    /**
     * @tc.name   testLogDetail0014
     * @tc.number SUB_CCER_LOGPAGE_02_0014
     * @tc.desc   日志详情 Index tail 写入 INFO 级别并保留内容
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogDetail0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0014 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('Index', 'tail', 'tail  ');
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('[Index] tail, tail  '));
      expect(result).assertEqual('[Index] tail, tail  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sink.getLastLevel()), String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0014 end');
    })

    /**
     * @tc.name   testLogDetail0015
     * @tc.number SUB_CCER_LOGPAGE_02_0015
     * @tc.desc   日志详情 Index tab 写入 INFO 级别并保留内容
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogDetail0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0015 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('Index', 'tab', 'a\tb');
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('[Index] tab, a\tb'));
      expect(result).assertEqual('[Index] tab, a\tb');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sink.getLastLevel()), String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0015 end');
    })

    /**
     * @tc.name   testLogDetail0016
     * @tc.number SUB_CCER_LOGPAGE_02_0016
     * @tc.desc   日志详情 Index nl 写入 INFO 级别并保留内容
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogDetail0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0016 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('Index', 'nl', 'x\nz');
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('[Index] nl, x\nz'));
      expect(result).assertEqual('[Index] nl, x\nz');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sink.getLastLevel()), String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0016 end');
    })

    /**
     * @tc.name   testLogDetail0017
     * @tc.number SUB_CCER_LOGPAGE_02_0017
     * @tc.desc   日志详情 中文页 事件 写入 INFO 级别并保留内容
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogDetail0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0017 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('中文页', '事件', '混合详情');
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('[中文页] 事件, 混合详情'));
      expect(result).assertEqual('[中文页] 事件, 混合详情');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sink.getLastLevel()), String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0017 end');
    })

    /**
     * @tc.name   testLogDetail0018
     * @tc.number SUB_CCER_LOGPAGE_02_0018
     * @tc.desc   日志详情 My Page multi word 写入 INFO 级别并保留内容
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogDetail0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0018 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('My Page', 'multi word', 'd1');
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('[My Page] multi word, d1'));
      expect(result).assertEqual('[My Page] multi word, d1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sink.getLastLevel()), String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0018 end');
    })

    /**
     * @tc.name   testLogDetail0019
     * @tc.number SUB_CCER_LOGPAGE_02_0019
     * @tc.desc   日志详情 Detail clear 写入 INFO 级别并保留内容
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogDetail0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0019 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('Detail', 'clear', '');
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('[Detail] clear'));
      expect(result).assertEqual('[Detail] clear');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sink.getLastLevel()), String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0019 end');
    })

    /**
     * @tc.name   testLogDetail0020
     * @tc.number SUB_CCER_LOGPAGE_02_0020
     * @tc.desc   日志详情 EntryAbility launch 写入 INFO 级别并保留内容
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogDetail0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0020 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('EntryAbility', 'launch');
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('[EntryAbility] launch'));
      expect(result).assertEqual('[EntryAbility] launch');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sink.getLastLevel()), String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0020 end');
    })

    /**
     * @tc.name   testLogDetail0021
     * @tc.number SUB_CCER_LOGPAGE_02_0021
     * @tc.desc   日志详情 Form-02 refresh 写入 INFO 级别并保留内容
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogDetail0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0021 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('Form-02', 'refresh');
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('[Form-02] refresh'));
      expect(result).assertEqual('[Form-02] refresh');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sink.getLastLevel()), String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0021 end');
    })

    /**
     * @tc.name   testLogDetail0022
     * @tc.number SUB_CCER_LOGPAGE_02_0022
     * @tc.desc   info 多参数按逗号加空格拼接为一条 INFO 日志
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogDetail0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0022 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.info('a', 'b');
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a, b'));
      expect(result).assertEqual('a, b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sink.getLastLevel()), String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0022 end');
    })

    /**
     * @tc.name   testLogDetail0023
     * @tc.number SUB_CCER_LOGPAGE_02_0023
     * @tc.desc   info 多参数按逗号加空格拼接为一条 INFO 日志
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogDetail0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0023 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.info('x', 'y', 'z');
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x, y, z'));
      expect(result).assertEqual('x, y, z');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sink.getLastLevel()), String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0023 end');
    })

    /**
     * @tc.name   testLogDetail0024
     * @tc.number SUB_CCER_LOGPAGE_02_0024
     * @tc.desc   debug 多参数按逗号加空格拼接为一条 DEBUG 日志
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogDetail0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0024 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.debug('1', '2', '3');
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1, 2, 3'));
      expect(result).assertEqual('1, 2, 3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sink.getLastLevel()), String('DEBUG'));
      expect(sink.getLastLevel()).assertEqual('DEBUG');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0024 end');
    })

    /**
     * @tc.name   testLogDetail0025
     * @tc.number SUB_CCER_LOGPAGE_02_0025
     * @tc.desc   warn 多参数按逗号加空格拼接为一条 WARN 日志
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogDetail0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0025 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.warn('d', 'e', 'f', 'g');
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('d, e, f, g'));
      expect(result).assertEqual('d, e, f, g');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sink.getLastLevel()), String('WARN'));
      expect(sink.getLastLevel()).assertEqual('WARN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0025 end');
    })

    /**
     * @tc.name   testLogDetail0026
     * @tc.number SUB_CCER_LOGPAGE_02_0026
     * @tc.desc   error 多参数按逗号加空格拼接为一条 ERROR 日志
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogDetail0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0026 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.error('p', 'q');
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('p, q'));
      expect(result).assertEqual('p, q');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sink.getLastLevel()), String('ERROR'));
      expect(sink.getLastLevel()).assertEqual('ERROR');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0026 end');
    })

    /**
     * @tc.name   testLogDetail0027
     * @tc.number SUB_CCER_LOGPAGE_02_0027
     * @tc.desc   中文警告内容写入 WARN 级别
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogDetail0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0027 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.warn('卡片刷新失败');
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('卡片刷新失败'));
      expect(result).assertEqual('卡片刷新失败');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sink.getLastLevel()), String('WARN'));
      expect(sink.getLastLevel()).assertEqual('WARN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0027 end');
    })

    /**
     * @tc.name   testLogDetail0028
     * @tc.number SUB_CCER_LOGPAGE_02_0028
     * @tc.desc   中文错误内容写入 ERROR 级别
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogDetail0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0028 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.error('发布失败');
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('发布失败'));
      expect(result).assertEqual('发布失败');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sink.getLastLevel()), String('ERROR'));
      expect(sink.getLastLevel()).assertEqual('ERROR');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0028 end');
    })

    /**
     * @tc.name   testLogDetail0029
     * @tc.number SUB_CCER_LOGPAGE_02_0029
     * @tc.desc   日志详情 Home receive 写入 INFO 级别并保留内容
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogDetail0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0029 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('Home', 'receive', 'data: 中文');
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('[Home] receive, data: 中文'));
      expect(result).assertEqual('[Home] receive, data: 中文');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sink.getLastLevel()), String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(1));
      expect(sink.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0029 end');
    })

    /**
     * @tc.name   testLogDetail0030
     * @tc.number SUB_CCER_LOGPAGE_02_0030
     * @tc.desc   生命周期与事件日志按顺序写入且格式互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogDetail0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0030 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.enter('BoundaryPage'); Logger.event('BoundaryPage', 'step', 'one');
      Logger.setSink(null);
      const result: string = sink.getLastMessage();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('[BoundaryPage] step, one'));
      expect(result).assertEqual('[BoundaryPage] step, one');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(sink.getMessageAt(0)), String('[BoundaryPage] enter'));
      expect(sink.getMessageAt(0)).assertEqual('[BoundaryPage] enter');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getCount()), String(2));
      expect(sink.getCount()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogDetail0030 end');
    })

  })
}
