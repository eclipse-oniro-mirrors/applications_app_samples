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

export default function overlayCtrlResTest() {
  describe('OverlayCtrlResTest', () => {

    /**
     * @tc.name   testOverlayCtrlRes0001
     * @tc.number SUB_RESMGR_OVERLAY_02_0001
     * @tc.desc   buildHspPath of [/data/storage/el1/bundle] valid=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0001 begin');
      const result: string = OverlayController.buildHspPath('/data/storage/el1/bundle');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('/data/storage/el1/bundle/libraryRuntimeOverlay-default-signed.hsp'));
      expect(result).assertEqual('/data/storage/el1/bundle/libraryRuntimeOverlay-default-signed.hsp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('/data/storage/el1/bundle')), String(true));
      expect(OverlayController.isValidCodeDir('/data/storage/el1/bundle')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(true));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0001 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0002
     * @tc.number SUB_RESMGR_OVERLAY_02_0002
     * @tc.desc   buildHspPath of [/data/app/el1/bundle] valid=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0002 begin');
      const result: string = OverlayController.buildHspPath('/data/app/el1/bundle');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('/data/app/el1/bundle/libraryRuntimeOverlay-default-signed.hsp'));
      expect(result).assertEqual('/data/app/el1/bundle/libraryRuntimeOverlay-default-signed.hsp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('/data/app/el1/bundle')), String(true));
      expect(OverlayController.isValidCodeDir('/data/app/el1/bundle')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(true));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0002 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0003
     * @tc.number SUB_RESMGR_OVERLAY_02_0003
     * @tc.desc   buildHspPath of [/data/app/el2/base/haps/entry/files] valid=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0003 begin');
      const result: string = OverlayController.buildHspPath('/data/app/el2/base/haps/entry/files');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('/data/app/el2/base/haps/entry/files/libraryRuntimeOverlay-default-signed.hsp'));
      expect(result).assertEqual('/data/app/el2/base/haps/entry/files/libraryRuntimeOverlay-default-signed.hsp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('/data/app/el2/base/haps/entry/files')), String(true));
      expect(OverlayController.isValidCodeDir('/data/app/el2/base/haps/entry/files')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(true));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0003 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0004
     * @tc.number SUB_RESMGR_OVERLAY_02_0004
     * @tc.desc   buildHspPath of [/data/app/el2/100/base/ohos.samples.resourcemanager/haps/entry] valid=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0004 begin');
      const result: string = OverlayController.buildHspPath('/data/app/el2/100/base/ohos.sam' +
        'ples.resourcemanager/haps/entry');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result),
          String('/data/app/el2/100/base/ohos.samples.resourcemanager/' +
            'haps/entry/libraryRuntimeOverlay-default-signed.hsp'));
      expect(result)
        .assertEqual(
          '/data/app/el2/100/base/ohos.samples.resourcemanager/haps/entry/libraryRuntimeOverlay-default-signed.hsp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('/data/app/el2/100/base/ohos.samples.resourcemanager/haps/entry')),
          String(true));
      expect(OverlayController.isValidCodeDir('/data/app/el2/100/base/ohos.samples.resourcemanager/haps/entry'))
        .assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(true));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0004 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0005
     * @tc.number SUB_RESMGR_OVERLAY_02_0005
     * @tc.desc   buildHspPath of [/data] valid=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0005 begin');
      const result: string = OverlayController.buildHspPath('/data');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('/data/libraryRuntimeOverlay-default-signed.hsp'));
      expect(result).assertEqual('/data/libraryRuntimeOverlay-default-signed.hsp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('/data')), String(true));
      expect(OverlayController.isValidCodeDir('/data')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(true));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0005 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0006
     * @tc.number SUB_RESMGR_OVERLAY_02_0006
     * @tc.desc   buildHspPath of [/d] valid=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0006 begin');
      const result: string = OverlayController.buildHspPath('/d');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('/d/libraryRuntimeOverlay-default-signed.hsp'));
      expect(result).assertEqual('/d/libraryRuntimeOverlay-default-signed.hsp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('/d')), String(true));
      expect(OverlayController.isValidCodeDir('/d')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(true));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0006 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0007
     * @tc.number SUB_RESMGR_OVERLAY_02_0007
     * @tc.desc   buildHspPath of [/] valid=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0007 begin');
      const result: string = OverlayController.buildHspPath('/');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('/')), String(false));
      expect(OverlayController.isValidCodeDir('/')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(false));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0007 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0008
     * @tc.number SUB_RESMGR_OVERLAY_02_0008
     * @tc.desc   buildHspPath of [] valid=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0008 begin');
      const result: string = OverlayController.buildHspPath('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('')), String(false));
      expect(OverlayController.isValidCodeDir('')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(false));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0008 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0009
     * @tc.number SUB_RESMGR_OVERLAY_02_0009
     * @tc.desc   buildHspPath of [data/app] valid=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0009 begin');
      const result: string = OverlayController.buildHspPath('data/app');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('data/app')), String(false));
      expect(OverlayController.isValidCodeDir('data/app')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(false));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0009 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0010
     * @tc.number SUB_RESMGR_OVERLAY_02_0010
     * @tc.desc   buildHspPath of [data] valid=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0010 begin');
      const result: string = OverlayController.buildHspPath('data');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('data')), String(false));
      expect(OverlayController.isValidCodeDir('data')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(false));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0010 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0011
     * @tc.number SUB_RESMGR_OVERLAY_02_0011
     * @tc.desc   buildHspPath of [/data/app/] valid=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0011 begin');
      const result: string = OverlayController.buildHspPath('/data/app/');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('/data/app/')), String(false));
      expect(OverlayController.isValidCodeDir('/data/app/')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(false));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0011 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0012
     * @tc.number SUB_RESMGR_OVERLAY_02_0012
     * @tc.desc   buildHspPath of [/data/] valid=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0012 begin');
      const result: string = OverlayController.buildHspPath('/data/');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('/data/')), String(false));
      expect(OverlayController.isValidCodeDir('/data/')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(false));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0012 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0013
     * @tc.number SUB_RESMGR_OVERLAY_02_0013
     * @tc.desc   buildHspPath of [/data/app//] valid=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0013 begin');
      const result: string = OverlayController.buildHspPath('/data/app//');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('/data/app//')), String(false));
      expect(OverlayController.isValidCodeDir('/data/app//')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(false));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0013 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0014
     * @tc.number SUB_RESMGR_OVERLAY_02_0014
     * @tc.desc   buildHspPath of [/data/app///] valid=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0014 begin');
      const result: string = OverlayController.buildHspPath('/data/app///');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('/data/app///')), String(false));
      expect(OverlayController.isValidCodeDir('/data/app///')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(false));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0014 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0015
     * @tc.number SUB_RESMGR_OVERLAY_02_0015
     * @tc.desc   buildHspPath of [/data/app/haps/entry/] valid=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0015 begin');
      const result: string = OverlayController.buildHspPath('/data/app/haps/entry/');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('/data/app/haps/entry/')), String(false));
      expect(OverlayController.isValidCodeDir('/data/app/haps/entry/')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(false));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0015 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0016
     * @tc.number SUB_RESMGR_OVERLAY_02_0016
     * @tc.desc   buildHspPath of [ /data/app] valid=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0016 begin');
      const result: string = OverlayController.buildHspPath(' /data/app');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir(' /data/app')), String(false));
      expect(OverlayController.isValidCodeDir(' /data/app')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(false));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0016 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0017
     * @tc.number SUB_RESMGR_OVERLAY_02_0017
     * @tc.desc   buildHspPath of [/data/app ] valid=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0017 begin');
      const result: string = OverlayController.buildHspPath('/data/app ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('/data/app /libraryRuntimeOverlay-default-signed.hsp'));
      expect(result).assertEqual('/data/app /libraryRuntimeOverlay-default-signed.hsp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('/data/app ')), String(true));
      expect(OverlayController.isValidCodeDir('/data/app ')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(true));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0017 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0018
     * @tc.number SUB_RESMGR_OVERLAY_02_0018
     * @tc.desc   buildHspPath of [  /data/app] valid=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0018 begin');
      const result: string = OverlayController.buildHspPath('  /data/app');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('  /data/app')), String(false));
      expect(OverlayController.isValidCodeDir('  /data/app')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(false));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0018 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0019
     * @tc.number SUB_RESMGR_OVERLAY_02_0019
     * @tc.desc   buildHspPath of [/ data/app] valid=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0019 begin');
      const result: string = OverlayController.buildHspPath('/ data/app');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('/ data/app/libraryRuntimeOverlay-default-signed.hsp'));
      expect(result).assertEqual('/ data/app/libraryRuntimeOverlay-default-signed.hsp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('/ data/app')), String(true));
      expect(OverlayController.isValidCodeDir('/ data/app')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(true));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0019 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0020
     * @tc.number SUB_RESMGR_OVERLAY_02_0020
     * @tc.desc   buildHspPath of [//data/app] valid=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0020 begin');
      const result: string = OverlayController.buildHspPath('//data/app');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('//data/app/libraryRuntimeOverlay-default-signed.hsp'));
      expect(result).assertEqual('//data/app/libraryRuntimeOverlay-default-signed.hsp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('//data/app')), String(true));
      expect(OverlayController.isValidCodeDir('//data/app')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(true));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0020 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0021
     * @tc.number SUB_RESMGR_OVERLAY_02_0021
     * @tc.desc   buildHspPath of [///data] valid=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0021 begin');
      const result: string = OverlayController.buildHspPath('///data');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('///data/libraryRuntimeOverlay-default-signed.hsp'));
      expect(result).assertEqual('///data/libraryRuntimeOverlay-default-signed.hsp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('///data')), String(true));
      expect(OverlayController.isValidCodeDir('///data')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(true));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0021 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0022
     * @tc.number SUB_RESMGR_OVERLAY_02_0022
     * @tc.desc   buildHspPath of [/data\app] valid=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0022 begin');
      const result: string = OverlayController.buildHspPath('/data\app');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('/data\app/libraryRuntimeOverlay-default-signed.hsp'));
      expect(result).assertEqual('/data\app/libraryRuntimeOverlay-default-signed.hsp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('/data\app')), String(true));
      expect(OverlayController.isValidCodeDir('/data\app')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(true));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0022 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0023
     * @tc.number SUB_RESMGR_OVERLAY_02_0023
     * @tc.desc   buildHspPath of [\data\app] valid=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0023 begin');
      const result: string = OverlayController.buildHspPath('\data\app');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('\data\app')), String(false));
      expect(OverlayController.isValidCodeDir('\data\app')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(false));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0023 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0024
     * @tc.number SUB_RESMGR_OVERLAY_02_0024
     * @tc.desc   buildHspPath of [C:\data\app] valid=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0024 begin');
      const result: string = OverlayController.buildHspPath('C:\data\app');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('C:\data\app')), String(false));
      expect(OverlayController.isValidCodeDir('C:\data\app')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(false));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0024 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0025
     * @tc.number SUB_RESMGR_OVERLAY_02_0025
     * @tc.desc   buildHspPath of [C:/data/app] valid=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0025 begin');
      const result: string = OverlayController.buildHspPath('C:/data/app');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('C:/data/app')), String(false));
      expect(OverlayController.isValidCodeDir('C:/data/app')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(false));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0025 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0026
     * @tc.number SUB_RESMGR_OVERLAY_02_0026
     * @tc.desc   buildHspPath of [data:/app] valid=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0026 begin');
      const result: string = OverlayController.buildHspPath('data:/app');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('data:/app')), String(false));
      expect(OverlayController.isValidCodeDir('data:/app')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(false));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0026 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0027
     * @tc.number SUB_RESMGR_OVERLAY_02_0027
     * @tc.desc   buildHspPath of [/data/app/entry] valid=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0027 begin');
      const result: string = OverlayController.buildHspPath('/data/app/entry');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('/data/app/entry/libraryRuntimeOverlay-default-signed.hsp'));
      expect(result).assertEqual('/data/app/entry/libraryRuntimeOverlay-default-signed.hsp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('/data/app/entry')), String(true));
      expect(OverlayController.isValidCodeDir('/data/app/entry')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(true));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0027 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0028
     * @tc.number SUB_RESMGR_OVERLAY_02_0028
     * @tc.desc   buildHspPath of [/data/app/entry/files] valid=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0028 begin');
      const result: string = OverlayController.buildHspPath('/data/app/entry/files');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('/data/app/entry/files/libraryRuntimeOverlay-default-signed.hsp'));
      expect(result).assertEqual('/data/app/entry/files/libraryRuntimeOverlay-default-signed.hsp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('/data/app/entry/files')), String(true));
      expect(OverlayController.isValidCodeDir('/data/app/entry/files')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(true));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0028 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0029
     * @tc.number SUB_RESMGR_OVERLAY_02_0029
     * @tc.desc   buildHspPath of [/data/app/entry/files/media] valid=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0029 begin');
      const result: string = OverlayController.buildHspPath('/data/app/entry/files/media');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('/data/app/entry/files/media/libraryRuntimeOverlay-default-signed.hsp'));
      expect(result).assertEqual('/data/app/entry/files/media/libraryRuntimeOverlay-default-signed.hsp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('/data/app/entry/files/media')), String(true));
      expect(OverlayController.isValidCodeDir('/data/app/entry/files/media')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(true));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0029 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0030
     * @tc.number SUB_RESMGR_OVERLAY_02_0030
     * @tc.desc   buildHspPath of [/storage] valid=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0030 begin');
      const result: string = OverlayController.buildHspPath('/storage');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('/storage/libraryRuntimeOverlay-default-signed.hsp'));
      expect(result).assertEqual('/storage/libraryRuntimeOverlay-default-signed.hsp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('/storage')), String(true));
      expect(OverlayController.isValidCodeDir('/storage')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(true));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0030 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0031
     * @tc.number SUB_RESMGR_OVERLAY_02_0031
     * @tc.desc   buildHspPath of [/storage/emulated/0] valid=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0031 begin');
      const result: string = OverlayController.buildHspPath('/storage/emulated/0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('/storage/emulated/0/libraryRuntimeOverlay-default-signed.hsp'));
      expect(result).assertEqual('/storage/emulated/0/libraryRuntimeOverlay-default-signed.hsp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('/storage/emulated/0')), String(true));
      expect(OverlayController.isValidCodeDir('/storage/emulated/0')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(true));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0031 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0032
     * @tc.number SUB_RESMGR_OVERLAY_02_0032
     * @tc.desc   buildHspPath of [/tmp] valid=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0032 begin');
      const result: string = OverlayController.buildHspPath('/tmp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('/tmp/libraryRuntimeOverlay-default-signed.hsp'));
      expect(result).assertEqual('/tmp/libraryRuntimeOverlay-default-signed.hsp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('/tmp')), String(true));
      expect(OverlayController.isValidCodeDir('/tmp')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(true));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0032 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0033
     * @tc.number SUB_RESMGR_OVERLAY_02_0033
     * @tc.desc   buildHspPath of [/tmp/] valid=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0033 begin');
      const result: string = OverlayController.buildHspPath('/tmp/');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('/tmp/')), String(false));
      expect(OverlayController.isValidCodeDir('/tmp/')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(false));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0033 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0034
     * @tc.number SUB_RESMGR_OVERLAY_02_0034
     * @tc.desc   buildHspPath of [/tmp/x] valid=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0034 begin');
      const result: string = OverlayController.buildHspPath('/tmp/x');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('/tmp/x/libraryRuntimeOverlay-default-signed.hsp'));
      expect(result).assertEqual('/tmp/x/libraryRuntimeOverlay-default-signed.hsp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('/tmp/x')), String(true));
      expect(OverlayController.isValidCodeDir('/tmp/x')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(true));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0034 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0035
     * @tc.number SUB_RESMGR_OVERLAY_02_0035
     * @tc.desc   buildHspPath of [/tmp/xy] valid=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0035 begin');
      const result: string = OverlayController.buildHspPath('/tmp/xy');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('/tmp/xy/libraryRuntimeOverlay-default-signed.hsp'));
      expect(result).assertEqual('/tmp/xy/libraryRuntimeOverlay-default-signed.hsp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('/tmp/xy')), String(true));
      expect(OverlayController.isValidCodeDir('/tmp/xy')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(true));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0035 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0036
     * @tc.number SUB_RESMGR_OVERLAY_02_0036
     * @tc.desc   buildHspPath of [/tmp/xyz/y] valid=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0036 begin');
      const result: string = OverlayController.buildHspPath('/tmp/xyz/y');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('/tmp/xyz/y/libraryRuntimeOverlay-default-signed.hsp'));
      expect(result).assertEqual('/tmp/xyz/y/libraryRuntimeOverlay-default-signed.hsp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('/tmp/xyz/y')), String(true));
      expect(OverlayController.isValidCodeDir('/tmp/xyz/y')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(true));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0036 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0037
     * @tc.number SUB_RESMGR_OVERLAY_02_0037
     * @tc.desc   buildHspPath of [.] valid=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0037 begin');
      const result: string = OverlayController.buildHspPath('.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('.')), String(false));
      expect(OverlayController.isValidCodeDir('.')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(false));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0037 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0038
     * @tc.number SUB_RESMGR_OVERLAY_02_0038
     * @tc.desc   buildHspPath of [..] valid=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0038 begin');
      const result: string = OverlayController.buildHspPath('..');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('..')), String(false));
      expect(OverlayController.isValidCodeDir('..')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(false));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0038 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0039
     * @tc.number SUB_RESMGR_OVERLAY_02_0039
     * @tc.desc   buildHspPath of [./data] valid=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0039 begin');
      const result: string = OverlayController.buildHspPath('./data');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('./data')), String(false));
      expect(OverlayController.isValidCodeDir('./data')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(false));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0039 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0040
     * @tc.number SUB_RESMGR_OVERLAY_02_0040
     * @tc.desc   buildHspPath of [../data] valid=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0040 begin');
      const result: string = OverlayController.buildHspPath('../data');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('../data')), String(false));
      expect(OverlayController.isValidCodeDir('../data')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(false));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0040 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0041
     * @tc.number SUB_RESMGR_OVERLAY_02_0041
     * @tc.desc   buildHspPath of [~/data] valid=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0041 begin');
      const result: string = OverlayController.buildHspPath('~/data');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('~/data')), String(false));
      expect(OverlayController.isValidCodeDir('~/data')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(false));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0041 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0042
     * @tc.number SUB_RESMGR_OVERLAY_02_0042
     * @tc.desc   buildHspPath of [/data/app/lib] valid=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0042 begin');
      const result: string = OverlayController.buildHspPath('/data/app/lib');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('/data/app/lib/libraryRuntimeOverlay-default-signed.hsp'));
      expect(result).assertEqual('/data/app/lib/libraryRuntimeOverlay-default-signed.hsp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('/data/app/lib')), String(true));
      expect(OverlayController.isValidCodeDir('/data/app/lib')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(true));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0042 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0043
     * @tc.number SUB_RESMGR_OVERLAY_02_0043
     * @tc.desc   buildHspPath of [/data/app/lib/hsp] valid=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0043 begin');
      const result: string = OverlayController.buildHspPath('/data/app/lib/hsp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('/data/app/lib/hsp/libraryRuntimeOverlay-default-signed.hsp'));
      expect(result).assertEqual('/data/app/lib/hsp/libraryRuntimeOverlay-default-signed.hsp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('/data/app/lib/hsp')), String(true));
      expect(OverlayController.isValidCodeDir('/data/app/lib/hsp')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(true));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0043 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0044
     * @tc.number SUB_RESMGR_OVERLAY_02_0044
     * @tc.desc   buildHspPath of [/data/app/lib/hsp/] valid=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0044 begin');
      const result: string = OverlayController.buildHspPath('/data/app/lib/hsp/');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(OverlayController.isValidCodeDir('/data/app/lib/hsp/')), String(false));
      expect(OverlayController.isValidCodeDir('/data/app/lib/hsp/')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.endsWith(OverlayController.RUNTIME_HSP_NAME)), String(false));
      expect(result.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0044 end');
    })

    /**
     * @tc.name   testOverlayCtrlRes0045
     * @tc.number SUB_RESMGR_OVERLAY_02_0045
     * @tc.desc   末尾斜杠与相对路径都不能拼出 hsp 路径
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlRes0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0045 begin');
      // 合法目录拼出的路径必须只含一个分隔符，不能出现双斜杠
      const joined: string = OverlayController.buildHspPath('/data/app/el1/bundle');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        joined, '/data/app/el1/bundle/libraryRuntimeOverlay-default-signed.hsp');
      expect(joined).assertEqual('/data/app/el1/bundle/libraryRuntimeOverlay-default-signed.hsp');
      expect(joined.indexOf('//')).assertEqual(-1);
      // 末尾带斜杠时再拼接会产生双斜杠，因此必须直接拒绝
      const trailing: string = OverlayController.buildHspPath('/data/app/el1/bundle/');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', trailing, '');
      expect(trailing).assertEqual('');
      expect(OverlayController.isValidCodeDir('/data/app/el1/bundle/')).assertFalse();
      // 相对路径与空串同样不能作为 hsp 目录
      expect(OverlayController.buildHspPath('data/app')).assertEqual('');
      expect(OverlayController.buildHspPath('')).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlRes0045 end');
    })

  })
}
