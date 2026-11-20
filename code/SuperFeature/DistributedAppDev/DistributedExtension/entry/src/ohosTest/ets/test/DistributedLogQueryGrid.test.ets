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

/** 固定语料：4 个来源轮转 × 6 个 tag 轮转 × 5 段文案轮转 × 4 个级别轮转，共 36 条 */
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

function idsOf(items: LogItem[]): number[] {
  const values: number[] = [];
  for (let i = 0; i < items.length; i++) {
    values.push(items[i].id);
  }
  return values;
}

const corpus: LogItem[] = buildCorpus();
const ids: number[] = idsOf(corpus);

/**
 * 日志查询四维网格：来源（含空串与不存在的来源）× 最低级别 × 关键字（含空串与无命中词），共 144 条。
 * 每条都核对命中条数、首条 id（第 N 条日志的 id 在语料里唯一）与「页内条目全部满足最低级别」。
 * 关键字走 trim + toLowerCase，且只检索 detail 与 tag——source 不参与关键字匹配，这一点在空关键字与具体词的对照里体现。
 */
export default function distributedLogQueryGridTest() {
  describe('DistributedLogQueryGridTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0001
     * @tc.name testLogPage0001
     * @tc.desc Verify the query with any source at level 0 and keyword none returns 20 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0001', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.DEBUG, '', 20);
      expect(page.length).assertEqual(20);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[0]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.DEBUG).length).assertEqual(20);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0002
     * @tc.name testLogPage0002
     * @tc.desc Verify the query with any source at level 0 and keyword send returns 7 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0002', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.DEBUG, 'send', 20);
      expect(page.length).assertEqual(7);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[1]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.DEBUG).length).assertEqual(7);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0003
     * @tc.name testLogPage0003
     * @tc.desc Verify the query with any source at level 0 and keyword err returns 6 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0003', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.DEBUG, 'err', 20);
      expect(page.length).assertEqual(6);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[4]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.DEBUG).length).assertEqual(6);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0004
     * @tc.name testLogPage0004
     * @tc.desc Verify the query with any source at level 0 and keyword proxy returns 12 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0004', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.DEBUG, 'proxy', 20);
      expect(page.length).assertEqual(12);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[2]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.DEBUG).length).assertEqual(12);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0005
     * @tc.name testLogPage0005
     * @tc.desc Verify the query with any source at level 0 and keyword retry returns 7 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0005', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.DEBUG, 'retry', 20);
      expect(page.length).assertEqual(7);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[3]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.DEBUG).length).assertEqual(7);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0006
     * @tc.name testLogPage0006
     * @tc.desc Verify the query with any source at level 0 and keyword zzz returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0006', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.DEBUG, 'zzz', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.DEBUG).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0007
     * @tc.name testLogPage0007
     * @tc.desc Verify the query with any source at level 1 and keyword none returns 20 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0007', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.INFO, '', 20);
      expect(page.length).assertEqual(20);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[1]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.INFO).length).assertEqual(20);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0008
     * @tc.name testLogPage0008
     * @tc.desc Verify the query with any source at level 1 and keyword send returns 6 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0008', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.INFO, 'send', 20);
      expect(page.length).assertEqual(6);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[1]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.INFO).length).assertEqual(6);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0009
     * @tc.name testLogPage0009
     * @tc.desc Verify the query with any source at level 1 and keyword err returns 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0009', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.INFO, 'err', 20);
      expect(page.length).assertEqual(3);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[10]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.INFO).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0010
     * @tc.name testLogPage0010
     * @tc.desc Verify the query with any source at level 1 and keyword proxy returns 10 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0010', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.INFO, 'proxy', 20);
      expect(page.length).assertEqual(10);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[2]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.INFO).length).assertEqual(10);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0011
     * @tc.name testLogPage0011
     * @tc.desc Verify the query with any source at level 1 and keyword retry returns 5 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0011', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.INFO, 'retry', 20);
      expect(page.length).assertEqual(5);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[3]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.INFO).length).assertEqual(5);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0012
     * @tc.name testLogPage0012
     * @tc.desc Verify the query with any source at level 1 and keyword zzz returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0012', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.INFO, 'zzz', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.INFO).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0013
     * @tc.name testLogPage0013
     * @tc.desc Verify the query with any source at level 2 and keyword none returns 18 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0013', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.WARN, '', 20);
      expect(page.length).assertEqual(18);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[2]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.WARN).length).assertEqual(18);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0014
     * @tc.name testLogPage0014
     * @tc.desc Verify the query with any source at level 2 and keyword send returns 4 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0014', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.WARN, 'send', 20);
      expect(page.length).assertEqual(4);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[6]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.WARN).length).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0015
     * @tc.name testLogPage0015
     * @tc.desc Verify the query with any source at level 2 and keyword err returns 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0015', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.WARN, 'err', 20);
      expect(page.length).assertEqual(3);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[10]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.WARN).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0016
     * @tc.name testLogPage0016
     * @tc.desc Verify the query with any source at level 2 and keyword proxy returns 6 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0016', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.WARN, 'proxy', 20);
      expect(page.length).assertEqual(6);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[2]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.WARN).length).assertEqual(6);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0017
     * @tc.name testLogPage0017
     * @tc.desc Verify the query with any source at level 2 and keyword retry returns 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0017', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.WARN, 'retry', 20);
      expect(page.length).assertEqual(3);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[3]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.WARN).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0018
     * @tc.name testLogPage0018
     * @tc.desc Verify the query with any source at level 2 and keyword zzz returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0018', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.WARN, 'zzz', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.WARN).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0019
     * @tc.name testLogPage0019
     * @tc.desc Verify the query with any source at level 3 and keyword none returns 9 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0019', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.ERROR, '', 20);
      expect(page.length).assertEqual(9);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[3]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.ERROR).length).assertEqual(9);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0020
     * @tc.name testLogPage0020
     * @tc.desc Verify the query with any source at level 3 and keyword send returns 2 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0020', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.ERROR, 'send', 20);
      expect(page.length).assertEqual(2);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[11]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.ERROR).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0021
     * @tc.name testLogPage0021
     * @tc.desc Verify the query with any source at level 3 and keyword err returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0021', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.ERROR, 'err', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.ERROR).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0022
     * @tc.name testLogPage0022
     * @tc.desc Verify the query with any source at level 3 and keyword proxy returns 4 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0022', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.ERROR, 'proxy', 20);
      expect(page.length).assertEqual(4);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[3]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.ERROR).length).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0023
     * @tc.name testLogPage0023
     * @tc.desc Verify the query with any source at level 3 and keyword retry returns 2 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0023', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.ERROR, 'retry', 20);
      expect(page.length).assertEqual(2);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[3]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.ERROR).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0024
     * @tc.name testLogPage0024
     * @tc.desc Verify the query with any source at level 3 and keyword zzz returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0024', 0, () => {
      const page: LogItem[] = queryLogs(corpus, '', LogLevel.ERROR, 'zzz', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.ERROR).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0025
     * @tc.name testLogPage0025
     * @tc.desc Verify the query with INDEX at level 0 and keyword none returns 12 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0025', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.DEBUG, '', 20);
      expect(page.length).assertEqual(12);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[0]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.DEBUG).length).assertEqual(12);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0026
     * @tc.name testLogPage0026
     * @tc.desc Verify the query with INDEX at level 0 and keyword send returns 2 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0026', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.DEBUG, 'send', 20);
      expect(page.length).assertEqual(2);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[6]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.DEBUG).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0027
     * @tc.name testLogPage0027
     * @tc.desc Verify the query with INDEX at level 0 and keyword err returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0027', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.DEBUG, 'err', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.DEBUG).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0028
     * @tc.name testLogPage0028
     * @tc.desc Verify the query with INDEX at level 0 and keyword proxy returns 7 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0028', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.DEBUG, 'proxy', 20);
      expect(page.length).assertEqual(7);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[3]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.DEBUG).length).assertEqual(7);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0029
     * @tc.name testLogPage0029
     * @tc.desc Verify the query with INDEX at level 0 and keyword retry returns 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0029', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.DEBUG, 'retry', 20);
      expect(page.length).assertEqual(3);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[3]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.DEBUG).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0030
     * @tc.name testLogPage0030
     * @tc.desc Verify the query with INDEX at level 0 and keyword zzz returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0030', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.DEBUG, 'zzz', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.DEBUG).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0031
     * @tc.name testLogPage0031
     * @tc.desc Verify the query with INDEX at level 1 and keyword none returns 9 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0031', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.INFO, '', 20);
      expect(page.length).assertEqual(9);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[3]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.INFO).length).assertEqual(9);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0032
     * @tc.name testLogPage0032
     * @tc.desc Verify the query with INDEX at level 1 and keyword send returns 2 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0032', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.INFO, 'send', 20);
      expect(page.length).assertEqual(2);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[6]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.INFO).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0033
     * @tc.name testLogPage0033
     * @tc.desc Verify the query with INDEX at level 1 and keyword err returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0033', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.INFO, 'err', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.INFO).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0034
     * @tc.name testLogPage0034
     * @tc.desc Verify the query with INDEX at level 1 and keyword proxy returns 6 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0034', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.INFO, 'proxy', 20);
      expect(page.length).assertEqual(6);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[3]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.INFO).length).assertEqual(6);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0035
     * @tc.name testLogPage0035
     * @tc.desc Verify the query with INDEX at level 1 and keyword retry returns 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0035', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.INFO, 'retry', 20);
      expect(page.length).assertEqual(3);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[3]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.INFO).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0036
     * @tc.name testLogPage0036
     * @tc.desc Verify the query with INDEX at level 1 and keyword zzz returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0036', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.INFO, 'zzz', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.INFO).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0037
     * @tc.name testLogPage0037
     * @tc.desc Verify the query with INDEX at level 2 and keyword none returns 6 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0037', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.WARN, '', 20);
      expect(page.length).assertEqual(6);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[3]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.WARN).length).assertEqual(6);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0038
     * @tc.name testLogPage0038
     * @tc.desc Verify the query with INDEX at level 2 and keyword send returns 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0038', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.WARN, 'send', 20);
      expect(page.length).assertEqual(1);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[6]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.WARN).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0039
     * @tc.name testLogPage0039
     * @tc.desc Verify the query with INDEX at level 2 and keyword err returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0039', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.WARN, 'err', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.WARN).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0040
     * @tc.name testLogPage0040
     * @tc.desc Verify the query with INDEX at level 2 and keyword proxy returns 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0040', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.WARN, 'proxy', 20);
      expect(page.length).assertEqual(3);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[3]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.WARN).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0041
     * @tc.name testLogPage0041
     * @tc.desc Verify the query with INDEX at level 2 and keyword retry returns 2 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0041', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.WARN, 'retry', 20);
      expect(page.length).assertEqual(2);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[3]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.WARN).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0042
     * @tc.name testLogPage0042
     * @tc.desc Verify the query with INDEX at level 2 and keyword zzz returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0042', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.WARN, 'zzz', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.WARN).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0043
     * @tc.name testLogPage0043
     * @tc.desc Verify the query with INDEX at level 3 and keyword none returns 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0043', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.ERROR, '', 20);
      expect(page.length).assertEqual(3);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[3]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.ERROR).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0044
     * @tc.name testLogPage0044
     * @tc.desc Verify the query with INDEX at level 3 and keyword send returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0044', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.ERROR, 'send', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.ERROR).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0045
     * @tc.name testLogPage0045
     * @tc.desc Verify the query with INDEX at level 3 and keyword err returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0045', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.ERROR, 'err', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.ERROR).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0046
     * @tc.name testLogPage0046
     * @tc.desc Verify the query with INDEX at level 3 and keyword proxy returns 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0046', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.ERROR, 'proxy', 20);
      expect(page.length).assertEqual(3);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[3]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.ERROR).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0047
     * @tc.name testLogPage0047
     * @tc.desc Verify the query with INDEX at level 3 and keyword retry returns 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0047', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.ERROR, 'retry', 20);
      expect(page.length).assertEqual(1);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[3]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.ERROR).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0048
     * @tc.name testLogPage0048
     * @tc.desc Verify the query with INDEX at level 3 and keyword zzz returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0048', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'INDEX', LogLevel.ERROR, 'zzz', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.ERROR).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0049
     * @tc.name testLogPage0049
     * @tc.desc Verify the query with LINK at level 0 and keyword none returns 12 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0049', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.DEBUG, '', 20);
      expect(page.length).assertEqual(12);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[1]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.DEBUG).length).assertEqual(12);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0050
     * @tc.name testLogPage0050
     * @tc.desc Verify the query with LINK at level 0 and keyword send returns 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0050', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.DEBUG, 'send', 20);
      expect(page.length).assertEqual(3);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[1]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.DEBUG).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0051
     * @tc.name testLogPage0051
     * @tc.desc Verify the query with LINK at level 0 and keyword err returns 6 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0051', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.DEBUG, 'err', 20);
      expect(page.length).assertEqual(6);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[4]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.DEBUG).length).assertEqual(6);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0052
     * @tc.name testLogPage0052
     * @tc.desc Verify the query with LINK at level 0 and keyword proxy returns 2 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0052', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.DEBUG, 'proxy', 20);
      expect(page.length).assertEqual(2);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[7]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.DEBUG).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0053
     * @tc.name testLogPage0053
     * @tc.desc Verify the query with LINK at level 0 and keyword retry returns 2 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0053', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.DEBUG, 'retry', 20);
      expect(page.length).assertEqual(2);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[13]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.DEBUG).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0054
     * @tc.name testLogPage0054
     * @tc.desc Verify the query with LINK at level 0 and keyword zzz returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0054', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.DEBUG, 'zzz', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.DEBUG).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0055
     * @tc.name testLogPage0055
     * @tc.desc Verify the query with LINK at level 1 and keyword none returns 9 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0055', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.INFO, '', 20);
      expect(page.length).assertEqual(9);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[1]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.INFO).length).assertEqual(9);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0056
     * @tc.name testLogPage0056
     * @tc.desc Verify the query with LINK at level 1 and keyword send returns 2 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0056', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.INFO, 'send', 20);
      expect(page.length).assertEqual(2);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[1]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.INFO).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0057
     * @tc.name testLogPage0057
     * @tc.desc Verify the query with LINK at level 1 and keyword err returns 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0057', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.INFO, 'err', 20);
      expect(page.length).assertEqual(3);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[10]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.INFO).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0058
     * @tc.name testLogPage0058
     * @tc.desc Verify the query with LINK at level 1 and keyword proxy returns 2 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0058', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.INFO, 'proxy', 20);
      expect(page.length).assertEqual(2);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[7]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.INFO).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0059
     * @tc.name testLogPage0059
     * @tc.desc Verify the query with LINK at level 1 and keyword retry returns 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0059', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.INFO, 'retry', 20);
      expect(page.length).assertEqual(1);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[13]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.INFO).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0060
     * @tc.name testLogPage0060
     * @tc.desc Verify the query with LINK at level 1 and keyword zzz returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0060', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.INFO, 'zzz', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.INFO).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0061
     * @tc.name testLogPage0061
     * @tc.desc Verify the query with LINK at level 2 and keyword none returns 6 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0061', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.WARN, '', 20);
      expect(page.length).assertEqual(6);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[7]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.WARN).length).assertEqual(6);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0062
     * @tc.name testLogPage0062
     * @tc.desc Verify the query with LINK at level 2 and keyword send returns 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0062', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.WARN, 'send', 20);
      expect(page.length).assertEqual(1);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[31]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.WARN).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0063
     * @tc.name testLogPage0063
     * @tc.desc Verify the query with LINK at level 2 and keyword err returns 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0063', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.WARN, 'err', 20);
      expect(page.length).assertEqual(3);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[10]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.WARN).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0064
     * @tc.name testLogPage0064
     * @tc.desc Verify the query with LINK at level 2 and keyword proxy returns 2 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0064', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.WARN, 'proxy', 20);
      expect(page.length).assertEqual(2);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[7]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.WARN).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0065
     * @tc.name testLogPage0065
     * @tc.desc Verify the query with LINK at level 2 and keyword retry returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0065', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.WARN, 'retry', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.WARN).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0066
     * @tc.name testLogPage0066
     * @tc.desc Verify the query with LINK at level 2 and keyword zzz returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0066', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.WARN, 'zzz', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.WARN).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0067
     * @tc.name testLogPage0067
     * @tc.desc Verify the query with LINK at level 3 and keyword none returns 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0067', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.ERROR, '', 20);
      expect(page.length).assertEqual(3);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[7]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.ERROR).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0068
     * @tc.name testLogPage0068
     * @tc.desc Verify the query with LINK at level 3 and keyword send returns 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0068', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.ERROR, 'send', 20);
      expect(page.length).assertEqual(1);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[31]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.ERROR).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0069
     * @tc.name testLogPage0069
     * @tc.desc Verify the query with LINK at level 3 and keyword err returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0069', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.ERROR, 'err', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.ERROR).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0070
     * @tc.name testLogPage0070
     * @tc.desc Verify the query with LINK at level 3 and keyword proxy returns 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0070', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.ERROR, 'proxy', 20);
      expect(page.length).assertEqual(1);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[7]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.ERROR).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0071
     * @tc.name testLogPage0071
     * @tc.desc Verify the query with LINK at level 3 and keyword retry returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0071', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.ERROR, 'retry', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.ERROR).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0072
     * @tc.name testLogPage0072
     * @tc.desc Verify the query with LINK at level 3 and keyword zzz returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0072', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'LINK', LogLevel.ERROR, 'zzz', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.ERROR).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0073
     * @tc.name testLogPage0073
     * @tc.desc Verify the query with CHANNEL at level 0 and keyword none returns 12 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0073', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.DEBUG, '', 20);
      expect(page.length).assertEqual(12);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[2]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.DEBUG).length).assertEqual(12);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0074
     * @tc.name testLogPage0074
     * @tc.desc Verify the query with CHANNEL at level 0 and keyword send returns 2 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0074', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.DEBUG, 'send', 20);
      expect(page.length).assertEqual(2);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[11]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.DEBUG).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0075
     * @tc.name testLogPage0075
     * @tc.desc Verify the query with CHANNEL at level 0 and keyword err returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0075', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.DEBUG, 'err', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.DEBUG).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0076
     * @tc.name testLogPage0076
     * @tc.desc Verify the query with CHANNEL at level 0 and keyword proxy returns 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0076', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.DEBUG, 'proxy', 20);
      expect(page.length).assertEqual(3);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[2]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.DEBUG).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0077
     * @tc.name testLogPage0077
     * @tc.desc Verify the query with CHANNEL at level 0 and keyword retry returns 2 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0077', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.DEBUG, 'retry', 20);
      expect(page.length).assertEqual(2);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[8]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.DEBUG).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0078
     * @tc.name testLogPage0078
     * @tc.desc Verify the query with CHANNEL at level 0 and keyword zzz returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0078', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.DEBUG, 'zzz', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.DEBUG).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0079
     * @tc.name testLogPage0079
     * @tc.desc Verify the query with CHANNEL at level 1 and keyword none returns 9 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0079', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.INFO, '', 20);
      expect(page.length).assertEqual(9);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[2]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.INFO).length).assertEqual(9);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0080
     * @tc.name testLogPage0080
     * @tc.desc Verify the query with CHANNEL at level 1 and keyword send returns 2 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0080', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.INFO, 'send', 20);
      expect(page.length).assertEqual(2);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[11]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.INFO).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0081
     * @tc.name testLogPage0081
     * @tc.desc Verify the query with CHANNEL at level 1 and keyword err returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0081', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.INFO, 'err', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.INFO).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0082
     * @tc.name testLogPage0082
     * @tc.desc Verify the query with CHANNEL at level 1 and keyword proxy returns 2 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0082', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.INFO, 'proxy', 20);
      expect(page.length).assertEqual(2);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[2]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.INFO).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0083
     * @tc.name testLogPage0083
     * @tc.desc Verify the query with CHANNEL at level 1 and keyword retry returns 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0083', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.INFO, 'retry', 20);
      expect(page.length).assertEqual(1);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[23]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.INFO).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0084
     * @tc.name testLogPage0084
     * @tc.desc Verify the query with CHANNEL at level 1 and keyword zzz returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0084', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.INFO, 'zzz', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.INFO).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0085
     * @tc.name testLogPage0085
     * @tc.desc Verify the query with CHANNEL at level 2 and keyword none returns 6 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0085', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.WARN, '', 20);
      expect(page.length).assertEqual(6);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[2]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.WARN).length).assertEqual(6);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0086
     * @tc.name testLogPage0086
     * @tc.desc Verify the query with CHANNEL at level 2 and keyword send returns 2 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0086', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.WARN, 'send', 20);
      expect(page.length).assertEqual(2);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[11]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.WARN).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0087
     * @tc.name testLogPage0087
     * @tc.desc Verify the query with CHANNEL at level 2 and keyword err returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0087', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.WARN, 'err', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.WARN).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0088
     * @tc.name testLogPage0088
     * @tc.desc Verify the query with CHANNEL at level 2 and keyword proxy returns 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0088', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.WARN, 'proxy', 20);
      expect(page.length).assertEqual(1);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[2]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.WARN).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0089
     * @tc.name testLogPage0089
     * @tc.desc Verify the query with CHANNEL at level 2 and keyword retry returns 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0089', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.WARN, 'retry', 20);
      expect(page.length).assertEqual(1);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[23]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.WARN).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0090
     * @tc.name testLogPage0090
     * @tc.desc Verify the query with CHANNEL at level 2 and keyword zzz returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0090', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.WARN, 'zzz', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.WARN).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0091
     * @tc.name testLogPage0091
     * @tc.desc Verify the query with CHANNEL at level 3 and keyword none returns 3 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0091', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.ERROR, '', 20);
      expect(page.length).assertEqual(3);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[11]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.ERROR).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0092
     * @tc.name testLogPage0092
     * @tc.desc Verify the query with CHANNEL at level 3 and keyword send returns 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0092', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.ERROR, 'send', 20);
      expect(page.length).assertEqual(1);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[11]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.ERROR).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0093
     * @tc.name testLogPage0093
     * @tc.desc Verify the query with CHANNEL at level 3 and keyword err returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0093', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.ERROR, 'err', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.ERROR).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0094
     * @tc.name testLogPage0094
     * @tc.desc Verify the query with CHANNEL at level 3 and keyword proxy returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0094', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.ERROR, 'proxy', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.ERROR).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0095
     * @tc.name testLogPage0095
     * @tc.desc Verify the query with CHANNEL at level 3 and keyword retry returns 1 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0095', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.ERROR, 'retry', 20);
      expect(page.length).assertEqual(1);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(ids[23]);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.ERROR).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0096
     * @tc.name testLogPage0096
     * @tc.desc Verify the query with CHANNEL at level 3 and keyword zzz returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0096', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'CHANNEL', LogLevel.ERROR, 'zzz', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.ERROR).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0097
     * @tc.name testLogPage0097
     * @tc.desc Verify the query with NONE at level 0 and keyword none returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0097', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'NONE', LogLevel.DEBUG, '', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.DEBUG).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0098
     * @tc.name testLogPage0098
     * @tc.desc Verify the query with NONE at level 0 and keyword send returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0098', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'NONE', LogLevel.DEBUG, 'send', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.DEBUG).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0099
     * @tc.name testLogPage0099
     * @tc.desc Verify the query with NONE at level 0 and keyword err returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0099', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'NONE', LogLevel.DEBUG, 'err', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.DEBUG).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0100
     * @tc.name testLogPage0100
     * @tc.desc Verify the query with NONE at level 0 and keyword proxy returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0100', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'NONE', LogLevel.DEBUG, 'proxy', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.DEBUG).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0101
     * @tc.name testLogPage0101
     * @tc.desc Verify the query with NONE at level 0 and keyword retry returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0101', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'NONE', LogLevel.DEBUG, 'retry', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.DEBUG).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0102
     * @tc.name testLogPage0102
     * @tc.desc Verify the query with NONE at level 0 and keyword zzz returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0102', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'NONE', LogLevel.DEBUG, 'zzz', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.DEBUG).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0103
     * @tc.name testLogPage0103
     * @tc.desc Verify the query with NONE at level 1 and keyword none returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0103', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'NONE', LogLevel.INFO, '', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.INFO).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0104
     * @tc.name testLogPage0104
     * @tc.desc Verify the query with NONE at level 1 and keyword send returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0104', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'NONE', LogLevel.INFO, 'send', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.INFO).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0105
     * @tc.name testLogPage0105
     * @tc.desc Verify the query with NONE at level 1 and keyword err returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0105', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'NONE', LogLevel.INFO, 'err', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.INFO).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0106
     * @tc.name testLogPage0106
     * @tc.desc Verify the query with NONE at level 1 and keyword proxy returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0106', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'NONE', LogLevel.INFO, 'proxy', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.INFO).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0107
     * @tc.name testLogPage0107
     * @tc.desc Verify the query with NONE at level 1 and keyword retry returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0107', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'NONE', LogLevel.INFO, 'retry', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.INFO).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0108
     * @tc.name testLogPage0108
     * @tc.desc Verify the query with NONE at level 1 and keyword zzz returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0108', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'NONE', LogLevel.INFO, 'zzz', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.INFO).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0109
     * @tc.name testLogPage0109
     * @tc.desc Verify the query with NONE at level 2 and keyword none returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0109', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'NONE', LogLevel.WARN, '', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.WARN).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0110
     * @tc.name testLogPage0110
     * @tc.desc Verify the query with NONE at level 2 and keyword send returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0110', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'NONE', LogLevel.WARN, 'send', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.WARN).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0111
     * @tc.name testLogPage0111
     * @tc.desc Verify the query with NONE at level 2 and keyword err returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0111', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'NONE', LogLevel.WARN, 'err', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.WARN).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0112
     * @tc.name testLogPage0112
     * @tc.desc Verify the query with NONE at level 2 and keyword proxy returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0112', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'NONE', LogLevel.WARN, 'proxy', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.WARN).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0113
     * @tc.name testLogPage0113
     * @tc.desc Verify the query with NONE at level 2 and keyword retry returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0113', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'NONE', LogLevel.WARN, 'retry', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.WARN).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0114
     * @tc.name testLogPage0114
     * @tc.desc Verify the query with NONE at level 2 and keyword zzz returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0114', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'NONE', LogLevel.WARN, 'zzz', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.WARN).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0115
     * @tc.name testLogPage0115
     * @tc.desc Verify the query with NONE at level 3 and keyword none returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0115', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'NONE', LogLevel.ERROR, '', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.ERROR).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0116
     * @tc.name testLogPage0116
     * @tc.desc Verify the query with NONE at level 3 and keyword send returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0116', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'NONE', LogLevel.ERROR, 'send', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.ERROR).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0117
     * @tc.name testLogPage0117
     * @tc.desc Verify the query with NONE at level 3 and keyword err returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0117', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'NONE', LogLevel.ERROR, 'err', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.ERROR).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0118
     * @tc.name testLogPage0118
     * @tc.desc Verify the query with NONE at level 3 and keyword proxy returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0118', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'NONE', LogLevel.ERROR, 'proxy', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.ERROR).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0119
     * @tc.name testLogPage0119
     * @tc.desc Verify the query with NONE at level 3 and keyword retry returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0119', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'NONE', LogLevel.ERROR, 'retry', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.ERROR).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQUERY_0120
     * @tc.name testLogPage0120
     * @tc.desc Verify the query with NONE at level 3 and keyword zzz returns 0 items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogPage0120', 0, () => {
      const page: LogItem[] = queryLogs(corpus, 'NONE', LogLevel.ERROR, 'zzz', 20);
      expect(page.length).assertEqual(0);
      expect(page.length > 0 ? page[0].id : -1).assertEqual(-1);
      expect(page.filter((item: LogItem) => item.level >= LogLevel.ERROR).length).assertEqual(0);
    });

  });
}
