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

const TAG: string = '[Sample_HardKeyReservedNavigationNumberCoreTest]';
const DOMAIN: number = 0xF814;

export default function HardKeyReservedNavigationNumberCoreTest(): void {
  describe('HardKeyReservedNavigationNumberCoreTest', () => {
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4001
     * @tc.name      testSimpleKeyboardHardKey4001
     * @tc.desc      Checks hard key mapping for code 4000, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4001 begin');
      const actual: string = getHardKeyValue(4000, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4001 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4002
     * @tc.name      testSimpleKeyboardHardKey4002
     * @tc.desc      Checks hard key mapping for code 4000, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4002 begin');
      const actual: string = getHardKeyValue(4000, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4002 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4003
     * @tc.name      testSimpleKeyboardHardKey4003
     * @tc.desc      Checks hard key mapping for code 4001, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4003 begin');
      const actual: string = getHardKeyValue(4001, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4003 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4004
     * @tc.name      testSimpleKeyboardHardKey4004
     * @tc.desc      Checks hard key mapping for code 4001, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4004 begin');
      const actual: string = getHardKeyValue(4001, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4004 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4005
     * @tc.name      testSimpleKeyboardHardKey4005
     * @tc.desc      Checks hard key mapping for code 4002, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4005 begin');
      const actual: string = getHardKeyValue(4002, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4005 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4006
     * @tc.name      testSimpleKeyboardHardKey4006
     * @tc.desc      Checks hard key mapping for code 4002, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4006 begin');
      const actual: string = getHardKeyValue(4002, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4006 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4007
     * @tc.name      testSimpleKeyboardHardKey4007
     * @tc.desc      Checks hard key mapping for code 4003, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4007 begin');
      const actual: string = getHardKeyValue(4003, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4007 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4008
     * @tc.name      testSimpleKeyboardHardKey4008
     * @tc.desc      Checks hard key mapping for code 4003, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4008 begin');
      const actual: string = getHardKeyValue(4003, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4008 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4009
     * @tc.name      testSimpleKeyboardHardKey4009
     * @tc.desc      Checks hard key mapping for code 4004, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4009 begin');
      const actual: string = getHardKeyValue(4004, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4009 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4010
     * @tc.name      testSimpleKeyboardHardKey4010
     * @tc.desc      Checks hard key mapping for code 4004, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4010 begin');
      const actual: string = getHardKeyValue(4004, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4010 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4011
     * @tc.name      testSimpleKeyboardHardKey4011
     * @tc.desc      Checks hard key mapping for code 4005, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4011 begin');
      const actual: string = getHardKeyValue(4005, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4011 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4012
     * @tc.name      testSimpleKeyboardHardKey4012
     * @tc.desc      Checks hard key mapping for code 4005, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4012 begin');
      const actual: string = getHardKeyValue(4005, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4012 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4013
     * @tc.name      testSimpleKeyboardHardKey4013
     * @tc.desc      Checks hard key mapping for code 4006, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4013 begin');
      const actual: string = getHardKeyValue(4006, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4013 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4014
     * @tc.name      testSimpleKeyboardHardKey4014
     * @tc.desc      Checks hard key mapping for code 4006, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4014 begin');
      const actual: string = getHardKeyValue(4006, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4014 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4015
     * @tc.name      testSimpleKeyboardHardKey4015
     * @tc.desc      Checks hard key mapping for code 4007, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4015 begin');
      const actual: string = getHardKeyValue(4007, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4015 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4016
     * @tc.name      testSimpleKeyboardHardKey4016
     * @tc.desc      Checks hard key mapping for code 4007, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4016 begin');
      const actual: string = getHardKeyValue(4007, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4016 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4017
     * @tc.name      testSimpleKeyboardHardKey4017
     * @tc.desc      Checks hard key mapping for code 4008, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4017 begin');
      const actual: string = getHardKeyValue(4008, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4017 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4018
     * @tc.name      testSimpleKeyboardHardKey4018
     * @tc.desc      Checks hard key mapping for code 4008, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4018 begin');
      const actual: string = getHardKeyValue(4008, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4018 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4019
     * @tc.name      testSimpleKeyboardHardKey4019
     * @tc.desc      Checks hard key mapping for code 4009, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4019 begin');
      const actual: string = getHardKeyValue(4009, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4019 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4020
     * @tc.name      testSimpleKeyboardHardKey4020
     * @tc.desc      Checks hard key mapping for code 4009, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4020 begin');
      const actual: string = getHardKeyValue(4009, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4020 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4021
     * @tc.name      testSimpleKeyboardHardKey4021
     * @tc.desc      Checks hard key mapping for code 4010, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4021 begin');
      const actual: string = getHardKeyValue(4010, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4021 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4022
     * @tc.name      testSimpleKeyboardHardKey4022
     * @tc.desc      Checks hard key mapping for code 4010, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4022 begin');
      const actual: string = getHardKeyValue(4010, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4022 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4023
     * @tc.name      testSimpleKeyboardHardKey4023
     * @tc.desc      Checks hard key mapping for code 4011, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4023 begin');
      const actual: string = getHardKeyValue(4011, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4023 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4024
     * @tc.name      testSimpleKeyboardHardKey4024
     * @tc.desc      Checks hard key mapping for code 4011, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4024 begin');
      const actual: string = getHardKeyValue(4011, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4024 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4025
     * @tc.name      testSimpleKeyboardHardKey4025
     * @tc.desc      Checks hard key mapping for code 4012, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4025 begin');
      const actual: string = getHardKeyValue(4012, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4025 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4026
     * @tc.name      testSimpleKeyboardHardKey4026
     * @tc.desc      Checks hard key mapping for code 4012, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4026 begin');
      const actual: string = getHardKeyValue(4012, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4026 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4027
     * @tc.name      testSimpleKeyboardHardKey4027
     * @tc.desc      Checks hard key mapping for code 4013, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4027 begin');
      const actual: string = getHardKeyValue(4013, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4027 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4028
     * @tc.name      testSimpleKeyboardHardKey4028
     * @tc.desc      Checks hard key mapping for code 4013, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4028 begin');
      const actual: string = getHardKeyValue(4013, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4028 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4029
     * @tc.name      testSimpleKeyboardHardKey4029
     * @tc.desc      Checks hard key mapping for code 4014, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4029 begin');
      const actual: string = getHardKeyValue(4014, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4029 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4030
     * @tc.name      testSimpleKeyboardHardKey4030
     * @tc.desc      Checks hard key mapping for code 4014, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4030 begin');
      const actual: string = getHardKeyValue(4014, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4030 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4031
     * @tc.name      testSimpleKeyboardHardKey4031
     * @tc.desc      Checks hard key mapping for code 4015, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4031 begin');
      const actual: string = getHardKeyValue(4015, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4031 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4032
     * @tc.name      testSimpleKeyboardHardKey4032
     * @tc.desc      Checks hard key mapping for code 4015, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4032 begin');
      const actual: string = getHardKeyValue(4015, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4032 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4033
     * @tc.name      testSimpleKeyboardHardKey4033
     * @tc.desc      Checks hard key mapping for code 4016, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4033 begin');
      const actual: string = getHardKeyValue(4016, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4033 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4034
     * @tc.name      testSimpleKeyboardHardKey4034
     * @tc.desc      Checks hard key mapping for code 4016, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4034 begin');
      const actual: string = getHardKeyValue(4016, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4034 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4035
     * @tc.name      testSimpleKeyboardHardKey4035
     * @tc.desc      Checks hard key mapping for code 4017, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4035 begin');
      const actual: string = getHardKeyValue(4017, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4035 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4036
     * @tc.name      testSimpleKeyboardHardKey4036
     * @tc.desc      Checks hard key mapping for code 4017, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4036 begin');
      const actual: string = getHardKeyValue(4017, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4036 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4037
     * @tc.name      testSimpleKeyboardHardKey4037
     * @tc.desc      Checks hard key mapping for code 4018, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4037 begin');
      const actual: string = getHardKeyValue(4018, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4037 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4038
     * @tc.name      testSimpleKeyboardHardKey4038
     * @tc.desc      Checks hard key mapping for code 4018, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4038 begin');
      const actual: string = getHardKeyValue(4018, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4038 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4039
     * @tc.name      testSimpleKeyboardHardKey4039
     * @tc.desc      Checks hard key mapping for code 4019, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4039 begin');
      const actual: string = getHardKeyValue(4019, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4039 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4040
     * @tc.name      testSimpleKeyboardHardKey4040
     * @tc.desc      Checks hard key mapping for code 4019, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4040 begin');
      const actual: string = getHardKeyValue(4019, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4040 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4041
     * @tc.name      testSimpleKeyboardHardKey4041
     * @tc.desc      Checks hard key mapping for code 4020, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4041 begin');
      const actual: string = getHardKeyValue(4020, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4041 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4042
     * @tc.name      testSimpleKeyboardHardKey4042
     * @tc.desc      Checks hard key mapping for code 4020, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4042 begin');
      const actual: string = getHardKeyValue(4020, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4042 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4043
     * @tc.name      testSimpleKeyboardHardKey4043
     * @tc.desc      Checks hard key mapping for code 4021, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4043 begin');
      const actual: string = getHardKeyValue(4021, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4043 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4044
     * @tc.name      testSimpleKeyboardHardKey4044
     * @tc.desc      Checks hard key mapping for code 4021, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4044 begin');
      const actual: string = getHardKeyValue(4021, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4044 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4045
     * @tc.name      testSimpleKeyboardHardKey4045
     * @tc.desc      Checks hard key mapping for code 4022, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4045 begin');
      const actual: string = getHardKeyValue(4022, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4045 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4046
     * @tc.name      testSimpleKeyboardHardKey4046
     * @tc.desc      Checks hard key mapping for code 4022, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4046 begin');
      const actual: string = getHardKeyValue(4022, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4046 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4047
     * @tc.name      testSimpleKeyboardHardKey4047
     * @tc.desc      Checks hard key mapping for code 4023, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4047 begin');
      const actual: string = getHardKeyValue(4023, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4047 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4048
     * @tc.name      testSimpleKeyboardHardKey4048
     * @tc.desc      Checks hard key mapping for code 4023, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4048 begin');
      const actual: string = getHardKeyValue(4023, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4048 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4049
     * @tc.name      testSimpleKeyboardHardKey4049
     * @tc.desc      Checks hard key mapping for code 4024, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4049 begin');
      const actual: string = getHardKeyValue(4024, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4049 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4050
     * @tc.name      testSimpleKeyboardHardKey4050
     * @tc.desc      Checks hard key mapping for code 4024, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4050 begin');
      const actual: string = getHardKeyValue(4024, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4050 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4051
     * @tc.name      testSimpleKeyboardHardKey4051
     * @tc.desc      Checks hard key mapping for code 4025, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4051 begin');
      const actual: string = getHardKeyValue(4025, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4051 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4052
     * @tc.name      testSimpleKeyboardHardKey4052
     * @tc.desc      Checks hard key mapping for code 4025, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4052 begin');
      const actual: string = getHardKeyValue(4025, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4052 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4053
     * @tc.name      testSimpleKeyboardHardKey4053
     * @tc.desc      Checks hard key mapping for code 4026, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4053 begin');
      const actual: string = getHardKeyValue(4026, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4053 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4054
     * @tc.name      testSimpleKeyboardHardKey4054
     * @tc.desc      Checks hard key mapping for code 4026, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4054 begin');
      const actual: string = getHardKeyValue(4026, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4054 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4055
     * @tc.name      testSimpleKeyboardHardKey4055
     * @tc.desc      Checks hard key mapping for code 4027, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4055 begin');
      const actual: string = getHardKeyValue(4027, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4055 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4056
     * @tc.name      testSimpleKeyboardHardKey4056
     * @tc.desc      Checks hard key mapping for code 4027, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4056 begin');
      const actual: string = getHardKeyValue(4027, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4056 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4057
     * @tc.name      testSimpleKeyboardHardKey4057
     * @tc.desc      Checks hard key mapping for code 4028, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4057 begin');
      const actual: string = getHardKeyValue(4028, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4057 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4058
     * @tc.name      testSimpleKeyboardHardKey4058
     * @tc.desc      Checks hard key mapping for code 4028, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4058 begin');
      const actual: string = getHardKeyValue(4028, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4058 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4059
     * @tc.name      testSimpleKeyboardHardKey4059
     * @tc.desc      Checks hard key mapping for code 4029, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4059 begin');
      const actual: string = getHardKeyValue(4029, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4059 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4060
     * @tc.name      testSimpleKeyboardHardKey4060
     * @tc.desc      Checks hard key mapping for code 4029, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4060 begin');
      const actual: string = getHardKeyValue(4029, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4060 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4061
     * @tc.name      testSimpleKeyboardHardKey4061
     * @tc.desc      Checks hard key mapping for code 4030, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4061 begin');
      const actual: string = getHardKeyValue(4030, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4061 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4062
     * @tc.name      testSimpleKeyboardHardKey4062
     * @tc.desc      Checks hard key mapping for code 4030, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4062 begin');
      const actual: string = getHardKeyValue(4030, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4062 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4063
     * @tc.name      testSimpleKeyboardHardKey4063
     * @tc.desc      Checks hard key mapping for code 4031, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4063 begin');
      const actual: string = getHardKeyValue(4031, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4063 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4064
     * @tc.name      testSimpleKeyboardHardKey4064
     * @tc.desc      Checks hard key mapping for code 4031, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4064 begin');
      const actual: string = getHardKeyValue(4031, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4064 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4065
     * @tc.name      testSimpleKeyboardHardKey4065
     * @tc.desc      Checks hard key mapping for code 4032, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4065 begin');
      const actual: string = getHardKeyValue(4032, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4065 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4066
     * @tc.name      testSimpleKeyboardHardKey4066
     * @tc.desc      Checks hard key mapping for code 4032, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4066 begin');
      const actual: string = getHardKeyValue(4032, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4066 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4067
     * @tc.name      testSimpleKeyboardHardKey4067
     * @tc.desc      Checks hard key mapping for code 4033, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4067 begin');
      const actual: string = getHardKeyValue(4033, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4067 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4068
     * @tc.name      testSimpleKeyboardHardKey4068
     * @tc.desc      Checks hard key mapping for code 4033, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4068 begin');
      const actual: string = getHardKeyValue(4033, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4068 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4069
     * @tc.name      testSimpleKeyboardHardKey4069
     * @tc.desc      Checks hard key mapping for code 4034, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4069 begin');
      const actual: string = getHardKeyValue(4034, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4069 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4070
     * @tc.name      testSimpleKeyboardHardKey4070
     * @tc.desc      Checks hard key mapping for code 4034, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4070 begin');
      const actual: string = getHardKeyValue(4034, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4070 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4071
     * @tc.name      testSimpleKeyboardHardKey4071
     * @tc.desc      Checks hard key mapping for code 4035, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4071 begin');
      const actual: string = getHardKeyValue(4035, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4071 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4072
     * @tc.name      testSimpleKeyboardHardKey4072
     * @tc.desc      Checks hard key mapping for code 4035, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4072 begin');
      const actual: string = getHardKeyValue(4035, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4072 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4073
     * @tc.name      testSimpleKeyboardHardKey4073
     * @tc.desc      Checks hard key mapping for code 4036, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4073 begin');
      const actual: string = getHardKeyValue(4036, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4073 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4074
     * @tc.name      testSimpleKeyboardHardKey4074
     * @tc.desc      Checks hard key mapping for code 4036, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4074 begin');
      const actual: string = getHardKeyValue(4036, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4074 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4075
     * @tc.name      testSimpleKeyboardHardKey4075
     * @tc.desc      Checks hard key mapping for code 4037, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4075 begin');
      const actual: string = getHardKeyValue(4037, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4075 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4076
     * @tc.name      testSimpleKeyboardHardKey4076
     * @tc.desc      Checks hard key mapping for code 4037, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4076 begin');
      const actual: string = getHardKeyValue(4037, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4076 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4077
     * @tc.name      testSimpleKeyboardHardKey4077
     * @tc.desc      Checks hard key mapping for code 4038, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4077 begin');
      const actual: string = getHardKeyValue(4038, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4077 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4078
     * @tc.name      testSimpleKeyboardHardKey4078
     * @tc.desc      Checks hard key mapping for code 4038, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4078 begin');
      const actual: string = getHardKeyValue(4038, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4078 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4079
     * @tc.name      testSimpleKeyboardHardKey4079
     * @tc.desc      Checks hard key mapping for code 4039, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4079 begin');
      const actual: string = getHardKeyValue(4039, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4079 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4080
     * @tc.name      testSimpleKeyboardHardKey4080
     * @tc.desc      Checks hard key mapping for code 4039, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4080 begin');
      const actual: string = getHardKeyValue(4039, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4080 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4081
     * @tc.name      testSimpleKeyboardHardKey4081
     * @tc.desc      Checks hard key mapping for code 4040, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4081 begin');
      const actual: string = getHardKeyValue(4040, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4081 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4082
     * @tc.name      testSimpleKeyboardHardKey4082
     * @tc.desc      Checks hard key mapping for code 4040, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4082 begin');
      const actual: string = getHardKeyValue(4040, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4082 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4083
     * @tc.name      testSimpleKeyboardHardKey4083
     * @tc.desc      Checks hard key mapping for code 4041, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4083 begin');
      const actual: string = getHardKeyValue(4041, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4083 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4084
     * @tc.name      testSimpleKeyboardHardKey4084
     * @tc.desc      Checks hard key mapping for code 4041, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4084 begin');
      const actual: string = getHardKeyValue(4041, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4084 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4085
     * @tc.name      testSimpleKeyboardHardKey4085
     * @tc.desc      Checks hard key mapping for code 4042, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4085 begin');
      const actual: string = getHardKeyValue(4042, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4085 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4086
     * @tc.name      testSimpleKeyboardHardKey4086
     * @tc.desc      Checks hard key mapping for code 4042, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4086 begin');
      const actual: string = getHardKeyValue(4042, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4086 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4087
     * @tc.name      testSimpleKeyboardHardKey4087
     * @tc.desc      Checks hard key mapping for code 4043, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4087 begin');
      const actual: string = getHardKeyValue(4043, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4087 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4088
     * @tc.name      testSimpleKeyboardHardKey4088
     * @tc.desc      Checks hard key mapping for code 4043, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4088 begin');
      const actual: string = getHardKeyValue(4043, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4088 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4089
     * @tc.name      testSimpleKeyboardHardKey4089
     * @tc.desc      Checks hard key mapping for code 4044, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4089 begin');
      const actual: string = getHardKeyValue(4044, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4089 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4090
     * @tc.name      testSimpleKeyboardHardKey4090
     * @tc.desc      Checks hard key mapping for code 4044, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4090 begin');
      const actual: string = getHardKeyValue(4044, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4090 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4091
     * @tc.name      testSimpleKeyboardHardKey4091
     * @tc.desc      Checks hard key mapping for code 4045, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4091 begin');
      const actual: string = getHardKeyValue(4045, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4091 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4092
     * @tc.name      testSimpleKeyboardHardKey4092
     * @tc.desc      Checks hard key mapping for code 4045, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4092 begin');
      const actual: string = getHardKeyValue(4045, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4092 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4093
     * @tc.name      testSimpleKeyboardHardKey4093
     * @tc.desc      Checks hard key mapping for code 4046, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4093 begin');
      const actual: string = getHardKeyValue(4046, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4093 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4094
     * @tc.name      testSimpleKeyboardHardKey4094
     * @tc.desc      Checks hard key mapping for code 4046, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4094 begin');
      const actual: string = getHardKeyValue(4046, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4094 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4095
     * @tc.name      testSimpleKeyboardHardKey4095
     * @tc.desc      Checks hard key mapping for code 4047, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4095 begin');
      const actual: string = getHardKeyValue(4047, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4095 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4096
     * @tc.name      testSimpleKeyboardHardKey4096
     * @tc.desc      Checks hard key mapping for code 4047, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4096 begin');
      const actual: string = getHardKeyValue(4047, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4096 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4097
     * @tc.name      testSimpleKeyboardHardKey4097
     * @tc.desc      Checks hard key mapping for code 4048, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4097 begin');
      const actual: string = getHardKeyValue(4048, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4097 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4098
     * @tc.name      testSimpleKeyboardHardKey4098
     * @tc.desc      Checks hard key mapping for code 4048, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4098 begin');
      const actual: string = getHardKeyValue(4048, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4098 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4099
     * @tc.name      testSimpleKeyboardHardKey4099
     * @tc.desc      Checks hard key mapping for code 4049, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4099 begin');
      const actual: string = getHardKeyValue(4049, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4099 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4100
     * @tc.name      testSimpleKeyboardHardKey4100
     * @tc.desc      Checks hard key mapping for code 4049, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4100 begin');
      const actual: string = getHardKeyValue(4049, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4100 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4101
     * @tc.name      testSimpleKeyboardHardKey4101
     * @tc.desc      Checks hard key mapping for code 4050, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4101 begin');
      const actual: string = getHardKeyValue(4050, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4101 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4102
     * @tc.name      testSimpleKeyboardHardKey4102
     * @tc.desc      Checks hard key mapping for code 4050, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4102 begin');
      const actual: string = getHardKeyValue(4050, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4102 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4103
     * @tc.name      testSimpleKeyboardHardKey4103
     * @tc.desc      Checks hard key mapping for code 4051, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4103 begin');
      const actual: string = getHardKeyValue(4051, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4103 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4104
     * @tc.name      testSimpleKeyboardHardKey4104
     * @tc.desc      Checks hard key mapping for code 4051, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4104 begin');
      const actual: string = getHardKeyValue(4051, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4104 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4105
     * @tc.name      testSimpleKeyboardHardKey4105
     * @tc.desc      Checks hard key mapping for code 4052, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4105 begin');
      const actual: string = getHardKeyValue(4052, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4105 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4106
     * @tc.name      testSimpleKeyboardHardKey4106
     * @tc.desc      Checks hard key mapping for code 4052, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4106 begin');
      const actual: string = getHardKeyValue(4052, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4106 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4107
     * @tc.name      testSimpleKeyboardHardKey4107
     * @tc.desc      Checks hard key mapping for code 4053, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4107 begin');
      const actual: string = getHardKeyValue(4053, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4107 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4108
     * @tc.name      testSimpleKeyboardHardKey4108
     * @tc.desc      Checks hard key mapping for code 4053, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4108 begin');
      const actual: string = getHardKeyValue(4053, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4108 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4109
     * @tc.name      testSimpleKeyboardHardKey4109
     * @tc.desc      Checks hard key mapping for code 4054, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4109 begin');
      const actual: string = getHardKeyValue(4054, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4109 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4110
     * @tc.name      testSimpleKeyboardHardKey4110
     * @tc.desc      Checks hard key mapping for code 4054, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4110 begin');
      const actual: string = getHardKeyValue(4054, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4110 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4111
     * @tc.name      testSimpleKeyboardHardKey4111
     * @tc.desc      Checks hard key mapping for code 4055, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4111 begin');
      const actual: string = getHardKeyValue(4055, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4111 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4112
     * @tc.name      testSimpleKeyboardHardKey4112
     * @tc.desc      Checks hard key mapping for code 4055, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4112 begin');
      const actual: string = getHardKeyValue(4055, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4112 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4113
     * @tc.name      testSimpleKeyboardHardKey4113
     * @tc.desc      Checks hard key mapping for code 4056, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4113 begin');
      const actual: string = getHardKeyValue(4056, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4113 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4114
     * @tc.name      testSimpleKeyboardHardKey4114
     * @tc.desc      Checks hard key mapping for code 4056, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4114 begin');
      const actual: string = getHardKeyValue(4056, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4114 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4115
     * @tc.name      testSimpleKeyboardHardKey4115
     * @tc.desc      Checks hard key mapping for code 4057, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4115 begin');
      const actual: string = getHardKeyValue(4057, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4115 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4116
     * @tc.name      testSimpleKeyboardHardKey4116
     * @tc.desc      Checks hard key mapping for code 4057, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4116 begin');
      const actual: string = getHardKeyValue(4057, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4116 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4117
     * @tc.name      testSimpleKeyboardHardKey4117
     * @tc.desc      Checks hard key mapping for code 4058, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4117 begin');
      const actual: string = getHardKeyValue(4058, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4117 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4118
     * @tc.name      testSimpleKeyboardHardKey4118
     * @tc.desc      Checks hard key mapping for code 4058, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4118 begin');
      const actual: string = getHardKeyValue(4058, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4118 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4119
     * @tc.name      testSimpleKeyboardHardKey4119
     * @tc.desc      Checks hard key mapping for code 4059, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4119 begin');
      const actual: string = getHardKeyValue(4059, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4119 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4120
     * @tc.name      testSimpleKeyboardHardKey4120
     * @tc.desc      Checks hard key mapping for code 4059, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4120 begin');
      const actual: string = getHardKeyValue(4059, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4120 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4121
     * @tc.name      testSimpleKeyboardHardKey4121
     * @tc.desc      Checks hard key mapping for code 4060, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4121 begin');
      const actual: string = getHardKeyValue(4060, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4121 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4122
     * @tc.name      testSimpleKeyboardHardKey4122
     * @tc.desc      Checks hard key mapping for code 4060, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4122 begin');
      const actual: string = getHardKeyValue(4060, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4122 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4123
     * @tc.name      testSimpleKeyboardHardKey4123
     * @tc.desc      Checks hard key mapping for code 4061, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4123 begin');
      const actual: string = getHardKeyValue(4061, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4123 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4124
     * @tc.name      testSimpleKeyboardHardKey4124
     * @tc.desc      Checks hard key mapping for code 4061, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4124 begin');
      const actual: string = getHardKeyValue(4061, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4124 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4125
     * @tc.name      testSimpleKeyboardHardKey4125
     * @tc.desc      Checks hard key mapping for code 4062, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4125 begin');
      const actual: string = getHardKeyValue(4062, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4125 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4126
     * @tc.name      testSimpleKeyboardHardKey4126
     * @tc.desc      Checks hard key mapping for code 4062, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4126 begin');
      const actual: string = getHardKeyValue(4062, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4126 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4127
     * @tc.name      testSimpleKeyboardHardKey4127
     * @tc.desc      Checks hard key mapping for code 4063, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4127 begin');
      const actual: string = getHardKeyValue(4063, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4127 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_4128
     * @tc.name      testSimpleKeyboardHardKey4128
     * @tc.desc      Checks hard key mapping for code 4063, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey4128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4128 begin');
      const actual: string = getHardKeyValue(4063, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey4128 end');
    })
  })
}
