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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { OverlayAction, OverlayState, OverlayController } from '../../../../main/ets/service/OverlayController';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ResourceManager]';

export default function overlayCtrlSwitchTest() {
  describe('OverlayCtrlSwitchTest', () => {

    /**
     * @tc.name   testOverlayCtrlSwitch0001
     * @tc.number SUB_RESMGR_OVERLAY_01_0001
     * @tc.desc   nextStateOf('initial', 'disable', true) -> disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0001 begin');
      const result: string = OverlayController.nextStateOf('initial', 'disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('disable')), String(true));
      expect(OverlayController.isSwitchAction('disable')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0001 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0002
     * @tc.number SUB_RESMGR_OVERLAY_01_0002
     * @tc.desc   nextStateOf('initial', 'disable', false) -> initial
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0002 begin');
      const result: string = OverlayController.nextStateOf('initial', 'disable', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('initial'));
      expect(result).assertEqual('initial');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('disable')), String(true));
      expect(OverlayController.isSwitchAction('disable')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0002 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0003
     * @tc.number SUB_RESMGR_OVERLAY_01_0003
     * @tc.desc   nextStateOf('initial', 'enable', true) -> enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0003 begin');
      const result: string = OverlayController.nextStateOf('initial', 'enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enabled'));
      expect(result).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('enable')), String(true));
      expect(OverlayController.isSwitchAction('enable')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0003 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0004
     * @tc.number SUB_RESMGR_OVERLAY_01_0004
     * @tc.desc   nextStateOf('initial', 'enable', false) -> initial
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0004 begin');
      const result: string = OverlayController.nextStateOf('initial', 'enable', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('initial'));
      expect(result).assertEqual('initial');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('enable')), String(true));
      expect(OverlayController.isSwitchAction('enable')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0004 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0005
     * @tc.number SUB_RESMGR_OVERLAY_01_0005
     * @tc.desc   nextStateOf('initial', 'addResource', true) -> runtimeLoaded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0005 begin');
      const result: string = OverlayController.nextStateOf('initial', 'addResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('runtimeLoaded'));
      expect(result).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('addResource')), String(false));
      expect(OverlayController.isSwitchAction('addResource')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0005 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0006
     * @tc.number SUB_RESMGR_OVERLAY_01_0006
     * @tc.desc   nextStateOf('initial', 'addResource', false) -> initial
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0006 begin');
      const result: string = OverlayController.nextStateOf('initial', 'addResource', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('initial'));
      expect(result).assertEqual('initial');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('addResource')), String(false));
      expect(OverlayController.isSwitchAction('addResource')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0006 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0007
     * @tc.number SUB_RESMGR_OVERLAY_01_0007
     * @tc.desc   nextStateOf('initial', 'removeResource', true) -> runtimeRemoved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0007 begin');
      const result: string = OverlayController.nextStateOf('initial', 'removeResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('runtimeRemoved'));
      expect(result).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('removeResource')), String(false));
      expect(OverlayController.isSwitchAction('removeResource')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0007 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0008
     * @tc.number SUB_RESMGR_OVERLAY_01_0008
     * @tc.desc   nextStateOf('initial', 'removeResource', false) -> initial
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0008 begin');
      const result: string = OverlayController.nextStateOf('initial', 'removeResource', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('initial'));
      expect(result).assertEqual('initial');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('removeResource')), String(false));
      expect(OverlayController.isSwitchAction('removeResource')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0008 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0009
     * @tc.number SUB_RESMGR_OVERLAY_01_0009
     * @tc.desc   nextStateOf('enabled', 'disable', true) -> disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0009 begin');
      const result: string = OverlayController.nextStateOf('enabled', 'disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('disable')), String(true));
      expect(OverlayController.isSwitchAction('disable')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0009 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0010
     * @tc.number SUB_RESMGR_OVERLAY_01_0010
     * @tc.desc   nextStateOf('enabled', 'disable', false) -> enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0010 begin');
      const result: string = OverlayController.nextStateOf('enabled', 'disable', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enabled'));
      expect(result).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('disable')), String(true));
      expect(OverlayController.isSwitchAction('disable')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0010 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0011
     * @tc.number SUB_RESMGR_OVERLAY_01_0011
     * @tc.desc   nextStateOf('enabled', 'enable', true) -> enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0011 begin');
      const result: string = OverlayController.nextStateOf('enabled', 'enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enabled'));
      expect(result).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('enable')), String(true));
      expect(OverlayController.isSwitchAction('enable')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0011 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0012
     * @tc.number SUB_RESMGR_OVERLAY_01_0012
     * @tc.desc   nextStateOf('enabled', 'enable', false) -> enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0012 begin');
      const result: string = OverlayController.nextStateOf('enabled', 'enable', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enabled'));
      expect(result).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('enable')), String(true));
      expect(OverlayController.isSwitchAction('enable')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0012 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0013
     * @tc.number SUB_RESMGR_OVERLAY_01_0013
     * @tc.desc   nextStateOf('enabled', 'addResource', true) -> runtimeLoaded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0013 begin');
      const result: string = OverlayController.nextStateOf('enabled', 'addResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('runtimeLoaded'));
      expect(result).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('addResource')), String(false));
      expect(OverlayController.isSwitchAction('addResource')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0013 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0014
     * @tc.number SUB_RESMGR_OVERLAY_01_0014
     * @tc.desc   nextStateOf('enabled', 'addResource', false) -> enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0014 begin');
      const result: string = OverlayController.nextStateOf('enabled', 'addResource', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enabled'));
      expect(result).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('addResource')), String(false));
      expect(OverlayController.isSwitchAction('addResource')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0014 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0015
     * @tc.number SUB_RESMGR_OVERLAY_01_0015
     * @tc.desc   nextStateOf('enabled', 'removeResource', true) -> runtimeRemoved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0015 begin');
      const result: string = OverlayController.nextStateOf('enabled', 'removeResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('runtimeRemoved'));
      expect(result).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('removeResource')), String(false));
      expect(OverlayController.isSwitchAction('removeResource')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0015 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0016
     * @tc.number SUB_RESMGR_OVERLAY_01_0016
     * @tc.desc   nextStateOf('enabled', 'removeResource', false) -> enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0016 begin');
      const result: string = OverlayController.nextStateOf('enabled', 'removeResource', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enabled'));
      expect(result).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('removeResource')), String(false));
      expect(OverlayController.isSwitchAction('removeResource')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0016 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0017
     * @tc.number SUB_RESMGR_OVERLAY_01_0017
     * @tc.desc   nextStateOf('disabled', 'disable', true) -> disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0017 begin');
      const result: string = OverlayController.nextStateOf('disabled', 'disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('disable')), String(true));
      expect(OverlayController.isSwitchAction('disable')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0017 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0018
     * @tc.number SUB_RESMGR_OVERLAY_01_0018
     * @tc.desc   nextStateOf('disabled', 'disable', false) -> disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0018 begin');
      const result: string = OverlayController.nextStateOf('disabled', 'disable', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('disable')), String(true));
      expect(OverlayController.isSwitchAction('disable')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0018 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0019
     * @tc.number SUB_RESMGR_OVERLAY_01_0019
     * @tc.desc   nextStateOf('disabled', 'enable', true) -> enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0019 begin');
      const result: string = OverlayController.nextStateOf('disabled', 'enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enabled'));
      expect(result).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('enable')), String(true));
      expect(OverlayController.isSwitchAction('enable')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0019 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0020
     * @tc.number SUB_RESMGR_OVERLAY_01_0020
     * @tc.desc   nextStateOf('disabled', 'enable', false) -> disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0020 begin');
      const result: string = OverlayController.nextStateOf('disabled', 'enable', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('enable')), String(true));
      expect(OverlayController.isSwitchAction('enable')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0020 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0021
     * @tc.number SUB_RESMGR_OVERLAY_01_0021
     * @tc.desc   nextStateOf('disabled', 'addResource', true) -> runtimeLoaded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0021 begin');
      const result: string = OverlayController.nextStateOf('disabled', 'addResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('runtimeLoaded'));
      expect(result).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('addResource')), String(false));
      expect(OverlayController.isSwitchAction('addResource')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0021 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0022
     * @tc.number SUB_RESMGR_OVERLAY_01_0022
     * @tc.desc   nextStateOf('disabled', 'addResource', false) -> disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0022 begin');
      const result: string = OverlayController.nextStateOf('disabled', 'addResource', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('addResource')), String(false));
      expect(OverlayController.isSwitchAction('addResource')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0022 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0023
     * @tc.number SUB_RESMGR_OVERLAY_01_0023
     * @tc.desc   nextStateOf('disabled', 'removeResource', true) -> runtimeRemoved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0023 begin');
      const result: string = OverlayController.nextStateOf('disabled', 'removeResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('runtimeRemoved'));
      expect(result).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('removeResource')), String(false));
      expect(OverlayController.isSwitchAction('removeResource')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0023 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0024
     * @tc.number SUB_RESMGR_OVERLAY_01_0024
     * @tc.desc   nextStateOf('disabled', 'removeResource', false) -> disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0024 begin');
      const result: string = OverlayController.nextStateOf('disabled', 'removeResource', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('removeResource')), String(false));
      expect(OverlayController.isSwitchAction('removeResource')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0024 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0025
     * @tc.number SUB_RESMGR_OVERLAY_01_0025
     * @tc.desc   nextStateOf('runtimeLoaded', 'disable', true) -> disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0025 begin');
      const result: string = OverlayController.nextStateOf('runtimeLoaded', 'disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('disable')), String(true));
      expect(OverlayController.isSwitchAction('disable')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0025 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0026
     * @tc.number SUB_RESMGR_OVERLAY_01_0026
     * @tc.desc   nextStateOf('runtimeLoaded', 'disable', false) -> runtimeLoaded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0026 begin');
      const result: string = OverlayController.nextStateOf('runtimeLoaded', 'disable', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('runtimeLoaded'));
      expect(result).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('disable')), String(true));
      expect(OverlayController.isSwitchAction('disable')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0026 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0027
     * @tc.number SUB_RESMGR_OVERLAY_01_0027
     * @tc.desc   nextStateOf('runtimeLoaded', 'enable', true) -> enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0027 begin');
      const result: string = OverlayController.nextStateOf('runtimeLoaded', 'enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enabled'));
      expect(result).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('enable')), String(true));
      expect(OverlayController.isSwitchAction('enable')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0027 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0028
     * @tc.number SUB_RESMGR_OVERLAY_01_0028
     * @tc.desc   nextStateOf('runtimeLoaded', 'enable', false) -> runtimeLoaded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0028 begin');
      const result: string = OverlayController.nextStateOf('runtimeLoaded', 'enable', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('runtimeLoaded'));
      expect(result).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('enable')), String(true));
      expect(OverlayController.isSwitchAction('enable')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0028 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0029
     * @tc.number SUB_RESMGR_OVERLAY_01_0029
     * @tc.desc   nextStateOf('runtimeLoaded', 'addResource', true) -> runtimeLoaded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0029 begin');
      const result: string = OverlayController.nextStateOf('runtimeLoaded', 'addResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('runtimeLoaded'));
      expect(result).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('addResource')), String(false));
      expect(OverlayController.isSwitchAction('addResource')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0029 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0030
     * @tc.number SUB_RESMGR_OVERLAY_01_0030
     * @tc.desc   nextStateOf('runtimeLoaded', 'addResource', false) -> runtimeLoaded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0030 begin');
      const result: string = OverlayController.nextStateOf('runtimeLoaded', 'addResource', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('runtimeLoaded'));
      expect(result).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('addResource')), String(false));
      expect(OverlayController.isSwitchAction('addResource')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0030 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0031
     * @tc.number SUB_RESMGR_OVERLAY_01_0031
     * @tc.desc   nextStateOf('runtimeLoaded', 'removeResource', true) -> runtimeRemoved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0031 begin');
      const result: string = OverlayController.nextStateOf('runtimeLoaded', 'removeResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('runtimeRemoved'));
      expect(result).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('removeResource')), String(false));
      expect(OverlayController.isSwitchAction('removeResource')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0031 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0032
     * @tc.number SUB_RESMGR_OVERLAY_01_0032
     * @tc.desc   nextStateOf('runtimeLoaded', 'removeResource', false) -> runtimeLoaded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0032 begin');
      const result: string = OverlayController.nextStateOf('runtimeLoaded', 'removeResource', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('runtimeLoaded'));
      expect(result).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('removeResource')), String(false));
      expect(OverlayController.isSwitchAction('removeResource')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0032 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0033
     * @tc.number SUB_RESMGR_OVERLAY_01_0033
     * @tc.desc   nextStateOf('runtimeRemoved', 'disable', true) -> disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0033 begin');
      const result: string = OverlayController.nextStateOf('runtimeRemoved', 'disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('disable')), String(true));
      expect(OverlayController.isSwitchAction('disable')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0033 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0034
     * @tc.number SUB_RESMGR_OVERLAY_01_0034
     * @tc.desc   nextStateOf('runtimeRemoved', 'disable', false) -> runtimeRemoved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0034 begin');
      const result: string = OverlayController.nextStateOf('runtimeRemoved', 'disable', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('runtimeRemoved'));
      expect(result).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('disable')), String(true));
      expect(OverlayController.isSwitchAction('disable')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0034 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0035
     * @tc.number SUB_RESMGR_OVERLAY_01_0035
     * @tc.desc   nextStateOf('runtimeRemoved', 'enable', true) -> enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0035 begin');
      const result: string = OverlayController.nextStateOf('runtimeRemoved', 'enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enabled'));
      expect(result).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('enable')), String(true));
      expect(OverlayController.isSwitchAction('enable')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0035 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0036
     * @tc.number SUB_RESMGR_OVERLAY_01_0036
     * @tc.desc   nextStateOf('runtimeRemoved', 'enable', false) -> runtimeRemoved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0036 begin');
      const result: string = OverlayController.nextStateOf('runtimeRemoved', 'enable', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('runtimeRemoved'));
      expect(result).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('enable')), String(true));
      expect(OverlayController.isSwitchAction('enable')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0036 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0037
     * @tc.number SUB_RESMGR_OVERLAY_01_0037
     * @tc.desc   nextStateOf('runtimeRemoved', 'addResource', true) -> runtimeLoaded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0037 begin');
      const result: string = OverlayController.nextStateOf('runtimeRemoved', 'addResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('runtimeLoaded'));
      expect(result).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('addResource')), String(false));
      expect(OverlayController.isSwitchAction('addResource')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0037 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0038
     * @tc.number SUB_RESMGR_OVERLAY_01_0038
     * @tc.desc   nextStateOf('runtimeRemoved', 'addResource', false) -> runtimeRemoved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0038 begin');
      const result: string = OverlayController.nextStateOf('runtimeRemoved', 'addResource', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('runtimeRemoved'));
      expect(result).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('addResource')), String(false));
      expect(OverlayController.isSwitchAction('addResource')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0038 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0039
     * @tc.number SUB_RESMGR_OVERLAY_01_0039
     * @tc.desc   nextStateOf('runtimeRemoved', 'removeResource', true) -> runtimeRemoved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0039 begin');
      const result: string = OverlayController.nextStateOf('runtimeRemoved', 'removeResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('runtimeRemoved'));
      expect(result).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('removeResource')), String(false));
      expect(OverlayController.isSwitchAction('removeResource')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0039 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0040
     * @tc.number SUB_RESMGR_OVERLAY_01_0040
     * @tc.desc   nextStateOf('runtimeRemoved', 'removeResource', false) -> runtimeRemoved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0040 begin');
      const result: string = OverlayController.nextStateOf('runtimeRemoved', 'removeResource', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('runtimeRemoved'));
      expect(result).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('removeResource')), String(false));
      expect(OverlayController.isSwitchAction('removeResource')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0040 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0041
     * @tc.number SUB_RESMGR_OVERLAY_01_0041
     * @tc.desc   nextStateOf('unknown', 'disable', true) -> disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0041 begin');
      const result: string = OverlayController.nextStateOf('unknown', 'disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('disable')), String(true));
      expect(OverlayController.isSwitchAction('disable')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0041 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0042
     * @tc.number SUB_RESMGR_OVERLAY_01_0042
     * @tc.desc   nextStateOf('unknown', 'disable', false) -> initial
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0042 begin');
      const result: string = OverlayController.nextStateOf('unknown', 'disable', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('initial'));
      expect(result).assertEqual('initial');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('disable')), String(true));
      expect(OverlayController.isSwitchAction('disable')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0042 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0043
     * @tc.number SUB_RESMGR_OVERLAY_01_0043
     * @tc.desc   nextStateOf('unknown', 'enable', true) -> enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0043 begin');
      const result: string = OverlayController.nextStateOf('unknown', 'enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enabled'));
      expect(result).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('enable')), String(true));
      expect(OverlayController.isSwitchAction('enable')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0043 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0044
     * @tc.number SUB_RESMGR_OVERLAY_01_0044
     * @tc.desc   nextStateOf('unknown', 'enable', false) -> initial
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0044 begin');
      const result: string = OverlayController.nextStateOf('unknown', 'enable', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('initial'));
      expect(result).assertEqual('initial');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('enable')), String(true));
      expect(OverlayController.isSwitchAction('enable')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0044 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0045
     * @tc.number SUB_RESMGR_OVERLAY_01_0045
     * @tc.desc   nextStateOf('unknown', 'addResource', true) -> runtimeLoaded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0045 begin');
      const result: string = OverlayController.nextStateOf('unknown', 'addResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('runtimeLoaded'));
      expect(result).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('addResource')), String(false));
      expect(OverlayController.isSwitchAction('addResource')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0045 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0046
     * @tc.number SUB_RESMGR_OVERLAY_01_0046
     * @tc.desc   nextStateOf('unknown', 'addResource', false) -> initial
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0046 begin');
      const result: string = OverlayController.nextStateOf('unknown', 'addResource', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('initial'));
      expect(result).assertEqual('initial');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('addResource')), String(false));
      expect(OverlayController.isSwitchAction('addResource')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0046 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0047
     * @tc.number SUB_RESMGR_OVERLAY_01_0047
     * @tc.desc   nextStateOf('unknown', 'removeResource', true) -> runtimeRemoved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0047 begin');
      const result: string = OverlayController.nextStateOf('unknown', 'removeResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('runtimeRemoved'));
      expect(result).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('removeResource')), String(false));
      expect(OverlayController.isSwitchAction('removeResource')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0047 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0048
     * @tc.number SUB_RESMGR_OVERLAY_01_0048
     * @tc.desc   nextStateOf('unknown', 'removeResource', false) -> initial
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0048 begin');
      const result: string = OverlayController.nextStateOf('unknown', 'removeResource', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('initial'));
      expect(result).assertEqual('initial');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('removeResource')), String(false));
      expect(OverlayController.isSwitchAction('removeResource')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0048 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0049
     * @tc.number SUB_RESMGR_OVERLAY_01_0049
     * @tc.desc   nextStateOf('', 'disable', true) -> disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0049 begin');
      const result: string = OverlayController.nextStateOf('', 'disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('disable')), String(true));
      expect(OverlayController.isSwitchAction('disable')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0049 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0050
     * @tc.number SUB_RESMGR_OVERLAY_01_0050
     * @tc.desc   nextStateOf('', 'disable', false) -> initial
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0050 begin');
      const result: string = OverlayController.nextStateOf('', 'disable', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('initial'));
      expect(result).assertEqual('initial');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('disable')), String(true));
      expect(OverlayController.isSwitchAction('disable')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0050 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0051
     * @tc.number SUB_RESMGR_OVERLAY_01_0051
     * @tc.desc   nextStateOf('', 'enable', true) -> enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0051 begin');
      const result: string = OverlayController.nextStateOf('', 'enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enabled'));
      expect(result).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('enable')), String(true));
      expect(OverlayController.isSwitchAction('enable')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0051 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0052
     * @tc.number SUB_RESMGR_OVERLAY_01_0052
     * @tc.desc   nextStateOf('', 'enable', false) -> initial
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0052 begin');
      const result: string = OverlayController.nextStateOf('', 'enable', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('initial'));
      expect(result).assertEqual('initial');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('enable')), String(true));
      expect(OverlayController.isSwitchAction('enable')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0052 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0053
     * @tc.number SUB_RESMGR_OVERLAY_01_0053
     * @tc.desc   nextStateOf('', 'addResource', true) -> runtimeLoaded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0053 begin');
      const result: string = OverlayController.nextStateOf('', 'addResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('runtimeLoaded'));
      expect(result).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('addResource')), String(false));
      expect(OverlayController.isSwitchAction('addResource')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0053 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0054
     * @tc.number SUB_RESMGR_OVERLAY_01_0054
     * @tc.desc   nextStateOf('', 'addResource', false) -> initial
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0054 begin');
      const result: string = OverlayController.nextStateOf('', 'addResource', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('initial'));
      expect(result).assertEqual('initial');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('addResource')), String(false));
      expect(OverlayController.isSwitchAction('addResource')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0054 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0055
     * @tc.number SUB_RESMGR_OVERLAY_01_0055
     * @tc.desc   nextStateOf('', 'removeResource', true) -> runtimeRemoved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0055 begin');
      const result: string = OverlayController.nextStateOf('', 'removeResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('runtimeRemoved'));
      expect(result).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('removeResource')), String(false));
      expect(OverlayController.isSwitchAction('removeResource')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0055 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0056
     * @tc.number SUB_RESMGR_OVERLAY_01_0056
     * @tc.desc   nextStateOf('', 'removeResource', false) -> initial
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0056 begin');
      const result: string = OverlayController.nextStateOf('', 'removeResource', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('initial'));
      expect(result).assertEqual('initial');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(result)));
      expect(OverlayController.isKnownState(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isSwitchAction('removeResource')), String(false));
      expect(OverlayController.isSwitchAction('removeResource')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0056 end');
    })

    /**
     * @tc.name   testOverlayCtrlSwitch0057
     * @tc.number SUB_RESMGR_OVERLAY_01_0057
     * @tc.desc   失败动作不得改状态，未知入参必须归一到 initial
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlSwitch0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0057 begin');
      // 使能失败时页面必须停在原状态，不能乐观地先置 enabled
      const kept: string = OverlayController.nextStateOf('disabled', 'enable', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', kept, 'disabled');
      expect(kept).assertEqual('disabled');
      // 未知当前状态先归一到 initial，再执行失败分支，结果仍是 initial
      const unknownBase: string = OverlayController.nextStateOf('broken', 'addResource', false);
      expect(unknownBase).assertEqual('initial');
      // 未知动作即使成功也不能改动状态
      const unknownAction: string = OverlayController.nextStateOf('enabled', 'reload', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', unknownAction, 'enabled');
      expect(unknownAction).assertEqual('enabled');
      // 四个真实动作的成功跳转必须分别落到四个可观测状态
      expect(OverlayController.nextStateOf('disabled', 'enable', true)).assertEqual('enabled');
      expect(OverlayController.nextStateOf('enabled', 'disable', true)).assertEqual('disabled');
      expect(OverlayController.nextStateOf('initial', 'addResource', true)).assertEqual('runtimeLoaded');
      expect(OverlayController.nextStateOf('runtimeLoaded', 'removeResource', true)).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlSwitch0057 end');
    })

  })
}
