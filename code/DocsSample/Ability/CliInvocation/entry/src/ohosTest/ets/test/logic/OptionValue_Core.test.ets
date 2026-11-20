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

import { describe, expect, it, beforeAll, afterAll, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CliModel } from '../Shared/CliFixtures';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_cliinvocation]';
const BUNDLE: string = 'CliInvocation_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for optionValue (50 cases). */
export default function optionValueCoreTest(): void {
  describe('OptionValueCoreTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}OptionValueCoreTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}OptionValueCoreTest end`);
    });
    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0001
     * @tc.name      CliInvocation_optionValue_Core_0001
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.sample.app, --abilityname, EntryAbility], --bundlename) returns com.sample.app.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CliInvocation_optionValue_Core_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: SmallArray+DelimitedString; expected: com.sample.app
      const actual: string = CliModel.optionValue(['--bundlename', 'com.sample.app', '--abilityname', 'EntryAbility'], '--bundlename');
      expect(actual).assertEqual('com.sample.app');
      expect(actual.length).assertEqual(14);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0002
     * @tc.name      CliInvocation_optionValue_Core_0002
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.sample.app, --abilityname, EntryAbility], --abilityname) returns EntryAbility.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_optionValue_Core_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray+DelimitedString; expected: EntryAbility
      const actual: string = CliModel.optionValue(['--bundlename', 'com.sample.app', '--abilityname', 'EntryAbility'], '--abilityname');
      expect(actual).assertEqual('EntryAbility');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0003
     * @tc.name      CliInvocation_optionValue_Core_0003
     * @tc.desc      [SmallArray+ShortString] Verify optionValue([a, b, c], b) returns c.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_optionValue_Core_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray+ShortString; expected: c
      const actual: string = CliModel.optionValue(['a', 'b', 'c'], 'b');
      expect(actual).assertEqual('c');
      expect(actual.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0004
     * @tc.name      CliInvocation_optionValue_Core_0004
     * @tc.desc      [SmallArray+ShortString] Verify optionValue([a, b, c], z) returns (empty).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_optionValue_Core_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray+ShortString; expected: (empty)
      const actual: string = CliModel.optionValue(['a', 'b', 'c'], 'z');
      expect(actual).assertEqual('');
      expect(actual.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0005
     * @tc.name      CliInvocation_optionValue_Core_0005
     * @tc.desc      [SingleElementArray+DelimitedString] Verify optionValue([--bundlename], --bundlename) returns (empty).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_optionValue_Core_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SingleElementArray+DelimitedString; expected: (empty)
      const actual: string = CliModel.optionValue(['--bundlename'], '--bundlename');
      expect(actual).assertEqual('');
      expect(actual.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0006
     * @tc.name      CliInvocation_optionValue_Core_0006
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.sample.app, --abilityname, EntryAbility], --bundlename) returns com.sample.app.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_optionValue_Core_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray+DelimitedString; expected: com.sample.app
      const actual: string = CliModel.optionValue(['--bundlename', 'com.sample.app', '--abilityname', 'EntryAbility'], '--bundlename');
      expect(actual).assertEqual('com.sample.app');
      expect(actual.length).assertEqual(14);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0007
     * @tc.name      CliInvocation_optionValue_Core_0007
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.sample.app, --abilityname, EntryAbility], --abilityname) returns EntryAbility.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_optionValue_Core_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray+DelimitedString; expected: EntryAbility
      const actual: string = CliModel.optionValue(['--bundlename', 'com.sample.app', '--abilityname', 'EntryAbility'], '--abilityname');
      expect(actual).assertEqual('EntryAbility');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0008
     * @tc.name      CliInvocation_optionValue_Core_0008
     * @tc.desc      [SmallArray+ShortString] Verify optionValue([a, b, c], b) returns c.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_optionValue_Core_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray+ShortString; expected: c
      const actual: string = CliModel.optionValue(['a', 'b', 'c'], 'b');
      expect(actual).assertEqual('c');
      expect(actual.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0009
     * @tc.name      CliInvocation_optionValue_Core_0009
     * @tc.desc      [SmallArray+ShortString] Verify optionValue([a, b, c], z) returns (empty).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_optionValue_Core_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray+ShortString; expected: (empty)
      const actual: string = CliModel.optionValue(['a', 'b', 'c'], 'z');
      expect(actual).assertEqual('');
      expect(actual.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0010
     * @tc.name      CliInvocation_optionValue_Core_0010
     * @tc.desc      [SingleElementArray+DelimitedString] Verify optionValue([--bundlename], --bundlename) returns (empty).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_optionValue_Core_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SingleElementArray+DelimitedString; expected: (empty)
      const actual: string = CliModel.optionValue(['--bundlename'], '--bundlename');
      expect(actual).assertEqual('');
      expect(actual.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0011
     * @tc.name      CliInvocation_optionValue_Core_0011
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.sample.app, --abilityname, EntryAbility], --bundlename) returns com.sample.app.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Core_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+DelimitedString; expected: com.sample.app
      const actual: string = CliModel.optionValue(['--bundlename', 'com.sample.app', '--abilityname', 'EntryAbility'], '--bundlename');
      expect(actual).assertEqual('com.sample.app');
      expect(actual.length).assertEqual(14);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0012
     * @tc.name      CliInvocation_optionValue_Core_0012
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.sample.app, --abilityname, EntryAbility], --abilityname) returns EntryAbility.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Core_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+DelimitedString; expected: EntryAbility
      const actual: string = CliModel.optionValue(['--bundlename', 'com.sample.app', '--abilityname', 'EntryAbility'], '--abilityname');
      expect(actual).assertEqual('EntryAbility');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0013
     * @tc.name      CliInvocation_optionValue_Core_0013
     * @tc.desc      [SmallArray+ShortString] Verify optionValue([a, b, c], b) returns c.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Core_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+ShortString; expected: c
      const actual: string = CliModel.optionValue(['a', 'b', 'c'], 'b');
      expect(actual).assertEqual('c');
      expect(actual.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0014
     * @tc.name      CliInvocation_optionValue_Core_0014
     * @tc.desc      [SmallArray+ShortString] Verify optionValue([a, b, c], z) returns (empty).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Core_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+ShortString; expected: (empty)
      const actual: string = CliModel.optionValue(['a', 'b', 'c'], 'z');
      expect(actual).assertEqual('');
      expect(actual.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0015
     * @tc.name      CliInvocation_optionValue_Core_0015
     * @tc.desc      [SingleElementArray+DelimitedString] Verify optionValue([--bundlename], --bundlename) returns (empty).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Core_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SingleElementArray+DelimitedString; expected: (empty)
      const actual: string = CliModel.optionValue(['--bundlename'], '--bundlename');
      expect(actual).assertEqual('');
      expect(actual.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0016
     * @tc.name      CliInvocation_optionValue_Core_0016
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.sample.app, --abilityname, EntryAbility], --bundlename) returns com.sample.app.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Core_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+DelimitedString; expected: com.sample.app
      const actual: string = CliModel.optionValue(['--bundlename', 'com.sample.app', '--abilityname', 'EntryAbility'], '--bundlename');
      expect(actual).assertEqual('com.sample.app');
      expect(actual.length).assertEqual(14);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0017
     * @tc.name      CliInvocation_optionValue_Core_0017
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.sample.app, --abilityname, EntryAbility], --abilityname) returns EntryAbility.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Core_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+DelimitedString; expected: EntryAbility
      const actual: string = CliModel.optionValue(['--bundlename', 'com.sample.app', '--abilityname', 'EntryAbility'], '--abilityname');
      expect(actual).assertEqual('EntryAbility');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0018
     * @tc.name      CliInvocation_optionValue_Core_0018
     * @tc.desc      [SmallArray+ShortString] Verify optionValue([a, b, c], b) returns c.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Core_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+ShortString; expected: c
      const actual: string = CliModel.optionValue(['a', 'b', 'c'], 'b');
      expect(actual).assertEqual('c');
      expect(actual.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0019
     * @tc.name      CliInvocation_optionValue_Core_0019
     * @tc.desc      [SmallArray+ShortString] Verify optionValue([a, b, c], z) returns (empty).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Core_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+ShortString; expected: (empty)
      const actual: string = CliModel.optionValue(['a', 'b', 'c'], 'z');
      expect(actual).assertEqual('');
      expect(actual.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0020
     * @tc.name      CliInvocation_optionValue_Core_0020
     * @tc.desc      [SingleElementArray+DelimitedString] Verify optionValue([--bundlename], --bundlename) returns (empty).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Core_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SingleElementArray+DelimitedString; expected: (empty)
      const actual: string = CliModel.optionValue(['--bundlename'], '--bundlename');
      expect(actual).assertEqual('');
      expect(actual.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0021
     * @tc.name      CliInvocation_optionValue_Core_0021
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.sample.app, --abilityname, EntryAbility], --bundlename) returns com.sample.app.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Core_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+DelimitedString; expected: com.sample.app
      const actual: string = CliModel.optionValue(['--bundlename', 'com.sample.app', '--abilityname', 'EntryAbility'], '--bundlename');
      expect(actual).assertEqual('com.sample.app');
      expect(actual.length).assertEqual(14);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0022
     * @tc.name      CliInvocation_optionValue_Core_0022
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.sample.app, --abilityname, EntryAbility], --abilityname) returns EntryAbility.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Core_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+DelimitedString; expected: EntryAbility
      const actual: string = CliModel.optionValue(['--bundlename', 'com.sample.app', '--abilityname', 'EntryAbility'], '--abilityname');
      expect(actual).assertEqual('EntryAbility');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0023
     * @tc.name      CliInvocation_optionValue_Core_0023
     * @tc.desc      [SmallArray+ShortString] Verify optionValue([a, b, c], b) returns c.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Core_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+ShortString; expected: c
      const actual: string = CliModel.optionValue(['a', 'b', 'c'], 'b');
      expect(actual).assertEqual('c');
      expect(actual.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0024
     * @tc.name      CliInvocation_optionValue_Core_0024
     * @tc.desc      [SmallArray+ShortString] Verify optionValue([a, b, c], z) returns (empty).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Core_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+ShortString; expected: (empty)
      const actual: string = CliModel.optionValue(['a', 'b', 'c'], 'z');
      expect(actual).assertEqual('');
      expect(actual.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0025
     * @tc.name      CliInvocation_optionValue_Core_0025
     * @tc.desc      [SingleElementArray+DelimitedString] Verify optionValue([--bundlename], --bundlename) returns (empty).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Core_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SingleElementArray+DelimitedString; expected: (empty)
      const actual: string = CliModel.optionValue(['--bundlename'], '--bundlename');
      expect(actual).assertEqual('');
      expect(actual.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0026
     * @tc.name      CliInvocation_optionValue_Core_0026
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.sample.app, --abilityname, EntryAbility], --bundlename) returns com.sample.app.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Core_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+DelimitedString; expected: com.sample.app
      const actual: string = CliModel.optionValue(['--bundlename', 'com.sample.app', '--abilityname', 'EntryAbility'], '--bundlename');
      expect(actual).assertEqual('com.sample.app');
      expect(actual.length).assertEqual(14);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0027
     * @tc.name      CliInvocation_optionValue_Core_0027
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.sample.app, --abilityname, EntryAbility], --abilityname) returns EntryAbility.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Core_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+DelimitedString; expected: EntryAbility
      const actual: string = CliModel.optionValue(['--bundlename', 'com.sample.app', '--abilityname', 'EntryAbility'], '--abilityname');
      expect(actual).assertEqual('EntryAbility');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0028
     * @tc.name      CliInvocation_optionValue_Core_0028
     * @tc.desc      [SmallArray+ShortString] Verify optionValue([a, b, c], b) returns c.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Core_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+ShortString; expected: c
      const actual: string = CliModel.optionValue(['a', 'b', 'c'], 'b');
      expect(actual).assertEqual('c');
      expect(actual.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0029
     * @tc.name      CliInvocation_optionValue_Core_0029
     * @tc.desc      [SmallArray+ShortString] Verify optionValue([a, b, c], z) returns (empty).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Core_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+ShortString; expected: (empty)
      const actual: string = CliModel.optionValue(['a', 'b', 'c'], 'z');
      expect(actual).assertEqual('');
      expect(actual.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0030
     * @tc.name      CliInvocation_optionValue_Core_0030
     * @tc.desc      [SingleElementArray+DelimitedString] Verify optionValue([--bundlename], --bundlename) returns (empty).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Core_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SingleElementArray+DelimitedString; expected: (empty)
      const actual: string = CliModel.optionValue(['--bundlename'], '--bundlename');
      expect(actual).assertEqual('');
      expect(actual.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0031
     * @tc.name      CliInvocation_optionValue_Core_0031
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.sample.app, --abilityname, EntryAbility], --bundlename) returns com.sample.app.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Core_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+DelimitedString; expected: com.sample.app
      const actual: string = CliModel.optionValue(['--bundlename', 'com.sample.app', '--abilityname', 'EntryAbility'], '--bundlename');
      expect(actual).assertEqual('com.sample.app');
      expect(actual.length).assertEqual(14);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0032
     * @tc.name      CliInvocation_optionValue_Core_0032
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.sample.app, --abilityname, EntryAbility], --abilityname) returns EntryAbility.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Core_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+DelimitedString; expected: EntryAbility
      const actual: string = CliModel.optionValue(['--bundlename', 'com.sample.app', '--abilityname', 'EntryAbility'], '--abilityname');
      expect(actual).assertEqual('EntryAbility');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0033
     * @tc.name      CliInvocation_optionValue_Core_0033
     * @tc.desc      [SmallArray+ShortString] Verify optionValue([a, b, c], b) returns c.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Core_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+ShortString; expected: c
      const actual: string = CliModel.optionValue(['a', 'b', 'c'], 'b');
      expect(actual).assertEqual('c');
      expect(actual.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0034
     * @tc.name      CliInvocation_optionValue_Core_0034
     * @tc.desc      [SmallArray+ShortString] Verify optionValue([a, b, c], z) returns (empty).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Core_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+ShortString; expected: (empty)
      const actual: string = CliModel.optionValue(['a', 'b', 'c'], 'z');
      expect(actual).assertEqual('');
      expect(actual.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0035
     * @tc.name      CliInvocation_optionValue_Core_0035
     * @tc.desc      [SingleElementArray+DelimitedString] Verify optionValue([--bundlename], --bundlename) returns (empty).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Core_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SingleElementArray+DelimitedString; expected: (empty)
      const actual: string = CliModel.optionValue(['--bundlename'], '--bundlename');
      expect(actual).assertEqual('');
      expect(actual.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0036
     * @tc.name      CliInvocation_optionValue_Core_0036
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.sample.app, --abilityname, EntryAbility], --bundlename) returns com.sample.app.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Core_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+DelimitedString; expected: com.sample.app
      const actual: string = CliModel.optionValue(['--bundlename', 'com.sample.app', '--abilityname', 'EntryAbility'], '--bundlename');
      expect(actual).assertEqual('com.sample.app');
      expect(actual.length).assertEqual(14);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0037
     * @tc.name      CliInvocation_optionValue_Core_0037
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.sample.app, --abilityname, EntryAbility], --abilityname) returns EntryAbility.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Core_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+DelimitedString; expected: EntryAbility
      const actual: string = CliModel.optionValue(['--bundlename', 'com.sample.app', '--abilityname', 'EntryAbility'], '--abilityname');
      expect(actual).assertEqual('EntryAbility');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0038
     * @tc.name      CliInvocation_optionValue_Core_0038
     * @tc.desc      [SmallArray+ShortString] Verify optionValue([a, b, c], b) returns c.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Core_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+ShortString; expected: c
      const actual: string = CliModel.optionValue(['a', 'b', 'c'], 'b');
      expect(actual).assertEqual('c');
      expect(actual.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0039
     * @tc.name      CliInvocation_optionValue_Core_0039
     * @tc.desc      [SmallArray+ShortString] Verify optionValue([a, b, c], z) returns (empty).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Core_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+ShortString; expected: (empty)
      const actual: string = CliModel.optionValue(['a', 'b', 'c'], 'z');
      expect(actual).assertEqual('');
      expect(actual.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0040
     * @tc.name      CliInvocation_optionValue_Core_0040
     * @tc.desc      [SingleElementArray+DelimitedString] Verify optionValue([--bundlename], --bundlename) returns (empty).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Core_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SingleElementArray+DelimitedString; expected: (empty)
      const actual: string = CliModel.optionValue(['--bundlename'], '--bundlename');
      expect(actual).assertEqual('');
      expect(actual.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0041
     * @tc.name      CliInvocation_optionValue_Core_0041
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.sample.app, --abilityname, EntryAbility], --bundlename) returns com.sample.app.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Core_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+DelimitedString; expected: com.sample.app
      const actual: string = CliModel.optionValue(['--bundlename', 'com.sample.app', '--abilityname', 'EntryAbility'], '--bundlename');
      expect(actual).assertEqual('com.sample.app');
      expect(actual.length).assertEqual(14);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0042
     * @tc.name      CliInvocation_optionValue_Core_0042
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.sample.app, --abilityname, EntryAbility], --abilityname) returns EntryAbility.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Core_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+DelimitedString; expected: EntryAbility
      const actual: string = CliModel.optionValue(['--bundlename', 'com.sample.app', '--abilityname', 'EntryAbility'], '--abilityname');
      expect(actual).assertEqual('EntryAbility');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0043
     * @tc.name      CliInvocation_optionValue_Core_0043
     * @tc.desc      [SmallArray+ShortString] Verify optionValue([a, b, c], b) returns c.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Core_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+ShortString; expected: c
      const actual: string = CliModel.optionValue(['a', 'b', 'c'], 'b');
      expect(actual).assertEqual('c');
      expect(actual.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0044
     * @tc.name      CliInvocation_optionValue_Core_0044
     * @tc.desc      [SmallArray+ShortString] Verify optionValue([a, b, c], z) returns (empty).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Core_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+ShortString; expected: (empty)
      const actual: string = CliModel.optionValue(['a', 'b', 'c'], 'z');
      expect(actual).assertEqual('');
      expect(actual.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0045
     * @tc.name      CliInvocation_optionValue_Core_0045
     * @tc.desc      [SingleElementArray+DelimitedString] Verify optionValue([--bundlename], --bundlename) returns (empty).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Core_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SingleElementArray+DelimitedString; expected: (empty)
      const actual: string = CliModel.optionValue(['--bundlename'], '--bundlename');
      expect(actual).assertEqual('');
      expect(actual.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0046
     * @tc.name      CliInvocation_optionValue_Core_0046
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.sample.app, --abilityname, EntryAbility], --bundlename) returns com.sample.app.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Core_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+DelimitedString; expected: com.sample.app
      const actual: string = CliModel.optionValue(['--bundlename', 'com.sample.app', '--abilityname', 'EntryAbility'], '--bundlename');
      expect(actual).assertEqual('com.sample.app');
      expect(actual.length).assertEqual(14);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0047
     * @tc.name      CliInvocation_optionValue_Core_0047
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.sample.app, --abilityname, EntryAbility], --abilityname) returns EntryAbility.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Core_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+DelimitedString; expected: EntryAbility
      const actual: string = CliModel.optionValue(['--bundlename', 'com.sample.app', '--abilityname', 'EntryAbility'], '--abilityname');
      expect(actual).assertEqual('EntryAbility');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0048
     * @tc.name      CliInvocation_optionValue_Core_0048
     * @tc.desc      [SmallArray+ShortString] Verify optionValue([a, b, c], b) returns c.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Core_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+ShortString; expected: c
      const actual: string = CliModel.optionValue(['a', 'b', 'c'], 'b');
      expect(actual).assertEqual('c');
      expect(actual.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0049
     * @tc.name      CliInvocation_optionValue_Core_0049
     * @tc.desc      [SmallArray+ShortString] Verify optionValue([a, b, c], z) returns (empty).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Core_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+ShortString; expected: (empty)
      const actual: string = CliModel.optionValue(['a', 'b', 'c'], 'z');
      expect(actual).assertEqual('');
      expect(actual.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_CORE_0050
     * @tc.name      CliInvocation_optionValue_Core_0050
     * @tc.desc      [SingleElementArray+DelimitedString] Verify optionValue([--bundlename], --bundlename) returns (empty).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Core_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SingleElementArray+DelimitedString; expected: (empty)
      const actual: string = CliModel.optionValue(['--bundlename'], '--bundlename');
      expect(actual).assertEqual('');
      expect(actual.length).assertEqual(0);
    });

  });
}
