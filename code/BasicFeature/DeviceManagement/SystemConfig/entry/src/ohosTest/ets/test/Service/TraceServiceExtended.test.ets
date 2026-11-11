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

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

/**
 * TraceService 扩展测试套件。
 * 补充覆盖 traceAsync / traceSync / 禁用时行为 / 完整生命周期 /
 * processStage / finishTrace count 参数 等场景。
 */
export default function TraceServiceExtendedTest(): void {
  describe('TraceServiceExtendedTest', () => {

    // ========================================
    // traceSync 测试
    // ========================================

    /**
     * @tc.number SUB_TRACE_SERVICE_EXTENDED_0100
     * @tc.name testTraceServiceExtended0001
     * @tc.desc 正向: traceSync 包裹同步操作返回结果且计数正确
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
     * @tc.desc 边界: traceSync 内操作抛异常后计数仍归零且异常传播
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
    // traceAsync 测试
    // ========================================

    /**
     * @tc.number SUB_TRACE_SERVICE_EXTENDED_0300
     * @tc.name testTraceServiceExtended0003
     * @tc.desc 正向: traceAsync 包裹异步操作返回结果且计数正确
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
     * @tc.desc 边界: traceAsync 内操作抛异常后计数归零且异常传播
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
    // 禁用时行为测试
    // ========================================

    /**
     * @tc.number SUB_TRACE_SERVICE_EXTENDED_0500
     * @tc.name testTraceServiceExtended0005
     * @tc.desc 边界: 禁用时 finishTrace 不将计数减到负数
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
     * @tc.desc 正向: initialize(false) 后追踪服务处于禁用状态
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
    // startTrace 带 processStage 测试
    // ========================================

    /**
     * @tc.number SUB_TRACE_SERVICE_EXTENDED_0700
     * @tc.name testTraceServiceExtended0007
     * @tc.desc 正向: startTrace 带 processStage 参数正常增加计数
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
    // finishTrace count 参数测试
    // ========================================

    /**
     * @tc.number SUB_TRACE_SERVICE_EXTENDED_0800
     * @tc.name testTraceServiceExtended0008
     * @tc.desc 正向: finishTrace 按 taskId 精确配对结束，未知 taskId 不影响计数
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
      // 未知 taskId 不匹配任何活动追踪，计数保持不变
      service.finishTrace(TraceName.SERVICE_INIT, 9999);
      expect(service.getActiveTraceCount()).assertEqual(2);
      // 正确 taskId 精确结束对应追踪
      service.finishTrace(TraceName.SERVICE_INIT, idInit);
      expect(service.getActiveTraceCount()).assertEqual(1);
      service.finishTrace(TraceName.PAGE_LOAD, idPage);
      expect(service.getActiveTraceCount()).assertEqual(0);
      service.destroy();
    });

    // ========================================
    // 完整生命周期测试
    // ========================================

    /**
     * @tc.number SUB_TRACE_SERVICE_EXTENDED_0900
     * @tc.name testTraceServiceExtended0009
     * @tc.desc 正向: init → start → finish → reset → destroy 完整流程
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
    // TraceName 常量完整性测试
    // ========================================

    /**
     * @tc.number SUB_TRACE_SERVICE_EXTENDED_1000
     * @tc.name testTraceServiceExtended0010
     * @tc.desc 正向: TraceName 按业务模块前缀分组
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
