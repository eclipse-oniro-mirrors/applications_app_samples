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

export default function overlayCtrlParseB04Test() {
  describe('OverlayCtrlParseB04Test', () => {

    /**
     * @tc.name   testOverlayCtrlParseB040001
     * @tc.number SUB_RESMGR_OVERLAY_04_0001
     * @tc.desc   parseAction(disable) known=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040001 begin');
      const result: string = OverlayController.parseAction('disable');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disable'));
      expect(result).assertEqual('disable');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040001 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040002
     * @tc.number SUB_RESMGR_OVERLAY_04_0002
     * @tc.desc   parseAction(enable) known=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040002 begin');
      const result: string = OverlayController.parseAction('enable');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enable'));
      expect(result).assertEqual('enable');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040002 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040003
     * @tc.number SUB_RESMGR_OVERLAY_04_0003
     * @tc.desc   parseAction(addResource) known=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040003 begin');
      const result: string = OverlayController.parseAction('addResource');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('addResource'));
      expect(result).assertEqual('addResource');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040003 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040004
     * @tc.number SUB_RESMGR_OVERLAY_04_0004
     * @tc.desc   parseAction(removeResource) known=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040004 begin');
      const result: string = OverlayController.parseAction('removeResource');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('removeResource'));
      expect(result).assertEqual('removeResource');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040004 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040005
     * @tc.number SUB_RESMGR_OVERLAY_04_0005
     * @tc.desc   parseAction(Disable) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040005 begin');
      const result: string = OverlayController.parseAction('Disable');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040005 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040006
     * @tc.number SUB_RESMGR_OVERLAY_04_0006
     * @tc.desc   parseAction(ENABLE) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040006 begin');
      const result: string = OverlayController.parseAction('ENABLE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040006 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040007
     * @tc.number SUB_RESMGR_OVERLAY_04_0007
     * @tc.desc   parseAction(enable ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040007 begin');
      const result: string = OverlayController.parseAction('enable ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040007 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040008
     * @tc.number SUB_RESMGR_OVERLAY_04_0008
     * @tc.desc   parseAction( enable) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040008 begin');
      const result: string = OverlayController.parseAction(' enable');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040008 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040009
     * @tc.number SUB_RESMGR_OVERLAY_04_0009
     * @tc.desc   parseAction(add_resource) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040009 begin');
      const result: string = OverlayController.parseAction('add_resource');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040009 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040010
     * @tc.number SUB_RESMGR_OVERLAY_04_0010
     * @tc.desc   parseAction(removeResource ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040010 begin');
      const result: string = OverlayController.parseAction('removeResource ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040010 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040011
     * @tc.number SUB_RESMGR_OVERLAY_04_0011
     * @tc.desc   parseAction(disableX) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040011 begin');
      const result: string = OverlayController.parseAction('disableX');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040011 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040012
     * @tc.number SUB_RESMGR_OVERLAY_04_0012
     * @tc.desc   parseAction(xdisable) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040012 begin');
      const result: string = OverlayController.parseAction('xdisable');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040012 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040013
     * @tc.number SUB_RESMGR_OVERLAY_04_0013
     * @tc.desc   parseAction(AddResource) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040013 begin');
      const result: string = OverlayController.parseAction('AddResource');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040013 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040014
     * @tc.number SUB_RESMGR_OVERLAY_04_0014
     * @tc.desc   parseAction(REMOVE_RESOURCE) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040014 begin');
      const result: string = OverlayController.parseAction('REMOVE_RESOURCE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040014 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040015
     * @tc.number SUB_RESMGR_OVERLAY_04_0015
     * @tc.desc   parseAction(enable2) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040015 begin');
      const result: string = OverlayController.parseAction('enable2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040015 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040016
     * @tc.number SUB_RESMGR_OVERLAY_04_0016
     * @tc.desc   parseAction(addresource) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040016 begin');
      const result: string = OverlayController.parseAction('addresource');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040016 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040017
     * @tc.number SUB_RESMGR_OVERLAY_04_0017
     * @tc.desc   parseAction(remove_resourc) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040017 begin');
      const result: string = OverlayController.parseAction('remove_resourc');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040017 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040018
     * @tc.number SUB_RESMGR_OVERLAY_04_0018
     * @tc.desc   parseAction(dis-able) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040018 begin');
      const result: string = OverlayController.parseAction('dis-able');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040018 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040019
     * @tc.number SUB_RESMGR_OVERLAY_04_0019
     * @tc.desc   parseAction(en-able) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040019 begin');
      const result: string = OverlayController.parseAction('en-able');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040019 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040020
     * @tc.number SUB_RESMGR_OVERLAY_04_0020
     * @tc.desc   parseAction(add) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040020 begin');
      const result: string = OverlayController.parseAction('add');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040020 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040021
     * @tc.number SUB_RESMGR_OVERLAY_04_0021
     * @tc.desc   parseAction(remove) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040021 begin');
      const result: string = OverlayController.parseAction('remove');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040021 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040022
     * @tc.number SUB_RESMGR_OVERLAY_04_0022
     * @tc.desc   parseAction(disable-) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040022 begin');
      const result: string = OverlayController.parseAction('disable-');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040022 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040023
     * @tc.number SUB_RESMGR_OVERLAY_04_0023
     * @tc.desc   parseAction(-disable) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040023 begin');
      const result: string = OverlayController.parseAction('-disable');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040023 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040024
     * @tc.number SUB_RESMGR_OVERLAY_04_0024
     * @tc.desc   parseAction(enable_) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040024 begin');
      const result: string = OverlayController.parseAction('enable_');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040024 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040025
     * @tc.number SUB_RESMGR_OVERLAY_04_0025
     * @tc.desc   parseAction(_enable) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040025 begin');
      const result: string = OverlayController.parseAction('_enable');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040025 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040026
     * @tc.number SUB_RESMGR_OVERLAY_04_0026
     * @tc.desc   parseAction(addResource1) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040026 begin');
      const result: string = OverlayController.parseAction('addResource1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040026 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040027
     * @tc.number SUB_RESMGR_OVERLAY_04_0027
     * @tc.desc   parseAction(1addResource) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040027 begin');
      const result: string = OverlayController.parseAction('1addResource');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040027 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040028
     * @tc.number SUB_RESMGR_OVERLAY_04_0028
     * @tc.desc   parseAction(removeResource1) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040028 begin');
      const result: string = OverlayController.parseAction('removeResource1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040028 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040029
     * @tc.number SUB_RESMGR_OVERLAY_04_0029
     * @tc.desc   parseAction() known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040029 begin');
      const result: string = OverlayController.parseAction('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040029 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040030
     * @tc.number SUB_RESMGR_OVERLAY_04_0030
     * @tc.desc   parseAction(disable ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040030 begin');
      const result: string = OverlayController.parseAction('disable ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040030 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040031
     * @tc.number SUB_RESMGR_OVERLAY_04_0031
     * @tc.desc   parseAction(enable ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040031 begin');
      const result: string = OverlayController.parseAction('enable ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040031 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040032
     * @tc.number SUB_RESMGR_OVERLAY_04_0032
     * @tc.desc   parseAction(addResource ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040032 begin');
      const result: string = OverlayController.parseAction('addResource ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040032 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040033
     * @tc.number SUB_RESMGR_OVERLAY_04_0033
     * @tc.desc   parseAction(removeResource ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040033 begin');
      const result: string = OverlayController.parseAction('removeResource ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040033 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040034
     * @tc.number SUB_RESMGR_OVERLAY_04_0034
     * @tc.desc   parseAction(Disable ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040034 begin');
      const result: string = OverlayController.parseAction('Disable ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040034 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040035
     * @tc.number SUB_RESMGR_OVERLAY_04_0035
     * @tc.desc   parseAction(ENABLE ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040035 begin');
      const result: string = OverlayController.parseAction('ENABLE ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040035 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040036
     * @tc.number SUB_RESMGR_OVERLAY_04_0036
     * @tc.desc   parseAction(enable  ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040036 begin');
      const result: string = OverlayController.parseAction('enable  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040036 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040037
     * @tc.number SUB_RESMGR_OVERLAY_04_0037
     * @tc.desc   parseAction( enable ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040037 begin');
      const result: string = OverlayController.parseAction(' enable ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040037 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040038
     * @tc.number SUB_RESMGR_OVERLAY_04_0038
     * @tc.desc   parseAction(add_resource ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040038 begin');
      const result: string = OverlayController.parseAction('add_resource ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040038 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040039
     * @tc.number SUB_RESMGR_OVERLAY_04_0039
     * @tc.desc   parseAction(removeResource  ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040039 begin');
      const result: string = OverlayController.parseAction('removeResource  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040039 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040040
     * @tc.number SUB_RESMGR_OVERLAY_04_0040
     * @tc.desc   parseAction(disableX ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040040 begin');
      const result: string = OverlayController.parseAction('disableX ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040040 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040041
     * @tc.number SUB_RESMGR_OVERLAY_04_0041
     * @tc.desc   parseAction(xdisable ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040041 begin');
      const result: string = OverlayController.parseAction('xdisable ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040041 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040042
     * @tc.number SUB_RESMGR_OVERLAY_04_0042
     * @tc.desc   parseAction(AddResource ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040042 begin');
      const result: string = OverlayController.parseAction('AddResource ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040042 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040043
     * @tc.number SUB_RESMGR_OVERLAY_04_0043
     * @tc.desc   parseAction(REMOVE_RESOURCE ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040043 begin');
      const result: string = OverlayController.parseAction('REMOVE_RESOURCE ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040043 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040044
     * @tc.number SUB_RESMGR_OVERLAY_04_0044
     * @tc.desc   parseAction(enable2 ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040044 begin');
      const result: string = OverlayController.parseAction('enable2 ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040044 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040045
     * @tc.number SUB_RESMGR_OVERLAY_04_0045
     * @tc.desc   parseAction(addresource ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040045 begin');
      const result: string = OverlayController.parseAction('addresource ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040045 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040046
     * @tc.number SUB_RESMGR_OVERLAY_04_0046
     * @tc.desc   parseAction(remove_resourc ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040046 begin');
      const result: string = OverlayController.parseAction('remove_resourc ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040046 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040047
     * @tc.number SUB_RESMGR_OVERLAY_04_0047
     * @tc.desc   parseAction(dis-able ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040047 begin');
      const result: string = OverlayController.parseAction('dis-able ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040047 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040048
     * @tc.number SUB_RESMGR_OVERLAY_04_0048
     * @tc.desc   parseAction(en-able ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040048 begin');
      const result: string = OverlayController.parseAction('en-able ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040048 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040049
     * @tc.number SUB_RESMGR_OVERLAY_04_0049
     * @tc.desc   parseAction(add ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040049 begin');
      const result: string = OverlayController.parseAction('add ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040049 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040050
     * @tc.number SUB_RESMGR_OVERLAY_04_0050
     * @tc.desc   parseAction(remove ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040050 begin');
      const result: string = OverlayController.parseAction('remove ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040050 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040051
     * @tc.number SUB_RESMGR_OVERLAY_04_0051
     * @tc.desc   parseAction(disable- ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040051 begin');
      const result: string = OverlayController.parseAction('disable- ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040051 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040052
     * @tc.number SUB_RESMGR_OVERLAY_04_0052
     * @tc.desc   parseAction(-disable ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040052 begin');
      const result: string = OverlayController.parseAction('-disable ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040052 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040053
     * @tc.number SUB_RESMGR_OVERLAY_04_0053
     * @tc.desc   parseAction(enable_ ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040053 begin');
      const result: string = OverlayController.parseAction('enable_ ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040053 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040054
     * @tc.number SUB_RESMGR_OVERLAY_04_0054
     * @tc.desc   parseAction(_enable ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040054 begin');
      const result: string = OverlayController.parseAction('_enable ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040054 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040055
     * @tc.number SUB_RESMGR_OVERLAY_04_0055
     * @tc.desc   parseAction(addResource1 ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040055 begin');
      const result: string = OverlayController.parseAction('addResource1 ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040055 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040056
     * @tc.number SUB_RESMGR_OVERLAY_04_0056
     * @tc.desc   parseAction(1addResource ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040056 begin');
      const result: string = OverlayController.parseAction('1addResource ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040056 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040057
     * @tc.number SUB_RESMGR_OVERLAY_04_0057
     * @tc.desc   parseAction(removeResource1 ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040057 begin');
      const result: string = OverlayController.parseAction('removeResource1 ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040057 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040058
     * @tc.number SUB_RESMGR_OVERLAY_04_0058
     * @tc.desc   parseAction( ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040058 begin');
      const result: string = OverlayController.parseAction(' ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040058 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040059
     * @tc.number SUB_RESMGR_OVERLAY_04_0059
     * @tc.desc   parseAction(disable ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040059 begin');
      const result: string = OverlayController.parseAction('disable ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040059 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040060
     * @tc.number SUB_RESMGR_OVERLAY_04_0060
     * @tc.desc   parseAction(enable ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040060 begin');
      const result: string = OverlayController.parseAction('enable ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040060 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040061
     * @tc.number SUB_RESMGR_OVERLAY_04_0061
     * @tc.desc   parseAction(addResource ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040061 begin');
      const result: string = OverlayController.parseAction('addResource ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040061 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040062
     * @tc.number SUB_RESMGR_OVERLAY_04_0062
     * @tc.desc   parseAction(removeResource ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040062 begin');
      const result: string = OverlayController.parseAction('removeResource ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040062 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040063
     * @tc.number SUB_RESMGR_OVERLAY_04_0063
     * @tc.desc   parseAction(Disable ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040063 begin');
      const result: string = OverlayController.parseAction('Disable ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040063 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040064
     * @tc.number SUB_RESMGR_OVERLAY_04_0064
     * @tc.desc   parseAction(ENABLE ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040064 begin');
      const result: string = OverlayController.parseAction('ENABLE ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040064 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040065
     * @tc.number SUB_RESMGR_OVERLAY_04_0065
     * @tc.desc   parseAction(enable  ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040065 begin');
      const result: string = OverlayController.parseAction('enable  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040065 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040066
     * @tc.number SUB_RESMGR_OVERLAY_04_0066
     * @tc.desc   parseAction( enable ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040066 begin');
      const result: string = OverlayController.parseAction(' enable ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040066 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040067
     * @tc.number SUB_RESMGR_OVERLAY_04_0067
     * @tc.desc   parseAction(add_resource ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040067 begin');
      const result: string = OverlayController.parseAction('add_resource ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040067 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040068
     * @tc.number SUB_RESMGR_OVERLAY_04_0068
     * @tc.desc   parseAction(removeResource  ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040068 begin');
      const result: string = OverlayController.parseAction('removeResource  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040068 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040069
     * @tc.number SUB_RESMGR_OVERLAY_04_0069
     * @tc.desc   parseAction(disableX ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040069 begin');
      const result: string = OverlayController.parseAction('disableX ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040069 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040070
     * @tc.number SUB_RESMGR_OVERLAY_04_0070
     * @tc.desc   parseAction(xdisable ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040070 begin');
      const result: string = OverlayController.parseAction('xdisable ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040070 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040071
     * @tc.number SUB_RESMGR_OVERLAY_04_0071
     * @tc.desc   parseAction(AddResource ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040071 begin');
      const result: string = OverlayController.parseAction('AddResource ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040071 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040072
     * @tc.number SUB_RESMGR_OVERLAY_04_0072
     * @tc.desc   parseAction(REMOVE_RESOURCE ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040072 begin');
      const result: string = OverlayController.parseAction('REMOVE_RESOURCE ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040072 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040073
     * @tc.number SUB_RESMGR_OVERLAY_04_0073
     * @tc.desc   parseAction(enable2 ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040073 begin');
      const result: string = OverlayController.parseAction('enable2 ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040073 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040074
     * @tc.number SUB_RESMGR_OVERLAY_04_0074
     * @tc.desc   parseAction(addresource ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040074 begin');
      const result: string = OverlayController.parseAction('addresource ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040074 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040075
     * @tc.number SUB_RESMGR_OVERLAY_04_0075
     * @tc.desc   parseAction(remove_resourc ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040075 begin');
      const result: string = OverlayController.parseAction('remove_resourc ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040075 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040076
     * @tc.number SUB_RESMGR_OVERLAY_04_0076
     * @tc.desc   parseAction(dis-able ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040076 begin');
      const result: string = OverlayController.parseAction('dis-able ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040076 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040077
     * @tc.number SUB_RESMGR_OVERLAY_04_0077
     * @tc.desc   parseAction(en-able ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040077 begin');
      const result: string = OverlayController.parseAction('en-able ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040077 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040078
     * @tc.number SUB_RESMGR_OVERLAY_04_0078
     * @tc.desc   parseAction(add ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040078 begin');
      const result: string = OverlayController.parseAction('add ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040078 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040079
     * @tc.number SUB_RESMGR_OVERLAY_04_0079
     * @tc.desc   parseAction(remove ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040079 begin');
      const result: string = OverlayController.parseAction('remove ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040079 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040080
     * @tc.number SUB_RESMGR_OVERLAY_04_0080
     * @tc.desc   parseAction(disable- ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040080 begin');
      const result: string = OverlayController.parseAction('disable- ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040080 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040081
     * @tc.number SUB_RESMGR_OVERLAY_04_0081
     * @tc.desc   parseAction(-disable ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040081 begin');
      const result: string = OverlayController.parseAction('-disable ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040081 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040082
     * @tc.number SUB_RESMGR_OVERLAY_04_0082
     * @tc.desc   parseAction(enable_ ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040082 begin');
      const result: string = OverlayController.parseAction('enable_ ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040082 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040083
     * @tc.number SUB_RESMGR_OVERLAY_04_0083
     * @tc.desc   parseAction(_enable ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040083 begin');
      const result: string = OverlayController.parseAction('_enable ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040083 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040084
     * @tc.number SUB_RESMGR_OVERLAY_04_0084
     * @tc.desc   parseAction(addResource1 ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040084 begin');
      const result: string = OverlayController.parseAction('addResource1 ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040084 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040085
     * @tc.number SUB_RESMGR_OVERLAY_04_0085
     * @tc.desc   parseAction(1addResource ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040085 begin');
      const result: string = OverlayController.parseAction('1addResource ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040085 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040086
     * @tc.number SUB_RESMGR_OVERLAY_04_0086
     * @tc.desc   parseAction(removeResource1 ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040086 begin');
      const result: string = OverlayController.parseAction('removeResource1 ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040086 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040087
     * @tc.number SUB_RESMGR_OVERLAY_04_0087
     * @tc.desc   parseAction( ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040087 begin');
      const result: string = OverlayController.parseAction(' ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040087 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040088
     * @tc.number SUB_RESMGR_OVERLAY_04_0088
     * @tc.desc   parseAction(disable ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040088 begin');
      const result: string = OverlayController.parseAction('disable ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040088 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040089
     * @tc.number SUB_RESMGR_OVERLAY_04_0089
     * @tc.desc   parseAction(enable ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040089 begin');
      const result: string = OverlayController.parseAction('enable ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040089 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040090
     * @tc.number SUB_RESMGR_OVERLAY_04_0090
     * @tc.desc   parseAction(addResource ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040090 begin');
      const result: string = OverlayController.parseAction('addResource ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040090 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040091
     * @tc.number SUB_RESMGR_OVERLAY_04_0091
     * @tc.desc   parseAction(removeResource ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040091 begin');
      const result: string = OverlayController.parseAction('removeResource ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040091 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040092
     * @tc.number SUB_RESMGR_OVERLAY_04_0092
     * @tc.desc   parseAction(Disable ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040092 begin');
      const result: string = OverlayController.parseAction('Disable ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040092 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040093
     * @tc.number SUB_RESMGR_OVERLAY_04_0093
     * @tc.desc   parseAction(ENABLE ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040093 begin');
      const result: string = OverlayController.parseAction('ENABLE ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040093 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040094
     * @tc.number SUB_RESMGR_OVERLAY_04_0094
     * @tc.desc   parseAction(enable  ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040094 begin');
      const result: string = OverlayController.parseAction('enable  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040094 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB040095
     * @tc.number SUB_RESMGR_OVERLAY_04_0095
     * @tc.desc   parseAction( enable ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB040095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040095 begin');
      const result: string = OverlayController.parseAction(' enable ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
          || result === 'removeResource'),
          String(true));
      expect(result === '' || OverlayController.isSwitchAction(result) || result === 'addResource'
        || result === 'removeResource')
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.parseAction(result) === result));
      expect(OverlayController.parseAction(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB040095 end');
    })

    /**
     * @tc.name   testOverlayCtrlParseB0496
     * @tc.number SUB_RESMGR_OVERLAY_04_0096
     * @tc.desc   只有精确动作名被接受
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlParseB0496', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB0496 begin');
      expect(OverlayController.parseAction('enable')).assertEqual('enable');
      expect(OverlayController.parseAction('Enable')).assertEqual('');
      expect(OverlayController.isSwitchAction('disable')).assertTrue();
      expect(OverlayController.isSwitchAction('addResource')).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlParseB0496 end');
    })
  })
}
