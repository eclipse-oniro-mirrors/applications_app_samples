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
import { EventService } from 'library';
import type { EventHistoryRecord } from 'library';

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

/**
 * EventService 历史清除功能测试套件。
 */
export default function HistoryClearTest(): void {
  describe('HistoryClearTest', () => {

    /**
     * @tc.number SUB_HISTORY_CLEAR_TEST_0100
     * @tc.name testHistoryClearTest0001
     * @tc.desc 正向: 空历史记录清除不报错
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testHistoryClearTest0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHistoryClearTest0001: begin');
      const service: EventService = new EventService();
      const initResult: boolean = service.initialize();
      expect(initResult).assertTrue();
      expect(service.isServiceInitialized()).assertTrue();
      service.clearHistory();
      expect(service.getEventHistory().length).assertEqual(0);
      service.destroy();
    });

    /**
     * @tc.number SUB_HISTORY_CLEAR_TEST_0200
     * @tc.name testHistoryClearTest0002
     * @tc.desc 正向: 上报后清除，记录归零
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testHistoryClearTest0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHistoryClearTest0002: begin');
      const service: EventService = new EventService();
      service.initialize();
      service.reportChannelFetched('ch-1', true);
      service.reportDndStateChanged(true, false);
      const beforeClear: EventHistoryRecord[] = service.getEventHistory();
      expect(beforeClear.length).assertEqual(2);
      const statsBefore = service.getStatistics();
      expect(statsBefore.totalCount).assertEqual(2);
      service.clearHistory();
      expect(service.getEventHistory().length).assertEqual(0);
      service.destroy();
    });

    /**
     * @tc.number SUB_HISTORY_CLEAR_TEST_0300
     * @tc.name testHistoryClearTest0003
     * @tc.desc 正向: 清除后继续上报正常记录
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testHistoryClearTest0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHistoryClearTest0003: begin');
      const service: EventService = new EventService();
      service.initialize();
      service.reportChannelFetched('ch-1', true);
      service.clearHistory();
      service.reportError('test', 'error', 100);
      const history: EventHistoryRecord[] = service.getEventHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].name).assertEqual('errorOccurred');
      expect(history[0].data['errorCode']).assertEqual(100);
      service.destroy();
    });

    /**
     * @tc.number SUB_HISTORY_CLEAR_TEST_0400
     * @tc.name testHistoryClearTest0004
     * @tc.desc 正向: 销毁后历史清空
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testHistoryClearTest0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHistoryClearTest0004: begin');
      const service: EventService = new EventService();
      service.initialize();
      expect(service.isServiceInitialized()).assertTrue();
      service.reportChannelFetched('ch-1', true);
      service.destroy();
      expect(service.getEventHistory().length).assertEqual(0);
      expect(service.isServiceInitialized()).assertFalse();
    });

    /**
     * @tc.number SUB_HISTORY_CLEAR_TEST_0500
     * @tc.name testHistoryClearTest0005
     * @tc.desc 正向: 清除后统计信息归零
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testHistoryClearTest0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHistoryClearTest0005: begin');
      const service: EventService = new EventService();
      service.initialize();
      service.reportChannelFetched('ch-1', true);
      service.reportChannelFetched('ch-2', false);
      const statsBefore = service.getStatistics();
      expect(statsBefore.totalCount).assertEqual(2);
      service.clearHistory();
      const stats = service.getStatistics();
      expect(stats.totalCount).assertEqual(0);
      expect(stats.countByType.size).assertEqual(0);
      service.destroy();
    });
  });
}
