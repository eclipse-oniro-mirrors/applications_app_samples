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
import { KEYBOARD_BUFFER_LIMIT } from '../../../main/ets/common/AppConstants';
import {
  ConfigEntry,
  buildExtraConfig,
  configByteLength,
  configFromJson,
  defaultEntries,
  describeEntries,
  paddedEntries,
  settingsOf,
  utf8Bytes
} from '../../../main/ets/model/ExtraConfigModel';
import {
  ACTION_DELETE,
  ACTION_ENTER,
  ACTION_SPACE,
  KeySpec,
  KeyboardMode,
  appendChar,
  applyKey,
  charCount,
  deleteLast
} from '../../../main/ets/model/KeyboardModel';
import {
  actionText,
  clampSelected,
  listSummary,
  patternSpecs,
  specAt
} from '../../../main/ets/utils/InputMethodListSession';

/**
 * 边界矩阵：每个函数都取"下界 / 下界-1 / 上界 / 上界+1"这种相邻取值，
 * 断言的是 main/ets 里真实实现的行为，不在测试文件里重写一套规则。
 */
export default function inputMethodBoundaryTest() {
  describe('InputMethodBoundaryMatrixTest', () => {
    /**
     * @tc.number SUB_INPUT_METHOD_BOUND_0100
     * @tc.name testBoundary0001
     * @tc.desc Verify the 2 byte UTF-8 branch covers U+0080 to U+07FF and the 3 byte branch starts after it.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoundary0001', 0, () => {
      expect(utf8Bytes('\u007F')).assertEqual(1);
      expect(utf8Bytes('\u0080')).assertEqual(2);
      expect(utf8Bytes('¥')).assertEqual(2);
      expect(utf8Bytes('é')).assertEqual(2);
      expect(utf8Bytes('\u07FF')).assertEqual(2);
      expect(utf8Bytes('\u0800')).assertEqual(3);
      expect(utf8Bytes('中')).assertEqual(3);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_BOUND_0200
     * @tc.name testBoundary0002
     * @tc.desc Verify a surrogate pair counts as 4 bytes and a lone surrogate is counted as a pair.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoundary0002', 0, () => {
      expect('\uD800'.length).assertEqual(1);
      expect(utf8Bytes('\uD800')).assertEqual(4);
      expect(utf8Bytes('\uD800\uDC00')).assertEqual(4);
      expect(utf8Bytes('a\uD800')).assertEqual(5);
      expect(utf8Bytes('\uDC00')).assertEqual(3);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_BOUND_0300
     * @tc.name testBoundary0003
     * @tc.desc Verify a target smaller than the base payload cannot shrink it and leaves an empty padding.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoundary0003', 0, () => {
      const zero = configByteLength(buildExtraConfig(paddedEntries(0)));
      const hundred = configByteLength(buildExtraConfig(paddedEntries(100)));
      expect(zero > 0).assertTrue();
      expect(hundred).assertEqual(zero);
      const entries = paddedEntries(100);
      expect(entries[entries.length - 1].key).assertEqual('padding');
      expect(entries[entries.length - 1].value).assertEqual('');
      expect(entries.length).assertEqual(defaultEntries().length + 1);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_BOUND_0400
     * @tc.name testBoundary0004
     * @tc.desc Verify the description handles a zero limit, a single entry and a limit equal to the total.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoundary0004', 0, () => {
      const zeroLimit = describeEntries(defaultEntries(), 0);
      expect(zeroLimit.startsWith('；')).assertTrue();
      expect(zeroLimit.includes('共 4 项')).assertTrue();
      const oneLimit = describeEntries(defaultEntries(), 1);
      expect(oneLimit.includes('theme.color')).assertTrue();
      expect(oneLimit.includes('共 4 项')).assertTrue();
      const full = describeEntries(defaultEntries(), 4);
      expect(full.includes('共')).assertFalse();
      expect(full.includes('theme.color = #0A59F7（string）')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_BOUND_0500
     * @tc.name testBoundary0005
     * @tc.desc Verify a repeated key collapses into one setting and the later value wins.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoundary0005', 0, () => {
      const duplicated = [new ConfigEntry('k', 1), new ConfigEntry('k', 'v')];
      const settings = settingsOf(duplicated);
      expect(Object.keys(settings).length).assertEqual(1);
      expect(settings['k']).assertEqual('v');
      expect(buildExtraConfig(duplicated).customSettings['k']).assertEqual('v');
      const distinct = [new ConfigEntry('k', 1), new ConfigEntry('j', 2)];
      expect(Object.keys(settingsOf(distinct)).length).assertEqual(2);
      expect(configByteLength(buildExtraConfig(distinct)) >
        configByteLength(buildExtraConfig(duplicated))).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_BOUND_0600
     * @tc.name testBoundary0006
     * @tc.desc Verify arrays, null, plain strings are rejected while an empty or single key object is accepted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoundary0006', 0, () => {
      expect(configFromJson('[]') === undefined).assertTrue();
      expect(configFromJson('null') === undefined).assertTrue();
      expect(configFromJson('"text"') === undefined).assertTrue();
      const arraySettings = configFromJson('{"customSettings":[]}');
      expect(arraySettings === undefined).assertFalse();
      if (arraySettings !== undefined) {
        expect(Object.keys(arraySettings.customSettings).length).assertEqual(0);
      }
      const single = configFromJson('{"customSettings":{"a":1}}');
      expect(single === undefined).assertFalse();
      if (single !== undefined) {
        expect(single.customSettings['a']).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_INPUT_METHOD_BOUND_0700
     * @tc.name testBoundary0007
     * @tc.desc Verify appending at limit minus one, at the limit and with a zero limit, counting by code point.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoundary0007', 0, () => {
      const almost = 'x'.repeat(KEYBOARD_BUFFER_LIMIT - 1);
      expect(charCount(almost)).assertEqual(KEYBOARD_BUFFER_LIMIT - 1);
      expect(charCount(appendChar(almost, 'y', KEYBOARD_BUFFER_LIMIT))).assertEqual(KEYBOARD_BUFFER_LIMIT);
      const atLimit = 'x'.repeat(KEYBOARD_BUFFER_LIMIT);
      expect(appendChar(atLimit, 'y', KEYBOARD_BUFFER_LIMIT)).assertEqual(atLimit);
      const withEmoji = appendChar(almost, '😀', KEYBOARD_BUFFER_LIMIT);
      expect(withEmoji.endsWith('😀')).assertTrue();
      expect(charCount(withEmoji)).assertEqual(KEYBOARD_BUFFER_LIMIT);
      expect(appendChar('', 'a', 0)).assertEqual('');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_BOUND_0800
     * @tc.name testBoundary0008
     * @tc.desc Verify the space and enter keys report what to insert and stop at a full buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoundary0008', 0, () => {
      const space = applyKey('ab', KeyboardMode.LETTER, new KeySpec('空格', ACTION_SPACE), 8);
      expect(space.text).assertEqual('ab ');
      expect(space.inserted).assertEqual(' ');
      expect(space.mode).assertEqual(KeyboardMode.LETTER);
      const enter = applyKey('ab', KeyboardMode.LETTER, new KeySpec('↵', ACTION_ENTER), 8);
      expect(enter.text).assertEqual('ab\n');
      expect(enter.inserted).assertEqual('\n');
      const full = applyKey('abcdefgh', KeyboardMode.LETTER, new KeySpec('空格', ACTION_SPACE), 8);
      expect(full.text).assertEqual('abcdefgh');
      expect(full.inserted).assertEqual('');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_BOUND_0900
     * @tc.name testBoundary0009
     * @tc.desc Verify an unknown action falls back to inserting the key label and keeps the mode.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoundary0009', 0, () => {
      const unknown = applyKey('ab', KeyboardMode.LETTER, new KeySpec('?', 'unknown'), 8);
      expect(unknown.inserted).assertEqual('?');
      expect(unknown.text).assertEqual('ab?');
      expect(unknown.mode).assertEqual(KeyboardMode.LETTER);
      const wide = applyKey('', KeyboardMode.NUMBER, new KeySpec('#', 'unknownWide', true), 8);
      expect(wide.text).assertEqual('#');
      expect(wide.mode).assertEqual(KeyboardMode.NUMBER);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_BOUND_1000
     * @tc.name testBoundary0010
     * @tc.desc Verify deleting removes a whole emoji instead of leaving half of a surrogate pair.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoundary0010', 0, () => {
      expect(deleteLast('😀')).assertEqual('');
      expect(deleteLast('a😀')).assertEqual('a');
      expect(deleteLast('😀😀')).assertEqual('😀');
      expect(deleteLast('ab')).assertEqual('a');
      expect(charCount('😀')).assertEqual(1);
      expect(charCount('a😀')).assertEqual(2);
      const deleted = applyKey('a😀', KeyboardMode.LETTER, new KeySpec('⌫', ACTION_DELETE), 8);
      expect(deleted.text).assertEqual('a');
      expect(deleted.deleted).assertEqual(1);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_BOUND_1100
     * @tc.name testBoundary0011
     * @tc.desc Verify the selected index falls back to zero for negative, equal and empty ranges.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoundary0011', 0, () => {
      expect(clampSelected(0, 2)).assertEqual(0);
      expect(clampSelected(1, 2)).assertEqual(1);
      expect(clampSelected(-5, 2)).assertEqual(0);
      expect(clampSelected(2, 2)).assertEqual(0);
      expect(clampSelected(0, 0)).assertEqual(0);
      expect(clampSelected(3, 3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_BOUND_1200
     * @tc.name testBoundary0012
     * @tc.desc Verify an out of range callback index is reported as out of range rather than the first item.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoundary0012', 0, () => {
      const outOfRange = actionText(5);
      expect(outOfRange.includes('超出范围')).assertTrue();
      expect(outOfRange.includes('共 2 项')).assertTrue();
      expect(actionText(-1).includes('超出范围')).assertTrue();
      expect(actionText(0, []).includes('列表为空')).assertTrue();
      expect(specAt(2) === undefined).assertTrue();
      expect(specAt(-1) === undefined).assertTrue();
      expect(specAt(1)?.labelText()).assertEqual('英文输入');
      expect(patternSpecs(0).length).assertEqual(0);
      expect(patternSpecs(1).length).assertEqual(1);
      expect(listSummary([])).assertEqual('没有模式项');
    });
  });
}
