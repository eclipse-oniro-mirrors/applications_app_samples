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

import { describe, expect, it } from '@ohos/hypium';
import { LogItem, LogLevel, appendLog, queryLogs } from '../../../main/ets/model/LogStore';
import {
  describeStatusWithCode,
  formatDuration,
  pad2,
  truncateMiddle
} from '../../../main/ets/utils/FormatUtil';

/** 日志用例统一用同一来源，避免 source 过滤影响 limit 断言 */
const SOURCE: string = 'numeric';
const TAG: string = 'tag';

/** 造 count 条同源日志，内容带序号，便于断言"留下的是哪几条" */
function logsOf(count: number): LogItem[] {
  const items: LogItem[] = [];
  for (let i = 0; i < count; i++) {
    items.push(new LogItem(SOURCE, TAG, `第 ${i} 条`));
  }
  return items;
}

/**
 * 数值特殊值边界：NaN / Infinity / -0 / 小数 / 精度。
 *
 * 这些值在 JS 里不会抛错，只会悄悄走偏：`NaN < 0` 是 false、`slice(0, 0.5)` 得到空数组、
 * `(59999.9 / 1000).toFixed(1)` 变成 "60.0"。它们不写进用例就没人会看，
 * 一旦某次重构把 `<` 改成 `<=`、或把取整改成四舍五入，页面上就会出现
 * "60.0 s" 这种自相矛盾的时长、或者一条日志都留不下——而纯正向用例全是绿的。
 */
export default function inputMethodNumericEdgeTest() {
  describe('InputMethodNumericEdgeTest', () => {
    /**
     * @tc.number SUB_INPUT_METHOD_NUM_0100
     * @tc.name testNumericEdge0001
     * @tc.desc Verify pad2 keeps its "less than ten is padded" rule for negative zero and fractions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumericEdge0001', 0, () => {
      // -0 < 10 成立，而 `${-0}` 是 "0"，所以补零后是 "00" 而不是 "0-0"
      expect(pad2(-0)).assertEqual('00');
      // 小数没有单独的格式化规则，会被当作"小于十"直接补零
      expect(pad2(9.5)).assertEqual('09.5');
      expect(pad2(10.5)).assertEqual('10.5');
      // NaN 与 Infinity 都走 else 分支，原样拼进字符串
      expect(pad2(NaN)).assertEqual('NaN');
      expect(pad2(Infinity)).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_NUM_0200
     * @tc.name testNumericEdge0002
     * @tc.desc Verify NaN slips past all three range checks and lands in the minute branch.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumericEdge0002', 0, () => {
      // 三个 if 全是 false（NaN 与任何数比较都为 false），于是落到最后的分支
      expect(formatDuration(NaN)).assertEqual('NaN min NaN s');
      expect(formatDuration(NaN).includes('min')).assertTrue();
      // 也没被"负数一律 0 ms"的早退吞掉，NaN 一路穿过了三道比较
      expect(formatDuration(NaN) === '0 ms').assertFalse();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_NUM_0300
     * @tc.name testNumericEdge0003
     * @tc.desc Verify Infinity yields an Infinity minute count but a NaN second count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumericEdge0003', 0, () => {
      // Infinity % 60000 是 NaN，所以秒数算不出来，和分钟数拼在一起
      expect(formatDuration(Infinity)).assertEqual('Infinity min NaN s');
      expect(formatDuration(Infinity).startsWith('Infinity min')).assertTrue();
      // 秒位不是数字：取模得到 NaN，Math.floor(NaN) 还是 NaN
      expect(formatDuration(Infinity).endsWith('NaN s')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_NUM_0400
     * @tc.name testNumericEdge0004
     * @tc.desc Verify the sub-second branch prints the raw value instead of rounding it.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumericEdge0004', 0, () => {
      expect(formatDuration(1.5)).assertEqual('1.5 ms');
      expect(formatDuration(999.9)).assertEqual('999.9 ms');
      // 恰好 1000 进入秒档，999.9 仍在毫秒档，分界没有偏移
      expect(formatDuration(1000)).assertEqual('1.0 s');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_NUM_0500
     * @tc.name testNumericEdge0005
     * @tc.desc Verify 59999.9 ms still uses the second branch and therefore prints 60.0 s.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumericEdge0005', 0, () => {
      // 值仍小于 60000，所以没进分钟档；但 toFixed(1) 把 59.9999 显示成 "60.0"
      expect(formatDuration(59999.9)).assertEqual('60.0 s');
      // 再多 0.1ms 才真正进入分钟档，得到 "1 min 0 s"
      expect(formatDuration(60000)).assertEqual('1 min 0 s');
      // 分档只看原始毫秒数，整数 59999 同样显示成 60.0 s
      expect(formatDuration(59999)).assertEqual('60.0 s');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_NUM_0600
     * @tc.name testNumericEdge0006
     * @tc.desc Verify negative zero is not treated as negative, so it prints 0 ms through the ms branch.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumericEdge0006', 0, () => {
      // -0 < 0 为 false，因此不会走"负数一律 0 ms"那条早退分支
      expect(formatDuration(-0)).assertEqual('0 ms');
      expect(formatDuration(-0)).assertEqual(formatDuration(0));
      // 真正的负数才走早退
      expect(formatDuration(-0.1)).assertEqual('0 ms');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_NUM_0700
     * @tc.name testNumericEdge0007
     * @tc.desc Verify a NaN budget falls through both guards and keeps the whole text behind the ellipsis.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumericEdge0007', 0, () => {
      // NaN <= 3 与 text.length <= NaN 都是 false，于是 head/tail 都算成 NaN；
      // slice(0, NaN) 截成空串，slice(NaN) 等价于 slice(0)，结果只剩一个省略号加全文
      expect(truncateMiddle('abcdef', NaN)).assertEqual('…abcdef');
      // 全文一个字都没被裁掉，只是前面多了一个省略号
      expect(truncateMiddle('abcdef', NaN).length).assertEqual('abcdef'.length + 1);
      expect(truncateMiddle('abcdef', NaN).endsWith('abcdef')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_NUM_0800
     * @tc.name testNumericEdge0008
     * @tc.desc Verify an infinite budget never truncates, because every length is below Infinity.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumericEdge0008', 0, () => {
      expect(truncateMiddle('abcdefgh', Infinity)).assertEqual('abcdefgh');
      // 同上，长度比较在 Infinity 面前恒成立
      expect(truncateMiddle('', Infinity)).assertEqual('');
      // 与"预算刚好等于长度"的结果完全一致，说明根本没进裁剪分支
      expect(truncateMiddle('abcdefgh', Infinity)).assertEqual(truncateMiddle('abcdefgh', 8));
    });

    /**
     * @tc.number SUB_INPUT_METHOD_NUM_0900
     * @tc.name testNumericEdge0009
     * @tc.desc Verify a fractional budget silently exceeds its own limit because slice truncates the tail index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumericEdge0009', 0, () => {
      // keep=3.5, head=ceil(1.75)=2, tail=1.5；slice(8-1.5)=slice(6.5) 被截断成 6，取到 'gh'
      const result: string = truncateMiddle('abcdefgh', 4.5);
      expect(result).assertEqual('ab…gh');
      // 结果长度 5，比预算 4.5 还长：小数预算不会得到小数结果
      expect(result.length).assertEqual(5);
      expect(result.length > 4.5).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_NUM_1000
     * @tc.name testNumericEdge0010
     * @tc.desc Verify negative zero counts as zero, so no bracket is appended.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumericEdge0010', 0, () => {
      // -0 === 0 为 true，走"不拼括号"分支
      expect(describeStatusWithCode('成功', -0)).assertEqual('成功');
      expect(describeStatusWithCode('成功', -0).includes('（')).assertFalse();
      // 与真正的 0 走同一分支，说明严格相等把 -0 归到 0 那一侧
      expect(describeStatusWithCode('成功', -0)).assertEqual(describeStatusWithCode('成功', 0));
    });

    /**
     * @tc.number SUB_INPUT_METHOD_NUM_1100
     * @tc.name testNumericEdge0011
     * @tc.desc Verify NaN is not zero, so it gets printed verbatim inside the bracket.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumericEdge0011', 0, () => {
      expect(describeStatusWithCode('失败', NaN)).assertEqual('失败（NaN）');
      // 与 0 的严格相等只有 -0 能通过，NaN 通不过
      expect(describeStatusWithCode('失败', NaN) !== '失败').assertTrue();
      // 括号确实拼上了，而不是文案里本来就带括号
      expect(describeStatusWithCode('失败', NaN).startsWith('失败（')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_NUM_1200
     * @tc.name testNumericEdge0012
     * @tc.desc Verify a capacity between zero and one keeps zero entries instead of falling back to the default.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumericEdge0012', 0, () => {
      // 0.5 > 0 成立，所以不会走"容量非法就用默认 200"的兜底；
      // 随后 slice(0, 0.5) 被截断成 slice(0, 0)，一条都留不下
      const next: LogItem[] = appendLog([], new LogItem(SOURCE, TAG, '唯一一条'), 0.5);
      expect(next.length).assertEqual(0);
      // 同样传 0 会走兜底容量，能留下这一条：小数容量比 0 更危险
      expect(appendLog([], new LogItem(SOURCE, TAG, '唯一一条'), 0).length).assertEqual(1);
      // 负数容量也走兜底，只有 (0,1) 的小数才是真正的坑
      expect(appendLog([], new LogItem(SOURCE, TAG, '唯一一条'), -1).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_NUM_1300
     * @tc.name testNumericEdge0013
     * @tc.desc Verify NaN capacity activates the default fallback instead of dropping every entry.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumericEdge0013', 0, () => {
      // NaN > 0 为 false，走默认容量兜底，因此四条都能保留
      const existing: LogItem[] = logsOf(3);
      const next: LogItem[] = appendLog(existing, new LogItem(SOURCE, TAG, '新的一条'), NaN);
      expect(next.length).assertEqual(4);
      // 新条目仍在最前
      expect(next[0].detail).assertEqual('新的一条');
      // 结果与"不传容量、走默认 200"完全一样，NaN 被当成了非法值
      expect(next.length).assertEqual(appendLog(existing, new LogItem(SOURCE, TAG, '新的一条')).length);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_NUM_1400
     * @tc.name testNumericEdge0014
     * @tc.desc Verify an infinite capacity disables trimming entirely.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumericEdge0014', 0, () => {
      const existing: LogItem[] = logsOf(3);
      const next: LogItem[] = appendLog(existing, new LogItem(SOURCE, TAG, '新的一条'), Infinity);
      expect(next.length).assertEqual(4);
      // 入参没有被就地修改，返回的是一份新数组
      expect(existing.length).assertEqual(3);
      // 只多了一条，没有把老条目截掉
      expect(next.length).assertEqual(existing.length + 1);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_NUM_1500
     * @tc.name testNumericEdge0015
     * @tc.desc Verify a capacity of 1.5 truncates down to a single entry rather than two.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumericEdge0015', 0, () => {
      const existing: LogItem[] = logsOf(1);
      const next: LogItem[] = appendLog(existing, new LogItem(SOURCE, TAG, '新的一条'), 1.5);
      // 2 > 1.5 成立，slice(0, 1.5) 截断成 slice(0, 1)
      expect(next.length).assertEqual(1);
      expect(next[0].detail).assertEqual('新的一条');
      // 条数等于向下取整后的容量，而不是四舍五入后的 2
      expect(next.length).assertEqual(Math.floor(1.5));
    });

    /**
     * @tc.number SUB_INPUT_METHOD_NUM_1600
     * @tc.name testNumericEdge0016
     * @tc.desc Verify a fractional limit between zero and one returns nothing, unlike a limit of zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumericEdge0016', 0, () => {
      const logs: LogItem[] = logsOf(3);
      // limit=0 会走"不裁剪"分支返回全部，0.5 却走裁剪分支返回空数组，两者语义相反
      expect(queryLogs(logs, SOURCE, LogLevel.DEBUG, '', 0).length).assertEqual(3);
      expect(queryLogs(logs, SOURCE, LogLevel.DEBUG, '', 0.5).length).assertEqual(0);
      // 负数 limit 与 0 同属"不裁剪"，只有正的小数才算裁剪
      expect(queryLogs(logs, SOURCE, LogLevel.DEBUG, '', -1).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_NUM_1700
     * @tc.name testNumericEdge0017
     * @tc.desc Verify a NaN limit is treated like a non-positive limit and returns the whole match set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumericEdge0017', 0, () => {
      const logs: LogItem[] = logsOf(5);
      expect(queryLogs(logs, SOURCE, LogLevel.DEBUG, '', NaN).length).assertEqual(5);
      // 正常的正数 limit 仍然生效，说明上面不是"函数始终返回全部"
      expect(queryLogs(logs, SOURCE, LogLevel.DEBUG, '', 2).length).assertEqual(2);
      // 裁剪是保留原顺序、从头部取，没有打乱或倒序
      expect(queryLogs(logs, SOURCE, LogLevel.DEBUG, '', 2)[0].detail).assertEqual('第 0 条');
    });
  });
}
