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

export default function logSinkTest() {
  describe('LogSinkVolume01Test', () => {

    /**
     * @tc.name   testLogSink0001
     * @tc.number SUB_CCER_LOGSINK_01_0001
     * @tc.desc   第 1 种日志调用写入级别 DEBUG 与拼接后的消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogSink0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0001 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.debug('a')
      Logger.setSink(null);
      const result: number = sink.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('DEBUG'));
      expect(sink.getLastLevel()).assertEqual('DEBUG');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastMessage()),
        String("a"));
      expect(sink.getLastMessage()).assertEqual("a");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0001 end');
    })

    /**
     * @tc.name   testLogSink0002
     * @tc.number SUB_CCER_LOGSINK_01_0002
     * @tc.desc   第 2 种日志调用写入级别 DEBUG 与拼接后的消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogSink0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0002 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.debug('a', 'b')
      Logger.setSink(null);
      const result: number = sink.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('DEBUG'));
      expect(sink.getLastLevel()).assertEqual('DEBUG');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastMessage()),
        String("a, b"));
      expect(sink.getLastMessage()).assertEqual("a, b");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0002 end');
    })

    /**
     * @tc.name   testLogSink0003
     * @tc.number SUB_CCER_LOGSINK_01_0003
     * @tc.desc   第 3 种日志调用写入级别 INFO 与拼接后的消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogSink0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0003 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.info('a')
      Logger.setSink(null);
      const result: number = sink.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastMessage()),
        String("a"));
      expect(sink.getLastMessage()).assertEqual("a");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0003 end');
    })

    /**
     * @tc.name   testLogSink0004
     * @tc.number SUB_CCER_LOGSINK_01_0004
     * @tc.desc   第 4 种日志调用写入级别 INFO 与拼接后的消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogSink0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0004 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.info('a', 'b', 'c')
      Logger.setSink(null);
      const result: number = sink.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastMessage()),
        String("a, b, c"));
      expect(sink.getLastMessage()).assertEqual("a, b, c");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0004 end');
    })

    /**
     * @tc.name   testLogSink0005
     * @tc.number SUB_CCER_LOGSINK_01_0005
     * @tc.desc   第 5 种日志调用写入级别 WARN 与拼接后的消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogSink0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0005 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.warn('w')
      Logger.setSink(null);
      const result: number = sink.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('WARN'));
      expect(sink.getLastLevel()).assertEqual('WARN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastMessage()),
        String("w"));
      expect(sink.getLastMessage()).assertEqual("w");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0005 end');
    })

    /**
     * @tc.name   testLogSink0006
     * @tc.number SUB_CCER_LOGSINK_01_0006
     * @tc.desc   第 6 种日志调用写入级别 WARN 与拼接后的消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogSink0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0006 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.warn('w', 'x')
      Logger.setSink(null);
      const result: number = sink.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('WARN'));
      expect(sink.getLastLevel()).assertEqual('WARN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastMessage()),
        String("w, x"));
      expect(sink.getLastMessage()).assertEqual("w, x");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0006 end');
    })

    /**
     * @tc.name   testLogSink0007
     * @tc.number SUB_CCER_LOGSINK_01_0007
     * @tc.desc   第 7 种日志调用写入级别 ERROR 与拼接后的消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogSink0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0007 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.error('e')
      Logger.setSink(null);
      const result: number = sink.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('ERROR'));
      expect(sink.getLastLevel()).assertEqual('ERROR');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastMessage()),
        String("e"));
      expect(sink.getLastMessage()).assertEqual("e");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0007 end');
    })

    /**
     * @tc.name   testLogSink0008
     * @tc.number SUB_CCER_LOGSINK_01_0008
     * @tc.desc   第 8 种日志调用写入级别 ERROR 与拼接后的消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogSink0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0008 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.error('e', 'f')
      Logger.setSink(null);
      const result: number = sink.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('ERROR'));
      expect(sink.getLastLevel()).assertEqual('ERROR');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastMessage()),
        String("e, f"));
      expect(sink.getLastMessage()).assertEqual("e, f");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0008 end');
    })

    /**
     * @tc.name   testLogSink0009
     * @tc.number SUB_CCER_LOGSINK_01_0009
     * @tc.desc   第 9 种日志调用写入级别 INFO 与拼接后的消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogSink0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0009 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.enter('Index')
      Logger.setSink(null);
      const result: number = sink.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastMessage()),
        String("[Index] enter"));
      expect(sink.getLastMessage()).assertEqual("[Index] enter");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0009 end');
    })

    /**
     * @tc.name   testLogSink0010
     * @tc.number SUB_CCER_LOGSINK_01_0010
     * @tc.desc   第 10 种日志调用写入级别 INFO 与拼接后的消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogSink0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0010 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.leave('Index')
      Logger.setSink(null);
      const result: number = sink.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastMessage()),
        String("[Index] leave"));
      expect(sink.getLastMessage()).assertEqual("[Index] leave");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0010 end');
    })

    /**
     * @tc.name   testLogSink0011
     * @tc.number SUB_CCER_LOGSINK_01_0011
     * @tc.desc   第 11 种日志调用写入级别 INFO 与拼接后的消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogSink0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0011 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.show('Index')
      Logger.setSink(null);
      const result: number = sink.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastMessage()),
        String("[Index] onPageShow"));
      expect(sink.getLastMessage()).assertEqual("[Index] onPageShow");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0011 end');
    })

    /**
     * @tc.name   testLogSink0012
     * @tc.number SUB_CCER_LOGSINK_01_0012
     * @tc.desc   第 12 种日志调用写入级别 INFO 与拼接后的消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogSink0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0012 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.hide('Index')
      Logger.setSink(null);
      const result: number = sink.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastMessage()),
        String("[Index] onPageHide"));
      expect(sink.getLastMessage()).assertEqual("[Index] onPageHide");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0012 end');
    })

    /**
     * @tc.name   testLogSink0013
     * @tc.number SUB_CCER_LOGSINK_01_0013
     * @tc.desc   第 13 种日志调用写入级别 INFO 与拼接后的消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogSink0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0013 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('Index', 'click')
      Logger.setSink(null);
      const result: number = sink.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastMessage()),
        String("[Index] click"));
      expect(sink.getLastMessage()).assertEqual("[Index] click");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0013 end');
    })

    /**
     * @tc.name   testLogSink0014
     * @tc.number SUB_CCER_LOGSINK_01_0014
     * @tc.desc   第 14 种日志调用写入级别 INFO 与拼接后的消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogSink0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0014 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('Index', 'click', 'detail')
      Logger.setSink(null);
      const result: number = sink.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastMessage()),
        String("[Index] click, detail"));
      expect(sink.getLastMessage()).assertEqual("[Index] click, detail");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0014 end');
    })

    /**
     * @tc.name   testLogSink0015
     * @tc.number SUB_CCER_LOGSINK_01_0015
     * @tc.desc   第 15 种日志调用写入级别 INFO 与拼接后的消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogSink0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0015 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('Index', 'click', '')
      Logger.setSink(null);
      const result: number = sink.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastMessage()),
        String("[Index] click"));
      expect(sink.getLastMessage()).assertEqual("[Index] click");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0015 end');
    })

    /**
     * @tc.name   testLogSink0016
     * @tc.number SUB_CCER_LOGSINK_01_0016
     * @tc.desc   第 16 种日志调用写入级别 INFO 与拼接后的消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogSink0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0016 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.info('')
      Logger.setSink(null);
      const result: number = sink.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastMessage()),
        String(""));
      expect(sink.getLastMessage()).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0016 end');
    })

    /**
     * @tc.name   testLogSink0017
     * @tc.number SUB_CCER_LOGSINK_01_0017
     * @tc.desc   第 17 种日志调用写入级别 INFO 与拼接后的消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogSink0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0017 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.info('中文日志')
      Logger.setSink(null);
      const result: number = sink.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastMessage()),
        String("中文日志"));
      expect(sink.getLastMessage()).assertEqual("中文日志");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0017 end');
    })

    /**
     * @tc.name   testLogSink0018
     * @tc.number SUB_CCER_LOGSINK_01_0018
     * @tc.desc   第 18 种日志调用写入级别 INFO 与拼接后的消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogSink0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0018 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.info('a,b')
      Logger.setSink(null);
      const result: number = sink.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastMessage()),
        String("a,b"));
      expect(sink.getLastMessage()).assertEqual("a,b");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0018 end');
    })

    /**
     * @tc.name   testLogSink0019
     * @tc.number SUB_CCER_LOGSINK_01_0019
     * @tc.desc   第 19 种日志调用写入级别 ERROR 与拼接后的消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogSink0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0019 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.error('code: 100')
      Logger.setSink(null);
      const result: number = sink.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('ERROR'));
      expect(sink.getLastLevel()).assertEqual('ERROR');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastMessage()),
        String("code: 100"));
      expect(sink.getLastMessage()).assertEqual("code: 100");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0019 end');
    })

    /**
     * @tc.name   testLogSink0020
     * @tc.number SUB_CCER_LOGSINK_01_0020
     * @tc.desc   第 20 种日志调用写入级别 DEBUG 与拼接后的消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogSink0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0020 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.debug('x', 'y')
      Logger.setSink(null);
      const result: number = sink.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('DEBUG'));
      expect(sink.getLastLevel()).assertEqual('DEBUG');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastMessage()),
        String("x, y"));
      expect(sink.getLastMessage()).assertEqual("x, y");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0020 end');
    })

    /**
     * @tc.name   testLogSink0021
     * @tc.number SUB_CCER_LOGSINK_01_0021
     * @tc.desc   第 21 种日志调用写入级别 WARN 与拼接后的消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogSink0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0021 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.warn('数组 [1,2]')
      Logger.setSink(null);
      const result: number = sink.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('WARN'));
      expect(sink.getLastLevel()).assertEqual('WARN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastMessage()),
        String("数组 [1,2]"));
      expect(sink.getLastMessage()).assertEqual("数组 [1,2]");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0021 end');
    })

    /**
     * @tc.name   testLogSink0022
     * @tc.number SUB_CCER_LOGSINK_01_0022
     * @tc.desc   第 22 种日志调用写入级别 INFO 与拼接后的消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogSink0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0022 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.info('line1 line2')
      Logger.setSink(null);
      const result: number = sink.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastMessage()),
        String("line1 line2"));
      expect(sink.getLastMessage()).assertEqual("line1 line2");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0022 end');
    })

    /**
     * @tc.name   testLogSink0023
     * @tc.number SUB_CCER_LOGSINK_01_0023
     * @tc.desc   第 23 种日志调用写入级别 INFO 与拼接后的消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogSink0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0023 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.event('Form', 'onFormEvent', 'formId: f1')
      Logger.setSink(null);
      const result: number = sink.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastMessage()),
        String("[Form] onFormEvent, formId: f1"));
      expect(sink.getLastMessage()).assertEqual("[Form] onFormEvent, formId: f1");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0023 end');
    })

    /**
     * @tc.name   testLogSink0024
     * @tc.number SUB_CCER_LOGSINK_01_0024
     * @tc.desc   第 24 种日志调用写入级别 INFO 与拼接后的消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogSink0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0024 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.info('a', 'b', 'c', 'd')
      Logger.setSink(null);
      const result: number = sink.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('INFO'));
      expect(sink.getLastLevel()).assertEqual('INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastMessage()),
        String("a, b, c, d"));
      expect(sink.getLastMessage()).assertEqual("a, b, c, d");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0024 end');
    })

    /**
     * @tc.name   testLogSink0025
     * @tc.number SUB_CCER_LOGSINK_01_0025
     * @tc.desc   第 25 种日志调用写入级别 ERROR 与拼接后的消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogSink0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0025 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.error('e', 'f', 'g')
      Logger.setSink(null);
      const result: number = sink.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastLevel()),
        String('ERROR'));
      expect(sink.getLastLevel()).assertEqual('ERROR');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastMessage()),
        String("e, f, g"));
      expect(sink.getLastMessage()).assertEqual("e, f, g");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0025 end');
    })

    /**
     * @tc.name   testLogSink0026
     * @tc.number SUB_CCER_LOGSINK_01_0026
     * @tc.desc   多条日志按写入顺序保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogSink0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0026 begin');
      const sink: CollectingSink = new CollectingSink();
      Logger.setSink(sink);
      Logger.info('first'); Logger.warn('second');
      Logger.setSink(null);
      const result: number = sink.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getLastMessage()),
        String('second'));
      expect(sink.getLastMessage()).assertEqual('second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sink.getMessageAt(0)),
        String('first'));
      expect(sink.getMessageAt(0)).assertEqual('first');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogSink0026 end');
    })

  })
}
