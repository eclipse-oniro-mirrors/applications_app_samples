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
  EXTRA_CONFIG_MAX_BYTES,
  KEYBOARD_BUFFER_LIMIT,
  LOG_PREVIEW_LENGTH,
  StorageKeys
} from '../../../main/ets/common/AppConstants';
import {
  ApiStatus,
  apiStatusName,
  CallOutcome,
  classifyErrorCode,
  emptyOutcome,
  failedOutcome,
  invalidOutcome,
  okOutcome
} from '../../../main/ets/model/CallOutcome';
import {
  ConfigEntry,
  StubEditorAttribute,
  buildExtraConfig,
  configByteLength,
  configFromJson,
  configJson,
  defaultEntries,
  describeEntries,
  paddedEntries,
  readExtraConfig,
  utf8Bytes
} from '../../../main/ets/model/ExtraConfigModel';
import { FeatureEntry, featureById, filterFeatures, uncoveredSummary } from '../../../main/ets/model/FeatureCatalog';
import {
  ACTION_CHAR,
  ACTION_DELETE,
  ACTION_MODE,
  KeyEdit,
  KeySpec,
  KeyboardMode,
  applyKey,
  buildFunctionRow,
  buildRows,
  candidatesFor,
  charCount,
  modeName
} from '../../../main/ets/model/KeyboardModel';
import { LogItem, LogLevel, queryLogs } from '../../../main/ets/model/LogStore';
import { describeThrown, formatError } from '../../../main/ets/utils/ErrorUtil';
import { defaultOutcomes } from '../../../main/ets/utils/ExtraConfigSession';
import { formatDuration, formatTime, truncateMiddle } from '../../../main/ets/utils/FormatUtil';
import { actionText, clampSelected, listSummary, patternSpecs } from '../../../main/ets/utils/InputMethodListSession';
import { Logger } from '../../../main/ets/utils/Logger';

/** AppStorage 里的日志快照：链路用例统一从这里读回，而不是另建一份内存数组 */
function storedLogs(): LogItem[] {
  return AppStorage.get<LogItem[]>(StorageKeys.APP_LOGS) ?? [];
}

/** 按 label 在真实按键行里找键，找不到就抛错，避免用假 KeySpec 绕过布局 */
function keyOf(label: string, mode: KeyboardMode): KeySpec {
  const rows: KeySpec[][] = buildRows(mode);
  for (let i = 0; i < rows.length; i++) {
    for (let j = 0; j < rows[i].length; j++) {
      if (rows[i][j].label === label) {
        return rows[i][j];
      }
    }
  }
  const functions: KeySpec[] = buildFunctionRow(mode);
  for (let i = 0; i < functions.length; i++) {
    if (functions[i].label === label) {
      return functions[i];
    }
  }
  throw new Error(`按键行里没有这个键：${label}`);
}

/**
 * 跨模块编排链路：单函数用例只能证明"每个零件对"，这里证明"零件之间接得上"。
 *
 * 四条链路都是页面真实走过的顺序：
 * 写配置 → 序列化 → 还原 → 读回；打字 → 候选 → 删除 → 换模式；
 * 异常 → 取码 → 分类 → 文案；写日志 → 存储 → 过滤 → 截断显示。
 * 任何一处命名或类型约定改了而另一处没跟上，单函数用例仍会全绿，这里会红。
 */
export default function inputMethodChainScenarioTest() {
  describe('InputMethodChainScenarioTest', () => {
    /**
     * @tc.number SUB_INPUT_METHOD_CHAIN_0100
     * @tc.name testChainScenario0001
     * @tc.desc Verify the written config survives json round trip with the same byte count and the same four values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChainScenario0001', 0, () => {
      const entries: ConfigEntry[] = defaultEntries();
      const config = buildExtraConfig(entries);
      const text = configJson(config);
      const parsed = configFromJson(text);
      expect(parsed === undefined).assertFalse();
      if (parsed !== undefined) {
        expect(configByteLength(parsed)).assertEqual(configByteLength(config));
        expect(utf8Bytes(text)).assertEqual(configByteLength(config));
        const restored: ConfigEntry[] = readExtraConfig(new StubEditorAttribute(0, 'com.demo', parsed));
        expect(restored.length).assertEqual(entries.length);
        expect(restored[0].key).assertEqual('candidate.limit');
        expect(restored[0].value).assertEqual(8);
        expect(restored[3].key).assertEqual('voice.enabled');
        expect(restored[3].value).assertEqual(false);
      }
    });

    /**
     * @tc.number SUB_INPUT_METHOD_CHAIN_0200
     * @tc.name testChainScenario0002
     * @tc.desc Verify padding to the documented ceiling lands exactly on 32768 bytes and reports the padding entry.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChainScenario0002', 0, () => {
      const entries: ConfigEntry[] = paddedEntries(EXTRA_CONFIG_MAX_BYTES);
      const bytes = configByteLength(buildExtraConfig(entries));
      expect(bytes).assertEqual(32768);
      expect(bytes).assertEqual(EXTRA_CONFIG_MAX_BYTES);
      expect(entries.length).assertEqual(5);
      expect(entries[4].key).assertEqual('padding');
      expect(describeEntries(entries, 4).includes('共 5 项')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_CHAIN_0300
     * @tc.name testChainScenario0003
     * @tc.desc Verify one extra byte is enough to cross the ceiling, so the caller must compare rather than guess.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChainScenario0003', 0, () => {
      const bytes = configByteLength(buildExtraConfig(paddedEntries(EXTRA_CONFIG_MAX_BYTES + 1)));
      expect(bytes).assertEqual(32769);
      expect(bytes > EXTRA_CONFIG_MAX_BYTES).assertTrue();
      expect(bytes - EXTRA_CONFIG_MAX_BYTES).assertEqual(1);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_CHAIN_0400
     * @tc.name testChainScenario0004
     * @tc.desc Verify the editor attribute path returns keys in sorted order and an absent config yields no entries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChainScenario0004', 0, () => {
      const attribute = new StubEditorAttribute(1, 'com.example.editor', buildExtraConfig(defaultEntries()));
      const read: ConfigEntry[] = readExtraConfig(attribute);
      expect(read.length).assertEqual(4);
      expect(read[0].key).assertEqual('candidate.limit');
      expect(read[3].key).assertEqual('voice.enabled');
      expect(read[0].key < read[1].key).assertTrue();
      expect(readExtraConfig(undefined).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_CHAIN_0500
     * @tc.name testChainScenario0005
     * @tc.desc Verify a real key from the layout feeds the buffer and the candidate bar follows that buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChainScenario0005', 0, () => {
      const aKey: KeySpec = keyOf('a', KeyboardMode.LETTER);
      const first: KeyEdit = applyKey('', KeyboardMode.LETTER, aKey, KEYBOARD_BUFFER_LIMIT);
      expect(first.text).assertEqual('a');
      expect(first.inserted).assertEqual('a');
      const second = applyKey(first.text, first.mode, keyOf('b', KeyboardMode.LETTER), KEYBOARD_BUFFER_LIMIT);
      expect(second.text).assertEqual('ab');
      const candidates: string[] = candidatesFor(second.text);
      expect(candidates.length).assertEqual(3);
      expect(candidates[0]).assertEqual('ab');
      expect(candidates[2]).assertEqual('ab的');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_CHAIN_0600
     * @tc.name testChainScenario0006
     * @tc.desc Verify the mode key changes the rows that are shown while delete keeps working on the shared buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChainScenario0006', 0, () => {
      const modeKey: KeySpec = buildFunctionRow(KeyboardMode.LETTER)[0];
      expect(modeKey.action).assertEqual(ACTION_MODE);
      const switched = applyKey('abc', KeyboardMode.LETTER, modeKey, KEYBOARD_BUFFER_LIMIT);
      expect(switched.mode).assertEqual(KeyboardMode.NUMBER);
      expect(modeName(switched.mode)).assertEqual('数字与符号');
      expect(buildRows(switched.mode)[0][0].label).assertEqual('1');
      const deleted = applyKey('abc', KeyboardMode.NUMBER, keyOf('⌫', KeyboardMode.NUMBER), KEYBOARD_BUFFER_LIMIT);
      expect(deleted.text).assertEqual('ab');
      expect(deleted.deleted).assertEqual(1);
      expect(deleted.mode).assertEqual(KeyboardMode.NUMBER);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_CHAIN_0700
     * @tc.name testChainScenario0007
     * @tc.desc Verify sixty four presses fill the buffer and sixty four deletes empty it, with the limit
     * held throughout.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChainScenario0007', 0, () => {
      let text = '';
      for (let i = 0; i < KEYBOARD_BUFFER_LIMIT; i++) {
        text = applyKey(text, KeyboardMode.LETTER, new KeySpec('k', ACTION_CHAR), KEYBOARD_BUFFER_LIMIT).text;
      }
      expect(charCount(text)).assertEqual(KEYBOARD_BUFFER_LIMIT);
      const blocked = applyKey(text, KeyboardMode.LETTER, new KeySpec('k', ACTION_CHAR), KEYBOARD_BUFFER_LIMIT);
      expect(blocked.inserted).assertEqual('');
      expect(blocked.text).assertEqual(text);
      for (let i = 0; i < KEYBOARD_BUFFER_LIMIT; i++) {
        text = applyKey(text, KeyboardMode.LETTER, new KeySpec('⌫', ACTION_DELETE), KEYBOARD_BUFFER_LIMIT).text;
      }
      expect(text).assertEqual('');
      expect(charCount(text)).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_CHAIN_0800
     * @tc.name testChainScenario0008
     * @tc.desc Verify the four outcome factories produce the bracket rule the page relies on: zero hides, others show.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChainScenario0008', 0, () => {
      const ok = okOutcome('probe', '正常', '细节', 12);
      const failed = failedOutcome('probe', ApiStatus.INVALID_INPUT, 401, '入参无效', '细节', 3);
      const empty = emptyOutcome('probe', '细节', 1);
      const invalid = invalidOutcome('probe', '细节');
      expect(ok.describe()).assertEqual('probe → 成功：正常');
      expect(ok.describe().includes('（0）')).assertFalse();
      expect(failed.describe()).assertEqual('probe → 入参无效：入参无效（401）');
      expect(empty.describe().includes('（-2）')).assertTrue();
      expect(invalid.describe().includes('（401）')).assertTrue();
      expect(empty.isOk()).assertFalse();
      expect(invalid.durationMs).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_CHAIN_0900
     * @tc.name testChainScenario0009
     * @tc.desc Verify one code reaches the same category and the same advice through every helper the pages use.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChainScenario0009', 0, () => {
      const status = classifyErrorCode(401);
      expect(status).assertEqual(ApiStatus.INVALID_INPUT);
      expect(apiStatusName(status)).assertEqual('入参无效');
      expect(describeThrown('probe', 401, 'bad param').includes('（401）')).assertTrue();
      expect(describeThrown('probe', 401, 'bad param').includes('32KB')).assertTrue();
      expect(formatError('probe', 401, 'bad param')).assertEqual('probe失败（401）：bad param');
      expect(describeThrown('probe', 401, 'bad param').startsWith('probe失败')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_CHAIN_1000
     * @tc.name testChainScenario0010
     * @tc.desc Verify one Logger call reaches AppStorage and comes back through the filter the log panel runs.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChainScenario0010', 0, () => {
      Logger.clear();
      Logger.info('链路', 'chain', '写入一条');
      const logs: LogItem[] = storedLogs();
      expect(logs.length).assertEqual(1);
      expect(logs[0].source).assertEqual('链路');
      expect(logs[0].level).assertEqual(LogLevel.INFO);
      const hits: LogItem[] = queryLogs(logs, '链路', LogLevel.INFO, 'chain', 10);
      expect(hits.length).assertEqual(1);
      expect(hits[0].detail).assertEqual('写入一条');
      expect(Logger.count('链路', 'chain')).assertEqual(1);
      Logger.clear();
      expect(storedLogs().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_CHAIN_1100
     * @tc.name testChainScenario0011
     * @tc.desc Verify one log item can be rendered as time plus a fixed width preview without touching the stored text.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChainScenario0011', 0, () => {
      const detail = 'x'.repeat(200);
      const item = new LogItem('page', 'tag', detail, LogLevel.WARN);
      expect(item.time.length).assertEqual(8);
      expect(item.time.split(':').length).assertEqual(3);
      const preview = truncateMiddle(item.detail, LOG_PREVIEW_LENGTH);
      expect(preview.length).assertEqual(LOG_PREVIEW_LENGTH);
      expect(preview.includes('…')).assertTrue();
      expect(item.detail.length).assertEqual(200);
      expect(formatDuration(1234)).assertEqual('1.2 s');
      const fixed = new Date(2026, 0, 2, 3, 4, 5);
      expect(formatTime(fixed)).assertEqual('03:04:05');
      expect(new LogItem('page', 'tag', 'd', LogLevel.INFO, fixed).time).assertEqual('03:04:05');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_CHAIN_1200
     * @tc.name testChainScenario0012
     * @tc.desc Verify the list summary, the clicked row text and the clamped selection all describe the same two items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChainScenario0012', 0, () => {
      const specs = patternSpecs();
      expect(listSummary(specs)).assertEqual('2 个模式项：中文输入、英文输入；默认选中第 1 项');
      expect(specs[0].display()).assertEqual('1. 中文输入（拼音候选，适用于文本编辑框）');
      expect(actionText(1, specs)).assertEqual('回调下标 1：英文输入');
      expect(actionText(9, specs).includes('超出范围')).assertTrue();
      expect(clampSelected(9, specs.length)).assertEqual(0);
      expect(clampSelected(1, specs.length)).assertEqual(1);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_CHAIN_1300
     * @tc.name testChainScenario0013
     * @tc.desc Verify a searched feature still resolves to the demo route the navigator expects.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChainScenario0013', 0, () => {
      const hits: FeatureEntry[] = filterFeatures('面板');
      expect(hits.length).assertEqual(1);
      const feature = featureById(hits[0].id);
      expect(feature === undefined).assertFalse();
      if (feature !== undefined) {
        expect(feature.route.startsWith('pages/demos/')).assertTrue();
        expect(feature.apiSummary().length > 0).assertTrue();
      }
      expect(uncoveredSummary().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_CHAIN_1400
     * @tc.name testChainScenario0014
     * @tc.desc Verify the six demo results can be logged one by one and filtered back by the api name
     * that produced them.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChainScenario0014', 0, () => {
      Logger.clear();
      const outcomes = defaultOutcomes();
      outcomes.forEach((item: CallOutcome) => {
        Logger.info(item.api, item.status, item.describe());
      });
      const logs: LogItem[] = storedLogs();
      expect(logs.length).assertEqual(6);
      expect(logs[0].detail).assertEqual(outcomes[5].describe());
      expect(queryLogs(logs, 'buildExtraConfig', LogLevel.DEBUG, '', 10).length).assertEqual(1);
      expect(queryLogs(logs, '', LogLevel.ERROR, '', 0).length).assertEqual(0);
      Logger.clear();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_CHAIN_1500
     * @tc.name testChainScenario0015
     * @tc.desc Verify a CJK plus emoji value survives the round trip while the byte count stays above the char count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testChainScenario0015', 0, () => {
      const config = buildExtraConfig([new ConfigEntry('greeting', '中文😀')]);
      const text = configJson(config);
      expect(utf8Bytes(text) > text.length).assertTrue();
      const parsed = configFromJson(text);
      expect(parsed === undefined).assertFalse();
      if (parsed !== undefined) {
        const read: ConfigEntry[] = readExtraConfig(new StubEditorAttribute(0, 'com.demo', parsed));
        expect(read.length).assertEqual(1);
        expect(read[0].value).assertEqual('中文😀');
        expect(configByteLength(parsed)).assertEqual(utf8Bytes(text));
      }
    });
  });
}
