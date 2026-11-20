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
import { KeyCode } from '@kit.InputKit';
import { KeyboardController } from '../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KeyboardControllerRanges]';

export default function KeyboardControllerRangesCoreTest(): void {
  describe('KeyboardControllerRangesCoreTest', () => {
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0001
     * @tc.name      testKeyboardControllerRange0001
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 1990.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0001 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 1990 >= KeyCode.KEYCODE_A && 1990 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(1990)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(1990)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0001 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0002
     * @tc.name      testKeyboardControllerRange0002
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 1991.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0002 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 1991 >= KeyCode.KEYCODE_A && 1991 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(1991)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(1991)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0002 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0003
     * @tc.name      testKeyboardControllerRange0003
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 1992.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0003 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 1992 >= KeyCode.KEYCODE_A && 1992 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(1992)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(1992)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0003 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0004
     * @tc.name      testKeyboardControllerRange0004
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 1993.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0004 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 1993 >= KeyCode.KEYCODE_A && 1993 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(1993)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(1993)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0004 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0005
     * @tc.name      testKeyboardControllerRange0005
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 1994.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0005 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 1994 >= KeyCode.KEYCODE_A && 1994 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(1994)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(1994)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0005 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0006
     * @tc.name      testKeyboardControllerRange0006
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 1995.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0006 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 1995 >= KeyCode.KEYCODE_A && 1995 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(1995)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(1995)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0006 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0007
     * @tc.name      testKeyboardControllerRange0007
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 1996.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0007 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 1996 >= KeyCode.KEYCODE_A && 1996 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(1996)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(1996)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0007 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0008
     * @tc.name      testKeyboardControllerRange0008
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 1997.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0008 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 1997 >= KeyCode.KEYCODE_A && 1997 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(1997)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(1997)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0008 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0009
     * @tc.name      testKeyboardControllerRange0009
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 1998.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0009 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 1998 >= KeyCode.KEYCODE_A && 1998 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(1998)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(1998)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0009 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0010
     * @tc.name      testKeyboardControllerRange0010
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 1999.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0010 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 1999 >= KeyCode.KEYCODE_A && 1999 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(1999)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(1999)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0010 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0011
     * @tc.name      testKeyboardControllerRange0011
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0011 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2000 >= KeyCode.KEYCODE_A && 2000 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2000)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2000)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0011 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0012
     * @tc.name      testKeyboardControllerRange0012
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2001.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0012 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2001 >= KeyCode.KEYCODE_A && 2001 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2001)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2001)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0012 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0013
     * @tc.name      testKeyboardControllerRange0013
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2002.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0013 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2002 >= KeyCode.KEYCODE_A && 2002 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2002)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2002)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0013 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0014
     * @tc.name      testKeyboardControllerRange0014
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0014 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2003 >= KeyCode.KEYCODE_A && 2003 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2003)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2003)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0014 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0015
     * @tc.name      testKeyboardControllerRange0015
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2004.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0015 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2004 >= KeyCode.KEYCODE_A && 2004 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2004)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2004)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0015 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0016
     * @tc.name      testKeyboardControllerRange0016
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2005.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0016 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2005 >= KeyCode.KEYCODE_A && 2005 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2005)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2005)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0016 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0017
     * @tc.name      testKeyboardControllerRange0017
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2006.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0017 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2006 >= KeyCode.KEYCODE_A && 2006 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2006)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2006)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0017 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0018
     * @tc.name      testKeyboardControllerRange0018
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2007.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0018 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2007 >= KeyCode.KEYCODE_A && 2007 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2007)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2007)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0018 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0019
     * @tc.name      testKeyboardControllerRange0019
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2008.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0019 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2008 >= KeyCode.KEYCODE_A && 2008 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2008)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2008)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0019 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0020
     * @tc.name      testKeyboardControllerRange0020
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2009.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0020 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2009 >= KeyCode.KEYCODE_A && 2009 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2009)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2009)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0020 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0021
     * @tc.name      testKeyboardControllerRange0021
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2010.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0021 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2010 >= KeyCode.KEYCODE_A && 2010 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2010)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2010)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0021 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0022
     * @tc.name      testKeyboardControllerRange0022
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2011.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0022 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2011 >= KeyCode.KEYCODE_A && 2011 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2011)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2011)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0022 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0023
     * @tc.name      testKeyboardControllerRange0023
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2012.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0023 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2012 >= KeyCode.KEYCODE_A && 2012 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2012)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2012)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0023 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0024
     * @tc.name      testKeyboardControllerRange0024
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2013.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0024 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2013 >= KeyCode.KEYCODE_A && 2013 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2013)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2013)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0024 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0025
     * @tc.name      testKeyboardControllerRange0025
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2014.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0025 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2014 >= KeyCode.KEYCODE_A && 2014 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2014)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2014)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0025 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0026
     * @tc.name      testKeyboardControllerRange0026
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2015.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0026 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2015 >= KeyCode.KEYCODE_A && 2015 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2015)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2015)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0026 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0027
     * @tc.name      testKeyboardControllerRange0027
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2016.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0027 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2016 >= KeyCode.KEYCODE_A && 2016 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2016)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2016)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0027 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0028
     * @tc.name      testKeyboardControllerRange0028
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2017.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0028 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2017 >= KeyCode.KEYCODE_A && 2017 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2017)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2017)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0028 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0029
     * @tc.name      testKeyboardControllerRange0029
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2018.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0029 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2018 >= KeyCode.KEYCODE_A && 2018 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2018)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2018)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0029 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0030
     * @tc.name      testKeyboardControllerRange0030
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2019.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0030 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2019 >= KeyCode.KEYCODE_A && 2019 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2019)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2019)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0030 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0031
     * @tc.name      testKeyboardControllerRange0031
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2020.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0031 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2020 >= KeyCode.KEYCODE_A && 2020 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2020)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2020)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0031 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0032
     * @tc.name      testKeyboardControllerRange0032
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2021.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0032 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2021 >= KeyCode.KEYCODE_A && 2021 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2021)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2021)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0032 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0033
     * @tc.name      testKeyboardControllerRange0033
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2022.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0033 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2022 >= KeyCode.KEYCODE_A && 2022 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2022)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2022)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0033 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0034
     * @tc.name      testKeyboardControllerRange0034
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2023.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0034 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2023 >= KeyCode.KEYCODE_A && 2023 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2023)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2023)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0034 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0035
     * @tc.name      testKeyboardControllerRange0035
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0035 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2024 >= KeyCode.KEYCODE_A && 2024 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2024)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2024)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0035 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0036
     * @tc.name      testKeyboardControllerRange0036
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2025.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0036 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2025 >= KeyCode.KEYCODE_A && 2025 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2025)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2025)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0036 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0037
     * @tc.name      testKeyboardControllerRange0037
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2026.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0037 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2026 >= KeyCode.KEYCODE_A && 2026 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2026)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2026)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0037 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0038
     * @tc.name      testKeyboardControllerRange0038
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2027.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0038 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2027 >= KeyCode.KEYCODE_A && 2027 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2027)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2027)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0038 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0039
     * @tc.name      testKeyboardControllerRange0039
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2028.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0039 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2028 >= KeyCode.KEYCODE_A && 2028 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2028)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2028)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0039 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0040
     * @tc.name      testKeyboardControllerRange0040
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2029.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0040 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2029 >= KeyCode.KEYCODE_A && 2029 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2029)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2029)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0040 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0041
     * @tc.name      testKeyboardControllerRange0041
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2030.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0041 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2030 >= KeyCode.KEYCODE_A && 2030 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2030)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2030)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0041 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0042
     * @tc.name      testKeyboardControllerRange0042
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2031.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0042 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2031 >= KeyCode.KEYCODE_A && 2031 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2031)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2031)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0042 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0043
     * @tc.name      testKeyboardControllerRange0043
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2032.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0043 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2032 >= KeyCode.KEYCODE_A && 2032 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2032)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2032)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0043 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0044
     * @tc.name      testKeyboardControllerRange0044
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2033.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0044 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2033 >= KeyCode.KEYCODE_A && 2033 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2033)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2033)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0044 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0045
     * @tc.name      testKeyboardControllerRange0045
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2034.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0045 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2034 >= KeyCode.KEYCODE_A && 2034 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2034)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2034)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0045 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0046
     * @tc.name      testKeyboardControllerRange0046
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2035.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0046 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2035 >= KeyCode.KEYCODE_A && 2035 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2035)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2035)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0046 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0047
     * @tc.name      testKeyboardControllerRange0047
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2036.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0047 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2036 >= KeyCode.KEYCODE_A && 2036 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2036)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2036)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0047 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0048
     * @tc.name      testKeyboardControllerRange0048
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2037.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0048 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2037 >= KeyCode.KEYCODE_A && 2037 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2037)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2037)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0048 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0049
     * @tc.name      testKeyboardControllerRange0049
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2038.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0049 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2038 >= KeyCode.KEYCODE_A && 2038 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2038)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2038)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0049 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0050
     * @tc.name      testKeyboardControllerRange0050
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2039.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0050 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2039 >= KeyCode.KEYCODE_A && 2039 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2039)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2039)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0050 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0051
     * @tc.name      testKeyboardControllerRange0051
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2040.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0051 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2040 >= KeyCode.KEYCODE_A && 2040 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2040)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2040)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0051 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0052
     * @tc.name      testKeyboardControllerRange0052
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2041.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0052 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2041 >= KeyCode.KEYCODE_A && 2041 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2041)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2041)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0052 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0053
     * @tc.name      testKeyboardControllerRange0053
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2042.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0053 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2042 >= KeyCode.KEYCODE_A && 2042 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2042)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2042)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0053 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0054
     * @tc.name      testKeyboardControllerRange0054
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2043.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0054 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2043 >= KeyCode.KEYCODE_A && 2043 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2043)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2043)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0054 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0055
     * @tc.name      testKeyboardControllerRange0055
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2044.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0055 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2044 >= KeyCode.KEYCODE_A && 2044 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2044)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2044)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0055 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0056
     * @tc.name      testKeyboardControllerRange0056
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2045.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0056 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2045 >= KeyCode.KEYCODE_A && 2045 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2045)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2045)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0056 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0057
     * @tc.name      testKeyboardControllerRange0057
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2046.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0057 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2046 >= KeyCode.KEYCODE_A && 2046 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2046)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2046)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0057 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0058
     * @tc.name      testKeyboardControllerRange0058
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2047.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0058 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2047 >= KeyCode.KEYCODE_A && 2047 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2047)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2047)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0058 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0059
     * @tc.name      testKeyboardControllerRange0059
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2048.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0059 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2048 >= KeyCode.KEYCODE_A && 2048 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2048)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2048)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0059 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0060
     * @tc.name      testKeyboardControllerRange0060
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2049.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0060 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2049 >= KeyCode.KEYCODE_A && 2049 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2049)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2049)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0060 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0061
     * @tc.name      testKeyboardControllerRange0061
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2050.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0061 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2050 >= KeyCode.KEYCODE_A && 2050 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2050)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2050)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0061 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0062
     * @tc.name      testKeyboardControllerRange0062
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2051.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0062 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2051 >= KeyCode.KEYCODE_A && 2051 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2051)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2051)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0062 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0063
     * @tc.name      testKeyboardControllerRange0063
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2052.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0063 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2052 >= KeyCode.KEYCODE_A && 2052 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2052)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2052)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0063 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0064
     * @tc.name      testKeyboardControllerRange0064
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2053.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0064 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2053 >= KeyCode.KEYCODE_A && 2053 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2053)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2053)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0064 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0065
     * @tc.name      testKeyboardControllerRange0065
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2054.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0065 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2054 >= KeyCode.KEYCODE_A && 2054 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2054)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2054)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0065 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0066
     * @tc.name      testKeyboardControllerRange0066
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2055.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0066 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2055 >= KeyCode.KEYCODE_A && 2055 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2055)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2055)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0066 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0067
     * @tc.name      testKeyboardControllerRange0067
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2056.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0067 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2056 >= KeyCode.KEYCODE_A && 2056 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2056)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2056)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0067 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0068
     * @tc.name      testKeyboardControllerRange0068
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2057.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0068 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2057 >= KeyCode.KEYCODE_A && 2057 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2057)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2057)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0068 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0069
     * @tc.name      testKeyboardControllerRange0069
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2058.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0069 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2058 >= KeyCode.KEYCODE_A && 2058 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2058)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2058)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0069 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0070
     * @tc.name      testKeyboardControllerRange0070
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2059.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0070 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2059 >= KeyCode.KEYCODE_A && 2059 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2059)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2059)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0070 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0071
     * @tc.name      testKeyboardControllerRange0071
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2060.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0071 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2060 >= KeyCode.KEYCODE_A && 2060 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2060)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2060)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0071 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0072
     * @tc.name      testKeyboardControllerRange0072
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2061.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0072 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2061 >= KeyCode.KEYCODE_A && 2061 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2061)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2061)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0072 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0073
     * @tc.name      testKeyboardControllerRange0073
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2062.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0073 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2062 >= KeyCode.KEYCODE_A && 2062 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2062)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2062)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0073 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0074
     * @tc.name      testKeyboardControllerRange0074
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2063.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0074 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2063 >= KeyCode.KEYCODE_A && 2063 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2063)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2063)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0074 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0075
     * @tc.name      testKeyboardControllerRange0075
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2064.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0075 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2064 >= KeyCode.KEYCODE_A && 2064 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2064)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2064)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0075 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0076
     * @tc.name      testKeyboardControllerRange0076
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2065.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0076 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2065 >= KeyCode.KEYCODE_A && 2065 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2065)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2065)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0076 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0077
     * @tc.name      testKeyboardControllerRange0077
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2066.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0077 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2066 >= KeyCode.KEYCODE_A && 2066 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2066)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2066)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0077 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0078
     * @tc.name      testKeyboardControllerRange0078
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2067.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0078 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2067 >= KeyCode.KEYCODE_A && 2067 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2067)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2067)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0078 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0079
     * @tc.name      testKeyboardControllerRange0079
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2068.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0079 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2068 >= KeyCode.KEYCODE_A && 2068 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2068)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2068)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0079 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0080
     * @tc.name      testKeyboardControllerRange0080
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2069.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0080 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2069 >= KeyCode.KEYCODE_A && 2069 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2069)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2069)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0080 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0081
     * @tc.name      testKeyboardControllerRange0081
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2070.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0081 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2070 >= KeyCode.KEYCODE_A && 2070 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2070)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2070)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0081 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0082
     * @tc.name      testKeyboardControllerRange0082
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2071.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0082 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2071 >= KeyCode.KEYCODE_A && 2071 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2071)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2071)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0082 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0083
     * @tc.name      testKeyboardControllerRange0083
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2072.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0083 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2072 >= KeyCode.KEYCODE_A && 2072 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2072)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2072)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0083 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0084
     * @tc.name      testKeyboardControllerRange0084
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2073.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0084 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2073 >= KeyCode.KEYCODE_A && 2073 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2073)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2073)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0084 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0085
     * @tc.name      testKeyboardControllerRange0085
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2074.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0085 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2074 >= KeyCode.KEYCODE_A && 2074 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2074)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2074)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0085 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0086
     * @tc.name      testKeyboardControllerRange0086
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2075.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0086 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2075 >= KeyCode.KEYCODE_A && 2075 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2075)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2075)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0086 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0087
     * @tc.name      testKeyboardControllerRange0087
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2076.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0087 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2076 >= KeyCode.KEYCODE_A && 2076 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2076)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2076)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0087 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0088
     * @tc.name      testKeyboardControllerRange0088
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2077.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0088 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2077 >= KeyCode.KEYCODE_A && 2077 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2077)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2077)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0088 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0089
     * @tc.name      testKeyboardControllerRange0089
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2078.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0089 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2078 >= KeyCode.KEYCODE_A && 2078 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2078)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2078)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0089 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0090
     * @tc.name      testKeyboardControllerRange0090
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2079.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0090 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2079 >= KeyCode.KEYCODE_A && 2079 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2079)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2079)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0090 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0091
     * @tc.name      testKeyboardControllerRange0091
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0091 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2080 >= KeyCode.KEYCODE_A && 2080 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2080)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2080)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0091 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0092
     * @tc.name      testKeyboardControllerRange0092
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2081.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0092 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2081 >= KeyCode.KEYCODE_A && 2081 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2081)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2081)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0092 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0093
     * @tc.name      testKeyboardControllerRange0093
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2082.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0093 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2082 >= KeyCode.KEYCODE_A && 2082 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2082)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2082)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0093 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0094
     * @tc.name      testKeyboardControllerRange0094
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2083.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0094 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2083 >= KeyCode.KEYCODE_A && 2083 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2083)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2083)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0094 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0095
     * @tc.name      testKeyboardControllerRange0095
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2084.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0095 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2084 >= KeyCode.KEYCODE_A && 2084 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2084)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2084)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0095 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0096
     * @tc.name      testKeyboardControllerRange0096
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2085.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0096 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2085 >= KeyCode.KEYCODE_A && 2085 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2085)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2085)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0096 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0097
     * @tc.name      testKeyboardControllerRange0097
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2086.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0097 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2086 >= KeyCode.KEYCODE_A && 2086 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2086)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2086)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0097 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0098
     * @tc.name      testKeyboardControllerRange0098
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2087.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0098 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2087 >= KeyCode.KEYCODE_A && 2087 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2087)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2087)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0098 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0099
     * @tc.name      testKeyboardControllerRange0099
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2088.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0099 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2088 >= KeyCode.KEYCODE_A && 2088 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2088)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2088)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0099 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0100
     * @tc.name      testKeyboardControllerRange0100
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2089.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0100 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2089 >= KeyCode.KEYCODE_A && 2089 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2089)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2089)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0100 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0101
     * @tc.name      testKeyboardControllerRange0101
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2090.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0101 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2090 >= KeyCode.KEYCODE_A && 2090 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2090)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2090)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0101 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0102
     * @tc.name      testKeyboardControllerRange0102
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2091.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0102 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2091 >= KeyCode.KEYCODE_A && 2091 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2091)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2091)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0102 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0103
     * @tc.name      testKeyboardControllerRange0103
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2092.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0103 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2092 >= KeyCode.KEYCODE_A && 2092 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2092)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2092)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0103 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0104
     * @tc.name      testKeyboardControllerRange0104
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2093.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0104 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2093 >= KeyCode.KEYCODE_A && 2093 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2093)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2093)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0104 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0105
     * @tc.name      testKeyboardControllerRange0105
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2094.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0105 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2094 >= KeyCode.KEYCODE_A && 2094 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2094)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2094)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0105 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0106
     * @tc.name      testKeyboardControllerRange0106
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2095.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0106 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2095 >= KeyCode.KEYCODE_A && 2095 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2095)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2095)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0106 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0107
     * @tc.name      testKeyboardControllerRange0107
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2096.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0107 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2096 >= KeyCode.KEYCODE_A && 2096 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2096)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2096)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0107 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0108
     * @tc.name      testKeyboardControllerRange0108
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2097.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0108 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2097 >= KeyCode.KEYCODE_A && 2097 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2097)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2097)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0108 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0109
     * @tc.name      testKeyboardControllerRange0109
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2098.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0109 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2098 >= KeyCode.KEYCODE_A && 2098 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2098)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2098)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0109 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0110
     * @tc.name      testKeyboardControllerRange0110
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2099.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0110 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2099 >= KeyCode.KEYCODE_A && 2099 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2099)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2099)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0110 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0111
     * @tc.name      testKeyboardControllerRange0111
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0111 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2100 >= KeyCode.KEYCODE_A && 2100 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2100)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2100)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0111 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0112
     * @tc.name      testKeyboardControllerRange0112
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2101.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0112 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2101 >= KeyCode.KEYCODE_A && 2101 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2101)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2101)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0112 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0113
     * @tc.name      testKeyboardControllerRange0113
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2102.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0113 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2102 >= KeyCode.KEYCODE_A && 2102 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2102)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2102)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0113 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0114
     * @tc.name      testKeyboardControllerRange0114
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2103.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0114 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2103 >= KeyCode.KEYCODE_A && 2103 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2103)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2103)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0114 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0115
     * @tc.name      testKeyboardControllerRange0115
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2104.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0115 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2104 >= KeyCode.KEYCODE_A && 2104 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2104)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2104)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0115 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0116
     * @tc.name      testKeyboardControllerRange0116
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2105.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0116 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2105 >= KeyCode.KEYCODE_A && 2105 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2105)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2105)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0116 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0117
     * @tc.name      testKeyboardControllerRange0117
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2106.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0117 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2106 >= KeyCode.KEYCODE_A && 2106 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2106)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2106)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0117 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0118
     * @tc.name      testKeyboardControllerRange0118
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2107.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0118 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2107 >= KeyCode.KEYCODE_A && 2107 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2107)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2107)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0118 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0119
     * @tc.name      testKeyboardControllerRange0119
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2108.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0119 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2108 >= KeyCode.KEYCODE_A && 2108 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2108)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2108)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0119 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0120
     * @tc.name      testKeyboardControllerRange0120
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2109.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0120 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2109 >= KeyCode.KEYCODE_A && 2109 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2109)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2109)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0120 end');
    })
  })
}
