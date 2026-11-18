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
import { delayTick } from './shared/AsyncYield';
import { DownloadState, DownloadTarget, supportsDocumentPicker, resolveDownloadTarget, beginAttempt, isStaleAttempt, shouldFallbackOnTimeout, nextDownloadState } from '../../../main/ets/model/DownloadFlow';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_AtomicService]';

export default function DownloadFlowExhaustiveMatrixPart1Test(): void {
  describe('DownloadFlowExhaustiveMatrixPart1', () => {

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_0100
     * @tc.name      testDeviceSupport0001
     * @tc.desc      Verify device type 'phone' support is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDeviceSupport0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeviceSupport0001 begin');
      await delayTick();
      expect(supportsDocumentPicker('phone')).assertEqual(true);
      expect(resolveDownloadTarget('phone')).assertEqual(DownloadTarget.PICKER);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeviceSupport0001 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_0200
     * @tc.name      testDeviceSupport0002
     * @tc.desc      Verify device type 'tablet' support is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDeviceSupport0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeviceSupport0002 begin');
      await delayTick();
      expect(supportsDocumentPicker('tablet')).assertEqual(true);
      expect(resolveDownloadTarget('tablet')).assertEqual(DownloadTarget.PICKER);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeviceSupport0002 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_0300
     * @tc.name      testDeviceSupport0003
     * @tc.desc      Verify device type '2in1' support is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDeviceSupport0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeviceSupport0003 begin');
      await delayTick();
      expect(supportsDocumentPicker('2in1')).assertEqual(true);
      expect(resolveDownloadTarget('2in1')).assertEqual(DownloadTarget.PICKER);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeviceSupport0003 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_0400
     * @tc.name      testDeviceSupport0004
     * @tc.desc      Verify device type 'default' support is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDeviceSupport0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeviceSupport0004 begin');
      await delayTick();
      expect(supportsDocumentPicker('default')).assertEqual(false);
      expect(resolveDownloadTarget('default')).assertEqual(DownloadTarget.SANDBOX);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeviceSupport0004 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_0500
     * @tc.name      testDeviceSupport0005
     * @tc.desc      Verify device type 'watch' support is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDeviceSupport0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeviceSupport0005 begin');
      await delayTick();
      expect(supportsDocumentPicker('watch')).assertEqual(false);
      expect(resolveDownloadTarget('watch')).assertEqual(DownloadTarget.SANDBOX);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeviceSupport0005 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_0600
     * @tc.name      testDeviceSupport0006
     * @tc.desc      Verify device type '' support is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDeviceSupport0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeviceSupport0006 begin');
      await delayTick();
      expect(supportsDocumentPicker('')).assertEqual(false);
      expect(resolveDownloadTarget('')).assertEqual(DownloadTarget.SANDBOX);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeviceSupport0006 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_0700
     * @tc.name      testDeviceSupport0007
     * @tc.desc      Verify device type 'PHONE' support is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDeviceSupport0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeviceSupport0007 begin');
      await delayTick();
      expect(supportsDocumentPicker('PHONE')).assertEqual(false);
      expect(resolveDownloadTarget('PHONE')).assertEqual(DownloadTarget.SANDBOX);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeviceSupport0007 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_0800
     * @tc.name      testDeviceSupport0008
     * @tc.desc      Verify device type 'Phone' support is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDeviceSupport0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeviceSupport0008 begin');
      await delayTick();
      expect(supportsDocumentPicker('Phone')).assertEqual(false);
      expect(resolveDownloadTarget('Phone')).assertEqual(DownloadTarget.SANDBOX);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeviceSupport0008 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_0900
     * @tc.name      testDeviceSupport0009
     * @tc.desc      Verify device type 'tablet ' support is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDeviceSupport0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeviceSupport0009 begin');
      await delayTick();
      expect(supportsDocumentPicker('tablet ')).assertEqual(false);
      expect(resolveDownloadTarget('tablet ')).assertEqual(DownloadTarget.SANDBOX);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeviceSupport0009 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_1000
     * @tc.name      testBeginAttempt0010
     * @tc.desc      Verify beginAttempt(-1) returns 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBeginAttempt0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBeginAttempt0010 begin');
      await delayTick();
      expect(beginAttempt(-1)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBeginAttempt0010 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_1100
     * @tc.name      testBeginAttempt0011
     * @tc.desc      Verify beginAttempt(0) returns 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBeginAttempt0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBeginAttempt0011 begin');
      await delayTick();
      expect(beginAttempt(0)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBeginAttempt0011 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_1200
     * @tc.name      testBeginAttempt0012
     * @tc.desc      Verify beginAttempt(1) returns 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBeginAttempt0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBeginAttempt0012 begin');
      await delayTick();
      expect(beginAttempt(1)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBeginAttempt0012 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_1300
     * @tc.name      testBeginAttempt0013
     * @tc.desc      Verify beginAttempt(99) returns 100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBeginAttempt0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBeginAttempt0013 begin');
      await delayTick();
      expect(beginAttempt(99)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBeginAttempt0013 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_1400
     * @tc.name      testBeginAttempt0014
     * @tc.desc      Verify beginAttempt(1000) returns 1001.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBeginAttempt0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBeginAttempt0014 begin');
      await delayTick();
      expect(beginAttempt(1000)).assertEqual(1001);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBeginAttempt0014 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_1500
     * @tc.name      testStale0015
     * @tc.desc      Verify isStaleAttempt(-1, -1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStale0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStale0015 begin');
      await delayTick();
      expect(isStaleAttempt(-1, -1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStale0015 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_1600
     * @tc.name      testStale0016
     * @tc.desc      Verify isStaleAttempt(-1, 0) is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStale0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStale0016 begin');
      await delayTick();
      expect(isStaleAttempt(-1, 0)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStale0016 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_1700
     * @tc.name      testStale0017
     * @tc.desc      Verify isStaleAttempt(-1, 1) is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStale0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStale0017 begin');
      await delayTick();
      expect(isStaleAttempt(-1, 1)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStale0017 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_1800
     * @tc.name      testStale0018
     * @tc.desc      Verify isStaleAttempt(-1, 2) is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStale0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStale0018 begin');
      await delayTick();
      expect(isStaleAttempt(-1, 2)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStale0018 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_1900
     * @tc.name      testStale0019
     * @tc.desc      Verify isStaleAttempt(0, -1) is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStale0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStale0019 begin');
      await delayTick();
      expect(isStaleAttempt(0, -1)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStale0019 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_2000
     * @tc.name      testStale0020
     * @tc.desc      Verify isStaleAttempt(0, 0) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStale0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStale0020 begin');
      await delayTick();
      expect(isStaleAttempt(0, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStale0020 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_2100
     * @tc.name      testStale0021
     * @tc.desc      Verify isStaleAttempt(0, 1) is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStale0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStale0021 begin');
      await delayTick();
      expect(isStaleAttempt(0, 1)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStale0021 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_2200
     * @tc.name      testStale0022
     * @tc.desc      Verify isStaleAttempt(0, 2) is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStale0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStale0022 begin');
      await delayTick();
      expect(isStaleAttempt(0, 2)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStale0022 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_2300
     * @tc.name      testStale0023
     * @tc.desc      Verify isStaleAttempt(1, -1) is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStale0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStale0023 begin');
      await delayTick();
      expect(isStaleAttempt(1, -1)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStale0023 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_2400
     * @tc.name      testStale0024
     * @tc.desc      Verify isStaleAttempt(1, 0) is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStale0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStale0024 begin');
      await delayTick();
      expect(isStaleAttempt(1, 0)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStale0024 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_2500
     * @tc.name      testStale0025
     * @tc.desc      Verify isStaleAttempt(1, 1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStale0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStale0025 begin');
      await delayTick();
      expect(isStaleAttempt(1, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStale0025 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_2600
     * @tc.name      testStale0026
     * @tc.desc      Verify isStaleAttempt(1, 2) is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStale0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStale0026 begin');
      await delayTick();
      expect(isStaleAttempt(1, 2)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStale0026 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_2700
     * @tc.name      testStale0027
     * @tc.desc      Verify isStaleAttempt(2, -1) is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStale0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStale0027 begin');
      await delayTick();
      expect(isStaleAttempt(2, -1)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStale0027 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_2800
     * @tc.name      testStale0028
     * @tc.desc      Verify isStaleAttempt(2, 0) is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStale0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStale0028 begin');
      await delayTick();
      expect(isStaleAttempt(2, 0)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStale0028 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_2900
     * @tc.name      testStale0029
     * @tc.desc      Verify isStaleAttempt(2, 1) is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStale0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStale0029 begin');
      await delayTick();
      expect(isStaleAttempt(2, 1)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStale0029 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_3000
     * @tc.name      testStale0030
     * @tc.desc      Verify isStaleAttempt(2, 2) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStale0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStale0030 begin');
      await delayTick();
      expect(isStaleAttempt(2, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStale0030 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_3100
     * @tc.name      testFallback0031
     * @tc.desc      Verify shouldFallbackOnTimeout(true, -1, -1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFallback0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0031 begin');
      await delayTick();
      expect(shouldFallbackOnTimeout(true, -1, -1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0031 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_3200
     * @tc.name      testFallback0032
     * @tc.desc      Verify shouldFallbackOnTimeout(true, -1, 0) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFallback0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0032 begin');
      await delayTick();
      expect(shouldFallbackOnTimeout(true, -1, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0032 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_3300
     * @tc.name      testFallback0033
     * @tc.desc      Verify shouldFallbackOnTimeout(true, -1, 1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFallback0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0033 begin');
      await delayTick();
      expect(shouldFallbackOnTimeout(true, -1, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0033 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_3400
     * @tc.name      testFallback0034
     * @tc.desc      Verify shouldFallbackOnTimeout(true, 0, -1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFallback0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0034 begin');
      await delayTick();
      expect(shouldFallbackOnTimeout(true, 0, -1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0034 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_3500
     * @tc.name      testFallback0035
     * @tc.desc      Verify shouldFallbackOnTimeout(true, 0, 0) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFallback0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0035 begin');
      await delayTick();
      expect(shouldFallbackOnTimeout(true, 0, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0035 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_3600
     * @tc.name      testFallback0036
     * @tc.desc      Verify shouldFallbackOnTimeout(true, 0, 1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFallback0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0036 begin');
      await delayTick();
      expect(shouldFallbackOnTimeout(true, 0, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0036 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_3700
     * @tc.name      testFallback0037
     * @tc.desc      Verify shouldFallbackOnTimeout(true, 1, -1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFallback0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0037 begin');
      await delayTick();
      expect(shouldFallbackOnTimeout(true, 1, -1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0037 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_3800
     * @tc.name      testFallback0038
     * @tc.desc      Verify shouldFallbackOnTimeout(true, 1, 0) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFallback0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0038 begin');
      await delayTick();
      expect(shouldFallbackOnTimeout(true, 1, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0038 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_3900
     * @tc.name      testFallback0039
     * @tc.desc      Verify shouldFallbackOnTimeout(true, 1, 1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFallback0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0039 begin');
      await delayTick();
      expect(shouldFallbackOnTimeout(true, 1, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0039 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP1_4000
     * @tc.name      testFallback0040
     * @tc.desc      Verify shouldFallbackOnTimeout(false, -1, -1) is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFallback0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0040 begin');
      await delayTick();
      expect(shouldFallbackOnTimeout(false, -1, -1)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0040 end');
    })

  })
}
