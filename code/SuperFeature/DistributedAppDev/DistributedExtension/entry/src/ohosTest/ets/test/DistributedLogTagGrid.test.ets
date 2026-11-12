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
import { LogItem, LogLevel, clearLogs, countByTag } from '../../../main/ets/model/LogStore';

/** 与查询套件同构的 36 条语料 */
function buildCorpus(): LogItem[] {
  const tags: string[] = ['ui', 'link', 'channel', 'proxy', 'err', 'misc'];
  const details: string[] = ['正常完成', 'sendData 成功', 'openProxyChannel 失败', '连接超时 retry', 'no match here'];
  const levels: LogLevel[] = [LogLevel.DEBUG, LogLevel.INFO, LogLevel.WARN, LogLevel.ERROR];
  const items: LogItem[] = [];
  for (let i = 0; i < 36; i++) {
    items.push(new LogItem('INDEX', tags[i % 6], details[i % 5], levels[i % 4]));
  }
  return items;
}

const corpus: LogItem[] = buildCorpus();

/**
 * tag 计数网格：6 个真实 tag + 大小写、尾随空格、拼接词、空串、不存在词，共 12 条。
 * 计数是严格相等（`===`），不做大小写或空白归一化，所以 UI 与 ui 必须分别计数。
 * 空日志数组上计数恒为 0，用来证明 clearLogs 返回的确实是空数组而不是 undefined。
 */
export default function distributedLogTagGridTest() {
  describe('DistributedLogTagGridTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGTAG_0001
     * @tc.name testLogTag0001
     * @tc.desc Verify counting tag ui yields 6.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogTag0001', 0, () => {
      expect(countByTag(corpus, 'ui')).assertEqual(6);
      expect(countByTag(corpus, 'ui') <= corpus.length).assertTrue();
      expect(countByTag(corpus, 'ui') >= 0).assertTrue();
      expect(countByTag(clearLogs(), 'ui')).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGTAG_0002
     * @tc.name testLogTag0002
     * @tc.desc Verify counting tag link yields 6.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogTag0002', 0, () => {
      expect(countByTag(corpus, 'link')).assertEqual(6);
      expect(countByTag(corpus, 'link') <= corpus.length).assertTrue();
      expect(countByTag(corpus, 'link') >= 0).assertTrue();
      expect(countByTag(clearLogs(), 'link')).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGTAG_0003
     * @tc.name testLogTag0003
     * @tc.desc Verify counting tag channel yields 6.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogTag0003', 0, () => {
      expect(countByTag(corpus, 'channel')).assertEqual(6);
      expect(countByTag(corpus, 'channel') <= corpus.length).assertTrue();
      expect(countByTag(corpus, 'channel') >= 0).assertTrue();
      expect(countByTag(clearLogs(), 'channel')).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGTAG_0004
     * @tc.name testLogTag0004
     * @tc.desc Verify counting tag proxy yields 6.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogTag0004', 0, () => {
      expect(countByTag(corpus, 'proxy')).assertEqual(6);
      expect(countByTag(corpus, 'proxy') <= corpus.length).assertTrue();
      expect(countByTag(corpus, 'proxy') >= 0).assertTrue();
      expect(countByTag(clearLogs(), 'proxy')).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGTAG_0005
     * @tc.name testLogTag0005
     * @tc.desc Verify counting tag err yields 6.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogTag0005', 0, () => {
      expect(countByTag(corpus, 'err')).assertEqual(6);
      expect(countByTag(corpus, 'err') <= corpus.length).assertTrue();
      expect(countByTag(corpus, 'err') >= 0).assertTrue();
      expect(countByTag(clearLogs(), 'err')).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGTAG_0006
     * @tc.name testLogTag0006
     * @tc.desc Verify counting tag misc yields 6.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogTag0006', 0, () => {
      expect(countByTag(corpus, 'misc')).assertEqual(6);
      expect(countByTag(corpus, 'misc') <= corpus.length).assertTrue();
      expect(countByTag(corpus, 'misc') >= 0).assertTrue();
      expect(countByTag(clearLogs(), 'misc')).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGTAG_0007
     * @tc.name testLogTag0007
     * @tc.desc Verify counting tag UI yields 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogTag0007', 0, () => {
      expect(countByTag(corpus, 'UI')).assertEqual(0);
      expect(countByTag(corpus, 'UI') <= corpus.length).assertTrue();
      expect(countByTag(corpus, 'UI') >= 0).assertTrue();
      expect(countByTag(clearLogs(), 'UI')).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGTAG_0008
     * @tc.name testLogTag0008
     * @tc.desc Verify counting tag link  yields 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogTag0008', 0, () => {
      expect(countByTag(corpus, 'link ')).assertEqual(0);
      expect(countByTag(corpus, 'link ') <= corpus.length).assertTrue();
      expect(countByTag(corpus, 'link ') >= 0).assertTrue();
      expect(countByTag(clearLogs(), 'link ')).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGTAG_0009
     * @tc.name testLogTag0009
     * @tc.desc Verify counting tag proxyChannel yields 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogTag0009', 0, () => {
      expect(countByTag(corpus, 'proxyChannel')).assertEqual(0);
      expect(countByTag(corpus, 'proxyChannel') <= corpus.length).assertTrue();
      expect(countByTag(corpus, 'proxyChannel') >= 0).assertTrue();
      expect(countByTag(clearLogs(), 'proxyChannel')).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGTAG_0010
     * @tc.name testLogTag0010
     * @tc.desc Verify counting tag empty yields 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogTag0010', 0, () => {
      expect(countByTag(corpus, '')).assertEqual(0);
      expect(countByTag(corpus, '') <= corpus.length).assertTrue();
      expect(countByTag(corpus, '') >= 0).assertTrue();
      expect(countByTag(clearLogs(), '')).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGTAG_0011
     * @tc.name testLogTag0011
     * @tc.desc Verify counting tag notag yields 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogTag0011', 0, () => {
      expect(countByTag(corpus, 'notag')).assertEqual(0);
      expect(countByTag(corpus, 'notag') <= corpus.length).assertTrue();
      expect(countByTag(corpus, 'notag') >= 0).assertTrue();
      expect(countByTag(clearLogs(), 'notag')).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGTAG_0012
     * @tc.name testLogTag0012
     * @tc.desc Verify counting tag z yields 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogTag0012', 0, () => {
      expect(countByTag(corpus, 'z')).assertEqual(0);
      expect(countByTag(corpus, 'z') <= corpus.length).assertTrue();
      expect(countByTag(corpus, 'z') >= 0).assertTrue();
      expect(countByTag(clearLogs(), 'z')).assertEqual(0);
    });

  });
}
