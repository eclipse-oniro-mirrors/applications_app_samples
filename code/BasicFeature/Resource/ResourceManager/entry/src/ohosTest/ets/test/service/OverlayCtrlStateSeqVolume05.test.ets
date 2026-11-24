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
import { OverlayController, OverlayState } from '../../../../main/ets/service/OverlayController';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ResourceManager]';

export default function overlayCtrlStateSeqTest() {
  describe('OverlayCtrlStateSeqTest', () => {

    /**
     * @tc.name   testOverlayCtrlStateSeq0001
     * @tc.number SUB_RESMGR_OVERLAY_05_0001
     * @tc.desc   sequence enable(true) -> enable(true) -> enable(true) ends enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0001 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'enable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'enable', true);
      const result: string = OverlayController.nextStateOf(step2, 'enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('enabled'));
      expect(step1).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('enabled'));
      expect(step2).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enabled'));
      expect(result).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0001 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0002
     * @tc.number SUB_RESMGR_OVERLAY_05_0002
     * @tc.desc   sequence enable(true) -> enable(true) -> disable(true) ends disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0002 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'enable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'enable', true);
      const result: string = OverlayController.nextStateOf(step2, 'disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('enabled'));
      expect(step1).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('enabled'));
      expect(step2).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0002 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0003
     * @tc.number SUB_RESMGR_OVERLAY_05_0003
     * @tc.desc   sequence enable(true) -> enable(true) -> addResource(true) ends runtimeLoaded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0003 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'enable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'enable', true);
      const result: string = OverlayController.nextStateOf(step2, 'addResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('enabled'));
      expect(step1).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('enabled'));
      expect(step2).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('runtimeLoaded'));
      expect(result).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0003 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0004
     * @tc.number SUB_RESMGR_OVERLAY_05_0004
     * @tc.desc   sequence enable(true) -> enable(true) -> removeResource(true) ends runtimeRemoved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0004 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'enable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'enable', true);
      const result: string = OverlayController.nextStateOf(step2, 'removeResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('enabled'));
      expect(step1).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('enabled'));
      expect(step2).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('runtimeRemoved'));
      expect(result).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0004 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0005
     * @tc.number SUB_RESMGR_OVERLAY_05_0005
     * @tc.desc   sequence enable(true) -> disable(true) -> enable(true) ends enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0005 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'enable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'disable', true);
      const result: string = OverlayController.nextStateOf(step2, 'enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('enabled'));
      expect(step1).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('disabled'));
      expect(step2).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enabled'));
      expect(result).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0005 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0006
     * @tc.number SUB_RESMGR_OVERLAY_05_0006
     * @tc.desc   sequence enable(true) -> disable(true) -> disable(true) ends disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0006 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'enable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'disable', true);
      const result: string = OverlayController.nextStateOf(step2, 'disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('enabled'));
      expect(step1).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('disabled'));
      expect(step2).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0006 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0007
     * @tc.number SUB_RESMGR_OVERLAY_05_0007
     * @tc.desc   sequence enable(true) -> disable(true) -> addResource(true) ends runtimeLoaded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0007 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'enable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'disable', true);
      const result: string = OverlayController.nextStateOf(step2, 'addResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('enabled'));
      expect(step1).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('disabled'));
      expect(step2).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('runtimeLoaded'));
      expect(result).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0007 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0008
     * @tc.number SUB_RESMGR_OVERLAY_05_0008
     * @tc.desc   sequence enable(true) -> disable(true) -> removeResource(true) ends runtimeRemoved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0008 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'enable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'disable', true);
      const result: string = OverlayController.nextStateOf(step2, 'removeResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('enabled'));
      expect(step1).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('disabled'));
      expect(step2).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('runtimeRemoved'));
      expect(result).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0008 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0009
     * @tc.number SUB_RESMGR_OVERLAY_05_0009
     * @tc.desc   sequence enable(true) -> addResource(true) -> enable(true) ends enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0009 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'enable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'addResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('enabled'));
      expect(step1).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeLoaded'));
      expect(step2).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enabled'));
      expect(result).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0009 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0010
     * @tc.number SUB_RESMGR_OVERLAY_05_0010
     * @tc.desc   sequence enable(true) -> addResource(true) -> disable(true) ends disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0010 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'enable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'addResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('enabled'));
      expect(step1).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeLoaded'));
      expect(step2).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0010 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0011
     * @tc.number SUB_RESMGR_OVERLAY_05_0011
     * @tc.desc   sequence enable(true) -> addResource(true) -> addResource(true) ends runtimeLoaded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0011 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'enable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'addResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'addResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('enabled'));
      expect(step1).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeLoaded'));
      expect(step2).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('runtimeLoaded'));
      expect(result).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0011 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0012
     * @tc.number SUB_RESMGR_OVERLAY_05_0012
     * @tc.desc   sequence enable(true) -> addResource(true) -> removeResource(true) ends runtimeRemoved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0012 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'enable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'addResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'removeResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('enabled'));
      expect(step1).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeLoaded'));
      expect(step2).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('runtimeRemoved'));
      expect(result).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0012 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0013
     * @tc.number SUB_RESMGR_OVERLAY_05_0013
     * @tc.desc   sequence enable(true) -> removeResource(true) -> enable(true) ends enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0013 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'enable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'removeResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('enabled'));
      expect(step1).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeRemoved'));
      expect(step2).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enabled'));
      expect(result).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0013 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0014
     * @tc.number SUB_RESMGR_OVERLAY_05_0014
     * @tc.desc   sequence enable(true) -> removeResource(true) -> disable(true) ends disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0014 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'enable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'removeResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('enabled'));
      expect(step1).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeRemoved'));
      expect(step2).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0014 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0015
     * @tc.number SUB_RESMGR_OVERLAY_05_0015
     * @tc.desc   sequence enable(true) -> removeResource(true) -> addResource(true) ends runtimeLoaded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0015 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'enable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'removeResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'addResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('enabled'));
      expect(step1).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeRemoved'));
      expect(step2).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('runtimeLoaded'));
      expect(result).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0015 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0016
     * @tc.number SUB_RESMGR_OVERLAY_05_0016
     * @tc.desc   sequence enable(true) -> removeResource(true) -> removeResource(true) ends runtimeRemoved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0016 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'enable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'removeResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'removeResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('enabled'));
      expect(step1).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeRemoved'));
      expect(step2).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('runtimeRemoved'));
      expect(result).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0016 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0017
     * @tc.number SUB_RESMGR_OVERLAY_05_0017
     * @tc.desc   sequence disable(true) -> enable(true) -> enable(true) ends enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0017 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'disable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'enable', true);
      const result: string = OverlayController.nextStateOf(step2, 'enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('disabled'));
      expect(step1).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('enabled'));
      expect(step2).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enabled'));
      expect(result).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0017 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0018
     * @tc.number SUB_RESMGR_OVERLAY_05_0018
     * @tc.desc   sequence disable(true) -> enable(true) -> disable(true) ends disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0018 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'disable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'enable', true);
      const result: string = OverlayController.nextStateOf(step2, 'disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('disabled'));
      expect(step1).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('enabled'));
      expect(step2).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0018 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0019
     * @tc.number SUB_RESMGR_OVERLAY_05_0019
     * @tc.desc   sequence disable(true) -> enable(true) -> addResource(true) ends runtimeLoaded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0019 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'disable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'enable', true);
      const result: string = OverlayController.nextStateOf(step2, 'addResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('disabled'));
      expect(step1).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('enabled'));
      expect(step2).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('runtimeLoaded'));
      expect(result).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0019 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0020
     * @tc.number SUB_RESMGR_OVERLAY_05_0020
     * @tc.desc   sequence disable(true) -> enable(true) -> removeResource(true) ends runtimeRemoved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0020 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'disable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'enable', true);
      const result: string = OverlayController.nextStateOf(step2, 'removeResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('disabled'));
      expect(step1).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('enabled'));
      expect(step2).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('runtimeRemoved'));
      expect(result).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0020 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0021
     * @tc.number SUB_RESMGR_OVERLAY_05_0021
     * @tc.desc   sequence disable(true) -> disable(true) -> enable(true) ends enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0021 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'disable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'disable', true);
      const result: string = OverlayController.nextStateOf(step2, 'enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('disabled'));
      expect(step1).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('disabled'));
      expect(step2).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enabled'));
      expect(result).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0021 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0022
     * @tc.number SUB_RESMGR_OVERLAY_05_0022
     * @tc.desc   sequence disable(true) -> disable(true) -> disable(true) ends disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0022 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'disable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'disable', true);
      const result: string = OverlayController.nextStateOf(step2, 'disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('disabled'));
      expect(step1).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('disabled'));
      expect(step2).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0022 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0023
     * @tc.number SUB_RESMGR_OVERLAY_05_0023
     * @tc.desc   sequence disable(true) -> disable(true) -> addResource(true) ends runtimeLoaded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0023 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'disable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'disable', true);
      const result: string = OverlayController.nextStateOf(step2, 'addResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('disabled'));
      expect(step1).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('disabled'));
      expect(step2).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('runtimeLoaded'));
      expect(result).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0023 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0024
     * @tc.number SUB_RESMGR_OVERLAY_05_0024
     * @tc.desc   sequence disable(true) -> disable(true) -> removeResource(true) ends runtimeRemoved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0024 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'disable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'disable', true);
      const result: string = OverlayController.nextStateOf(step2, 'removeResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('disabled'));
      expect(step1).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('disabled'));
      expect(step2).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('runtimeRemoved'));
      expect(result).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0024 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0025
     * @tc.number SUB_RESMGR_OVERLAY_05_0025
     * @tc.desc   sequence disable(true) -> addResource(true) -> enable(true) ends enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0025 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'disable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'addResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('disabled'));
      expect(step1).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeLoaded'));
      expect(step2).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enabled'));
      expect(result).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0025 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0026
     * @tc.number SUB_RESMGR_OVERLAY_05_0026
     * @tc.desc   sequence disable(true) -> addResource(true) -> disable(true) ends disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0026 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'disable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'addResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('disabled'));
      expect(step1).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeLoaded'));
      expect(step2).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0026 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0027
     * @tc.number SUB_RESMGR_OVERLAY_05_0027
     * @tc.desc   sequence disable(true) -> addResource(true) -> addResource(true) ends runtimeLoaded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0027 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'disable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'addResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'addResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('disabled'));
      expect(step1).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeLoaded'));
      expect(step2).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('runtimeLoaded'));
      expect(result).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0027 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0028
     * @tc.number SUB_RESMGR_OVERLAY_05_0028
     * @tc.desc   sequence disable(true) -> addResource(true) -> removeResource(true) ends runtimeRemoved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0028 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'disable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'addResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'removeResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('disabled'));
      expect(step1).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeLoaded'));
      expect(step2).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('runtimeRemoved'));
      expect(result).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0028 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0029
     * @tc.number SUB_RESMGR_OVERLAY_05_0029
     * @tc.desc   sequence disable(true) -> removeResource(true) -> enable(true) ends enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0029 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'disable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'removeResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('disabled'));
      expect(step1).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeRemoved'));
      expect(step2).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enabled'));
      expect(result).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0029 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0030
     * @tc.number SUB_RESMGR_OVERLAY_05_0030
     * @tc.desc   sequence disable(true) -> removeResource(true) -> disable(true) ends disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0030 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'disable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'removeResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('disabled'));
      expect(step1).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeRemoved'));
      expect(step2).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0030 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0031
     * @tc.number SUB_RESMGR_OVERLAY_05_0031
     * @tc.desc   sequence disable(true) -> removeResource(true) -> addResource(true) ends runtimeLoaded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0031 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'disable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'removeResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'addResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('disabled'));
      expect(step1).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeRemoved'));
      expect(step2).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('runtimeLoaded'));
      expect(result).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0031 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0032
     * @tc.number SUB_RESMGR_OVERLAY_05_0032
     * @tc.desc   sequence disable(true) -> removeResource(true) -> removeResource(true) ends runtimeRemoved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0032 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'disable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'removeResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'removeResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('disabled'));
      expect(step1).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeRemoved'));
      expect(step2).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('runtimeRemoved'));
      expect(result).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0032 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0033
     * @tc.number SUB_RESMGR_OVERLAY_05_0033
     * @tc.desc   sequence addResource(true) -> enable(true) -> enable(true) ends enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0033 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'addResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'enable', true);
      const result: string = OverlayController.nextStateOf(step2, 'enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeLoaded'));
      expect(step1).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('enabled'));
      expect(step2).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enabled'));
      expect(result).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0033 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0034
     * @tc.number SUB_RESMGR_OVERLAY_05_0034
     * @tc.desc   sequence addResource(true) -> enable(true) -> disable(true) ends disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0034 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'addResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'enable', true);
      const result: string = OverlayController.nextStateOf(step2, 'disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeLoaded'));
      expect(step1).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('enabled'));
      expect(step2).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0034 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0035
     * @tc.number SUB_RESMGR_OVERLAY_05_0035
     * @tc.desc   sequence addResource(true) -> enable(true) -> addResource(true) ends runtimeLoaded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0035 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'addResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'enable', true);
      const result: string = OverlayController.nextStateOf(step2, 'addResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeLoaded'));
      expect(step1).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('enabled'));
      expect(step2).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('runtimeLoaded'));
      expect(result).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0035 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0036
     * @tc.number SUB_RESMGR_OVERLAY_05_0036
     * @tc.desc   sequence addResource(true) -> enable(true) -> removeResource(true) ends runtimeRemoved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0036 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'addResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'enable', true);
      const result: string = OverlayController.nextStateOf(step2, 'removeResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeLoaded'));
      expect(step1).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('enabled'));
      expect(step2).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('runtimeRemoved'));
      expect(result).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0036 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0037
     * @tc.number SUB_RESMGR_OVERLAY_05_0037
     * @tc.desc   sequence addResource(true) -> disable(true) -> enable(true) ends enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0037 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'addResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'disable', true);
      const result: string = OverlayController.nextStateOf(step2, 'enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeLoaded'));
      expect(step1).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('disabled'));
      expect(step2).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enabled'));
      expect(result).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0037 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0038
     * @tc.number SUB_RESMGR_OVERLAY_05_0038
     * @tc.desc   sequence addResource(true) -> disable(true) -> disable(true) ends disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0038 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'addResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'disable', true);
      const result: string = OverlayController.nextStateOf(step2, 'disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeLoaded'));
      expect(step1).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('disabled'));
      expect(step2).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0038 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0039
     * @tc.number SUB_RESMGR_OVERLAY_05_0039
     * @tc.desc   sequence addResource(true) -> disable(true) -> addResource(true) ends runtimeLoaded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0039 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'addResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'disable', true);
      const result: string = OverlayController.nextStateOf(step2, 'addResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeLoaded'));
      expect(step1).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('disabled'));
      expect(step2).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('runtimeLoaded'));
      expect(result).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0039 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0040
     * @tc.number SUB_RESMGR_OVERLAY_05_0040
     * @tc.desc   sequence addResource(true) -> disable(true) -> removeResource(true) ends runtimeRemoved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0040 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'addResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'disable', true);
      const result: string = OverlayController.nextStateOf(step2, 'removeResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeLoaded'));
      expect(step1).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('disabled'));
      expect(step2).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('runtimeRemoved'));
      expect(result).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0040 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0041
     * @tc.number SUB_RESMGR_OVERLAY_05_0041
     * @tc.desc   sequence addResource(true) -> addResource(true) -> enable(true) ends enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0041 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'addResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'addResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeLoaded'));
      expect(step1).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeLoaded'));
      expect(step2).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enabled'));
      expect(result).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0041 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0042
     * @tc.number SUB_RESMGR_OVERLAY_05_0042
     * @tc.desc   sequence addResource(true) -> addResource(true) -> disable(true) ends disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0042 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'addResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'addResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeLoaded'));
      expect(step1).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeLoaded'));
      expect(step2).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0042 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0043
     * @tc.number SUB_RESMGR_OVERLAY_05_0043
     * @tc.desc   sequence addResource(true) -> addResource(true) -> addResource(true) ends runtimeLoaded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0043 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'addResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'addResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'addResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeLoaded'));
      expect(step1).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeLoaded'));
      expect(step2).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('runtimeLoaded'));
      expect(result).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0043 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0044
     * @tc.number SUB_RESMGR_OVERLAY_05_0044
     * @tc.desc   sequence addResource(true) -> addResource(true) -> removeResource(true) ends runtimeRemoved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0044 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'addResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'addResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'removeResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeLoaded'));
      expect(step1).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeLoaded'));
      expect(step2).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('runtimeRemoved'));
      expect(result).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0044 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0045
     * @tc.number SUB_RESMGR_OVERLAY_05_0045
     * @tc.desc   sequence addResource(true) -> removeResource(true) -> enable(true) ends enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0045 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'addResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'removeResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeLoaded'));
      expect(step1).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeRemoved'));
      expect(step2).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enabled'));
      expect(result).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0045 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0046
     * @tc.number SUB_RESMGR_OVERLAY_05_0046
     * @tc.desc   sequence addResource(true) -> removeResource(true) -> disable(true) ends disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0046 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'addResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'removeResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeLoaded'));
      expect(step1).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeRemoved'));
      expect(step2).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0046 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0047
     * @tc.number SUB_RESMGR_OVERLAY_05_0047
     * @tc.desc   sequence addResource(true) -> removeResource(true) -> addResource(true) ends runtimeLoaded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0047 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'addResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'removeResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'addResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeLoaded'));
      expect(step1).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeRemoved'));
      expect(step2).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('runtimeLoaded'));
      expect(result).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0047 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0048
     * @tc.number SUB_RESMGR_OVERLAY_05_0048
     * @tc.desc   sequence addResource(true) -> removeResource(true) -> removeResource(true) ends runtimeRemoved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0048 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'addResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'removeResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'removeResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeLoaded'));
      expect(step1).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeRemoved'));
      expect(step2).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('runtimeRemoved'));
      expect(result).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0048 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0049
     * @tc.number SUB_RESMGR_OVERLAY_05_0049
     * @tc.desc   sequence removeResource(true) -> enable(true) -> enable(true) ends enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0049 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'removeResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'enable', true);
      const result: string = OverlayController.nextStateOf(step2, 'enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeRemoved'));
      expect(step1).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('enabled'));
      expect(step2).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enabled'));
      expect(result).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0049 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0050
     * @tc.number SUB_RESMGR_OVERLAY_05_0050
     * @tc.desc   sequence removeResource(true) -> enable(true) -> disable(true) ends disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0050 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'removeResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'enable', true);
      const result: string = OverlayController.nextStateOf(step2, 'disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeRemoved'));
      expect(step1).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('enabled'));
      expect(step2).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0050 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0051
     * @tc.number SUB_RESMGR_OVERLAY_05_0051
     * @tc.desc   sequence removeResource(true) -> enable(true) -> addResource(true) ends runtimeLoaded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0051 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'removeResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'enable', true);
      const result: string = OverlayController.nextStateOf(step2, 'addResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeRemoved'));
      expect(step1).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('enabled'));
      expect(step2).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('runtimeLoaded'));
      expect(result).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0051 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0052
     * @tc.number SUB_RESMGR_OVERLAY_05_0052
     * @tc.desc   sequence removeResource(true) -> enable(true) -> removeResource(true) ends runtimeRemoved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0052 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'removeResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'enable', true);
      const result: string = OverlayController.nextStateOf(step2, 'removeResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeRemoved'));
      expect(step1).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('enabled'));
      expect(step2).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('runtimeRemoved'));
      expect(result).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0052 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0053
     * @tc.number SUB_RESMGR_OVERLAY_05_0053
     * @tc.desc   sequence removeResource(true) -> disable(true) -> enable(true) ends enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0053 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'removeResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'disable', true);
      const result: string = OverlayController.nextStateOf(step2, 'enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeRemoved'));
      expect(step1).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('disabled'));
      expect(step2).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enabled'));
      expect(result).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0053 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0054
     * @tc.number SUB_RESMGR_OVERLAY_05_0054
     * @tc.desc   sequence removeResource(true) -> disable(true) -> disable(true) ends disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0054 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'removeResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'disable', true);
      const result: string = OverlayController.nextStateOf(step2, 'disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeRemoved'));
      expect(step1).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('disabled'));
      expect(step2).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0054 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0055
     * @tc.number SUB_RESMGR_OVERLAY_05_0055
     * @tc.desc   sequence removeResource(true) -> disable(true) -> addResource(true) ends runtimeLoaded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0055 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'removeResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'disable', true);
      const result: string = OverlayController.nextStateOf(step2, 'addResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeRemoved'));
      expect(step1).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('disabled'));
      expect(step2).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('runtimeLoaded'));
      expect(result).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0055 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0056
     * @tc.number SUB_RESMGR_OVERLAY_05_0056
     * @tc.desc   sequence removeResource(true) -> disable(true) -> removeResource(true) ends runtimeRemoved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0056 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'removeResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'disable', true);
      const result: string = OverlayController.nextStateOf(step2, 'removeResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeRemoved'));
      expect(step1).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('disabled'));
      expect(step2).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('runtimeRemoved'));
      expect(result).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0056 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0057
     * @tc.number SUB_RESMGR_OVERLAY_05_0057
     * @tc.desc   sequence removeResource(true) -> addResource(true) -> enable(true) ends enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0057 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'removeResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'addResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeRemoved'));
      expect(step1).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeLoaded'));
      expect(step2).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enabled'));
      expect(result).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0057 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0058
     * @tc.number SUB_RESMGR_OVERLAY_05_0058
     * @tc.desc   sequence removeResource(true) -> addResource(true) -> disable(true) ends disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0058 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'removeResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'addResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeRemoved'));
      expect(step1).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeLoaded'));
      expect(step2).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0058 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0059
     * @tc.number SUB_RESMGR_OVERLAY_05_0059
     * @tc.desc   sequence removeResource(true) -> addResource(true) -> addResource(true) ends runtimeLoaded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0059 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'removeResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'addResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'addResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeRemoved'));
      expect(step1).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeLoaded'));
      expect(step2).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('runtimeLoaded'));
      expect(result).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0059 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0060
     * @tc.number SUB_RESMGR_OVERLAY_05_0060
     * @tc.desc   sequence removeResource(true) -> addResource(true) -> removeResource(true) ends runtimeRemoved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0060 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'removeResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'addResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'removeResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeRemoved'));
      expect(step1).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeLoaded'));
      expect(step2).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('runtimeRemoved'));
      expect(result).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0060 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0061
     * @tc.number SUB_RESMGR_OVERLAY_05_0061
     * @tc.desc   sequence removeResource(true) -> removeResource(true) -> enable(true) ends enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0061 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'removeResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'removeResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeRemoved'));
      expect(step1).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeRemoved'));
      expect(step2).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enabled'));
      expect(result).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0061 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0062
     * @tc.number SUB_RESMGR_OVERLAY_05_0062
     * @tc.desc   sequence removeResource(true) -> removeResource(true) -> disable(true) ends disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0062 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'removeResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'removeResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeRemoved'));
      expect(step1).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeRemoved'));
      expect(step2).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0062 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0063
     * @tc.number SUB_RESMGR_OVERLAY_05_0063
     * @tc.desc   sequence removeResource(true) -> removeResource(true) -> addResource(true) ends runtimeLoaded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0063 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'removeResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'removeResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'addResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeRemoved'));
      expect(step1).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeRemoved'));
      expect(step2).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('runtimeLoaded'));
      expect(result).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0063 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0064
     * @tc.number SUB_RESMGR_OVERLAY_05_0064
     * @tc.desc   sequence removeResource(true) -> removeResource(true) -> removeResource(true) ends runtimeRemoved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0064 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'removeResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'removeResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'removeResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeRemoved'));
      expect(step1).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeRemoved'));
      expect(step2).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('runtimeRemoved'));
      expect(result).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0064 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0065
     * @tc.number SUB_RESMGR_OVERLAY_05_0065
     * @tc.desc   sequence enable(false) -> disable(true) -> enable(true) ends enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0065 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'enable', false);
      const step2: string = OverlayController.nextStateOf(step1, 'disable', true);
      const result: string = OverlayController.nextStateOf(step2, 'enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('initial'));
      expect(step1).assertEqual('initial');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('disabled'));
      expect(step2).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enabled'));
      expect(result).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0065 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0066
     * @tc.number SUB_RESMGR_OVERLAY_05_0066
     * @tc.desc   sequence disable(false) -> addResource(true) -> enable(true) ends enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0066 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'disable', false);
      const step2: string = OverlayController.nextStateOf(step1, 'addResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('initial'));
      expect(step1).assertEqual('initial');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeLoaded'));
      expect(step2).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enabled'));
      expect(result).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0066 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0067
     * @tc.number SUB_RESMGR_OVERLAY_05_0067
     * @tc.desc   sequence addResource(false) -> removeResource(true) -> enable(true) ends enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0067 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'addResource', false);
      const step2: string = OverlayController.nextStateOf(step1, 'removeResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('initial'));
      expect(step1).assertEqual('initial');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeRemoved'));
      expect(step2).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enabled'));
      expect(result).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0067 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0068
     * @tc.number SUB_RESMGR_OVERLAY_05_0068
     * @tc.desc   sequence removeResource(false) -> enable(true) -> enable(true) ends enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0068 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'removeResource', false);
      const step2: string = OverlayController.nextStateOf(step1, 'enable', true);
      const result: string = OverlayController.nextStateOf(step2, 'enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('initial'));
      expect(step1).assertEqual('initial');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('enabled'));
      expect(step2).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enabled'));
      expect(result).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0068 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0069
     * @tc.number SUB_RESMGR_OVERLAY_05_0069
     * @tc.desc   sequence enable(true) -> disable(false) -> disable(true) ends disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0069 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'enable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'disable', false);
      const result: string = OverlayController.nextStateOf(step2, 'disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('enabled'));
      expect(step1).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('enabled'));
      expect(step2).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0069 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0070
     * @tc.number SUB_RESMGR_OVERLAY_05_0070
     * @tc.desc   sequence disable(true) -> addResource(false) -> disable(true) ends disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0070 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'disable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'addResource', false);
      const result: string = OverlayController.nextStateOf(step2, 'disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('disabled'));
      expect(step1).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('disabled'));
      expect(step2).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0070 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0071
     * @tc.number SUB_RESMGR_OVERLAY_05_0071
     * @tc.desc   sequence addResource(true) -> removeResource(false) -> disable(true) ends disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0071 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'addResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'removeResource', false);
      const result: string = OverlayController.nextStateOf(step2, 'disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeLoaded'));
      expect(step1).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeLoaded'));
      expect(step2).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0071 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0072
     * @tc.number SUB_RESMGR_OVERLAY_05_0072
     * @tc.desc   sequence removeResource(true) -> enable(false) -> disable(true) ends disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0072 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'removeResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'enable', false);
      const result: string = OverlayController.nextStateOf(step2, 'disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeRemoved'));
      expect(step1).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeRemoved'));
      expect(step2).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0072 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0073
     * @tc.number SUB_RESMGR_OVERLAY_05_0073
     * @tc.desc   sequence enable(true) -> disable(true) -> addResource(false) ends disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0073 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'enable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'disable', true);
      const result: string = OverlayController.nextStateOf(step2, 'addResource', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('enabled'));
      expect(step1).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('disabled'));
      expect(step2).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0073 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0074
     * @tc.number SUB_RESMGR_OVERLAY_05_0074
     * @tc.desc   sequence disable(true) -> addResource(true) -> addResource(false) ends runtimeLoaded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0074 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'disable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'addResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'addResource', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('disabled'));
      expect(step1).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeLoaded'));
      expect(step2).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('runtimeLoaded'));
      expect(result).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0074 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0075
     * @tc.number SUB_RESMGR_OVERLAY_05_0075
     * @tc.desc   sequence addResource(true) -> removeResource(true) -> addResource(false) ends runtimeRemoved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0075 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'addResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'removeResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'addResource', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeLoaded'));
      expect(step1).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeRemoved'));
      expect(step2).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('runtimeRemoved'));
      expect(result).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0075 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0076
     * @tc.number SUB_RESMGR_OVERLAY_05_0076
     * @tc.desc   sequence removeResource(true) -> enable(true) -> addResource(false) ends enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0076 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'removeResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'enable', true);
      const result: string = OverlayController.nextStateOf(step2, 'addResource', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeRemoved'));
      expect(step1).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('enabled'));
      expect(step2).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enabled'));
      expect(result).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0076 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0077
     * @tc.number SUB_RESMGR_OVERLAY_05_0077
     * @tc.desc   sequence enable(true) -> toggle(true) -> disable(true) ends disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0077 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'enable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'toggle', true);
      const result: string = OverlayController.nextStateOf(step2, 'disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('enabled'));
      expect(step1).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('enabled'));
      expect(step2).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0077 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0078
     * @tc.number SUB_RESMGR_OVERLAY_05_0078
     * @tc.desc   sequence enable(true) -> (true) -> disable(true) ends disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0078 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'enable', true);
      const step2: string = OverlayController.nextStateOf(step1, '', true);
      const result: string = OverlayController.nextStateOf(step2, 'disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('enabled'));
      expect(step1).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('enabled'));
      expect(step2).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0078 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0079
     * @tc.number SUB_RESMGR_OVERLAY_05_0079
     * @tc.desc   sequence enable(true) -> ENABLE(true) -> disable(true) ends disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0079 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'enable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'ENABLE', true);
      const result: string = OverlayController.nextStateOf(step2, 'disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('enabled'));
      expect(step1).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('enabled'));
      expect(step2).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0079 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0080
     * @tc.number SUB_RESMGR_OVERLAY_05_0080
     * @tc.desc   sequence enable(true) -> disable(true) -> toggle(true) ends disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0080 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'enable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'disable', true);
      const result: string = OverlayController.nextStateOf(step2, 'toggle', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('enabled'));
      expect(step1).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('disabled'));
      expect(step2).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0080 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0081
     * @tc.number SUB_RESMGR_OVERLAY_05_0081
     * @tc.desc   sequence enable(true) -> disable(true) -> (true) ends disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0081 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'enable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'disable', true);
      const result: string = OverlayController.nextStateOf(step2, '', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('enabled'));
      expect(step1).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('disabled'));
      expect(step2).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0081 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0082
     * @tc.number SUB_RESMGR_OVERLAY_05_0082
     * @tc.desc   sequence enable(true) -> disable(true) -> ENABLE(true) ends disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0082 begin');
      const step1: string = OverlayController.nextStateOf('initial', 'enable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'disable', true);
      const result: string = OverlayController.nextStateOf(step2, 'ENABLE', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('enabled'));
      expect(step1).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('disabled'));
      expect(step2).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0082 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0083
     * @tc.number SUB_RESMGR_OVERLAY_05_0083
     * @tc.desc   sequence enable(true) -> enable(true) -> enable(true) ends enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0083 begin');
      const step1: string = OverlayController.nextStateOf('unknown', 'enable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'enable', true);
      const result: string = OverlayController.nextStateOf(step2, 'enable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('enabled'));
      expect(step1).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('enabled'));
      expect(step2).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('enabled'));
      expect(result).assertEqual('enabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0083 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0084
     * @tc.number SUB_RESMGR_OVERLAY_05_0084
     * @tc.desc   sequence disable(true) -> disable(true) -> disable(true) ends disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0084 begin');
      const step1: string = OverlayController.nextStateOf('', 'disable', true);
      const step2: string = OverlayController.nextStateOf(step1, 'disable', true);
      const result: string = OverlayController.nextStateOf(step2, 'disable', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('disabled'));
      expect(step1).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('disabled'));
      expect(step2).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('disabled'));
      expect(result).assertEqual('disabled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0084 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0085
     * @tc.number SUB_RESMGR_OVERLAY_05_0085
     * @tc.desc   sequence addResource(true) -> removeResource(true) -> addResource(true) ends runtimeLoaded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0085 begin');
      const step1: string = OverlayController.nextStateOf('runtimeLoaded', 'addResource', true);
      const step2: string = OverlayController.nextStateOf(step1, 'removeResource', true);
      const result: string = OverlayController.nextStateOf(step2, 'addResource', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1), String('runtimeLoaded'));
      expect(step1).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2), String('runtimeRemoved'));
      expect(step2).assertEqual('runtimeRemoved');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('runtimeLoaded'));
      expect(result).assertEqual('runtimeLoaded');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0085 end');
    })

    /**
     * @tc.name   testOverlayCtrlStateSeq0086
     * @tc.number SUB_RESMGR_OVERLAY_05_0086
     * @tc.desc   三步失败序列把进入时的状态原样保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlStateSeq0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0086 begin');
      const step1: string = OverlayController.nextStateOf(OverlayState.RUNTIME_LOADED, 'disable', false);
      const step2: string = OverlayController.nextStateOf(step1, 'addResource', false);
      const step3: string = OverlayController.nextStateOf(step2, 'removeResource', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step1),
        String(OverlayState.RUNTIME_LOADED));
      expect(step1).assertEqual(OverlayState.RUNTIME_LOADED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step2),
        String(OverlayState.RUNTIME_LOADED));
      expect(step2).assertEqual(OverlayState.RUNTIME_LOADED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(step3),
        String(OverlayState.RUNTIME_LOADED));
      expect(step3).assertEqual(OverlayState.RUNTIME_LOADED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(OverlayController.isKnownState(step3)));
      expect(OverlayController.isKnownState(step3)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlStateSeq0086 end');
    })

  })
}
