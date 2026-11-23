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

export default function overlayCtrlMsgB03Test() {
  describe('OverlayCtrlMsgB03Test', () => {

    /**
     * @tc.name   testOverlayCtrlMsgB030001
     * @tc.number SUB_RESMGR_OVERLAY_03_0001
     * @tc.desc   messageKeyOf(disable, true) -> [unEnableSuccess]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030001 begin');
      const result: string = OverlayController.messageKeyOf('disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unEnableSuccess'));
      expect(result).assertEqual('unEnableSuccess');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('disable') !== ''), String(true));
      expect(OverlayController.parseAction('disable') !== '').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030001 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030002
     * @tc.number SUB_RESMGR_OVERLAY_03_0002
     * @tc.desc   messageKeyOf(enable, false) -> [enableFailed]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030002 begin');
      const result: string = OverlayController.messageKeyOf('enable', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enableFailed'));
      expect(result).assertEqual('enableFailed');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('enable') !== ''), String(true));
      expect(OverlayController.parseAction('enable') !== '').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030002 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030003
     * @tc.number SUB_RESMGR_OVERLAY_03_0003
     * @tc.desc   messageKeyOf(addResource, true) -> [test_string]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030003 begin');
      const result: string = OverlayController.messageKeyOf('addResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('test_string'));
      expect(result).assertEqual('test_string');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('addResource') !== ''), String(true));
      expect(OverlayController.parseAction('addResource') !== '').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030003 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030004
     * @tc.number SUB_RESMGR_OVERLAY_03_0004
     * @tc.desc   messageKeyOf(removeResource, false) -> [test_string]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030004 begin');
      const result: string = OverlayController.messageKeyOf('removeResource', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('test_string'));
      expect(result).assertEqual('test_string');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('removeResource') !== ''), String(true));
      expect(OverlayController.parseAction('removeResource') !== '').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030004 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030005
     * @tc.number SUB_RESMGR_OVERLAY_03_0005
     * @tc.desc   messageKeyOf(Disable, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030005 begin');
      const result: string = OverlayController.messageKeyOf('Disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('Disable') !== ''), String(false));
      expect(OverlayController.parseAction('Disable') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030005 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030006
     * @tc.number SUB_RESMGR_OVERLAY_03_0006
     * @tc.desc   messageKeyOf(ENABLE, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030006 begin');
      const result: string = OverlayController.messageKeyOf('ENABLE', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('ENABLE') !== ''), String(false));
      expect(OverlayController.parseAction('ENABLE') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030006 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030007
     * @tc.number SUB_RESMGR_OVERLAY_03_0007
     * @tc.desc   messageKeyOf(enable , true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030007 begin');
      const result: string = OverlayController.messageKeyOf('enable ', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('enable ') !== ''), String(false));
      expect(OverlayController.parseAction('enable ') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030007 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030008
     * @tc.number SUB_RESMGR_OVERLAY_03_0008
     * @tc.desc   messageKeyOf( enable, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030008 begin');
      const result: string = OverlayController.messageKeyOf(' enable', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction(' enable') !== ''), String(false));
      expect(OverlayController.parseAction(' enable') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030008 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030009
     * @tc.number SUB_RESMGR_OVERLAY_03_0009
     * @tc.desc   messageKeyOf(add_resource, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030009 begin');
      const result: string = OverlayController.messageKeyOf('add_resource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('add_resource') !== ''), String(false));
      expect(OverlayController.parseAction('add_resource') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030009 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030010
     * @tc.number SUB_RESMGR_OVERLAY_03_0010
     * @tc.desc   messageKeyOf(removeResource , false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030010 begin');
      const result: string = OverlayController.messageKeyOf('removeResource ', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('removeResource ') !== ''), String(false));
      expect(OverlayController.parseAction('removeResource ') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030010 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030011
     * @tc.number SUB_RESMGR_OVERLAY_03_0011
     * @tc.desc   messageKeyOf(disableX, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030011 begin');
      const result: string = OverlayController.messageKeyOf('disableX', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('disableX') !== ''), String(false));
      expect(OverlayController.parseAction('disableX') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030011 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030012
     * @tc.number SUB_RESMGR_OVERLAY_03_0012
     * @tc.desc   messageKeyOf(xdisable, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030012 begin');
      const result: string = OverlayController.messageKeyOf('xdisable', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('xdisable') !== ''), String(false));
      expect(OverlayController.parseAction('xdisable') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030012 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030013
     * @tc.number SUB_RESMGR_OVERLAY_03_0013
     * @tc.desc   messageKeyOf(AddResource, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030013 begin');
      const result: string = OverlayController.messageKeyOf('AddResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('AddResource') !== ''), String(false));
      expect(OverlayController.parseAction('AddResource') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030013 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030014
     * @tc.number SUB_RESMGR_OVERLAY_03_0014
     * @tc.desc   messageKeyOf(REMOVE_RESOURCE, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030014 begin');
      const result: string = OverlayController.messageKeyOf('REMOVE_RESOURCE', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('REMOVE_RESOURCE') !== ''), String(false));
      expect(OverlayController.parseAction('REMOVE_RESOURCE') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030014 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030015
     * @tc.number SUB_RESMGR_OVERLAY_03_0015
     * @tc.desc   messageKeyOf(enable2, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030015 begin');
      const result: string = OverlayController.messageKeyOf('enable2', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('enable2') !== ''), String(false));
      expect(OverlayController.parseAction('enable2') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030015 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030016
     * @tc.number SUB_RESMGR_OVERLAY_03_0016
     * @tc.desc   messageKeyOf(addresource, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030016 begin');
      const result: string = OverlayController.messageKeyOf('addresource', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('addresource') !== ''), String(false));
      expect(OverlayController.parseAction('addresource') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030016 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030017
     * @tc.number SUB_RESMGR_OVERLAY_03_0017
     * @tc.desc   messageKeyOf(remove_resourc, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030017 begin');
      const result: string = OverlayController.messageKeyOf('remove_resourc', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('remove_resourc') !== ''), String(false));
      expect(OverlayController.parseAction('remove_resourc') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030017 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030018
     * @tc.number SUB_RESMGR_OVERLAY_03_0018
     * @tc.desc   messageKeyOf(dis-able, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030018 begin');
      const result: string = OverlayController.messageKeyOf('dis-able', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('dis-able') !== ''), String(false));
      expect(OverlayController.parseAction('dis-able') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030018 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030019
     * @tc.number SUB_RESMGR_OVERLAY_03_0019
     * @tc.desc   messageKeyOf(en-able, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030019 begin');
      const result: string = OverlayController.messageKeyOf('en-able', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('en-able') !== ''), String(false));
      expect(OverlayController.parseAction('en-able') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030019 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030020
     * @tc.number SUB_RESMGR_OVERLAY_03_0020
     * @tc.desc   messageKeyOf(add, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030020 begin');
      const result: string = OverlayController.messageKeyOf('add', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('add') !== ''), String(false));
      expect(OverlayController.parseAction('add') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030020 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030021
     * @tc.number SUB_RESMGR_OVERLAY_03_0021
     * @tc.desc   messageKeyOf(remove, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030021 begin');
      const result: string = OverlayController.messageKeyOf('remove', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('remove') !== ''), String(false));
      expect(OverlayController.parseAction('remove') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030021 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030022
     * @tc.number SUB_RESMGR_OVERLAY_03_0022
     * @tc.desc   messageKeyOf(disable-, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030022 begin');
      const result: string = OverlayController.messageKeyOf('disable-', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('disable-') !== ''), String(false));
      expect(OverlayController.parseAction('disable-') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030022 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030023
     * @tc.number SUB_RESMGR_OVERLAY_03_0023
     * @tc.desc   messageKeyOf(-disable, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030023 begin');
      const result: string = OverlayController.messageKeyOf('-disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('-disable') !== ''), String(false));
      expect(OverlayController.parseAction('-disable') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030023 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030024
     * @tc.number SUB_RESMGR_OVERLAY_03_0024
     * @tc.desc   messageKeyOf(enable_, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030024 begin');
      const result: string = OverlayController.messageKeyOf('enable_', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('enable_') !== ''), String(false));
      expect(OverlayController.parseAction('enable_') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030024 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030025
     * @tc.number SUB_RESMGR_OVERLAY_03_0025
     * @tc.desc   messageKeyOf(_enable, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030025 begin');
      const result: string = OverlayController.messageKeyOf('_enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('_enable') !== ''), String(false));
      expect(OverlayController.parseAction('_enable') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030025 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030026
     * @tc.number SUB_RESMGR_OVERLAY_03_0026
     * @tc.desc   messageKeyOf(addResource1, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030026 begin');
      const result: string = OverlayController.messageKeyOf('addResource1', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('addResource1') !== ''), String(false));
      expect(OverlayController.parseAction('addResource1') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030026 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030027
     * @tc.number SUB_RESMGR_OVERLAY_03_0027
     * @tc.desc   messageKeyOf(1addResource, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030027 begin');
      const result: string = OverlayController.messageKeyOf('1addResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('1addResource') !== ''), String(false));
      expect(OverlayController.parseAction('1addResource') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030027 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030028
     * @tc.number SUB_RESMGR_OVERLAY_03_0028
     * @tc.desc   messageKeyOf(removeResource1, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030028 begin');
      const result: string = OverlayController.messageKeyOf('removeResource1', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('removeResource1') !== ''), String(false));
      expect(OverlayController.parseAction('removeResource1') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030028 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030029
     * @tc.number SUB_RESMGR_OVERLAY_03_0029
     * @tc.desc   messageKeyOf(, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030029 begin');
      const result: string = OverlayController.messageKeyOf('', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('') !== ''), String(false));
      expect(OverlayController.parseAction('') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030029 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030030
     * @tc.number SUB_RESMGR_OVERLAY_03_0030
     * @tc.desc   messageKeyOf(disable, false) -> [unEnableFailed]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030030 begin');
      const result: string = OverlayController.messageKeyOf('disable', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unEnableFailed'));
      expect(result).assertEqual('unEnableFailed');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('disable') !== ''), String(true));
      expect(OverlayController.parseAction('disable') !== '').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030030 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030031
     * @tc.number SUB_RESMGR_OVERLAY_03_0031
     * @tc.desc   messageKeyOf(enable, true) -> [enableSuccess]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030031 begin');
      const result: string = OverlayController.messageKeyOf('enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enableSuccess'));
      expect(result).assertEqual('enableSuccess');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('enable') !== ''), String(true));
      expect(OverlayController.parseAction('enable') !== '').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030031 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030032
     * @tc.number SUB_RESMGR_OVERLAY_03_0032
     * @tc.desc   messageKeyOf(addResource, false) -> [test_string]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030032 begin');
      const result: string = OverlayController.messageKeyOf('addResource', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('test_string'));
      expect(result).assertEqual('test_string');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('addResource') !== ''), String(true));
      expect(OverlayController.parseAction('addResource') !== '').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030032 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030033
     * @tc.number SUB_RESMGR_OVERLAY_03_0033
     * @tc.desc   messageKeyOf(removeResource, true) -> [test_string]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030033 begin');
      const result: string = OverlayController.messageKeyOf('removeResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('test_string'));
      expect(result).assertEqual('test_string');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('removeResource') !== ''), String(true));
      expect(OverlayController.parseAction('removeResource') !== '').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030033 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030034
     * @tc.number SUB_RESMGR_OVERLAY_03_0034
     * @tc.desc   messageKeyOf(Disable, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030034 begin');
      const result: string = OverlayController.messageKeyOf('Disable', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('Disable') !== ''), String(false));
      expect(OverlayController.parseAction('Disable') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030034 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030035
     * @tc.number SUB_RESMGR_OVERLAY_03_0035
     * @tc.desc   messageKeyOf(ENABLE, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030035 begin');
      const result: string = OverlayController.messageKeyOf('ENABLE', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('ENABLE') !== ''), String(false));
      expect(OverlayController.parseAction('ENABLE') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030035 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030036
     * @tc.number SUB_RESMGR_OVERLAY_03_0036
     * @tc.desc   messageKeyOf(enable , false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030036 begin');
      const result: string = OverlayController.messageKeyOf('enable ', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('enable ') !== ''), String(false));
      expect(OverlayController.parseAction('enable ') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030036 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030037
     * @tc.number SUB_RESMGR_OVERLAY_03_0037
     * @tc.desc   messageKeyOf( enable, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030037 begin');
      const result: string = OverlayController.messageKeyOf(' enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction(' enable') !== ''), String(false));
      expect(OverlayController.parseAction(' enable') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030037 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030038
     * @tc.number SUB_RESMGR_OVERLAY_03_0038
     * @tc.desc   messageKeyOf(add_resource, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030038 begin');
      const result: string = OverlayController.messageKeyOf('add_resource', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('add_resource') !== ''), String(false));
      expect(OverlayController.parseAction('add_resource') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030038 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030039
     * @tc.number SUB_RESMGR_OVERLAY_03_0039
     * @tc.desc   messageKeyOf(removeResource , true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030039 begin');
      const result: string = OverlayController.messageKeyOf('removeResource ', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('removeResource ') !== ''), String(false));
      expect(OverlayController.parseAction('removeResource ') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030039 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030040
     * @tc.number SUB_RESMGR_OVERLAY_03_0040
     * @tc.desc   messageKeyOf(disableX, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030040 begin');
      const result: string = OverlayController.messageKeyOf('disableX', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('disableX') !== ''), String(false));
      expect(OverlayController.parseAction('disableX') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030040 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030041
     * @tc.number SUB_RESMGR_OVERLAY_03_0041
     * @tc.desc   messageKeyOf(xdisable, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030041 begin');
      const result: string = OverlayController.messageKeyOf('xdisable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('xdisable') !== ''), String(false));
      expect(OverlayController.parseAction('xdisable') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030041 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030042
     * @tc.number SUB_RESMGR_OVERLAY_03_0042
     * @tc.desc   messageKeyOf(AddResource, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030042 begin');
      const result: string = OverlayController.messageKeyOf('AddResource', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('AddResource') !== ''), String(false));
      expect(OverlayController.parseAction('AddResource') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030042 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030043
     * @tc.number SUB_RESMGR_OVERLAY_03_0043
     * @tc.desc   messageKeyOf(REMOVE_RESOURCE, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030043 begin');
      const result: string = OverlayController.messageKeyOf('REMOVE_RESOURCE', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('REMOVE_RESOURCE') !== ''), String(false));
      expect(OverlayController.parseAction('REMOVE_RESOURCE') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030043 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030044
     * @tc.number SUB_RESMGR_OVERLAY_03_0044
     * @tc.desc   messageKeyOf(enable2, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030044 begin');
      const result: string = OverlayController.messageKeyOf('enable2', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('enable2') !== ''), String(false));
      expect(OverlayController.parseAction('enable2') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030044 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030045
     * @tc.number SUB_RESMGR_OVERLAY_03_0045
     * @tc.desc   messageKeyOf(addresource, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030045 begin');
      const result: string = OverlayController.messageKeyOf('addresource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('addresource') !== ''), String(false));
      expect(OverlayController.parseAction('addresource') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030045 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030046
     * @tc.number SUB_RESMGR_OVERLAY_03_0046
     * @tc.desc   messageKeyOf(remove_resourc, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030046 begin');
      const result: string = OverlayController.messageKeyOf('remove_resourc', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('remove_resourc') !== ''), String(false));
      expect(OverlayController.parseAction('remove_resourc') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030046 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030047
     * @tc.number SUB_RESMGR_OVERLAY_03_0047
     * @tc.desc   messageKeyOf(dis-able, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030047 begin');
      const result: string = OverlayController.messageKeyOf('dis-able', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('dis-able') !== ''), String(false));
      expect(OverlayController.parseAction('dis-able') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030047 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030048
     * @tc.number SUB_RESMGR_OVERLAY_03_0048
     * @tc.desc   messageKeyOf(en-able, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030048 begin');
      const result: string = OverlayController.messageKeyOf('en-able', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('en-able') !== ''), String(false));
      expect(OverlayController.parseAction('en-able') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030048 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030049
     * @tc.number SUB_RESMGR_OVERLAY_03_0049
     * @tc.desc   messageKeyOf(add, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030049 begin');
      const result: string = OverlayController.messageKeyOf('add', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('add') !== ''), String(false));
      expect(OverlayController.parseAction('add') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030049 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030050
     * @tc.number SUB_RESMGR_OVERLAY_03_0050
     * @tc.desc   messageKeyOf(remove, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030050 begin');
      const result: string = OverlayController.messageKeyOf('remove', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('remove') !== ''), String(false));
      expect(OverlayController.parseAction('remove') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030050 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030051
     * @tc.number SUB_RESMGR_OVERLAY_03_0051
     * @tc.desc   messageKeyOf(disable-, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030051 begin');
      const result: string = OverlayController.messageKeyOf('disable-', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('disable-') !== ''), String(false));
      expect(OverlayController.parseAction('disable-') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030051 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030052
     * @tc.number SUB_RESMGR_OVERLAY_03_0052
     * @tc.desc   messageKeyOf(-disable, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030052 begin');
      const result: string = OverlayController.messageKeyOf('-disable', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('-disable') !== ''), String(false));
      expect(OverlayController.parseAction('-disable') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030052 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030053
     * @tc.number SUB_RESMGR_OVERLAY_03_0053
     * @tc.desc   messageKeyOf(enable_, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030053 begin');
      const result: string = OverlayController.messageKeyOf('enable_', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('enable_') !== ''), String(false));
      expect(OverlayController.parseAction('enable_') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030053 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030054
     * @tc.number SUB_RESMGR_OVERLAY_03_0054
     * @tc.desc   messageKeyOf(_enable, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030054 begin');
      const result: string = OverlayController.messageKeyOf('_enable', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('_enable') !== ''), String(false));
      expect(OverlayController.parseAction('_enable') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030054 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030055
     * @tc.number SUB_RESMGR_OVERLAY_03_0055
     * @tc.desc   messageKeyOf(addResource1, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030055 begin');
      const result: string = OverlayController.messageKeyOf('addResource1', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('addResource1') !== ''), String(false));
      expect(OverlayController.parseAction('addResource1') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030055 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030056
     * @tc.number SUB_RESMGR_OVERLAY_03_0056
     * @tc.desc   messageKeyOf(1addResource, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030056 begin');
      const result: string = OverlayController.messageKeyOf('1addResource', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('1addResource') !== ''), String(false));
      expect(OverlayController.parseAction('1addResource') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030056 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030057
     * @tc.number SUB_RESMGR_OVERLAY_03_0057
     * @tc.desc   messageKeyOf(removeResource1, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030057 begin');
      const result: string = OverlayController.messageKeyOf('removeResource1', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('removeResource1') !== ''), String(false));
      expect(OverlayController.parseAction('removeResource1') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030057 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030058
     * @tc.number SUB_RESMGR_OVERLAY_03_0058
     * @tc.desc   messageKeyOf(, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030058 begin');
      const result: string = OverlayController.messageKeyOf('', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('') !== ''), String(false));
      expect(OverlayController.parseAction('') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030058 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030059
     * @tc.number SUB_RESMGR_OVERLAY_03_0059
     * @tc.desc   messageKeyOf(disable, true) -> [unEnableSuccess]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030059 begin');
      const result: string = OverlayController.messageKeyOf('disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unEnableSuccess'));
      expect(result).assertEqual('unEnableSuccess');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('disable') !== ''), String(true));
      expect(OverlayController.parseAction('disable') !== '').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030059 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030060
     * @tc.number SUB_RESMGR_OVERLAY_03_0060
     * @tc.desc   messageKeyOf(enable, false) -> [enableFailed]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030060 begin');
      const result: string = OverlayController.messageKeyOf('enable', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enableFailed'));
      expect(result).assertEqual('enableFailed');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('enable') !== ''), String(true));
      expect(OverlayController.parseAction('enable') !== '').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030060 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030061
     * @tc.number SUB_RESMGR_OVERLAY_03_0061
     * @tc.desc   messageKeyOf(addResource, true) -> [test_string]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030061 begin');
      const result: string = OverlayController.messageKeyOf('addResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('test_string'));
      expect(result).assertEqual('test_string');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('addResource') !== ''), String(true));
      expect(OverlayController.parseAction('addResource') !== '').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030061 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030062
     * @tc.number SUB_RESMGR_OVERLAY_03_0062
     * @tc.desc   messageKeyOf(removeResource, false) -> [test_string]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030062 begin');
      const result: string = OverlayController.messageKeyOf('removeResource', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('test_string'));
      expect(result).assertEqual('test_string');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('removeResource') !== ''), String(true));
      expect(OverlayController.parseAction('removeResource') !== '').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030062 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030063
     * @tc.number SUB_RESMGR_OVERLAY_03_0063
     * @tc.desc   messageKeyOf(Disable, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030063 begin');
      const result: string = OverlayController.messageKeyOf('Disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('Disable') !== ''), String(false));
      expect(OverlayController.parseAction('Disable') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030063 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030064
     * @tc.number SUB_RESMGR_OVERLAY_03_0064
     * @tc.desc   messageKeyOf(ENABLE, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030064 begin');
      const result: string = OverlayController.messageKeyOf('ENABLE', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('ENABLE') !== ''), String(false));
      expect(OverlayController.parseAction('ENABLE') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030064 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030065
     * @tc.number SUB_RESMGR_OVERLAY_03_0065
     * @tc.desc   messageKeyOf(enable , true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030065 begin');
      const result: string = OverlayController.messageKeyOf('enable ', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('enable ') !== ''), String(false));
      expect(OverlayController.parseAction('enable ') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030065 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030066
     * @tc.number SUB_RESMGR_OVERLAY_03_0066
     * @tc.desc   messageKeyOf( enable, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030066 begin');
      const result: string = OverlayController.messageKeyOf(' enable', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction(' enable') !== ''), String(false));
      expect(OverlayController.parseAction(' enable') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030066 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030067
     * @tc.number SUB_RESMGR_OVERLAY_03_0067
     * @tc.desc   messageKeyOf(add_resource, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030067 begin');
      const result: string = OverlayController.messageKeyOf('add_resource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('add_resource') !== ''), String(false));
      expect(OverlayController.parseAction('add_resource') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030067 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030068
     * @tc.number SUB_RESMGR_OVERLAY_03_0068
     * @tc.desc   messageKeyOf(removeResource , false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030068 begin');
      const result: string = OverlayController.messageKeyOf('removeResource ', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('removeResource ') !== ''), String(false));
      expect(OverlayController.parseAction('removeResource ') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030068 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030069
     * @tc.number SUB_RESMGR_OVERLAY_03_0069
     * @tc.desc   messageKeyOf(disableX, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030069 begin');
      const result: string = OverlayController.messageKeyOf('disableX', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('disableX') !== ''), String(false));
      expect(OverlayController.parseAction('disableX') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030069 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030070
     * @tc.number SUB_RESMGR_OVERLAY_03_0070
     * @tc.desc   messageKeyOf(xdisable, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030070 begin');
      const result: string = OverlayController.messageKeyOf('xdisable', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('xdisable') !== ''), String(false));
      expect(OverlayController.parseAction('xdisable') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030070 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030071
     * @tc.number SUB_RESMGR_OVERLAY_03_0071
     * @tc.desc   messageKeyOf(AddResource, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030071 begin');
      const result: string = OverlayController.messageKeyOf('AddResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('AddResource') !== ''), String(false));
      expect(OverlayController.parseAction('AddResource') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030071 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030072
     * @tc.number SUB_RESMGR_OVERLAY_03_0072
     * @tc.desc   messageKeyOf(REMOVE_RESOURCE, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030072 begin');
      const result: string = OverlayController.messageKeyOf('REMOVE_RESOURCE', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('REMOVE_RESOURCE') !== ''), String(false));
      expect(OverlayController.parseAction('REMOVE_RESOURCE') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030072 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030073
     * @tc.number SUB_RESMGR_OVERLAY_03_0073
     * @tc.desc   messageKeyOf(enable2, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030073 begin');
      const result: string = OverlayController.messageKeyOf('enable2', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('enable2') !== ''), String(false));
      expect(OverlayController.parseAction('enable2') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030073 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030074
     * @tc.number SUB_RESMGR_OVERLAY_03_0074
     * @tc.desc   messageKeyOf(addresource, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030074 begin');
      const result: string = OverlayController.messageKeyOf('addresource', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('addresource') !== ''), String(false));
      expect(OverlayController.parseAction('addresource') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030074 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030075
     * @tc.number SUB_RESMGR_OVERLAY_03_0075
     * @tc.desc   messageKeyOf(remove_resourc, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030075 begin');
      const result: string = OverlayController.messageKeyOf('remove_resourc', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('remove_resourc') !== ''), String(false));
      expect(OverlayController.parseAction('remove_resourc') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030075 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030076
     * @tc.number SUB_RESMGR_OVERLAY_03_0076
     * @tc.desc   messageKeyOf(dis-able, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030076 begin');
      const result: string = OverlayController.messageKeyOf('dis-able', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('dis-able') !== ''), String(false));
      expect(OverlayController.parseAction('dis-able') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030076 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030077
     * @tc.number SUB_RESMGR_OVERLAY_03_0077
     * @tc.desc   messageKeyOf(en-able, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030077 begin');
      const result: string = OverlayController.messageKeyOf('en-able', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('en-able') !== ''), String(false));
      expect(OverlayController.parseAction('en-able') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030077 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030078
     * @tc.number SUB_RESMGR_OVERLAY_03_0078
     * @tc.desc   messageKeyOf(add, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030078 begin');
      const result: string = OverlayController.messageKeyOf('add', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('add') !== ''), String(false));
      expect(OverlayController.parseAction('add') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030078 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030079
     * @tc.number SUB_RESMGR_OVERLAY_03_0079
     * @tc.desc   messageKeyOf(remove, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030079 begin');
      const result: string = OverlayController.messageKeyOf('remove', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('remove') !== ''), String(false));
      expect(OverlayController.parseAction('remove') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030079 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030080
     * @tc.number SUB_RESMGR_OVERLAY_03_0080
     * @tc.desc   messageKeyOf(disable-, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030080 begin');
      const result: string = OverlayController.messageKeyOf('disable-', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('disable-') !== ''), String(false));
      expect(OverlayController.parseAction('disable-') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030080 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030081
     * @tc.number SUB_RESMGR_OVERLAY_03_0081
     * @tc.desc   messageKeyOf(-disable, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030081 begin');
      const result: string = OverlayController.messageKeyOf('-disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('-disable') !== ''), String(false));
      expect(OverlayController.parseAction('-disable') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030081 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030082
     * @tc.number SUB_RESMGR_OVERLAY_03_0082
     * @tc.desc   messageKeyOf(enable_, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030082 begin');
      const result: string = OverlayController.messageKeyOf('enable_', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('enable_') !== ''), String(false));
      expect(OverlayController.parseAction('enable_') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030082 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030083
     * @tc.number SUB_RESMGR_OVERLAY_03_0083
     * @tc.desc   messageKeyOf(_enable, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030083 begin');
      const result: string = OverlayController.messageKeyOf('_enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('_enable') !== ''), String(false));
      expect(OverlayController.parseAction('_enable') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030083 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030084
     * @tc.number SUB_RESMGR_OVERLAY_03_0084
     * @tc.desc   messageKeyOf(addResource1, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030084 begin');
      const result: string = OverlayController.messageKeyOf('addResource1', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('addResource1') !== ''), String(false));
      expect(OverlayController.parseAction('addResource1') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030084 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030085
     * @tc.number SUB_RESMGR_OVERLAY_03_0085
     * @tc.desc   messageKeyOf(1addResource, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030085 begin');
      const result: string = OverlayController.messageKeyOf('1addResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('1addResource') !== ''), String(false));
      expect(OverlayController.parseAction('1addResource') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030085 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030086
     * @tc.number SUB_RESMGR_OVERLAY_03_0086
     * @tc.desc   messageKeyOf(removeResource1, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030086 begin');
      const result: string = OverlayController.messageKeyOf('removeResource1', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('removeResource1') !== ''), String(false));
      expect(OverlayController.parseAction('removeResource1') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030086 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030087
     * @tc.number SUB_RESMGR_OVERLAY_03_0087
     * @tc.desc   messageKeyOf(, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030087 begin');
      const result: string = OverlayController.messageKeyOf('', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('') !== ''), String(false));
      expect(OverlayController.parseAction('') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030087 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030088
     * @tc.number SUB_RESMGR_OVERLAY_03_0088
     * @tc.desc   messageKeyOf(disable, false) -> [unEnableFailed]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030088 begin');
      const result: string = OverlayController.messageKeyOf('disable', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unEnableFailed'));
      expect(result).assertEqual('unEnableFailed');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('disable') !== ''), String(true));
      expect(OverlayController.parseAction('disable') !== '').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030088 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030089
     * @tc.number SUB_RESMGR_OVERLAY_03_0089
     * @tc.desc   messageKeyOf(enable, true) -> [enableSuccess]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030089 begin');
      const result: string = OverlayController.messageKeyOf('enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enableSuccess'));
      expect(result).assertEqual('enableSuccess');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('enable') !== ''), String(true));
      expect(OverlayController.parseAction('enable') !== '').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030089 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030090
     * @tc.number SUB_RESMGR_OVERLAY_03_0090
     * @tc.desc   messageKeyOf(addResource, false) -> [test_string]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030090 begin');
      const result: string = OverlayController.messageKeyOf('addResource', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('test_string'));
      expect(result).assertEqual('test_string');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('addResource') !== ''), String(true));
      expect(OverlayController.parseAction('addResource') !== '').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030090 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030091
     * @tc.number SUB_RESMGR_OVERLAY_03_0091
     * @tc.desc   messageKeyOf(removeResource, true) -> [test_string]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030091 begin');
      const result: string = OverlayController.messageKeyOf('removeResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('test_string'));
      expect(result).assertEqual('test_string');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('removeResource') !== ''), String(true));
      expect(OverlayController.parseAction('removeResource') !== '').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030091 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030092
     * @tc.number SUB_RESMGR_OVERLAY_03_0092
     * @tc.desc   messageKeyOf(Disable, false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030092 begin');
      const result: string = OverlayController.messageKeyOf('Disable', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('Disable') !== ''), String(false));
      expect(OverlayController.parseAction('Disable') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030092 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030093
     * @tc.number SUB_RESMGR_OVERLAY_03_0093
     * @tc.desc   messageKeyOf(ENABLE, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030093 begin');
      const result: string = OverlayController.messageKeyOf('ENABLE', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('ENABLE') !== ''), String(false));
      expect(OverlayController.parseAction('ENABLE') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030093 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030094
     * @tc.number SUB_RESMGR_OVERLAY_03_0094
     * @tc.desc   messageKeyOf(enable , false) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030094 begin');
      const result: string = OverlayController.messageKeyOf('enable ', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction('enable ') !== ''), String(false));
      expect(OverlayController.parseAction('enable ') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030094 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB030095
     * @tc.number SUB_RESMGR_OVERLAY_03_0095
     * @tc.desc   messageKeyOf( enable, true) -> []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB030095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030095 begin');
      const result: string = OverlayController.messageKeyOf(' enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.parseAction(' enable') !== ''), String(false));
      expect(OverlayController.parseAction(' enable') !== '').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
          || result === 'test_string'));
      expect(result.length === 0 || result.endsWith('Success') || result.endsWith('Failed')
        || result === 'test_string').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB030095 end');
    })

    /**
     * @tc.name   testOverlayCtrlMsgB0396
     * @tc.number SUB_RESMGR_OVERLAY_03_0096
     * @tc.desc   开关动作的成功与失败文案必须区分
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlMsgB0396', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB0396 begin');
      expect(OverlayController.messageKeyOf('disable', true)).assertEqual('unEnableSuccess');
      expect(OverlayController.messageKeyOf('disable', false)).assertEqual('unEnableFailed');
      expect(OverlayController.messageKeyOf('enable', true)).assertEqual('enableSuccess');
      expect(OverlayController.messageKeyOf('addResource', false)).assertEqual('test_string');
      expect(OverlayController.messageKeyOf('reload', true)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlMsgB0396 end');
    })
  })
}
