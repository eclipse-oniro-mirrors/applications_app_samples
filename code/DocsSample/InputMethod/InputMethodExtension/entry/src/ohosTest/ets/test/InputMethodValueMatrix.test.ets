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
import { EXTRA_CONFIG_MAX_BYTES } from '../../../main/ets/common/AppConstants';
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

/**
 * 扩展信息的值/字节/额度矩阵。
 * 每个维度取"边界两侧"的取值各成一条：UTF-8 的 1/2/3/4 字节分支、三种 CustomValueType、
 * 32KB 额度的 32767/32768/32769、JSON 的各形状。断言全部走 main/ets 的真实实现，
 * 期望值按 d.ts 约定(JSON 无空格、CustomValueType 仅 number/string/boolean)手算。
 */
export default function inputMethodValueMatrixTest() {
  describe('InputMethodValueMatrixTest', () => {
    /**
     * @tc.number SUB_INPUT_METHOD_VALUE_0100
     * @tc.name testValueMatrix0001
     * @tc.desc Verify an empty string costs zero bytes so an empty customSettings stays inside the budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueMatrix0001', 0, () => {
      expect(utf8Bytes('')).assertEqual(0);
      expect(configByteLength(buildExtraConfig([]))).assertEqual('{"customSettings":{}}'.length);
      // 空配置序列化后就是这两个字段，页面上显示的字节数不会多算
      expect(configJson(buildExtraConfig([]))).assertEqual('{"customSettings":{}}');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VALUE_0200
     * @tc.name testValueMatrix0002
     * @tc.desc Verify every ASCII code unit including DEL is counted as one byte.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueMatrix0002', 0, () => {
      expect(utf8Bytes('a')).assertEqual(1);
      expect(utf8Bytes('\u0000')).assertEqual(1);
      expect(utf8Bytes('\u007F')).assertEqual(1);
      expect(utf8Bytes('abcXYZ019')).assertEqual(9);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VALUE_0300
     * @tc.name testValueMatrix0003
     * @tc.desc Verify U+0080 and other Latin/Greek letters enter the two byte branch.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueMatrix0003', 0, () => {
      expect(utf8Bytes('\u0080')).assertEqual(2);
      expect(utf8Bytes('é')).assertEqual(2);
      expect(utf8Bytes('¥')).assertEqual(2);
      expect(utf8Bytes('\u07FF')).assertEqual(2);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VALUE_0400
     * @tc.name testValueMatrix0004
     * @tc.desc Verify U+0800 and CJK characters take three bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueMatrix0004', 0, () => {
      expect(utf8Bytes('\u0800')).assertEqual(3);
      expect(utf8Bytes('中')).assertEqual(3);
      expect(utf8Bytes('한')).assertEqual(3);
      expect(utf8Bytes('あ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VALUE_0500
     * @tc.name testValueMatrix0005
     * @tc.desc Verify an emoji outside the BMP costs four bytes, not two code units.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueMatrix0005', 0, () => {
      expect('😀'.length).assertEqual(2);
      expect(utf8Bytes('😀')).assertEqual(4);
      expect(utf8Bytes('🎉')).assertEqual(4);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VALUE_0600
     * @tc.name testValueMatrix0006
     * @tc.desc Verify mixed ASCII and emoji add up per code point.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueMatrix0006', 0, () => {
      expect(utf8Bytes('a😀')).assertEqual(5);
      expect(utf8Bytes('😀😀')).assertEqual(8);
      expect(utf8Bytes('😀a😀')).assertEqual(9);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VALUE_0700
     * @tc.name testValueMatrix0007
     * @tc.desc Verify a lone low surrogate falls into the three byte branch while a lone high one is counted as four.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueMatrix0007', 0, () => {
      expect(utf8Bytes('\uDC00')).assertEqual(3);
      expect(utf8Bytes('\uD800')).assertEqual(4);
      expect(utf8Bytes('\uD800\uDC00')).assertEqual(4);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VALUE_0800
     * @tc.name testValueMatrix0008
     * @tc.desc Verify a mixed CJK and ASCII string sums to three bytes per CJK character.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueMatrix0008', 0, () => {
      expect(utf8Bytes('中文abc')).assertEqual(9);
      // 字节数可加：分段计与整体计结果一致
      expect(utf8Bytes('中文abc')).assertEqual(utf8Bytes('中文') + utf8Bytes('abc'));
      // 双拼 · 中文优先：6 个 CJK(各 3 字节) + 分隔符 U+00B7(2 字节) + 两个空格(各 1 字节)
      expect(utf8Bytes('双拼 · 中文优先')).assertEqual(22);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VALUE_0900
     * @tc.name testValueMatrix0009
     * @tc.desc Verify numbers keep the number type through settings and JSON while covering zero and negatives.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueMatrix0009', 0, () => {
      const values: number[] = [0, -1, 8, 2147483647, -2147483648];
      values.forEach((value: number) => {
        const entry = new ConfigEntry('n', value);
        expect(entry.typeName()).assertEqual('number');
        expect(settingsOf([entry])['n']).assertEqual(value);
        expect(configJson(buildExtraConfig([entry])).includes(`"n":${value}`)).assertTrue();
      });
      expect(new ConfigEntry('n', 0).display()).assertEqual('n = 0（number）');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VALUE_1000
     * @tc.name testValueMatrix0010
     * @tc.desc Verify empty, CJK, emoji and quoted strings stay strings and survive JSON escaping.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueMatrix0010', 0, () => {
      const values: string[] = ['', 'x', '中文', '😀', 'a"b', 'line\nbreak'];
      values.forEach((value: string) => {
        const entry = new ConfigEntry('s', value);
        expect(entry.typeName()).assertEqual('string');
        expect(settingsOf([entry])['s']).assertEqual(value);
      });
      const quoted = buildExtraConfig([new ConfigEntry('s', 'a"b')]);
      const restored = configFromJson(configJson(quoted));
      expect(restored === undefined).assertFalse();
      if (restored !== undefined) {
        expect(restored.customSettings['s']).assertEqual('a"b');
      }
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VALUE_1100
     * @tc.name testValueMatrix0011
     * @tc.desc Verify both boolean values are reported as boolean and are not coerced to numbers.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueMatrix0011', 0, () => {
      const enabled = new ConfigEntry('b', true);
      const disabled = new ConfigEntry('b', false);
      expect(enabled.typeName()).assertEqual('boolean');
      expect(disabled.typeName()).assertEqual('boolean');
      expect(settingsOf([enabled])['b']).assertEqual(true);
      expect(settingsOf([disabled])['b']).assertEqual(false);
      expect(configJson(buildExtraConfig([disabled])).includes('"b":false')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VALUE_1200
     * @tc.name testValueMatrix0012
     * @tc.desc Verify the display string keeps the key, value and type name in one place for the log panel.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueMatrix0012', 0, () => {
      expect(new ConfigEntry('theme.color', '#0A59F7').display()).assertEqual('theme.color = #0A59F7（string）');
      expect(new ConfigEntry('voice.enabled', false).display()).assertEqual('voice.enabled = false（boolean）');
      expect(new ConfigEntry('candidate.limit', 8).display()).assertEqual('candidate.limit = 8（number）');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VALUE_1300
     * @tc.name testValueMatrix0013
     * @tc.desc Verify the three CustomValueType members coexist in one customSettings object.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueMatrix0013', 0, () => {
      const entries = [new ConfigEntry('n', 1), new ConfigEntry('s', 'v'), new ConfigEntry('b', true)];
      const settings = settingsOf(entries);
      expect(Object.keys(settings).length).assertEqual(3);
      expect(typeof settings['n']).assertEqual('number');
      expect(typeof settings['s']).assertEqual('string');
      expect(typeof settings['b']).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VALUE_1400
     * @tc.name testValueMatrix0014
     * @tc.desc Verify the built config carries exactly one field so the JSON shape stays what the frame expects.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueMatrix0014', 0, () => {
      const config = buildExtraConfig(defaultEntries());
      expect(Object.keys(config).length).assertEqual(1);
      expect(Object.keys(config)[0]).assertEqual('customSettings');
      expect(Object.keys(config.customSettings).length).assertEqual(defaultEntries().length);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VALUE_1500
     * @tc.name testValueMatrix0015
     * @tc.desc Verify the byte length equals the literal JSON text length for an ASCII only config.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueMatrix0015', 0, () => {
      const config = buildExtraConfig([new ConfigEntry('k', 'ab')]);
      expect(configJson(config)).assertEqual('{"customSettings":{"k":"ab"}}');
      expect(configByteLength(config)).assertEqual(29);
      expect(configByteLength(config)).assertEqual(configJson(config).length);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VALUE_1600
     * @tc.name testValueMatrix0016
     * @tc.desc Verify padding can fill exactly 32768 bytes, the documented ceiling.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueMatrix0016', 0, () => {
      const bytes = configByteLength(buildExtraConfig(paddedEntries(EXTRA_CONFIG_MAX_BYTES)));
      expect(bytes).assertEqual(EXTRA_CONFIG_MAX_BYTES);
      expect(bytes).assertEqual(32768);
      // 恰好卡在上限上：不能再多一个字节
      expect(bytes <= EXTRA_CONFIG_MAX_BYTES).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VALUE_1700
     * @tc.name testValueMatrix0017
     * @tc.desc Verify one byte over the ceiling is reachable so the page can show the 32769 case.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueMatrix0017', 0, () => {
      const bytes = configByteLength(buildExtraConfig(paddedEntries(EXTRA_CONFIG_MAX_BYTES + 1)));
      expect(bytes).assertEqual(32769);
      expect(bytes - EXTRA_CONFIG_MAX_BYTES).assertEqual(1);
      // 越过上限一个字节后才是能被页面判为超限的最小值
      expect(bytes > EXTRA_CONFIG_MAX_BYTES).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VALUE_1800
     * @tc.name testValueMatrix0018
     * @tc.desc Verify a target below the base payload cannot shrink it and leaves the padding empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueMatrix0018', 0, () => {
      const baseline = configByteLength(buildExtraConfig(paddedEntries(0)));
      const tiny = configByteLength(buildExtraConfig(paddedEntries(1)));
      expect(baseline > 0).assertTrue();
      expect(tiny).assertEqual(baseline);
      expect(tiny < EXTRA_CONFIG_MAX_BYTES).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VALUE_1900
     * @tc.name testValueMatrix0019
     * @tc.desc Verify padding appends exactly one extra entry and keeps the four demo keys untouched.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueMatrix0019', 0, () => {
      const entries = paddedEntries(200);
      expect(entries.length).assertEqual(defaultEntries().length + 1);
      expect(entries[entries.length - 1].key).assertEqual('padding');
      expect(entries[0].key).assertEqual('theme.color');
      expect(entries.slice(0, 4).every((item: ConfigEntry, index: number) =>
        item.key === defaultEntries()[index].key)).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VALUE_2000
     * @tc.name testValueMatrix0020
     * @tc.desc Verify the default four keys survive a JSON round trip byte for byte.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueMatrix0020', 0, () => {
      const config = buildExtraConfig(defaultEntries());
      const text = configJson(config);
      const restored = configFromJson(text);
      expect(restored === undefined).assertFalse();
      if (restored !== undefined) {
        expect(configJson(restored)).assertEqual(text);
        expect(configByteLength(restored)).assertEqual(configByteLength(config));
      }
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VALUE_2100
     * @tc.name testValueMatrix0021
     * @tc.desc Verify a CJK plus emoji value is restored unchanged instead of being mangled.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueMatrix0021', 0, () => {
      const config = buildExtraConfig([new ConfigEntry('habit', '双拼·😀')]);
      const restored = configFromJson(configJson(config));
      expect(restored === undefined).assertFalse();
      if (restored !== undefined) {
        expect(restored.customSettings['habit']).assertEqual('双拼·😀');
        expect(utf8Bytes(restored.customSettings['habit'] as string)).assertEqual(3 + 3 + 2 + 4);
      }
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VALUE_2200
     * @tc.name testValueMatrix0022
     * @tc.desc Verify empty text and truncated JSON are rejected instead of throwing to the page.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueMatrix0022', 0, () => {
      expect(configFromJson('') === undefined).assertTrue();
      expect(configFromJson('{') === undefined).assertTrue();
      expect(configFromJson('{"customSettings":') === undefined).assertTrue();
      expect(configFromJson('not json') === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VALUE_2300
     * @tc.name testValueMatrix0023
     * @tc.desc Verify objects without a usable customSettings field are rejected, including the null literal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueMatrix0023', 0, () => {
      expect(configFromJson('{}') === undefined).assertTrue();
      expect(configFromJson('{"other":1}') === undefined).assertTrue();
      expect(configFromJson('{"customSettings":null}') === undefined).assertTrue();
      expect(configFromJson('null') === undefined).assertTrue();
      expect(configFromJson('[]') === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VALUE_2400
     * @tc.name testValueMatrix0024
     * @tc.desc Verify an array customSettings is read as an index keyed object, which is what Object.keys yields.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueMatrix0024', 0, () => {
      const restored = configFromJson('{"customSettings":[1,2]}');
      expect(restored === undefined).assertFalse();
      if (restored !== undefined) {
        expect(Object.keys(restored.customSettings).length).assertEqual(2);
        expect(restored.customSettings['0']).assertEqual(1);
        expect(restored.customSettings['1']).assertEqual(2);
      }
      const empty = configFromJson('{"customSettings":{}}');
      expect(empty === undefined).assertFalse();
      if (empty !== undefined) {
        expect(Object.keys(empty.customSettings).length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VALUE_2500
     * @tc.name testValueMatrix0025
     * @tc.desc Verify the input method side reads keys sorted, mixing ASCII and CJK keys in code unit order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueMatrix0025', 0, () => {
      const attribute = new StubEditorAttribute(0, 'com.example.inputmethodextension',
        buildExtraConfig([new ConfigEntry('b', 2), new ConfigEntry('a', 1), new ConfigEntry('C', 3)]));
      const read = readExtraConfig(attribute);
      expect(read.length).assertEqual(3);
      expect(read[0].key).assertEqual('C');
      expect(read[1].key).assertEqual('a');
      expect(read[2].key).assertEqual('b');
      const cjk = readExtraConfig(new StubEditorAttribute(0, 'b',
        buildExtraConfig([new ConfigEntry('国', 1), new ConfigEntry('中', 2)])));
      expect(cjk[0].key).assertEqual('中');
      expect(cjk[1].key).assertEqual('国');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VALUE_2600
     * @tc.name testValueMatrix0026
     * @tc.desc Verify a missing attribute or a missing extraConfig both read as an empty list, never as defaults.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueMatrix0026', 0, () => {
      expect(readExtraConfig(undefined).length).assertEqual(0);
      expect(readExtraConfig(new StubEditorAttribute(0, 'com.example.inputmethodextension')).length).assertEqual(0);
      const empty = readExtraConfig(new StubEditorAttribute(0, 'b', buildExtraConfig([])));
      expect(empty.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VALUE_2700
     * @tc.name testValueMatrix0027
     * @tc.desc Verify the description truncation covers zero, negative, exact and over the total limits.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueMatrix0027', 0, () => {
      const entries = defaultEntries();
      expect(describeEntries([], 6)).assertEqual('');
      expect(describeEntries(entries, 0).startsWith('；')).assertTrue();
      expect(describeEntries(entries, 0).includes('共 4 项')).assertTrue();
      expect(describeEntries(entries, -1).includes('共 4 项')).assertTrue();
      expect(describeEntries(entries, 4).includes('共')).assertFalse();
      expect(describeEntries(entries, 9).includes('共')).assertFalse();
      const seven = entries.concat([new ConfigEntry('k5', 1), new ConfigEntry('k6', 2), new ConfigEntry('k7', 3)]);
      expect(describeEntries(seven, 6).includes('共 7 项')).assertTrue();
    });
  });
}
