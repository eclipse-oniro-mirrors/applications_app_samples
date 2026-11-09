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
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { bindResourceManager } from '../../../main/ets/common/StringResource';
import {
  EXTRA_CONFIG_MAX_BYTES,
  KEY_CANDIDATE_LIMIT,
  KEY_INPUT_HABIT,
  KEY_THEME_COLOR,
  KEY_VOICE_ENABLED,
  KEYBOARD_BUFFER_LIMIT,
  LIST_PATTERN_COUNT
} from '../../../main/ets/common/AppConstants';
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
  settingsOf,
  utf8Bytes
} from '../../../main/ets/model/ExtraConfigModel';
import {
  ACTION_DELETE,
  ACTION_ENTER,
  KeyEdit,
  KeySpec,
  KeyboardMode,
  NUMBER_ROWS,
  LETTER_ROWS,
  applyKey,
  appendChar,
  buildFunctionRow,
  buildRows,
  candidatesFor,
  deleteLast,
  modeName,
  switchMode
} from '../../../main/ets/model/KeyboardModel';
import {
  ApiStatus,
  apiStatusName,
  classifyErrorCode
} from '../../../main/ets/model/CallOutcome';
import { FEATURES, filterFeatures, declaredApiCount, routes } from '../../../main/ets/model/FeatureCatalog';
import { apiStatusHint, codeOfThrown, describeThrown } from '../../../main/ets/utils/ErrorUtil';
import {
  buildDefaultOutcome,
  defaultOutcomes,
  nearLimitOutcome,
  oversizedOutcome,
  readAbsentOutcome,
  readStubOutcome,
  roundTripOutcome
} from '../../../main/ets/utils/ExtraConfigSession';
import {
  actionText,
  clampSelected,
  listSummary,
  patternSpecs,
  specAt
} from '../../../main/ets/utils/InputMethodListSession';

/** 只带 code / message 的错误对象：复现 BusinessError 被 catch 到时的最小形状 */
class CodedError {
  public code: number;
  public message: string;

  constructor(code: number, message: string) {
    this.code = code;
    this.message = message;
  }
}

export default function inputMethodDataTest() {
  // 模型层只产出资源名称，用例断言的是真实文案：这里是 testsuite() 第一个注册的套件，
  // 先把测试进程的资源管理器交给 StringResource，后续所有套件的 text() 才能取到本地化文本。
  // 放在本文件而不是 List.test.ets：入口文件只允许 import *.test 模块，否则 DevEco 静态扫描会认作“未注册”。
  bindResourceManager(abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager);
  describe('InputMethodExtraConfigDataTest', () => {
    /**
     * @tc.number SUB_INPUT_METHOD_DATA_0100
     * @tc.name testData0001
     * @tc.desc Verify the default entries cover number, string and boolean values with the declared keys.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testData0001', 0, () => {
      const entries = defaultEntries();
      expect(entries.length).assertEqual(4);
      expect(entries[0].key).assertEqual(KEY_THEME_COLOR);
      expect(entries[1].key).assertEqual(KEY_INPUT_HABIT);
      expect(entries[2].key).assertEqual(KEY_VOICE_ENABLED);
      expect(entries[3].key).assertEqual(KEY_CANDIDATE_LIMIT);
      const settings = settingsOf(entries);
      expect(Object.keys(settings).length).assertEqual(4);
      expect(settings[KEY_CANDIDATE_LIMIT]).assertEqual(8);
      expect(buildExtraConfig(entries).customSettings[KEY_VOICE_ENABLED]).assertEqual(false);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DATA_0200
     * @tc.name testData0002
     * @tc.desc Verify each custom value reports its own type name and display text.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testData0002', 0, () => {
      const numberEntry = new ConfigEntry('candidate.limit', 8);
      const stringEntry = new ConfigEntry('theme.color', '#0A59F7');
      const booleanEntry = new ConfigEntry('voice.enabled', false);
      expect(numberEntry.typeName()).assertEqual('number');
      expect(stringEntry.typeName()).assertEqual('string');
      expect(booleanEntry.typeName()).assertEqual('boolean');
      expect(numberEntry.display().includes('（number）')).assertTrue();
      expect(booleanEntry.display().includes('false')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DATA_0300
     * @tc.name testData0003
     * @tc.desc Verify UTF-8 counting handles ascii, Chinese characters and surrogate pairs.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testData0003', 0, () => {
      expect(utf8Bytes('')).assertEqual(0);
      expect(utf8Bytes('abc')).assertEqual(3);
      expect(utf8Bytes('#0A59F7')).assertEqual(7);
      expect(utf8Bytes('中文')).assertEqual(6);
      expect('😀'.length).assertEqual(2);
      expect(utf8Bytes('😀')).assertEqual(4);
      expect(utf8Bytes('a😀')).assertEqual(5);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DATA_0400
     * @tc.name testData0004
     * @tc.desc Verify the measured length equals the UTF-8 length of the serialized configuration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testData0004', 0, () => {
      const config = buildExtraConfig(defaultEntries());
      const json = configJson(config);
      expect(configByteLength(config)).assertEqual(utf8Bytes(json));
      expect(configByteLength(config) > 0).assertTrue();
      expect(configByteLength(config) < EXTRA_CONFIG_MAX_BYTES).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DATA_0500
     * @tc.name testData0005
     * @tc.desc Verify padding reaches exactly 32KB and exceeds it by one byte on demand.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testData0005', 0, () => {
      const nearBytes = configByteLength(buildExtraConfig(paddedEntries(EXTRA_CONFIG_MAX_BYTES)));
      expect(nearBytes).assertEqual(EXTRA_CONFIG_MAX_BYTES);
      const overBytes = configByteLength(buildExtraConfig(paddedEntries(EXTRA_CONFIG_MAX_BYTES + 1)));
      expect(overBytes).assertEqual(EXTRA_CONFIG_MAX_BYTES + 1);
      expect(paddedEntries(EXTRA_CONFIG_MAX_BYTES).length).assertEqual(5);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DATA_0600
     * @tc.name testData0006
     * @tc.desc Verify serializing and restoring keeps every key and value unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testData0006', 0, () => {
      const config = buildExtraConfig(defaultEntries());
      const restored = configFromJson(configJson(config));
      expect(restored === undefined).assertFalse();
      if (restored !== undefined) {
        expect(configJson(restored)).assertEqual(configJson(config));
        expect(restored.customSettings[KEY_THEME_COLOR]).assertEqual('#0A59F7');
        expect(restored.customSettings[KEY_CANDIDATE_LIMIT]).assertEqual(8);
      }
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DATA_0700
     * @tc.name testData0007
     * @tc.desc Verify malformed text and a payload without customSettings are rejected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testData0007', 0, () => {
      expect(configFromJson('not-json') === undefined).assertTrue();
      expect(configFromJson('{"other":1}') === undefined).assertTrue();
      expect(configFromJson('{"customSettings":null}') === undefined).assertTrue();
      const empty = configFromJson('{"customSettings":{}}');
      expect(empty === undefined).assertFalse();
      if (empty !== undefined) {
        expect(Object.keys(empty.customSettings).length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DATA_0800
     * @tc.name testData0008
     * @tc.desc Verify the stub editor attribute returns sorted entries and an absent config yields none.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testData0008', 0, () => {
      const stub = new StubEditorAttribute(0, 'com.example.inputmethodextension',
        buildExtraConfig(defaultEntries()));
      const read = readExtraConfig(stub);
      expect(read.length).assertEqual(4);
      expect(read[0].key).assertEqual(KEY_CANDIDATE_LIMIT);
      expect(read[3].key).assertEqual(KEY_VOICE_ENABLED);
      const absentStub = new StubEditorAttribute(0, 'com.example.inputmethodextension');
      expect(readExtraConfig(absentStub).length).assertEqual(0);
      expect(readExtraConfig(undefined).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DATA_0900
     * @tc.name testData0009
     * @tc.desc Verify the description truncates to the limit and reports the total count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testData0009', 0, () => {
      const limited = describeEntries(defaultEntries(), 2);
      expect(limited.includes('共 4 项')).assertTrue();
      expect(limited.includes('theme.color')).assertTrue();
      const full = describeEntries(defaultEntries(), 6);
      expect(full.includes('共')).assertFalse();
      expect(full.includes('candidate.limit = 8（number）')).assertTrue();
    });
  });

  describe('InputMethodKeyboardDataTest', () => {
    /**
     * @tc.number SUB_INPUT_METHOD_DATA_1000
     * @tc.name testData0010
     * @tc.desc Verify both modes keep three rows with the delete key at the end and numbers differ from letters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testData0010', 0, () => {
      expect(LETTER_ROWS.length).assertEqual(3);
      expect(LETTER_ROWS[0].length).assertEqual(10);
      expect(LETTER_ROWS[1].length).assertEqual(9);
      expect(LETTER_ROWS[2].length).assertEqual(7);
      expect(NUMBER_ROWS[0][0]).assertEqual('1');
      const letterRows: KeySpec[][] = buildRows(KeyboardMode.LETTER);
      expect(letterRows.length).assertEqual(3);
      expect(letterRows[2].length).assertEqual(8);
      const lastKey: KeySpec = letterRows[2][7];
      expect(lastKey.action).assertEqual(ACTION_DELETE);
      expect(lastKey.wide).assertTrue();
      const numberRows: KeySpec[][] = buildRows(KeyboardMode.NUMBER);
      expect(numberRows.length).assertEqual(3);
      expect(numberRows[0][0].label).assertEqual('1');
      expect(numberRows[2][numberRows[2].length - 1].action).assertEqual(ACTION_DELETE);
      expect(numberRows[0][0].label === letterRows[0][0].label).assertFalse();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DATA_1100
     * @tc.name testData0011
     * @tc.desc Verify the function row switches mode, inserts a space and confirms with enter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testData0011', 0, () => {
      const letterRow = buildFunctionRow(KeyboardMode.LETTER);
      expect(letterRow.length).assertEqual(3);
      expect(letterRow[0].label).assertEqual('123');
      expect(letterRow[1].label).assertEqual('空格');
      expect(letterRow[2].action).assertEqual(ACTION_ENTER);
      const numberRow = buildFunctionRow(KeyboardMode.NUMBER);
      expect(numberRow[0].label).assertEqual('abc');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DATA_1200
     * @tc.name testData0012
     * @tc.desc Verify appending, deleting and the buffer limit behave as declared.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testData0012', 0, () => {
      expect(appendChar('ab', 'c', 8)).assertEqual('abc');
      expect(appendChar('abc', 'd', 3)).assertEqual('abc');
      expect(deleteLast('abc')).assertEqual('ab');
      expect(deleteLast('')).assertEqual('');
      const charKey = new KeySpec('x', 'char');
      const typed: KeyEdit = applyKey('ab', KeyboardMode.LETTER, charKey, KEYBOARD_BUFFER_LIMIT);
      expect(typed.text).assertEqual('abx');
      expect(typed.inserted).assertEqual('x');
      const full = applyKey('abc', KeyboardMode.LETTER, charKey, 3);
      expect(full.text).assertEqual('abc');
      expect(full.inserted).assertEqual('');
      const deleted = applyKey('abx', KeyboardMode.LETTER, new KeySpec('⌫', ACTION_DELETE), 8);
      expect(deleted.text).assertEqual('ab');
      expect(deleted.deleted).assertEqual(1);
      const emptyDelete = applyKey('', KeyboardMode.LETTER, new KeySpec('⌫', ACTION_DELETE), 8);
      expect(emptyDelete.deleted).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DATA_1300
     * @tc.name testData0013
     * @tc.desc Verify switching mode twice returns to letters and keeps the buffer untouched.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testData0013', 0, () => {
      expect(switchMode(KeyboardMode.LETTER)).assertEqual(KeyboardMode.NUMBER);
      expect(switchMode(KeyboardMode.NUMBER)).assertEqual(KeyboardMode.LETTER);
      expect(modeName(KeyboardMode.NUMBER)).assertEqual('数字与符号');
      expect(modeName(KeyboardMode.LETTER)).assertEqual('字母');
      const switched = applyKey('ab', KeyboardMode.LETTER, new KeySpec('123', 'mode'), 8);
      expect(switched.text).assertEqual('ab');
      expect(switched.mode).assertEqual(KeyboardMode.NUMBER);
      expect(switched.inserted).assertEqual('');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DATA_1400
     * @tc.name testData0014
     * @tc.desc Verify candidates stay empty for an empty buffer and extend the typed text otherwise.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testData0014', 0, () => {
      expect(candidatesFor('').length).assertEqual(0);
      const candidates = candidatesFor('ni');
      expect(candidates.length).assertEqual(3);
      expect(candidates[0]).assertEqual('ni');
      expect(candidates[1].startsWith('ni')).assertTrue();
      expect(candidates[2].startsWith('ni')).assertTrue();
    });
  });

  describe('InputMethodListAndFoundationTest', () => {
    /**
     * @tc.number SUB_INPUT_METHOD_DATA_1500
     * @tc.name testData0015
     * @tc.desc Verify pattern specs, index clamping and the action callback description.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testData0015', 0, () => {
      const specs = patternSpecs();
      expect(specs.length).assertEqual(LIST_PATTERN_COUNT);
      expect(specs[0].labelText()).assertEqual('中文输入');
      expect(specs[1].labelText()).assertEqual('英文输入');
      expect(clampSelected(-1, 2)).assertEqual(0);
      expect(clampSelected(2, 2)).assertEqual(0);
      expect(clampSelected(1, 2)).assertEqual(1);
      expect(specAt(1)?.labelText()).assertEqual('英文输入');
      expect(listSummary().includes('2 个模式项')).assertTrue();
      expect(actionText(1).includes('英文输入')).assertTrue();
      expect(actionText(0, []).includes('列表为空')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DATA_1600
     * @tc.name testData0016
     * @tc.desc Verify the code to category mapping including the input method identity codes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testData0016', 0, () => {
      expect(classifyErrorCode(0)).assertEqual(ApiStatus.OK);
      expect(classifyErrorCode(401)).assertEqual(ApiStatus.INVALID_INPUT);
      expect(classifyErrorCode(501)).assertEqual(ApiStatus.UNSUPPORTED);
      expect(classifyErrorCode(801)).assertEqual(ApiStatus.UNSUPPORTED);
      expect(classifyErrorCode(12800004)).assertEqual(ApiStatus.INPUT_METHOD);
      expect(classifyErrorCode(12800013)).assertEqual(ApiStatus.INPUT_METHOD);
      expect(classifyErrorCode(12800014)).assertEqual(ApiStatus.INTERNAL);
      expect(classifyErrorCode(-2)).assertEqual(ApiStatus.EMPTY_RESULT);
      expect(apiStatusName(ApiStatus.INPUT_METHOD)).assertEqual('输入法身份不符');
      expect(apiStatusName(ApiStatus.OK)).assertEqual('成功');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DATA_1700
     * @tc.name testData0017
     * @tc.desc Verify error codes are extracted from coded objects and from message text only.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testData0017', 0, () => {
      expect(codeOfThrown(new CodedError(401, 'Invalid input'))).assertEqual(401);
      expect(codeOfThrown(new Error('BussinessError 12800004: not an input method application')))
        .assertEqual(12800004);
      expect(codeOfThrown(new Object())).assertEqual(-1);
      expect(apiStatusHint(ApiStatus.INPUT_METHOD).includes('12800004')).assertTrue();
      const text = describeThrown('createPanel', 12800004, 'not an input method application');
      expect(text.includes('调用身份不符')).assertTrue();
      expect(text.includes('12800004')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DATA_1800
     * @tc.name testData0018
     * @tc.desc Verify the build session returns success with a non empty byte summary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testData0018', 0, () => {
      const outcome = buildDefaultOutcome();
      expect(outcome.isOk()).assertTrue();
      expect(outcome.code).assertEqual(0);
      expect(outcome.summary.includes('字节')).assertTrue();
      expect(outcome.describe().startsWith('buildExtraConfig')).assertTrue();
      expect(defaultOutcomes().length).assertEqual(6);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DATA_1900
     * @tc.name testData0019
     * @tc.desc Verify near limit, oversized and json round trip outcomes match the local rules.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testData0019', 0, () => {
      const near = nearLimitOutcome();
      expect(near.isOk()).assertTrue();
      expect(near.summary.includes('32768')).assertTrue();
      const over = oversizedOutcome();
      expect(over.isOk()).assertFalse();
      expect(over.status).assertEqual(ApiStatus.INVALID_INPUT);
      expect(over.code).assertEqual(401);
      expect(over.summary.includes('超出')).assertTrue();
      expect(readStubOutcome().isOk()).assertTrue();
      expect(readAbsentOutcome().isOk()).assertTrue();
      expect(roundTripOutcome().isOk()).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DATA_2000
     * @tc.name testData0020
     * @tc.desc Verify the catalog lists three pages whose routes are unique and searchable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testData0020', 0, () => {
      expect(FEATURES.length).assertEqual(3);
      expect(declaredApiCount()).assertEqual(11);
      expect(routes().length).assertEqual(3);
      expect(new Set(routes()).size).assertEqual(3);
      expect(filterFeatures('').length).assertEqual(3);
      expect(filterFeatures('面板').length).assertEqual(1);
      expect(filterFeatures('列表').length).assertEqual(1);
      expect(filterFeatures('不存在的关键字').length).assertEqual(0);
    });
  });
}
