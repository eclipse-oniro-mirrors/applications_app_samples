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
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { getHardKeyValue } from '../../../main/ets/model/HardKeyUtils';

const TAG: string = '[Sample_HardKeyExtendedTailTailTest]';
const DOMAIN: number = 0xF814;

export default function HardKeyExtendedTailTailTest(): void {
  describe('HardKeyExtendedTailTailTest', () => {
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0135
     * @tc.name      testSimpleKeyboardHardKey0135
     * @tc.desc      Checks hard key mapping for code 2067, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0135 begin');
      const actual: string = getHardKeyValue(2067, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0135 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0136
     * @tc.name      testSimpleKeyboardHardKey0136
     * @tc.desc      Checks hard key mapping for code 2067, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0136 begin');
      const actual: string = getHardKeyValue(2067, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0136 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0137
     * @tc.name      testSimpleKeyboardHardKey0137
     * @tc.desc      Checks hard key mapping for code 2068, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0137 begin');
      const actual: string = getHardKeyValue(2068, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0137 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0138
     * @tc.name      testSimpleKeyboardHardKey0138
     * @tc.desc      Checks hard key mapping for code 2068, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0138 begin');
      const actual: string = getHardKeyValue(2068, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0138 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0139
     * @tc.name      testSimpleKeyboardHardKey0139
     * @tc.desc      Checks hard key mapping for code 2069, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0139 begin');
      const actual: string = getHardKeyValue(2069, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0139 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0140
     * @tc.name      testSimpleKeyboardHardKey0140
     * @tc.desc      Checks hard key mapping for code 2069, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0140 begin');
      const actual: string = getHardKeyValue(2069, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0140 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0141
     * @tc.name      testSimpleKeyboardHardKey0141
     * @tc.desc      Checks hard key mapping for code 2070, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0141 begin');
      const actual: string = getHardKeyValue(2070, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0141 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0142
     * @tc.name      testSimpleKeyboardHardKey0142
     * @tc.desc      Checks hard key mapping for code 2070, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0142 begin');
      const actual: string = getHardKeyValue(2070, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0142 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0143
     * @tc.name      testSimpleKeyboardHardKey0143
     * @tc.desc      Checks hard key mapping for code 2071, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0143 begin');
      const actual: string = getHardKeyValue(2071, false);
      expect(actual).assertEqual('KEYCODE_FORWARD_DEL');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0143 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0144
     * @tc.name      testSimpleKeyboardHardKey0144
     * @tc.desc      Checks hard key mapping for code 2071, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0144 begin');
      const actual: string = getHardKeyValue(2071, true);
      expect(actual).assertEqual('KEYCODE_FORWARD_DEL');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0144 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0145
     * @tc.name      testSimpleKeyboardHardKey0145
     * @tc.desc      Checks hard key mapping for code 2072, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0145 begin');
      const actual: string = getHardKeyValue(2072, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0145 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0146
     * @tc.name      testSimpleKeyboardHardKey0146
     * @tc.desc      Checks hard key mapping for code 2072, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0146 begin');
      const actual: string = getHardKeyValue(2072, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0146 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0147
     * @tc.name      testSimpleKeyboardHardKey0147
     * @tc.desc      Checks hard key mapping for code 2073, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0147 begin');
      const actual: string = getHardKeyValue(2073, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0147 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0148
     * @tc.name      testSimpleKeyboardHardKey0148
     * @tc.desc      Checks hard key mapping for code 2073, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0148 begin');
      const actual: string = getHardKeyValue(2073, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0148 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0149
     * @tc.name      testSimpleKeyboardHardKey0149
     * @tc.desc      Checks hard key mapping for code 2074, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0149 begin');
      const actual: string = getHardKeyValue(2074, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0149 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0150
     * @tc.name      testSimpleKeyboardHardKey0150
     * @tc.desc      Checks hard key mapping for code 2074, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0150 begin');
      const actual: string = getHardKeyValue(2074, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0150 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0151
     * @tc.name      testSimpleKeyboardHardKey0151
     * @tc.desc      Checks hard key mapping for code 2075, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0151 begin');
      const actual: string = getHardKeyValue(2075, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0151 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0152
     * @tc.name      testSimpleKeyboardHardKey0152
     * @tc.desc      Checks hard key mapping for code 2075, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0152 begin');
      const actual: string = getHardKeyValue(2075, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0152 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0153
     * @tc.name      testSimpleKeyboardHardKey0153
     * @tc.desc      Checks hard key mapping for code 2076, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0153 begin');
      const actual: string = getHardKeyValue(2076, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0153 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0154
     * @tc.name      testSimpleKeyboardHardKey0154
     * @tc.desc      Checks hard key mapping for code 2076, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0154 begin');
      const actual: string = getHardKeyValue(2076, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0154 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0155
     * @tc.name      testSimpleKeyboardHardKey0155
     * @tc.desc      Checks hard key mapping for code 2077, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0155 begin');
      const actual: string = getHardKeyValue(2077, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0155 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0156
     * @tc.name      testSimpleKeyboardHardKey0156
     * @tc.desc      Checks hard key mapping for code 2077, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0156 begin');
      const actual: string = getHardKeyValue(2077, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0156 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0157
     * @tc.name      testSimpleKeyboardHardKey0157
     * @tc.desc      Checks hard key mapping for code 2078, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0157 begin');
      const actual: string = getHardKeyValue(2078, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0157 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0158
     * @tc.name      testSimpleKeyboardHardKey0158
     * @tc.desc      Checks hard key mapping for code 2078, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0158 begin');
      const actual: string = getHardKeyValue(2078, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0158 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0159
     * @tc.name      testSimpleKeyboardHardKey0159
     * @tc.desc      Checks hard key mapping for code 2079, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0159 begin');
      const actual: string = getHardKeyValue(2079, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0159 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0160
     * @tc.name      testSimpleKeyboardHardKey0160
     * @tc.desc      Checks hard key mapping for code 2079, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0160 begin');
      const actual: string = getHardKeyValue(2079, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0160 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0161
     * @tc.name      testSimpleKeyboardHardKey0161
     * @tc.desc      Checks hard key mapping for code 2080, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0161 begin');
      const actual: string = getHardKeyValue(2080, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0161 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0162
     * @tc.name      testSimpleKeyboardHardKey0162
     * @tc.desc      Checks hard key mapping for code 2080, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0162 begin');
      const actual: string = getHardKeyValue(2080, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0162 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0163
     * @tc.name      testSimpleKeyboardHardKey0163
     * @tc.desc      Checks hard key mapping for code 2081, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0163 begin');
      const actual: string = getHardKeyValue(2081, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0163 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0164
     * @tc.name      testSimpleKeyboardHardKey0164
     * @tc.desc      Checks hard key mapping for code 2081, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0164 begin');
      const actual: string = getHardKeyValue(2081, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0164 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0165
     * @tc.name      testSimpleKeyboardHardKey0165
     * @tc.desc      Checks hard key mapping for code 2082, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0165 begin');
      const actual: string = getHardKeyValue(2082, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0165 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0166
     * @tc.name      testSimpleKeyboardHardKey0166
     * @tc.desc      Checks hard key mapping for code 2082, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0166 begin');
      const actual: string = getHardKeyValue(2082, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0166 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0167
     * @tc.name      testSimpleKeyboardHardKey0167
     * @tc.desc      Checks hard key mapping for code 2083, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0167 begin');
      const actual: string = getHardKeyValue(2083, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0167 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0168
     * @tc.name      testSimpleKeyboardHardKey0168
     * @tc.desc      Checks hard key mapping for code 2083, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0168 begin');
      const actual: string = getHardKeyValue(2083, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0168 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0169
     * @tc.name      testSimpleKeyboardHardKey0169
     * @tc.desc      Checks hard key mapping for code 2084, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0169 begin');
      const actual: string = getHardKeyValue(2084, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0169 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0170
     * @tc.name      testSimpleKeyboardHardKey0170
     * @tc.desc      Checks hard key mapping for code 2084, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0170 begin');
      const actual: string = getHardKeyValue(2084, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0170 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0171
     * @tc.name      testSimpleKeyboardHardKey0171
     * @tc.desc      Checks hard key mapping for code 2085, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0171 begin');
      const actual: string = getHardKeyValue(2085, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0171 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0172
     * @tc.name      testSimpleKeyboardHardKey0172
     * @tc.desc      Checks hard key mapping for code 2085, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0172 begin');
      const actual: string = getHardKeyValue(2085, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0172 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0173
     * @tc.name      testSimpleKeyboardHardKey0173
     * @tc.desc      Checks hard key mapping for code 2086, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0173 begin');
      const actual: string = getHardKeyValue(2086, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0173 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0174
     * @tc.name      testSimpleKeyboardHardKey0174
     * @tc.desc      Checks hard key mapping for code 2086, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0174 begin');
      const actual: string = getHardKeyValue(2086, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0174 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0175
     * @tc.name      testSimpleKeyboardHardKey0175
     * @tc.desc      Checks hard key mapping for code 2087, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0175 begin');
      const actual: string = getHardKeyValue(2087, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0175 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0176
     * @tc.name      testSimpleKeyboardHardKey0176
     * @tc.desc      Checks hard key mapping for code 2087, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0176 begin');
      const actual: string = getHardKeyValue(2087, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0176 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0177
     * @tc.name      testSimpleKeyboardHardKey0177
     * @tc.desc      Checks hard key mapping for code 2088, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0177 begin');
      const actual: string = getHardKeyValue(2088, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0177 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0178
     * @tc.name      testSimpleKeyboardHardKey0178
     * @tc.desc      Checks hard key mapping for code 2088, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0178 begin');
      const actual: string = getHardKeyValue(2088, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0178 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0179
     * @tc.name      testSimpleKeyboardHardKey0179
     * @tc.desc      Checks hard key mapping for code 2089, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0179 begin');
      const actual: string = getHardKeyValue(2089, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0179 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0180
     * @tc.name      testSimpleKeyboardHardKey0180
     * @tc.desc      Checks hard key mapping for code 2089, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0180 begin');
      const actual: string = getHardKeyValue(2089, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0180 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0181
     * @tc.name      testSimpleKeyboardHardKey0181
     * @tc.desc      Checks hard key mapping for code 2090, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0181 begin');
      const actual: string = getHardKeyValue(2090, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0181 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0182
     * @tc.name      testSimpleKeyboardHardKey0182
     * @tc.desc      Checks hard key mapping for code 2090, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0182 begin');
      const actual: string = getHardKeyValue(2090, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0182 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0183
     * @tc.name      testSimpleKeyboardHardKey0183
     * @tc.desc      Checks hard key mapping for code 2091, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0183 begin');
      const actual: string = getHardKeyValue(2091, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0183 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0184
     * @tc.name      testSimpleKeyboardHardKey0184
     * @tc.desc      Checks hard key mapping for code 2091, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0184 begin');
      const actual: string = getHardKeyValue(2091, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0184 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0185
     * @tc.name      testSimpleKeyboardHardKey0185
     * @tc.desc      Checks hard key mapping for code 2092, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0185 begin');
      const actual: string = getHardKeyValue(2092, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0185 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0186
     * @tc.name      testSimpleKeyboardHardKey0186
     * @tc.desc      Checks hard key mapping for code 2092, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0186 begin');
      const actual: string = getHardKeyValue(2092, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0186 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0187
     * @tc.name      testSimpleKeyboardHardKey0187
     * @tc.desc      Checks hard key mapping for code 2093, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0187 begin');
      const actual: string = getHardKeyValue(2093, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0187 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0188
     * @tc.name      testSimpleKeyboardHardKey0188
     * @tc.desc      Checks hard key mapping for code 2093, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0188 begin');
      const actual: string = getHardKeyValue(2093, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0188 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0189
     * @tc.name      testSimpleKeyboardHardKey0189
     * @tc.desc      Checks hard key mapping for code 2094, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0189 begin');
      const actual: string = getHardKeyValue(2094, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0189 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0190
     * @tc.name      testSimpleKeyboardHardKey0190
     * @tc.desc      Checks hard key mapping for code 2094, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0190 begin');
      const actual: string = getHardKeyValue(2094, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0190 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0191
     * @tc.name      testSimpleKeyboardHardKey0191
     * @tc.desc      Checks hard key mapping for code 2095, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0191 begin');
      const actual: string = getHardKeyValue(2095, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0191 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0192
     * @tc.name      testSimpleKeyboardHardKey0192
     * @tc.desc      Checks hard key mapping for code 2095, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0192 begin');
      const actual: string = getHardKeyValue(2095, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0192 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0193
     * @tc.name      testSimpleKeyboardHardKey0193
     * @tc.desc      Checks hard key mapping for code 2096, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0193 begin');
      const actual: string = getHardKeyValue(2096, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0193 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0194
     * @tc.name      testSimpleKeyboardHardKey0194
     * @tc.desc      Checks hard key mapping for code 2096, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0194 begin');
      const actual: string = getHardKeyValue(2096, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0194 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0195
     * @tc.name      testSimpleKeyboardHardKey0195
     * @tc.desc      Checks hard key mapping for code 2097, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0195 begin');
      const actual: string = getHardKeyValue(2097, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0195 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0196
     * @tc.name      testSimpleKeyboardHardKey0196
     * @tc.desc      Checks hard key mapping for code 2097, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0196 begin');
      const actual: string = getHardKeyValue(2097, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0196 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0197
     * @tc.name      testSimpleKeyboardHardKey0197
     * @tc.desc      Checks hard key mapping for code 2098, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0197 begin');
      const actual: string = getHardKeyValue(2098, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0197 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0198
     * @tc.name      testSimpleKeyboardHardKey0198
     * @tc.desc      Checks hard key mapping for code 2098, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0198 begin');
      const actual: string = getHardKeyValue(2098, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0198 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0199
     * @tc.name      testSimpleKeyboardHardKey0199
     * @tc.desc      Checks hard key mapping for code 2099, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0199 begin');
      const actual: string = getHardKeyValue(2099, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0199 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0200
     * @tc.name      testSimpleKeyboardHardKey0200
     * @tc.desc      Checks hard key mapping for code 2099, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0200 begin');
      const actual: string = getHardKeyValue(2099, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0200 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0201
     * @tc.name      testSimpleKeyboardHardKey0201
     * @tc.desc      Checks hard key mapping for code 2100, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0201 begin');
      const actual: string = getHardKeyValue(2100, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0201 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0202
     * @tc.name      testSimpleKeyboardHardKey0202
     * @tc.desc      Checks hard key mapping for code 2100, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0202 begin');
      const actual: string = getHardKeyValue(2100, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0202 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0203
     * @tc.name      testSimpleKeyboardHardKey0203
     * @tc.desc      Checks hard key mapping for code 2101, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0203 begin');
      const actual: string = getHardKeyValue(2101, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0203 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0204
     * @tc.name      testSimpleKeyboardHardKey0204
     * @tc.desc      Checks hard key mapping for code 2101, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0204 begin');
      const actual: string = getHardKeyValue(2101, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0204 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0205
     * @tc.name      testSimpleKeyboardHardKey0205
     * @tc.desc      Checks hard key mapping for code 2102, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0205 begin');
      const actual: string = getHardKeyValue(2102, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0205 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0206
     * @tc.name      testSimpleKeyboardHardKey0206
     * @tc.desc      Checks hard key mapping for code 2102, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0206 begin');
      const actual: string = getHardKeyValue(2102, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0206 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0207
     * @tc.name      testSimpleKeyboardHardKey0207
     * @tc.desc      Checks hard key mapping for code 2103, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0207 begin');
      const actual: string = getHardKeyValue(2103, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0207 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0208
     * @tc.name      testSimpleKeyboardHardKey0208
     * @tc.desc      Checks hard key mapping for code 2103, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0208 begin');
      const actual: string = getHardKeyValue(2103, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0208 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0209
     * @tc.name      testSimpleKeyboardHardKey0209
     * @tc.desc      Checks hard key mapping for code 2104, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0209 begin');
      const actual: string = getHardKeyValue(2104, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0209 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0210
     * @tc.name      testSimpleKeyboardHardKey0210
     * @tc.desc      Checks hard key mapping for code 2104, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0210 begin');
      const actual: string = getHardKeyValue(2104, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0210 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0211
     * @tc.name      testSimpleKeyboardHardKey0211
     * @tc.desc      Checks hard key mapping for code 2105, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0211 begin');
      const actual: string = getHardKeyValue(2105, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0211 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0212
     * @tc.name      testSimpleKeyboardHardKey0212
     * @tc.desc      Checks hard key mapping for code 2105, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0212 begin');
      const actual: string = getHardKeyValue(2105, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0212 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0213
     * @tc.name      testSimpleKeyboardHardKey0213
     * @tc.desc      Checks hard key mapping for code 2106, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0213 begin');
      const actual: string = getHardKeyValue(2106, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0213 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0214
     * @tc.name      testSimpleKeyboardHardKey0214
     * @tc.desc      Checks hard key mapping for code 2106, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0214 begin');
      const actual: string = getHardKeyValue(2106, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0214 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0215
     * @tc.name      testSimpleKeyboardHardKey0215
     * @tc.desc      Checks hard key mapping for code 2107, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0215 begin');
      const actual: string = getHardKeyValue(2107, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0215 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0216
     * @tc.name      testSimpleKeyboardHardKey0216
     * @tc.desc      Checks hard key mapping for code 2107, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0216 begin');
      const actual: string = getHardKeyValue(2107, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0216 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0217
     * @tc.name      testSimpleKeyboardHardKey0217
     * @tc.desc      Checks hard key mapping for code 2108, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0217 begin');
      const actual: string = getHardKeyValue(2108, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0217 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0218
     * @tc.name      testSimpleKeyboardHardKey0218
     * @tc.desc      Checks hard key mapping for code 2108, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0218 begin');
      const actual: string = getHardKeyValue(2108, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0218 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0219
     * @tc.name      testSimpleKeyboardHardKey0219
     * @tc.desc      Checks hard key mapping for code 2109, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0219 begin');
      const actual: string = getHardKeyValue(2109, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0219 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0220
     * @tc.name      testSimpleKeyboardHardKey0220
     * @tc.desc      Checks hard key mapping for code 2109, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0220 begin');
      const actual: string = getHardKeyValue(2109, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0220 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0221
     * @tc.name      testSimpleKeyboardHardKey0221
     * @tc.desc      Checks hard key mapping for code 2110, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0221 begin');
      const actual: string = getHardKeyValue(2110, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0221 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0222
     * @tc.name      testSimpleKeyboardHardKey0222
     * @tc.desc      Checks hard key mapping for code 2110, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0222 begin');
      const actual: string = getHardKeyValue(2110, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0222 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0223
     * @tc.name      testSimpleKeyboardHardKey0223
     * @tc.desc      Checks hard key mapping for code 2111, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0223 begin');
      const actual: string = getHardKeyValue(2111, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0223 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0224
     * @tc.name      testSimpleKeyboardHardKey0224
     * @tc.desc      Checks hard key mapping for code 2111, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0224 begin');
      const actual: string = getHardKeyValue(2111, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0224 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0225
     * @tc.name      testSimpleKeyboardHardKey0225
     * @tc.desc      Checks hard key mapping for code 2112, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0225 begin');
      const actual: string = getHardKeyValue(2112, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0225 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0226
     * @tc.name      testSimpleKeyboardHardKey0226
     * @tc.desc      Checks hard key mapping for code 2112, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0226 begin');
      const actual: string = getHardKeyValue(2112, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0226 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0227
     * @tc.name      testSimpleKeyboardHardKey0227
     * @tc.desc      Checks hard key mapping for code 2113, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0227 begin');
      const actual: string = getHardKeyValue(2113, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0227 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0228
     * @tc.name      testSimpleKeyboardHardKey0228
     * @tc.desc      Checks hard key mapping for code 2113, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0228 begin');
      const actual: string = getHardKeyValue(2113, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0228 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0229
     * @tc.name      testSimpleKeyboardHardKey0229
     * @tc.desc      Checks hard key mapping for code 2114, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0229 begin');
      const actual: string = getHardKeyValue(2114, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0229 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0230
     * @tc.name      testSimpleKeyboardHardKey0230
     * @tc.desc      Checks hard key mapping for code 2114, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0230 begin');
      const actual: string = getHardKeyValue(2114, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0230 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0231
     * @tc.name      testSimpleKeyboardHardKey0231
     * @tc.desc      Checks hard key mapping for code 2115, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0231 begin');
      const actual: string = getHardKeyValue(2115, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0231 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0232
     * @tc.name      testSimpleKeyboardHardKey0232
     * @tc.desc      Checks hard key mapping for code 2115, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0232 begin');
      const actual: string = getHardKeyValue(2115, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0232 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0233
     * @tc.name      testSimpleKeyboardHardKey0233
     * @tc.desc      Checks hard key mapping for code 2116, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0233 begin');
      const actual: string = getHardKeyValue(2116, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0233 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0234
     * @tc.name      testSimpleKeyboardHardKey0234
     * @tc.desc      Checks hard key mapping for code 2116, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0234 begin');
      const actual: string = getHardKeyValue(2116, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0234 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0235
     * @tc.name      testSimpleKeyboardHardKey0235
     * @tc.desc      Checks hard key mapping for code 2117, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0235 begin');
      const actual: string = getHardKeyValue(2117, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0235 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0236
     * @tc.name      testSimpleKeyboardHardKey0236
     * @tc.desc      Checks hard key mapping for code 2117, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0236 begin');
      const actual: string = getHardKeyValue(2117, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0236 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0237
     * @tc.name      testSimpleKeyboardHardKey0237
     * @tc.desc      Checks hard key mapping for code 2118, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0237 begin');
      const actual: string = getHardKeyValue(2118, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0237 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0238
     * @tc.name      testSimpleKeyboardHardKey0238
     * @tc.desc      Checks hard key mapping for code 2118, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0238 begin');
      const actual: string = getHardKeyValue(2118, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0238 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0239
     * @tc.name      testSimpleKeyboardHardKey0239
     * @tc.desc      Checks hard key mapping for code 2119, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0239 begin');
      const actual: string = getHardKeyValue(2119, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0239 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0240
     * @tc.name      testSimpleKeyboardHardKey0240
     * @tc.desc      Checks hard key mapping for code 2119, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0240 begin');
      const actual: string = getHardKeyValue(2119, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0240 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0241
     * @tc.name      testSimpleKeyboardHardKey0241
     * @tc.desc      Checks hard key mapping for code 2120, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0241 begin');
      const actual: string = getHardKeyValue(2120, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0241 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0242
     * @tc.name      testSimpleKeyboardHardKey0242
     * @tc.desc      Checks hard key mapping for code 2120, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0242 begin');
      const actual: string = getHardKeyValue(2120, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0242 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0243
     * @tc.name      testSimpleKeyboardHardKey0243
     * @tc.desc      Checks hard key mapping for code 2121, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0243 begin');
      const actual: string = getHardKeyValue(2121, false);
      expect(actual).assertEqual('(');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0243 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0244
     * @tc.name      testSimpleKeyboardHardKey0244
     * @tc.desc      Checks hard key mapping for code 2121, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0244 begin');
      const actual: string = getHardKeyValue(2121, true);
      expect(actual).assertEqual('(');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0244 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0245
     * @tc.name      testSimpleKeyboardHardKey0245
     * @tc.desc      Checks hard key mapping for code 2122, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0245 begin');
      const actual: string = getHardKeyValue(2122, false);
      expect(actual).assertEqual(')');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0245 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0246
     * @tc.name      testSimpleKeyboardHardKey0246
     * @tc.desc      Checks hard key mapping for code 2122, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0246 begin');
      const actual: string = getHardKeyValue(2122, true);
      expect(actual).assertEqual(')');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0246 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0247
     * @tc.name      testSimpleKeyboardHardKey0247
     * @tc.desc      Checks hard key mapping for code 2123, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0247 begin');
      const actual: string = getHardKeyValue(2123, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0247 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0248
     * @tc.name      testSimpleKeyboardHardKey0248
     * @tc.desc      Checks hard key mapping for code 2123, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0248 begin');
      const actual: string = getHardKeyValue(2123, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0248 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0249
     * @tc.name      testSimpleKeyboardHardKey0249
     * @tc.desc      Checks hard key mapping for code 2124, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0249 begin');
      const actual: string = getHardKeyValue(2124, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0249 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_0250
     * @tc.name      testSimpleKeyboardHardKey0250
     * @tc.desc      Checks hard key mapping for code 2124, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0250 begin');
      const actual: string = getHardKeyValue(2124, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey0250 end');
    })
  })
}
