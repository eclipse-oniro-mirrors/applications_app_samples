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
import {
  ConfigEntry,
  StubEditorAttribute,
  buildExtraConfig,
  configByteLength,
  configFromJson,
  defaultEntries,
  describeEntries,
  paddedEntries,
  readExtraConfig
} from '../../../main/ets/model/ExtraConfigModel';
import { EXTRA_CONFIG_MAX_BYTES } from '../../../main/ets/common/AppConstants';

/** 把 JSON 文本读成条目列表，读不出来时返回 -1 长度的数组，交给用例断言 */
function entriesOf(json: string): ConfigEntry[] {
  const config = configFromJson(json);
  if (config === undefined) {
    return [];
  }
  return readExtraConfig(new StubEditorAttribute(0, 'com.example.probe', config));
}

/** 目标字节数对应的实际字节数 */
function bytesOfTarget(target: number): number {
  return configByteLength(buildExtraConfig(paddedEntries(target)));
}

/**
 * JSON 与额度异常输入：解析结果的结构变形、以及"目标字节数"不是正常正数时的行为。
 *
 * `configFromJson` 把 JSON.parse 的结果直接当 InputMethodExtraConfig 用，只在 customSettings
 * 缺失时报错；所以 null 值、空 key、重复 key 这些都能进来。`paddedEntries` 同理——
 * 它算的是 `targetBytes - baseBytes`，目标小于基线时补丁为空串，目标带小数时长度会被截断。
 * 这些输入在真实链路里出现概率不高，但都是"不抛错、静默返回怪结果"的类型，必须锁住。
 */
export default function inputMethodConfigEdgeTest() {
  describe('InputMethodConfigEdgeTest', () => {
    /**
     * @tc.number SUB_INPUT_METHOD_CFG_0100
     * @tc.name testConfigEdge0001
     * @tc.desc Verify the JSON literal null is rejected instead of being treated as an empty config.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConfigEdge0001', 0, () => {
      // JSON.parse('null') 得到 null，紧接着读 .customSettings 会抛错，被 catch 兜住
      expect(configFromJson('null') === undefined).assertTrue();
      // 空串走的是同一个 catch 分支
      expect(configFromJson('') === undefined).assertTrue();
      // 而一个结构正确的空对象是合法的，不能一起被拒
      expect(configFromJson('{"customSettings":{}}') === undefined).assertFalse();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_CFG_0200
     * @tc.name testConfigEdge0002
     * @tc.desc Verify an empty customSettings parses fine but produces zero entries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConfigEdge0002', 0, () => {
      const entries: ConfigEntry[] = entriesOf('{"customSettings":{}}');
      expect(entries.length).assertEqual(0);
      // 没有条目时描述文案就是空串，不会多出一个“共 0 项”的尾巴
      expect(describeEntries(entries)).assertEqual('');
      // 空对象不是缺失，所以 configFromJson 不返回 undefined
      expect(configFromJson('{"customSettings":{}}') === undefined).assertFalse();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_CFG_0300
     * @tc.name testConfigEdge0003
     * @tc.desc Verify duplicate keys in the JSON text collapse to the last value, as JSON.parse defines.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConfigEdge0003', 0, () => {
      const entries: ConfigEntry[] = entriesOf('{"customSettings":{"a":1,"b":2,"a":3}}');
      // 重复的 a 只留一份，取后出现的值
      expect(entries.length).assertEqual(2);
      expect(entries[0].key).assertEqual('a');
      expect(entries[0].value).assertEqual(3);
      expect(entries[1].value).assertEqual(2);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_CFG_0400
     * @tc.name testConfigEdge0004
     * @tc.desc Verify a null value is accepted and then labelled as a string, since typeof null is object.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConfigEdge0004', 0, () => {
      const entries: ConfigEntry[] = entriesOf('{"customSettings":{"a":null}}');
      expect(entries.length).assertEqual(1);
      // typeof null 是 'object'，既不是 number 也不是 boolean，于是类型名回落成 string
      expect(entries[0].typeName()).assertEqual('string');
      expect(entries[0].display()).assertEqual('a = null（string）');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_CFG_0500
     * @tc.name testConfigEdge0005
     * @tc.desc Verify an empty string key survives the round trip instead of being filtered out.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConfigEdge0005', 0, () => {
      const entries: ConfigEntry[] = entriesOf('{"customSettings":{"":1}}');
      expect(entries.length).assertEqual(1);
      expect(entries[0].key).assertEqual('');
      expect(entries[0].value).assertEqual(1);
      // 空 key 不参与排序，但也不会被丢掉
      expect(entries[0].display()).assertEqual(' = 1（number）');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_CFG_0600
     * @tc.name testConfigEdge0006
     * @tc.desc Verify a target at or below the baseline leaves the padding value empty instead of shrinking.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConfigEdge0006', 0, () => {
      const entries: ConfigEntry[] = paddedEntries(-1);
      // 补丁长度算成负数后取空串，条目数仍是"默认 4 项 + 1 个 padding"
      expect(entries.length).assertEqual(5);
      expect(entries[4].key).assertEqual('padding');
      expect(entries[4].value).assertEqual('');
      // 目标 0 与目标 -1 的实际字节数完全相同，说明它不会把配置压缩到 0
      expect(bytesOfTarget(0)).assertEqual(bytesOfTarget(-1));
    });

    /**
     * @tc.number SUB_INPUT_METHOD_CFG_0700
     * @tc.name testConfigEdge0007
     * @tc.desc Verify a NaN target fails the positive check and also produces an empty padding.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConfigEdge0007', 0, () => {
      const entries: ConfigEntry[] = paddedEntries(NaN);
      expect(entries.length).assertEqual(5);
      expect(entries[4].value).assertEqual('');
      // NaN > 0 为 false，与负数走同一分支
      expect(bytesOfTarget(NaN)).assertEqual(bytesOfTarget(-1));
      // 真正的正数目标才会补出内容
      expect(bytesOfTarget(2000)).assertEqual(2000);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_CFG_0800
     * @tc.name testConfigEdge0008
     * @tc.desc Verify a fractional target never exceeds the byte budget, because repeat truncates the count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConfigEdge0008', 0, () => {
      // 'x'.repeat 会把小数截断，因此实际字节数只会小于等于目标，不会超出
      const bytes: number = bytesOfTarget(EXTRA_CONFIG_MAX_BYTES + 0.5);
      expect(bytes <= EXTRA_CONFIG_MAX_BYTES).assertTrue();
      // 整数目标能精确压线
      expect(bytesOfTarget(EXTRA_CONFIG_MAX_BYTES)).assertEqual(EXTRA_CONFIG_MAX_BYTES);
      // 小数目标不会比整数目标更“大”，两者都被压在额度以内
      expect(bytes <= bytesOfTarget(EXTRA_CONFIG_MAX_BYTES)).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_CFG_0900
     * @tc.name testConfigEdge0009
     * @tc.desc Verify a NaN limit shows nothing but the tail summary, and does not throw.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConfigEdge0009', 0, () => {
      const text: string = describeEntries(defaultEntries(), NaN);
      // slice(0, NaN) 得到空数组，于是只剩"共 N 项"的尾巴，前面还留了一个分隔符
      expect(text).assertEqual('；…共 4 项');
      expect(text.startsWith('；')).assertTrue();
      // NaN 与 0 完全一致：两者都被 slice 当成“取 0 条”
      expect(describeEntries(defaultEntries(), 0)).assertEqual(text);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_CFG_1000
     * @tc.name testConfigEdge0010
     * @tc.desc Verify a fractional limit rounds down to one shown entry while the tail still counts all four.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConfigEdge0010', 0, () => {
      const text: string = describeEntries(defaultEntries(), 1.5);
      // slice(0, 1.5) 截断成 1 项，但"共 N 项"用的是真实总数
      expect(text.includes('共 4 项')).assertTrue();
      expect(text.includes('input.habit')).assertFalse();
      expect(text.startsWith('theme.color')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_CFG_1100
     * @tc.name testConfigEdge0011
     * @tc.desc Verify a negative limit drops entries from the tail rather than returning nothing.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConfigEdge0011', 0, () => {
      const text: string = describeEntries(defaultEntries(), -1);
      // slice(0, -1) 保留前三项，末项 candidate.limit 被丢下
      expect(text.includes('theme.color')).assertTrue();
      expect(text.includes('input.habit')).assertTrue();
      expect(text.includes('candidate.limit')).assertFalse();
      expect(text.includes('共 4 项')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_CFG_1200
     * @tc.name testConfigEdge0012
     * @tc.desc Verify keys are sorted by UTF-16 code unit, so uppercase letters come before lowercase.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConfigEdge0012', 0, () => {
      const entries: ConfigEntry[] = entriesOf('{"customSettings":{"a":1,"B":2}}');
      expect(entries.length).assertEqual(2);
      // 'B' 是 0x42，'a' 是 0x61，按码元排序大写在前，不是按字母表忽略大小写
      expect(entries[0].key).assertEqual('B');
      expect(entries[1].key).assertEqual('a');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_CFG_1300
     * @tc.name testConfigEdge0013
     * @tc.desc Verify the default limit shows six entries out of eight, so the default is not silently larger.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConfigEdge0013', 0, () => {
      const entries: ConfigEntry[] = entriesOf('{"customSettings":{"k1":1,"k2":2,"k3":3,"k4":4,' +
        '"k5":5,"k6":6,"k7":7,"k8":8}}');
      expect(entries.length).assertEqual(8);
      // 不传 limit 时取默认 6：显示 6 项，尾巴报总数 8；前几条用例的条目都不超过 6 条，默认值一直是空的
      const text: string = describeEntries(entries);
      expect(text.includes('k6 = 6')).assertTrue();
      expect(text.includes('k7 = 7')).assertFalse();
      expect(text.includes('共 8 项')).assertTrue();
    });
  });
}
