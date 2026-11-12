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
import { KeyboardController } from '../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KeyboardControllerKeyEvents]';

export default function KeyboardControllerKeyEventsCoreTest(): void {
  describe('KeyboardControllerKeyEventsCoreTest', () => {
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0001
     * @tc.name      testKeyboardControllerKeyEvent0001
     * @tc.desc      onKeyDown for code 2000 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0001 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2000, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2000, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0001 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0002
     * @tc.name      testKeyboardControllerKeyEvent0002
     * @tc.desc      onKeyDown for code 2001 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0002 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2001, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2001, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0002 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0003
     * @tc.name      testKeyboardControllerKeyEvent0003
     * @tc.desc      onKeyDown for code 2002 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0003 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2002, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2002, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0003 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0004
     * @tc.name      testKeyboardControllerKeyEvent0004
     * @tc.desc      onKeyDown for code 2003 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0004 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2003, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2003, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0004 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0005
     * @tc.name      testKeyboardControllerKeyEvent0005
     * @tc.desc      onKeyDown for code 2004 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0005 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2004, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2004, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0005 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0006
     * @tc.name      testKeyboardControllerKeyEvent0006
     * @tc.desc      onKeyDown for code 2005 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0006 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2005, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2005, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0006 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0007
     * @tc.name      testKeyboardControllerKeyEvent0007
     * @tc.desc      onKeyDown for code 2006 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0007 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2006, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2006, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0007 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0008
     * @tc.name      testKeyboardControllerKeyEvent0008
     * @tc.desc      onKeyDown for code 2007 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0008 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2007, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2007, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0008 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0009
     * @tc.name      testKeyboardControllerKeyEvent0009
     * @tc.desc      onKeyDown for code 2008 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0009 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2008, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2008, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0009 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0010
     * @tc.name      testKeyboardControllerKeyEvent0010
     * @tc.desc      onKeyDown for code 2009 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0010 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2009, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2009, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0010 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0011
     * @tc.name      testKeyboardControllerKeyEvent0011
     * @tc.desc      onKeyDown for code 2010 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0011 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2010, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2010, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0011 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0012
     * @tc.name      testKeyboardControllerKeyEvent0012
     * @tc.desc      onKeyDown for code 2011 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0012 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2011, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2011, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0012 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0013
     * @tc.name      testKeyboardControllerKeyEvent0013
     * @tc.desc      onKeyDown for code 2012 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0013 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2012, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2012, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0013 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0014
     * @tc.name      testKeyboardControllerKeyEvent0014
     * @tc.desc      onKeyDown for code 2013 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0014 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2013, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2013, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0014 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0015
     * @tc.name      testKeyboardControllerKeyEvent0015
     * @tc.desc      onKeyDown for code 2014 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0015 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2014, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2014, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0015 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0016
     * @tc.name      testKeyboardControllerKeyEvent0016
     * @tc.desc      onKeyDown for code 2015 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0016 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2015, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2015, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0016 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0017
     * @tc.name      testKeyboardControllerKeyEvent0017
     * @tc.desc      onKeyDown for code 2016 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0017 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2016, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2016, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0017 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0018
     * @tc.name      testKeyboardControllerKeyEvent0018
     * @tc.desc      onKeyDown for code 2017 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0018 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2017, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2017, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0018 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0019
     * @tc.name      testKeyboardControllerKeyEvent0019
     * @tc.desc      onKeyDown for code 2018 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0019 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2018, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2018, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0019 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0020
     * @tc.name      testKeyboardControllerKeyEvent0020
     * @tc.desc      onKeyDown for code 2019 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0020 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2019, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2019, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0020 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0021
     * @tc.name      testKeyboardControllerKeyEvent0021
     * @tc.desc      onKeyDown for code 2020 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0021 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2020, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2020, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0021 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0022
     * @tc.name      testKeyboardControllerKeyEvent0022
     * @tc.desc      onKeyDown for code 2021 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0022 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2021, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2021, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0022 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0023
     * @tc.name      testKeyboardControllerKeyEvent0023
     * @tc.desc      onKeyDown for code 2022 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0023 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2022, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2022, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0023 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0024
     * @tc.name      testKeyboardControllerKeyEvent0024
     * @tc.desc      onKeyDown for code 2023 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0024 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2023, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2023, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0024 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0025
     * @tc.name      testKeyboardControllerKeyEvent0025
     * @tc.desc      onKeyDown for code 2024 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0025 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2024, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2024, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0025 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0026
     * @tc.name      testKeyboardControllerKeyEvent0026
     * @tc.desc      onKeyDown for code 2025 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0026 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2025, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2025, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0026 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0027
     * @tc.name      testKeyboardControllerKeyEvent0027
     * @tc.desc      onKeyDown for code 2026 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0027 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2026, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2026, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0027 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0028
     * @tc.name      testKeyboardControllerKeyEvent0028
     * @tc.desc      onKeyDown for code 2027 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0028 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2027, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2027, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0028 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0029
     * @tc.name      testKeyboardControllerKeyEvent0029
     * @tc.desc      onKeyDown for code 2028 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0029 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2028, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2028, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0029 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0030
     * @tc.name      testKeyboardControllerKeyEvent0030
     * @tc.desc      onKeyDown for code 2029 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0030 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2029, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2029, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0030 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0031
     * @tc.name      testKeyboardControllerKeyEvent0031
     * @tc.desc      onKeyDown for code 2030 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0031 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2030, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2030, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0031 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0032
     * @tc.name      testKeyboardControllerKeyEvent0032
     * @tc.desc      onKeyDown for code 2031 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0032 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2031, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2031, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0032 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0033
     * @tc.name      testKeyboardControllerKeyEvent0033
     * @tc.desc      onKeyDown for code 2032 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0033 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2032, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2032, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0033 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0034
     * @tc.name      testKeyboardControllerKeyEvent0034
     * @tc.desc      onKeyDown for code 2033 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0034 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2033, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2033, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0034 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0035
     * @tc.name      testKeyboardControllerKeyEvent0035
     * @tc.desc      onKeyDown for code 2034 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0035 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2034, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2034, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0035 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0036
     * @tc.name      testKeyboardControllerKeyEvent0036
     * @tc.desc      onKeyDown for code 2035 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0036 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2035, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2035, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0036 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0037
     * @tc.name      testKeyboardControllerKeyEvent0037
     * @tc.desc      onKeyDown for code 2036 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0037 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2036, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2036, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0037 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0038
     * @tc.name      testKeyboardControllerKeyEvent0038
     * @tc.desc      onKeyDown for code 2037 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0038 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2037, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2037, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0038 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0039
     * @tc.name      testKeyboardControllerKeyEvent0039
     * @tc.desc      onKeyDown for code 2038 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0039 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2038, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2038, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0039 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0040
     * @tc.name      testKeyboardControllerKeyEvent0040
     * @tc.desc      onKeyDown for code 2039 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0040 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2039, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2039, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0040 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0041
     * @tc.name      testKeyboardControllerKeyEvent0041
     * @tc.desc      onKeyDown for code 2040 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0041 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2040, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2040, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0041 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0042
     * @tc.name      testKeyboardControllerKeyEvent0042
     * @tc.desc      onKeyDown for code 2041 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0042 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2041, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2041, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0042 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0043
     * @tc.name      testKeyboardControllerKeyEvent0043
     * @tc.desc      onKeyDown for code 2042 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0043 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2042, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2042, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0043 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0044
     * @tc.name      testKeyboardControllerKeyEvent0044
     * @tc.desc      onKeyDown for code 2043 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0044 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2043, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2043, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0044 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0045
     * @tc.name      testKeyboardControllerKeyEvent0045
     * @tc.desc      onKeyDown for code 2044 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0045 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2044, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2044, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0045 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0046
     * @tc.name      testKeyboardControllerKeyEvent0046
     * @tc.desc      onKeyDown for code 2045 returns false and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0046 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2045, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2045, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0046 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0047
     * @tc.name      testKeyboardControllerKeyEvent0047
     * @tc.desc      onKeyDown for code 2046 returns false and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0047 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2046, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2046, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0047 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0048
     * @tc.name      testKeyboardControllerKeyEvent0048
     * @tc.desc      onKeyDown for code 2047 returns false and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0048 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2047, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2047, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0048 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0049
     * @tc.name      testKeyboardControllerKeyEvent0049
     * @tc.desc      onKeyDown for code 2048 returns false and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0049 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2048, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2048, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0049 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0050
     * @tc.name      testKeyboardControllerKeyEvent0050
     * @tc.desc      onKeyDown for code 2049 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0050 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2049, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2049, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0050 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0051
     * @tc.name      testKeyboardControllerKeyEvent0051
     * @tc.desc      onKeyDown for code 2050 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0051 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2050, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2050, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0051 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0052
     * @tc.name      testKeyboardControllerKeyEvent0052
     * @tc.desc      onKeyDown for code 2051 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0052 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2051, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2051, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0052 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0053
     * @tc.name      testKeyboardControllerKeyEvent0053
     * @tc.desc      onKeyDown for code 2052 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0053 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2052, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2052, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0053 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0054
     * @tc.name      testKeyboardControllerKeyEvent0054
     * @tc.desc      onKeyDown for code 2053 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0054 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2053, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2053, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0054 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0055
     * @tc.name      testKeyboardControllerKeyEvent0055
     * @tc.desc      onKeyDown for code 2054 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0055 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2054, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2054, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0055 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0056
     * @tc.name      testKeyboardControllerKeyEvent0056
     * @tc.desc      onKeyDown for code 2055 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0056 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2055, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2055, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0056 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0057
     * @tc.name      testKeyboardControllerKeyEvent0057
     * @tc.desc      onKeyDown for code 2056 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0057 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2056, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2056, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0057 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0058
     * @tc.name      testKeyboardControllerKeyEvent0058
     * @tc.desc      onKeyDown for code 2057 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0058 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2057, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2057, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0058 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0059
     * @tc.name      testKeyboardControllerKeyEvent0059
     * @tc.desc      onKeyDown for code 2058 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0059 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2058, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2058, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0059 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0060
     * @tc.name      testKeyboardControllerKeyEvent0060
     * @tc.desc      onKeyDown for code 2059 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0060 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2059, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2059, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0060 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0061
     * @tc.name      testKeyboardControllerKeyEvent0061
     * @tc.desc      onKeyDown for code 2060 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0061 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2060, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2060, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0061 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0062
     * @tc.name      testKeyboardControllerKeyEvent0062
     * @tc.desc      onKeyDown for code 2061 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0062 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2061, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2061, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0062 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0063
     * @tc.name      testKeyboardControllerKeyEvent0063
     * @tc.desc      onKeyDown for code 2062 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0063 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2062, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2062, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0063 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0064
     * @tc.name      testKeyboardControllerKeyEvent0064
     * @tc.desc      onKeyDown for code 2063 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0064 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2063, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2063, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0064 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0065
     * @tc.name      testKeyboardControllerKeyEvent0065
     * @tc.desc      onKeyDown for code 2064 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0065 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2064, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2064, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0065 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0066
     * @tc.name      testKeyboardControllerKeyEvent0066
     * @tc.desc      onKeyDown for code 2065 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0066 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2065, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2065, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0066 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0067
     * @tc.name      testKeyboardControllerKeyEvent0067
     * @tc.desc      onKeyDown for code 2066 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0067 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2066, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2066, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0067 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0068
     * @tc.name      testKeyboardControllerKeyEvent0068
     * @tc.desc      onKeyDown for code 2067 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0068 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2067, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2067, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0068 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0069
     * @tc.name      testKeyboardControllerKeyEvent0069
     * @tc.desc      onKeyDown for code 2068 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0069 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2068, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2068, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0069 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0070
     * @tc.name      testKeyboardControllerKeyEvent0070
     * @tc.desc      onKeyDown for code 2069 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0070 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2069, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2069, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0070 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0071
     * @tc.name      testKeyboardControllerKeyEvent0071
     * @tc.desc      onKeyDown for code 2070 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0071 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2070, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2070, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0071 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0072
     * @tc.name      testKeyboardControllerKeyEvent0072
     * @tc.desc      onKeyDown for code 2071 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0072 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2071, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2071, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0072 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0073
     * @tc.name      testKeyboardControllerKeyEvent0073
     * @tc.desc      onKeyDown for code 2072 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0073 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2072, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2072, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0073 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0074
     * @tc.name      testKeyboardControllerKeyEvent0074
     * @tc.desc      onKeyDown for code 2073 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0074 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2073, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2073, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0074 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0075
     * @tc.name      testKeyboardControllerKeyEvent0075
     * @tc.desc      onKeyDown for code 2074 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0075 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2074, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2074, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0075 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0076
     * @tc.name      testKeyboardControllerKeyEvent0076
     * @tc.desc      onKeyDown for code 2075 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0076 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2075, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2075, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0076 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0077
     * @tc.name      testKeyboardControllerKeyEvent0077
     * @tc.desc      onKeyDown for code 2076 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0077 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2076, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2076, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0077 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0078
     * @tc.name      testKeyboardControllerKeyEvent0078
     * @tc.desc      onKeyDown for code 2077 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0078 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2077, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2077, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0078 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0079
     * @tc.name      testKeyboardControllerKeyEvent0079
     * @tc.desc      onKeyDown for code 2078 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0079 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2078, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2078, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0079 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0080
     * @tc.name      testKeyboardControllerKeyEvent0080
     * @tc.desc      onKeyDown for code 2079 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0080 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2079, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2079, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0080 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0081
     * @tc.name      testKeyboardControllerKeyEvent0081
     * @tc.desc      onKeyDown for code 2080 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0081 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2080, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2080, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0081 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0082
     * @tc.name      testKeyboardControllerKeyEvent0082
     * @tc.desc      onKeyDown for code 2081 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0082 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2081, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2081, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0082 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0083
     * @tc.name      testKeyboardControllerKeyEvent0083
     * @tc.desc      onKeyDown for code 2082 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0083 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2082, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2082, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0083 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0084
     * @tc.name      testKeyboardControllerKeyEvent0084
     * @tc.desc      onKeyDown for code 2083 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0084 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2083, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2083, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0084 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0085
     * @tc.name      testKeyboardControllerKeyEvent0085
     * @tc.desc      onKeyDown for code 2084 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0085 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2084, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2084, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0085 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0086
     * @tc.name      testKeyboardControllerKeyEvent0086
     * @tc.desc      onKeyDown for code 2085 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0086 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2085, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2085, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0086 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0087
     * @tc.name      testKeyboardControllerKeyEvent0087
     * @tc.desc      onKeyDown for code 2086 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0087 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2086, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2086, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0087 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0088
     * @tc.name      testKeyboardControllerKeyEvent0088
     * @tc.desc      onKeyDown for code 2087 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0088 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2087, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2087, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0088 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0089
     * @tc.name      testKeyboardControllerKeyEvent0089
     * @tc.desc      onKeyDown for code 2088 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0089 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2088, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2088, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0089 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0090
     * @tc.name      testKeyboardControllerKeyEvent0090
     * @tc.desc      onKeyDown for code 2089 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0090 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2089, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2089, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0090 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0091
     * @tc.name      testKeyboardControllerKeyEvent0091
     * @tc.desc      onKeyDown for code 2090 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0091 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2090, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2090, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0091 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0092
     * @tc.name      testKeyboardControllerKeyEvent0092
     * @tc.desc      onKeyDown for code 2091 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0092 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2091, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2091, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0092 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0093
     * @tc.name      testKeyboardControllerKeyEvent0093
     * @tc.desc      onKeyDown for code 2092 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0093 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2092, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2092, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0093 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0094
     * @tc.name      testKeyboardControllerKeyEvent0094
     * @tc.desc      onKeyDown for code 2093 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0094 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2093, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2093, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0094 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0095
     * @tc.name      testKeyboardControllerKeyEvent0095
     * @tc.desc      onKeyDown for code 2094 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0095 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2094, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2094, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0095 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0096
     * @tc.name      testKeyboardControllerKeyEvent0096
     * @tc.desc      onKeyDown for code 2095 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0096 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2095, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2095, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0096 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0097
     * @tc.name      testKeyboardControllerKeyEvent0097
     * @tc.desc      onKeyDown for code 2096 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0097 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2096, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2096, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0097 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0098
     * @tc.name      testKeyboardControllerKeyEvent0098
     * @tc.desc      onKeyDown for code 2097 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0098 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2097, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2097, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0098 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0099
     * @tc.name      testKeyboardControllerKeyEvent0099
     * @tc.desc      onKeyDown for code 2098 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0099 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2098, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2098, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0099 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0100
     * @tc.name      testKeyboardControllerKeyEvent0100
     * @tc.desc      onKeyDown for code 2099 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0100 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2099, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2099, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0100 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0101
     * @tc.name      testKeyboardControllerKeyEvent0101
     * @tc.desc      onKeyDown for code 2100 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0101 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2100, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2100, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0101 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0102
     * @tc.name      testKeyboardControllerKeyEvent0102
     * @tc.desc      onKeyDown for code 2101 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0102 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2101, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2101, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0102 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0103
     * @tc.name      testKeyboardControllerKeyEvent0103
     * @tc.desc      onKeyDown for code 2102 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0103 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2102, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2102, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0103 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0104
     * @tc.name      testKeyboardControllerKeyEvent0104
     * @tc.desc      onKeyDown for code 2103 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0104 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2103, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2103, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0104 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0105
     * @tc.name      testKeyboardControllerKeyEvent0105
     * @tc.desc      onKeyDown for code 2104 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0105 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2104, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2104, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0105 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0106
     * @tc.name      testKeyboardControllerKeyEvent0106
     * @tc.desc      onKeyDown for code 2105 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0106 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2105, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2105, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0106 end');
    })
  })
}
