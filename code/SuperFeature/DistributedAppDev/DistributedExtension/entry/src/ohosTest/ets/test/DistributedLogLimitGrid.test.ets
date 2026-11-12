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

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { LogItem, LogLevel, queryLogs } from '../../../main/ets/model/LogStore';

/** 与查询套件同构的 36 条语料 */
function buildCorpus(): LogItem[] {
  const sources: string[] = ['INDEX', 'LINK', 'CHANNEL'];
  const tags: string[] = ['ui', 'link', 'channel', 'proxy', 'err', 'misc'];
  const details: string[] = ['正常完成', 'sendData 成功', 'openProxyChannel 失败', '连接超时 retry', 'no match here'];
  const levels: LogLevel[] = [LogLevel.DEBUG, LogLevel.INFO, LogLevel.WARN, LogLevel.ERROR];
  const items: LogItem[] = [];
  for (let i = 0; i < 36; i++) {
    items.push(new LogItem(sources[i % 3], tags[i % 6], details[i % 5], levels[i % 4]));
  }
  return items;
}

const corpus: LogItem[] = buildCorpus();

/**
 * 日志条数上限网格：5 种来源 / 级别组合 × 10 个 limit（含 0、大于语料长度、等于语料长度），共 50 条。
 * limit 为 0 时退回「不过滤条数」，返回全部命中——这是页面「不限条数」下拉项走的同一条分支。
 * 截断只能截尾部，首条必须仍然满足最低级别要求。
 */
export default function distributedLogLimitGridTest() {
  describe('DistributedLogLimitGridTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0001
     * @tc.name testLogLimit0001
     * @tc.desc Verify any source at debug cut at 0 returns 36 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0001', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.DEBUG, '', 0);
      expect(page.length).assertEqual(36);
      expect(page.length <= 36).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.DEBUG : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0002
     * @tc.name testLogLimit0002
     * @tc.desc Verify any source at debug cut at 1 returns 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0002', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.DEBUG, '', 1);
      expect(page.length).assertEqual(1);
      expect(page.length <= 36).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.DEBUG : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0003
     * @tc.name testLogLimit0003
     * @tc.desc Verify any source at debug cut at 2 returns 2 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0003', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.DEBUG, '', 2);
      expect(page.length).assertEqual(2);
      expect(page.length <= 36).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.DEBUG : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0004
     * @tc.name testLogLimit0004
     * @tc.desc Verify any source at debug cut at 3 returns 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0004', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.DEBUG, '', 3);
      expect(page.length).assertEqual(3);
      expect(page.length <= 36).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.DEBUG : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0005
     * @tc.name testLogLimit0005
     * @tc.desc Verify any source at debug cut at 5 returns 5 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0005', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.DEBUG, '', 5);
      expect(page.length).assertEqual(5);
      expect(page.length <= 36).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.DEBUG : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0006
     * @tc.name testLogLimit0006
     * @tc.desc Verify any source at debug cut at 8 returns 8 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0006', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.DEBUG, '', 8);
      expect(page.length).assertEqual(8);
      expect(page.length <= 36).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.DEBUG : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0007
     * @tc.name testLogLimit0007
     * @tc.desc Verify any source at debug cut at 13 returns 13 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0007', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.DEBUG, '', 13);
      expect(page.length).assertEqual(13);
      expect(page.length <= 36).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.DEBUG : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0008
     * @tc.name testLogLimit0008
     * @tc.desc Verify any source at debug cut at 20 returns 20 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0008', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.DEBUG, '', 20);
      expect(page.length).assertEqual(20);
      expect(page.length <= 36).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.DEBUG : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0009
     * @tc.name testLogLimit0009
     * @tc.desc Verify any source at debug cut at 36 returns 36 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0009', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.DEBUG, '', 36);
      expect(page.length).assertEqual(36);
      expect(page.length <= 36).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.DEBUG : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0010
     * @tc.name testLogLimit0010
     * @tc.desc Verify any source at debug cut at 40 returns 36 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0010', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.DEBUG, '', 40);
      expect(page.length).assertEqual(36);
      expect(page.length <= 36).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.DEBUG : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0011
     * @tc.name testLogLimit0011
     * @tc.desc Verify the link source at info cut at 0 returns 9 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0011', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.INFO, '', 0);
      expect(page.length).assertEqual(9);
      expect(page.length <= 9).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.INFO : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0012
     * @tc.name testLogLimit0012
     * @tc.desc Verify the link source at info cut at 1 returns 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0012', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.INFO, '', 1);
      expect(page.length).assertEqual(1);
      expect(page.length <= 9).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.INFO : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0013
     * @tc.name testLogLimit0013
     * @tc.desc Verify the link source at info cut at 2 returns 2 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0013', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.INFO, '', 2);
      expect(page.length).assertEqual(2);
      expect(page.length <= 9).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.INFO : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0014
     * @tc.name testLogLimit0014
     * @tc.desc Verify the link source at info cut at 3 returns 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0014', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.INFO, '', 3);
      expect(page.length).assertEqual(3);
      expect(page.length <= 9).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.INFO : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0015
     * @tc.name testLogLimit0015
     * @tc.desc Verify the link source at info cut at 5 returns 5 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0015', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.INFO, '', 5);
      expect(page.length).assertEqual(5);
      expect(page.length <= 9).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.INFO : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0016
     * @tc.name testLogLimit0016
     * @tc.desc Verify the link source at info cut at 8 returns 8 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0016', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.INFO, '', 8);
      expect(page.length).assertEqual(8);
      expect(page.length <= 9).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.INFO : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0017
     * @tc.name testLogLimit0017
     * @tc.desc Verify the link source at info cut at 13 returns 9 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0017', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.INFO, '', 13);
      expect(page.length).assertEqual(9);
      expect(page.length <= 9).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.INFO : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0018
     * @tc.name testLogLimit0018
     * @tc.desc Verify the link source at info cut at 20 returns 9 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0018', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.INFO, '', 20);
      expect(page.length).assertEqual(9);
      expect(page.length <= 9).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.INFO : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0019
     * @tc.name testLogLimit0019
     * @tc.desc Verify the link source at info cut at 36 returns 9 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0019', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.INFO, '', 36);
      expect(page.length).assertEqual(9);
      expect(page.length <= 9).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.INFO : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0020
     * @tc.name testLogLimit0020
     * @tc.desc Verify the link source at info cut at 40 returns 9 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0020', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.INFO, '', 40);
      expect(page.length).assertEqual(9);
      expect(page.length <= 9).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.INFO : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0021
     * @tc.name testLogLimit0021
     * @tc.desc Verify the channel source at warn cut at 0 returns 6 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0021', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.WARN, '', 0);
      expect(page.length).assertEqual(6);
      expect(page.length <= 6).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.WARN : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0022
     * @tc.name testLogLimit0022
     * @tc.desc Verify the channel source at warn cut at 1 returns 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0022', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.WARN, '', 1);
      expect(page.length).assertEqual(1);
      expect(page.length <= 6).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.WARN : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0023
     * @tc.name testLogLimit0023
     * @tc.desc Verify the channel source at warn cut at 2 returns 2 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0023', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.WARN, '', 2);
      expect(page.length).assertEqual(2);
      expect(page.length <= 6).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.WARN : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0024
     * @tc.name testLogLimit0024
     * @tc.desc Verify the channel source at warn cut at 3 returns 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0024', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.WARN, '', 3);
      expect(page.length).assertEqual(3);
      expect(page.length <= 6).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.WARN : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0025
     * @tc.name testLogLimit0025
     * @tc.desc Verify the channel source at warn cut at 5 returns 5 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0025', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.WARN, '', 5);
      expect(page.length).assertEqual(5);
      expect(page.length <= 6).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.WARN : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0026
     * @tc.name testLogLimit0026
     * @tc.desc Verify the channel source at warn cut at 8 returns 6 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0026', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.WARN, '', 8);
      expect(page.length).assertEqual(6);
      expect(page.length <= 6).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.WARN : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0027
     * @tc.name testLogLimit0027
     * @tc.desc Verify the channel source at warn cut at 13 returns 6 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0027', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.WARN, '', 13);
      expect(page.length).assertEqual(6);
      expect(page.length <= 6).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.WARN : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0028
     * @tc.name testLogLimit0028
     * @tc.desc Verify the channel source at warn cut at 20 returns 6 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0028', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.WARN, '', 20);
      expect(page.length).assertEqual(6);
      expect(page.length <= 6).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.WARN : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0029
     * @tc.name testLogLimit0029
     * @tc.desc Verify the channel source at warn cut at 36 returns 6 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0029', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.WARN, '', 36);
      expect(page.length).assertEqual(6);
      expect(page.length <= 6).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.WARN : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0030
     * @tc.name testLogLimit0030
     * @tc.desc Verify the channel source at warn cut at 40 returns 6 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0030', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.WARN, '', 40);
      expect(page.length).assertEqual(6);
      expect(page.length <= 6).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.WARN : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0031
     * @tc.name testLogLimit0031
     * @tc.desc Verify the index source at error cut at 0 returns 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0031', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.ERROR, '', 0);
      expect(page.length).assertEqual(3);
      expect(page.length <= 3).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.ERROR : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0032
     * @tc.name testLogLimit0032
     * @tc.desc Verify the index source at error cut at 1 returns 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0032', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.ERROR, '', 1);
      expect(page.length).assertEqual(1);
      expect(page.length <= 3).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.ERROR : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0033
     * @tc.name testLogLimit0033
     * @tc.desc Verify the index source at error cut at 2 returns 2 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0033', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.ERROR, '', 2);
      expect(page.length).assertEqual(2);
      expect(page.length <= 3).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.ERROR : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0034
     * @tc.name testLogLimit0034
     * @tc.desc Verify the index source at error cut at 3 returns 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0034', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.ERROR, '', 3);
      expect(page.length).assertEqual(3);
      expect(page.length <= 3).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.ERROR : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0035
     * @tc.name testLogLimit0035
     * @tc.desc Verify the index source at error cut at 5 returns 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0035', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.ERROR, '', 5);
      expect(page.length).assertEqual(3);
      expect(page.length <= 3).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.ERROR : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0036
     * @tc.name testLogLimit0036
     * @tc.desc Verify the index source at error cut at 8 returns 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0036', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.ERROR, '', 8);
      expect(page.length).assertEqual(3);
      expect(page.length <= 3).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.ERROR : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0037
     * @tc.name testLogLimit0037
     * @tc.desc Verify the index source at error cut at 13 returns 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0037', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.ERROR, '', 13);
      expect(page.length).assertEqual(3);
      expect(page.length <= 3).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.ERROR : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0038
     * @tc.name testLogLimit0038
     * @tc.desc Verify the index source at error cut at 20 returns 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0038', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.ERROR, '', 20);
      expect(page.length).assertEqual(3);
      expect(page.length <= 3).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.ERROR : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0039
     * @tc.name testLogLimit0039
     * @tc.desc Verify the index source at error cut at 36 returns 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0039', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.ERROR, '', 36);
      expect(page.length).assertEqual(3);
      expect(page.length <= 3).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.ERROR : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0040
     * @tc.name testLogLimit0040
     * @tc.desc Verify the index source at error cut at 40 returns 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0040', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.ERROR, '', 40);
      expect(page.length).assertEqual(3);
      expect(page.length <= 3).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.ERROR : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0041
     * @tc.name testLogLimit0041
     * @tc.desc Verify any source at error cut at 0 returns 9 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0041', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.ERROR, '', 0);
      expect(page.length).assertEqual(9);
      expect(page.length <= 9).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.ERROR : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0042
     * @tc.name testLogLimit0042
     * @tc.desc Verify any source at error cut at 1 returns 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0042', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.ERROR, '', 1);
      expect(page.length).assertEqual(1);
      expect(page.length <= 9).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.ERROR : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0043
     * @tc.name testLogLimit0043
     * @tc.desc Verify any source at error cut at 2 returns 2 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0043', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.ERROR, '', 2);
      expect(page.length).assertEqual(2);
      expect(page.length <= 9).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.ERROR : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0044
     * @tc.name testLogLimit0044
     * @tc.desc Verify any source at error cut at 3 returns 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0044', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.ERROR, '', 3);
      expect(page.length).assertEqual(3);
      expect(page.length <= 9).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.ERROR : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0045
     * @tc.name testLogLimit0045
     * @tc.desc Verify any source at error cut at 5 returns 5 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0045', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.ERROR, '', 5);
      expect(page.length).assertEqual(5);
      expect(page.length <= 9).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.ERROR : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0046
     * @tc.name testLogLimit0046
     * @tc.desc Verify any source at error cut at 8 returns 8 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0046', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.ERROR, '', 8);
      expect(page.length).assertEqual(8);
      expect(page.length <= 9).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.ERROR : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0047
     * @tc.name testLogLimit0047
     * @tc.desc Verify any source at error cut at 13 returns 9 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0047', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.ERROR, '', 13);
      expect(page.length).assertEqual(9);
      expect(page.length <= 9).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.ERROR : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0048
     * @tc.name testLogLimit0048
     * @tc.desc Verify any source at error cut at 20 returns 9 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0048', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.ERROR, '', 20);
      expect(page.length).assertEqual(9);
      expect(page.length <= 9).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.ERROR : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0049
     * @tc.name testLogLimit0049
     * @tc.desc Verify any source at error cut at 36 returns 9 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0049', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.ERROR, '', 36);
      expect(page.length).assertEqual(9);
      expect(page.length <= 9).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.ERROR : true).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGLIMIT_0050
     * @tc.name testLogLimit0050
     * @tc.desc Verify any source at error cut at 40 returns 9 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogLimit0050', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.ERROR, '', 40);
      expect(page.length).assertEqual(9);
      expect(page.length <= 9).assertTrue();
      expect(page.length > 0 ? page[0].level >= LogLevel.ERROR : true).assertTrue();
    });

  });
}
