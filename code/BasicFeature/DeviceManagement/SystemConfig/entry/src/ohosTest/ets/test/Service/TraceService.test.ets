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
 * TraceService 接口测试套件。
 */
export default function TraceServiceTest(): void {
  describe('TraceServiceTest', () => {

    /**
     * @tc.number SUB_TRACE_SERVICE_0100
     * @tc.name testTraceService0001
     * @tc.desc 正向: 初始化后追踪启用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTraceService0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testTraceService0001: begin');
      const service: TraceService = new TraceService();
      service.initialize();
      expect(service.isTraceEnabled()).assertTrue();
      expect(service.getActiveTraceCount()).assertEqual(0);
      service.destroy();
      expect(service.isTraceEnabled()).assertFalse();
    });

    /**
     * @tc.number SUB_TRACE_SERVICE_0200
     * @tc.name testTraceService0002
     * @tc.desc 正向: TraceName 常量取值固定且互不重复
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTraceService0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testTraceService0002: begin');
      expect(TraceName.CUSTOM_CONFIG_GET_CHANNEL).assertEqual('CustomConfig_getChannelId');
      expect(TraceName.SCENE_QUERY_DND).assertEqual('IntelligentScene_queryDnd');
      expect(TraceName.SCENE_QUERY_NOTIFY).assertEqual('IntelligentScene_queryNotify');
      expect(TraceName.SETTINGS_OPEN_PIN).assertEqual('SettingsLite_openPin');
      expect(TraceName.SERVICE_INIT).assertEqual('Service_initialize');
      expect(TraceName.PAGE_LOAD).assertEqual('Page_load');
      const allNames: string[] = [
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
      const uniqueNames: Set<string> = new Set<string>(allNames);
      expect(uniqueNames.size).assertEqual(10);
      expect(uniqueNames.has(TraceName.SCENE_QUERY_ALL)).assertTrue();
      hilog.info(DOMAIN, TAG, 'testTraceService0002: end');
    });

    /**
     * @tc.number SUB_TRACE_SERVICE_0300
     * @tc.name testTraceService0003
     * @tc.desc 正向: startTrace + finishTrace 计数正确
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTraceService0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testTraceService0003: begin');
      const service: TraceService = new TraceService();
      service.initialize();
      expect(service.getActiveTraceCount()).assertEqual(0);
      service.startTrace(TraceName.SERVICE_INIT);
      expect(service.getActiveTraceCount()).assertEqual(1);
      service.finishTrace(TraceName.SERVICE_INIT);
      expect(service.getActiveTraceCount()).assertEqual(0);
      service.destroy();
    });

    /**
     * @tc.number SUB_TRACE_SERVICE_0400
     * @tc.name testTraceService0004
     * @tc.desc 正向: 禁用后 startTrace 不增加计数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testTraceService0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testTraceService0004: begin');
      const service: TraceService = new TraceService();
      service.initialize();
      service.setEnabled(false);
      expect(service.isTraceEnabled()).assertFalse();
      service.startTrace(TraceName.PAGE_LOAD);
      expect(service.getActiveTraceCount()).assertEqual(0);
      service.setEnabled(true);
      expect(service.isTraceEnabled()).assertTrue();
      service.destroy();
    });

    /**
     * @tc.number SUB_TRACE_SERVICE_0500
     * @tc.name testTraceService0005
     * @tc.desc 正向: reset 后计数归零
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testTraceService0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testTraceService0005: begin');
      const service: TraceService = new TraceService();
      service.initialize();
      service.startTrace(TraceName.SERVICE_INIT);
      service.startTrace(TraceName.PAGE_LOAD);
      expect(service.getActiveTraceCount()).assertEqual(2);
      service.reset();
      expect(service.getActiveTraceCount()).assertEqual(0);
      service.startTrace(TraceName.SERVICE_INIT);
      expect(service.getActiveTraceCount()).assertEqual(1);
      service.destroy();
    });
  });
}
