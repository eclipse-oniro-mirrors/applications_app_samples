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
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { TraceService, TraceName } from 'library';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SystemConfig]';

/**
 * TraceService extended test suite.
 * Adds coverage for traceAsync / traceSync / disabled behavior / full lifecycle /
 * processStage / finishTrace count parameter scenarios.
 */
export default function TraceServiceExtendedTest(): void {
  describe('TraceServiceExtendedTest', () => {

    // ========================================
    // traceSync tests
    // ========================================

    /**
     * @tc.number SUB_TRACE_SERVICE_EXTENDED_0100
     * @tc.name testTraceServiceExtended0001
     * @tc.desc Verify traceSync wraps a sync operation, returns the result and counts correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTraceServiceExtended0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testTraceServiceExtended0001: begin');
      const service: TraceService = new TraceService();
      service.initialize();
      expect(service.getActiveTraceCount()).assertEqual(0);
      const result: number = service.traceSync('testSync', (): number => {
        expect(service.getActiveTraceCount()).assertEqual(1);
        return 42;
      });
      expect(result).assertEqual(42);
      expect(service.getActiveTraceCount()).assertEqual(0);
      service.destroy();
    });

    /**
     * @tc.number SUB_TRACE_SERVICE_EXTENDED_0200
     * @tc.name testTraceServiceExtended0002
     * @tc.desc Verify the count still returns to zero and the exception propagates when the operation inside traceSync throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testTraceServiceExtended0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testTraceServiceExtended0002: begin');
      const service: TraceService = new TraceService();
      service.initialize();
      let caughtError: boolean = false;
      try {
        service.traceSync('testSyncError', (): string => {
          throw new Error('sync operation failed');
        });
      } catch (err) {
        caughtError = true;
        const error: Error = err as Error;
        expect(error.message).assertEqual('sync operation failed');
      }
      expect(caughtError).assertTrue();
      expect(service.getActiveTraceCount()).assertEqual(0);
      service.destroy();
    });

    // ========================================
    // traceAsync tests
    // ========================================

    /**
     * @tc.number SUB_TRACE_SERVICE_EXTENDED_0300
     * @tc.name testTraceServiceExtended0003
     * @tc.desc Verify traceAsync wraps an async operation, returns the result and counts correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTraceServiceExtended0003', 0, async () => {
      hilog.info(DOMAIN, TAG, 'testTraceServiceExtended0003: begin');
      const service: TraceService = new TraceService();
      service.initialize();
      expect(service.getActiveTraceCount()).assertEqual(0);
      const result: string = await service.traceAsync('testAsync', async (): Promise<string> => {
        return 'async-result';
      });
      expect(result).assertEqual('async-result');
      expect(service.getActiveTraceCount()).assertEqual(0);
      service.destroy();
    });

    /**
     * @tc.number SUB_TRACE_SERVICE_EXTENDED_0400
     * @tc.name testTraceServiceExtended0004
     * @tc.desc Verify the count returns to zero and the exception propagates when the operation inside traceAsync throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testTraceServiceExtended0004', 0, async () => {
      hilog.info(DOMAIN, TAG, 'testTraceServiceExtended0004: begin');
      const service: TraceService = new TraceService();
      service.initialize();
      let caughtError: boolean = false;
      try {
        await service.traceAsync('testAsyncError', async (): Promise<string> => {
          throw new Error('async operation failed');
        });
      } catch (err) {
        caughtError = true;
        const error: Error = err as Error;
        expect(error.message).assertEqual('async operation failed');
      }
      expect(caughtError).assertTrue();
      expect(service.getActiveTraceCount()).assertEqual(0);
      service.destroy();
    });

    // ========================================
    // Disabled behavior tests
    // ========================================

    /**
     * @tc.number SUB_TRACE_SERVICE_EXTENDED_0500
     * @tc.name testTraceServiceExtended0005
     * @tc.desc Verify finishTrace does not reduce the count below zero when disabled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testTraceServiceExtended0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testTraceServiceExtended0005: begin');
      const service: TraceService = new TraceService();
      service.initialize();
      service.setEnabled(false);
      expect(service.isTraceEnabled()).assertFalse();
      service.finishTrace(TraceName.SERVICE_INIT);
      expect(service.getActiveTraceCount()).assertEqual(0);
      service.finishTrace(TraceName.PAGE_LOAD);
      expect(service.getActiveTraceCount()).assertEqual(0);
      service.destroy();
    });

    /**
     * @tc.number SUB_TRACE_SERVICE_EXTENDED_0600
     * @tc.name testTraceServiceExtended0006
     * @tc.desc Verify the trace service is disabled after initialize(false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testTraceServiceExtended0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testTraceServiceExtended0006: begin');
      const service: TraceService = new TraceService();
      service.initialize(false);
      expect(service.isTraceEnabled()).assertFalse();
      expect(service.getActiveTraceCount()).assertEqual(0);
      service.startTrace(TraceName.SERVICE_INIT);
      expect(service.getActiveTraceCount()).assertEqual(0);
      service.setEnabled(true);
      expect(service.isTraceEnabled()).assertTrue();
      service.startTrace(TraceName.SERVICE_INIT);
      expect(service.getActiveTraceCount()).assertEqual(1);
      service.destroy();
    });

    // ========================================
    // startTrace with processStage tests
    // ========================================

    /**
     * @tc.number SUB_TRACE_SERVICE_EXTENDED_0700
     * @tc.name testTraceServiceExtended0007
     * @tc.desc Verify startTrace with a processStage parameter increases the count normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testTraceServiceExtended0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testTraceServiceExtended0007: begin');
      const service: TraceService = new TraceService();
      service.initialize();
      service.startTrace(TraceName.CUSTOM_CONFIG_GET_CHANNEL, 'begin');
      expect(service.getActiveTraceCount()).assertEqual(1);
      service.startTrace(TraceName.SCENE_QUERY_DND, 'processing');
      expect(service.getActiveTraceCount()).assertEqual(2);
      service.finishTrace(TraceName.CUSTOM_CONFIG_GET_CHANNEL);
      expect(service.getActiveTraceCount()).assertEqual(1);
      service.finishTrace(TraceName.SCENE_QUERY_DND);
      expect(service.getActiveTraceCount()).assertEqual(0);
      service.destroy();
    });

    // ========================================
    // finishTrace count parameter tests
    // ========================================

    /**
     * @tc.number SUB_TRACE_SERVICE_EXTENDED_0800
     * @tc.name testTraceServiceExtended0008
     * @tc.desc Verify finishTrace pairs and ends by exact taskId, and an unknown taskId does not affect the count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testTraceServiceExtended0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testTraceServiceExtended0008: begin');
      const service: TraceService = new TraceService();
      service.initialize();
      const idInit: number = service.startTrace(TraceName.SERVICE_INIT);
      const idPage: number = service.startTrace(TraceName.PAGE_LOAD);
      hilog.info(DOMAIN, TAG, 'testTraceServiceExtended0008: idInit=%{public}d, idPage=%{public}d', idInit, idPage);
      expect(service.getActiveTraceCount()).assertEqual(2);
      // An unknown taskId matches no active trace, so the count stays unchanged
      service.finishTrace(TraceName.SERVICE_INIT, 9999);
      expect(service.getActiveTraceCount()).assertEqual(2);
      // The correct taskId precisely ends the corresponding trace
      service.finishTrace(TraceName.SERVICE_INIT, idInit);
      expect(service.getActiveTraceCount()).assertEqual(1);
      service.finishTrace(TraceName.PAGE_LOAD, idPage);
      expect(service.getActiveTraceCount()).assertEqual(0);
      service.destroy();
    });

    // ========================================
    // Full lifecycle tests
    // ========================================

    /**
     * @tc.number SUB_TRACE_SERVICE_EXTENDED_0900
     * @tc.name testTraceServiceExtended0009
     * @tc.desc Verify the full init → start → finish → reset → destroy flow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTraceServiceExtended0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testTraceServiceExtended0009: begin');
      const service: TraceService = new TraceService();
      service.initialize();
      expect(service.isTraceEnabled()).assertTrue();
      expect(service.getActiveTraceCount()).assertEqual(0);
      service.startTrace(TraceName.SERVICE_INIT);
      expect(service.getActiveTraceCount()).assertEqual(1);
      service.startTrace(TraceName.PAGE_LOAD);
      expect(service.getActiveTraceCount()).assertEqual(2);
      service.finishTrace(TraceName.SERVICE_INIT);
      expect(service.getActiveTraceCount()).assertEqual(1);
      service.reset();
      expect(service.getActiveTraceCount()).assertEqual(0);
      expect(service.isTraceEnabled()).assertTrue();
      service.destroy();
      expect(service.isTraceEnabled()).assertFalse();
      expect(service.getActiveTraceCount()).assertEqual(0);
    });

    // ========================================
    // TraceName constant completeness tests
    // ========================================

    /**
     * @tc.number SUB_TRACE_SERVICE_EXTENDED_1000
     * @tc.name testTraceServiceExtended0010
     * @tc.desc Verify TraceName is grouped by business module prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testTraceServiceExtended0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testTraceServiceExtended0010: begin');
      const names: string[] = [
        TraceName.CUSTOM_CONFIG_GET_CHANNEL,
        TraceName.SCENE_QUERY_DND,
        TraceName.SCENE_QUERY_NOTIFY,
        TraceName.SCENE_QUERY_ALL,
        TraceName.SETTINGS_OPEN_PIN,
        TraceName.SETTINGS_OPEN_NFC,
        TraceName.SETTINGS_OPEN_DOUBLE_CLICK,
        TraceName.SETTINGS_QUERY_DOUBLE_CLICK,
        TraceName.SERVICE_INIT,
        TraceName.PAGE_LOAD
      ];
      let settingsPrefixed: number = 0;
      let scenePrefixed: number = 0;
      for (const name of names) {
        expect(name.indexOf('_')).assertLarger(0);
        if (name.indexOf('SettingsLite_') === 0) {
          settingsPrefixed += 1;
        }
        if (name.indexOf('IntelligentScene_') === 0) {
          scenePrefixed += 1;
        }
      }
      expect(settingsPrefixed).assertEqual(4);
      expect(scenePrefixed).assertEqual(3);
    });
  });
}
